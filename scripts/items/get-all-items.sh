#!/bin/bash

curl "https://aqueous-forest-96537.herokuapp.com/items" \
  --include \
  --request GET \
  --header "Authorization: Token token=${TOKEN}"

echo
