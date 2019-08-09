pragma solidity 0.5.0;

import './SmartCar.sol';

contract Provider {
    address public owner;

    mapping(bytes32 => bool) public registered;

    constructor() public {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    modifier notRegisterd(bytes32 _licensePlate) {
        require(!registered[_licensePlate]);
        _;
    }

    address[] public carAddress;

    function regisCar(bytes32 _licensePlate, uint _carValue)
    public
    onlyOwner
    notRegisterd(_licensePlate)
    returns (address car) {
        car = address(new SmartCar(_licensePlate, _carValue, owner));
        registered[bytes24(_licensePlate)] = true;
        carAddress.push(car);
        return car;
    }
}