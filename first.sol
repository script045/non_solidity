// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract Function {
    uint public counter = 0;
    function increment() public {
        counter += 1;
    }
}