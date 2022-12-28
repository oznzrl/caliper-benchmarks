// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Storage{

  
struct Nav{
string NAV_IDENT;
string data;
}

uint256 public index=0;
string [8647] public id ;
mapping (string=>Nav) public navdata;
  uint256 value;

  event StorageUpdate(address _updater, uint256 _value);
  event StorageRead(address _reader, uint256 _value);
  event NavDataUpdated(string  _id);
  event NavDataInitiliazed(string _id);
  event NavDataRead(string _id);
string lastDataId;

function initilizeData(string memory _id,string memory data )public{
Nav memory nav= Nav( _id,data);
navdata[_id]=nav;
lastDataId=_id;
id[index]=lastDataId;
emit NavDataInitiliazed(_id);
index++;
}

function reset()public{
lastDataId="";
index=0;
string [1000] memory  a ;
id=a;
navdata;

}

function getDataById(string memory _id)public view returns(Nav memory){
  return(navdata[_id]);
}

function getLastData()public returns(Nav memory){
  emit NavDataRead(lastDataId);
  return(navdata[lastDataId]);
}

function updateDataById(string memory NAV_IDENT,string memory data )public{
navdata[NAV_IDENT]= Nav( NAV_IDENT, data);
emit NavDataUpdated(NAV_IDENT);
}


 function read() public returns (uint256) {
     emit StorageRead(msg.sender,value);
    return value;
  }
 function readcheap() public view returns (uint256) {
    return value;
  }

  function write(uint256 newValue) public {
    value = newValue;
    emit StorageUpdate(msg.sender,value);
  }
}
