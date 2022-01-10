pragma solidity ^0.8.0;

/* 
# Interacting with other contracts: 
- for our contract to talk to another contract on the blockchain that we don't own,first we need to define an interface.
Example: 
*/

contract LuckyNumber {
    mapping(address => uint) numbers;

    function setNum(uint _num) public{
        numbers[msg.sender] = _num;
    }

    function getNum(address _myAddress) public view returns(uint) {
        return numbers[_myAddress];
    }
}
