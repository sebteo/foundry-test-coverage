// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "./Deployer.sol";
import "../src/CounterBytecode.sol";

contract CounterBytecodeTest is Deployer {
    CounterBytecode public counter;

    function setUp() public {
        (address addrCounter, ) = deployContract(
            "CounterBytecode.sol:CounterBytecode"
        );

        counter = CounterBytecode(addrCounter);
        counter.setNumber(0);
    }

    function testIncrement() public {
        counter.increment();
        assertEq(counter.number(), 1);
    }

    function testSetNumber(uint256 x) public {
        counter.setNumber(x);
        assertEq(counter.number(), x);
    }
}
