// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import {MerkleProof} from "./MerkleProof.sol";

interface IToken {
    function mint(address to, uint256 amount) external;
}

contract Airdrop {
    event Claim(address to, uint256 amount);

    IToken public immutable token;
    bytes32 public immutable root;
    mapping(bytes32 => bool) public claimed;

    constructor(address _token, bytes32 _root) {
        token = IToken(_token);
        root = _root;
    }

    function getLeafHash(address to, uint256 amount) public pure returns (bytes32) {
        return keccak256(abi.encode(to, amount));
    }

    function claim(bytes32[] memory proof, address to, uint256 amount) external {
        // NOTE: (to, amount) cannot have duplicates
        bytes32 leaf = getLeafHash(to, amount);

        require(!claimed[leaf], "airdrop already claimed");
        require(MerkleProof.verify(proof, root, leaf), "invalid merkle proof");
        claimed[leaf] = true;

        token.mint(to, amount);

        emit Claim(to, amount);
    }
}

pragma solidity ^0.8.26;

// ERC20 + mint + authorization
contract Token {
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

    uint256 public totalSupply;
    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;
    string public name;
    string public symbol;
    uint8 public decimals;
    mapping(address => bool) public authorized;

    constructor(string memory _name, string memory _symbol, uint8 _decimals) {
        name = _name;
        symbol = _symbol;
        decimals = _decimals;
        authorized[msg.sender] = true;
    }

    function setAuthorized(address addr, bool auth) external {
        require(authorized[msg.sender], "not authorized");
        authorized[addr] = auth;
    }

    function transfer(address recipient, uint256 amount) external returns (bool) {
        balanceOf[msg.sender] -= amount;
        balanceOf[recipient] += amount;
        emit Transfer(msg.sender, recipient, amount);
        return true;
    }

    function approve(address spender, uint256 amount) external returns (bool) {
        allowance[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
        return true;
    }

    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool) {
        allowance[sender][msg.sender] -= amount;
        balanceOf[sender] -= amount;
        balanceOf[recipient] += amount;
        emit Transfer(sender, recipient, amount);
        return true;
    }

    function _mint(address to, uint256 amount) internal {
        balanceOf[to] += amount;
        totalSupply += amount;
        emit Transfer(address(0), to, amount);
    }

    function mint(address to, uint256 amount) external {
        require(authorized[msg.sender], "not authorized");
        _mint(to, amount);
    }
}
