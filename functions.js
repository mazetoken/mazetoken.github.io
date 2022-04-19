// MAZE (mining)
function reward() {
    var content = "";
    //content += zombieMaster;
    $("#lang").html(content);
    var event = contractMaze.methods.getMiningReward().call()
        .then(function (result) {
    var content = "<br>Mining reward: ";
            console.log(result);
    content += JSON.stringify(result.toString()/1000000);
    $("#lang").html(content);
        });;
};

function minted() {
    var content = "";
    //content += zombieMaster;
    $("#lang1").html(content);
    var event = contractMaze.methods.tokensMinted().call()
        .then(function (result) {
    var content = "<br>Minted amount: ";
            console.log(result);
    content += JSON.stringify(result.toString()/1000000);
    $("#lang1").html(content);
        });;
};


// Faucet (ZOMBIE)
function claimZombie() {
    var content = "Sending transaction from: ";
    content += zombieMaster;
    $("#lang").html(content);
    var event = contractFaucet.methods.claimZombie(zombieMaster).send({ from: zombieMaster })
        .then(function (receipt) {
            console.log(receipt);
    var content = "Transaction sent!: ";
    content += JSON.stringify(receipt.transactionHash);
    $("#lang").html(content);
        });;
};

function lockTimeZ() {
    var content = "Your address: ";
    content += zombieMaster;
    $("#lang1").html(content);
    var event = contractFaucet.methods.lockTime(zombieMaster).call()
        .then(function (result) {
    var content = "Unix_timestamp: ";
            alert(result);
    content += JSON.stringify(result.toString());
    $("#lang1").html(content);
        });;
};

// Stake (Vandals Bank)

function approveZ() {
    var amount1 = $("#amount1").val();
    // var amount2 = amount1 *100000000;
    // ZOMBIE has 0 decimals
    var amount2 = amount1 *1;
    var amount3 = amount2.toString();
    var content = "Approving transaction from: ";
    content += zombieMaster;
    $("#lang").html(content);
    var event = contractZombie.methods.approve("0xBc6af81CE1bFae76a4cF6eD5BCE128e6FD2f0633", amount3).send({ from: zombieMaster })
        .then(function (receipt) {
            console.log(receipt);
    var content = "Approved!: ";
            alert("Done. The horde is ready!")
    content += JSON.stringify(receipt.transactionHash);
    $("#lang").html(content);
        });;
};

function stakeTokens() {
    var amount1 = $("#amount1").val();
    // var amount2 = amount1 *100000000;
    // ZOMBIE has 0 decimals
    var amount2 = amount1 *1;
    var amount3 = amount2.toString();
    var content = "Sending transaction from: ";
    content += zombieMaster;
    $("#lang1").html(content);
    var event = contractBank.methods.stakeTokens(amount3).send({ from: zombieMaster })
        .then(function (receipt) {
            console.log(receipt);
    var content = "Transaction sent!: ";
            alert("Done. Zombies are in the Vandals Bank now!");
    content += JSON.stringify(receipt.transactionHash);
    $("#lang1").html(content);
        });;
};
    
function stakingBalance() {
    var content = "Check your balance staked: ";
    content += zombieMaster;
    $("#lang2").html(content);
    var event = contractBank.methods.stakingBalance(zombieMaster).call()
        .then(function (result) {
    var content = "Your balance staked is: ";
            alert(result);
    content += JSON.stringify(result.toString());
    $("#lang2").html(content);
        });;
};
    
function claimTokens() {
    // Calculate reward amount (defaultAPR) in contract if stake token and reward token decimals are different
    // E.g. ZOMBIE has 0 decimals, VANDALS has 8 decimals, so defaultAPR is 700000000000 (7000 and 8 zeros)
    var content = "Sending transaction from: ";
    content += zombieMaster;
    $("#lang3").html(content);
    var event = contractBank.methods.harvestTokens(zombieMaster).send({ from: zombieMaster })
        .then(function (receipt) {
            console.log(receipt);
    var content = "Transaction sent!: ";
            alert("Done. Long live VANDALS!");
    content += JSON.stringify(receipt.transactionHash);
    $("#lang3").html(content);
        });;
};
    
function lockTimeB() {
    var content = "Your address: ";
    content += zombieMaster;
    $("#lang4").html(content);
    var event = contractBank.methods.lockTime(zombieMaster).call()
        .then(function (result) {
    var content = "Unix_timestamp: ";
            alert(result);
    content += JSON.stringify(result.toString());
    $("#lang4").html(content);
        });;
};
    
function unstakeTokens() {
    var content = "Sending transaction from: ";
    content += zombieMaster;
    $("#lang5").html(content);
    var event = contractBank.methods.unstakeTokens().send({ from: zombieMaster, gasPrice: 1047000000 })
        .then(function (receipt) {
            console.log(receipt);
    var content = "Transaction sent! ";
            alert("Done. You`ve been zombified again!");
    content += JSON.stringify(receipt.transactionHash);
    $("#lang5").html(content);
        });;
};

// Mint

function mintToken() {
    var content = "Sending transaction from: ";
    content += zombieMaster;
    $("#lang").html(content);
    var event = contracToken.methods.mint().send({ from: zombieMaster, value: 30000000000000 })
        .then(function (receipt) {
            console.log(receipt);
    var content = "Transaction sent!: ";
        alert("Done!")
    content += JSON.stringify(receipt.transactionHash);
    $("#lang").html(content);
        });;
};