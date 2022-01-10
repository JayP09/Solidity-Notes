//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// function modifier - reuse code before and / or after function 

contract Coin{

    uint contractStartTime;
   
    address public minter;
    mapping (address => uint) public balances;

    modifier onlyMinter {
        require(msg.sender == minter,"Only minter can call this function");
        _;// modifiers should be end with "_;"
    }

    modifier amountGreaterThan(uint amount){
        require(amount < 1e60);
        _;
    }

    modifier balanceGreaterThanAmount(uint amount){
        require(amount <= balances[msg.sender], "Insufficent Balance."); // this code is verifying that the user actualy has this amount in his wallet 
        _; // this will call the main function 
    }

    event Sent(address from, address to, uint amount);

  
    constructor() {
        minter = msg.sender; // msg is object given by blockchain
        contractStartTime = block.timestamp;
    }

  
    function mint(address receiver,uint amount) public onlyMinter amountGreaterThan(amount){

        balances[receiver] += amount; // we are adding amount to receivers address
    } // this function allows us to mint and create new coins 

    function send(address receiver, uint amount) public balanceGreaterThanAmount(amount){
        require(block.timestamp >= contractStartTime + 30);
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit Sent(msg.sender, receiver, amount); // this will log this information inside of blockchain
    }
}