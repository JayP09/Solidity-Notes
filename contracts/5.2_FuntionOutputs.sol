//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Return multiple outputs
// Named outputs
// Destructuring Assignment

contract FunctionOutputs {
    function returnMany() public pure returns(uint, bool) {
        return (1, true);
    } // return Multiple Outputs

    function named() public pure returns(uint x, bool b) {
        return(1, true);
    } // named output

    function assigned() public pure returns (uint x, bool b){
        x = 1;
        b = true;
    } // assigned output : this function save you little bit of gas because there is one less copy to do

    function destructingAssigments() public pure {
        (uint x, bool b) = returnMany();
        (, bool _b) = returnMany();
    }
}