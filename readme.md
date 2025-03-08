# M36: Part 4 Solidity
## M36.4 Building a student grade calculator


```
contract GeadeCalculator{
    // 3 subject, we calculate average, average marks > 60, attendance > 20 days

    function calculateAverage(uint mark1, uint mark2, uint mark3) public pure returns (uint ){
        return (mark1+mark2+mark3)/3;
    }

    function didPassCourse (uint average, uint attendaceDays) public pure returns (bool){
        return (average >= 60 && attendaceDays >= 20);
    }

}
```