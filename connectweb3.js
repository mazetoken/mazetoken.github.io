web3 = new Web3(window.ethereum);
ethereum.request({ method: 'eth_requestAccounts' });
    var zombieMaster;
    const getAccount = async () => {
        try {
        const myAccounts = await web3.eth.getAccounts();
        zombieMaster = myAccounts[0];
        console.log("Master account" + zombieMaster);
        return myAccounts[0];
        } catch (err) {
            console.log(err);
        }
    }
getAccount();
web3.eth.defaultAccount = web3.eth.accounts[0];