// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Todos {
    struct Todo {
        string text;
        bool completed;
    }

    // An array of 'Todo' structs
    Todo[] public todos;

    // function

    function create(string calldata text) public {
        // 3 ways to initialize a struct
        // - calling it like a function
        todos.push(Todo(text, false));

        // key value mapping
        todos.push(Todo({text: text, completed: false}));

        // initialize an empty struct and then update it
        Todo memory todo;
        todo.text = text;
        // todo.completed initialized to false
        todos.push(todo);
    }

    // Solidity automatically created a getter for 'todos' so
    // you don't actually need this function./

    function get(
        uint256 index
    ) public view returns (string memory text, bool completed) {
        Todo storage todo = todos[index];
        return (todo.text, todo.completed);
    }

    // update text

    function update(uint256 index, string calldata text) public {
        Todo storage todo = todos[index];
        todo.text = text;
    }

    // update completed
    function toggleCompleted(uint256 _index) public {
        Todo storage todo = todos[_index];
        todo.completed = !todo.completed;
    }
}
