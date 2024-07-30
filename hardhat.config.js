require("@nomiclabs/hardhat-waffle");
require("@nomicfoundation/hardhat-verify");
require("dotenv").config();

/**
 * @type import('hardhat/config').HardhatUserConfig
 */
module.exports = {
  defaultNetwork: "amoy",
  networks: {
    polygon: {
      url: process.env.POLYGON_RPC_ENDPOINT,
      accounts: [process.env.POLYGON_PRIVATE_KEY],
      chainId: 137,
      gas: "auto",
      gasPrice: "auto"
    },
    amoy: {
      url: process.env.AMOY_RPC_ENDPOINT,
      accounts: [process.env.AMOY_PRIVATE_KEY],
      chainId: 80002,
      gas: "auto",
      gasPrice: "auto"
    }
  },
  etherscan: {
    apiKey: {
      polygonAmoy: process.env.POLYGONSCAN_KEY,
    }
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