#!/usr/bin/env bash
curl http://api.coindesk.com/v1/bpi/currentprice.json -s | jq .bpi.USD.rate -r
