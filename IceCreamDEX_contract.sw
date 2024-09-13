contract IceCreamDAO {
    storage {
        proposals: u64 => Proposal,
        votes: u64 => (b256 => u64),
        owner: b256,
    }

    struct Proposal {
        description: str[100],
        total_votes_for: u64,
        total_votes_against: u64,
        is_active: bool,
    }

    abi IIceCreamDAO {
        fn create_proposal(description: str[100]);
        fn vote(proposal_id: u64, vote_for: bool);
        fn finalize_proposal(proposal_id: u64) -> bool;
    }

    impl IIceCreamDAO for Contract {
        fn create_proposal(description: str[100]) {
            let caller = msg_sender();
            assert(caller == self.owner, "Only owner can create proposals in Ice Cream DEX");

            let proposal_id = self.proposals.size();
            self.proposals[proposal_id] = Proposal {
                description: description,
                total_votes_for: 0,
                total_votes_against: 0,
                is_active: true,
            };
        }

        fn vote(proposal_id: u64, vote_for: bool) {
            let caller = msg_sender();
            let balance = Token::balance_of(caller);
            assert(self.proposals[proposal_id].is_active, "Proposal is not active in Ice Cream DEX");

            if vote_for {
                self.proposals[proposal_id].total_votes_for += balance;
            } else {
                self.proposals[proposal_id].total_votes_against += balance;
            }

            self.votes[proposal_id][caller] = balance;
        }

        fn finalize_proposal(proposal_id: u64) -> bool {
            let caller = msg_sender();
            assert(caller == self.owner, "Only owner can finalize proposals in Ice Cream DEX");

            let proposal = self.proposals[proposal_id];
            proposal.is_active = false;

            if proposal.total_votes_for > proposal.total_votes_against {
                return true;
            } else {
                return false;
            }
        }
    }
}
