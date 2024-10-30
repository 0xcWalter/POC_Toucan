// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {Test, console} from "forge-std/Test.sol";
import {Upgrades,Options} from "openzeppelin-foundry-upgrades/Upgrades.sol";

contract POC is Test {
    function test_one()external {
        Options memory opts;
        opts.referenceContract = "MetaVaultGuard.sol:MetaVaultGuard";
        Upgrades.validateUpgrade("CustomMetaVaultGuard.sol:CustomMetaVaultGuard", opts);
        
    }
}