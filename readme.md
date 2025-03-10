# M39: Part 5 Solidity
## M39.3 Mapping




```
contract Mapping {
    // key-value store
    // key:value

    //// declearing mapping
    // mapping (keyType=>valueType) public mappingName;

    mapping(address => uint) public balances;

    //nested mapping
    mapping(address => mapping(address => uint)) public allowances;

    function updateBalance(uint newBalance) public {
        balances[msg.sender] = newBalance;
    }

    function getBalance(address user) public view returns (uint){
        return balances[user];
    }
}
```