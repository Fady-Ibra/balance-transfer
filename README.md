Balance Transfer
================


This repo is based on the Hyperledger Fabric samples https://github.com/hyperledger/fabric-samples.
We will provision a business network with the following docker containers:
- 2 CAs
- A SOLO orderer
- 4 peers (2 peers per Org)


Steps of Install and Run 
-----

**1) We install the required software by running the command:**
```
wget -O - https://raw.githubusercontent.com/fady-a-m-ibrahim/balance-transfer/master/install.sh | bash
```
We will be asked about the current user password (this user should have the right to use sudo).
After the installation is completed, the machine will reboot. We wait until the command line is becoming available again.

**2) We install the required version of node JS by running the command:**
```
nvm install v8.16.0
```
To install the Long Term Support (LTS) version of node JS, we can use the command `nvm install --lts`.

**3) We run the Bussiness network by running the command:**
```
wget -O - https://raw.githubusercontent.com/fady-a-m-ibrahim/balance-transfer/master/run.sh | bash
```

**4) We update the PATH variable by running the command:**
```
source ~/.profile
```


Steps of Use
-----

**1) We set the IP and port by running the command:**
```
IP=localhost
PORT=4000
```
We have to change these values if needed. 

**2) We send an HTTP POST request to get the JSON Web Token (JWT) by running the commands:**
```
ORG1_TOKEN=$(curl -s -X POST \
  http://$IP:$PORT/users \
  -H "content-type: application/x-www-form-urlencoded" \
  -d 'username=fady&orgName=Org1')
ORG1_TOKEN=$(echo $ORG1_TOKEN | jq ".token" | sed "s/\"//g")
```
Here, after we get the HTTP POST reply, we filter the reply to put only the **JWT** in the variable ORG1_TOKEN.

**3) We send an HTTP GET request to query the business network by running the command:**
```
curl -s -X GET \
  "http://$IP:$PORT/channels/mychannel/chaincodes/mycc?peer=peer0.org1.example.com&fcn=query&args=%5B%22alice%22%5D" \
  -H "authorization: Bearer $ORG1_TOKEN" \
  -H "content-type: application/json"
```
Here, we see how we can query the balance of user *alice*.
Hint: **%5B%22alice%22%5D** is the encode of **["alice"]**.

Call the Server using any Programing Language
-----
We can use the **Steps of Use** to create an automatic call from any programing language we choose.
