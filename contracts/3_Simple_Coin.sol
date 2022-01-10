//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Coin{
    /* 
    Address is datatype in solidity. which is used to store eth address
    */
    address public minter;

    /* 
    Mapping it's a datatype in solidity it allows to store associations similar to something like a dictionary in python
    It allows you to quickly get the value corresponding to a key 
    here we are mapping address to uint that is we are mapping an address to a certain value that is a numerical.
    */
    mapping (address => uint) public balances;


    /* 
    - solidity has events which are inheritable members of contracts when you call them they cause the arguments that you pass to be stored in the transactions log and the transactions log is a special data structure in the blockchain it's log that is associated with address of the contract and are incorported into the blockchain and stay their forever 
    this code will log address of sender, address of receiver, amount 
    after declaring we need to trigger it
    - Events are a way for your contract to communicate that something happened on the blockchain to your app front-end, which can be 'listening' for certain events and take action when they happen.
    */
    event Sent(address from, address to, uint amount);

    /* 
    Constructor function run directly when the contract is created so it can be used to set variable directly
    */
    constructor() {
        /* 
        Msg it's keyword that allow us to access some special variables that are available for us from the blockchain and are sent through when the contract is called 
        here msg.sender which returns address of the wallet that called the contract.
        */
        minter = msg.sender; // msg is keyword 
    }

    /* 
    function takes two arguments the first one  is an address of the receiver when creator of this coin of this contract calls this function he needs to provide the address of whatever account this newly minted coin will be sent to and amount of coin that will be sent to receivers account
    */
    function mint(address receiver,uint amount) public{
        /* 
        require is convenience function it guarantees validity of conditions that cannot be detected before executed 
        basically it checks a certain input such as contract state variables and it returns values from calls to external contracts and once confirmed it simply moves on to the next line of code and if it is not confirmed then it will just give error
        here if msg.sender is minter and  if amount being sent is smaller than 1e60
        */
        require(msg.sender == minter);
        require(amount < 1e60);
        balances[receiver] += amount; // we are adding amount to receivers address
    } // this function allows us to mint and create new coins 

    function send(address receiver, uint amount) public{
        require(amount <= balances[msg.sender], "Insufficent Balance."); // this code is verifying that the user actualy has this amount in his wallet 

        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit Sent(msg.sender, receiver, amount); // this will log this information inside of blockchain
    }
}