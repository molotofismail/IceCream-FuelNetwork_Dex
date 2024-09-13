contract IceCreamStaking {
    storage {
        stakes: b256 => u64,
        rewards: b256 => u64,
        total_staked: u64,
        reward_rate: u64,
        stake_time: b256 => u64, // Track the time when each user staked their tokens
    }

    abi IIceCreamStaking {
        fn stake(amount: u64);
        fn unstake() -> u64;
        fn claim_rewards() -> u64;
    }

    impl IIceCreamStaking for Contract {
        fn stake(amount: u64) {
            let caller = msg_sender();
            let balance = Token::balance_of(caller);
            assert(balance >= amount, "Insufficient balance to stake");

            Token::transfer_from(caller, env::contract_address(), amount);
            let current_time = env::current_timestamp(); // Assuming current_timestamp() returns the current block time in seconds

            if self.stakes.contains(caller) {
                // Existing stake, update the amount and record the new stake time
                self.stakes[caller] += amount;
                self.stake_time[caller] = current_time;
            } else {
                // New stake
                self.stakes[caller] = amount;
                self.stake_time[caller] = current_time;
            }
            self.total_staked += amount;
        }

        fn unstake() -> u64 {
            let caller = msg_sender();
            let stake_amount = self.stakes[caller];
            assert(stake_amount > 0, "No staked amount to unstake");

            let rewards = self.claim_rewards(); // Calculate rewards before unstaking
            self.stakes[caller] = 0;
            self.total_staked -= stake_amount;

            Token::transfer(caller, stake_amount + rewards);
            stake_amount + rewards
        }

        fn claim_rewards() -> u64 {
            let caller = msg_sender();
            let stake_amount = self.stakes[caller];
            let current_time = env::current_timestamp(); // Assuming current_timestamp() returns the current block time in seconds
            let time_staked = current_time - self.stake_time[caller];
            
            // Calculate rewards based on staking time and reward rate
            let reward = (stake_amount * self.reward_rate * time_staked) / 100; // Assuming reward_rate is per second
            self.rewards[caller] += reward;
            reward
        }
    }
}
