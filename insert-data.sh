#!/bin/bash


PORT=9200

TEST_CURL="curl http://localhost:9200/_cluster/health"
$TEST_CURL 2> /dev/null
while [ $? -ne 0 ]; do
  echo "elasticsearch not up, sleeping 2 seconds"
  sleep 2
  $TEST_CURL 2> /dev/null
done

echo "inserting json"
curl -XPOST 'http://localhost:9200/test/test?pretty' -H 'Content-Type: application/json'  -d @/tn/index.json
echo "data indexed"
