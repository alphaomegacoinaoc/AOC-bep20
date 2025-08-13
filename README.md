
## Alpha Omega Coin (AOC) Project

# Overview:
Alpha Omega Coin (AOC) is a Solidity-based BEP-20 token on BNB Smart Chain, designed with upgradeable smart contracts. It includes advanced features like transfer restrictions, blacklisting, and bulk operations for efficient token management. The project consists of two main contracts: AlphaOmegaCoin and BulkOperations.

# AlphaOmegaCoin

This is the core BEP-20 token contract with additional features for controlling token transfers and user restrictions.

## Key Features
# Token Details:
Name: Alpha Omega Coin (AOC)
Symbol: AOC
Decimals: 18
Initial Supply: 1 trillion tokens (1,000,000,000,000 AOC)
Upgradeability: Uses OpenZeppelin's UUPS (Universal Upgradeable Proxy Standard) for secure upgrades.
Pausability: The owner can pause/unpause token transfers for security or maintenance.
Blacklisting: The owner can blacklist addresses to prevent them from sending or receiving tokens.

# Transfer Restrictions:
LTAF: Limits token transfers to a percentage (default 60%) of a user's balance per month for included addresses.
RAMS: Limits transfers based on predefined levels (1-4) with time-based percentage caps (20%, 15%, 10%, 5%).
Users can be included/excluded from LTAF or RAMS, with restrictions resetting monthly.

## Levels: 
Four time-based levels control transfer limits:
Level 1 (January 1, 2022 – January 1, 2024)=> 20% transfer limit
Level 2 (January 2, 2024 – January 1, 2026)=> 15% transfer limit
Level 3 (January 2, 2026 – January 1, 2028)=> 10% transfer limit
Level 4 (January 2, 2028 onward)=> 5% transfer limit

REMINDER: 20% , 15%, 10% and 5% are each called MPP (Monthly Permissive Percentage) or PMP (Permissive  Monthly Percentage).

## Reentrancy Protection: 
Prevents reentrancy attacks during transfers.

## Events: 
Emits events for blacklisting, LTAF/RAMS inclusion/exclusion, and LTAF percentage updates.

## Read Functions 
Function: name()
What it does: Returns the token name ("Alpha Omega Coin").
Purpose: Provides the token’s name for external use.

Function: symbol()
What it does: Returns the token symbol ("AOC").
Purpose: Provides the token’s symbol for external use.

Function: decimals()
What it does: Returns the number of decimals (18).
Purpose: Specifies token precision for calculations and display.

Function: totalSupply()
What it does: Returns the total AOC token supply (initially 1 trillion).
Purpose: Shows the total circulating tokens.

Function: balanceOf(address account)
What it does: Returns the token balance of a specified address.
Purpose: Allows querying an account’s AOC balance.

Function: allowance(address owner, address spender)
What it does: Returns the remaining allowance a spender has for an owner’s tokens.
Purpose: Checks how many tokens a spender can transfer on behalf of the owner.

## Write Functions
# Function: initialize()
What it does: Sets up the contract with 1 trillion AOC tokens, name ("Alpha Omega Coin"), symbol ("AOC"), 18 decimals, four levels of transfer restrictions (20% for January 1, 2022–January 1, 2024 ; 15% for January 2, 2024–January 1, 2026; 10% for January 2, 2026–January 1, 2028; 10% for January 2, 2028), and initial LTAF percentage of 50%.
Purpose: Initializes token properties, creates initial supply to the deployer, and configures transfer restriction levels.

# Function: _authorizeUpgrade(address)
What it does: Authorizes a contract upgrade (owner-only).
Purpose: Enables future improvements to the contract securely.

# Function: transfer(address recipient, uint256 amount)
What it does: Transfers tokens from the sender to the recipient, respecting restrictions (blacklist, LTAF/RAMS, level-based limits).
Purpose: Enables users to send AOC tokens to others.

# Function: Approve()
What It Does: Allows you to give permission to another party (like a person or an app) to spend a specific amount of your AOC tokens on your behalf. It records this permission and logs it publicly.
Purpose: Lets you trust apps (like exchanges or staking platforms) to handle your tokens without giving them full control of your wallet.
Example: Imagine you want to trade 100 AOC on a crypto exchange. You use approve to allow the exchange to spend 100 AOC from your wallet. The exchange can now move those tokens when you trade, but only up to 100 AOC.
Why It Matters: This keeps your tokens safe while letting apps like exchanges or games use them for you, as long as they follow AOC’s rules (like limits on transfers).

# Function: RenounceOwnership
What It Does: Permanently removes the contract’s owner by setting ownership to a null address, disabling all owner-only controls (like blacklisting or pausing). It logs this change publicly with an OwnershipTransferred event.
Purpose: Makes the AOC contract fully decentralized, ensuring no one can control or change its rules, which builds trust with users.
Simple Example: Imagine you create an AOC token for a community project. To prove it’s fair and not controlled by your company, you use renounceOwnership. Now, no one can pause the contract or change its settings, making it run independently like a public utility.
Why It Matters: Shows users the contract is trustless and not controlled by anyone, but it’s a one-time action—once done, you can’t manage the contract anymore.
Purpose: Restores access for a previously blacklisted address.

