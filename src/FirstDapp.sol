// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract FirstDapp {
    uint256 public numOfNft;

    // This function will increment the NFT number;
   function increment() public {
    numOfNft++;
   }

   function decrease() public {
    numOfNft--;
   }
}
