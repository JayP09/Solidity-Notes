pragma solidity ^0.8.0;

/* 
# Gas - the fuel Ethereum DAppes run on
- In solidity, your users have to pay every time they execute a function on your Dapp using a currency called gas.
- Users buy gas with Ether( the currency on Ethereum), so your users have to spend ETH inorder to execute functions on your DApp.
- How much gas is require to execute a function depends on how complex that function's logic is. Each individual operation has a gas cost based roughly on how much computing resources will be required to perform that operation (e.g writing to storage is much more expensive than adding two integers).The total gas cost of your function is sum of the gas costs of all its individual operations.
- Because running functions costs real money for your users, code optimization is much more important in Ethereum than in other programming languages. If your code is sloppy, your users are going to have to pay a premium to execute your functions — and this could add up to millions of dollars in unnecessary fees across thousands of users.


Why is gas necessary ? 
- Ethereum is like a big, slow, but extremely secure computer. When you execute a function, every single node on the network needs to run that same function to verify its output — thousands of nodes verifying every function execution is what makes Ethereum decentralized, and its data immutable and censorship-resistant.


Struct Packing to save gas: 
- types of uints: uint8, uint16, uint32, etc.
- Normally there's no benefit to using these sub-types because Solidity reserves 256 bits of storage regardless of the uint size. For example, using uint8 instead of uint (uint256) won't save you any gas.
- But there's an exception to this: inside structs.
-  if you have multiple uintS inside a struct, using a smaller-sized uint when possible will allow solidity to pack these variables together to take up less storage.
- example: 
struct NormalStruct {
  uint a;
  uint b;
  uint c;
}

struct MiniMe {
  uint32 a;
  uint32 b;
  uint c;
}

// `mini` will cost less gas than `normal` because of struct packing
NormalStruct normal = NormalStruct(10, 20, 30);
MiniMe mini = MiniMe(10, 20, 30); 

- You'll also want to cluster identical data types together (i.e. put them next to each other in the struct) so that Solidity can minimize the required storage space. For example, a struct with fields uint c; uint32 a; uint32 b; will cost less gas than a struct with fields uint32 a; uint c; uint32 b; because the uint32 fields are clustered together.


# view functions don't cost gas: 
- view functions don't cost any gas when they are externally by a user.
- This is because view functions don't actually change anything on the blockchain – they only read the data. So marking a function with view tells web3.js that it only needs to query your local Ethereum node to run the function, and it doesn't actually have to create a transaction on the blockchain (which would need to be run on every single node, and cost gas).
- But for now the big takeaway is that you can optimize your DApp's gas usage for your users by using read-only external view functions wherever possible.
- Note: If a view function is called internally from another function in the same contract that is not a view function, it will still cost gas. This is because the other function creates a transaction on Ethereum, and will still need to be verified from every node. So view functions are only free when they're called externally.
*/