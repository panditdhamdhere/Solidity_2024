// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

contract Modifier {

    address public owner = msg.sender;

    modifier onlyOwner() {
        require(owner == msg.sender, "you are not the owner");
        _;
    }

    function addEth() public onlyOwner {
// eth added
    }
}
