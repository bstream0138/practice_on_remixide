// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 < 0.9.0;

/*
자동차를 운전하려고 합니다.
지불은 smart contract에게 함.
----------------------------------------------------------------------------------------
* 주유소 사장님은 2번 지갑의 소유자임(2번 지갑 주소 하드코딩(복붙) 하면 됨), 주유소 사장님이 withdraw하는 기능
* 지불을 미리 하고 주유시 차감하는 기능
*/

contract Humby {
    // 자동차의 상태에는 정지, 운전중, 시동 끔, 연료없음 총 4가지 상태가 있습니다.
    // 정지는 속도가 0인 상태, 운전 중은 속도가 있는 상태이다. 
    enum Status {
        Stop,       // v = 0;
        Driving,    // v != 0;
        TurnOff,
        NoFuel
    }

    Status carStatus;

    uint carVelocity;
    uint carFuel;
    address payable owner;
    address gasStation;

    constructor() {
        carStatus = Status.TurnOff;
        carVelocity = 0;
        carFuel = 0;
        owner = payable(msg.sender);
        gasStation = address(0xA5c398700a522D5e41EEDd924dc1CB489EfC096E);
    }

    function setVelocityforTest(uint _v) public {
        carVelocity = _v;
    }

    function setFuelforTest(uint _f) public {
        carFuel = _f;
    }

    function getCarState() public view returns (Status, uint, uint) {
        return (carStatus, carVelocity, carFuel);
    }

    function Accelerator() public {
        // * 악셀 기능 - 속도를 1 올리는 기능, 악셀 기능을 이용할 때마다 연료가 2씩 줄어듬, 연료가 30이하면 더 이상 악셀을 이용할 수 없음, 70이상이면 악셀 기능은 더이상 못씀
        require(carVelocity < 70, "It's already too fast enough.");
        require(carFuel >30, "More fuel is needed");
        require(carStatus == Status.Stop || carStatus == Status.Driving, "The car is not moving." );

        if( carVelocity == 0 && carStatus == Status.Stop){
            // 차량이 정지 상태였다면, 주행 중으로 변경
            carStatus = Status.Driving;
        }
        carVelocity++;
        carFuel -= 2;
    }

    function Break() public {
        // * 브레이크 기능 - 속도를 1 줄이는 기능, 브레이크 기능을 이용할 때마다 연료가 1씩 줄어듬, 속도가 0이면 브레이크는 더이상 못씀
        require(carVelocity>0, "The velocity is already 0.");
        require(carStatus == Status.Driving, "The car is not moving." );
        carVelocity--;
        carFuel -= 2;

        if(carVelocity == 0) {
            // 속도가 0이 되면, 차량 상태 정지 상태로 변경
            carStatus = Status.Stop;
        }

    }

    function TurnOn() public {
        // * 시동 켜기 기능 - 시동을 켜는 기능, 시동을 키면 정지 상태로 설정됨
        if ( carStatus == Status.TurnOff ) {
            carStatus = Status.Stop;
        }
    }

    function TurnOff() public {
        // * 시동 끄기 기능 - 시동을 끄는 기능, 속도가 0이 아니면 시동은 꺼질 수 없음
        require(carVelocity==0, "You can't turn off the engine while the car is in motion.");
        if ( carStatus == Status.Stop ) {
            carStatus = Status.TurnOff;
        }
    }

    function Refuel() public payable returns(uint){
        // * 주유 기능 - 주유하는 기능, 주유를 하면 1eth를 지불해야하고 연료는 100이 됨
        require(carStatus == Status.TurnOff || carStatus == Status.NoFuel, "Cannot refuel while driving." );
        return msg.value;
    }

    function RechargeGasCard() public {

    }
}