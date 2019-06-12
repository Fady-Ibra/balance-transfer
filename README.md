Balance Transfer
================

This repo is based on the Hyperledger Fabric samples https://github.com/hyperledger/fabric-samples.
We will provision a Bussiness network with the following docker containers:
- 2 CAs
- A SOLO orderer
- 4 peers (2 peers per Org)

Steps
-----

1) We start by running the command:
```
wget -O - https://raw.githubusercontent.com/fady-a-m-ibrahim/balance-transfer/master/install.sh | bash
```
We will be asked for the current user passward (this user should have the righ to use sudo)

```
nvm install v8.16.0
```

2) Then We use the command:
```
wget -O - https://raw.githubusercontent.com/fady-a-m-ibrahim/balance-transfer/master/run.sh | bash && source ~/.profile
```




```
IP=localhost #<CHANGE_THIS_TO_REAL_VALUE_OF_IP_OF_THE_MACHINE_WHERE_BALANCE_TRANSFER_IS_RUNNING>
ORG1_TOKEN=$(curl -s -X POST \
  http://$IP:4000/users \
  -H "content-type: application/x-www-form-urlencoded" \
  -d 'username=Jim&orgName=Org1')
ORG1_TOKEN=$(echo $ORG1_TOKEN | jq ".token" | sed "s/\"//g")
curl -s -X GET \
  "http://$IP:4000/channels/mychannel/chaincodes/mycc?peer=peer0.org1.example.com&fcn=query&args=%5B%22a%22%5D" \
  -H "authorization: Bearer $ORG1_TOKEN" \
  -H "content-type: application/json"

```
