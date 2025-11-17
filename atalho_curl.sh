#!bin/bash

function get()
{
    declare get_uri

    if [ -z "$URL" ]; then
        get_url='localhost:8080'
    else
        get_url="$URL"
    fi
    echo "curl -X GET ${get_url}$1"
    curl --silent -X GET "${get_url}$1" | jq
}

function put()
{
    declare put_uri

    if [ -z "$URL" ]; then
        put_url='localhost:8080'
    else
        put_url="$URL"
    fi
    echo "curl --silent -X PUT -H \"Content-Type: application/json\" -d @$1 ${put_url}$2"
    eval "curl --silent -X PUT -H \"Content-Type: application/json\" -d @$1 ${put_url}$2" | jq
}

function post()
{
    declare put_uri

    if [ -z "$URL" ]; then
        put_url='localhost:8080'
    else
        put_url="$URL"
    fi
    echo "curl --silent -X POST -H \"Content-Type: application/json\" -d @$1 ${put_url}$2"
    eval "curl --silent -X POST -H \"Content-Type: application/json\" -d @$1 ${put_url}$2" | jq
}

function delete()
{
	declare del_uri

	if [ -z "$URL" ]; then
		del_url='localhost:8080'
	else
		del_url="$URL"
	fi
	echo "curl --silent -X DELETE ${del_url}$1"
	eval "curl --silent -X DELETE ${del_url}$1" | jq
}

function patch()
{
    declare patch_uri

    if [ -z "$URL" ]; then
        patch_url='localhost:8080'
    else
        patch_url="$URL"
    fi
    echo "curl --silent -X PATCH -H \"Content-Type: application/json\" -d @$1 ${patch_url}$2"
    eval "curl --silent -X PATCH -H \"Content-Type: application/json\" -d @$1 ${patch_url}$2" | jq
}
