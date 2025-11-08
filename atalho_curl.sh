#!bin/bash

function GET()
{
    declare get_uri

    if [ -z "$URI" ]; then
        get_uri='localhost:8080'
    else
        get_uri="$URI"
    fi
    echo "curl -X GET ${get_uri}$1"
    curl --silent -X GET "${get_uri}$1" | jq
}

function PUT()
{
    declare put_uri

    if [ -z "$URI" ]; then
        put_uri='localhost:8080'
    else
        put_uri="$URI"
    fi
    echo "curl --silent -X PUT -H \"Content-Type: application/json\" -d @$1 ${put_uri}$2"
    eval "curl --silent -X PUT -H \"Content-Type: application/json\" -d @$1 ${put_uri}$2" | jq
}

function POST()
{
    declare put_uri

    if [ -z "$URI" ]; then
        put_uri='localhost:8080'
    else
        put_uri="$URI"
    fi
    echo "curl --silent -X POST -H \"Content-Type: application/json\" -d @$1 ${put_uri}$2"
    eval "curl --silent -X POST -H \"Content-Type: application/json\" -d @$1 ${put_uri}$2" | jq
}

function DELETE()
{
	declare del_uri

	if [ -z "$URI" ]; then
		del_uri='localhost:8080'
	else
		del_uri="$URI"
	fi
	echo "curl --silent -X DELETE ${del_uri}$1"
	eval "curl --silent -X DELETE ${del_uri}$1" | jq
}
