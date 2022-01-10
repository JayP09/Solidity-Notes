//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract SimpleAuction{
    // Parameters of the beneficiary
    address payable public beneficiary; // payable keyword means that this address can send coin to another address
    uint public auctionEndTime;

    // current state of the auction
    address public highestBidder;
    uint public highestBid;

    mapping(address => uint) public pendingReturns; // this is keeping track of what address and their bids

    bool ended = false;

    event highestBidIncrease(address bidder, uint amount); // this event keep track of highestbidder 

    event AuctionEnded(address winner, uint amount);

    constructor(uint _biddingTime, address payable _beneficiary){
        console.log("Bidding Time:",_biddingTime);
        console.log("Beneficiary :",_beneficiary);
        beneficiary = _beneficiary;
        auctionEndTime = block.timestamp + _biddingTime;
    }

    function bid() public payable{ 
        if (block.timestamp > auctionEndTime){
            revert("The Auction has Already ended");
        }
        if(msg.value <= highestBid){
            revert("There is already a higher or equal bid");
        }
        if (highestBid != 0){
            pendingReturns[highestBidder] += highestBid;
        }

        highestBidder = msg.sender;
        highestBid = msg.value; // msg.value gives bid amount
        emit highestBidIncrease(msg.sender, msg.value);
    }

    function withdraw() public payable returns(bool){
        uint amount = pendingReturns[msg.sender];
        if (amount > 0){
            pendingReturns[msg.sender] = 0;
            if(!payable(msg.sender).send(amount)){
                pendingReturns[msg.sender] = amount;
                return false;
            }
        }
        return true;

    }

    function autionEnd() public{
        if(block.timestamp < auctionEndTime){
            revert("The auction has not ended yet");
        }
        if(ended){
            revert("The function auctionEnded has already been called");
        }
        ended = true;
        emit AuctionEnded(highestBidder, highestBid);

        beneficiary.transfer(highestBid);
    }
}
/* 
Send and transfer are very similar functions they cost same amount of gas and they do same things. 
difference is that send will return false if transaction fails when transfer if it fails it doesn't do anything it just stops there 
*/