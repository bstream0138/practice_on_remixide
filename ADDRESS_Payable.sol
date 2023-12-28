contract ADDRESS_CONSTRUCTOR {
    address payable owner;

    constructor() {
        owner = payable(msg.sender);
    }

    uint a;

    function setA(uint _a) public {
        a = _a;
    }

    function getA() public view returns(uint) {
        return a;
    }

    function add(uint _a, uint _b) public pure returns(uint) {
        return _a+_b;
    }

    function add2(uint _a) public view returns(uint) {
        return _a+a;
    }

    function getOwner() public view returns(address) {
        return owner;
    }

    function deposit() public payable {}

    function withdraw_1() public {
        owner.transfer(1 ether);
    }

    function withdraw_all() public {
        owner.transfer(address(this).balance);
    }
}