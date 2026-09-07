// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

interface ILocalToken {
    function balanceOf(address account) external view returns (uint256);
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
}

interface IPositionToken {
    function mint(address receiver, uint256 shares) external;
}

contract LendingVault {
    ILocalToken public immutable asset;
    address public immutable owner;
    string public protocolId;
    IPositionToken public positionToken;

    event Deposit(address indexed sender, address indexed owner, uint256 assets, uint256 shares);
    event PositionTokenConfigured(address indexed positionToken);

    error AlreadyConfigured();
    error InvalidAmount();
    error NotOwner();
    error PositionTokenUnavailable();
    error TokenTransferFailed();
    error ZeroAddress();

    constructor(address assetAddress, address initialOwner, string memory localProtocolId) {
        if (assetAddress == address(0) || initialOwner == address(0)) revert ZeroAddress();
        asset = ILocalToken(assetAddress);
        owner = initialOwner;
        protocolId = localProtocolId;
    }

    function setPositionToken(address token) external {
        if (msg.sender != owner) revert NotOwner();
        if (address(positionToken) != address(0)) revert AlreadyConfigured();
        if (token == address(0)) revert ZeroAddress();
        positionToken = IPositionToken(token);
        emit PositionTokenConfigured(token);
    }

    function totalAssets() external view returns (uint256) {
        return asset.balanceOf(address(this));
    }

    function previewDeposit(uint256 assets) external pure returns (uint256) {
        return assets;
    }

    function deposit(uint256 assets, address receiver) external returns (uint256 shares) {
        if (assets == 0) revert InvalidAmount();
        if (receiver == address(0)) revert ZeroAddress();
        IPositionToken positions = positionToken;
        if (address(positions) == address(0)) revert PositionTokenUnavailable();
        if (!asset.transferFrom(msg.sender, address(this), assets)) revert TokenTransferFailed();
        shares = assets;
        positions.mint(receiver, shares);
        emit Deposit(msg.sender, receiver, assets, shares);
    }
}
