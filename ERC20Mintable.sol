pragma solidity ^0.5.0;

import "./ERC20.sol";
import "./access/roles/MinterRole.sol";

/**
 * @dev Extension of `ERC20` that adds a set of accounts with the `MinterRole`,
 * which have permission to mint (create) new tokens as they see fit.
 *
 * At construction, the deployer of the contract is the only minter.
 */
contract ERC20Mintable is ERC20, MinterRole {
    /**
     * @dev See `ERC20._mint`.
     *
     * Requirements:
     *
     * - the caller must have the `MinterRole`.
     */
    function mint(address account, uint256 amount, bool shouldPause) public onlyMinter returns (bool) {
        _mint(account, amount);

        // First time being minted? Then let's ensure
        // the token will remain paused for now
        if (shouldPause && !_isPaused(account)) {
            _pauseAccount(account);
        }

        return true;
    }

    /**
     * @dev See `ERC20._mint`.
     *
     * Requirements:
     *
     * - the caller must have the `MinterRole`.
     */
    function mint(address account, uint256 amount) public onlyMinter returns (bool) {
        return mint(account, amount, true);
    }
}