contract IceCreamLiquidityPool {
    storage {
        liquidity: b256 => (u64, u64),
        liquidity_providers: b256 => b256[],
    }

    abi IIceCreamLiquidityPool {
        fn provide_liquidity(token_a: b256, token_b: b256, amount_a: u64, amount_b: u64);
        fn remove_liquidity(token_a: b256, token_b: b256) -> (u64, u64);
        fn get_liquidity(token_a: b256, token_b: b256) -> (u64, u64);
    }

    impl IIceCreamLiquidityPool for Contract {
        fn provide_liquidity(token_a: b256, token_b: b256, amount_a: u64, amount_b: u64) {
            let (current_a, current_b) = self.liquidity[(token_a, token_b)];

            self.liquidity[(token_a, token_b)] = (current_a + amount_a, current_b + amount_b);
            self.liquidity_providers[(token_a, token_b)].push(msg_sender());
        }

        fn remove_liquidity(token_a: b256, token_b: b256) -> (u64, u64) {
            let caller = msg_sender();
            assert(self.liquidity_providers[(token_a, token_b)].contains(caller), "Unauthorized to remove liquidity");

            let (reserve_a, reserve_b) = self.liquidity[(token_a, token_b)];
            self.liquidity[(token_a, token_b)] = (0, 0);
            (reserve_a, reserve_b)
        }

        fn get_liquidity(token_a: b256, token_b: b256) -> (u64, u64) {
            self.liquidity[(token_a, token_b)]
        }
    }
}
