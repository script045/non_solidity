# M35.3 Comparison Operator


```
   contract InvestmentCalculator {
    function calculatorROI (uint investment, uint returnAmount) public pure returns(uint) {
        return (returnAmount *100) /investment;
    }

    function calculateInterest(uint principal, uint rate) public pure returns (uint){
        return (principal * rate)/100;
    }
}
```