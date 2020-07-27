Maze miner Android/Ubuntu readme v0.2

# Prepare your Electron Cash wallet (SLP edition) - learn how: https://github.com/blockparty-sh/mist-miner (you can also use this miner to mine Mist)

## Install Maze miner on Android phone with Linux Ubuntu (this is the same miner as the one above, but .env is for Maze contract variables)

* I have never worked with linux commands before so there could be easier way to setup the miner or better/different commands to do this

# Go to Google Play Store and download UserLAnd app

Install the app
Open the app and install Ubuntu
Set up your username and passwords
Choose SSH

* Run commands in the command line

# Update and install Nodejs:

sudo apt-get update && sudo apt-get dist-upgrade
sudo apt-get install curl
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install nodejs

# Install Nano editor to make changes in .env:

sudo apt install nano

# Install unzip and wget:

sudo apt install zip unzip
sudo apt install wget

# Install G++ and Make:

sudo apt install g++
sudo apt install make

# Create directory e.g. miner:

mkdir miner

# Navigate to the miner directory and download the miner:

cd miner
wget https://github.com/mazetoken/mazetoken.github.io/raw/master/mazeminerandroid.zip

# Unzip the miner:

unzip mazeminerandroid.zip

# Check if miner files are unzipped in the directory:

ls

# Navigate to mazeminerandroid directory:

cd mazeminerandroid

# Open .env in Nano editor:

sudo nano .env

Type/paste your WIF and change FASTMINE to "no"; you can add your TAG to MINER_UTF8 (ctrl O enter - to save changes, ctrl X enter - to exit Nano)

# Install the miner (in the mazeminerandroid directory):

sudo apt install git
sudo npm install -g npm
sudo npm install -g typescript@latest
npm install cluster
npm audit fix
npm install grpc
sudo npm install cmake

# Start mining:

npm start

# Stop mining:

Tap ctrl C


## Miner should work (without fastmine) but there is no guarantee that you will get any block with your Android phone


** Optional (this probably won't work because I don't know how to upgrade CMake in the miner; if I figure it out I make an update)

# Navigate to fastmine directory from mazeminerandroid directory:

cd fastmine

# Run commands in fastmine directory:

sudo apt install g++
sudo apt-get install make
sudo apt-get install cmake (it will install cmake v3.10.2 but v3.12.4 is required) 
cmake . && make

# Go back to mazeminerandroid directory (dont't do next steps untill cmake version is at least v3.12.4)

cd .. mazeminerandroid

# Open Nano editor again:

sudo nano .env

# Change fastmine to "yes" in .env

# Start mining:

npm start

# Stop mining:

Tap ctrl C 
