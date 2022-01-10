//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Variables {
    /*
    State variables are declared inside a contract but outside of a function.
    State variables are stored on the blockchain.
    state variables value will be changed by functions
    */
    uint public myUint = 123;


    // Default values of variables
    // unsigned variables have a default value
    bool public defaultBoo; //false
    uint public defaultUint; // 0 
    int public defaultInt; // 0 
    address public defaultAddr; // 0x0000000000000000000000000000000000000000
    bytes32 public b32; // 32 byte hexadecimal representaion of zero.

    function foo() external view returns(address,uint,uint){
        /* 
        Below variable is local variables.
        this varibale will only exist inside this function while it is executing after function executes this variable will be gone.
        Local variables are not saved to the blockchain.
        */
        uint notStateVariable = 456;

        /* 
        Global variables store information such as blockchain transcation and the account that call the function.
        */
        address sender = msg.sender; //global variable that store address that called this function
        uint timestamp = block.timestamp; // this variable stores the unix timestamp of when this function was called 
        uint blockNum = block.number; // this store current block number
        return (sender, timestamp, blockNum);
    }

    
}
