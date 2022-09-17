  // SPDX-License-Identifier: MIT
  // hashlips erc1155 template used

  pragma solidity ^0.8.0;

  import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC1155/ERC1155.sol";
  import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";




interface IERC20 {
    function transfer(address _to, uint256 _value) external returns (bool);
    function balanceOf(address _owner) public view returns (uint balance);
}
  contract NFT1155 is ERC1155, Ownable {

    string public name;
    string public symbol;
    uint public startingTime;
    uint public endTime;
    address[] public receiverAddresses;
    uint public totalSupply;
    mapping(uint => string) public tokenURI;
    address public evaluatorAddress;
    uint public evalCounterIterator = 0;
    uint public evalCounterMax = 4;
    bool public fundingOpen = true;
    bool public certMatured = false;
    string[] public pastEvaluations;
    uint public fundingGoal;

    IERC20 usdc = IERC20(address(0x2f3A40A3db8a7e3D09B0adfEfbCe4f6F81927557));
    constructor(uint _endtime, address _evaluator) ERC1155("") {
      name = "Hypercerts";
      symbol = "Hypercerts";
      startingTime = block.timestamp;
      endTime = _endtime;
      evaluatorAddress = _evaluator;

    }
    // transfers USDT that belong to your contract to the specified address
    // evalutor exchanges Hypercert
    function updateCert(uint _id, string memory _uri) private {
      require (evalCounterIterator < evalCounterMax);
      require(msg.sender == evaluatorAddress, "you are not the evaluator");
      tokenURI[_id] = _uri;
      emit URI(_uri, _id);
    }

    function mint(address _to, uint _id, uint _amount) internal { //
      _mint(_to, _id, _amount, "");
      totalSupply += _amount;
    }
    function isFundingOpen() public returns (bool){
      if(fundingGoal>totalSupply && block.timestamp < endTime){
          fundingOpen = true;
      }else{
          fundingOpen = false;
      }
    }
    function receiveMoney() public onlyOwner{
      usdc.transfer(msg.sender, totalSupply);
      evaluationStarted = true;
    }

    function mintBatch(address _to, uint[] memory _ids, uint[] memory _amounts) external onlyOwner {
      _mintBatch(_to, _ids, _amounts, "");
    }

    function burn(uint _id, uint _amount) external {
      _burn(msg.sender, _id, _amount);
    }

    function burnBatch(uint[] memory _ids, uint[] memory _amounts) external {
      _burnBatch(msg.sender, _ids, _amounts);
    }

    function burnForMint(address _from, uint[] memory _burnIds, uint[] memory _burnAmounts, uint[] memory _mintIds, uint[] memory _mintAmounts) external onlyOwner {
      _burnBatch(_from, _burnIds, _burnAmounts);
      _mintBatch(_from, _mintIds, _mintAmounts, "");
    }

    function percentageShare(address holder) public view returns (uint){
      uint a = balanceOf(holder, 0);
      uint b = totalSupply;
      uint c = (100*a)/(b);
      return c;
    }


    function uri(uint _id) public override view returns (string memory) {
      return tokenURI[_id];
    }
    //to-do: give back excess funds
    function buycert(uint _id, amount) public payable {
      require(msg.value > 10, "minimum funding not met");
      isFundingOpen();
      if (usdc.balanceOf()>fundingGoal){
        usdc.transferFrom(address(msg.sender), address(this), tokenInAmount);
      }
      require(fundingOpen == true, "Funding not open anymore");
      mint( msg.sender,  _id, msg.value);
    }
  }
