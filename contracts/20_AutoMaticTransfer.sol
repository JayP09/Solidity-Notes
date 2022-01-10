//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract myGame {
    uint public playerCount = 0;
    uint public pot = 0;

    address public dealer;

    mapping(address => Player) public players;

    Player[] public playersInGame;

    enum Level {Novice, Intermediate, Advanced}

    struct Player{
        address playerAddress;
        Level playerLevel;
        string firstName;
        string LastName;
        uint createdTime;
    }

    constructor(){
        dealer = msg.sender;
    }

    function addPlayer(string memory firstName, string memory lastName) private{
        Player memory newPlayer = Player(msg.sender,Level.Novice,firstName,lastName, block.timestamp);
        players[msg.sender] = newPlayer;
        playersInGame.push(newPlayer);
    }

    function getPlayerLevel(address playerAddress) private view returns(Level){
        Player storage player = players[playerAddress];
        return player.playerLevel;
    }

    function changePlayerLevel(address playerAddress) private {
        Player storage player = players[playerAddress];
        if(block.timestamp >= player.createdTime + 20) {
            player.playerLevel = Level.Intermediate;
        }
    }

    function joinGame(string memory firstName, string memory lastName) payable public{
        require(msg.value == 25 ether,"The joining fee is 25 ether");
        if(payable(dealer).send(msg.value)){
            addPlayer(firstName, lastName);
            playerCount += 1;
            pot += 25;
        }

    }

    function payOutWinners(address loserAddress) payable public{ 
        require(msg.sender == dealer, "Only the dealer payout the winners.");
        require(msg.value == pot* (1 ether));
        uint payoutPerWinner = msg.value / (playerCount - 1);
        for (uint i=0;i<playersInGame.length; i++){
            address currentPlayerAddress = playersInGame[i].playerAddress;
            if(currentPlayerAddress != loserAddress){
                payable(currentPlayerAddress).transfer(payoutPerWinner);
            }
        }

    }
}

/* 
Transfer : this transfer ether from smart contract to specified address 
- It is important to note that you cannot transfer Ether to an address unless that address is of type address payable. But the _owner variable is of type uint160, meaning that we must explicitly cast it to address payable.
- You can use transfer to send funds to any Ethereum address. For example, you could have a function that transfers Ether back to the msg.sender if they overpaid for an item:

uint itemFee = 0.001 ether;
msg.sender.transfer(msg.value - itemFee);
*/