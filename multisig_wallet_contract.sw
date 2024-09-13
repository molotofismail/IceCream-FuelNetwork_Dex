contract IceCreamMultisigWallet {
    storage {
        owners: b256[],
        approvals: u64 => b256[],
        threshold: u64,
        transactions: u64 => Transaction,
    }

    struct Transaction {
        to: b256,
        amount: u64,
        executed: bool,
    }

    abi IIceCreamMultisigWallet {
        fn submit_transaction(to: b256, amount: u64);
        fn approve_transaction(tx_id: u64);
        fn execute_transaction(tx_id: u64);
    }

    impl IIceCreamMultisigWallet for Contract {
        fn submit_transaction(to: b256, amount: u64) {
            let caller = msg_sender();
            assert(self.owners.contains(caller), "Only owners can submit transactions in Ice Cream DEX Multisig Wallet");

            let tx_id = self.transactions.size();
            self.transactions[tx_id] = Transaction { to, amount, executed: false };
            self.approvals[tx_id] = [caller];
        }

        fn approve_transaction(tx_id: u64) {
            let caller = msg_sender();
            assert(self.owners.contains(caller), "Only owners can approve in Ice Cream DEX Multisig Wallet");
            assert(!self.approvals[tx_id].contains(caller), "Transaction already approved by this owner");

            self.approvals[tx_id].push(caller);
        }

        fn execute_transaction(tx_id: u64) {
            let transaction = self.transactions[tx_id];
            assert(!transaction.executed, "Transaction already executed in Ice Cream DEX Multisig Wallet");
            assert(self.approvals[tx_id].size() >= self.threshold, "Not enough approvals to execute the transaction");

            Token::transfer(transaction.to, transaction.amount);
            transaction.executed = true;
        }
    }
}
