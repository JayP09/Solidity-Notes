const main = async () =>{
    // // for HelloWorld Contract
    // const HelloWorld = await hre.ethers.getContractFactory("HelloWorld");
    // const HelloWorldContract = await HelloWorld.deploy();
    // await HelloWorldContract.deployed();

    // console.log("HelloWorld Contract Deployed Successfully from Address:", HelloWorldContract.address);

    // let myString = await HelloWorldContract.myString();
    // console.log(myString);

    // // for SimpleStorage Contract
    // const simpleStorage = await hre.ethers.getContractFactory("SimpleStorage");
    // const simpleContract =  await simpleStorage.deploy();
    // await simpleContract.deployed();

    // console.log("Simple Storage Contract Deployed Successfully from Address:", simpleContract.address);

    // const x = await simpleContract.set(100);// this will set storedData Variable with value 100 
    // await x.wait();

    // let storageValue = await simpleContract.get(); // this wil return storedData variable from smart contract
    // console.log(storageValue.toNumber());


    // // for Simple Coin Contract 
    // const [random,deployer] = await hre.ethers.getSigners(); // this will give random as well as deployers address
    // const accountBalance = await deployer.getBalance(); // balance of deployer

    // console.log("Deployer :", deployer.address);
    // console.log('Account balance: ', accountBalance.toString());

    // const coin = await hre.ethers.getContractFactory("Coin");
    // const coinContract = await coin.deploy();
    // await coinContract.deployed();
    // console.log("Random user : ",random.address);

    // const mintTxn = await coinContract.mint(deployer.address,1000); // this will mint the coin with quantity 1000
    // await mintTxn.wait();
    // console.log("mintTxn : ",mintTxn);

    // const sendTxn = await coinContract.mint(random.address,500); // this will send coin from mint address to random address
    // await sendTxn.wait();

    // console.log("SendTxn : ",sendTxn)
    // console.log("Random User : ",random)

    // // for Data type contract 
    // const dataType = await hre.ethers.getContractFactory("ValueTypes");
    // const dataTypeContract = await dataType.deploy();
    // await dataTypeContract.deployed();

    // console.log("Data type contract has been deployed", dataTypeContract);

    // let player1 = await dataTypeContract.addPlayer("Jay","P");
    // await player1.wait();

    // let player2 = await dataTypeContract.addPlayer("Ronak","J");
    // await player1.wait();

    // let playerData1 = await dataTypeContract.players(0);
    // console.log("Player 1",playerData1);

    // let playerData2 = await dataTypeContract.players(1); // this will add player to Players array
    // console.log("Player 2",playerData2);

    // // let playerData1 = await dataTypeContract.players(deployer.address);
    // // console.log("Player data:",playerData1)

    // let playerCount = await dataTypeContract.playerCount();// this will return value of variable playerCount
    // console.log("Player Count: ",playerCount.toNumber());

    // for Function Intro contract 
    const functionIntro = await hre.ethers.getContractFactory("FunctionIntro");
    const functionIntroContract = await functionIntro.deploy();
    functionIntroContract.deployed();

    let addFunction = await functionIntroContract.add(10,20);
    console.log(addFunction.toNumber());

    let subFunction = await functionIntroContract.sub(20,10);
    console.log(subFunction.toNumber());


    // for 8_Counter 
    const counter = await hre.ethers.getContractFactory("Counter");
    const counterContract = await counter.deploy();
    await counterContract.deployed();

    console.log("Count before increment",(await counterContract.Count()).toNumber());

    let countInc1 = await counterContract.incrementCount();
    await countInc1.wait();

    let countInc2 = await counterContract.incrementCount();
    await countInc2.wait();

    console.log("Count After Increment",(await counterContract.Count()).toNumber());

    let countDec1 = await counterContract.decrementCount();
    await countDec1.wait();

    console.log("Count after decrement",(await counterContract.Count()).toNumber());
}

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