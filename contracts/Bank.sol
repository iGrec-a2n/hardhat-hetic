// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts (last updated v5.2.0) (token/ERC20/ERC20.sol)

pragma solidity ^0.8.20;

interface IERC20 {
    function transfer(address to, uint256 amount) external returns (bool);
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
}

contract Bank {
    address immutable public erc20;
    mapping(address => uint256) public balances;
    address immutable public owner;

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }

    constructor(address _erc20, address _owner) {
        erc20 = _erc20;
        owner = _owner;
    }

    function deposit(uint256 amount) public {
        IERC20(erc20).transferFrom(msg.sender, address(this), amount);
        balances[msg.sender] += amount;
    }

    function withdraw(uint256 amount) public {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        IERC20(erc20).transfer(msg.sender, amount);
        balances[msg.sender] -= amount;
    }

    function pay(address employee, uint256 amount) public onlyOwner {
        IERC20(erc20).transferFrom(owner, address(this), amount);
        balances[employee] += amount;
    }
}