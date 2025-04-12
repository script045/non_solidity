// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

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
