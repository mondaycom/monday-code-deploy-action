#!/bin/sh

TOKEN=$1
APP_ID=$2

mapps init -t $TOKEN
mapps code:push -a $APP_ID
