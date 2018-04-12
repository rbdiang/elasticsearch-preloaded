# Docker Elasticsearch Preloaded Index
This project creates a docker image of elasticsearch that allows for preloading an index when a stack service is deployed.  
This is useful when you want to preload a bunch of kibana dashboards with your elk stack.

## Build
To build this image run the following command:
```bash
 docker build . -t thenotifier-elasticsearch:0.0.1-6.2.3
```

## Example
This example will preload the contents of `index.json` to /test index

### deploy stack
Deploy stack using:
```bash
docker stack deploy -c docker-compose.yml es
```
### View results:
After 20 seconds use curl to see the results of test index:
```bash
curl http://localhost:9200/test/_search?pretty
```
Results:
```json
{
  "took" : 65,
  "timed_out" : false,
  "_shards" : {
    "total" : 5,
    "successful" : 5,
    "skipped" : 0,
    "failed" : 0
  },
  "hits" : {
    "total" : 1,
    "max_score" : 1.0,
    "hits" : [
      {
        "_index" : "test",
        "_type" : "test",
        "_id" : "hGUbuGIB1iSyTPoowJBy",
        "_score" : 1.0,
        "_source" : {
          "field1" : "lorem",
          "field2" : "ipsum",
          "field3" : "dolor",
          "field4" : "si",
          "field5" : "amet"
        }
      }
    ]
  }
}
```
