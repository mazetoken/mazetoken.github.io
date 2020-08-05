## How to mine MAZE SLP token on Android phone with Linux Ubuntu emulator ; readme v0.3 (created by B_S_Z - https://t.me/b_s_z)

* MAZE is based on Mistcoin (https://mistcoin.org)
* We use Blue's miner to mine MAZE: https://gitlab.com/blue_mist/miner
* Read how to prepare your Electron Cash wallet (SLP edition) for mining: https://github.com/blockparty-sh/mist-miner

## Step by step instruction

# Go to Google Play Store and download UserLAnd app

Install the app
Open the app and install Ubuntu
Setup your username and passwords
Choose SSH

* Use command line

# Run commands:

sudo apt-get update && sudo apt-get dist-upgrade
sudo apt-get install make
sudo apt-get install git
sudo apt-get install wget
sudo apt-get install curl
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install - y nodejs 
sudo npm install -g npm@latest
sudo npm update (*optional)
sudo apt-get install nano
sudo apt-get install zip unzip


# Create a new directory e.g. blue, download and unzip the miner:

mkdir blue
cd blue
wget https://github.com/mazetoken/mazetoken.github.io/raw/master/mazeblueandroid.zip

* if you want to mine Mist, instead of MAZE, run this command: wget https://github.com/mazetoken/mazetoken.github.io/raw/master/mistblueandroid.zip

unzip mazeblueandroid.zip

* or unzip mistblueandroid.zip

# Go to the miner directory:

cd mazeblueandroid

*or cd mistblueandroid

# Open .env in Nano editor:

sudo nano .env

*Type/paste your WIF=" ..." (right click on your addres in Electron Cash wallet to get a private key)
*CPU_COUNT=2 means that you will be minig with 2 cores (you can change it)
* You can change MINER_UTF8="..."
and then tap ctrl O enter - to save changes and ctrl X enter - to exit editor

# Install and start the miner:

sudo apt-get install g++
npm i

* Do not run npm audit fix !

npm install cluster
npm install zeromq@5

* Do not run npm audit fix !

npm start

* if the miner stucks on "Downloading txid: ..." - wait for a while, it will move on

* There is no guarantee that you will get any blocks but you have a better chance with MAZE than Mist

# Tap Ctrl C (to stop the miner)

## Visit https://mazetoken.github.io ; https://t.me/mazemining