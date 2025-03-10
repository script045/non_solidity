# M39: Part 5 Solidity
## M39.4 NestedMapping




```
contract NestedMapping{
    mapping(address => uint) public balances;
    mapping(address => mapping(address => uint)) public allowances;


    function setAllowance(address spender, uint amount) public {
        allowances[msg.sender][spender] = amount; //owner -? Spender => Amount
    }

    // Get Allowance: allowances[owner][spender]


    function resetBalance() public {
        delete balances[msg.sender];
    }


    // Limitation : No iteration
}
```