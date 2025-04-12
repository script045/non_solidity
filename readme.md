# M46: Part 9 Solidity
## M46.1 Memory, Storage & CallData in Solidity


## Memodry Management & Storage
1. Storage: Permanently store the data
2. Memory: store data for short time
3. CallData: Function er parameter -> Readonly

### Storage
    - state variable jatogulo amra likhi, sobgula by default storage save hoy
    - Sobcheye beshi gas fee lage /kharoch hoy
    - key & pair hisebe data gula store hoi
    - slot -> 32 byte kore -> 256 bits
    
### Memory
    - function parameter by default Memory te thake
    - Storage er cheye ekhane gas fee kom lage
    - new keyword use kore data allocate korte pari


### CallData
    - change korte pari na
    - Reference type er janno useful
    - ekhane gas fee sobcheye kom lage

```
contract DataLocation{
    // State variables
    uint256 public storeData; //store in storage

    function setData(uint256 _data) public {

        //in storage
        storeData = _data;
    }


    //Memory 

    function manipulateArray(uint[] memory _array) public pure returns (uint[] memory){
        uint[] memory newArray = new uint[](_array.length);

        for(uint i=0; i<_array.length; i++) {
            newArray[i] = _array[i]*2;
        }

        return newArray;
    }

    //call data
    function processArray(uint256[] calldata _data) external pure returns (uint256){
        uint256 sum = 0;
        for(uint i = 0; i < _data.length; i++){
            sum += _data[i];
        }
        return sum;
    }
} 
```