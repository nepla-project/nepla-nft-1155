# nepla-nft-721

## ENV

```bash
npm install
cp .env.sample .env
vi .env
```

## Deploy

```bash
npx hardhat run --network amoy "scripts/deploy.js"
npx hardhat run --network polygon "scripts/deploy.js"
```

### Verify

```bash
npx hardhat verify --constructor-args arguments.js --contract "contracts/NeplaNft.sol:NeplaNft" --network amoy {CONTRACT_ADDRESS}
npx hardhat verify --constructor-args arguments.js --contract "contracts/NeplaNft.sol:NeplaNft" --network polygon {CONTRACT_ADDRESS}
```