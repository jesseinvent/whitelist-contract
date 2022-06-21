// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Whitelist {

    // Max number of whitelisted addresses allowed
    uint8 public maxWhiteListedAddresses;

    // Create mapping of whiteListedAddresses 
    // If an address is whitelisted, we would set it to true,
    // false by default for all other addresses
    mapping(address => bool) public whiteListedAddresses;

    // numAddressesWhitelisted would be used to keep track of how
    // many addresses have been whitelisted
    uint8 public numAddressesWhitelisted;

    // Setting the Max number of whitelisted addresses
    // User will put the value at the time of deployment
    constructor(uint8 _maxWhiteLostedAddresses) {
        maxWhiteListedAddresses = _maxWhiteLostedAddresses;
    }

    // Adds address of sender to the whitelist
    function addAddressToWhitelist() public returns (bool) {

        // Check if the user has already been whitelisted
        require(whiteListedAddresses[msg.sender], "Sender has already been whitelisted");

        // Check if the numAddressesWhitelisted limit has been reached
        require(numAddressesWhitelisted < maxWhiteListedAddresses, "More addresses can't be added, limit reached");

        // Add the address which called the function to the whitelistedAddresses
        whiteListedAddresses[msg.sender] = true;

        // Increment the number of whitelisted addresses
        numAddressesWhitelisted += 1;

        return true;
    }
}