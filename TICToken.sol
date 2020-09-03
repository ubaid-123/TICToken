pragma solidity ^0.5.0;

import "./ERCDetailed.sol";
import "./ERC20Capped.sol";
import "./ERC20Resumable.sol";
import "./ERC20Burnable.sol";

/**
 * @title TICToken
 * @dev The TIC ERC20 Token that can be
 * minted and is capped to a maximum allocation.
 */
contract TicToken is ERC20Detailed, ERC20Capped, ERC20Resumable, ERC20Burnable {
    uint256 private constant DECIMALS = 18;
    uint256 private constant CAP = 1000000000 * (10**18);

    constructor () public
    ERC20Detailed("Tic Token", "TIC", DECIMALS)
    ERC20Capped(CAP)
    {

    }
}
