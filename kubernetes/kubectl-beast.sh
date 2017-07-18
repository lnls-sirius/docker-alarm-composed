#!/bin/bash

function delete {

	for CONTAINER in ${CONTAINERS[@]}; do

		kubectl delete ${1} beast-alarm-${CONTAINER}-${1}

	done

}

function create	{

        for CONTAINER in ${CONTAINERS[@]}; do

                kubectl	create -f beast-alarm-${CONTAINER}-${1}.yaml

        done

}


ACTION=${1}
ENTITY=${2}

CONTAINERS=( "postgres-db" "activemq" "server" )

if [ "${ACTION}" == "del" ]; then

	delete ${ENTITY}
else
	create ${ENTITY}	

fi

kubectl get ${ENTITY}
