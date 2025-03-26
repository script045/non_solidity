# M43: Part 7 Solidity
## M43.3 Error Handling in Solidity



```
contract ErrorHandling {
    // require()
    // revert()
    // assert()

    // require -> sequirity guard 
    mapping(address=>uint) public balances;

    function transferTokens(address to, uint amount) public {
        require (amount > 0, "Cannot transfer zero tokens");

        require(balances[msg.sender] >= amount, "Not enoguh tokens");

        balances[msg.sender] -= amount;
        balances[to] += amount;
    }
    //remaining gas will be return if fail


    // revert -> emergency stop button

    uint public maxTransactionLimit = 100;

    function processLargeTransaction(uint amount) public {
        if (amount > maxTransactionLimit ){
            revert("Transaction is too large");
        }
        balances[msg.sender] -= amount;
    }

    //remaining gas will be return if fail
}
```

```
contract Bank {
    // consume all gas when fails

    uint public totalDeposits;

    function deposite(uint amount) public {
        uint oldTotal = totalDeposits;
        totalDeposits += amount;

        // Make sure our math is correct
        assert(totalDeposits >= oldTotal);
    }

    function withdraw(uint amount) public {
        uint oldBalance = totalDeposits;
        totalDeposits -= amount;
    
        // Make sure our math is correct
        assert(totalDeposits <= oldBalance);
    }
}

```