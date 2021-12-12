// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

// VANDALS SmartBCH SEP20 token faucet
// https://mazetoken.github.io/vandals
// Claim 500 VANDALS one time per day

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract VandalsFaucet {
    string public name = "VandalsFaucet";
    address public vandals;
    uint256 public amount;

    constructor() {
      vandals = 0x38BCeA49ced154bfd7d488D4dacC85864168D83c;
      amount = 50000000000;
    }

    mapping(address => uint) public lockTime;

    function claimVandals(address recipient) public {
      require(block.timestamp > lockTime[msg.sender], "Please try again later");
      require(IERC20(vandals).balanceOf(address(this)) > amount, "Not enough funds in the faucet");
      IERC20(vandals).transfer(recipient, amount);
      lockTime[msg.sender] = block.timestamp + 1 days;      
    }
}