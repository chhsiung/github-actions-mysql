#!/bin/sh

cmd="docker run --rm"

if [ -n "$INPUT_ROOTPASSWORD" ]; then
  cmd="$cmd -e MYSQL_ROOT_PASSWORD=$INPUT_ROOTPASSWORD"
else
  echo "No credentials for root has been provided. Exiting...."
  exit 1
fi

if [ -n "$INPUT_DOCKERNETWORK" ]; then
  cmd="$cmd --network $INPUT_DOCKERNETWORK"
fi

cmd="$cmd -d -p $INPUT_HOSTPORT:$INPUT_CONTAINERPORT"
cmd="$cmd --hostname=mysql"
cmd="$cmd --name=mysql"
cmd="$cmd mysql:$INPUT_VERSION"
cmd="$cmd --port=$INPUT_CONTAINERPORT"
cmd="$cmd --character-set-server=$INPUT_CHARACTERSET"
cmd="$cmd --collation-server=$INPUT_COLLATION"
if [ -n "$INPUT_SQLMODE" ]; then
  cmd="$cmd --sql-mode=$INPUT_SQLMODE"
fi

echo "CMD: $cmd"

sh -c "$cmd"
