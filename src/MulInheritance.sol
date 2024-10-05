// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract A {
    uint256 public a;

    constructor() {
        a = 100;
    }

    function funA() public {
        a = 10;
    }
}

contract B {
    uint256 public b;

    constructor() {
        b = 100;
    }

    function funB() public {
        b = 10;
    }
}

contract C is A, B {}
