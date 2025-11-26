# Alpha Omega Coin (AOC), The Queen of cryptocurrencies
<br>

# Technical Explanatory Documentation (TED)

                                                              
## About 

# AOC BEP20 V2.1 Token Smart Contract 
<br>

# Overview
**Alpha Omega Coin (AOC)**, **The Queen of Cryptocurrencies**, operates on an interoperable **M**onetary, **F**inancial and **E**conomic **G**alaxy (**AOC MFEG**)  which is composed of **AOC C**oin (=**AOC M**other **C**oin) and **several tokens** **including** the **AOC BEP20 Token** the **version 2.1** (**=** **AOC BEP20 V2.1 Token**) of which we are dealing with in this **T**echnical **E**xplanatory **D**ocumentation (=**TED**) .


**AOC BEP20 Token V2.1 smart contract** is an **ERC20-compliant token** with **AOC level 2** **M**arket **A**nti-**M**anipulation **F**unctionality (**MAMF**) called **R**egressive **A**nti-**M**anipulation **S**trategy  (**RAMS**), **AOC level 3** **M**arket **A**nti-**M**anipulation **F**unctionality  (**MAMF**) called  **L**oyalty **T**ransaction **A**uthorization **F**unctionality (**LTAF**), **blacklisting**, etc. It has **no** **burning** and **no** **minting** **features**.


In this **TED**, for **M**emory **R**ecords (**MR**), **C**ommunity **E**ducation (**CE**), **A**dministrative **C**ontinuity (**AC**)  and for **A**udit **S**ervices (**AS**) sake, **AOC Core Team** and **AOC Web3 Team** are **providing technical guidance** on **AOC BEP20 Token V2.1 smart contract.**



# Part 1 : Alpha Omega Coin  (AOC) BEP20 V2.1 Token  Identification Core Details
- **Name**: Alpha Omega Coin (AOC)
- **Symbol**: AOC
- **Decimals**: 18
- **Initial Fixed Supply** : 1,000,000,000,000 (**1 trillion**)
- **Total Maximum Fixed Supply** : 1,000,000,000,000 (**1 trillion**) _**No minting and No Burning**_
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
- **Branch Name:** testnet-v1.0.0
- **Branch Link:** https://github.com/alphaomegacoinaoc/alphaomegacoinaoc-Multi-Sig-Contract/blob/testnet-v1.0.0/MultiSigTokenVault.sol

# Mainnet :
**Explorer:** https://bscscan.com/address/0x4B723e1FCcca5A883fEEf8923701AECbd46fEAd1#readProxyContract

**Github :**
- **Branch Name:** Mainnet-v1.0.0
- **Branch Link:** https://github.com/alphaomegacoinaoc/alphaomegacoinaoc-Multi-Sig-Contract/blob/Mainnet-v1.0.0/MultiSigTokenVault.sol



# Part 4 : Alpha Omega Coin  (AOC) BEP20 V2.1 Token  Smart Contract Read + Write Functions
## 4.1 Read  Functions
1. **Function: name()**
- **What it does:** Returns the token name ("Alpha Omega Coin").
- **Purpose:** Provides the token’s name for external use.
2. **Function: symbol()**
- **What it does:** Returns the token symbol ("AOC").
- **Purpose:** Provides the token’s symbol for external use.
3. **Function: decimals()**
- **What it does:** Returns the number of decimals (18).
- **Purpose:** Specifies token precision for calculations and display.
4. **Function: totalSupply()**
- **What it does:** Returns the total AOC token supply (initially 1 trillion).
- **Purpose:** Shows the total circulating tokens.
5. **Function: balanceOf(address account)**
- **What it does:** Returns the token balance of a specified address.
- **Purpose**: Allows querying an account’s AOC BEP20 V2.1 balance.
6. **Function: allowance(address owner, address spender)**
- **What it does**: Returns the remaining allowance a spender has for an owner’s tokens.
- **Purpose**: Checks how many AOC BEP20 V2.1 Tokens  a spender can transfer on behalf of the owner.

## 4.2 Write  Functions
1. **Function: initialize()**
- **What it does:** Sets up the contract with **1 trillion AOC BEP20 V2.1 tokens**, **name** ("Alpha Omega Coin"), **symbol** ("AOC"), 18 **decimals**, **four levels  of transfer regulation** (**20%** for **January 1**, **2022**–**January 1**, **2024** ; **15%** for **January 2**, **2024–January 1**, **2026**; **10%** for **January 2**, **2026–January 1**, **2028**; **10%** for **January 2**, **2028**), and initial **LTAF** **percentage** of **50%**.
- **Purpose:** Initializes  _AOC BEP20 V2.1 Token_  properties, _creates initial supply_ to the deployer, and _**configures transfer regulation levels**._
2. **Function: _authorizeUpgrade(address)**
- **What it does:** Authorizes a contract upgrade (**_owner-only_**).
- **Purpose:** Enables future improvements to the contract securely.
3. **Function: transfer(address recipient, uint256 amount)**
- **What it does:** Transfers **_AOC BEP20 V2.1 tokens_** from the sender to the _recipient_, _respecting regulation_ (_blacklist, LTAF/RAMS, level-based limits_).
- **Purpose:** Enables users to send **_AOC BEP20 V2.1_** tokens to others.

