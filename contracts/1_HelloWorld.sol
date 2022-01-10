//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HelloWorld {
    string public myString = "Hello world";
    //public means we will have read access to this varible after we deploy smart contract.
    // after we deploy the smart contract variable myString will be stored on blockchain

    // function getHelloWorld() public view returns (string memory){
    //     return myString;
    // }// this will return myString variable
}
