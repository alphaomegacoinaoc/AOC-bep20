
# Alpha Omega Coin (AOC) Project

## Alpha Omega Coin (AOC) Bep20 Token V2

## Table of Contents
1. [Overview](#overview)
2. [AlphaOmegaCoin](#alphaomegacoin)  
   - [Key Features](#key-features)  
   - [Token Details](#token-details)  
   - [Transfer Restrictions](#transfer-restrictions)  
   - [Levels (MPP/PMP)](#levels-mpppmp)  
   - [Reentrancy Protection](#reentrancy-protection)  
   - [Events](#events)  
3. [Read Functions](#read-functions)  
4. [Write Functions](#write-functions)  
   - [initialize()](#function-initialize)  
   - [_authorizeUpgrade(address)](#function-_authorizeupgradeaddress)  
   - [transfer(address,uint256)](#function-transferaddress-recipient-uint256-amount)  
   - [approve()](#function-approve)  
   - [renounceOwnership](#function-renounceownership)  
   - [transferFrom](#function-transferfrom)  
   - [includeInLTAF](#function-includeinltafaddress-account)  
   - [excludeFromLTAF](#function-excludefromltafaddress-account)  
   - [includeInRAMS](#function-includeinramsaddress-account)  
   - [excludeFromRAMS](#function-excludefromramsaddress-account)  
   - [updateLtafPercentage](#function-updateltafpercentageuint256-percentage)  
   - [updateUserInfo](#function-updateuserinfoaddress-account-uint256-year-uint256-month)  
   - [addLevels](#function-addlevelsuint256-level-uint256-startday-uint256-endday-uint256-percentage)  
5. [How It Works](#how-it-works)  
6. [Dependencies](#dependencies)  
7. [Setup and Deployment](#setup-and-deployment)  
   - [Install Dependencies](#install-dependencies)  
   - [Configure](#configure)  
8. [Usage](#usage)  
   - [For Users](#for-users)  
   - [For Admins (Owner)](#for-admins-owner)  
9. [Security](#security)  
10. [Deploy AlphaOmegaCoin](#deploy-alphaomegacoin)  

---

## Overview
Alpha Omega Coin (AOC) is a Solidity-based BEP-20 token on **BNB Smart Chain**, designed with **upgradeable smart contracts**.  
It includes advanced features like transfer restrictions, blacklisting, and bulk operations for efficient token management.  
The project consists of two main contracts: **AlphaOmegaCoin** and **BulkOperations**.

---

## AlphaOmegaCoin

The core BEP-20 token contract with added features for controlling token transfers and user restrictions.

### Key Features

#### Token Details
- **Name:** Alpha Omega Coin (AOC)  
- **Symbol:** AOC  
- **Decimals:** 18  
- **Initial Supply:** 1,000,000,000,000 (1 trillion AOC)  
- **Upgradeability:** Uses OpenZeppelin UUPS (Universal Upgradeable Proxy Standard).  
- **Pausable:** Owner can pause/unpause transfers.  
- **Blacklist:** Owner can block addresses from sending/receiving tokens.

---

### Transfer Restrictions
- **LTAF (Limited Transfer Amount Framework)**: Restricts monthly transfer percentage (default: 60%).  
- **RAMS (Restricted Address Monthly Schedule)**: Uses time-based levels to restrict transfer percentages.  
- Restrictions reset monthly.

---

### Levels (MPP/PMP)
- **Level 1** (Jan 1, 2022 – Jan 1, 2024): 20%  
- **Level 2** (Jan 2, 2024 – Jan 1, 2026): 15%  
- **Level 3** (Jan 2, 2026 – Jan 1, 2028): 10%  
- **Level 4** (Jan 2, 2028 onward): 5%  

These percentages are known as **Monthly Permissive Percentage (MPP)** or **PMP**.

---

### Reentrancy Protection
All token transfers are protected with `ReentrancyGuard`.

---

### Events
- `Blacklisted(address)` / `RemovedFromBlacklist(address)`  
- `IncludedInLTAF(address)` / `ExcludedFromLTAF(address)`  
- `IncludedInRAMS(address)` / `ExcludedFromRAMS(address)`  
- `LtafPercentageUpdated(uint256)`  

---

## Read Functions
- **balanceOf(address)** → returns token balance  
- **allowance(owner, spender)** → returns approved allowance  
- **isBlacklisted(address)** → returns blacklist status  
- **isInLTAF(address)** → returns LTAF status  
- **isInRAMS(address)** → returns RAMS status  
- **getLevelData(level)** → returns level details  

---

## Write Functions

### Function: initialize
Sets up the contract:  
- Produces total supply to owner  
- Sets default LTAF percentage (60%)  
- Defines RAMS levels

### Function: _authorizeUpgrade(address)
Allows only the owner to authorize upgrades.

### Function: transfer(address recipient, uint256 amount)
Transfers tokens between users, respecting LTAF/RAMS limits.

### Function: approve
Approves spender to spend tokens on behalf of owner.

### Function: renounceOwnership
Renounces ownership permanently.

### Function: transferFrom
Transfers tokens using an approved allowance.

### Function: includeInLTAF(address account)
Marks account under LTAF restrictions.

### Function: excludeFromLTAF(address account)
Removes account from LTAF restrictions.

### Function: includeInRAMS(address account)
Adds account to RAMS restrictions.

### Function: excludeFromRAMS(address account)
Removes account from RAMS restrictions.

### Function: updateLtafPercentage(uint256 percentage)
Updates monthly transfer limit percentage for LTAF.

### Function: updateUserInfo(address account, uint256 year, uint256 month)
Manually updates user's restriction reset date.

### Function: addLevels(uint256 level, uint256 startDay, uint256 endDay, uint256 percentage)
Adds or updates RAMS level configuration.

---

## How It Works
1. **User transfers tokens** → LTAF/RAMS restrictions are checked.  
2. **If limits exceeded** → transaction reverts.  
3. **Monthly reset** → limits refresh automatically.  
4. **Admins** can blacklist, pause, or adjust limits anytime.

---

## Dependencies
- **OpenZeppelin Contracts Upgradeable**  
- **DateTime library** for date-based restrictions.

---

## Setup and Deployment

### Install Dependencies
```bash
npm install @openzeppelin/contracts-upgradeable
````

### Configure

* Set contract owner
* Define initial LTAF percentage
* Configure RAMS levels
* Add initial blacklists if required

---

## Usage

### For Users

* Use `transfer` or `transferFrom` within allowed limits.
* Check status with `isInLTAF` or `isInRAMS`.

### For Admins (Owner)

* Blacklist/unblacklist addresses
* Adjust LTAF percentage
* Manage RAMS levels
* Pause/unpause the contract

---

## Security

* **Upgradeable** via UUPS
* **Pausable** in emergencies
* **ReentrancyGuard** applied
* **Blacklist** support
* **Monthly restrictions** for stability

---

## Deploy AlphaOmegaCoin

Deploy with initializer to:

1. Produce Total Supply **1 trillion AOC** to owner
2. Set LTAF default to **60%**
3. Configure RAMS levels (20%, 15%, 10%, 5%)

