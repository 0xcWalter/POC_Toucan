// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.14;
import {Test, console} from "forge-std/Test.sol";
import {CustomToucanCarbonOffsets} from "../src/CustomToucanCarbonOffsets.sol";

/*
    before running the POC,see the summary of what i have changed in the ToucanCarbonOffsets contract to
    understand in a better way the problem.
*/


contract POC is Test {
    Proxy proxy = Proxy(0x098bcd2dD9Ed7897F5a303079012EEccBBb87aA0); // address of one of the UpgradeableBeacon proxies with implementation without gaps(on celo)

    function test_one()external {
        vm.createSelectFork("wss://celo.drpc.org");

        vm.startPrank(proxy.owner());

        CustomToucanCarbonOffsets customTCO = new CustomToucanCarbonOffsets();
        proxy.upgradeTo(address(customTCO)); // here no problems since we havent changed the storage yet

        vm.expectRevert();
        proxy.storeCount(1, 2); // reverts for lack of space to store the new variables

        vm.stopPrank();
    }
}
interface Proxy{
    function owner()external returns(address);
    function upgradeTo(address)external;
    function storeCount(uint256,uint256) external;
}