const hre = require("hardhat");

const main = async () =>{
    const[buyer, seller] = await hre.ethers.getSigners();
    const escrow = await hre.ethers.getContractFactory("Escrow");
    const escrowContract = await escrow.deploy(buyer.address,seller.address,1);
    await escrowContract.deployed();

    console.log("Escrow contract deployed to: ", escrowContract.address);

    let buyerTxn = await escrowContract.initContract();
    await buyerTxn;

    console.log("Buyer InitTxn: ", buyerTxn);

    let sellerTxn = await escrowContract.connect(seller).initContract();
    await sellerTxn;

    console.log("Seller InitTxn: ", sellerTxn);
    console.log("Current State: ",(await escrowContract.currState()).toString());

    console.log(await escrowContract.isBuyerIn());
    console.log(await escrowContract.isSellerIn());

    buyerTxn = await escrowContract.deposit({value: hre.ethers.utils.parseEther('1')});
    await buyerTxn;

    console.log("Buyer deposit Txn: ", buyerTxn);
    console.log("Current State: ",(await escrowContract.currState()).toString());


    buyerTxn = await escrowContract.confirmDelivery();
    await buyerTxn;

    console.log("Buyer confirmDelivery Txn: ",buyerTxn);
    console.log("Current State: ",(await escrowContract.currState()).toString());

}

main()
    .then(() => process.exit(0))
    .catch((error) => {
    console.error(error);
    process.exit(1);
});