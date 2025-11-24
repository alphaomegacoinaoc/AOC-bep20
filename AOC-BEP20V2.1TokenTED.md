## Alpha Omega Coin (AOC), The Queen of cryptocurrencies


# Technical Explanatory Documentation (TED)

                                                              
# About 

# AOC BEP20 V2.1 Token Smart Contract 

# Overview
**Alpha Omega Coin (AOC)**, **The Queen of Cryptocurrencies**, operates on an interoperable **M**onetary, **F**inancial and **E**conomic **G**alaxy (**AOC MFEG**)  which is composed of **AOC C**oin (=**AOC M**other **C**oin) and **several tokens** **including** the **AOC BEP20 Token** the **version 2.1** (**=** **AOC BEP20 V2.1 Token**) of which we are dealing with in this **T**echnical **E**xplanatory **D**ocumentation (=**TED**) .


**AOC BEP20 Token V2.1 smart contract** is an **ERC20-compliant token** with **AOC level 2** **M**arket **A**nti-**M**anipulation **F**unctionality (**MAMF**) called **R**egressive **A**nti-**M**anipulation **S**trategy  (**RAMS**), **AOC level 3** **M**arket **A**nti-**M**anipulation **F**unctionality  (**MAMF**) called  **L**oyalty **T**ransaction **A**uthorization **F**unctionality (**LTAF**), **blacklisting**, etc. It has **no** **burning** and **no** **minting** **features**.


In this **TED**, for **M**emory **R**ecords (**MR**), **C**ommunity **E**ducation (**CE**), **A**dministrative **C**ontinuity (**AC**)  and for **A**udit **S**ervices (**AS**) sake, **AOC Core Team** and **AOC Web3 Team** are **providing technical guidance** on **AOC BEP20 Token V2.1 smart contract.**



# Part 1 : Alpha Omega Coin  (AOC) BEP20 V2.1 Token  Identification Core Details
- **Name**: Alpha Omega Coin (AOC)
- **Symbol**: AOC
- **Decimals**: 18
- **Initial Fixed Supply** : 1,000,000,000,000 (1 trillion)
- **Total Maximum Fixed Supply** : 1,000,000,000,000 (1 trillion) No minting and No Burning
- **TYPE**: **U**tility, **D**onation, **C**harity and **P**ayment **T**oken (**UDCPT**) 
- **Network** / **Blockchain**: **B**inance **S**mart **C**hain (**BSC**)
- **Version** : Version 2.1 (V2.1)
- **Upgradeability**: Uses OpenZeppelin UUPS (Universal Upgradeable Proxy Standard)
- **Pausable**: Multi-sig Owners can pause/unpause transfers for security sake, migration sake or for a community-oriented intervention
- **Blacklist**: Multi-Sig Owners can block addresses from sending/receiving tokens for security sake, scam prevention, protection from malicious attacks and also for internal regulations sake




# Part 2 : Alpha Omega Coin  (AOC) BEP20 V2.1 Token  Smart Contract Testnet + Mainnet Codes Identification Urls 
# Testnet : 
**Explorer**:  https://testnet.bscscan.com/address/0xbc0F73B52D6F37e527B07Bb01301C77Bf9716489#writeProxyContract
  
**Github** : 
- **Branch Name:** testnet-aoc-bep20-v2.1-token
- **Branch Link:** https://github.com/alphaomegacoinaoc/AOC-bep20-V2-token-smart-contract/blob/testnet-aoc-bep20-v2.1-token/contracts/AOC-bep20-V2.1-token.sol


## Mainnet :
**Explorer**: https://bscscan.com/address/0x41ab98fbd2509bf573cb93dbe15d50d970d96957#readProxyContract
  
**Github** : 
- **Branch Name:** main-aoc-bep20-v2.1-token
- **Branch Link:** https://github.com/alphaomegacoinaoc/AOC-bep20-V2-token-smart-contract/blob/main-aoc-bep20-V2.1-token/contracts/AOC-bep20-V2.1-token.sol



# Part 3 : Alpha Omega Coin  (AOC) BEP20 V2.1 Token  Multi-Sig Smart Contract Testnet + Mainnet Codes Identification Urls 
# Testnet : 
**Explorer:**  https://testnet.bscscan.com/address/0x6cddB529f72Dccb700ADCB4C1c26eD01f6562F7E#code
**Github :** 
**Branch Name:** 
**Branch Link: **

