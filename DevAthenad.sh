#!/usr/bin/bash

export DONGLE_ID=7d5fbee9d4476ca3
export JWT_TOKEN=https://jwt.comma.ai/

# Authentication
curl -H 'Authorization: JWT ${JWT_TOKEN}' https://api.commadotai.com/

# Trying remote change a helloWorld param
curl https://athena.comma.ai/${DONGLE_ID} \
-d '{"method":"setCruiseSpeed", 777}' \
-H "Authorization: JWT ${JWT_TOKEN}" 

# @mlp Example
# curl https://athena.comma.ai/${DONGLE_ID} \
# -d '{"method":"getMessage","params":{"service":"thermal","timeout":5000},"jsonrpc":"2.0","id":0}' \
# -H "Authorization: JWT ${JWT_TOKEN}" | jq