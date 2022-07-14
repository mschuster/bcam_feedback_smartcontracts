// SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

contract PubKeyList {
    address owner;
    uint16 courseID;
    string[] listPubKeys;

    constructor(uint16 courseID_) {
        owner = msg.sender;
        courseID = courseID_;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can add new Public Keys");
        _;
    }

    function addPubKey(uint16 courseID_, string memory pubKey) public onlyOwner{
        if(courseID_ == courseID){
            listPubKeys.push(pubKey);
        }
    }

    function getPubKeyList() view public returns(string[] memory){
        return listPubKeys;
    }

    function getCoureID() view public returns(uint16){
        return courseID;
    }
}