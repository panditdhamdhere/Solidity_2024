// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

contract Enums {
    // Enum representing shipping status

    enum Status {
        Pending,
        Shipped,
        Delivered,
        Rejected,
        Cancelled
    }

    // Default value is the first element listed in
    // definition of the type, in this case "Pending"
    Status public status;

    function get() public view returns (Status) {
        return status;
    }

    function set(Status _status) public {
        status = _status;
    }

    // You can update to a specific enum like this
    function cancel() public {
        status = Status.Cancelled;
    }

    // delete resets the enum to its first value, 0

    function reset() public {
        delete status;
    }

    // we can import Enums from another file and create state varibles...
}
