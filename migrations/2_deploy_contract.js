const ERC20 = artifacts.require("./ERC20.sol")
const ERC20Token = artifacts.require("./ERC20Token.sol")
const Voting = artifacts.require("./Voting.sol")

module.exports = function(deployer) {
	deployer.deploy(ERC20Token, "Loopring", "LRC", 18, 100000000000000000000000000, "0x4bc0eb37b2e2a4e2d89955ff58a2c2ce781fcc9b").then(() => {
    	return deployer.deploy(Voting, ERC20Token.address, ["charge","free"]);
    });
};
