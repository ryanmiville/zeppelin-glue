#! /usr/bin/env sh

if [ -z "$1" ]; then
  echo "must provide a name as an argument"
  exit 1
fi

name=`aws glue get-dev-endpoint --endpoint-name $1 --query 'DevEndpoint.PublicAddress' --output text`

ENDPOINT=$name docker-compose up --build
