#!/bin/bash
declare serverIps=("10.168.100.151" "10.168.100.166")
declare port=9090
declare indexName="tuan_activities"

_di(){
    curl "http://$1:$2/solr/$3/dataimport?command=full-import&clean=true&commit=true&wt=json&indent=true&verbose=false&optimize=false&debug=false&_=$RANDOM"
}
# */5 * * * * /data/sh/solr/solr_di.sh
for serverIp in ${serverIps[@]};do
    _di $serverIp $port $indexName
done
