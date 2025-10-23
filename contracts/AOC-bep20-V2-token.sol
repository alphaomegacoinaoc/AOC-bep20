// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/interfaces/IERC20Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/utils/ContextUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/security/PausableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/security/ReentrancyGuardUpgradeable.sol";
import "./library/DateTime.sol";

contract AlphaOmegaCoin is
    Initializable,
    ContextUpgradeable,
    IERC20Upgradeable,
    OwnableUpgradeable,
    PausableUpgradeable,
    ReentrancyGuardUpgradeable,
    UUPSUpgradeable
{
    using DateTimeLibrary for uint;

    struct Level {
        uint256 start;
        uint256 end;
        uint256 percentage;
    }
    struct UserInfo {
        uint256 balance;
        uint256 level;
        uint256 year;
        uint256 month;
    }
    struct Status {
        uint256 ltafRemovalYear;
        uint256 ltafRemovalMonth;
        uint256 ltafInclusionYear;
        uint256 ltafInclusionMonth;
        uint256 ramsRemovalYear;
        uint256 ramsRemovalMonth;
        uint256 ramsInclusionYear;
        uint256 ramsInclusionMonth;
    }
    mapping(address => uint256) private _balances;
    mapping(address => mapping(address => uint256)) private _allowances;
    mapping(address => bool) public blacklisted;
    mapping(address => bool) public excludedFromRAMS;
    mapping(address => bool) public includedInLTAF;
    mapping(uint256 => Level) public levels;
    mapping(address => UserInfo) public userInfo;
    mapping(address => Status) public userStatus;

    uint256 private _totalSupply;
    uint8 private constant DECIMAL = 18;
    string private constant NAME = "Alpha Omega Coin";
    string private constant SYMBOL = "AOC";
    uint256 public ltafPercentage;

    mapping(address => mapping(uint256 => mapping(uint256 => uint256))) public txPerMonth;
    event Blacklisted(string indexed action, address indexed to, uint256 at);
    event RemovedFromBlacklist(string indexed action, address indexed to, uint256 at);
    event IncludedInRAMS(address indexed account);
    event ExcludedFromRAMS(address indexed account);
    event IncludedInLTAF(address indexed account);
    event ExcludedFromLTAF(address indexed account);
    event LtafPercentageUpdated(uint256 percentage);

    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() {
    _disableInitializers();
    }

    function initialize() public initializer {
        __Ownable_init();
        __Pausable_init();
        __Context_init();
        __ReentrancyGuard_init();
        __UUPSUpgradeable_init();

        _mint(_msgSender(), (1000 * 10 ** 9 * 10 ** 18));
        ltafPercentage = 50;

    levels[1] = Level({start: 1640995200, end: 1704153599, percentage: 20});
    levels[2] = Level({start: 1704153600, end: 1767311999, percentage: 15});
    levels[3] = Level({start: 1767312000, end: 1830383999, percentage: 10});
    levels[4] = Level({start: 1830384000, end: 0, percentage: 5});
    }

    function _authorizeUpgrade(address newImplementation) internal override onlyOwner {}

    function name() external pure returns (string memory) {
        return NAME;
    }

    function symbol() external pure returns (string memory) {
        return SYMBOL;
    }

    function decimals() external pure returns (uint8) {
        return DECIMAL;
    }

    function totalSupply() external view returns (uint256) {
        return _totalSupply;
    }

    function balanceOf(address account) external view virtual override returns (uint256) {
        return _balances[account];
    }

    function transfer(address recipient, uint256 amount) external whenNotPaused returns (bool) {
        _transfer(_msgSender(), recipient, amount);
        return true;
    }


    function allowance(address account, address spender) external view returns (uint256) {
        return _allowances[account][spender];
    }

    function approve(address spender, uint256 amount) external whenNotPaused returns (bool) {
        _approve(_msgSender(), spender, amount);
        return true;
    }

    function transferFrom(address sender, address recipient, uint256 amount) external whenNotPaused returns (bool) {
        _transfer(sender, recipient, amount);
        uint256 currentAllowance = _allowances[sender][_msgSender()];
        require(currentAllowance >= amount, "Exceeds allowance");
        _approve(sender, _msgSender(), currentAllowance - amount);
        return true;
    }

    function blacklistUser(address _address) external onlyOwner whenNotPaused {
        require(!blacklisted[_address], "Already blacklisted");
        blacklisted[_address] = true;
        emit Blacklisted("Blacklisted", _address, block.timestamp);
    }

    function removeFromBlacklist(address _address) external onlyOwner whenNotPaused {
        require(blacklisted[_address], "Not blacklisted");
        blacklisted[_address] = false;
        emit RemovedFromBlacklist("Removed", _address, block.timestamp);
}

    function includeInRAMS(address account) external onlyOwner whenNotPaused {
        require(excludedFromRAMS[account], "Already included");
        require(!includedInLTAF[account], "In LTAF");
        _updateRAMSStatus(account, true);
        emit IncludedInRAMS(account);
    }

    function excludeFromRAMS(address account) external onlyOwner whenNotPaused {
        require(!excludedFromRAMS[account], "Already excluded");
        _updateRAMSStatus(account, false);
        emit ExcludedFromRAMS(account);
    }

    function _updateRAMSStatus(address account, bool include) internal {
        (uint256 year, uint256 month, ) = DateTimeLibrary.timestampToDate(block.timestamp);
        if (include) {
            excludedFromRAMS[account] = false;
            includedInLTAF[account] = false;
            userStatus[account].ramsRemovalYear = 0;
            userStatus[account].ramsRemovalMonth = 0;
            if (userStatus[account].ltafRemovalYear != 0) {
                userStatus[account].ramsInclusionYear = year;
                userStatus[account].ramsInclusionMonth = month;
            } else {
                userStatus[account].ramsInclusionYear = 0;
                userStatus[account].ramsInclusionMonth = 0;
            }
        } else {
            excludedFromRAMS[account] = true;
            if (txPerMonth[account][year][month] > 0) {
                userStatus[account].ramsRemovalYear = year;
                userStatus[account].ramsRemovalMonth = month;
            } else {
                userStatus[account].ramsRemovalYear = 0;
                userStatus[account].ramsRemovalMonth = 0;
            }
        }
    }

    function includeInLTAF(address account) external onlyOwner whenNotPaused {
        require(!includedInLTAF[account], "Already included");
        _updateLTAFStatus(account, true);
        emit IncludedInLTAF(account);
    }

    function excludedFromLTAF(address account) external onlyOwner whenNotPaused {
        require(includedInLTAF[account], "Already excluded");
        _updateLTAFStatus(account, false);
        emit ExcludedFromLTAF(account);
    }

    function _updateLTAFStatus(address account, bool include) internal {
        (uint256 year, uint256 month, ) = DateTimeLibrary.timestampToDate(block.timestamp);
        if (include) {
            includedInLTAF[account] = true;
            excludedFromRAMS[account] = true;
            userStatus[account].ltafRemovalYear = 0;
            userStatus[account].ltafRemovalMonth = 0;
            if (txPerMonth[account][year][month] > 0) {
                userStatus[account].ltafInclusionYear = year;
                userStatus[account].ltafInclusionMonth = month;
            } else {
                userStatus[account].ltafInclusionYear = 0;
                userStatus[account].ltafInclusionMonth = 0;
            }
            userInfo[account].balance = _balances[account];
            userInfo[account].year = year;
            userInfo[account].month = month;
            txPerMonth[account][year][month] = 0;
        } else {
            includedInLTAF[account] = false;
            if (txPerMonth[account][year][month] > 0) {
                userStatus[account].ltafRemovalYear = year;
                userStatus[account].ltafRemovalMonth = month;
            } else {
                userStatus[account].ltafRemovalYear = 0;
                userStatus[account].ltafRemovalMonth = 0;
            }
        }
    }
    function updateLtafPercentage(uint256 percentage) external onlyOwner whenNotPaused {
        require(percentage > 0, "Invalid percentage");
        ltafPercentage = percentage;
        emit LtafPercentageUpdated(ltafPercentage);
    }

   function _transfer(address sender, address recipient, uint256 amount) internal virtual {
    require(!blacklisted[sender] && !blacklisted[recipient], "Blacklisted");
    require(sender != address(0) && recipient != address(0) && amount > 0, "Invalid params");

    uint256 currentTimestamp = block.timestamp;
    (uint256 year, uint256 month, uint256 day) = DateTimeLibrary.timestampToDate(currentTimestamp);

    _validateTransferRestrictions(sender, year, month);

    if (includedInLTAF[sender] || !excludedFromRAMS[sender]) {
        if (day <= 1 || year != userInfo[sender].year || month != userInfo[sender].month || userInfo[sender].level == 0) {
            updateUserInfo(sender, year, month);
        }
        _checkTransferLimits(sender, amount, year, month);
    }

    uint256 senderBalance = _balances[sender];
    require(senderBalance >= amount, "Low balance");
    _balances[sender] = senderBalance - amount;
    _balances[recipient] += amount;

    emit Transfer(sender, recipient, amount);
}
    function updateUserInfo(address account, uint256 year, uint256 month) internal {
        UserInfo storage user = userInfo[account];
        
        if (year != user.year || month != user.month || user.level == 0) {
            user.balance = _balances[account];
            if (includedInLTAF[account]) {
                txPerMonth[account][year][month] = 0;
            }
        }
        
        user.year = year;
        user.month = month;
        
        uint256 currentTime = block.timestamp;
        
        if (currentTime >= levels[4].start) {
            user.level = 4;
        } else if (currentTime >= levels[3].start && currentTime <= levels[3].end) {
            user.level = 3;
        } else if (currentTime >= levels[2].start && currentTime <= levels[2].end) {
            user.level = 2;
        } else if (currentTime >= levels[1].start && currentTime <= levels[1].end) {
            user.level = 1;
        } else {
            user.level = 4;
        }
    }

    function _mint(address account, uint256 amount) internal virtual {
        require(account != address(0), "Zero mint");
        _totalSupply += amount;
        _balances[account] += amount;
        emit Transfer(address(0), account, amount);
    }

    function _approve(address account, address spender, uint256 amount) internal virtual {
        _allowances[account][spender] = amount;
        emit Approval(account, spender, amount);
    }

    function _validateTransferRestrictions(address sender, uint256 year, uint256 month) internal view {
        Status storage status = userStatus[sender];
        if (excludedFromRAMS[sender] && status.ltafRemovalYear != 0) {
            require(year != status.ltafRemovalYear || month != status.ltafRemovalMonth, "Ex-LTAF wait");
        }
        if (includedInLTAF[sender] && status.ramsRemovalYear != 0) {
            require(year != status.ramsRemovalYear || month != status.ramsRemovalMonth, "Ex-RAMS wait");
        }
        if (!includedInLTAF[sender] && excludedFromRAMS[sender] && status.ramsRemovalYear != 0) {
            require(year != status.ramsRemovalYear || month != status.ramsRemovalMonth, "Ex-RAMS wait");
        }
        if (includedInLTAF[sender] && status.ltafInclusionYear != 0) {
            require(year != status.ltafInclusionYear || month != status.ltafInclusionMonth, "New LTAF wait");
        }
        if (!excludedFromRAMS[sender] && status.ramsInclusionYear != 0) {
            require(year != status.ramsInclusionYear || month != status.ramsInclusionMonth, "New RAMS wait");
        }
    }

    function _checkTransferLimits(address sender, uint256 amount, uint256 year, uint256 month) internal {
        if (includedInLTAF[sender]) {
            uint256 ltafLimit = (userInfo[sender].balance * ltafPercentage) / 100;
            require(txPerMonth[sender][year][month] + amount <= ltafLimit, "Exceeds LTAF");
            txPerMonth[sender][year][month] += amount;
        } else if (!excludedFromRAMS[sender]) {
            if (userInfo[sender].level > 0) {
                uint256 levelLimit = (userInfo[sender].balance * levels[userInfo[sender].level].percentage) / 100;
                require(amount <= levelLimit, "Exceeds level");
            }
            uint256 monthlyLimit = (userInfo[sender].balance * levels[userInfo[sender].level].percentage) / 100;
            require(txPerMonth[sender][year][month] + amount <= monthlyLimit, "Exceeds month");
            txPerMonth[sender][year][month] += amount;
        }
    }
}
