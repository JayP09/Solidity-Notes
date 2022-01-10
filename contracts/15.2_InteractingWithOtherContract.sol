pragma solidity ^0.8.0;
/* 
Now let's say we had an external contract that wanted to read the data in this contract using the getNum function.

first we'd have to define an interface of the Lucky number Contract:
*/

contract NumberInterface {
    function getNum(address _myAddress) public view returns (uint);
}

/* 
Notice that this looks like defining a contract, with a few differences. For one, we're only declaring the functions we want to interact with — in this case getNum — and we don't mention any of the other functions or state variables.

Secondly, we're not defining the function bodies. Instead of curly braces ({ and }), we're simply ending the function declaration with a semi-colon (;).

So it kind of looks like a contract skeleton. This is how the compiler knows it's an interface.

By including this interface in our dapp's code our contract knows what the other contract's functions look like, how to call them, and what sort of response to expect.
*/

// we can use it in a cotract as follows: 
contract MyContract {
  address NumberInterfaceAddress = 0x06012c8cf97BEaD5deAe237070F9587f8E7A266d;
  // ^ The address of the FavoriteNumber contract on Ethereum
  NumberInterface numberContract = NumberInterface(NumberInterfaceAddress);
  // Now `numberContract` is pointing to the other contract

  function someFunction() public {
    // Now we can call `getNum` from that contract:
    uint num = numberContract.getNum(msg.sender);
    // ...and do something with `num` here
  }
}

/* 
In this way, your contract can interact with any other contract on the Ethereum blockchain, as long they expose those functions as public or external.
*/