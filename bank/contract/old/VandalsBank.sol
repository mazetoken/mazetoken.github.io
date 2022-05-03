// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

// VandalsBank allows users to stake tokens and earn other tokens as interest
// Users can harvest reward (interest) every 7 days
// Users can stake more and unstake anytime

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract VandalsBank is Ownable {

    string public name = "VandalsBank";
    address public stake; // token to stake
    address public reward; // token to harvest (must be different than token to stake)
    uint256 public defaultAPR; // eg. 7000 is 7% weekly

    address[] public stakers;
    mapping(address => uint256) public stakingBalance;
    mapping(address => bool) public hasStaked;
    mapping(address => bool) public isStaking;

    constructor(address stake_token, address reward_token, uint256 default_APR) {
        stake = stake_token;
        reward = reward_token;
        defaultAPR = default_APR;
    }

    // change stake token, reward token and defaultAPR

    function setNewStake(address stake_token) external onlyOwner() {
        stake = stake_token;
    }

    function setNewReward(address reward_token) external onlyOwner() {
        reward = reward_token;
    }

    function setNewAPR(uint256 default_APR) external onlyOwner() {
        defaultAPR = default_APR;
    }

    // stake tokens in contract
    
    function stakeTokens(uint256 _amount) public {

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
    
    function unstakeTokens() public {

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

    // harvest reward tokens after 7 days

    mapping(address => uint) public lockTime;
    
    function harvestTokens(address recipient) public {
        require(block.timestamp > lockTime[msg.sender]);
            uint256 balance = stakingBalance[recipient] * defaultAPR;
            balance = balance / 100000;
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
}