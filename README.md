## Alpha Omega Coin (AOC) Bep20 Token V2

## Table of Contents

1. [Overview](#overview)
2. [AlphaOmegaCoin](#alphaomegacoin)

   * [Token Details](#token-details)
   * [Transfer Restrictions](#transfer-restrictions)
   * [Levels (MPP/PMP)](#levels-mpppmp)
   * [Reentrancy Protection](#reentrancy-protection)
   * [Events](#events)
3. [Read Functions](#read-functions)
4. [Write Functions](#write-functions)

   * [initialize()](#function-initialize)
   * [_authorizeUpgrade(address)](#function-_authorizeupgradeaddress)
   * [transfer(address,uint256)](#function-transferaddress-recipient-uint256-amount)
   * [approve()](#function-approve)
   * [renounceOwnership](#function-renounceownership)
   * [transferFrom](#function-transferfrom)
   * [includeInLTAF](#function-includeinltafaddress-account)
   * [excludeFromLTAF](#function-excludefromltafaddress-account)
   * [includeInRAMS](#function-includeinramsaddress-account)
   * [excludeFromRAMS](#function-excludefromramsaddress-account)
   * [updateLtafPercentage](#function-updateltafpercentageuint256-percentage)
   * [updateUserInfo](#function-updateuserinfoaddress-account-uint256-year-uint256-month)
   * [addLevels](#function-addlevelsuint256-level-uint256-startday-uint256-endday-uint256-percentage)
5. [How It Works](#how-it-works)
6. [Dependencies](#dependencies)
7. [Setup and Deployment](#setup-and-deployment)

   * [Install Dependencies](#install-dependencies)
   * [Configure](#configure)
8. [Usage](#usage)

   * [For Users](#for-users)
   * [For Admins (Owner)](#for-admins-owner)
9. [Security](#security)
10. [Deploy AlphaOmegaCoin](#deploy-alphaomegacoin)

---

## Overview

Alpha Omega Coin (AOC), *The Queen of Cryptocurrencies*, is composed of several tokens including the **AOC BEP20 Token** we are dealing with in this documentation.

The AOC BEP20 Token contract is **ERC20-compliant** with **transfer restrictions, blacklisting, and level-based limits**.
It has **no burning** and **no minting** features.

---

## AlphaOmegaCoin

AOC BEP20 Token V2 Functions are categorized as:

* **Read (retrieve data)**
* **Write (modify state)**

---

### Token Details

* **Name:** Alpha Omega Coin (AOC)
* **Symbol:** AOC
* **Decimals:** 18
* **Initial Supply:** 1,000,000,000,000 (1 trillion AOC)
* **Total Maximum Supply:** 1,000,000,000,000 (1 trillion AOC) *(no minting, no burning)*
* **Type:** Utility, Donation, and Payment Token (UDPT)
* **Network / Blockchain:** Binance Smart Chain
* **Upgradeability:** Uses OpenZeppelin UUPS (Universal Upgradeable Proxy Standard)
* **Blacklist:** Owner can block addresses for fraud prevention or regulation
* **Pausable:** Owner can pause/unpause transfers in emergencies

---

### Transfer Restrictions

* **LTAF (Large Transaction Autorisation Functionality):** Special allowance where selected accounts can transfer up to a percentage (default 50%) of their balance monthly.
* **RAMS (Regressive Anti-Manipulation Strategy):** Enforced by default for most users, based on time-period levels, reducing permissible monthly percentages as time passes.

Restrictions reset monthly.

---

### Levels (MPP/PMP)

* **Jan 1, 2022 – Jan 1, 2024:** 20%
* **Jan 2, 2024 – Jan 1, 2026:** 15%
* **Jan 2, 2026 – Jan 1, 2028:** 10%
* **Jan 2, 2028 onward:** 5%

These are called **Monthly Permissive Percentages (MPP)** or **PMP**.

---

### Reentrancy Protection

All transfers are protected using `ReentrancyGuard`.

---

### Events

* `Blacklisted(address)` / `RemovedFromBlacklist(address)`
* `IncludedInLTAF(address)` / `ExcludedFromLTAF(address)`
* `IncludedInRAMS(address)` / `ExcludedFromRAMS(address)`
* `LtafPercentageUpdated(uint256)`
* `OwnershipTransferred(address,address)`
* `Transfer(address,address,uint256)`
* `Approval(address,address,uint256)`

---

## Read Functions

* **name()** → returns "Alpha Omega Coin"
* **symbol()** → returns "AOC"
* **decimals()** → returns 18
* **totalSupply()** → returns 1 trillion AOC
* **balanceOf(address)** → returns balance of a wallet
* **allowance(owner, spender)** → returns approved allowance

---

## Write Functions

### Function: initialize()

Sets up:

* Name: Alpha Omega Coin
* Symbol: AOC
* Decimals: 18
* Initial supply: 1 trillion AOC (to deployer)
* RAMS levels (20%, 15%, 10%, 5% over time)
* Default LTAF percentage = 50%

---

### Function: _authorizeUpgrade(address)

Owner-only authorization for contract upgrades.

---

### Function: transfer(address recipient, uint256 amount)

Transfers tokens while respecting blacklist, RAMS, and LTAF rules.

---

### Function: approve()

Grants permission to another account/contract to spend tokens on behalf of owner.

---

### Function: renounceOwnership()

Permanently removes contract ownership, making the token fully decentralized.

---

### Function: transferFrom()

Allows an approved spender (exchange, app, etc.) to transfer tokens from an owner’s account.

---

### Function: includeInLTAF(address account)

Adds an account to **LTAF** with higher monthly transfer allowance (default 50%).

---

### Function: excludeFromLTAF(address account)

Removes account from LTAF → back to RAMS restrictions.

---

### Function: includeInRAMS(address account)

Adds account to RAMS, applying **regressive limits** (20% → 5% over years).

---

### Function: excludeFromRAMS(address account)

Removes RAMS restrictions, allowing free transfers (unless blacklisted or in LTAF).

---

### Function: updateLtafPercentage(uint256 percentage)

Owner can adjust the monthly transfer limit percentage for LTAF.

---

### Function: updateUserInfo(address account, uint256 year, uint256 month)

Internal function to update balances and reset monthly restrictions.

---

### Function: addLevels(uint256 level, uint256 startDay, uint256 endDay, uint256 percentage)

Defines time-based transfer restrictions (RAMS levels).

---

## How It Works

1. **Transfers check restrictions** (RAMS/LTAF/blacklist).
2. **If limits exceeded → revert.**
3. **Restrictions reset monthly.**
4. **Admins** can manage LTAF, RAMS, and blacklist settings.

---

## Dependencies

* OpenZeppelin Contracts Upgradeable
* DateTime utilities for RAMS/LTAF checks

---

## Setup and Deployment

### Install Dependencies

```bash
npm install @openzeppelin/contracts-upgradeable
```

### Configure

* Owner address
* Default LTAF percentage (50%)
* RAMS levels (20%, 15%, 10%, 5%)

---

## Usage

### For Users

* Use `transfer` / `transferFrom` to send tokens.
* Check allowance with `allowance`.
* Verify restrictions with `isInRAMS` / `isInLTAF`.

### For Admins (Owner)

* Blacklist/unblacklist wallets.
* Include/exclude users from LTAF/RAMS.
* Adjust LTAF percentage.
* Renounce ownership when decentralizing.

---

## Security

* Upgradeable via UUPS
* Owner-only privileged functions
* Pausable in emergencies
* Blacklist support
* ReentrancyGuard protection
* Strict RAMS/LTAF restrictions for market stability

---

## Deploy AlphaOmegaCoin

Deploy with initializer to:

1. Mint **1 trillion AOC** to deployer.
2. Set **LTAF percentage = 50%**.
3. Configure **RAMS levels** (20%, 15%, 10%, 5%).
