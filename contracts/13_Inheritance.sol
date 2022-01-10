//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Doge{
    function catchphrase() public returns (string memory){
        return "So Wow CryptoDoge";
    }
}

contract BabyDoge is Doge {
    function anotherCatchphrase() public returns (string memory){
        return "Such Moon BabyDoge";
    }
}
/* 
- BabyDoge inherits from Doge. That means if you compile and deploy BabyDoge, it will have access to both catchphrase() and anotherCatchphrase() (and any other public functions we may define on Doge).
- This can be used for logical inheritance (such as with a subclass, a Cat is an Animal). But it can also be used simply for organizing your code by grouping similar logic together into different contracts.
- private functions are not inherited from one contract to another.

*/