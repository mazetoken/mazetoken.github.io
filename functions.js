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
    var event = contractFaucet.methods.lockTime(zombieMaster).call()
        .then(function (result) {
    var content = "Next claim on: ";
            console.log(result);
            //alert(result);
    var a = new Date(result * 1000);
    var months = ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'];
    var year = a.getFullYear();
    var month = months[a.getMonth()];
    var date = a.getDate();
    var hour = a.getHours();
    var min = a.getMinutes();
    var sec = a.getSeconds();
    var time = date + ' ' + month + ' ' + year + ' ' + hour + ':' + min + ':' + sec ;
            alert(time);
    //return time;
    //content += JSON.stringify(result.toString());
    content += JSON.stringify(time.toString());
    $("#lang1").html(content);
        });;
};

function balanceFaucet() {
    //var content = "Your address: ";
    //content += zombieMaster;
    //$("#lang2").html(content);
    var event = contractZombie.methods.balanceOf("0xE6fBa59BDf1EafA8b1B5ad57D9C4A354CA55D756").call()
        .then(function (result) {
    var content = "ZOMBIE faucet balance: ";
            alert(result);
    content += JSON.stringify(result.toString());
    $("#lang2").html(content);
        });;
};

// Faucet (URGD)
function claimURGD() {
    var content = "Sending transaction from: ";
    content += zombieMaster;
    $("#lang3").html(content);
    var event = contractFaucet2.methods.claimToken(zombieMaster).send({ from: zombieMaster, value: 20000000000000 })
        .then(function (receipt) {
            console.log(receipt);
    var content = "Transaction sent!: ";
    content += JSON.stringify(receipt.transactionHash);
    $("#lang3").html(content);
        });;
};

function lockTimeU() {
    //var content = "Your address: ";
    //content += zombieMaster;
    //$("#lang4").html(content);
    var event = contractFaucet2.methods.lockTime(zombieMaster).call()
        .then(function (result) {
    var content = "Next claim on: ";
            //alert(result);
            console.log(result);
    var a = new Date(result * 1000);
    var months = ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'];
    var year = a.getFullYear();
    var month = months[a.getMonth()];
    var date = a.getDate();
    var hour = a.getHours();
    var min = a.getMinutes();
    var sec = a.getSeconds();
    var time = date + ' ' + month + ' ' + year + ' ' + hour + ':' + min + ':' + sec ;
            alert(time);
    //return time;
    //content += JSON.stringify(result.toString());
    content += JSON.stringify(time.toString());
    $("#lang4").html(content);
        });;
};

function balanceFaucet2() {
    //var content = "Your address: ";
    //content += zombieMaster;
    //$("#lang5").html(content);
    var event = contractUnderground.methods.balanceOf("0x6FAE0c62687EdCCDe384eD12cC0513c7436A4b5C").call()
        .then(function (result) {
    var content = "URGD faucet balance: ";
            alert(result/100000000);
    content += JSON.stringify(result.toString()/100000000);
    $("#lang5").html(content);
        });;
};

// Stake ZOMBIE (Vandals Bank)
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
    //var content = "Check your balance staked: ";
    //content += zombieMaster;
    //$("#lang2").html(content);
    var event = contractBank.methods.stakingBalance(zombieMaster).call()
        .then(function (result) {
    var content = "Your balance staked is: ";
            alert(result);
    content += JSON.stringify(result.toString());
    $("#lang2").html(content);
        });;
};
    
function claimTokens() {
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
    var event = contractBank.methods.lockTime(zombieMaster).call()
        .then(function (result) {
    var content = "Next claim on: ";
            //alert(result);
            console.log(result);
    var a = new Date(result * 1000);
    var months = ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'];
    var year = a.getFullYear();
    var month = months[a.getMonth()];
    var date = a.getDate();
    var hour = a.getHours();
    var min = a.getMinutes();
    var sec = a.getSeconds();
    var time = date + ' ' + month + ' ' + year + ' ' + hour + ':' + min + ':' + sec ;
            alert(time);
    //return time;
    //content += JSON.stringify(result.toString());
    content += JSON.stringify(time.toString());
    $("#lang4").html(content);
        });;
};
    
function unstakeTokens() {
    var content = "Sending transaction from: ";
    content += zombieMaster;
    $("#lang5").html(content);
    var event = contractBank.methods.unstakeTokens().send({ from: zombieMaster })
        .then(function (receipt) {
            console.log(receipt);
    var content = "Transaction sent! ";
            alert("Done. You`ve been zombified again!");
    content += JSON.stringify(receipt.transactionHash);
    $("#lang5").html(content);
        });;
};

