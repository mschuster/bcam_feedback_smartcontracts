//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.14;

import "../PubKeyListSolo.sol";

contract Factory {
   PubKeyList[] public PubKeyListArray;

   function CreateNewGreeter(uint16 _courseID) public {
     PubKeyList pubKeyList = new PubKeyList(_courseID);
     PubKeyListArray.push(pubKeyList);
   }

   function pklSetter(uint256 _pubKeyListIndex, uint16 _courseID, string memory _key) public {
     PubKeyList(address(PubKeyListArray[_pubKeyListIndex])).addPubKey(_courseID, _key);
   }

   function pklGetter(uint256 _pubKeyListIndex) public view returns (string[] memory) {
    return PubKeyList(address(PubKeyListArray[_pubKeyListIndex])).getPubKeyList();
   }
}