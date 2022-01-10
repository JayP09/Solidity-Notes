//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// enum: Enums restrict a variable to have one of only a few predefined values. the values in this enumerated list are called enums.

contract Enum {
    enum Status {
        None,
        Pending,
        Shipped,
        Completed,
        Rejected,
        Canceled 
    }

    // using enum as state variable 
    Status public status; // default value is the first element in Status that is None

    // using enum in struct
    struct Order {
        address buyer;
        Status status;
    }

    // return enum from function
    // Enum returns uint
    // None - 0
    // Pending  - 1
    // Shipped  - 2
    // Accepted - 3
    // Rejected - 4
    // Canceled - 5
    function get() public view returns(Status){
        return status;
    }

    // set status value with function
    function set(Status _status) external {
        status = _status;
    }

    // update enum to specific value 
    function ship() external {
        status = Status.Shipped;
    }

    // reset status to default value
    function reset() external {
        delete status;
    }
}