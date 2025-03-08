# M35.1 Mathematical Operations



```
    uint public score = 0;

    //Addition
    function addToScore(uint points) public {
        score = score+points; // DRY _ Dont Repeat Yourself
        // score += points;
    } 

    //Multiplication
    function multiplyScore(uint number) public {
        score = score*number;
        // score *= number;
    }

    //Substraction
    function subtractFunction(uint points) public {
        require(score >= points, "score cannot be negative");
        score = score - points;
    }

    //Division
    function dividedScore(uint number) public {
        require(number > 0, "Cannot divide by zero");
        score = score/number;
    }
```