# Function: TransferFrom
What It Does: Allows an approved party (e.g., an app or contract) to move AOC tokens from your wallet to another address, if you’ve given permission with the approve function. It checks AOC’s rules (like blacklisting or monthly transfer limits) and updates balances and permissions, logging a Transfer event.
Purpose: Lets apps like exchanges or staking platforms move your tokens for you, making AOC usable in automated systems.
Simple Example: Suppose you approve a crypto exchange to use 100 AOC from your wallet. When you trade, the exchange uses transferFrom to send 50 AOC to another user’s wallet to complete the trade. The transfer follows AOC’s rules, like not exceeding 50% of your balance monthly if you’re in the LTAF program.
Why It Matters: Enables AOC to work with apps for trading or payments, while ensuring all transfers follow the contract’s strict limits for security.

# Function: includeInLTAF(address account)
What It Does: This function adds a specific wallet address (like a user’s crypto account) to the (LTAF). Once added, the user can only transfer up to 50% of their AlphaOmegaCoin (AOC) tokens each month. It also resets their monthly transfer records to start fresh. Only the contract owner (like an admin) can use this function.
Purpose: LTAF provides flexibility for authorized AOC Still Committed Actors (e.g., Administrators ; Members; or trusted entities) to conduct significant transactions when necessary(mainly in charity-based actions), bypassing the restrictive RAMS limits.
Simple Example: 
Imagine you are an active AOC Member holding  100 AOC tokens on the first day of July 1, 2025 where you are normally subject to 15% MPP. 
If you’re added to LTAF on July 1, 2025, you can transfer  or trade 50 AOC. This helps you realise a huge budget project or business… 
The admin uses this function to motivate  results-driving AOC actors who keep fighting for AOC growth…
Why It Matters AOC Core Team uses this to distinguish or to decorate Still Engaged AOC actors. It's a strict rule that only the contract owner can apply.
Implementation in Contract:
The includedInLTAF mapping identifies addresses authorized for LTAF, controlled by the contract owner.
The ltafPercentage variable (default 50%) sets the maximum percentage of a user’s balance that can be transferred in a single transaction for LTAF-authorized accounts.
In the _transfer function, if a sender is included in LTAF, their transfer amount is validated against ltafPercentage of their balance instead of the RAMS level percentage.
The owner can update ltafPercentage using the updateLtafPercentage function.

# Function: excludedFromLTAF(address account)
What It Does: This function removes a wallet address from the LTAF, meaning the user is no longer allowed to transfer 50% of their AOC tokens per month. From there, the said wallet falls back under RAMS restrictions …The contract owner records when this happens (like a timestamp) to track the change. Only the owner can use this function.
Purpose: To remove a user from the LTAF transfer increase, obliging them to fall back under RAMS , and trade their tokens without the 50% monthly cap (though other rules, like RAMS, might still apply).
Simple Example: If you were in LTAF and could send up to 50 AOC out of your 100 tokens per month, this function removes that allowance or grace. Now you cannot  send all 100 AOC if you want, as long as you fall under other restriction  rules.
Why It Matters: It helps remove users back to RAMS …

# Function: includeInRAMS(address account)
BASIC NOTIONS
AOC is the first cryptocurrency in the world which is equipped with Multi-Level Market Anti-Manipulation Functionalities or Strategies (MLMAMF or MLMAMS) including RAMS. 
RAMS = Regressive Anti-Manipulation Strategy also called RAMF = Regressive Anti-Manipulation Functionality
RAMS Protects AOC BEP20 Token  ecosystem and market from price dumping and manipulation by limiting transaction sizes, promoting stability and long-term commitment from holders.
What  Does includeInRAMS(address account) do?
This function adds by default all AOC BEP20 Token Holders wallets to the (RAMS), which limits how many AOC tokens a user can transfer on the first day of each month, by                     2 PM GMT+1.
RAMS is enforced through a levels mapping, with specific time periods and decreasing transfer limits:
- Period of time: 1 Jan 2022 – 1 Jan 2024 → 20% transfer limit
- Period of time: 2 Jan 2024 – 1 Jan 2026 → 15% transfer limit
- Period of time: 2 Jan 2026 – 1 Jan 2028 → 10% transfer limit
- Period of time: 2 Jan 2028 and onwards → 5% transfer limit
REMINDER: 20% , 15%, 10% and 5% are each called MPP (Monthly Permissive Percentage) or PMP (Permissive  Monthly Percentage). 
The function also ensures the user isn’t in LTAF (they can’t be in both systems). Only the contract owner can add someone to RAMS.
Purpose: To control how much AOC users can send or trade over time, with stricter limits as years pass. This encourages holding tokens longer and prevents large, sudden transfers.
Simple Example: If you have 100 AOC tokens and it’s during  January 2, 2024–January 1, 2026, being in RAMS means you can only send 15 AOC per month (15% of your balance). If you try to send more, the transaction fails. The admin might add you to RAMS if you’re a big contributor to prevent market dumps.
Why It Matters: It keeps the AOC token stable by spreading out transfers over time, especially for users with lots of tokens.

