// SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

contract PubKeyList {
    address owner;
    uint16 courseID;

    constructor(uint16 courseID_) {
        owner = msg.sender;
        courseID = courseID_;
    }

    event NewKey(string key);

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can add new Public Keys");
        _;
    }

    function logNewKey(uint16 courseID_, string memory key) public onlyOwner {
        if(courseID_ == courseID){
            emit NewKey(key);
        }
    }
}
