  // SPDX-License-Identifier: MIT

  // hashlips erc1155 template used

  pragma solidity ^0.8.0;

  import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC1155/ERC1155.sol";
  import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

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

    constructor(uint _endtime, address _evaluator) ERC1155("") {
      name = "Hypercerts";
      symbol = "Hypercerts";
      startingTime = block.timestamp;
      endTime = _endtime;
      evaluatorAddress = _evaluator;

    }
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
    function buycert(uint _id) public payable {
      require(msg.value > 10, "minimum funding not met");
      require(block.timestamp < endTime, "Cert has already matured");
      //uint fundingmass = msg.value;
      mint( msg.sender,  _id, msg.value);
    }
  }