# Function: excludeFromRAMS(address account)
What It Does: This function removes a wallet address from RAMS, so the user no longer faces the level-based monthly transfer limits (20%, 15%, 10%, or 5%). The contract owner logs when this happens. Only the owner can use this function.
Purpose: To lift the RAMS restrictions, allowing a user to transfer their AOC tokens freely (unless they’re in LTAF or blacklisted).
Simple Example: If you’re in RAMS and limited to sending 10 AOC out of 100 in 2026, this function removes that limit. You can now send all 100 AOC in one go, assuming no other restrictions apply. The admin might do this as a reward….
Why It Matters: It gives users more freedom to use their tokens once they are granted special grace to enjoy them…

# Function: updateLtafPercentage(uint256 percentage)
What It Does: This function lets the contract owner change the LTAF monthly transfer limit percentage (default is 50%). For example, they could set it to 40%, meaning LTAF users can only transfer 40% of their balance per month. Only the owner can make this change.
Purpose: To adjust how strict the LTAF rules are, depending on the needs of the AOC ecosystem, like market conditions or user behavior.
Simple Example: If the LTAF limit is 50% and you have 100 AOC, you can send 50 AOC per month. If the admin changes it to 30%, you can only send 30 AOC per month. This helps the admin fine-tune how much users can move.
Why It Matters: It gives the contract owner flexibility to tighten or loosen LTAF restrictions, helping balance token stability and user freedom.

# Functino: updateUserInfo(address account, uint256 year, uint256 month)
What It Does: This internal function (not directly callable by users or visible in the explorer) updates a user’s AOC balance, their RAMS level (based on the current year), and their monthly transfer records. It runs automatically when a user tries to transfer tokens, ensuring their limits are up-to-date.
Purpose: To keep track of a user’s current balance and restrictions (RAMS or LTAF) accurately, resetting transfer counts at the start of each month or year.
Simple Example: From January 2, 2024 to January 1, 2026, if you are in RAMS, this function checks your balance (say, 100 AOC) and sets your transfer limit to 15% (15 AOC/month) because it’s the RAMS Second Active Timeline (RAMS SAT) that is January 2, 2024 - January 1, 2026. It also resets your monthly transfer count to zero if it’s a new month. This happens behind the scenes when you try to send tokens.
Why It Matters: It ensures the system always knows how many tokens you can send based on the current time and your restrictions, keeping everything fair and accurate.

# Function: addLevels(uint256 level, uint256 startDay, uint256 endDay, uint256 percentage)
What it does: Sets transfer restriction levels with start/end timestamps and a percentage limit (internal).
Purpose: Defines time-based transfer limits for users during initialization.

## How It Works
- Users can transfer tokens unless blacklisted or restricted by LTAF/RAMS.
- LTAF restricts transfers to a percentage of a user’s balance monthly.
- RAMS applies level-based restrictions, updated monthly based on the user’s balance and the current time.
- The owner can manage blacklists, LTAF/RAMS status, and update the LTAF percentage.

## Dependencies
OpenZeppelin Contracts: Uses upgradeable versions of BEP-20, Ownable, Pausable, ReentrancyGuard, and UUPS.
DateTime Library: A custom library for handling timestamp-to-date conversions for LTAF/RAMS restrictions.

## Setup and Deployment
# Install Dependencies:
Install OpenZeppelin contracts: npm install @openzeppelin/contracts-upgradeable

# Configure:
Set up ownership, LTAF/RAMS inclusions, and blacklists as needed.

# Usage
For Users:
Transfer AOC tokens using transfer or transferFrom, respecting LTAF/RAMS limits.
Check balances with balanceOf and allowances with allowance.

# For Admins (Owner):
Blacklist/remove users with blacklistUser/removeFromBlacklist.
Manage LTAF/RAMS with includeInLTAF, excludeFromLTAF, includeInRAMS, excludeFromRAMS.
Update LTAF percentage with updateLtafPercentage.
Perform bulk transfers with bulkTransfer or request distributions with bulkDistribution.

# Security
Upgradeability: Use UUPS to upgrade contracts securely, with the owner controlling upgrades.
Pausability: Pause transfers during emergencies.
ReentrancyGuard: Protects against reentrancy attacks.
Blacklisting: Prevents malicious addresses from participating.
Restricted Transfers: LTAF/RAMS ensure controlled token circulation.

# Deploy AlphaOmegaCoin:
Deploy with the initializer to mint 1 trillion tokens to the deployer and set initial LTAF percentage (60%) and levels.
