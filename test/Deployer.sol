// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

contract Deployer is Test {
    function deployContract(
        string memory contractName
    ) internal returns (address, bytes memory) {
        return deployContract(contractName, abi.encode());
    }

    function deployContract(
        string memory contractName,
        bytes memory args
    ) internal returns (address, bytes memory) {
        bytes memory bytecode = abi.encodePacked(
            vm.getCode(contractName),
            args
        );
        address deployed;
        assembly {
            deployed := create(0, add(bytecode, 0x20), mload(bytecode))
        }

        return (deployed, deployed.code);
    }
}
