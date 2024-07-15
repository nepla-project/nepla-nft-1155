require('dotenv').config();
const hre = require('hardhat');

async function main() {
  const NeplaNft = await hre.ethers.getContractFactory('NeplaNft');
  const neplaNft = await NeplaNft.deploy(process.env.NFT_NAME, process.env.NFT_SYMBOL, process.env.OWNER_ADDRESS);

  await neplaNft.deployed();

  console.log(`NEPLA NFT contract has been deployed : ${neplaNft.address}`);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  })
