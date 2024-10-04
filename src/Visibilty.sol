// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Visibility {
    string public pandit = "pandit";
    uint256 internal dada = 456;
    address private tara = msg.sender;

    function a() public view returns (string memory) {
        return pandit;
    }

    function b() private view returns(uint256) {
        return dada;
    }

    function c() internal returns(address) {
        return tara;
    }
}
