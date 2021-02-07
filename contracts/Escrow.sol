// SPDX-License-Identifier: MIT
pragma solidity ^0.7.1;

import "openzeppelin-solidity/contracts/access/AccessControl.sol";

contract Escrow is AccessControl {
    // create new role identifier
    bytes32 public constant AGENT_ROLE = keccak256("AGENT_ROLE");
    // bytes32 public constant BUYER_ROLE = keccak256("BUYER_ROLE");
    // bytes32 public constant SELLER_ROLE = keccak256("SELLER_ROLE");

    mapping(address => uint256) escrowBalances;

    constructor(address _agent) payable {
        // constructor(address _agent,address _buyer,address _seller) payable {
        // create and assign role to agent in constructor
        _setupRole(AGENT_ROLE, _agent);
        // _setupRole(BUYER_ROLE, _buyer);
        // _setupRole(SELLER_ROLE, _seller);
    }

    function deposit(address _payee, uint256 _amount) public {
        require(hasRole(AGENT_ROLE, msg.sender), "Caller must be an agent");

        escrowBalances[_payee] += _amount;
    }

    function withdraw(address _payee, uint256 _amount) public {
        // require only agent can withdraw
        require(hasRole(AGENT_ROLE, msg.sender), "Caller must be an agent");
        escrowBalances[_payee] -= _amount;
    }

    function getBalance(address _account) public view returns (uint256) {
        return escrowBalances[_account];
    }
}
