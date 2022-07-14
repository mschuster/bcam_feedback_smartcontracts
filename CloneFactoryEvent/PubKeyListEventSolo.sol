// SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

contract PubKeyList {
    address public owner;
    bool public isBase; 
    uint16 courseID;

    constructor() {
        isBase = true;
    }

    function initialize(address _owner, uint16 courseID_) external {
        // For the base contract, isBase == true. Impossible to use. 
        require(isBase == false, "ERROR: This the base contract, cannot initialize"); //Owner address defaults to address(0). Once this function is called, //There is no way to call it again. 
        require(owner == address (0), "ERROR: Contract already initialized"); 
        owner = _owner;
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