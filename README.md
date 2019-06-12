Balance Transfer
================

This repo is based on the Hyperledger Fabric samples https://github.com/hyperledger/fabric-samples.
We will provision a Bussiness network with the following docker containers:
- 2 CAs
- A SOLO orderer
- 4 peers (2 peers per Org)

Steps of Install and Run 
-----

**1) We install the required software by running the command:**
```
wget -O - https://raw.githubusercontent.com/fady-a-m-ibrahim/balance-transfer/master/install.sh | bash
```
We will be asked for the current user password (this user should have the right to use sudo).
After the installation is completed, the machine will reboot. We wait until the command line is becoming available again.

**2) We install the required version of node JS by running the command:**
```
nvm install v8.16.0
```

**3) Then We run the Bussiness network by running the command:**
```
wget -O - https://raw.githubusercontent.com/fady-a-m-ibrahim/balance-transfer/master/run.sh | bash
```

**4) asda**
```
source ~/.profile
```

Steps of Using
-----

**1) We set the IP and port by running the command:**
```
IP=localhost
PORT=4000
```
We need to change these values if needed 

```
ORG1_TOKEN=$(curl -s -X POST \
  http://$IP:4000/users \
  -H "content-type: application/x-www-form-urlencoded" \
  -d 'username=Jim&orgName=Org1')
ORG1_TOKEN=$(echo $ORG1_TOKEN | jq ".token" | sed "s/\"//g")
```

```
curl -s -X GET \
  "http://$IP:4000/channels/mychannel/chaincodes/mycc?peer=peer0.org1.example.com&fcn=query&args=%5B%22a%22%5D" \
  -H "authorization: Bearer $ORG1_TOKEN" \
  -H "content-type: application/json"
```

