// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract PositionToken {
    string public constant name = "IntentMesh Local Lending Position";
    string public constant symbol = "imPOS";
    uint8 public constant decimals = 6;
    address public immutable owner;
    uint256 public totalSupply;

    mapping(address account => uint256 balance) public balanceOf;
    mapping(address vault => bool approved) public approvedVault;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event VaultAuthorization(address indexed vault, bool approved);

    error NotOwner();
    error NotVault();
    error ZeroAddress();

    constructor(address initialOwner) {
        if (initialOwner == address(0)) revert ZeroAddress();
        owner = initialOwner;
    }

    function setVault(address vault, bool approved) external {
        if (msg.sender != owner) revert NotOwner();
        if (vault == address(0)) revert ZeroAddress();
        approvedVault[vault] = approved;
        emit VaultAuthorization(vault, approved);
    }

    function mint(address receiver, uint256 shares) external {
        if (!approvedVault[msg.sender]) revert NotVault();
        if (receiver == address(0)) revert ZeroAddress();
        totalSupply += shares;
        balanceOf[receiver] += shares;
        emit Transfer(address(0), receiver, shares);
    }
}
