// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract Escrow {
    // VARIBALES
    enum State{NOT_INITIATED, AWAITING_PAYMENT, AWAITING_DELIVERY, COMPLETE}
    
    State public currState; // this keep track of current state of contract

    bool public isBuyerIn;  
    bool public isSellerIn; // this two value tells us that buyer and seller are in and accepts the contract

    uint public price; // this track price of assets

    address public buyer;
    address payable public seller;

    // MODIFIERS
    modifier onlyBuyer() {
        require(msg.sender == buyer,"Only buyer can call this function");
        _;
    }

    modifier escrowNotStarted() {
        require(currState == State.NOT_INITIATED);
        _;
    }

    // FUNTIONS

    constructor(address _buyer, address payable _seller, uint _price) {
        buyer = _buyer;
        seller = _seller;
        price = _price*(1 ether);
        console.log("Buyer Address: ", buyer);
        console.log("Seller Address: ",seller);
        console.log("Price: ",price);
    }

    function initContract() escrowNotStarted public{
        // this will initiate smart contract
        if(msg.sender == buyer){
            isBuyerIn = true;
        }
        if(msg.sender == seller) {
            isSellerIn = true;
        }
        if (isBuyerIn && isSellerIn) {
            currState = State.AWAITING_PAYMENT;
        }
    }

    function deposit() onlyBuyer public payable{
        // function for buyer to deposit their funds
        require(currState == State.AWAITING_PAYMENT, "Already Paid");
        require(msg.value == price,"Wrong deposit amount");
        currState = State.AWAITING_DELIVERY;
    }

    function confirmDelivery() onlyBuyer payable public{
        // this will confirm by buyer he recived the assets and transfer the funds to seller
        require(currState == State.AWAITING_DELIVERY,"Cannot confirm delivery");
        seller.transfer(price);
        currState = State.COMPLETE;
    }

    function withdraw() onlyBuyer payable public{
        require(currState == State.AWAITING_DELIVERY,"Cannot withdraw at this stage");
        payable(msg.sender).transfer(price);
        currState = State.COMPLETE;
    }
}