# M43: Part 7 Solidity
## M43.1 Inheritance in Solidity



```
contract Animal {
    string public species;
    function makeSound() public pure virtual returns (string memory) {
        return "...";
    }
}

contract Dog is Animal{
    constructor(){
        species = "Dog";
    }
    function makeSound() public pure override returns (string memory){
        return "Woof";
    }
}
```