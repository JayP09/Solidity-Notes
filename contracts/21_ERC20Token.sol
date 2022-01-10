//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/* 
# Token on Ethereum
- A token on Ethereum is basically just a smart contract that follows some common rules — namely it implements a standard set of functions that all other token contracts share, such as transferFrom(address _from, address _to, uint256 _tokenId) and balanceOf(address _owner).
- Internally the smart contract usually has a mapping, mapping(address => uint256) balances, that keeps track of how much balance each address has.
- There's another token standard that's a much better fit for crypto-collectibles like CryptoZombies — and they're called ERC721 tokens.
- ERC721 tokens are not interchangeable since each one is assumed to be unique, and are not divisible. You can only trade them in whole units, and each one has a unique ID.
-  ERC721 standard:
contract ERC721 {
  event Transfer(address indexed _from, address indexed _to, uint256 indexed _tokenId);
  event Approval(address indexed _owner, address indexed _approved, uint256 indexed _tokenId);

  function balanceOf(address _owner) external view returns (uint256);
  function ownerOf(uint256 _tokenId) external view returns (address);
  function transferFrom(address _from, address _to, uint256 _tokenId) external payable;
  function approve(address _approved, uint256 _tokenId) external payable;
}
*/


/* 
When implementing a token contract, the first thing we do is copy the interface to its own Solidity file and import it, import "./erc721.sol";. Then we have our contract inherit from it, and we override each method with a function definition.
*/

import "./erc721.sol";

contract ERC721{
  event Transfer(address indexed _from, address indexed _to, uint256 indexed _tokenId);
  event Approval(address indexed _owner, address indexed _approved, uint256 indexed _tokenId);

  function balanceOf(address _owner) external view returns (uint256);
  function ownerOf(uint256 _tokenId) external view returns (address);
  function transferFrom(address _from, address _to, uint256 _tokenId) external payable;
  function approve(address _approved, uint256 _tokenId) external payable;
}

contract ZombieNft is ERC721{

    mapping (uint => address) public zombieToOwner;
    mapping (address => uint) ownerZombieCount;
    mapping (uint => address) public zombieApprovals;


    /* 
    balanceOf: 
    This function simply takes an address, and returns how many tokens that address owns.
    */
    function balanceOf(address _owner) external view returns (uint256) {
        return ownerZombieCount[_owner];
    }


    /*
    ownerOf :
    this functions takes a token Id and returns the address of the person who own it.
    */
    function ownerOf(uint256 _tokenId) external view returns (address) {
        return zombieToOwner[_tokenId];
    }

    /* 
    Note: ERC721 spec has 2 different ways to transfer tokens:
    function transferFrom(address _from, address _to, uint256 _tokenId) external payable;

    and

    function approve(address _approved, uint256 _tokenId) external payable;

    - The first way is the token's owner calls transferFrom with his address as the _from parameter, the address he wants to transfer to as the _to parameter, and the _tokenId of the token he wants to transfer.
    - he second way is the token's owner first calls approve with the address he wants to transfer to, and the _tokenID . The contract then stores who is approved to take a token, usually in a mapping (uint256 => address). Then, when the owner or the approved address calls transferFrom, the contract checks if that msg.sender is the owner or is approved by the owner to take the token, and if so it transfers the token to him.
    - Note that both methods contain the same transfer logic. In one case the sender of the token calls the transferFrom function; in the other the owner or the approved receiver of the token calls it.
    for more info : OpenZeppelin ERC721 contract.
    */

   function _transfer(address _from, address _to, uint256 _tokenId) private {
        ownerZombieCount[_to]++;
        ownerZombieCount[_from]--;
        zombieToOwner[_tokenId] = _to;
        emit Transfer(_from, _to, _tokenId);
    }

    function transferFrom(address _from, address _to, uint256 _tokenId) external payable {
        require (zombieToOwner[_tokenId] == msg.sender || zombieApprovals[_tokenId] == msg.sender);
        _transfer(_from, _to, _tokenId);
    }

    function approve(address _approved, uint256 _tokenId) external payable onlyOwnerOf(_tokenId) {
        zombieApprovals[_tokenId] = _approved;
        //Fire the Approval event here
        emit Approval(msg.sender, _approved, _tokenId);
    }
}
