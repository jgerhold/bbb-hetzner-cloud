#!/bin/bash

while [[ $# -gt 0 ]]
do
key="$1"

case $key in
  --user-name)
    USERNAME="$2"
    shift
    shift
  ;;
  --user-email)
    USEREMAIL="$2"
    shift
    shift
  ;;
  --user-password)
    USERPW="$2"
    shift
    shift
  ;;
  *)
    shift
  ;;
esac
done

cd greenlight/

echo "Creating user ${USERNAME}|${USEREMAIL}"

docker exec greenlight-v2 bundle exec rake user:create["${USERNAME}","${USEREMAIL}","${USERPW}"]
