// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract SimpleToken is ERC20, Ownable {
    constructor() ERC20("SimpleToken", "STK") {
        _mint(msg.sender, 1000 * 10 ** decimals()); // Initial mint to the contract deployer
    }

    // Minting function for the owner
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    // Override transfer to add additional functionality if needed
    function transfer(address recipient, uint256 amount) public override returns (bool) {
        return super.transfer(recipient, amount);
    }

    // Function to claim tokens (dummy implementation)
    function claim(uint256 amount) public {
        require(balanceOf(msg.sender) >= amount, "Insufficient balance to claim");
        _transfer(msg.sender, address(this), amount);
        // Logic for claiming can be added here
    }
}
