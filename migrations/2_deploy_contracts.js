const MyToken = artifacts.require("MyToken");

module.exports = function(deployer) {
    deployer.deploy(MyToken, "1000000000000000000000");  // 1000トークンをデプロイ
};
