// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/access/Ownable.sol";

contract PostBox is Ownable {
    uint256 public stamp; // stamp price default: 10000000000000 (0.00001 BCH)
    string public sender;
    string public recipient;
    string public message;
    string public url;
    uint public messageCount = 0;

    mapping(uint => Message) public messages;

    struct Message {
        uint id;
        string sender;
        string recipient;
        string message;
        string url;
    }

    event MessageCreated(
        uint id,
        string sender,
        string recipient,
        string message,
        string url
    );

    constructor(uint256 _stamp) {
        stamp = _stamp;
    }

    function setNewStampPrice(uint256 _stamp) external onlyOwner() {
        stamp = _stamp;
    }

    function sendMessage(string memory _sender, string memory _recipient, string memory _message, string memory _url) external payable {    
        sender = _sender;
        recipient = _recipient;
        message = _message;
        url = _url;
        require(bytes(_message).length > 0);
        messageCount ++;
        messages[messageCount] = Message(messageCount, _sender, _recipient, _message, _url);
        require(msg.value >= stamp, "Not enough BCH sent, check stamp price");
        emit MessageCreated(messageCount, _sender, _recipient, _message, url);
    }

    function transfer(address payable _to) external onlyOwner {
        uint256 amount = address(this).balance;
        (bool success, ) = _to.call{value: amount}("");
        require(success, "Failed to send BCH");
    }
}