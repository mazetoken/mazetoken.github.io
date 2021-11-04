// SPDX-License-Identifier: MIT

pragma solidity ^0.5.0;

// ----------------------------------------------------------------------------
// smartBCH SEP20 Token Standard Interface
// https://docs.smartbch.org/smartbch/smartbch-evolution-proposals-seps/sep-20 CC0
// ----------------------------------------------------------------------------

contract SEP20Interface {
    function totalSupply() external view returns (uint256);
    function balanceOf(address _owner) external view returns (uint256 balance);
    // function owner() external view returns (address);
    function allowance(address _owner, address _spender) external view returns (uint256 remaining);
    // function increaseAllowance(address _spender, uint256 _delta) external returns (bool success);
    // function decreaseAllowance(address _spender, uint256 _delta) external returns (bool success);
    function approve(address _spender, uint256 _value) external returns (bool success);
    function transfer(address _to, uint256 _values) external returns (bool success);
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success);

    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);
}

contract SafeMath {
    function safeAdd(uint256 a, uint256 b) public pure returns (uint256 c) {
        c = a + b;
        require(c >= a);
    }
    function safeSub(uint256 a, uint256 b) public pure returns (uint256 c) {
        require(b <= a); c = a - b;
    }
    function safeMul(uint256 a, uint256 b) public pure returns (uint256 c) {
        c = a * b;
        require(a == 0 || c / a == b);
    }
    function safeDiv(uint256 a, uint256 b) external pure returns (uint256 c) {
        require(b > 0);
        c = a / b;
    }
}

contract smartBCH is SEP20Interface, SafeMath {
    string public name;
    string public symbol;
    uint8 public decimals;
    string public tokenURI;
    uint256 public _totalSupply;
    
    mapping(address => uint256) balances;
    mapping(address => mapping(address => uint256)) allowed;
    
    constructor() public {
        name = "VANDALS";
        symbol = "VANDALS";
        decimals = 8;
        tokenURI = "https://vandalstoken.onuniverse.com";
        _totalSupply = 10000000000000000;
        // _address = "wallet address";
        
        balances[msg.sender] = _totalSupply;
        emit Transfer(address(0), msg.sender, _totalSupply);
    }
    
    function totalSupply() external view returns (uint256) {
        return _totalSupply  - balances[address(0)];
    }
    
    function balanceOf(address _owner) external view returns (uint256 balance) {
        return balances[_owner];
    }
    
    // function owner() external view returns (address) {
        // return _address[address _owner];
    // }
    
    function allowance(address _owner, address _spender) external view returns (uint256 remaining) {
        return allowed[_owner][_spender];
    }
    
    function approve(address _spender, uint256 _value) external returns (bool success) {
        allowed[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }
    
    function transfer(address _to, uint256 _values) external returns (bool success) {
        balances[msg.sender] = safeSub(balances[msg.sender], _values);
        balances[_to] = safeAdd(balances[_to], _values);
        emit Transfer(msg.sender, _to, _values);
        return true;
    }
    
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        balances[_from] = safeSub(balances[_from], _value);
        allowed[_from][msg.sender] = safeSub(allowed[_from][msg.sender], _value);
        balances[_to] = safeAdd(balances[_to], _value);
        emit Transfer(_from, _to, _value);
        return true;
    }
}