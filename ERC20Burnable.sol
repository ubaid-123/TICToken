pragma solidity ^0.5.0;

import "./ERC20.sol";
import "./access/roles/AdminRole.sol";

/**
 * @dev Extension of `ERC20` that allows token holders to destroy both their own
 * tokens and those that they have an allowance for, in a way that can be
 * recognized off-chain (via event analysis).
 */
contract ERC20Burnable is ERC20, AdminRole {
    /**
     * @dev Destoys `amount` tokens from the caller.
     *
     * See `ERC20._burn`.
     */
    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }

    /**
     * @dev Destoys `amount` tokens of a given account.
     *
     * See `ERC20._burn`.
     */
    function burn(address account, uint256 amount) onlyAdmin public {
        _burn(account, amount);
    }

    /**
     * @dev See `ERC20._burnFrom`.
     */
    function burnFrom(address account, uint256 amount) public {
        _burnFrom(account, amount);
    }
}