// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract TokenFaucet is Ownable {
    string public name = " Token Faucet";
    address public _token;
    uint256 public _amount;
    uint256 public _price;

    mapping(address => uint256) public lockTime;

    constructor(address token_, uint256 amount_, uint256 price_) {
        _token = token_;
        _amount = amount_;
        _price = price_;
    }

    function newToken(address token_) external onlyOwner() {
        _token = token_;
    }

    function newAmount(uint256 amount_) external onlyOwner() {
        _amount = amount_;
    }

    function newPrice(uint256 price_) external onlyOwner() {
        _price = price_;
    }

    function claimToken(address recipient) external payable {
        require(block.timestamp > lockTime[msg.sender], "Please try again later");
        require(msg.value >= _price, "Not enough BCH sent, check price");
        require(IERC20(_token).balanceOf(address(this)) >= _amount, "Not enough tokens in the faucet");
        IERC20(_token).transfer(recipient, _amount);
        lockTime[msg.sender] = block.timestamp + 1 hours;      
    }

    function withdrawTokens() external onlyOwner {
        uint256 tokenbalance = IERC20(_token).balanceOf(address(this));
        IERC20(_token).transfer(msg.sender, tokenbalance);
    }

    function transfer(address payable _to) external onlyOwner {
        uint256 amount = address(this).balance;
        (bool success, ) = _to.call{value: amount}("");
        require(success, "Failed to send BCH");
    }
}