//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


/* 
# Time Units: 
- Solidity provides some native units for dealing with time.
- The variable now will return the current unix timestamp of the latest block (the number of seconds that have passed since January 1st 1970).
- now returns a uint256 by default.
- Note: Unix time is traditionally stored in a 32-bit number. This will lead to the "Year 2038" problem, when 32-bit unix timestamps will overflow and break a lot of legacy systems. So if we wanted our DApp to keep running 20 years from now, we could use a 64-bit number instead — but our users would have to spend more gas to use our DApp in the meantime. Design decisions!
- Solidity also contains the time units seconds, minutes, hours, days, weeks and years. These will convert to a uint of the number of seconds in that length of time. So 1 minutes is 60, 1 hours is 3600 (60 seconds x 60 minutes), 1 days is 86400 (24 hours x 60 minutes x 60 seconds), etc.
- example :
uint lastUpdated;

// Set `lastUpdated` to `now`
function updateTimestamp() public {
  lastUpdated = now;
}

// Will return `true` if 5 minutes have passed since `updateTimestamp` was 
// called, `false` if 5 minutes have not passed
function fiveMinutesHavePassed() public view returns (bool) {
  return (now >= (lastUpdated + 5 minutes));
}
*/
contract myGame{
    uint public playerCount = 0;
    mapping( address => Player) public players;

    enum Level {Novice, Intermediate, Advanced}

    struct Player {
        address playerAddress;
        Level playerLevel;
        string firstName;
        string lastName;
        uint createdTime;
    }

    function addPlayer(string memory firstName, string memory lastName) public{
        players[msg.sender] = Player(msg.sender, Level.Novice, firstName, lastName, block.timestamp) ; // block.timestamp give current timestamp 
        playerCount+=1;
    }

    function getPlayerLevel(address playerAddress) public view returns(Level){
        Player storage player = players[playerAddress]; // this wil give player struct object 
        // return players[playerAddress].playerLevel;
        return player.playerLevel;
    }

    function changePlayerLevel(address playerAddress) public {
        Player storage player = players[playerAddress];
        if(block.timestamp >= player.createdTime + 20){
            player.playerLevel = Level.Intermediate;
        }
    }
}