// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/security/PausableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/security/ReentrancyGuardUpgradeable.sol";
import "./AlphaOmegaCoin.sol";

contract BulkOperations is Initializable, OwnableUpgradeable, PausableUpgradeable, UUPSUpgradeable, ReentrancyGuardUpgradeable {
    AlphaOmegaCoin public aoc;

    event BulkTransfer(address indexed sender, address[] recipients, uint256[] amounts);
    event BulkDistributionRequested(string date, uint256 count);

    function _authorizeUpgrade(address newImplementation) internal override onlyOwner{}

    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() {
    _disableInitializers();
    }


    function initialize(address aocAddress) public initializer {
        aoc = AlphaOmegaCoin(aocAddress);
        __Ownable_init();
        __Pausable_init();
        __ReentrancyGuard_init();
    }

    function bulkTransfer(address[] calldata recipients, uint256[] calldata amounts) external onlyOwner whenNotPaused nonReentrant {
        require(recipients.length == amounts.length, "AOC: Mismatched arrays");
        uint256 totalAmount;
        for (uint256 i = 0; i < amounts.length; i++) {
            require(recipients[i] != address(0), "AOC: Invalid recipient");
            totalAmount += amounts[i];
        }
        require(aoc.balanceOf(msg.sender) >= totalAmount, "AOC: Insufficient balance");
        emit BulkTransfer(msg.sender, recipients, amounts);
        for (uint256 i = 0; i < recipients.length; i++) {
            require(aoc.transferFrom(msg.sender, recipients[i], amounts[i]), "AOC: Transfer failed");
        }
    }

    function bulkDistribution(string calldata date, uint256 count) external onlyOwner whenNotPaused {
        require(count > 0, "AOC: Invalid count");
        emit BulkDistributionRequested(date, count);
    }
}
