// SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

contract PubKeyList {
    address owner;

    constructor() {
        owner = msg.sender;
    }

    event NewKey(uint16 course, string key);

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can add new Public Keys");
        _;
    }

    function logNewKey(uint16 courseID_, string memory key) public onlyOwner {
        emit NewKey(courseID_, key);
    }
}
