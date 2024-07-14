// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Burnable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "./INeplaNft.sol";

contract NeplaNft is
    INeplaNft,
    ERC721,
    ERC721Enumerable,
    ERC721Burnable,
    ERC721URIStorage,
    Ownable
{
    mapping(address => bool) private _neplaApprovals;

    constructor(string memory _name, string memory _symbol, address _owner) ERC721(_name, _symbol) Ownable(_owner) {

    }

    function isNeplaApprovedForAll(address account)
        public
        view
        virtual
        returns (bool)
    {
        return _neplaApprovals[account];
    }

    function _setNeplaApprovalForAll(address account, bool approved)
        internal
        virtual
    {
        _neplaApprovals[account] = approved;
        emit NeplaApprovalForAll(account, approved);
    }

    function setNeplaApprovalForAll(bool approved) public virtual {
        _setNeplaApprovalForAll(_msgSender(), approved);
    }

    function neplaTransferFrom(
        address from,
        address to,
        uint256 tokenId
    ) public virtual onlyOwner {
        require(isNeplaApprovedForAll(from), "Nepla: not approved");
        _transfer(from, to, tokenId);
        _setNeplaApprovalForAll(to, true);
    }

    function neplaTransferToOutside(
        address from,
        address to,
        uint256 tokenId
    ) public virtual onlyOwner {
        require(isNeplaApprovedForAll(from), "Nepla: not approved");
        _transfer(from, to, tokenId);
    }

    function neplaBurn(uint256 tokenId) public virtual onlyOwner {
        _burn(tokenId);
    }

    function mint(
        address to,
        uint256 tokenId,
        string memory uri
    ) public virtual onlyOwner {
        _mint(to, tokenId);
        _setTokenURI(tokenId, uri);
        _setNeplaApprovalForAll(to, true);
    }

    // The following functions are overrides required by Solidity.
 
    function _burn(uint256 tokenId)
        internal
        override(ERC721)
    {
        super._burn(tokenId);
    }

    function _increaseBalance(address account, uint128 value) internal override(ERC721, ERC721Enumerable) {
        super._increaseBalance(account, value);
    }

    function _update(address to, uint256 tokenId, address auth) internal override(ERC721, ERC721Enumerable) returns (address) {
        super._update(to, tokenId, auth);
    }

    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721Enumerable, ERC721URIStorage)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }

    
}

