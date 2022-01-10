//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Extra{
    /* 
    Keccak 256 and Typecasting:
    - Ethereum has the hash function keccak26 built in, which is version of SHA3. A hash function basically maps an input into a random 256-bit hexadecimal number. A slight chnage in the input will cause a large change is the hash 
    - it's useful for many purposes in ethereum such as pseudo-random number generations.
    - Also, important, keccak26 expects a single parameter of type bytes. 
    This means that we have to "pack" any parameters before calling keccak256:
    Note: Secure random-number generation in blockchain is a very difficult problem. Our method here is insecure.
    */
    // example:
    keccak256(abi.encodePacked("jay"));

    /*
    Type Casting:
    - sometimes you need to convert between data types
    */
    //example:
    uint8 a = 5;
    uint b = 6;
    //throws an error because a*b returns an uint, not uint8;
    uint8 c = a* b;
    // we have to typecast b as uint 8 to make it work
    uint8 c = a* uint8(b);
}


/*
# import Keyword :
- When you have multiple files and you want to imoport one file into another,solidity uses the import keyword
- example: 
import "./someothercontract.sol";

contract newContract is SomeOtherContract {

}
- So if we had a file named someothercontract.sol in the same directory as this contract (that's what the ./ means), it would get imported by the compiler.
*/

/* 
# msg Keyword :
# msg.data: An unlimited size byte array specifiying the input data of the message call
 it stores the Function it needs to call
 The arguments for the functions

# msg.sig : Byte array specifying the signature of the function being called 

# msg.value : it return value that is sent by sender its value will be in wei or ethereum but inside the contract value will always be wei.

# msg.sender : this will return address of the sender (ie person who is interacting with contract)
if you have one contract then 
  Person A --> Contract A
  msg.sender = Person A

if your contract is interacting with another contract
then 
    Person A --> contract A --> Contract B
    msg.sender = contract A // inside contract B


# tx.origin : this will give address of person who created transaction

*/

/*
# Block keyword
# block.timestamp : returns current block timestamp
                    uses the Epoch Time.

# block.chainid : Returns current blockchain id
                  used to confirm the use of the intended blockchain not another fork

# block.coinbase : returns current block miner addres
                   could be used to build a blockchain explorer

# block.gaslimit: returns current block gas limit 
                  gaslimit = maximum sum of gas fees for the block. 
                  protects the node from attackers who could make an effective infinite transaction loop.

# block.number: returns current block number
                can also be used as a timestamp

# block.difficulty: returns current block difficulty
                    Used for finding random numbers
                    
blockhash() -  returns the hash of the current block

gasleft() - returns the gas left for the current transaction/ contract

*/

/* 
# contract security enhancements: overFlows and underflows:
Q what's an overflow?
A: 1) Let's say we have a uint8, which can only have 8 bits. That means the largest number we can store is binary 11111111 (or in decimal, 2^8 - 1 = 255).
2) Take a look at the following code. What is number equal to at the end?
uint8 number = 255;
number++;
3) In this case, we've caused it to overflow — so number is counterintuitively now equal to 0 even though we increased it. (If you add 1 to binary 11111111, it resets back to 00000000, like a clock going from 23:59 to 00:00).
4) An underflow is similar, where if you subtract 1 from a uint8 that equals 0, it will now equal 255 (because uints are unsigned, and cannot be negative).
5) While we're not using uint8 here, and it seems unlikely that a uint256 will overflow when incrementing by 1 each time (2^256 is a really big number), it's still good to put protections in our contract so that our DApp never has unexpected behavior in the future.

for this issues OpenZeppelin has created library called SafeMath that prevents these issues by default. 

for more info: https://cryptozombies.io/en/lesson/5/chapter/9

Q: what's a library?
A: A library is a special type of contract in Solidity. One of the things it is useful for is to attach functions to native data types.

For example, with the SafeMath library, we'll use the syntax using SafeMath for uint256. The SafeMath library has 4 functions — add, sub, mul, and div. And now we can access these functions from uint256 as follows:

using SafeMath for uint256;

uint256 a = 5;
uint256 b = a.add(3); // 5 + 3 = 8
uint256 c = a.mul(2); // 5 * 2 = 10


- libraries are similar to contracts but with a few differences. For our purposes, libraries allow us to use the using keyword, which automatically tacks on all of the library's methods to another data type

*/