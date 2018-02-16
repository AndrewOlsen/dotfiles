#!/usr/bin/env bash
#
# Use coinmarketcap.com API to retrieve coin values in USD

echo "BTC: $(curl https://api.coinmarketcap.com/v1/ticker/bitcoin/ -s | jq '.[].price_usd' -r)"
echo "ETH: $(curl https://api.coinmarketcap.com/v1/ticker/ethereum/ -s | jq '.[].price_usd' -r)"
echo "LTE: $(curl https://api.coinmarketcap.com/v1/ticker/litecoin/ -s | jq '.[].price_usd' -r)"
echo "DOGE: $(curl https://api.coinmarketcap.com/v1/ticker/dogecoin/ -s | jq '.[].price_usd' -r)"
