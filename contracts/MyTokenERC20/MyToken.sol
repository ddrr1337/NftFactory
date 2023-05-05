// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {
    address public minter; // Only NTF Factory contract can mint

    constructor(address _minter) ERC20("MyToken", "MTK") {
        _mint(msg.sender, 1000 * 10 ** 18);
        minter = _minter;
    }

    modifier onlyMinter() {
        require(msg.sender == minter, "Only minter can call this function");
        _;
    }

    function mint(address to, uint256 amount) public onlyMinter {
        _mint(to, amount);
    }
}
