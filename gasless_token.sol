// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IERC20Permit {
     function total_supply() external view returns (uint256);
    function balance_of(address account) external view returns (uint256);
    function send(address receiver, uint256 amount) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool);

function transferFrom( address sender, address receiver, uint256 amount) external 
returns (bool);

function permit(address owner,address spender,uint256 value,uint256 deadline,uint8 v,bytes32 r,
bytes32 s) external;

event transfer(address indexed from, address indexed to, uint256 value);
    event approval(address indexed owner, address indexed spender, uint256 value);
    
}

contract Gasless_token {
    function send(address token, address sender, address receiver, uint amount, uint fee,
    uint256 deadline,
    //permitting signatures for tokens transfer with a signed message
    //v,r,s are ethereum improvement proposal 721 (ERIP-721) to permit token transfers via signatures
     uint8 v,  bytes32 r,bytes32 s) external {
        // Permit
        IERC20Permit(token).permit(
            sender,
            address(this),
            amount + fee,
            deadline,
            v,
            r,
            s
        );

        //reentrancy attack vulnerability and external call before state update by use of call() in place of transer,send()
         (bool success,) = receiver.call{value: amount}("");
        require(success, "Transfer failed try again!");
        // Transfer token to caller which is msg.sender
        IERC20Permit(token).transferFrom(sender, msg.sender, fee);
    }
     }



