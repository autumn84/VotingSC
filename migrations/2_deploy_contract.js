const Wrestling = artifacts.require("./Voting.sol")

module.exports = function(deployer) {
    deployer.deploy(Voting);
};
