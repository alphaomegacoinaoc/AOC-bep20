const { deployProxy, upgradeProxy } = require('@openzeppelin/truffle-upgrades');

// development
const AOC_BEP_DEV = artifacts.require("AOC_BEP_DEV");
const AOC_ERC20_DEV = artifacts.require("AOC_ERC20_DEV");

// upgradable contracts
const AOC_BEP = artifacts.require("AOC_BEP");
const AOC_ERC20 = artifacts.require("AOC_ERC20");
const AOC = artifacts.require("AOC");

module.exports = async function(deployer, network, accounts) {
  if(network === "testnet" || network === "development") {
    // await deployer.deploy(AOC_BEP_DEV);
    await deployProxy(AOC_BEP, { deployer, kind: "uups" });
  }

  if(network === "shasta") {
    await deployer.deploy(AOC);
  }

  if(network === "rinkeby") {
    // await deployer.deploy(AOC_ERC20_DEV);
    await deployProxy(AOC_ERC20, { deployer, kind: "uups" });
  }

  if(network === "smartchain") {
    await deployProxy(AOC_BEP, { deployer, kind: "uups" });
  }
};
