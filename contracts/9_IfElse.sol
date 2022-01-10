//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract IfElse{
    /* 
    If else in solidity is similar to javascripts.
    */
    function example(uint _x) external pure returns (uint){
        if(_x<10){
            return 1;
        } else if(_x<20){
            return 2;
        }else{
            return 3;
        }
    }

    function ternary(uint _x) external pure returns(uint){
        // ternary operator in solidity
        // if(_x < 10){
        //     return 1;
        // }
        // return 2;
        // shorthand way to write if / else statement
        return _x < 10 ? 1: 2;
    }

    function eatBLT(string memory sandwich) public view {
    // Remember with strings, we have to compare their keccak256 hashes
    // to check equality
    if (keccak256(abi.encodePacked(sandwich)) == keccak256(abi.encodePacked("BLT"))) {
        console.log("Eat");
    }
    }
}