## Approve Function
- **What It Does:** Allows you to _**grant permission to another party**_ (**like a _person_ or an _app_**) _to spend_ a specific amount of your _AOC BEP20 V2.1 tokens_ on your behalf. It records this permission and logs it publicly.
- **Purpose:** Lets you _**trust apps**_ (**like _exchanges_ or _staking_ _platforms_**) to handle your _**AOC BEP20 V2.1 tokens**_ without giving them full control of your wallet.
- **Example:** Imagine you want to trade 100 _**AOC BEP20 V2.1 tokens**_ on a crypto exchange. You use approve to allow the exchange to spend _**AOC BEP20 V2.1 tokens**_ from your wallet. The exchange can now move those tokens when you trade, but only up to _**AOC BEP20 V2.1 tokens**_.
- **Why It Matters:** This keeps your  _**AOC BEP20 V2.1 tokens**_ _**safe while letting apps**_ like _**exchanges**_ or _**games**_ _use them for you_, as long as they follow _**AOC BEP20 V2.1 Token’s rules**_ (_like limits on transfers_).
## RenounceOwnership Function
- **What It Does:** _Permanently removes the contract’s owner by setting ownership to a null address_, _**disabling all owner-only controls**_(like _blacklisting_ or _pausing_). It logs this change publicly with an OwnershipTransferred event.
- **Purpose:** Makes the _**AOC BEP20 V2.1 Token**_ contract fully decentralized, ensuring _no one can control or change its rules_, which builds trust with users.
- **Simple Example:** Imagine you create an _**AOC BEP20 V2.1 Token**_ for a community project. To prove it’s fair and not controlled by your company, you use renounceOwnership . Now, no one can pause the contract or change its settings, making it run independently like a public utility.
- **Why It Matters:** Shows users the contract is trustless and not controlled by anyone, but it’s a one-time action—once done, you can’t manage the contract anymore.
- **Finality:** To _permanently remove central control_ and _make the contract fully autonomous_

## TransferFrom Function
- **What It Does:** _**Allows an approved party**_ (e.g., an _app_ or _contract_) to move _**AOC BEP20 V2.1 tokens**_ from your wallet to another address, if you’ve given permission with the approve function. _**It checks AOC BEP20 V2.1 Token’s rules**_ (like _blacklisting_ or _monthly transfer limits_) and _updates balances_ and _permissions_, logging a Transfer event.
- **Purpose:** _**Lets apps**_ like _exchanges_ or _staking platforms_ move your  _**AOC BEP20 V2.1 tokens**_ for you, making _**AOC BEP20 V2.1**_ _token usable_ in _automated systems_.
- **Simple Example:** Suppose you approve a crypto exchange to use _**AOC BEP20 V2.1 tokens**_ from your wallet. When you trade, the exchange uses transferFrom to send _**AOC BEP20 V2.1 tokens**_ to another user’s wallet to complete the trade. The transfer follows AOC BEP20 V2.1 Token’s rules, like not exceeding 50%  of your balance monthly if you’re in the LTAF program.
- **Why It Matters:** _**Enables AOC BEP20 V2.1 Token to work with apps**_ for _**trading**_ or _**payments**_, while ensuring all transfers follow the contract’s strict limits for security.
## includeInLTAF(address account)
- **What It Does:** This function _**adds a specific wallet address**_ (_like a user’s crypto account_) to _**LTAF**_. Once added, the user can _only transfer up to _**50%**_  of their  _**AOC BEP20 V2.1 tokens**_ _**each month**_. It also _resets their monthly transfer records_ to _start fresh._ Only the contract owner _(**Multi-Sig Signers**)_ can use this function.
- **Purpose:** _**LTAF provides flexibility**_ for _**authorized AOC Still Committed Actors**_ (e.g., _Administrators; Members;_ or _trusted entities_) _**to conduct significant transactions**_ when necessary (_**mainly in charity-based actions**_), **bypassing the restrictive _RAMS_  limits.**
- **Simple Example:** 
Imagine you are an Active AOC  Member holding _**AOC BEP20 V2.1 tokens**_ on _December 1  , 2025_ where you are normally subject to _15% MPP_.
If you’re added to _LTAF_ on _December 1 , 2025_, you can _transfer_ or _trade 50_ _**AOC BEP20 V2.1 tokens**_. This helps you realise a huge budget project or business… 
The Muti-Sig Signers use this function to motivate Results-Driving AOC  Actors who keep fighting for AOC growth…
- **Why It Matters:** _**AOC Core Team**_ uses this to _distinguish_ or to _decorate_ Still _Engaged AOC Actors_. It's a strict rule that only the Multi-Sig Signers can apply.
  
