# M44: Part 8 Solidity
## M44.1 Introduction to Interface



```
interface IToken {
    // declear functions without implementation
    function getBalance(address account) external view returns(uint256);
    function transfer(address to, uint256 amount) external returns(bool);
    function mint(address to, uint256 amount) external;
    
}

contract MyToken is IToken {
    mapping(address => uint256) private balances;
    address public owner;
     
     constructor(){
         owner = msg.sender;
     }

     function getBalance(address account) external view override returns (uint256){
        return balances[account];
     }

     function transfer(address to, uint256 amount)  external override  returns (bool){
        require(balances[msg.sender] >= amount, "Insufficient Balance");
        balances[msg.sender] -= amount;
        balances[to] += amount;

        return true;
     }

     function mint(address to, uint256 amount) external override {
            require(msg.sender == owner, "Only owner can mint");
            balances[to] += amount;
     }
}

```