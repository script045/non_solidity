// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract TodoList{
    struct Task {
        string content;
        bool completed;
    }

    Task[] public tasks;

    // add a new task
    function addTask(string memory _content) public {
        tasks.push(Task(_content, false));
    }

    //mark task as completed
    function completeTask(uint taskIndex) public {
        require(taskIndex < tasks.length, "The task does not exist");
        tasks[taskIndex].completed = true;
    }

    //get the task
    function getTask(uint taskIndex) public view returns (string memory content, bool completed) {
        require(taskIndex < tasks.length, "The task does not exist");
        Task storage task = tasks[taskIndex];
        return (task.content, task.completed);
    }

    // memory is temporay memory
    // storage is permanent memory
}