const Provider = artifacts.require('Provider.sol');

module.exports = function(deployer) {
  deployer.deploy(Provider);
};