function balanceBank() {
    var event = contractVandals.methods.balanceOf("0xBc6af81CE1bFae76a4cF6eD5BCE128e6FD2f0633").call()
        .then(function (result) {
    var content = "Vandals Bank balance: ";
            alert(result/100000000);
    content += JSON.stringify(result.toString()/100000000);
    $("#lang6").html(content);
        });;
};

// Stake MAZE (Vandals Bank)
function approveM() {
    var amount4 = $("#amount4").val();
    var amount5 = amount4 *1000000;
    var amount6 = amount5.toString();
    var content = "Approving transaction from: ";
    content += zombieMaster;
    $("#lang7").html(content);
    var event = contractMaze.methods.approve("0x381Fe35FCcA720efda008Ed182D0210519928638", amount6).send({ from: zombieMaster })
        .then(function (receipt) {
            console.log(receipt);
    var content = "Approved!: ";
            alert("Done!")
    content += JSON.stringify(receipt.transactionHash);
    $("#lang7").html(content);
        });;
};

function stakeTokens2() {
    var amount4 = $("#amount4").val();
    var amount5 = amount4 *1000000;
    var amount6 = amount5.toString();
    var content = "Sending transaction from: ";
    content += zombieMaster;
    $("#lang8").html(content);
    var event = contractBank2.methods.stakeTokens(amount6).send({ from: zombieMaster })
        .then(function (receipt) {
            console.log(receipt);
    var content = "Transaction sent!: ";
            alert("Done!");
    content += JSON.stringify(receipt.transactionHash);
    $("#lang8").html(content);
        });;
};
    
function stakingBalance2() {
    //var content = "Check your balance staked: ";
    //content += zombieMaster;
    //$("#lang9").html(content);
    var event = contractBank2.methods.stakingBalance(zombieMaster).call()
        .then(function (result) {
    var content = "Your balance staked is: ";
            alert(result/1000000);
    content += JSON.stringify(result.toString()/1000000);
    $("#lang9").html(content);
        });;
};
    
function claimTokens2() {
    var content = "Sending transaction from: ";
    content += zombieMaster;
    $("#lang10").html(content);
    var event = contractBank2.methods.claimTokens(zombieMaster).send({ from: zombieMaster, value: 20000000000000 })
        .then(function (receipt) {
            console.log(receipt);
    var content = "Transaction sent!: ";
            alert("Done!");
    content += JSON.stringify(receipt.transactionHash);
    $("#lang10").html(content);
        });;
};
    
function lockTimeUn() {
    var event = contractBank2.methods.lockTime(zombieMaster).call()
        .then(function (result) {
    var content = "Next claim on: ";
            //alert(result);
            console.log(result);
    var a = new Date(result * 1000);
    var months = ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'];
    var year = a.getFullYear();
    var month = months[a.getMonth()];
    var date = a.getDate();
    var hour = a.getHours();
    var min = a.getMinutes();
    var sec = a.getSeconds();
    var time = date + ' ' + month + ' ' + year + ' ' + hour + ':' + min + ':' + sec ;
            alert(time);
    //return time;
    //content += JSON.stringify(result.toString());
    content += JSON.stringify(time.toString());
    $("#lang11").html(content);
        });;
};
    
function unstakeTokens2() {
    var content = "Sending transaction from: ";
    content += zombieMaster;
    $("#lang12").html(content);
    var event = contractBank2.methods.unstakeTokens().send({ from: zombieMaster })
        .then(function (receipt) {
            console.log(receipt);
    var content = "Transaction sent! ";
            alert("Done!");
    content += JSON.stringify(receipt.transactionHash);
    $("#lang12").html(content);
        });;
};

function balanceBank2() {
    var event = contractUnderground.methods.balanceOf("0x381Fe35FCcA720efda008Ed182D0210519928638").call()
        .then(function (result) {
    var content = "Vandals Bank balance: ";
            alert(result/100000000);
    content += JSON.stringify(result.toString()/100000000);
    $("#lang13").html(content);
        });;
};

// Stake Funky Bots NFT (Vandals Bank)
function approveF() {
    var tokenId = $("#tokenId").val();
    var content = "Approving transaction from: ";
    content += zombieMaster;
    $("#lang14").html(content);
    var event = contractFunkyBots.methods.approve("0x180B9fDc7E851BAE34E408a26F55D2EfA95320c0", tokenId).send({ from: zombieMaster })
        .then(function (receipt) {
            console.log(receipt);
    var content = "Approved!: ";
            alert("Done. You can stake it now!")
    content += JSON.stringify(receipt.transactionHash);
    $("#lang14").html(content);
        });;
};

