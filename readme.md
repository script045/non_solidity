# M39: Part 5 Solidity
## M39.1 Array in solidity


Array can store same type data
string array can save string only 
number array can number only

Fixed sized array:
uint[3] public myArray = [2,4,6]

Dynamic Size Array
uint[] public myArray


```
contract Array{
    //fixed size array
    uint[3] public scores = [85, 80, 90];

    // dynamic size arrays
    uint[] public dynamicScores;

    function addScore(uint score) public {
        dynamicScores.push(score); // add a new number to the end
    }

    function getScore(uint index) public view returns (uint) {
        return dynamicScores[index];
    }
 
    function getNumberOfScores() public view returns (uint) {
        return dynamicScores.length;
    }

    function removeLastScode() public {
        dynamicScores.pop();
    }
}
```