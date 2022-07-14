// SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

contract PubKeyList {
    address public owner;
    uint16 courseID;
    bool public isBase; 
    string[] listPubKeys;

    constructor() {
        isBase = true;
    }

    function initialize(address _owner, uint16 _courseID) external {
        // For the base contract, isBase == true. Impossible to use. 
        require(isBase == false, "ERROR: This the base contract, cannot initialize"); //Owner address defaults to address(0). Once this function is called, //There is no way to call it again. 
        require(owner == address (0), "ERROR: Contract already initialized"); 
        owner = _owner;
        courseID = _courseID;
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
