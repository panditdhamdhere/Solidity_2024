// SPDX-License-Identifier: MIT
// This is License we have to define //

pragma solidity ^0.8.25; // => This is solidity compiler version

contract Hello {
    string public Hey = "Hi I am Pandit";
    uint256 public number = 4;
    // this predefined data in state variables

    string public Hi;
    uint256 public num;

    // update data using constructor => run only once
    constructor(string memory _Hi, uint256 _num) {
        Hi = _Hi;
        num = _num;
    }

    // update using functions
    function Addinfo(string memory _Hey, uint256 _number) public {
        Hey = _Hey;
        number = _number;
    }
}
