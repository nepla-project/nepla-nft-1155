require("@nomiclabs/hardhat-waffle");
require("@nomicfoundation/hardhat-verify");
require("dotenv").config();

/**
 * @type import('hardhat/config').HardhatUserConfig
 */
module.exports = {
  defaultNetwork: "mumbai",
  networks: {
    polygon: {
      url: process.env.POLYGON_RPC_ENDPOINT,
      accounts: [process.env.POLYGON_PRIVATE_KEY],
      chainId: 137,
      gas: "auto",
      gasPrice: "auto"
    },
    mumbai: {
      url: process.env.MUMBAI_RPC_ENDPOINT,
      accounts: [process.env.MUMBAI_PRIVATE_KEY],
      chainId: 80001,
      gas: "auto",
      gasPrice: "auto"
    }
  },
  polygonscan: {
    apiKey: process.env.POLYGONSCAN_KEY
  },
  paths: {
    sources: "./contracts",
    cache: "./cache",
    artifacts: "./artifacts"
  },
  solidity: {
    version: "0.8.26",
    settings: {
      optimizer: {
        enabled: true,
        runs: 200
      }
    }
  }
};