**Implementation in Contract:**
- The includedInLTAF mapping identifies addresses authorized for LTAF, controlled by the Multi-Sig Signers.
- The ltafPercentage variable (default 50% ) sets the maximum percentage of a user’s balance that can be transferred in a single or multiple transactions for LTAF-authorized accounts.
- In the _transfer function_, if a sender is included in LTAF, their transfer amount is validated against ltafPercentage of their balance instead of the RAMS level percentage.
- The owner(Signers) can update ltafPercentage using the updateLtafPercentage function.
# excludedFromLTAF(address account)
- **What It Does:** This function _**removes a wallet address from the LTAF**_, meaning the user is **_no longer allowed to transfer 50%_** of their _**AOC BEP20 V2.1 tokens**_ per month. From there, the _**said wallet falls back under RAMS restrictions.**_ The _**AOC BEP20 V2.1 token’s**_ contract _records when this happens_ (_like a timestamp_) to track the change. _**Only the Multi Sig Signers**_ can use this _function_.
- **Purpose**: _To remove a user from the LTAF transfer increase_, obliging them to fall back under RAMS, and _trade their tokens instead of the 50% monthly cap_ (though other rules, like RAMS, might still apply).
- **Simple Example:** If you were in LTAF and could send up to 50 units  out of your 100 _**AOC BEP20 V2.1 tokens**_ per month, this function _removes that allowance_ or _grace_. Now you cannot send all _**AOC BEP20 V2.1 tokens**_ if you want, as long as you fall under other transaction regulation  rules.
- **Why It Matters:** It helps remove users back to RAMS restrictions.
# includeInRAMS(address account)

## BASIC NOTIONS

**Alpha Omega Coin (AOC)** - _The Queen of cryptocurrencies_ , is the _very first cryptocurrency in the world_ which is _equipped_ with **_Market Anti-Manipulation Functionalities_** or _**Strategies**_ (_MAMF_ or _MAMS_). _Multi-levels_ _**MAMF**_ or _**MAMS**_ include _RAMS_.    
- **RAMS** = _Regressive Anti-Manipulation Strategy_ , is also called _**RAMF = Regressive Anti-Manipulation Functionality**_.
- _RAMS protects_ _**AOC BEP20 V2.1 token’s**_ _**price**_, _**market**_ , _**ecosystem**_ and _**community**_ from _**price flooding**_, _**dumping**_ , _**manipulation**_ and _from_ _**waste of wealth**_, by _limiting transaction sizes_, _promoting stability_ and _long-term commitment from holders._
  
- **What  Does includeInRAMS(address account) do?**
- This function _**adds by default  all AOC BEP20 V2.1 Token Holders’ wallets to RAMS**_, which _limits how many AOC BEP20 V2.1 Tokens_ a user can _transfer on the first day of each month_, from  (_**2 PM GMT+1**_).
- *RAMS is enforced through a levels mapping, with specific time periods and decreasing transfer regulations* :
- **Period of time 1:**  _**1 Jan 2022**_ – _**1 Jan 2024**_ → _**20%**_ transfer limit
- **Period of time 2:**  _**2 Jan 2024**_ – _**1 Jan 2026**_ → _**15%**_ transfer limit
- **Period of time 3:**  _**2 Jan 2026**_ – _**1 Jan 2028**_ → _**10%**_ transfer limit
- **Period of time 4:**  _**2 Jan 2028**_ and _**onwards**_ → _**5%**_ transfer limit,
- _**REMINDER**:_ _**20%, 15%, 10% and 5%**_ are each called _**MPP**_ (_**M**onthly **P**ermissive **P**ercentage_) or _**PMP**_ (_**P**ermissive **M**onthly **P**ercentage_). 

