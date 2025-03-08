# M36: Part 4 Solidity
## M36.3 Create a Simple Bank Using Function


```
contract SimpleBank{
    uint public balance = 0;
    
    // deposite, withdraw, get balance

    function deposit(uint amount) public {
        balance += amount;
    }

    function withdraw(uint amount) public {
        require(balance >= amount, "Not enough balance");
        balance -= amount;
    }

    function checkBalance() public view returns (uint) {
        return balance;
    }
}
```