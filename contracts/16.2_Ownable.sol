//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// state variables
// global variables 
// function modifier
// error handling 

contract Ownable{
    address public owner;

    constructor(){
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not an owner");
        _;
    }

    function setNewOwner(address newOwner) external onlyOwner{
        require(newOwner != address(0),"Error");
        owner = newOwner;
    }

    function onlyOwnerCanCall() external onlyOwner{
        // 
    }

    function anyOneCanCall() external {
        //
    }
}