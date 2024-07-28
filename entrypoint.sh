#!/bin/sh

TOKEN=$1
APP_ID=$2
REGION=$3

mapps init -t $TOKEN

if [ -n "$REGION" ]; then
  mapps code:push -a $APP_ID -z $REGION
else
  mapps code:push -a $APP_ID
fi
