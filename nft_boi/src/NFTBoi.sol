//SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.14;

// import contracts from Git submodules
import "solmate/tokens/ERC721.sol"; // gas-optimised implementation
import "openzeppelin-contracts/contracts/utils/Strings.sol";

contract NFTBoi is ERC721 
{ 
    uint256 public currentTokenId;

    // takes args and passes on to parent constructor
    constructor(
        string memory _name,
        string memory _symbol
    ) ERC721(_name, _symbol) {}

    // allows anyone to mint an NFT
    function mintTo(address recipient) public payable returns (uint256) {
        uint256 newItemId = ++currentTokenId;
        _safeMint(recipient, newItemId);
        return newItemId;
    }

    function tokenURI(uint256 id) public view virtual override returns (string memory) {
        return Strings.toString(id);
    }

}