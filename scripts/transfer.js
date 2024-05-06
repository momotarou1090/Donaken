const MyToken = artifacts.require("MyToken");

module.exports = async function(done) {
    const accounts = await web3.eth.getAccounts();
    const token = await MyToken.deployed();
    const recipient = '0xc032bA925b7cA55B6a027162cC56D80E1A2E1D29'; // 送金先アドレス
    const amount = web3.utils.toWei('10', 'ether');

    async function attemptTransfer(retries = 3, delay = 1000) {
        try {
            const receipt = await token.transfer(recipient, amount, {from: accounts[0]});
            console.log('Transfer successful:', receipt);
            done();
        } catch (error) {
            if (retries === 0) {
                console.error('Transfer failed after retries:', error);
                done();
            } else {
                console.log(`Waiting ${delay}ms to retry...`);
                setTimeout(() => {
                    attemptTransfer(retries - 1, delay * 2); // delayを倍にして再試行
                }, delay);
            }
        }
    }

    attemptTransfer();
};

