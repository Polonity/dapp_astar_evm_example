# dapp_astar_evm_example

A Flutter increment value project with smart contract on Astar local.

## Getting Started

### Prepaire

You should run astar-collator in your local network.

```sh
./astar-collator --dev --tmp
```

deploy './assets/solidity/counter.sol' to astar local network on hardhat or remix.

You copy your smart contract address to here
'./lib/configs/config.dart' -> contractAddress.

```sh
・・・
const contractAddress = "paste your contract address here";
・・・
```

build this repository.

```sh
flutter run -d web-server
```

And access in chrome(should be working metamask wallet extension).

![picture 1](images/f922b77ee51b19d3ab7f6b6c02381a727c08afbb73d57baf94d86c71ed12a32e.png)  

### Connect metamask wallet

You got this page, and metamask wake up.

![picture 2](images/913ddca6e09b70cef485a60fd37cdab5a4bfe6454d6f582bda53382073249f9a.png)  
![picture 5](images/5dc3c8322c9bb770ceaecf19c2492cf8cd48bd29818e5742b344b3765c8a67dc.png)  
![picture 4](images/61386893ae6114953eae4d656d3b920eaf0ecbfe56578690f54eb4f79d39efdc.png)  

Connected to your wallet!

![picture 7](images/5e5865a7e866ad40e9ecb5ffe98e50c545ff57370c2def6a6dad05776076b427.png)  

### DEMO incrementer(Contract call)

If you have connected to your wallet, you can call increment smart contract.

![picture 7](images/incrementer.gif)  
