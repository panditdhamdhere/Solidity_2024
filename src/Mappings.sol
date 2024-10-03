// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

contract Mappings {
    mapping(string => uint256) public name;

    // set
    function setName() public {
        name["pandit"] = 5;
    }

    // get
    function getName(string memory _name) public view returns (uint256) {
        return name[_name];
    }
}

contract AdvMapping {
    struct doner {
        string name;
        uint256 age;
        string addr;
        uint256 donation;
    }

    mapping(address => doner) public donerDetails;

    function setDetails(
        string memory name,
        uint256 age,
        string memory addr,
        uint256 donation
    ) public {
        donerDetails[msg.sender] = doner(
            name,
            age,
            addr,
            donerDetails[msg.sender].donation + donation
        );
    }
}
