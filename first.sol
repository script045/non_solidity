// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract FunctionModifier {
    //Function Modifier -> Reusable Condition

    event UserRegistered (address userAddress, string name, uint timestamp);
    event PointsEarned(address user, uint points, string activity);

    struct User {
        string name;
        uint points;
        bool isRegistered;
    }

    mapping (address => User) public users;
    

    function userRegistration(string memory _name) public {
        require(!users[msg.sender].isRegistered,"User already registered");
        users[msg.sender] =User(_name, 0, true);

        //Emit the event - making the announcement
        emit UserRegistered(msg.sender, _name, block.timestamp);
    }


    function earnPoints(uint _points, string memory _activity) public {
        require(users[msg.sender].isRegistered,"User not registered");

        users[msg.sender].points += _points;

        emit PointsEarned(msg.sender, _points, _activity);
    }
}