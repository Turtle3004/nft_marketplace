// SPDX-License-Identifier : MIT

pragma solidity ^0.8.4;

import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

import "hardhat/console.sol";

contract NFT is ERC721URIStorage {

    //using Counters for Counters.counter;
    //Counters.counter private _tokenId;
    uint256 private _tokenId;
    address contractAddress;

    constructor(address marketPlaceAdress) ERC721("My NFTMarketPlace Token", "MNT") {
        contractAddress = marketPlaceAdress;
    }

    function createToken(string memory _tokenURI) public returns (uint) {
        _tokenId++;
        uint256 newItemId = _tokenId;

        _mint(msg.sender, newItemId);
        _setTokenURI(newItemId, _tokenURI);
        setApprovalForAll(contractAddress, true);
        return newItemId;
        
    }
}