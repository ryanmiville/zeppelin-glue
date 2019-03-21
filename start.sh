#! /usr/bin/env sh

if [ -z "$1" ]; then
  echo "must provide a name as an argument"
  exit 1
fi

echo "waiting for status to be READY"

status=`aws glue get-dev-endpoint --endpoint-name $1 --query 'DevEndpoint.Status' --output text`
echo "status is $status"

until [ "$status" == "READY" ]
do
	status=`aws glue get-dev-endpoint --endpoint-name $1 --query 'DevEndpoint.Status' --output text`
	sleep 15
	echo "status is $status"
done

name=`aws glue get-dev-endpoint --endpoint-name $1 --query 'DevEndpoint.PublicAddress' --output text`

ENDPOINT=$name docker-compose up --build
