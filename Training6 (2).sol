// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

contract Training6 {

    function findEven(uint256 number) public pure returns(bool)
   { 
    return number % 2 == 0;
   }

   function findOdd (uint256 number) public pure returns(bool)
   {
    return number  % 2 != 0;
   } 

}

    