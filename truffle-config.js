const HDWalletProvider = require('@truffle/hdwallet-provider');
require('dotenv').config();

const mnemonic = process.env.MNEMONIC;
const amoyRpcUrl = process.env.AMOY_RPC_URL;  // 環境変数からAmoy TestnetのRPC URLを取得

module.exports = {
  networks: {
    amoy: {
      provider: () => new HDWalletProvider(mnemonic, amoyRpcUrl),
      network_id: 80002,  // Amoy TestnetのNetwork ID
      confirmations: 2,
      timeoutBlocks: 200,
      skipDryRun: true
    },
  },
  compilers: {
    solc: {
      version: "^0.8.0"
    }
  }
};
