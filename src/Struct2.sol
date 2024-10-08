// SPDX-License-Identifier: MIT

pragma solidity 0.8.26;

contract Struct {
    struct Employee {
        string name;
        uint256 age;
        address account;
    }

    Employee public employee;
    Employee[] public employees;

    constructor(string memory _name, uint256 _age, address _account) {
        employee.name = _name;
        employee.age = _age;
        employee.account = _account;
    }

    // function
    function setValue() public {
        Employee memory employee1 = Employee("PAndit", 27, 0x7a3dE6e00725F28d3785d089B55c7Da5C0059fe0);
        employee = employee1;

        Employee memory employee2 = Employee({name: "Pranav", age: 22, account: msg.sender});

        Employee memory employee3;
        employee3.name = "Yash";
        employee3.age = 23;
        employee3.account = msg.sender;

        employees.push(employee1);
        employees.push(employee2);
        employees.push(employee3);
    }
}
