const Escrow = artifacts.require("Escrow");

module.exports = async function(deployer, network, accounts) {
    // const escrow = await Escrow.deployed();
    // await escrow.increase(10);
    const agentAddress = accounts[0];
    deployer.deploy(Escrow, agentAddress);
};