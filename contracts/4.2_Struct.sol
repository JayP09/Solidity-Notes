//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


/* 
Struct data type is used to represent a record. this allow us to create our own data type.
*/

contract Structs {
    struct Car {
        string model;
        uint year;
        address owner;
    }

    // using struct as state variables
    Car public car;
    Car[] public cars;

    // using struct inside mapping
    mapping(address => Car[]) public carsByOwner;

    function examples() external {
        // 3 ways to initialize a struct 
        // 1 direct initialization
        Car memory toyota = Car("Toyota", 1990, msg.sender);

        //2 by key value
        Car memory lambo = Car({year: 1980, model:"Lamborghini", owner:msg.sender});

        //3 initi empty stuct and then update it 
        Car memory tesla;
        tesla.model = "Tesla";
        tesla.year = 2010;
        tesla.owner = msg.sender;

        cars.push(toyota);
        cars.push(lambo);
        cars.push(tesla);

        cars.push(Car("Ferrari", 2020, msg.sender));

        Car storage _car = cars[0];
        _car.model;
        _car.owner;
        _car.year = 1999; // updating info 

        delete _car.owner; // _car.owner reset to default value 

        delete cars[1]; // this will delete whole struct at 1 
    }
}