#!/bin/bash

url="http://34.136.51.91:80"

# Number of times to run the request
count=10000


i=0
while [ $i -lt $count ]; do
    echo "Request #$((i + 1))"
    curl $url
    i=$((i + 1))
done