// SPDX-License-Identifier: MIT

// hashlips erc1155 template used

pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC1155/ERC1155.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

contract NFT1155 is ERC1155, Ownable {

  string public name;
  string public symbol;
  address[] public receiverAddresses;

  mapping(uint => string) public tokenURI;

  constructor(address[] memory _receiverAddresses) ERC1155("") {
    name = "Hypercerts";
    symbol = "Hypercerts";
    receiverAddresses = _receiverAddresses;
  }
  // evalutor exchanges Hypercert
  function setURI(uint _id, string memory _uri) private onlyOwner {
    tokenURI[_id] = _uri;
    emit URI(_uri, _id);
  }
  function mint(address _to, uint _id, uint _amount, string memory _uri) external onlyOwner { //
    _mint(_to, _id, _amount, "");
    setURI(_id, _uri);
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

  function uri(uint _id) public override view returns (string memory) {
    return tokenURI[_id];
  }
  function buycert public payable {
    int fundingmass = msg.value;
  }
}

