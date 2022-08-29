const { assert } = require("console");

// Start the contract by importing: *Adoption: The smart contract for testing
const Adoption = artifacts.require("Adoption");

/*
Note: Wehn writing this test, the callback function takes the argument  'accounts'. This provides us with the accounts available on the network when using this test.

Then, we make use of he 'before' to provide initial setups for the following:
*Adopt a pet with id8 and assign it to the first account within the test accounts on the network.*

*/

contract("Adoption", (accounts)=>{
    let adoption;
    let expectedAdopter;

    before(async ()=>{
        adoption = await Adoption.deployed();
    });

    describe("adopting a pet and retrieving account addresses", async() => {
        before("Adopt a pet using accounts[0]", async()=> {
            await adoption.adopt(8, {from: accounts[0] });
            expectedAdopter = accounts[0];
        });
        // ### Testing the adoption function
        /* To test the 'adopt' function, recall that upon sucessit returns the given 'adopter'. Ensure the adopter bsaed on given petID was returned and is compared with the expectedAdopter
        within the 'adopt' function
        */
        it("can fetch the address of an owner by pet id", async() =>{
            // Call smart contract method adopters to see what address adopted the pet with petID 8 
            //Truffle imports Chai for the user so we can use the assert functions. We pass the actual value, the expected value and a failure message(which gets printed to the console if the test does not pass)
            const adopter = await adoption.adopters(8);
            assert.equal(adopter, expectedAdopter, "The owner of the adopted pet should be the first account.");
        });

        // ## Testing retrieval of all pet owners
        // Since arrays can only return a single value given a single key, we create our own getter for the entire array.
        it("can fetch the collection of all pet owners' addresses", async() => {
            const adopters = await adoption.getAdopters();
            assert.equal(adopters[8], expectedAdopter, "The owner of the adopted pet should be in the collection.")
        })
    });

    
});



