// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
contract OTNFT is ERC721URIStorage, Ownable {
    constructor(address initialOwner) Ownable(initialOwner) ERC721("Oluwatosin", "OT") {}
    function mint(
        address _to,
        uint256 _tokenId,
        string calldata _uri
 ) external onlyOwner {
    _mint(_to, _tokenId);
    _setTokenURI (_tokenId, _uri);
 }

}