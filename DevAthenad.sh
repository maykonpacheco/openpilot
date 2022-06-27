#!/usr/bin/bash

export DONGLE_ID=7d5fbee9d4476ca3
export JWT_TOKEN=https://jwt.comma.ai/

# Authentication
curl -H 'Authorization: JWT ${JWT_TOKEN}' https://api.commadotai.com/

# Trying remote change a helloWorld param
curl https://athena.comma.ai/${DONGLE_ID} \
-d '{"method":"setCruiseSpeed","params":{"speed":"777","timeout":5000},"jsonrpc":"2.0","id":0}' \
-H "Authorization: JWT ${JWT_TOKEN}" | jq

# @mlp Example
# curl https://athena.comma.ai/${DONGLE_ID} \
# -d '{"method":"getMessage","params":{"service":"deviceState","timeout":5000},"jsonrpc":"2.0","id":0}' \
# -H "Authorization: JWT ${JWT_TOKEN}" | jq

# curl https://athena.comma.ai/${DONGLE_ID} \
# -d '{"method":"setNavDestination","params":{"latitude":"foo","longitude":"bar", "place_name":"foobar", "place_details":"baz"},"jsonrpc":"2.0","id":0}' \
# -H "Authorization: JWT ${JWT_TOKEN}" | jq

# @dispatcher.add_method
# def setNavDestination(latitude=0, longitude=0, place_name=None, place_details=None):
#   destination = {
#     "latitude": latitude,
#     "longitude": longitude,
#     "place_name": place_name,
#     "place_details": place_details,
#   }
#   Params().put("NavDestination", json.dumps(destination))