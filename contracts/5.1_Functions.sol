//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FunctionIntro{
    uint public num;
    /* 
    Here external means that when we deploy this contract we will able to call this function
    Pure : pure means this function is read only it does not write anything to the blockchain 
    */
    function add(uint x,uint y) external pure returns(uint){
        return x+y;
    }

    function sub(uint x, uint y) external pure returns(uint){
        return x-y;
    }


    // Promise not to modify the state.
    function viewFunc() external view returns (uint){
        /* 
        This function is read only function but it can read data from blockchain
        */
        return num;
    }

    // Promise not to modify or read from the state.
    function pureFunc() external pure returns (uint){
        /* 
        this function is read only function it does not modify any data and it also does not read any data from block chain such as state variable or any information about blockchain
        Promise not to modify or read from the state.
        */
        return 1;
    }

}

/* 
View : view is read only function unlike pure function view function can read data from state variables and global variables.
Pure: pure function do not read any thing from blockchain.


# private/ public functions:
- in Solidity, functions are public by default. this means anyone(or any other contrcat) can call your contract's function and execute its code.
- Thus it's good practice to mark functions as private by default, and then only public the functions you want to expose the world.
example: 
uint[] numbers;

function _addToArray(uint _number) private {
  numbers.push(_number);
}
- As you can see, we use the keyword private after the function name. And as with function parameters, it's convention to start private function names with an underscore (_).

In additon to public and private, solidity has two type of visibility for functions: internal and external.

# Internal functions :
- internal is same as private, except that it's also accessible to contracts that inherit from this contract.

# external functions:
- external is similar to public, except that these functions can only be called outside the contract - they can't be called by other functions inside that contract. 

# payable functions:
- payable functions are part of what makes solidity and Ethereum so cool - they are a sepcial type of function that can receive Ether.
- Let that sink in for a minute. When you call an API function on a normal web server, you can't send US dollars along with your function call — nor can you send Bitcoin.
- But in Ethereum, because both the money (Ether), the data (transaction payload), and the contract code itself all live on Ethereum, it's possible for you to call a function and pay money to the contract at the same time.

- example: 
contract OnlineStore {
  function buySomething() external payable {
    // Check to make sure 0.001 ether was sent to the function call:
    require(msg.value == 0.001 ether);
    // If so, some logic to transfer the digital item to the caller of the function:
    transferThing(msg.sender);
  }
}

Note: If a function is not marked payable and you try to send Ether to it as above, the function will reject your transaction.
*/