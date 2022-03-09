//SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.7;

contract Counter {
    uint32 private value;

    /// Constructor
    constructor() {
        value = 0;
    }

    /// increment value
    function increment() public {
        value++;
    }

    /// Simply returns the current value of our `uint32`.
    function get() public view returns (uint32) {
        return value;
    }
}
