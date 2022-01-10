const main = async () => {
    const [random,deployer] = await hre.ethers.getSigners();
  
    console.log("Deploying contract with account :",deployer.address);
  
    const simpleAuction = await hre.ethers.getContractFactory("SimpleAuction");
    const simpleAuctionContract = await simpleAuction.deploy(600,deployer.address);
    await simpleAuctionContract.deployed();
    console.log("Contract Address:", simpleAuctionContract.address);
  
  
    let bid1 = await simpleAuctionContract.bid(random);
    await bid1.wait();
  
    console.log("Current HighestBid: ",simpleAuctionContract.HighestBid);
    console.log("Current HighestBid: ",simpleAuctionContract.HighestBidder);
  }
  
  // We recommend this pattern to be able to use async/await everywhere
  // and properly handle errors.
  const runMain = async () => {
    try {
      await main();
      process.exit(0);
    } catch (error) {
      console.log(error);
      process.exit(1);
    }
  };
  
  runMain();
  