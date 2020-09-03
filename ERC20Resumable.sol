pragma solidity ^0.5.0;

import "./ERC20.sol";
import "./access/roles/AdminRole.sol";

/**
 * @title Resumable token
 * @dev ERC20 modified with whitelistable transfers.
 */
contract ERC20Resumable is ERC20, AdminRole {
    function transfer(address to, uint256 value) public onlyResumed returns (bool) {
        return super.transfer(to, value);
    }

    function transferFrom(address from, address to, uint256 value) public onlyResumed returns (bool) {
        return super.transferFrom(from, to, value);
    }

    function approve(address spender, uint256 value) public onlyResumed returns (bool) {
        return super.approve(spender, value);
    }

    function increaseAllowance(address spender, uint addedValue) public onlyResumed returns (bool) {
        return super.increaseAllowance(spender, addedValue);
    }

    function decreaseAllowance(address spender, uint subtractedValue) public onlyResumed returns (bool) {
        return super.decreaseAllowance(spender, subtractedValue);
    }
}