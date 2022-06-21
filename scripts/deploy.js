const { ethers } = require("hardhat");

async function main() {
  /*
        A ContractFactory in ethers.js is an abstraction used to deploy new smart contracts,
        so whitelistContract here is a factory for instances of our Whitelist contract.
  */

  const contract = await ethers.getContractFactory("Whitelist");

  // Deloy contract
  const deployedContract = await contract.deploy(10);

  await deployedContract.deployed();

  console.log("Whitelist Contract Address:", deployedContract.address);
}

// Call main function

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