function stakeNFT() {
    var tokenId = $("#tokenId").val();
    var content = "Sending transaction from: ";
    content += zombieMaster;
    $("#lang15").html(content);
    var event = contractBankNFT.methods.stake(tokenId).send({ from: zombieMaster })
        .then(function (receipt) {
            console.log(receipt);
    var content = "Transaction sent!: ";
            alert("Done. FunkyBot is in the Vandals Bank now!");
    content += JSON.stringify(receipt.transactionHash);
    $("#lang15").html(content);
        });;
};
    
function calculateReward() {
    var tokenId = $("#tokenId1").val();
    var event = contractBankNFT.methods.calculateTokens(tokenId).call()
        .then(function (result) {
    var content = "VANDALS amount: ";
            alert(result/100000000);
    content += JSON.stringify(result.toString()/100000000);
    $("#lang16").html(content);
        });;
};
    
function unstakeNFT() {
    var tokenId = $("#tokenId2").val();
    var content = "Sending transaction from: ";
    content += zombieMaster;
    $("#lang17").html(content);
    var event = contractBankNFT.methods.unstake(tokenId).send({ from: zombieMaster, value: 50000000000000 })
        .then(function (receipt) {
            console.log(receipt);
    var content = "Transaction sent! ";
            alert("Done.");
    content += JSON.stringify(receipt.transactionHash);
    $("#lang17").html(content);
        });;
};

function balanceBankNFT() {
    var event = contractVandals.methods.balanceOf("0x180B9fDc7E851BAE34E408a26F55D2EfA95320c0").call()
        .then(function (result) {
    var content = "Vandals Bank balance: ";
            alert(result/100000000);
    content += JSON.stringify(result.toString()/100000000);
    $("#lang18").html(content);
        });;
};

// URGD
function totalFees() {
    //var content = "Your address: ";
    //content += zombieMaster;
    //$("#lang").html(content);
    var event = contractUnderground.methods.totalFees().call()
        .then(function (result) {
    var content = "Total URGD fees (half is burned): ";
            alert(result/100000000);
    content += JSON.stringify(result.toString()/100000000);
    $("#lang").html(content);
        });;
};

// PostBox
function sendMessage() {
    var sender = $("#sender").val();
    var recipient = $("#recipient").val();
    var message = $("#message").val();
    var url = $("#url").val();
    var content = "Sending transaction from: ";
    content += zombieMaster;
    $("#lang").html(content);
    var event = contractPostBox.methods.sendMessage(sender, recipient, message, url).send({ from: zombieMaster, value: 10000000000000 })
        .then(function (receipt) {
            console.log(receipt);
    var content = "Transaction sent!: ";
            alert("Done!");
    content += JSON.stringify(receipt.transactionHash);
    $("#lang").html(content);
        });;
};

function viewMessage() {
    var id = $("#id").val();
    var event = contractPostBox.methods.messages(id).call()
        .then(function (result) {
    var content = "Post Box message: <br><br>";
        console.log(result);
    // content += JSON.stringify({ id: result[0], from: result[1], to: result[2], message: result[3], url: result[4] }, null, 2);
    content += "id: " + result[0] + " | " + "from: " + result[1] + " | " + "to: " + result[2] + " | " + "message: " + result[3] + " | " + "URL: " + result[4];
    $("#lang1").html(content);
       });;
};

function countMessage() {
    var event = contractPostBox.methods.messageCount().call()
        .then(function (result) {
    var content = "Total messages: ";
        console.log(result);
    //content += JSON.stringify(result.toString());
    content += result;
    $("#lang2").html(content);
        });;
};

function viewLatest() {
    var event = contractPostBox.methods.message().call()
        .then(function (result) {
    var content = "Post Box message: <br><br>";
        console.log(result);
    //content += JSON.stringify(result.toString());
    content += result;
    $("#lang3").html(content);
       });;
};

function allMessages() {
    var content = "";
    for(i = 1; i < 20; i++) {
    var event = contractPostBox.methods.messages(i).call()
        .then(function (result) {
        console.log(result);
    //content += JSON.stringify({ id: result[0], from: result[1], to: result[2], message: result[3], url: result[4] }, null, 2);
    content += "<tr>" + "<td>" + "id: " + result[0] + "</td>" + "<td>" + "from: " + result[1] + "</td>" + "<td>" + "to: " + result[2] + "</td>" + "<td>" + "message: " + result[3] + "</td>" + "<td>" + "URL: " + result[4]  + "</td>" + "</tr>";
    $("#lang4").html(content);
       });;
    }
};