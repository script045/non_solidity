# M47: Part 10 Solidity
## M47.1 Advance Pattern


```
contract AdvancePattern{
    struct UserProfile {
        string name;
        uint256 balance;
        bool active;
    }

    //storage data
    mapping(address => UserProfile) private profiles;
    address[] private userList;

    function addUser(address[] calldata _users, string[] calldata _names) external {
        require(_users.length == _names.length, "Arrays must be same length" );

        for (uint256 i =0; i < _users.length; i++) {
            profiles[_users[i]] = UserProfile({
                name: _names[i],
                balance: 0,
                active:true
            });
            userList.push(_users[i]);
        }
    }

    function updateBalance(uint256 amount) external {
        UserProfile[] memory activeUsers = new UserProfile[] (userList.length);
        uint256 activeCount = 0;

        //Storage theke copy kortechi memoryte , selectively

        for(uint256 i=0; i<userList.length; i++){
            if(profiles[userList[i]].active) {
                activeUsers[activeCount] = profiles[userList[i]];
                activeCount++;
            }
        }

        // Processing in memory
        for (uint256 i = 0; i<activeCount; i++){
            activeUsers[i].balance += amount; 
        }

        //From memory to storage update
        for (uint256 i=0; i < activeCount; i++){
            address userAddress = userList[i];
            if (profiles[userAddress].active){
                profiles[userAddress].balance = activeUsers[i].balance;
            }
        }
    }

    //Storage theke read kore, then memory te gie ami return korbo
    function getActiveUsers() external view returns (address[] memory, string[] memory){
        uint256 activeCount = 0;
        for(uint256 i=0; i < userList.length; i++){
            if(profiles[userList[i]].active){
                activeCount++;
            }
        }

        //createing array in memory
        address[] memory activeAddress = new address[](activeCount);
        string[] memory activeNames = new string[](activeCount);

        uint256 currrentIndex = 0;
        for(uint256 i=0; i<userList.length; i++){
            if(profiles[userList[i]].active){
                activeAddress[currrentIndex] = userList[i];
                activeNames[currrentIndex] = profiles[userList[i]].name;
                currrentIndex++;
            }
        }
        return (activeAddress, activeNames);
    }

    //
    function processLargeArray(uint256[] calldata data) external pure returns (uint256) {
        uint256 result = 0;
        for (uint256 i=0; i <data.length; i++){
            result +=data[i];
        }
        return result;
    }

}
```