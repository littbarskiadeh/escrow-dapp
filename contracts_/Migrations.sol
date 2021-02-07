// SPDX-License-Identifier: MIT
pragma solidity ^0.7.1;

contract Migrations {
    address public owner;
    uint256 public last_completed_migration;

    function initialize() public {
        owner = msg.sender;
    }

    modifier restricted() {
        require(
            msg.sender == owner,
            "This function is restricted to the contract's owner"
        );
        _;
    }

    function setCompleted(uint256 completed) public {
        last_completed_migration = completed;
    }
}
