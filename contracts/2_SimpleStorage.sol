//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract SimpleStorage {
    uint storedData; // unsigned integer 

    constructor () {
        console.log("Contract has been deployed");
    }

    function set(uint x) public{
        storedData = x;
    } // this function used to set storedData variable . this is used to change state of contract 

    function get() public view returns (uint){
        return storedData;
    } // this function only returns storedData variable. if we add keyword "view" before returns then that keyword simply declares the function as a function that will never change state of the contract.
}