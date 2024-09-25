// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Loops {
    function LoopsExample() public pure {
        // for loop
        for (uint256 i = 0; i < 10; i++) {
            if (i == 3) {
                // exit loop with break
                continue;
            }
            if (i < 5) {
                break;
            }
        }

        // while loop
        uint256 p = 0;

        while (p < 10) {
            p++;
        }
    }
}
