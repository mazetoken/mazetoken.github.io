# Install Mist/Maze miner on Android phone with Linux Ubuntu

* I have never worked with linux commands before so there could be easier way to setup the miner or better/different commands to do this

# Go to Google Play Store and download UserLAnd app
Install the app
Open the app and install Ubuntu
Set up your username and password

# Install Nodejs on Android/Ubuntu

In the command line run commands:

sudo apt install wget
sudo apt install git
sudo apt-get update && sudo apt-get dist-upgrade
sudo apt-get install nodejs
node --version (check node version - it must be at least 10.x)

If node version is 8.x run this commands:

sudo apt-get install curl
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install nodejs

# Install Npm and tsc:

sudo apt install npm
sudo npm install -g typescript@latest

# Install unzip:

sudo apt install zip unzip

# Install Nano editor to make changes in .env:

sudo apt install nano

# Create directory e.g. miner:

mkdir miner

# Navigate to the miner directory and download the miner:

cd miner
wget https://github.com/mazetoken/mazetoken.github.io/raw/master/mazeminerandroid.zip

# Unzip the miner:

unzip mazeminerandroid.zip

# Check if miner files are unzipped in the directory:

ls

# Navigate to mazeminerandroid dir:

cd mazeminerandroid

# Open .env in Nano editor:

sudo nano .env

# Type or paste your WIF in Nano editor and change fastmine to "No" (ctrl O enter - to save changes, ctrl X enter - to exit Nano)

# Install and start the miner (from mazeminerandroid dir):

sudo npm install -g npm
npm i
npm audit fix
npm start


* Optional:

** Install g++ and cmake (for fastmine mining , cmake must be at least 3.12.4) - don't do this if you don't want to mine with fastmine

sudo apt-get install g++
sudo apt-get install make
sudo npm install cmake
cmake --version (to check cmake version)

** I don't know how to upgrade cmake here

** If you can upgrade cmake then navigate to fastmine dir:

cd fastmine
cmake . && make



# Miner should work (without fastmine) but there is no guarantee that you will get any block with your Android phone

