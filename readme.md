# M40: Part 6 Solidity
## M40.4 Function Modifier



```
contract FunctionModifier {
    //Function Modifier -> Reusable condition
    //DRY - dont repeat yourself

    address public owner;

    constructor(){
        owner = msg.sender;
    }

    event UserRegistered (address userAddress, string name, uint timestamp);
    event PointsEarned(address user, uint points, string activity);

    struct User {
        string name;
        uint points;
        bool isRegistered;
    }

    mapping (address => User) public users;
    

    function userRegistration(string memory _name) public {
        require(msg.sender == owner, "You are not the owner, so you can't call this function");
        users[msg.sender] =User(_name, 0, true);

        //Emit the event - making the announcement
        emit UserRegistered(msg.sender, _name, block.timestamp);
    }


    function earnPoints(uint _points, string memory _activity) public {
        require(msg.sender == owner, "You are not the owner, so you can't call this function");

        users[msg.sender].points += _points;

        emit PointsEarned(msg.sender, _points, _activity);
    }
}
```

### now we use resuable function 

```
contract FunctionModifier {
    //Function Modifier -> Reusable condition
    //DRY - dont repeat yourself

    address public owner;

    constructor(){
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require (msg.sender == owner, "You are not the owner, so you cant call this function!"); 
         _;
    }

    event UserRegistered (address userAddress, string name, uint timestamp);
    event PointsEarned(address user, uint points, string activity);

    struct User {
        string name;
        uint points;
        bool isRegistered;
    }

    mapping (address => User) public users;
    

    function userRegistration(string memory _name) public onlyOwner {
        users[msg.sender] =User(_name, 0, true);
        //Emit the event - making the announcement
        emit UserRegistered(msg.sender, _name, block.timestamp);
    }


    function earnPoints(uint _points, string memory _activity) public onlyOwner{
        users[msg.sender].points += _points;
        emit PointsEarned(msg.sender, _points, _activity);
    }
}
```