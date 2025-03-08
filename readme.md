# M35: Part 3 Solidity
## M35.4 Building a grading system


```
contract GradingSystem {
    mapping(address => uint) public scores;

    function addScore(uint score) public {
        require(score <= 100, "Score must be between 0 to 100");
        scores[msg.sender] = score;
    }

    //get letter grade based on scores

    function getLetterGrade() public view returns (string memory){
        uint score = scores[msg.sender];

        if(score >= 80){
            return "A+";
        } else if (score >= 70) {
            return "A";
        } else if (score >= 60) {
            return "B";
        } else {
            return "F";
        }
    }

    //calculate if student passed or not 
    function hasPassed() public view returns(bool){
        return scores[msg.sender] >= 70;
    }

}
```