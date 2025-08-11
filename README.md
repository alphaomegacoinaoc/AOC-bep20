# Alpha Omega Coin (AOC) — BEP-20 Token

**Contract (proxy) address (BSC Testnet):** `0x1E803f70e0132b2A3dAC52466b14b245A08bF3d4` — (BscScan write/proxy interface available).

---

## Table of contents

1. [Project summary](#project-summary)
2. [Token specification](#token-specification)
3. [Design and anti‑manipulation features](#design-and-anti-manipulation-features)
4. [Read (view) functions](#read-view-functions)
5. [Write (state-changing) functions](#write-state-changing-functions)
6. [LTAF (Long-Term Active Fund) — explanation & usage](#ltaf-long-term-active-fund)
7. [RAMS (Regressive Anti‑Manipulation Strategy) — explanation & usage](#rams-regressive-anti-manipulation-strategy)
8. [Owner / admin functions & upgradeability](#owner--admin-functions--upgradeability)
9. [Initialization & deployment notes (no minting)](#initialization--deployment-notes-no-minting)
10. [Interacting with the contract (examples)](#interacting-with-the-contract-examples)
11. [Security considerations & recommendations](#security-considerations--recommendations)
12. [Verification, testing, and audits](#verification-testing-and-audits)
13. [License](#license)

---

## Project summary

Alpha Omega Coin (AOC) is a BEP-20 token that implements standard ERC20-compatible behavior together with additional market-protection features:

* Fixed total supply (no minting after deployment).
* Transfer restrictions through a multi-level, time-based system (RAMS) to limit monthly transfer percentages and discourage dumps.
* An owner-controlled LTAF system to grant privileged monthly transfer allowances to selected addresses.
* Blacklisting capability and standard access controls (owner-only for sensitive operations).
* Upgradeable proxy pattern (Upgradeable contract — owner authorizes upgrades).

---

## Token specification

* **Name:** Alpha Omega Coin
* **Symbol:** `AOC`
* **Decimals:** 18
* **Total supply:** Fixed at deployment (e.g. 1,000,000,000,000 \* 10^18) — *set by deployer during initialization*.
* **Standard:** BEP-20 (compatible with ERC-20 interface)

---

## Design and anti‑manipulation features

1. **RAMS (Regressive Anti‑Manipulation Strategy):** Time-based levels that progressively tighten the monthly transferable percentage (MPP / PMP) to prevent large sales:

   * Level periods with associated MPPs (examples used by the contract):

     * 1 Jan 2022 – 1 Jan 2024 → 20%
     * 2 Jan 2024 – 1 Jan 2026 → 15%
     * 2 Jan 2026 – 1 Jan 2028 → 10%
     * 2 Jan 2028 onwards → 5%
   * By default, token holders are included in RAMS unless explicitly excluded by the owner.

2. **LTAF (Long-Term Active Fund):** Owner-granted status for select addresses that allows a higher monthly transfer cap (default 50%) to enable large-but-managed transfers for approved actors (charitable spends, team operations, distribution wallets, etc.).

3. **Blacklisting:** Owner can blacklist addresses to block transfers to/from malicious or compromised accounts.

4. **Upgradeability:** Contract uses an upgradable pattern (proxy + implementation). Owner must authorize upgrades via `_authorizeUpgrade`.

---

## Read (view) functions

These functions do not change state and are safe to call locally or through BscScan / web3 providers.

* `name() -> string` — token name ("Alpha Omega Coin").
* `symbol() -> string` — token symbol (`AOC`).
* `decimals() -> uint8` — decimals (18).
* `totalSupply() -> uint256` — fixed total token supply.
* `balanceOf(address account) -> uint256` — returns token balance of an address.
* `allowance(address owner, address spender) -> uint256` — returns remaining allowance.
* `includedInLTAF(address) -> bool` — whether address is in LTAF.
* `includedInRAMS(address) -> bool` — whether address is in RAMS.
* `levels(uint256 levelId) -> (startTimestamp, endTimestamp, percentage)` — inspect configured RAMS levels.
* `ltafPercentage() -> uint256` — current LTAF percentage.
* `isBlacklisted(address) -> bool` — blacklisting status (if implemented as view).
* `userTransferInfo(address) -> (lastUpdatedYear, lastUpdatedMonth, monthlyTransferred)` — internal tracking visibility may be available depending on implementation.

---

## Write (state-changing) functions

> *All write functions that change state require the caller to sign a transaction and pay gas. Use BscScan write interfaces, ethers.js, or web3.js to call them.*

* `transfer(address recipient, uint256 amount) -> bool` — transfer tokens while enforcing RAMS/LTAF/blacklist rules.
* `transferFrom(address sender, address recipient, uint256 amount) -> bool` — transfer using allowance, subject to same checks.
* `approve(address spender, uint256 amount) -> bool` — allow a spender to spend tokens on your behalf.
* `renounceOwnership()` — permanently renounce owner role (owner only).
* `includeInLTAF(address account)` — add address to LTAF (owner only).
* `excludeFromLTAF(address account)` — remove from LTAF (owner only).
* `includeInRAMS(address account)` — add address to RAMS (owner only).
* `excludeFromRAMS(address account)` — remove from RAMS (owner only).
* `updateLtafPercentage(uint256 percentage)` — update the LTAF allowance percent (owner only).
* `_authorizeUpgrade(address newImplementation)` — authorize upgrade (owner only — internal/protected in many implementations).

---

## LTAF (Long-Term Active Fund)

**Purpose:** grant selected addresses the ability to perform larger monthly transfers than standard holders. Useful for distribution wallets, charitable disbursements, or key operational needs.

* Default `ltafPercentage` is 50% (configurable by owner).
* `includeInLTAF(address)` toggles membership; only owner may call.
* If an address is in LTAF, transfer checks use `ltafPercentage` of the current balance to validate the allowed transfer amount.
* An address cannot be in both LTAF and RAMS simultaneously; inclusion in one forces exclusion from the other.

**Note:** LTAF does not override blacklisting — a blacklisted LTAF address still cannot transfer.

---

## RAMS (Regressive Anti‑Manipulation Strategy)

**Purpose:** reduce risks of price manipulation and large dumps by applying time-based monthly transfer caps.

* Default behavior: all holders are in RAMS unless specifically excluded by the owner.
* The contract holds a `levels` mapping of (start, end, percentage). The currently active level is selected by current timestamp.
* The active `percentage` (MPP/PMP) is applied to a holder's balance to compute the monthly transferable maximum.
* `updateUserInfo` (internal) refreshes monthly counters and ensures enforcement when transfer attempts occur.

Example: If the active level is 15% and a holder has 100 AOC, they may transfer up to 15 AOC in that month.

---

## Owner / admin functions & upgradeability

* **Owner role:** The owner has privileged capabilities:

  * Add/remove addresses from RAMS/LTAF.
  * Update `ltafPercentage`.
  * Blacklist/whitelist addresses.
  * Authorize upgrades to the implementation (proxy pattern).
  * Renounce ownership permanently.

* **Upgradeability:** The contract follows an upgradeable pattern. The `_authorizeUpgrade` function is owner-restricted.

  * **Security note:** Upgradability introduces power to change logic; if the owner keeps the key, they can change rules. Renouncing ownership disables future upgrades (if `_authorizeUpgrade` checks owner) depending on implementation.

---

## Initialization & deployment notes (no minting)

Because minting is removed, the project should follow one of these deployment patterns for a fixed supply:

1. **Supply set at deployment/initialize:** The deployer supplies `initialSupply` to `initialize()` or constructor. The full supply is assigned to a specified distribution address (for example, the deployer or a distribution wallet).
2. **Pre-funded deployment:** Use constructor/initialize to accept a `fixedSupply` and assign balances internally without exposing a mint() method.

**Important:** Ensure that the `initialize` routine does not call any internal `_mint` helper that would be kept accessible. Instead, assign the initial total supply to an address using a secure `balances[recipient] += initialSupply; _totalSupply = initialSupply;` pattern within initialize — and ensure `_mint` is not present in the public ABI.

---

## Interacting with the contract (examples)

### Using Ethers.js (read)

```js
// read example (ethers.js)
const { ethers } = require('ethers');
const provider = new ethers.providers.JsonRpcProvider("https://data-seed-prebsc-1-s1.binance.org:8545/"); // BSC testnet RPC
const aocAddress = "0x1E803f70e0132b2A3dAC52466b14b245A08bF3d4";
const abi = [
  "function name() view returns (string)",
  "function symbol() view returns (string)",
  "function decimals() view returns (uint8)",
  "function totalSupply() view returns (uint256)",
  "function balanceOf(address) view returns (uint256)",
  "function includedInRAMS(address) view returns (bool)",
  "function includedInLTAF(address) view returns (bool)"
];
const contract = new ethers.Contract(aocAddress, abi, provider);
(async () => {
  console.log('name:', await contract.name());
  console.log('symbol:', await contract.symbol());
  console.log('supply:', (await contract.totalSupply()).toString());
})();
```

### Using Ethers.js (write — transfer)

```js
const signer = new ethers.Wallet(PRIVATE_KEY, provider);
const contractWithSigner = new ethers.Contract(aocAddress, abi, signer);
await contractWithSigner.transfer("0xRecipientAddress", ethers.utils.parseUnits("1.0", 18));
```

**Using BscScan:** If you want to call write functions through BscScan, go to the contract page → "Write Contract" tab → connect your Web3 wallet and call the desired function (transfer, approve, etc.).

---

## Security considerations & recommendations

* **Audit:** Have an independent security audit performed (especially around RAMS/LTAF logic and upgradeability hooks). Clearly state in the repo whether renounceOwnership is recommended after a stable release.
* **Upgradability risk:** Owner-controlled upgrades can change contract logic. If the intent is immutability after launch, renouncing ownership or using a timelock multisig for upgrades is recommended.
* **Blacklisting and centralization:** Owner blacklisting is a centralization risk; document policies for how/when blacklists are used and who controls the owner key.
* **Time-based logic:** Ensure timestamps and timezone assumptions are robust — use unix timestamps and comparisons against block.timestamp.
* **Testing:** Unit tests should exercise monthly reset logic, boundary dates (start/end of levels), interactions between RAMS and LTAF, and edge cases like transferring exactly the allowed percentage.

---

## Verification, testing, and audits

* **Verify on BscScan**: Publish and verify source code so users can inspect the implementation. Use the proxy verification flow if using upgradeable proxies.
* **Testing checklist:**

  * Transfers below/at/above allowed thresholds in RAMS and LTAF.
  * Attempting transfers by blacklisted accounts.
  * Approve/transferFrom workflows and allowance edge cases.
  * Upgrade flow (test in staging with a mock implementation and restricted owner key).
---
## END OF THE DOCUMENT
