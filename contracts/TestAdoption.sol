pragma solidity ^0.5.0;
/* Start the contract with 3 imports:
- Assert.sol: Gives various assertions to use in our tests. In testing, assertion checks for things like equality, in
 equality or emptiness to return a pass/fail (Check this for the full list of assertion https://github.com/trufflesuite/truffle/blob/master/packages/resolver/solidity/Assert.sol)
 - DeployedAddresses.sol: When running tests. Truffle will deploy a fresh instance of the contract being tested to the 
 blockchain. This smart contract gets the address of the deployed contract
 - Adoption: The smart contract we want to test
*/

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Adoption.sol";

contract TestAdoption{
    //The address of the adoption contract to be tested
    Adoption adoption = Adoption(DeployedAddresses.Adoption());

    //The id of the pet that will be used for testing 
    uint expectedPetId = 8;

    // Testing the adopt() function
    function testUserCanAdoptPet() Public{
        uint returnedId = adoption.adopt(expectedPetId);
        
        Assert.equal(returnId, expectedPetId, "Adoption of the expected pet should match what is returned.");
    }

    // Testing retrieval of a single pet's owner
    function testGetAdopterAddressbyPetId() public{
        address adopter = adoption.adopters(expectedPetId);

        Assert.equal(adopter, expectedAdopter, "Owner of the expected pet should be this contract");
    }

    // Testing retrieval of all pet owners
    function testGetAdopterAddressByPetIdInArray() public{
        //store adopters in memory rather than contract's storage
        address[16] memory adopters = adoption.getAdopters(); //memory attribute tells Solidity to temporarily store the value in memory, rather than saving it to contract's storage

        Assert.equal(adopters[expectedPetId], expectedAdopter, "Owner of the expeceted pet should be this contract");
    }

    // The expected owner of adopted pet is this contract
    address expectedAdopter = address(this);
}
