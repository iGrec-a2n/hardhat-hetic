// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts (last updated v5.2.0) (token/ERC20/ERC20.sol)

pragma solidity ^0.8.20;

import { ERC20 } from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Hetic is ERC20 {
    constructor() ERC20("Hetic", "HETIC") {}

    function mint(address to, uint256 amount) public {
        _mint(to, amount);
    }
}