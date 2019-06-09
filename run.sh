#! /bin/bash

mkdir fabric
cd fabric

wget -O - https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
source ~/.profile 
nvm install v8.16.0

wget -O - https://raw.githubusercontent.com/hyperledger/fabric/master/scripts/bootstrap.sh | bash
echo "" >> ~/.profile
echo "export PATH=\"$PWD/fabric-samples/bin:\$PATH\"" >> ~/.profile
source ~/.profile

cd fabric-samples/balance-transfer
./runApp.sh &
sleep 60
./testAPIs.sh 


