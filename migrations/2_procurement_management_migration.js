const ProcurementManagement = artifacts.require('ProcurementManagement');

module.exports = function(deployer) {
  deployer.deploy(ProcurementManagement);
};
