// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract MintNFT is ERC721, ERC721Enumerable, ERC721URIStorage, ERC721Burnable, Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIdCounter;
    uint256 public _maxSupply;
    uint256 public _price;

    constructor(uint256 maxSupply_, uint256 price_) ERC721("MintNFT", "NFT") {
        _maxSupply = maxSupply_;
        _price = price_; // default: 50000000000000 (0.00005 BCH)
    }

    function _baseURI() internal pure override returns (string memory) {
        return "";
    }

    function setNewPrice(uint256 price_) external onlyOwner() {
        _price = price_;
    }

    //function setNewURI(uint256 tokenId, string memory uri) public virtual returns (uint256, string memory) {
        //require(ownerOf(tokenId) == msg.sender, "Not your token");
        //return (tokenId, uri);
    //}

    function tokenNewURI(uint256 tokenId) public virtual returns (string memory) {
      require(ownerOf(tokenId) == msg.sender, "Not your token");
      string memory imageUri = getImageUri();
      string memory json = string(abi.encodePacked('{"name":"Name # ',Strings.toString(tokenId),'","image":"',imageUri,'"}'));
      string memory jsonUri = string(abi.encodePacked(imageUri, Strings.toString(tokenId), json));
      return jsonUri;
    }

    function getImageUri() public pure returns (string memory imageUri) {
      return imageUri;
    }

    function mint() external payable {
        uint256 tokenId = _tokenIdCounter.current();
        require(_tokenIdCounter.current() <= _maxSupply - 1, "Max amount minted");
        require(msg.value >= _price, "Not enough BCH sent, check price");
        _tokenIdCounter.increment();
        _safeMint(msg.sender, tokenId);
    }

    function transfer(address payable _to) external onlyOwner {
        uint256 amount = address(this).balance;
        // Note that "to" is declared as payable
        (bool success, ) = _to.call{value: amount}("");
        require(success, "Failed to send BCH");
    }

    // The following functions are overrides required by Solidity.

    function _beforeTokenTransfer(address from, address to, uint256 tokenId) internal override(ERC721, ERC721Enumerable) {
        super._beforeTokenTransfer(from, to, tokenId);
    }

    function _burn(uint256 tokenId) internal override(ERC721, ERC721URIStorage) {
        super._burn(tokenId);
    }

    function tokenURI(uint256 tokenId) public view override(ERC721, ERC721URIStorage) returns (string memory) {
        return super.tokenURI(tokenId);
    }

    function supportsInterface(bytes4 interfaceId) public view override(ERC721, ERC721Enumerable) returns (bool) {
        return super.supportsInterface(interfaceId);
    }
}