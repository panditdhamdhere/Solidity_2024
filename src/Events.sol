// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract chatApp {
    event chat(address from, address to, string message);

    function sendMsg(address _to, string memory _msg) public {
        emit chat(msg.sender, _to, _msg);
    }
}
