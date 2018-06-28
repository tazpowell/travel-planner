#!/bin/bash

curl "https://aqueous-forest-96537.herokuapp.com/items/${ID}" \
  --include \
  --request DELETE \
  --header "Authorization: Token token=${TOKEN}"

echo
