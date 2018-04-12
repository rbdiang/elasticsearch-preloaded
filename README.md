# Docker Elasticsearch Preloaded Index
This project create a docker image of elasticsearch that allows for preloading an index when a stack service is deployed.  
This is useful when you want to preload a bunch of kibana dashboards with your elk stack.

## Build
To build this image run the following command:
```bash
 docker build . -t thenotifier-elasticsearch:0.0.1-6.2.3
```

## Example
This example will preload the contents of `index.json` to /test index