# Mainnet :
**Explorer:** https://bscscan.com/address/0x4B723e1FCcca5A883fEEf8923701AECbd46fEAd1#readProxyContract
**Github : **
Branch Name: 
Branch Link:



# Part 4 : Alpha Omega Coin  (AOC) BEP20 V2.1 Token  Smart Contract Read + Write Functions
4.1 Read  Functions
- Function: name()
What it does: Returns the token name ("Alpha Omega Coin").
Purpose: Provides the token’s name for external use.
- Function: symbol()
What it does: Returns the token symbol ("AOC").
Purpose: Provides the token’s symbol for external use.
- Function: decimals()
What it does: Returns the number of decimals (18).
Purpose: Specifies token precision for calculations and display.
- Function: totalSupply()
What it does: Returns the total AOC token supply (initially 1 trillion).
Purpose: Shows the total circulating tokens.
- Function: balanceOf(address account)
What it does: Returns the token balance of a specified address.
Purpose: Allows querying an account’s AOC BEP20 V2.1 balance.
- Function: allowance(address owner, address spender)
What it does: Returns the remaining allowance a spender has for an owner’s tokens.
Purpose: Checks how many AOC BEP20 V2.1 Tokens  a spender can transfer on behalf of the owner.

## 4.2 Write  Functions
- Function: initialize()
What it does: Sets up the contract with 1 trillion AOC BEP20 V2.1 tokens, name ("Alpha Omega Coin"), symbol ("AOC"), 18 decimals, four levels  of transfer regulation (20% for January 1, 2022–January 1, 2024 ; 15% for January 2, 2024–January 1, 2026; 10% for January 2, 2026–January 1, 2028; 10% for January 2, 2028), and initial LTAF percentage of 50%.
Purpose: Initializes  AOC BEP20 V2.1 Token   properties, creates initial supply to the deployer, and configures transfer regulation levels.
- Function: _authorizeUpgrade(address)
What it does: Authorizes a contract upgrade (owner-only).
Purpose: Enables future improvements to the contract securely.
- Function: transfer(address recipient, uint256 amount)
What it does: Transfers AOC BEP20 V2.1 tokens from the sender to the recipient, respecting regulation (blacklist, LTAF/RAMS, level-based limits).
Purpose: Enables users to send AOC BEP20 V2.1 tokens to others.

## Approve Function
What It Does: Allows you to grant permission to another party (like a person or an app) to spend a specific amount of your AOC BEP20 V2.1 tokens on your behalf. It records this permission and logs it publicly.
Purpose: Lets you trust apps (like exchanges or staking platforms) to handle your  AOC BEP20 V2.1 tokens without giving them full control of your wallet.
Example: Imagine you want to trade 100 AOC BEP20 V2.1 tokens on a crypto exchange. You use approve to allow the exchange to spend AOC BEP20 V2.1 tokens from your wallet. The exchange can now move those tokens when you trade, but only up to AOC BEP20 V2.1 tokens.
Why It Matters: This keeps your  AOC BEP20 V2.1 tokens safe while letting apps like exchanges or games use them for you, as long as they follow AOC BEP20 V2.1 Token’s rules (like limits on transfers).
RenounceOwnership Function
What It Does: Permanently removes the contract’s owner by setting ownership to a null address, disabling all owner-only controls (like blacklisting or pausing). It logs this change publicly with an OwnershipTransferred event.
Purpose: Makes the AOC BEP20 V2.1 Token contract fully decentralized, ensuring no one can control or change its rules, which builds trust with users.
Simple Example: Imagine you create an AOC BEP20 V2.1 Token for a community project. To prove it’s fair and not controlled by your company, you use renounceOwnership . Now, no one can pause the contract or change its settings, making it run independently like a public utility.
Why It Matters: Shows users the contract is trustless and not controlled by anyone, but it’s a one-time action—once done, you can’t manage the contract anymore.
Purpose: To permanently remove central control and make the contract fully autonomous

