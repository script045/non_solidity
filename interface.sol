// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

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


//Contract that interacts with our token
contract TokenUser {
    IToken public token; //reference to token contract

    constructor(address tokenAddress){
        //store the address of the token contract
        token = IToken(tokenAddress);
    }

    // function to check balance;
    function checkBalance() external view returns(uint256){
        return token.getBalance(msg.sender);
    }

    //function to transfer tokens
    function transferTokens(address to, uint256 amount) external {
        require(token.transfer(to, amount), "Transfer failed");
    }
}

//Token  Excange contract using interface
contract TokenExchange {
    IToken public token1;
    IToken public token2;

    //exchange rate ( 1 token1 == rate token2
    uint256 public rate;

    constructor(address _token1, address _token2, uint256 _rate) {
        token1 = IToken(_token1);
        token2 = IToken(_token2);
        rate = _rate;
    }

    //Function to swap token
    function swapTokens(uint256 amount) external {
        //check sender's balance of token1
        require(token1.getBalance(msg.sender) >=amount, "Insufficient token1");

        //calculate token2 amount
        uint256 token2Amount = amount * rate;

        // transfer token1 from sender to contract
        require(token1.transfer(address(this), amount), "transger failed");

        //transfer token2 to sender
        require(token2.transfer(msg.sender, token2Amount), "transfer failed");

    }
}