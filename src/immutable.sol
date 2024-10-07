// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Immutable {
    address public immutable owner;

    // address public constant owner1 = msg.sender;

    constructor(address _owner) {
        owner = _owner;
    }

    function check() public {
        // owner = msg.sender;
    }
}
