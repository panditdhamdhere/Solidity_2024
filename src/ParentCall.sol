// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

contract A {
    event loged(string _name, uint256 _age);

    function Fun1() public {
        emit loged("Pandit", 25);
    }

    function Fun2() public pure returns (string memory) {
        return "dada";
    }
}

contract B {}

contract C {}

contract D {}
