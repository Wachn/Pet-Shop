pragma solidity ^0.5.0; //pragma command means "additional information that the compiler cares about"

contract Adoption{
    /* An array of Ethereum addresses. For this case type is address and length is 16
     Adopters is public. Public variables have automatic getter methods, but in the 
     case of arrays a key is required and will only return a single value. */
    address[16] public adopters;

    //Adopting a pet
    /* In Solidity the types of both the function parameters and output must be specified
    - Arrays in Solidity are indexed from 0, so the ID value will need to be between 0 and 15. Use the require() 
    staemnet to ensure
    - If the ID is in range, we then add the address that made the call to our adopters array. The address of the peron or
    smart contract who called this funciton is denoted by msg.sender.
    */
    function adopt(uint petId) public returns (uint) {
        require(petId >= 0 && petId <=15);

        adopters[petId] = msg.sender;
        
        return petId;
    }

    // Retrieving the adopters
    /*
    - Since adopters is already declared it can simply be returned. *Be sure to specify the return type i.e., address[16] memory, memory gives the data location for the variable
    - view keyword in the function declaation means that the function will not modify the state of the contrract.
    */
    function getAdopters() public view returns (address[16] memory){
        return adopters;
    }

}