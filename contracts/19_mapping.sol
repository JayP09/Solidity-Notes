//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// mapping 
// how to declare a mapping (simple and nested)

contract Mapping{
    mapping(address => uint) public balances;
    mapping(address => mapping(address => bool)) public isFriend; // nested mapping 

    function examples() external {
        balances[msg.sender] = 123;
        uint bal = balances[msg.sender];

        balances[msg.sender] += 245; // updating value 

        delete balances[msg.sender];  // reset balanace of msg.sender to zero

        isFriend[msg.sender][address(this)] = true ;
    }
}