pragma solidity ^0.8.0;

/* 
- One of the more expensive operations in Solidity is using storage — particularly writes.

# Declaring arrays in memory :
- You can use the memory keyword with arrays to create a new array inside a funtion without needing to write anything to storage. The array will only exist until the end of function call, and this is a lot cheaper gas-wise than updating an array in storage - free if it's view function called externally.

- Exmaple :
function getArray() external pure returns(uint[] memory) {
  // Instantiate a new array in memory with a length of 3
  uint[] memory values = new uint[](3);

  // Put some values to it
  values[0] = 1;
  values[1] = 2;
  values[2] = 3;

  return values;
}
*/

contract ArrayInMemory{
    function getArray() external pure returns(uint[] memory) {
        // Instantiate a new array in memory with a length of 3
        uint[] memory values = new uint[](3);

        // Put some values to it
        values[0] = 1;
        values[1] = 2;
        values[2] = 3;

        return values;
    }
}