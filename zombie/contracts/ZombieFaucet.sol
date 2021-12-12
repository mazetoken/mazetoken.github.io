// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

// ZOMBIE SmartBCH SEP20 token faucet
// https://mazetoken.github.io/zombie
// Claim 500 ZOMBIE one time per day

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract ZombieFaucet {
    string public name = "ZombieFaucet";
    address public zombie;
    uint256 public amount;

    constructor() {
      zombie = 0x80453ACDfE0073D6743B27D72e06F48777EeAd80;
      amount = 500;
    }

    mapping(address => uint) public lockTime;

    function claimZombie(address recipient) public {
      require(block.timestamp > lockTime[msg.sender], "Please try again later. Wait for the zombie horde");
      require(IERC20(zombie).balanceOf(address(this)) >= amount, "Not enough zombies. Try to bite somebody");
      IERC20(zombie).transfer(recipient, amount);
      lockTime[msg.sender] = block.timestamp + 1 days;      
    }
}