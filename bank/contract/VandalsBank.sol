// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract VandalsBank is Ownable {

    string public name = "Vandals Bank";
    address public stake; // token to stake 
    address public reward; // token to claim as reward (must be different than token to stake)
    uint256 public defaultAPR; // e.g. 700 is 7%
    uint256 public price; // e.g. 10000000000000 is 0.00001 BCH
    uint256 public maxStake; // max amount to stake

    address[] public stakers;
    mapping(address => uint256) public stakingBalance;
    mapping(address => bool) public hasStaked;
    mapping(address => bool) public isStaking;

    mapping(address => uint256) public lockTime;

    constructor(address stake_token, address reward_token, uint256 default_APR, uint256 price_, uint256 maxStake_) {
        stake = stake_token;
        reward = reward_token;
        defaultAPR = default_APR;
        price = price_;
        maxStake = maxStake_;
    }

    function setNewStake(address stake_token) external onlyOwner() {
        stake = stake_token;
    }

    function setNewReward(address reward_token) external onlyOwner() {
        reward = reward_token;
    }

    function setNewAPR(uint256 default_APR) external onlyOwner() {
        defaultAPR = default_APR;
    }

    function newPrice(uint256 price_) external onlyOwner() {
        price = price_;
    }

    function newMaxStake(uint256 maxStake_) external onlyOwner() {
        maxStake = maxStake_;
    }

    // stake tokens in contract
    
    function stakeTokens(uint256 _amount) external {
        require(_amount > 0, "staking amount can not be 0");
        require(_amount <= maxStake, "staking amount can not be greater than maxStake");

        // Transfer tokens to contract for staking
        IERC20(stake).transferFrom(msg.sender, address(this), _amount);

        // Update the staking balance in map
        stakingBalance[msg.sender] = stakingBalance[msg.sender] + _amount;

        // Add user to stakers array if they haven't staked already
        if(!hasStaked[msg.sender]) {
            stakers.push(msg.sender);
        }

        // Update staking status to track
        isStaking[msg.sender] = true;
        hasStaked[msg.sender] = true;
    }

    // unstake and withdraw tokens from contract
    
    function unstakeTokens() external {

    	// get the users staking balance in stake tokens
    	uint256 balance = stakingBalance[msg.sender];
    
        // reqire the amount staked needs to be greater then 0
        require(balance > 0, "staking balance can not be 0");
    
        // transfer stake tokens out of this contract to the msg.sender
        IERC20(stake).transfer(msg.sender, balance);
    
        // reset staking balance map to 0
        stakingBalance[msg.sender] = 0;
    
        // update the staking status
        isStaking[msg.sender] = false;
    } 

    // claim reward tokens after 7 days
    
    function claimTokens(address recipient) external payable {
        require(block.timestamp > lockTime[msg.sender]);
        require(msg.value >= price, "Not enough BCH sent, check price");
        uint256 balance = stakingBalance[recipient] * defaultAPR;
        balance = balance / 100;
        if(balance > 0) {
        require(IERC20(reward).balanceOf(address(this)) >= balance);
        IERC20(reward).transfer(recipient, balance);  
        }
        lockTime[msg.sender] = block.timestamp + 7 days; 
    }

    // withdraw reward tokens from contract

    function withdrawTokens() external onlyOwner {
        uint256 balance = IERC20(reward).balanceOf(address(this));
        IERC20(reward).transfer(msg.sender, balance);
    }

    // withdraw BCH from contract

    function transfer(address payable _to) external onlyOwner {
        uint256 amount = address(this).balance;
        (bool success, ) = _to.call{value: amount}("");
        require(success, "Failed to send BCH");
    }
}