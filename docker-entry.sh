#!/bin/bash


declare -a es_opts

while IFS='=' read -r envvar_key envvar_value
do
    # Elasticsearch env vars need to have at least two dot separated lowercase words, e.g. `cluster.name`
    if [[ "$envvar_key" =~ ^[a-z0-9_]+\.[a-z0-9_]+ ]]; then
        if [[ ! -z $envvar_value ]]; then
          es_opt="-E${envvar_key}=${envvar_value}"
          es_opts+=("${es_opt}")
        fi
    fi
done < <(env)

echo es opts: ${es_opts[@]}

cmd="/usr/share/elasticsearch/bin/elasticsearch ${es_opts[@]} -p /tmp/es.pid -s -d"
echo $cmd
chroot --userspec=1000 / /bin/bash -c "$cmd"

echo "doing my own thing "

/tn/insert-data.sh


echo "killing shit"
kill -SIGTERM $(cat /tmp/es.pid)

echo "staging elasticsearch for real"
exec /usr/local/bin/docker-entrypoint.sh "${@}"
