//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//counter increment and decrement application 

contract Counter{
    uint public Count;

    function incrementCount() external{
        Count +=1;
    } 

    function decrementCount() external{
        Count -=1;
    }
}

