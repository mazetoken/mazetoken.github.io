function addIconM() {
    web3 = new Web3(window.ethereum);
    const tokenAddress = '0x481De06DCA0198844faA36FCa04Db364e5c2f86C';
    const tokenSymbol = 'MAZE';
    const tokenDecimals = 6;
    const tokenImage = 'https://mazetoken.github.io/img/maze512.png';
    ethereum.request({
            method: 'wallet_watchAsset',
            params: {
            type: 'ERC20',
            options: {
                address: tokenAddress,
                symbol: tokenSymbol,
                decimals: tokenDecimals,
                image: tokenImage,
            },
            },
    });
};

function addIconZ() {
    web3 = new Web3(window.ethereum);
    const tokenAddress = '0x80453ACDfE0073D6743B27D72e06F48777EeAd80';
    const tokenSymbol = 'ZOMBIE';
    const tokenDecimals = 0;
    const tokenImage = 'https://mazetoken.github.io/img/zombie512.png';
    ethereum.request({
            method: 'wallet_watchAsset',
            params: {
            type: 'ERC20',
            options: {
                address: tokenAddress,
                symbol: tokenSymbol,
                decimals: tokenDecimals,
                image: tokenImage,
            },
            },
    });
};

function addIconV() {
    web3 = new Web3(window.ethereum);
    const tokenAddress = '0x2a886b947d5a8f0e09408C9069914Fa44C06ed7e';
    const tokenSymbol = 'VANDALS';
    const tokenDecimals = 8;
    const tokenImage = 'https://mazetoken.github.io/img/vandals512.png';
    ethereum.request({
            method: 'wallet_watchAsset',
            params: {
            type: 'ERC20',
            options: {
                address: tokenAddress,
                symbol: tokenSymbol,
                decimals: tokenDecimals,
                image: tokenImage,
            },
            },
    });
};

function addIconU() {
    web3 = new Web3(window.ethereum);
    const tokenAddress = '0x423805e13AF3f3183500BaE7Cf15c50420eC0bEF';
    const tokenSymbol = 'URGD';
    const tokenDecimals = 8;
    const tokenImage = 'https://mazetoken.github.io/img/urgd512.png';
    ethereum.request({
            method: 'wallet_watchAsset',
            params: {
            type: 'ERC20',
            options: {
                address: tokenAddress,
                symbol: tokenSymbol,
                decimals: tokenDecimals,
                image: tokenImage,
            },
            },
    });
};