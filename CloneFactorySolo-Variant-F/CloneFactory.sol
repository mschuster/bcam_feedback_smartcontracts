// SPDX-License-Identifier: MIT 
pragma solidity >= 0.8.0 < 0.9.0;

interface PubKeyList {
    function initialize(address _owner, uint16 _courseID) external;
}

contract CloneFactory {
    address public baseContract;
    mapping (address => address []) public allclones;
    event NewClone (address _newclone, address _owner);

    constructor(address _baseContract) {
        baseContract = _baseContract;
    }

    function clone (address _baseContract) internal returns (address instance) { 
        assembly {
            let ptr := mload (0x40) 
            mstore(ptr, 0x3d602d80600a3d3981f3363d3d373d3d3d363d73000000000000000000000000) 
            mstore(add(ptr, 0x14), shl(0x60, _baseContract)) 
            mstore(add(ptr, 0x28), 0x5af43d82803e903d91602b57fd5bf30000000000000000000000000000000000) 
            instance := create(0, ptr, 0x37)
        }require(instance != address(0), "ERC1167: create failed");
    }

    function _clone(uint16 _courseID) external {
        address identicalChild = clone( baseContract); 
        allclones[msg.sender].push(identicalChild); 
        PubKeyList(identicalChild).initialize(msg.sender, _courseID); 
        emit NewClone( identicalChild, msg.sender);
    }
    
    function returnClones (address _owner) external view returns (address [] memory) {
        return allclones [_owner];
    }
}
