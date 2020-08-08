## How to mine MAZE SLP token on Android phone with Linux Ubuntu emulator ; readme v0.4 (created by B_S_Z - https://t.me/b_s_z)

* MAZE is based on Mistcoin (https://mistcoin.org)
* We use this miner to mine MAZE: https://github.com/blockparty-sh/mist-miner
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
sudo apt-get install g++
sudo apt-get install git
sudo apt-get install wget
sudo apt-get install curl
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install - y nodejs 
sudo npm install -g npm@latest
sudo apt-get install nano
sudo apt-get install zip unzip


# Create a new directory e.g. miner, download and unzip the miner:

mkdir miner
cd miner
wget https://github.com/mazetoken/mazetoken.github.io/raw/master/mazeminerandroid.zip

* if you want to mine Mist, instead of MAZE, run this command: wget https://github.com/mazetoken/mazetoken.github.io/raw/master/mistminerandroid.zip

unzip mazeminerandroid.zip

* or unzip mistminerandroid.zip

# Go to the miner directory:

cd mazeminerandroid

*or cd mistminerandroid

# Open .env in Nano editor:

sudo nano .env

*Type/paste your WIF=" ..." (right click on your addres in Electron Cash wallet to get a private key)
* You can change MINER_UTF8="..."
* You can change FASTMIE to "no" if you don't want to mine with fastmine
and then tap ctrl O enter - to save changes and ctrl X enter - to exit editor

# Navigate to fastmine (from mazeminerandroid or mistminerandroid directory):

cd fastmine

sudo apt remove --purge cmake (*run only if you had cmake previously installed !)
hash -r (*run only if you had cmake previously installed !)

# Download cmake to fastmine directory:

sudo apt install build-essential libssl-dev
wget https://github.com/Kitware/CMake/releases/download/v3.16.5/cmake-3.16.5.tar.gz
tar -zxvf cmake-3.16.5.tar.gz

# Navigate to cmake directory:

cd cmake-3.16.5

# Run commands (*it will take while to install so be patient ; you can change your phone display sleep time to 30 minutes to make it a little bit faster):

./bootstrap
make 
sudo make install

# Navigate to fastmine directory and run cmake:

cd ..
cmake . && make

# Navigate to mazeminerandroid or mistminerandroid directory, install and start the miner:

cd ..
npm i

* Do not run npm audit fix !

npm start

* if the miner stucks on "Downloading txid: ..." - wait for a while, it will move on

* There is no guarantee that you will get any blocks but you have a better chance with MAZE than Mist

# Tap Ctrl C (to stop the miner)

## Visit https://mazetoken.github.io ; https://t.me/mazemining