## TransferFrom Function
What It Does: Allows an approved party (e.g., an app or contract) to move AOC BEP20 V2.1 tokens from your wallet to another address, if you’ve given permission with the approve function. It checks AOC BEP20 V2.1 Token’s rules (like blacklisting or monthly transfer limits) and updates balances and permissions, logging a Transfer event.
Purpose: Lets apps like exchanges or staking platforms move your  AOC BEP20 V2.1 tokens for you, making AOC BEP20 V2.1 token usable in automated systems.
Simple Example: Suppose you approve a crypto exchange to use AOC BEP20 V2.1 tokens from your wallet. When you trade, the exchange uses transferFrom to send AOC BEP20 V2.1 tokens to another user’s wallet to complete the trade. The transfer follows AOC BEP20 V2.1 Token’s rules, like not exceeding 50%  of your balance monthly if you’re in the LTAF program.
Why It Matters: Enables AOC BEP20 V2.1 Token  to work with apps for trading or payments, while ensuring all transfers follow the contract’s strict limits for security.
## includeInLTAF(address account)
What It Does: This function adds a specific wallet address (like a user’s crypto account) to LTAF. Once added, the user can only transfer up to 50%   of their  AOC BEP20 V2.1 tokens each month. It also resets their monthly transfer records to start fresh. Only the contract owner (Multi-Sig Signers) can use this function.
Purpose: LTAF  provides flexibility for authorized AOC Still Committed Actors  (e.g., Administrators; Members; or trusted entities ) to conduct significant transactions when necessary (mainly in charity-based actions), bypassing the restrictive RAMS  limits.
Simple Example: 
Imagine you are an Active AOC  Member holding AOC BEP20 V2.1 tokens on December 1  , 2025 where you are normally subject to 15% MPP.
If you’re added to LTAF on December 1 , 2025, you can transfer or trade 50 AOC BEP20 V2.1 tokens. This helps you realise a huge budget project or business… 
The Muti-Sig Signers use this function to motivate Results-Driving AOC  Actors who keep fighting for AOC growth…
Why It Matters: AOC  Core Team uses this to distinguish or to decorate Still Engaged AOC  Actors. It's a strict rule that only the Multi-Sig Signers can apply.
Implementation in Contract:
The includedInLTAF mapping identifies addresses authorized for LTAF, controlled by the Multi-Sig Signers.
The ltafPercentage variable (default 50% ) sets the maximum percentage of a user’s balance that can be transferred in a single or multiple transactions for LTAF-authorized accounts.
In the _transfer function, if a sender is included in LTAF, their transfer amount is validated against ltafPercentage of their balance instead of the RAMS level percentage.
The owner(Signers) can update ltafPercentage using the updateLtafPercentage function.
excludedFromLTAF(address account)
What It Does: This function removes a wallet address from the LTAF, meaning the user is no longer allowed to transfer 50% of their AOC BEP20 V2.1 tokens per month. From there, the said wallet falls back under RAMS restrictions. The AOC BEP20 V2.1 token’s contract records when this happens (like a timestamp) to track the change. Only the Multi Sig Signers can use this function.
Purpose: To remove a user from the LTAF transfer increase, obliging them to fall back under RAMS, and trade their tokens instead of the 50% monthly cap (though other rules, like RAMS, might still apply).
Simple Example: If you were in LTAF and could send up to 50 units  out of your 100 AOC BEP20 V2.1 tokens per month, this function removes that allowance or grace. Now you cannot send all AOC BEP20 V2.1 tokens if you want, as long as you fall under other transaction regulation  rules.
Why It Matters: It helps remove users back to RAMS restrictions.
includeInRAMS(address account)

## BASIC NOTIONS

Alpha Omega Coin (AOC) - The Queen of cryptocurrencies , is the very first cryptocurrency in the world which is equipped with Market Anti-Manipulation Functionalities or Strategies (MAMF or MAMS). Multi-levels, MAMF or MAMS include RAMS.    

RAMS = Regressive Anti-Manipulation Strategy , is also called RAMF = Regressive Anti-Manipulation Functionality.
RAMS protects AOC BEP20 V2.1 token’s price, market , ecosystem and community  from price flooding, dumping , manipulation and from waste of wealth, by limiting transaction sizes, promoting stability and long-term commitment from holders.
What  Does includeInRAMS(address account) do?
This function adds by default all AOC BEP20 V2.1 Token Holders’ wallets to RAMS, which limits how many AOC BEP20 V2.1 Tokens a user can transfer on the first day of each month, from  (2 PM GMT+1).
RAMS is enforced through a levels mapping, with specific time periods and decreasing transfer regulations :
Period of time: 1 Jan 2022 – 1 Jan 2024 → 20% transfer limit
Period of time: 2 Jan 2024 – 1 Jan 2026 → 15% transfer limit
Period of time: 2 Jan 2026 – 1 Jan 2028 → 10% transfer limit
Period of time: 2 Jan 2028 and onwards → 5% transfer limit,
REMINDER: 20%, 15%, 10% and 5% are each called MPP (Monthly Permissive Percentage) or PMP (Permissive Monthly Percentage). 

