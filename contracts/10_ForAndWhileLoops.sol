//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ForAndWhileLoops{
    function loops() external pure {
        for (uint i=0; i<10; i++){
            // code
            if (i==3) {
                continue; // Skip to next iteration with continue
            }
            // more code
            // break :  exit out of this loop 
            if(i==5){
                // Exit loop with break
                break;
            }
        }

        uint j= 0;
        while(j<10){
            // code
            j++;
        }
    }

    function sum(uint _n) external pure returns (uint){
        uint s;
        for (uint i=1; i<=_n; i++){
            s += i;
        }
        return s;
    }
    /*
    in solidity bigger the number of loops the more gas it will use.
    */
}