The function also _ensures the user isn’t in LTAF_ (_**they can’t be in both systems**_). Only the _**Multi Sig Signers can add someone to RAMS**_.
- **Purpose:** To **_regulate how many AOC BEP20 V2.1 Tokens_** _users_ can _**send**_ or _**trade**_ _**over time**_, with _stricter limits_ as _years pass_. This encourages _holding tokens longer_ and _prevents large_ and _sudden transfers_.
- **Simple Example:** _**If you have 100**_ _**AOC BEP20 V2.1 Tokens**_ and _**it’s during January 2, 2024–January 1, 2026**_, being in _**RAMS** means **you can only send 15 AOC BEP20 V2.1 Tokens per month** (**15% of your balance**)_. _**If you try to send more, the transaction fails**._  
The Mutli-Sig Signers  might add you to RAMS if you’re a big contributor to prevent market dumps.
- **Why It Matters:** It keeps the _**AOC BEP20 V2.1 Token**_ stable by spreading out transfers over time, especially for users with lots of tokens.

## excludeFromRAMS(address account)
- **What It Does:** This function _**removes a wallet address from RAMS**_, so _the user no longer faces the level-based monthly transfer limits_ (_**20%, 15%, 10%, or 5%**_). The contract logs when this happens. Only _the Mutli-Sig Signers can use this function_.
- **Purpose:** To _**lift**_ the _**RAMS restrictions**_, _allowing a user to transfer their AOC BEP20 V2.1 Tokens freely_ (unless they’re in _LTAF_ or _blacklisted_).
- **Simple Example:** If you’re in RAMS and limited to sending 10 AOC BEP20 V2.1 Tokens out of 100 in 2026, this function removes that limit. You can now send all 100 AOC BEP20 V2.1 Tokens in one go, assuming no other transfer regulations apply. The Mutli-Sig Signers might do this as a very particular reward.
- **Why It Matters:** _It gives users more freedom to use their tokens once they are granted special permission to use them freely_.
This function (_excludeFromRAMS_) is mainly _set to allow the AOC BEP20 V2.1 Token (Regular) Distribution Wallet to continue distributing AOC BEP20 V2.1 Tokens to eligible members_, _**holder category**_ by _**holder category**_, without _interruption_, _until the distribution timeframe or deadline allocated to each holder category has expired_.

## updateLtafPercentage(uint256 percentage)
- **What It Does:** This function _**lets the Mutli-Sig Signers  change the LTAF monthly transfer limit percentage**_ (_default is **50%**_). For example, they could set it to 40%, meaning _LTAF users can only transfer 40%_ of their _balance per month_. _Only_ the _Mutli-Sig Signers can make this change_.
- **Purpose:** _**To adjust how strict the LTAF rules are, depending on the needs of the AOC BEP20 V2.1 Token ecosystem, like market conditions or user behavior.**_
- **Simple Example:** If the _**LTAF limit is 50%**_ and _you have 100 AOC BEP20 V2.1 Tokens_, you can _**send 50 AOC BEP20 V2.1 Tokens per month**_. If the admin changes it to 30%, you can only send 30 _**AOC BEP20 V2.1 Tokens**_ per month. This helps the Mutli-Sig Signers  fine-tune how much users can move.
- **Why It Matters:** It _**gives the contract Mutli-Sig Signers flexibility**_ to _**tighten**_ or _**loosen LTAF restrictions**_, helping **balance _AOC BEP20 V2.1 Token stability_ and _user freedom_**.

## updateUserInfo(address account, uint256 year, uint256 month)
- **What It Does:** This internal function (_not directly callable by users or visible in the explorer_) _**updates a users  AOC BEP20 V2.1 Tokens’ balance**_ and their _**RAMS level**_ (_based on the current year_), and _their monthly transfer records_. It _runs automatically when a user tries to transfer AOC BEP20 V2.1 Tokens_, ensuring their _limits are up-to-date_.
- **Purpose:** To keep _track of a user’s current balance_ and _restrictions_ (**_RAMS_** or **_LTAF_**) accurately, _resetting transfer counts at the start of each month_ or _year_.
- **Simple Example:** From January 2, 2024 to January 1, 2026, if you are in RAMS, this function checks your balance (say, 100 AOC BEP20 V2.1 Tokens) and sets your transfer limit or MPP / PMP to 15% (15 AOC BEP20 V2.1 Tokens / month) because it falls within the RAMS Second Active Timeline (RAMS SAT), which is January 2, 2024 - January 1, 2026. It also resets your monthly transfer count to zero if it’s a new month. This happens behind the scenes when you try to send AOC BEP20 V2.1 tokens.
- **Why It Matters:** It _ensures the system always knows how many AOC BEP20 V2.1 tokens you can send based on the current **time**_ and _your restrictions_, keeping _**everything fair and accurate**_.

## Function:addLevels(uint256 level, uint256 startDay, uint256 endDay, uint256 percentage)
- **What it does:** _**Sets transfer limit levels with start/end timestamps**_ and a percentage limit (_**MPP(Monthly Permissive Percentage**_) or **_PMP_** (**_Permissive Monthly Percentage_**) (internal).
- **Purpose:** Defines time-based transfer limits for users during initialization.



