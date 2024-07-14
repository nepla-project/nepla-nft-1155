require('dotenv').config();
const hre = require('hardhat');

async function main() {
  const Nft = await hre.ethers.getContractFactory('Nft');
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  })
