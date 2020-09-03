pragma solidity ^0.5.0;

import "../Roles.sol";

contract MinterRole {
    using Roles for Roles.Role;

    event MinterAdded(address indexed account);
    event MinterRemoved(address indexed account);
    event AccountPaused(address indexed account);
    event AccountResumed(address indexed account);

    Roles.Role private _minters;
    Roles.Role private _pausedAccounts;

    constructor () internal {
        _addMinter(msg.sender);
    }

    modifier onlyMinter() {
        require(isMinter(msg.sender), "MinterRole: caller does not have the Minter role");
        _;
    }

    modifier onlyResumed() {
        require(!isPaused(msg.sender), "MinterRole: caller has his account paused");
        _;
    }

    function isMinter(address account) public view returns (bool) {
        return _minters.has(account);
    }

    function isPaused(address account) public view returns (bool) {
        return _isPaused(account);
    }

    function addMinter(address account) public onlyMinter {
        _addMinter(account);
    }

    function pauseAccount(address account) public onlyMinter {
        _pauseAccount(account);
    }

    function renounceMinter() public {
        _removeMinter(msg.sender);
    }

    function _addMinter(address account) internal {
        _minters.add(account);
        emit MinterAdded(account);
    }

    function _removeMinter(address account) internal {
        _minters.remove(account);
        emit MinterRemoved(account);
    }

    function _pauseAccount(address account) internal {
        _pausedAccounts.add(account);
        emit AccountPaused(account);
    }

    function _resumeAccount(address account) internal {
        _pausedAccounts.remove(account);
        emit AccountResumed(account);
    }

    function _isPaused(address account) internal view returns (bool) {
        return _pausedAccounts.has(account);
    }
}