FROM docker.elastic.co/elasticsearch/elasticsearch:6.2.3

COPY docker-entry.sh index.json insert-data.sh /tn/

RUN chmod +x /tn/docker-entry.sh

ENTRYPOINT "/tn/docker-entry.sh"
