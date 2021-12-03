require('@nomiclabs/hardhat-waffle')
const fs = require('fs')
const privateKey =
  fs.readFileSync('.env').toString().trim() || '01234567890123456789'

//require('dotenv').config()

task('accounts', 'Prints the list of accounts', async (taskArgs, hre) => {
  const accounts = await hre.ethers.getSigners()

  for (const account of accounts) {
    console.log(account.address)
  }
})

module.exports = {
  solidity: '0.8.4',
  networks: {
    hardhat: {
      chainId: 1337,
    },
    ropsten: {
      url: 'https://ropsten.infura.io/v3/d58a26d810744687b1cc15fc430fefa4',
      accounts: [privateKey],
      saveDeployments: true,
    },
  },
}
