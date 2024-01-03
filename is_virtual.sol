// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract DAD {
    function who() virtual public pure returns(string memory) {
        return "data from DAD";
    }
}

contract MOM {
    function who() virtual public pure returns(string memory) {
        return "data from MOM";
    }

}

contract Child is DAD, MOM {
    function who() virtual override(DAD, MOM) public pure returns(string memory) {
        return string(abi.encodePacked("Child and ", DAD.who()));
    }
}

contract GrandChild is Child {
    function who() override public pure returns(string memory) {
        return string(abi.encodePacked("GrandChild and ", Child.who()));
    }
}
