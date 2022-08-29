var Migrations = artifacts.require("./Migrations.sol");

module.exports = function(deployer) {
  deployer.deploy(Migrations);
};

/* This handles deploying Migrations.sol contract to observe subsequent smart contract migrations, 
and ensures we dont double-migrate unchanged contracts in the future
*/
