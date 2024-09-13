contract IceCreamSwap {
    storage {
        liquidity_pool: IIceCreamLiquidityPool,
    }

    abi IIceCreamSwap {
        fn swap(token_a: b256, token_b: b256, amount_in: u64, min_amount_out: u64) -> u64;
    }

    impl IIceCreamSwap for Contract {
        fn swap(token_a: b256, token_b: b256, amount_in: u64, min_amount_out: u64) -> u64 {
            let (reserve_a, reserve_b) = self.liquidity_pool.get_liquidity(token_a, token_b);
            let amount_out = (amount_in * reserve_b) / (reserve_a + amount_in);

            assert(amount_out >= min_amount_out, "Slippage limit exceeded in Ice Cream Swap");

            self.liquidity_pool.provide_liquidity(token_a, token_b, amount_in, -amount_out);
            emit Swap(msg_sender(), token_a, token_b, amount_in, amount_out);
            amount_out
        }
    }
}
