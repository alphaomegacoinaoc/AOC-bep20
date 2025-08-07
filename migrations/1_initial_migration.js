const { deployProxy, upgradeProxy } = require('@openzeppelin/truffle-upgrades');

const AOC_BEP_DEV = artifacts.require("AOC_BEP_DEV");
const AOC_BEP = artifacts.require("AOC_BEP");
const AOC = artifacts.require("AOC");
const AOC_V2 = artifacts.require("AOC_V2");

module.exports = async function(deployer, network, accounts) {
  if(network === "testnet" || network === "development" || network === "rinkeby") {
    await deployer.deploy(AOC_BEP_DEV);
    // await deployProxy(AOC_V2, { deployer, kind: "uups" });
  }

  if(network === "shasta") {
    await deployer.deploy(AOC);
  }
};
