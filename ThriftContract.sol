// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ThriftContract {

    address payable public immutable admin; //0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db
    //0x17F6AD8Ef982297579C203069C1DbfFE4348c372
    uint256  public adminFees ;
    
    
    struct Contributor {
        address payable sender;
        uint256 totalAmount;
        uint256 amount;
        uint256 startTime;
        uint256 endTime;
    }
   
    mapping (address => Contributor ) private  contributorsDetails;
    event Contributed(address indexed sender, uint256 indexed value, uint256 indexed blockTimestamp);
    event Withdrawn(uint256 indexed amount);
    
    constructor () {
        admin = payable(msg.sender);
    }

    
    function deposit() public payable {
        require(msg.value > 0, "cannot send zero ether");
        require(msg.value == 1 ether, "your contribution can only be 1 ether" );
     Contributor storage contributor = contributorsDetails[msg.sender];
    contributor.totalAmount += msg.value;
     contributor.sender = payable(msg.sender);
     contributor.startTime = block.timestamp;
     contributor.endTime = contributor.startTime + 30 days;
    //get notified when a deposit occurs
     emit Contributed(msg.sender, msg.value, block.timestamp);
      }

      function withdraw(uint256 amount) public {
      Contributor storage contributor = contributorsDetails[msg.sender];
      require ( amount >= contributor.totalAmount);

      //Let admin fee be 10% of contributor's total contribution
      adminFees = contributor.totalAmount * 10/100;
      uint256 deductedAmount = adminFees + amount;
      contributor.totalAmount - deductedAmount;
       //get notified when a withdrawal occurs
      emit Withdrawn(amount);
      }

      function getContributorsDetails (address addr) public view returns (Contributor memory) {
        
         return contributorsDetails[addr];
      }
      
      }





