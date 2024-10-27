// SPDX-FileCopyrightText: 2021 Toucan Labs
//
// SPDX-License-Identifier: UNLICENSED

// If you encounter a vulnerability or an issue, please contact <security@toucan.earth> or visit security.toucan.earth

pragma solidity 0.8.14;

/// @dev Separate storage contract to improve upgrade safety
abstract contract ToucanCarbonOffsetsStorage {
    uint256 internal _projectVintageTokenId;
    address public contractRegistry;

    // NEW RANDOM VARIABLE ADDED AFTER NEW UPGRADE //
    mapping (uint256 => uint256)public count;
    /////////////////////////////////////////////////

    mapping(address => uint256) public minterToId;
    /// @dev deprecated field; retirements are now tracked
    /// as events in the RetirementCertificatesStorage contract
    mapping(address => uint256) internal retiredAmount;
}