The function also ensures the user isn’t in LTAF (they can’t be in both systems). Only the Multi Sig Signers can add someone to RAMS.
Purpose: To regulate how much AOC BEP20 V2.1 Tokens users can send or trade over time, with stricter limits as years pass. This encourages holding tokens longer and prevents large and sudden transfers.
Simple Example: If you have 100 AOC BEP20 V2.1 Tokens and it’s during January 2, 2024–January 1, 2026, being in RAMS means you can only send 15 AOC BEP20 V2.1 Tokens per month (15% of your balance). If you try to send more, the transaction fails.  
The Mutli-Sig Signers  might add you to RAMS if you’re a big contributor to prevent market dumps.
Why It Matters: It keeps the AOC BEP20 V2.1 Token stable by spreading out transfers over time, especially for users with lots of tokens.

## excludeFromRAMS(address account)
What It Does: This function removes a wallet address from RAMS, so the user no longer faces the level-based monthly transfer limits (20%, 15%, 10%, or 5%). The contract logs when this happens. Only the Mutli-Sig Signers  can use this function.
Purpose: To lift the RAMS restrictions , allowing a user to transfer their AOC BEP20 V2.1 Tokens freely (unless they’re in LTAF or blacklisted).
Simple Example: If you’re in RAMS and limited to sending 10 AOC BEP20 V2.1 Tokens out of 100 in 2026, this function removes that limit. You can now send all 100 AOC BEP20 V2.1 Tokens in one go, assuming no other transfer regulations apply. The Mutli-Sig Signers might do this as a very particular reward.
Why It Matters: It gives users more freedom to use their tokens once they are granted special permission to use them freely.
This function (excludeFromRAMS) is mainly set to allow the AOC BEP20 V2.1 Token (Regular) Distribution Wallet to continue distributing AOC BEP20 V2.1 Tokens to eligible members, holder category by holder category, without interruption, until the distribution timeframe or deadline allocated to each holder category has expired.

## updateLtafPercentage(uint256 percentage)
What It Does: This function lets the Mutli-Sig Signers  change the LTAF monthly transfer limit percentage (default is 50%). For example, they could set it to 40%, meaning LTAF users can only transfer 40% of their balance per month. Only the Mutli-Sig Signers  can make this change.
Purpose: To adjust how strict the LTAF rules are, depending on the needs of the AOC BEP20 V2.1 Token ecosystem, like market conditions or user behavior.
Simple Example: If the LTAF limit is 50% and you have 100 AOC BEP20 V2.1 Tokens, you can send 50 AOC BEP20 V2.1 Tokens per month. If the admin changes it to 30%, you can only send 30 AOC BEP20 V2.1 Tokens  per month. This helps the Mutli-Sig Signers  fine-tune how much users can move.
Why It Matters: It gives the contract Mutli-Sig Signers  flexibility to tighten or loosen LTAF restrictions, helping balance AOC BEP20 V2.1 Token stability and user freedom.

## updateUserInfo(address account, uint256 year, uint256 month)
What It Does: This internal function (not directly callable by users or visible in the explorer) updates a users  AOC BEP20 V2.1 Tokens’ balance and their RAMS level (based on the current year), and their monthly transfer records. It runs automatically when a user tries to transfer AOC BEP20 V2.1 Tokens, ensuring their limits are up-to-date.
Purpose: To keep track of a user’s current balance and restrictions (RAMS or LTAF) accurately, resetting transfer counts at the start of each month or year.
Simple Example: From January 2, 2024 to January 1, 2026, if you are in RAMS, this function checks your balance (say, 100 AOC BEP20 V2.1 Tokens) and sets your transfer limit or MPP / PMP to 15% (15 AOC BEP20 V2.1 Tokens / month) because it falls within the RAMS Second Active Timeline (RAMS SAT), which is January 2, 2024 - January 1, 2026. It also resets your monthly transfer count to zero if it’s a new month. This happens behind the scenes when you try to send AOC BEP20 V2.1 tokens.
Why It Matters: It ensures the system always knows how many AOC BEP20 V2.1 tokens you can send based on the current time and your restrictions, keeping everything fair and accurate.

## Function:addLevels(uint256 level, uint256 startDay, uint256 endDay, uint256 percentage)
What it does: Sets transfer limit levels with start/end timestamps and a percentage limit (MPP (Monthly Permissive Percentage) or PMP (Permissive Monthly Percentage) (internal).
Purpose: Defines time-based transfer limits for users during initialization.



