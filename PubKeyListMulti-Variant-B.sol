// SPDX-License-Identifier: MIT
// Smart Contract for saving Public Keys per Course
pragma solidity ^0.8.14;

contract PubKeyList {
    address owner;
    mapping(uint16 => string[]) courseKeyList;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can add new Public Keys");
        _;
    }

    function addPubKey(uint16 courseID_, string memory pubKey) public onlyOwner{
        courseKeyList[courseID_].push(pubKey);
    }

    function getCoursePubKeyList(uint16 courseID_) view public returns(string[] memory){
        return courseKeyList[courseID_];
    }
}
