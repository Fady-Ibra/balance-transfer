#! /bin/bash

mkdir fabric 2> /dev/null
cd fabric
rm -fr * 2> /dev/null

curl -sSL https://raw.githubusercontent.com/hyperledger/fabric/master/scripts/bootstrap.sh | bash
printf "\n export PATH=\"$PWD/fabric-samples/bin:\$PATH\" \n" >> ~/.profile
source ~/.profile

cd fabric-samples/
git checkout v1.4.6
git branch

cd  balance-transfer/
nohup ./runApp.sh & 

nohub ./testAPIs.sh &

###############################
#This part needs to be updated#
###############################
./runApp.sh | \
while read line; do
  if echo $line | grep "4000"; then
    ./testAPIs.sh 

    ORG1_TOKEN=$(curl -s -X POST \
      http://localhost:4000/users \
      -H "content-type: application/x-www-form-urlencoded" \
      -d 'username=fady&orgName=Org1')
    ORG1_TOKEN=$(echo $ORG1_TOKEN | jq ".token" | sed "s/\"//g")

    curl -s -X POST \
      http://localhost:4000/channels/mychannel/chaincodes \
      -H "authorization: Bearer $ORG1_TOKEN" \
      -H "content-type: application/json" \
      -d '{
	"chaincodeName":"mycc",
	"chaincodeVersion":"v0",
	"chaincodeType": "golang",
	"args":["alice","100000","bob","200000"]
      }'
  fi
done 
###############################
