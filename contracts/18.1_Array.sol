//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Array - dynamic or fixed size
// Initialization
// Insert (push), get, update, delete, pop, length
// creating array in memory
// returning array from function

contract Array{
    // Several ways to initialize an array
    uint[] public nums;
    uint[] public nums2 = [1,2,3]; // dynamic array

    uint[3] public fixedArray = [4, 5, 6];// fixed Size array

    function example() external {
        nums.push(4); // output: [1, 2, 3, 4] this will push new element to end of an array

        uint x = nums[1]; // get 1 value from array

        nums[2] = 777; // output: [1, 777, 3, 4]  update array 

        delete nums[2]; // output: [1, 0, 3, 4] delete does not remove element it reset its value to 0
        // note : when you delete length of array is not changing 

        nums.pop(); //output: [1, 0, 3] pop element from end

        uint len = nums.length; // gives length of an array

        //create array in memory 
        uint[] memory a = new uint[](5); // array in meory has to be fixed size so we can't call function like push and pop
    }

    function returnArray() external view returns(uint[] memory){
        return nums;
    }
}