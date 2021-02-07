// SPDX-License-Identifier: MIT

// contracts/Counter.sol
pragma solidity ^0.7.1;

contract Counter {
    uint256 public value;

    // function initialize() public {
    //     value = 0;
    // }

    function increase(uint256 _amount) public {
        value += _amount;
    }
}
