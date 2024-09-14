# Ice Cream DEX

Ice Cream DEX is a decentralized exchange (DEX) designed to operate on the Fuel Network using the Sway smart contract language. Our platform aims to provide a secure, efficient, and intuitive decentralized trading experience.

## Overview

Ice Cream DEX comprises several core modules:

- **Token Management**: A contract for creating, transferring, and managing tokens.
- **Liquidity Management**: Manages liquidity pools for trading pairs.
- **Swap Functionality**: Facilitates token exchanges through available liquidity.
- **ICE DAO**: Governance framework allowing users to vote on proposals.
- **Staking**: Allows users to earn rewards by staking ICE tokens.
- **Multisig Security**: A multi-signature wallet for secure transaction approvals.

## Features

### Token Management
- **Token Creation**: Authorized entities can mint new ICE tokens.
- **Transfers**: Transfer tokens between accounts on the Fuel Network.
- **Supply Tracking**: Monitor the total supply of issued tokens.

### Liquidity Management
- **Providing Liquidity**: Add liquidity to token pairs and receive LP tokens.
- **Withdrawing Liquidity**: Remove liquidity and redeem LP tokens.
- **Liquidity Information**: Query pool status and token pair details.

### Swap Functionality
- **Token Exchange**: Swap tokens using the liquidity available in pools.
- **Slippage Control**: Set slippage limits to protect against price volatility.

### ICE DAO
- **Governance Proposals**: Create and submit proposals for DEX development.
- **Voting Mechanism**: Vote on proposals based on token holdings.
- **Proposal Execution**: Execute or reject proposals based on voting outcomes.

### Staking
- **Token Staking**: Stake ICE tokens to earn rewards.
- **Withdrawal**: Unstake tokens and claim rewards after the staking period.
- **Reward Claims**: Rewards based on staking duration and amount.

### Multisig Security
- **Transaction Initiation**: Propose transactions requiring multiple approvals.
- **Approval Process**: Obtain necessary signatory approvals before execution.
- **Execution**: Execute transactions post-approval.

## Getting Started

1. **Deploy Smart Contracts**: Deploy the following core modules on the Fuel Network:
   - Token Management
   - Liquidity Management
   - Swap Functionality
   - ICE DAO
   - Staking
   - Multisig Security

2. **Interact with Contracts**: Use the provided interfaces to:
   - Mint tokens
   - Manage liquidity
   - Stake tokens
   - Participate in governance

3. **Governance & Security**:
   - Create and vote on proposals via ICE DAO.
   - Use the multisig wallet for secure transaction processing.

## Security Features

- **Reentrancy Protection**: Safeguards against reentrancy attacks.
- **Safe Arithmetic**: Protects against overflow and underflow errors.
- **Multisig Approval**: Requires multiple approvals for sensitive transactions.

## Project Structure

- `token_contract.sw`: Manages token creation, transfer, and supply.
- `liquidity_pool_contract.sw`: Manages liquidity pools and LP tokens.
- `swap_contract.sw`: Handles token swapping within the DEX.
- `dao_contract.sw`: Facilitates governance through proposals and voting.
- `staking_contract.sw`: Manages token staking and rewards.
- `multisig_wallet_contract.sw`: Implements multi-signature functionality.

## License

Ice Cream DEX is an open-source project released under the MIT License.

---

For more details or to contribute, please visit our [GitHub repository](https://github.com/your-repo-link).

