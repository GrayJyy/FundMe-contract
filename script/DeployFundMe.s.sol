// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {FundMe} from "../src/FundMe.sol";
import {Script} from "forge-std/Script.sol";
import {HelperConfig} from "./HelperConfig.s.sol";

contract DeployFundMe is Script {
    function run() public returns (FundMe fundMe, HelperConfig helperConfig) {
        helperConfig = new HelperConfig(); // This comes with our mocks!
        address priceFeed = helperConfig.activeNetworkConfig();
        vm.startBroadcast();
        fundMe = new FundMe(priceFeed);
        vm.stopBroadcast();
    }
}
