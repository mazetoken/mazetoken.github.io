// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Message is Ownable {
    address public token1; // default: MAZE
    address public token2; // default: VANDALS
    uint256 public priceToken1; // default: 10
    uint256 public priceToken2; // default: 50
    string public message;
    string public url;
    uint public messageCount = 0;

    mapping(uint => Message) public messages;

    struct Message {
        uint256 id;
        string message;
        string url;
    }

    event MessageCreated(
        uint256 id,
        string message,
        string url
    );

    constructor(address _token1, address _token2, uint256 _priceToken1, uint256 _priceToken2) {
      token1 = _token1;
      token2 = _token2;
      priceToken1 = _priceToken1;
      priceToken2 = _priceToken2;
    }

    function setNewToken1(address _token1) external onlyOwner() {
        token1 = _token1;
    }

    function setNewToken2(address _token2) external onlyOwner() {
        token2 = _token2;
    }

    function setNewPriceToken1(uint256 _priceToken1) external onlyOwner() {
        priceToken1 = _priceToken1;
    }

    function setNewPriceToken2(uint256 _priceToken2) external onlyOwner() {
        priceToken2 = _priceToken2;
    }

    function sendMessage(string memory _message, string memory _url) public {
        message = _message;
        url = _url;
        require(bytes(_message).length > 0);
        messageCount ++;
        messages[messageCount] = Message(messageCount, _message, _url);
        emit MessageCreated(messageCount, _message, url);
        IERC20(token1).transferFrom(msg.sender, address(this), priceToken1);
        IERC20(token2).transferFrom(msg.sender, address(this), priceToken2);
    }

    function withdrawToken() external onlyOwner {
        uint256 balance1 = IERC20(token1).balanceOf(address(this));
        IERC20(token1).transfer(msg.sender, balance1);
        uint256 balance2 = IERC20(token2).balanceOf(address(this));
        IERC20(token2).transfer(msg.sender, balance2);
    }
}