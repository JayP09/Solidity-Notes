//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/* 
You can throw an error by calling require, revert or assert.

require is used to validate inputs and conditions before execution.
revert is similar to require. See the code below for details.
assert is used to check for code that should never be false. Failing assertion probably means that there is a bug.

when error is thrown inside transaction your gas will be refunded any state variable updated will be reverted 

in solidity 0.8 you can also use custom errors to have gas 
*/

contract Error {
    function testRequire(uint _i) public pure{
        // Require should be used to validate conditions such as:
        // - inputs
        // - conditions before execution
        // - return values from calls to other functions
        require(_i <= 10 , "i > 10");
        // more code
    }

    function testRevert(uint _i) public pure{
        // Revert is useful when the condition to check is complex.
        // This code does the exact same thing as the example above
        // if there is lot of if statement then you should use revert
        if(_i>10){
            revert("i>10");
        }
    }

    uint public num =123;
    function testAssert() public view{
        // Assert should only be used to test for internal errors,
        // and to check invariants.
        // assert is used to check for condition that should always be true if consition evaluates to be false then there is bug in our smart contract
        // Here we assert that num is always equal to 123
        // since it is impossible to update the value of num
        assert(num == 123);
    }

    error MyError(address caller, uint i); // custom error 

    function testCustomError (uint _i) public view{
        /*
        benefit of using custom error is that it is cheaper than to use require with some error message.
        longer the error message the more gas it will use.
        custom error can be used in revert.
        */ 
        if (_i>10){
            revert MyError(msg.sender, _i);
        }
    }
}
/* 
assert is similar to require, where it will throw an error if false. The difference between assert and require is that require will refund the user the rest of their gas when a function fails, whereas assert will not. So most of the time you want to use require in your code; assert is typically used when something has gone horribly wrong with the code (like a uint overflow).
*/