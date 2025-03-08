# M36: Part 4 Solidity
## M36.2 Different types of Function


```
contract FunctionTypes {
    uint public score = 0;
    
    function setScore(uint newScore) public {
        score = newScore;
    }

    // if  we read any global variable inside function scope we have to use a keyword "view"
    function getScore() public view returns (uint){
        return score;
    }

    // if function return a value but does not use a global variable in function scope we have to use a keyword "pure"
    function addNumbers(uint a, uint b) public pure returns (uint){
        return a + b;
    }
}
```