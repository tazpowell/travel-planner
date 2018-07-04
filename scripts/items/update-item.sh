#!/bin/bash

curl "https://aqueous-forest-96537.herokuapp.com/items/${ID}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "item": {
      "name": "'"${NAME}"'",
      "date": "'"${DATE}"'",
      "active": "'"${ACTIVE}"'"
    }
  }'

echo
