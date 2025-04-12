// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


// contract demnestration event handling


interface ITokenWithEvents {
    event Transfer(address indexed from, address indexed to, uint256 amount);
    function transfer(address to, uint256 amount) external returns (bool);
}

contract EventListener{
    struct Transfer {
        address from;
        address to;
        uint256 amount;
        uint256 timestamp;
    }
    Transfer[] public transfers;

    //Listen to transfer events
    event TransferMade(address from, address to, uint256 amount, uint256 timestamp);

    function makeTransfer(address tokenAddress, address to, uint256 amount) external {
        ITokenWithEvents token = ITokenWithEvents(tokenAddress);
        require(token.transfer(to, amount), "Transfer Failed");

        //Store transfer details

        transfers.push(Transfer(
            msg.sender,
            to,
            amount,
            block.timestamp
        ));

        emit TransferMade(msg.sender, to, amount, block.timestamp);
    }
}