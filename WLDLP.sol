// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.4;

import "token/ERC20/ERC20.sol";
import "access/AccessControl.sol";
import "token/ERC20/extensions/ERC20Burnable.sol";


/*
//can also use openzeppelin contracts directly
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
*/

contract WLDLP is ERC20, ERC20Burnable, AccessControl {
    bytes32 public constant RELAY_ROLE = keccak256("RELAY_ROLE");

    string name1 = "World Largest Decentralised Liquidity Protocol";
    string symbol1 = "WLDLP";

    constructor(address _minter) ERC20(name1, symbol1) {
        _mint(_minter, 1000000005 * 10 ** decimals());
        _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
    }
    

//Function  to mint more WLDLP as required only by authorised addresses
    function relayMint(
        address to,
        uint256 value
    ) public onlyRole(RELAY_ROLE) returns (bool) {
        _mint(to, value);
        return true;
    }
}
