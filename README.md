# Ice Cream DEX (Decentralized Exchange) Project

## Overview
Ice Cream DEX is a fully featured decentralized exchange (DEX) built on the Fuel Network using the Sway smart contract language. The DEX is designed to offer users a seamless, secure, and efficient decentralized trading experience. Ice Cream DEX includes the following core modules:

- **Token Module**: An ERC-20-like token contract for minting, transferring, and managing tokens.
- **Liquidity Pool Module**: Manages liquidity pools, allowing users to add or remove liquidity for token pairs.
- **Swap Module**: Facilitates token swaps using the liquidity provided in the pools.
- **ICE DAO**: Users can participate in governance by voting on proposals using their tokens.
- **Staking Module**: Users can stake ICE tokens to earn rewards and incentives.
- **Multisig Wallet**: A multi-signature wallet that requires approvals from multiple users for secure transactions.

## Features

### Token Module
- **Minting**: Only authorized accounts (typically the contract owner) can mint new ICE tokens.
- **Transfers**: Users can transfer tokens to other accounts on the Fuel Network.
- **Total Supply**: The contract keeps track of the total supply of tokens minted and distributed.

### Liquidity Pool Module
- **Add Liquidity**: Users can add liquidity to token pairs, earning liquidity provider (LP) tokens in return.
- **Remove Liquidity**: Users can withdraw their liquidity and reclaim their LP tokens.
- **Liquidity Query**: The state of the liquidity pools can be queried to track liquidity levels and pair information.

### Swap Module
- **Token Swaps**: Users can seamlessly swap between different tokens using the available liquidity.
- **Slippage Protection**: Swaps are protected by user-defined slippage limits to ensure the best trade execution without losses due to price volatility.

### ICE DAO
- **Proposal Creation**: Any user holding a sufficient number of ICE tokens can create governance proposals to influence the direction of the DEX.
- **Voting**: Token holders can vote on proposals proportional to their token holdings.
- **Proposal Finalization**: After the voting period, proposals are either accepted or rejected based on the majority vote, with actions executed accordingly.

### Staking Module
- **Stake Tokens**: Users can lock up their ICE tokens to earn staking rewards over time.
- **Unstake Tokens**: After a specified staking period, users can withdraw their tokens and claim any earned rewards.
- **Claim Rewards**: Stakers can claim rewards based on their contribution to the staking pool and the duration of their stake.

### Multisig Wallet
- **Transaction Submission**: Multiple owners can submit transactions that require approval by a predefined number of signers.
- **Transaction Approval**: Other owners must approve the transaction before execution.
- **Transaction Execution**: Once the required number of approvals is obtained, the transaction is executed.

## How to Use
1. **Deploy Contracts**: Deploy the core modules (Token, Liquidity Pool, Swap, DAO, Staking, and Multisig Wallet) on the Fuel Network.
2. **Interact with Contracts**: Use the provided interfaces and functions to mint tokens, provide liquidity, stake tokens, and manage DAO governance.
3. **Governance & Multisig**: Propose and vote on changes through the DAO, or execute sensitive operations using the multisig wallet for additional security.

## Security Features
- **Reentrancy Guard**: Ensures that token transfers and other sensitive operations are protected from reentrancy attacks.
- **Safe Math**: Arithmetic operations in the contracts are safeguarded against overflow and underflow errors.
- **Multisig Transaction Approval**: Sensitive transactions require multiple approvals, adding an extra layer of security against unauthorized actions.

## Project Structure
- `token_contract.sw`: Smart contract for token minting, transfers, and total supply tracking.
- `liquidity_pool_contract.sw`: Manages liquidity pools for token pairs and liquidity providers.
- `swap_contract.sw`: Handles token swaps within the DEX.
- `dao_contract.sw`: Facilitates governance through proposals and token-based voting.
- `staking_contract.sw`: Allows users to stake ICE tokens and earn rewards.
- `multisig_wallet_contract.sw`: Implements multi-signature functionality for secure transaction execution.

## License
Ice Cream DEX is an open-source project available under the MIT License.
