# balance-transfer

```
wget -O - https://raw.githubusercontent.com/fady-a-m-ibrahim/balance-transfer/master/install.sh | bash
```

```
wget -O - https://raw.githubusercontent.com/fady-a-m-ibrahim/balance-transfer/master/run.sh | bash
```

```
IP=<CHANGE_THIS_TO_REAL_VALUE_OF_IP_OF_THE_MACHINE_WHERE_BALANCE_TRANSFER_IS_RUNNING>
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
