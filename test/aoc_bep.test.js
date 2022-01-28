const AOC_BEP_DEV = artifacts.require("AOC_BEP_DEV");
const truffleAssert = require('truffle-assertions');
const { advanceTime, advanceBlock } = require('./helper');

contract('AOC BEP', async accounts => {
    const _name = 'Alpha Omega Coin';
    const _symbol = 'AOC BEP20';
    const _decimal = 18;

    let aocToken;
    beforeEach(async () => {
        aocToken = await AOC_BEP_DEV.deployed();
    });

    describe("Initial State", () => {
        it("has the correct name", async () => {
            const name = await aocToken.name();
            assert.equal(name, _name);
        })

        it("has the correct symbol", async () => {
            const symbol = await aocToken.symbol();
            assert.equal(symbol, _symbol);
        })

        it("has the correct decimals", async () => {
            const decimal = await aocToken.decimals();
            assert.equal(decimal, _decimal);
        })
    })

    describe("Transfer", () => {
        context("Level 1", async () => {
            it("Should pass at initial transfer from Account0 to Account1", async () => {
                const amount = "1000000000000000000000";
                const tx = await aocToken.transfer(accounts[1], amount, {from: accounts[0]});
                truffleAssert.eventEmitted(tx, 'Transfer', (ev) => {
                    return ev.from === accounts[0]
                        && ev.to === accounts[1]
                        && ev.value.toString() === amount;
                })
            })

            it("Should fail on above 20% transfer from Account1 to Account2", async () => {
                try {
                    const balance = await aocToken.balanceOf(accounts[1]);
                    const amount = ((((balance/10**_decimal) * 25) / 100) * 10**18).toString();
                    await aocToken.transfer(accounts[2], amount, {from: accounts[1]});
                } catch(error) {
                    const errorMessage = "BEP20: Amount is higher";
                    assert.equal(error.reason, errorMessage);
                }
            })

            it("Should pass on below or equal to 20% transfer from Account1 to Account2", async () => {
                const balance = await aocToken.balanceOf(accounts[1]);
                const amount = ((((balance/10**_decimal) * 20) / 100) * 10**18).toString();
                const tx = await aocToken.transfer(accounts[2], amount, {from: accounts[1]});
                truffleAssert.eventEmitted(tx, 'Transfer', (ev) => {
                    return ev.from === accounts[1]
                        && ev.to === accounts[2]
                        && ev.value.toString() === amount;
                })
            })
        })

        context("Level 2", async () => {
            it("Should fail on above 15% transfer from Account1 to Account2 at Level 2", async () => {
                try {
                    await advanceTime(30760000);
                    await advanceBlock();

                    const balance = await aocToken.balanceOf(accounts[1]);
                    const amount = ((((balance/10**_decimal) * 20) / 100) * 10**18).toString();
                    await aocToken.transfer(accounts[2], amount, {from: accounts[1]});
                } catch(error) {
                    const errorMessage = "BEP20: Amount is higher";
                    assert.equal(error.reason, errorMessage);
                }
            })

            it("Should pass on below or equal to 15% transfer from Account1 to Account2 at Level 2", async () => {
                const balance = await aocToken.balanceOf(accounts[1]);
                const amount = ((((balance/10**_decimal) * 15) / 100) * 10**18).toString();
                const tx = await aocToken.transfer(accounts[2], amount, {from: accounts[1]});
                truffleAssert.eventEmitted(tx, 'Transfer', (ev) => {
                    return ev.from === accounts[1]
                        && ev.to === accounts[2]
                        && ev.value.toString() === amount;
                })
            })
        })

        context("Level 3", async () => {
            it("Should fail on above 10% transfer from Account1 to Account2 at Level 3", async () => {
                try {
                    await advanceTime(30760000);
                    await advanceBlock();

                    const balance = await aocToken.balanceOf(accounts[1]);
                    const amount = ((((balance/10**_decimal) * 15) / 100) * 10**18).toString();
                    await aocToken.transfer(accounts[2], amount, {from: accounts[1]});
                } catch(error) {
                    const errorMessage = "BEP20: Amount is higher";
                    assert.equal(error.reason, errorMessage);
                }
            })

            it("Should pass on below or equal to 10% transfer from Account1 to Account2 at Level 3", async () => {
                const balance = await aocToken.balanceOf(accounts[1]);
                const amount = ((((balance/10**_decimal) * 10) / 100) * 10**18).toString();
                const tx = await aocToken.transfer(accounts[2], amount, {from: accounts[1]});
                truffleAssert.eventEmitted(tx, 'Transfer', (ev) => {
                    return ev.from === accounts[1]
                        && ev.to === accounts[2]
                        && ev.value.toString() === amount;
                })
            })
        })

        context("Level 4", async () => {
            it("Should fail on above 5% transfer from Account1 to Account2 at Level 4", async () => {
                try {
                    await advanceTime(30760000);
                    await advanceBlock();

                    const balance = await aocToken.balanceOf(accounts[1]);
                    const amount = ((((balance/10**_decimal) * 10) / 100) * 10**18).toString();
                    await aocToken.transfer(accounts[2], amount, {from: accounts[1]});
                } catch(error) {
                    const errorMessage = "BEP20: Amount is higher";
                    assert.equal(error.reason, errorMessage);
                }
            })

            it("Should pass on below or equal to 5% transfer from Account1 to Account2 at Level 4", async () => {
                const balance = await aocToken.balanceOf(accounts[1]);
                const amount = ((((balance/10**_decimal) * 5) / 100) * 10**18).toString();
                const tx = await aocToken.transfer(accounts[2], amount, {from: accounts[1]});
                truffleAssert.eventEmitted(tx, 'Transfer', (ev) => {
                    return ev.from === accounts[1]
                        && ev.to === accounts[2]
                        && ev.value.toString() === amount;
                })
            })
        })

        context("Exclude user from RAMS", async () => {
            it("Should pass when user is excluded from RAMS by owner", async () => {
                await advanceTime(30760000);
                await advanceBlock();

                const tx = await aocToken.excludeFromRAMS(accounts[1], {from: accounts[0]});
                truffleAssert.eventEmitted(tx, 'ExcludedFromRAMS', (ev) => {
                    return ev.account === accounts[1]
                })
            })

            it("Should pass on above 5% transfer from Account1 to Account2 at Level 4", async () => {
                const balance = await aocToken.balanceOf(accounts[1]);
                const amount = ((((balance/10**_decimal) * 10) / 100) * 10**18).toString();
                const tx = await aocToken.transfer(accounts[2], amount, {from: accounts[1]});
                truffleAssert.eventEmitted(tx, 'Transfer', (ev) => {
                    return ev.from === accounts[1]
                        && ev.to === accounts[2]
                        && ev.value.toString() === amount;
                })
            })

            it("Should pass on below or equal to 5% transfer from Account1 to Account2 at Level 4", async () => {
                const balance = await aocToken.balanceOf(accounts[1]);
                const amount = ((((balance/10**_decimal) * 5) / 100) * 10**18).toString();
                const tx = await aocToken.transfer(accounts[2], amount, {from: accounts[1]});
                truffleAssert.eventEmitted(tx, 'Transfer', (ev) => {
                    return ev.from === accounts[1]
                        && ev.to === accounts[2]
                        && ev.value.toString() === amount;
                })
            })
        })

        context("Include user from RAMS", async () => {
            it("Should pass when user is included from RAMS by owner", async () => {
                await advanceTime(30760000);
                await advanceBlock();

                const tx = await aocToken.includeInRAMS(accounts[1], {from: accounts[0]});
                truffleAssert.eventEmitted(tx, 'IncludedInRAMS', (ev) => {
                    return ev.account === accounts[1]
                })
            })

            it("Should fail on above 5% transfer from Account1 to Account2 at Level 4", async () => {
                try {
                    const balance = await aocToken.balanceOf(accounts[1]);
                    const amount = ((((balance/10**_decimal) * 10) / 100) * 10**18).toString();
                    await aocToken.transfer(accounts[2], amount, {from: accounts[1]});
                } catch(error) {
                    const errorMessage = "BEP20: Amount is higher";
                    assert.equal(error.reason, errorMessage);
                }
            })

            it("Should pass on below or equal to 5% transfer from Account1 to Account2 at Level 4", async () => {
                const balance = await aocToken.balanceOf(accounts[1]);
                const amount = ((((balance/10**_decimal) * 5) / 100) * 10**18).toString();
                const tx = await aocToken.transfer(accounts[2], amount, {from: accounts[1]});
                truffleAssert.eventEmitted(tx, 'Transfer', (ev) => {
                    return ev.from === accounts[1]
                        && ev.to === accounts[2]
                        && ev.value.toString() === amount;
                })
            })
        })
    })
})