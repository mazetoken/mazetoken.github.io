## How to mine MAZE SLP token on Android phone with Linux Ubuntu emulator ; readme v0.2

* We use Blue's miner to mine MAZE: https://gitlab.com/blue_mist/miner
* Read how to prepare your Electron Cash wallet for mining: https://github.com/blockparty-sh/mist-miner
* Check your wifi speed with a speedtest and max hardware/phone wifi link speed (if it's less than 72 Mbps you probably won't get any block)

## Step by step instruction

# Go to Google Play Store and download UserLAnd app

Install the app
Open the app and install Ubuntu
Setup your username and passwords
Choose SSH

* Use command line

# Run commands:

sudo apt-get update  
sudo apt upgrade
sudo apt-get install make
sudo apt-get install git
sudo apt-get install wget
sudo apt-get install curl
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install nodejs
sudo apt-get install npm
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

# Open .env in Nano editor:

sudo nano .env

Type/paste your WIF=" ..." (CPU_COUNT=2 means that you will be minig with 2 cores ; you can change it), tap ctrl O enter - to save changes and ctrl X enter - to exit editor

# Install and start the miner:

npm install zeromq@5
npm install cluster
sudo npm update
npm audit fix
npm start

# Tap Ctrl C (to stop the miner)