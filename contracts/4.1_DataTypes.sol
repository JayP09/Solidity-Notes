//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// DATA TYPES in Solidity classified into Two Types
// Values and References 
// values means that the data stores a Value for example a boolean store is either true or false and uint stores a number such as 1 and 0
// data types of type references do not store a value instead they store a references to where the actual data is stored for example: array is a data type of type reference an array data type will store a reference to where  the actual array elements are stored 

contract ValueTypes {
    bool public b = true ; // boolean variable in solidity

    /* 
    Uint stand for unsigned integer, meaning non negative integers 
    different sizes are available 
        uint = uint256 0 to 2**256-1
        uint8 0 to 2**8-1
        uint16 0 to 2**16-1
    */
    uint8 public u8 = 1; 
    uint public u256 = 456;
    uint public u = 123; // uint is an alias for uint256


    /* 
    Negative numbers are allowed for int types.
    like uint, different ranges are available from int8 to int256
        int = int256 -2**255 to 2**255-1
        int128 -2**127 to 2**127-1
    */
    int8 public i8 = -1;
    int public i256 = 456;
    int public i = -123; // int is same as int256

    // strings in solidity
    string public myString = "myString";

    // minimum and maximum of int
    int public minInt = type(int).min; // this will give minimum value of int
    int public maxInt = type(int).max; // this will give maximum value of int datatype

    address public addr = 0x10fC0232Fd52b56dbA6bbBE08381223947f3c8b8; // this will used to declare eth address inside solidity
    
    bytes32 public b32;// you will encounter this datatype when you are working with cryptographic hash function available in solidity called catch act256

    /* 
    Constant : keyword added to variable that tells solidity it cannot be changed .declaring state variable as constant will save gas when function is called that uses that state variable.
    By coding conventions we usually capitalize the constant state variable
    */
    uint public constant MY_UINT = 1;
    

    // Default values
    // unsigned variables have a default value
    bool public defaultBoo; //false
    uint public defaultUint; // 0 
    int public defaultInt; // 0 
    address public defaultAddr; // 0x0000000000000000000000000000000000000000


   
    uint public playerCount = 0;

    /* 
    enum dataType: enum datatype restricts a variable to have only one of few predefined values. values in this enumerated list are called enums. with use of enums we can lower the number of bugs
    value of the enum can be set from one of three.
    enum is also zero index base that means novice will be zero intermediate will be 1
    */
    enum Level {Novice, Intermediate, Advanced}

    /* 
    Struct data type is used to represent a record. this allow us to create our own data type.
    */
    struct Player {
        address playerAddress;
        Level playerLevel;
        string firstName;
        string lastName;
    }

    /* 
    Passing struct as arguments L
    - you can pass a storgae pointer to a strcut as an argument to a private or internal function.
    -  Syntax:
    function _doStuff(Player storage _player) internal {
        // do stuff with player
    }
    - This way we can pass a reference to our Player into a function instead of passing in a playerAddress and firstname and looking it up.
    */

    

    /* 
    Player[] is list of data type Player. players will hold value of struct Player. Players is array. it is array with starting index zero
    */
    // Player[] public players;// we can use mapping instead of this

    mapping(address => Player) public players;

    /* 
    This function will create new players.
    currently we are storing strings in memory 
    i.e : using memory keyword
    */ 
    function addPlayer(string memory firstName, string memory lastName) public {
        // players.push(Player(firstName,lastName)); // array
        players[msg.sender] = Player(msg.sender,Level.Novice, firstName,lastName); // Mapping
        playerCount +=1; 
    }

    function getPlayerLevel(address playerAddress) public view returns(Level){
        return players[playerAddress].playerLevel;
    }


    // A mapping to store a user's age:
    mapping (uint => uint) public age;

    // Require that this user be older than a certain age:
    modifier olderThan(uint _age, uint _userId) {
    require (age[_userId] >= _age);
    _;
    }

    // Must be older than 16 to drive a car (in the US, at least)
    function driveCar(uint _userId) public olderThan(16, _userId) {
    // Some function logic
    }

    /* 
    Note: calldata is somehow similar to memory, but it's only available to external functions.
    */

    
}


/* 
Constant : keyword added to variable that tells solidity it cannot be changed .declaring state variable as constant will save gas when function is called that uses that state variable.

struct: Struct types are used to represent a record. They allow you to create your own data type.

enum: Enums restrict a variable to have one of only a few predefined values. the values in this enumerated list are called enums .

array : Player[] public players;

# Mappings: 
- Mappings are another way of storing organized data in Solidity.
- A mapping is essentially a key-value store for storing and looking up data. In the first example, the key is an address and the value is a uint, and in the second example the key is a uint and the value a string.
example: 
// For a financial app, storing a uint that holds the user's account balance:
mapping (address => uint) public accountBalance;
// Or could be used to store / lookup usernames based on userId
mapping (uint => string) userIdToName;

# msg.sender :
- in solidity, there are certain global variables that are available to all functions. One of these is msg.sender, which refers to the address of the person(or smart contract) who called the current function
- Note: In Solidity, function execution always needs to start with an external caller. A contract will just sit on the blockchain doing nothing until someone calls one of its functions. So there will always be a msg.sender.


*/
