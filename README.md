
# Alpha Omega Coin (AOC) Project

## Alpha Omega Coin (AOC) Bep20 Token V2

## Table of Contents
1. [Overview](#overview)
2. [AlphaOmegaCoin](#alphaomegacoin)   
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
Alpha Omega Coin (AOC), The Queen of Cryptocurrencies has an interoperable Monetary, Financial and Economic Galaxy (AOC MFEG) which is composed of several tokens including the AOC BEP20 Token the version 2 (V2) of which we are dealing with in this documentation…

AOC BEP20 Token V2 smart contract is an ERC20-compliant token with AOC level 2 Market Anti-Manipulations Functionality(MAMF) called Regressive Anti-Manipulations Strategy(RAMS), blacklisting,...It has no burning and no minting features..

---


### Token Identification Details

- **Name:** Alpha Omega Coin (AOC)  
- **Symbol:** AOC  
- **Decimals:** 18  
- **Initial Supply:** 1,000,000,000,000 (1 trillion AOC)
- **Total Maximum Supply:** 1,000,000,000,000 (1 trillion AOC) ```No minting and No Burning```
- **TYPE:** Utility, Donation and Payment Token (UDPT)
- **Network / Blockchain:** Binance Smart Chain
- **Upgradeability:** Uses OpenZeppelin UUPS (Universal Upgradeable Proxy Standard)  
- **Pausable:** Multi-sig Owners can pause/unpause transfers for security sake, migration sake or of a community-oriented intervention
- **Blacklist:** Multi-sig Owners can block addresses from sending/receiving tokens for security sake, scam prevention, protection from malicious attacks and also for internal regulations sake 



---

#### **AOC TECHNOLOGICAL INNOVATIONS** : 
**ANTI-PRICE-DUMPING AND MARKET ANTI-MANIPULATION FUNCTIONALITIES**

---
**PART A - DEADLY CHRONIC VOLATILITY OF EXISTING CRYPTOCURRENCIES**

As you all know, all the existing cryptocurrencies are facing price and market deadly volatility, caused by the so-called minority crypto-whales (=the biggest crypto holders)  who are used to orchestrating crypto price/value pumping and dumping events by manipulating the market to their will and to their selfish interests.

In doing so, crypto whales have transformed the cryptosphere into a crypto jungle where the strongest dominate the weakest…

Similarly, because of crypto whales, cryptocurrency holders with small and medium portfolios, fearing a (very) long-term downward trend, are selling off their crypto holdings, thus dispossessing themselves of their crypto wealth.

The first Alpha Omega Coin (AOC) Token (=AOC ERC20 V1) launched on October 28, 2020,which was listed on Latoken on May 3, 2021 : with the start price of $2, suffered the same fate, till to drop under 0.1…


PART B - GOD INSPIRED CRYPTO MARKET ANTI-MANIPULATION ALGORITHMS (MAMA) / MARKET ANTI-MANIPULATION PROTOCOLS (MAMP) / MARKET ANTI-MANIPULATION FUNCTIONALITIES (MAMF) / MARKET ANTI-MANIPULATION STRATEGIES (MAMS) / MARKET ANTI-MANIPULATION MECHANISMS  (MA2M)

 Fortunately, in the end of December 2021, God, through Jesus Christ ,  inspired AOC CEO and Founder - ABRAHAM Mankponsè Samuel (from Ouessè Wogoudo ; Département des Collines ; Republic of Benin ; West Africa) to resolve the most critical crypto dilemma : the self-centered manipulation of cryptocurrencies by crypto gurus…

From there, all AOC Mother Coin and all AOC Tokens  (AOC ERC20 ; AOC BEP20;...) which form AOC Monetary, Financial and Economic Galaxy (=AOC MFEG), are equipped with multi-level MARKET ANTI-MANIPULATION ALGORITHMS (MAMA) / MARKET ANTI-MANIPULATION PROTOCOLS (MAMP) / MARKET ANTI-MANIPULATION FUNCTIONALITIES (MAMF) / MARKET ANTI-MANIPULATION STRATEGIES (MAMS) / MARKET ANTI-MANIPULATION MECHANISMS  (MA2M)..

The currently already  revealed MARKET ANTI-MANIPULATION ALGORITHMS / PROTOCOLS / FUNCTIONALITIES / STRATEGIES / MECHANISMS (=MAMA / MAMP / MAMF / MAMS / MA2M) by God to AOC CEO and Founder are two and operating as follows :

1 - MAMA / MAMP / MAMF / MAMS / MA2M Level 1 : Progressive Anti-Manipulation Functionality (PAMF) 

1.1 PAMF’s HISTORIC CONTEXT 
By the grace of God, the Regular Distribution of AOC BEP20 V2 token starts at any time in 2025. It will be handled by a Dapp (Decentralized Application) the smart contract of which is equipped with one of Alpha Omega Coin (AOC)’s Innovations called : Progressive Anti-Manipulation Functionality (PAMF). 


1.2  PAMF’s DEFINITION 
The Progressive Anti-Manipulation Functionality (PAMF) is the very first level of AOC Mother Coin and all AOC Tokens’ MAMA / MAMP / MAMF / MAMS / MA2M. 

Working within AOC Monetary, Financial and Economic Galaxy (AOC MFEG) as distribution regulator, The Progressive Anti-Manipulation Functionality (PAMF) is a key mechanism built or implemented into AOC Mother Coin Algorithm and into all AOC  Tokens’ Smart Contracts , except for AOC ERC20 Token, by AOC Administration, under Jesus Christ guidance. 

1.3 PAMF’s SYNONYMS
Progressive Anti-Manipulation Functionality (PAMF)   =  Progressive Anti-Manipulation Strategy (PAMS) =  Progressive Anti-Manipulation Algorithm (PAMA) =  Progressive Anti-Manipulation Protocol (PAMP) = Progressive Anti-Manipulation Mechanism (PAMP). 

1.4  PAMF’s PURPOSE
The primary purpose of the Progressive Anti-Manipulation Functionality (PAMF) is to regulate AOC Mother Coin and all AOC Tokens (including AOC BEP20 V2 Token) distribution, based on the algorithmic principle called PMDP (=Permissive Monthly Distributed Percentage) or MPDP (= Monthly Permissive Distributed Percentage). And this, in order  to durably and permanently prevent AOC Mother Coin and AOC tokens market manipulation and ensure their price stability.



1. 5 PAMF’s OPERATING SYSTEM
In fact, instead of distributing immediately the totality of AOC Mother Coin and AOC tokens to each holder, AOC Administration uses the PAMF / PAMP/PAMA/ PAMS / PA2M to stagger the distribution of AOC Mother Coin and AOC tokens over an extended period.

From there, all AOC Mother Coin and AOC tokens’ Members, whether small or large holders, are set to receive their AOC Mother Coin balance and AOC tokens gradually, through a distribution timeframe which, depending on their holding category..

As far as AOC BEP20 V2 Token is concerned, its distribution timeframe varies from three (3) to eight (8) years. To know more about AOC BEP20 V2 Token Regular Distribution Plan , kindly follow this link : https://drive.google.com/file/d/1Uf7qQrlu7J_o9RYF1e4Jb7KKrsPAeGAr/view?usp=sharing 

Therefore, the PAMF / PAMP/PAMA/ PAMS / PA2M is committed to reducing the risk of AOC Mother Coin and AOC tokens market flooding, price dumping and market manipulation, especially by large holders.

By spreading the Distribution of AOC BEP20 V2 token over several months or years through the PAMF / PAMP/PAMA/ PAMS / PA2M, AOC CORE TEAM is showing their willingness which consists in stabilizing, durably and permanently, the price, the value and the market of AOC Mother Coin and AOC tokens, including AOC BEP20 V2 token.

In doing so, AOC CORE TEAM is preventing sudden price drops that can occur when large quantities of tokens are released for sale simultaneously.




2 - MAMA / MAMP / MAMF / MAMS / MA2M Level 2 : 
Regressive Anti-Manipulation Strategy (RAMS) 

2.1 RAMS’ HISTORIC CONTEXT 
For AOC Members who freely and voluntarily participated in AOC BEP20 Manual Initiatives in between February 7, 2022 and July 1, 2024, and for those who participated in AOC BEP20 Automatic or Web3 Initiatives via web3.alphaomegacoin.com , from May 18, 2024 to September 5, 2025,  AOC BEP20 V2 Token Regular Distribution starts very shortly in 2025 by Kairos time.

While, for contributors who will contribute to AOC Project after September 5, 2025 , during the effective AOC 100% Online Aggressive Marketing Campaigns , they will start receiving their AOC BEP20 V2 Tokens once the said Aggressive Marketing Campaigns are over…

From there, and especially from the moment when AOC BEP20 V2 Token is listed on Decentralized Exchanges (DEXs) like PANCAKESWAP and UNISWAP, the Regressive Anti-Manipulation Strategy (RAMS) starts working as monthly transactions regulator.


2.2  RAMS’ DEFINITION 
The Regressive Anti-Manipulation Strategy (RAMS)  is the second level of AOC Mother Coin and all AOC Tokens’ MAMA / MAMP / MAMF / MAMS / MA2M. 

Working within AOC Monetary, Financial and Economic Galaxy (AOC MFEG) as a transaction regulator, the Regressive Anti-Manipulation Strategy (RAMS) is a key mechanism built or implemented into AOC Mother Coin Algorithm and into all AOC  Tokens’ Smart Contracts , including AOC BEP20 V2 Token, by AOC Administration, under Jesus Christ guidance. 

2.3 RAMS’ SYNONYMS
Regressive Anti-Manipulation Strategy (RAMS) 
  =  Regressive  Anti-Manipulation Functionality (RAMF) =  Regressive  Anti-Manipulation Algorithm (RAMA) =  Regressive Anti-Manipulation Protocol (RAMP) = Regressive Anti-Manipulation Mechanism (RA2M).     


2.4  RAMS’ PURPOSE
 The primary objective of the  RAMS / RAMF / RAMA/ RAMP / RA2M is to prevent market flooding after the token's listing, which could lead to extreme price fluctuations.
In other words, the RAMS / RAMF / RAMA / RAMP / RA2M protects AOC Mother Coin and all AOC tokens (including AOC BEP20 Token) ,  AOC  ecosystem and market from price dumping and manipulation by limiting transaction sizes, promoting stability and long-term commitment from holders. 
By limiting transactions, the RAMS / RAMF / RAMA / RAMP / RA2M helps maintain a more stable and predictable value of AOC Mother Coin and the one of all AOC Tokens, thereby promoting sustainable growth within AOC Community International .

2. 5 RAMS’ OPERATING SYSTEM
Working within AOC Monetary, Financial and Economic Galaxy (AOC MFEG) as a transaction regulatory mechanism, the RAMS / RAMF / RAMA/ RAMP / RA2M is designed to preserve the stability and value of AOC Mother Coin and the one of all AOC Tokens. It regulates transactions made by Members by setting a Permissive Monthly Percentage (PMP) or Monthly Permissive Percentage (MPP), which determines the amount of tokens that can be transferred to another wallet or exchange during a month, counting from the first day of the month, by 2 PM GMT+1… 

Within AOC BEP20 V2 Token ecosystem, the RAMS / RAMF / RAMA/ RAMP / RA2M is enforced through a levels mapping, with specific time periods and decreasing monthly transfer limits through years as as follows :
Period of time N°1 : 1 Jan 2022 – 1 Jan 2024  → 20% transfer limit
Period of time N°2 : 2 Jan 2024 – 1 Jan 2026 → 15% transfer limit
Period of time N°3 : 2 Jan 2026 – 1 Jan 2028 → 10% transfer limit
Period of time N°4: 2 Jan 2028 and onwards (till the second coming of Jesus Christ of Nazareth / the end of the world)  → 5% transfer limit
REMINDER: 20% , 15%, 10% and 5% are each called MPP (Monthly Permissive Percentage) or PMP (Permissive  Monthly Percentage). 
PRECISIONS : 
- For Distribution sake, AOC BEP20 Token Distribution Wallet is excluded from RAMS. 
-Once the MPP or the PMP is reached (during a single or multiple transaction) in the course of a month, there may be new entering transactions..But no outgoing transaction is  possible during the same month…Holders must wait until the next month's first day to be able to transact again…

Therefore, the RAMS / RAMF / RAMA/ RAMP / RA2M is committed to reducing the risk of AOC Mother Coin and AOC tokens market flooding, price dumping and market manipulation, especially by large holders.

By limiting the monthly transaction of AOC BEP20 V2 token over several months or years through  the RAMS / RAMF / RAMA/ RAMP / RA2M, AOC CORE TEAM is showing their willingness which consists in stabilizing, durably and permanently, the price, the value
and the market of AOC Mother Coin and AOC tokens, including AOC BEP20 V2 token.

In doing so, AOC CORE TEAM is preventing sudden price drops that always occur within the existing crypto-space  when large quantities of tokens are released for sale simultaneously.


PART C - PAMF / PAMP / PAMA / PAMS / PA2M  and RAMS / RAMF / RAMA / RAMP / RA2M CONVERGENT IMPACT

The convergent impact both of the Progressive Anti-Manipulation / Functionality/ Protocol / Algorithm / Strategy /Mechanism  (PAMF / PAMP/PAMA/ PAMS / PA2M) via AOC BEP20 V2 Token Regular Distribution Smart Contract , and of the Regressive Anti-Manipulation / Functionality/ Protocol / Algorithm / Strategy /Mechanism  (RAMF / RAMP/RAMA/ RAMS / RA2M) via AOC BEP20 V2 token Smart Contract, lies in their ability to work together to stabilize  AOC Coin / AOC Mother Coin and AOC tokens' market and prevent their market manipulation.

PART D -  Alpha Omega Coin (AOC), The Queen of Cryptocurrencies

With its PAMF / PAMP/PAMA/ PAMS / PA2M  and RAMF / RAMP/RAMA/ RAMS / RA2M as previously demonstrated, combined to its Jesus Christ-focused spiritual , humanitarian, social,.., and philanthropic teachings and values, making of it the very first cryptocurrency to embrace and spread openly the Holistic Gospel of Jesus of Nazareth, and the very first one to permanently escape from market manipulation, Alpha Omega Coin (AOC) is nothing else  than The Queen of Cryptocurrencies…


LTAF : Loyality Transaction Authorization Function / Large Transaction  Authorization Function 

LTAF provides flexibility for authorized AOC Still Committed Actors (e.g., Administrators ; Members; or trusted entities) to conduct significant transactions when necessary(mainly in charity-based actions), bypassing the restrictive RAMF / RAMP/RAMA/ RAMS / RA2M limits during a month or a certain number of months…Not every month nor life long…

For AOC BEP20 V2 token,  the default LTAF percentage is 50%...While the maximum is 70%.
 If you have 100 AOC BEP20 V2 tokens in a month and you’re added to LTAF, you can transfer  or trade 50 AOC to 80 AOC. This helps you realise a huge budget project or business… 
The admin uses LTAF function to motivate  results-driving AOC actors who keep fighting for AOC growth…



### Reentrancy Protection
All token transfers are protected with `ReentrancyGuard`.

---

### Events
- `Blacklisted(address)` / `RemovedFromBlacklist(address)`  
- `IncludedInLTAF(address)` / `ExcludedFromLTAF(address)`  
- `IncludedInRAMS(address)` / `ExcludedFromRAMS(address)`  
- `LtafPercentageUpdated(uint256)`  

---

## Alpha Omega Coin

AOC BEP20 Token V2 Functions are categorized as read (retrieve data) and write (modify state)

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

