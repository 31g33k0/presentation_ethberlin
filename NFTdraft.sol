  // SPDX-License-Identifier: MIT
  // hashlips erc1155 template used

  pragma solidity ^0.8.0;

  import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC1155/ERC1155.sol";
  import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";



  // is it smart to do this thing as ERC1155 if we only need 1155 fractional feature or should we "write own standard"?
  contract NFT1155 is ERC1155, Ownable {

    string public name;
    string public symbol;
    uint public immutable fundingEndTime;
    address[] public receiverAddresses;
    uint public totalSupply;
    string public tokenURI;
    address public immutable evaluatorAddress;
    bool public fundingOpen = true;
    bool public fundsWithdrawn = false;
    string[] public pastEvaluations;
    uint public constant fundingGoal = 10000;
    uint constant _id = 0;



    //memory in front of each variable?
    constructor(uint _endtime, address _evaluator, string memory _uri) ERC1155("") {
      name = "Hypercerts";
      symbol = "Hypercerts";
      fundingEndTime = _endtime;
      require(fundingEndTime>block.timestamp, "endFundingTime in the past");
      evaluatorAddress = _evaluator;
      require(evaluatorAddress!=msg.sender, "you can't be fundmanager and evaluator at the same time");
      tokenURI = _uri;
    }

    // evalutor exchanges Hypercert
    function updateCert(string memory _uri) external {
      require(msg.sender == evaluatorAddress, "you are not the evaluator");
      pastEvaluations.push(tokenURI);
      tokenURI = _uri;
      emit URI(_uri, _id);
    }

    function mint(address _to, uint _amount) internal { //
      _mint(_to, _id, _amount, "");
      totalSupply += _amount;
    }

    //has the evaluation started
    function isFundingOpen() public returns (bool){

      if((fundingGoal>totalSupply && block.timestamp < fundingEndTime)&&fundsWithdrawn==false){
          fundingOpen = true;
      }else{
          fundingOpen = false;
      }
      return fundingOpen;
    }

    function withdraw() public onlyOwner {
      require(address(this).balance>0);
      require(fundsWithdrawn==false);
      payable(msg.sender).transfer(address(this).balance);
      fundsWithdrawn = true;
      fundingOpen = false;
    }


    //show percentual pool share of address
    function percentageShare(address holder) external view returns (uint){
      require(totalSupply>0, "you barely escaped dividing by zero, GG");
      uint holderBalance = balanceOf(holder, _id);
      //FRONTEND needs to divide 1e18
      uint share = (100*holderBalance * 1e18)/(totalSupply);
      return share;
    }

    //return time till Evaluation will start if it hasn't already started(close funding)
    function timeTillEvaluation() external view returns (uint){
      if (fundingEndTime > block.timestamp){
        return fundingEndTime - block.timestamp;
      }
      else
      {
        return 0;
      }
    }

    //does it need to get the argument id
    function uri() external view returns (string memory){
      return tokenURI;
    }

    //to-do: give back excess funds,non-reentrant modifier
    function buyCert() external payable {
      require(msg.value > 10, "minimum funding not met, provide at least 10 gwei");
      isFundingOpen();
      require(fundingOpen == true, "Funding not open anymore");
      if ((msg.value + totalSupply) > fundingGoal) {
          payable(msg.sender).transfer((msg.value +totalSupply) - fundingGoal);
      }
      mint(msg.sender, msg.value);
    }
    //to-do:delete later
    function showTime() external view returns (uint){
      return block.timestamp;
    }
    function showBalance() external view returns (uint){
      return address(this).balance;
    }

  }
// example values: ipfs://QmRaoi46QduzZRGGSXXsMF459DfEhaMZc5tEQfVpH7Aj3P, 0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db
