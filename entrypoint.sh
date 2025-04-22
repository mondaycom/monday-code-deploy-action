#!/bin/sh
TOKEN=$1
APP_ID=$2
REGION=$3
VERSION_ID=$4
FORCE=$5
CLIENT=$6
DIR=$7

# Validate that at least one of APP_ID or VERSION_ID is provided
if [ -z "$APP_ID" ] && [ -z "$VERSION_ID" ]; then
  echo "::error::Either appId or versionId must be provided to deploy the app. Both cannot be empty."
  exit 1
fi


mapps init -t $TOKEN

# Build command arguments conditionally
if [ -z "$APP_ID" ]; then
  APP_ID_ARG=""
else
  APP_ID_ARG="-a $APP_ID"
fi

if [ -z "$REGION" ]; then
  REGION_ARG=""
else
  REGION_ARG="-z $REGION"
fi

if [ -z "$VERSION_ID" ]; then
  VERSION_ID_ARG=""
else
  VERSION_ID_ARG="-i $VERSION_ID"
fi

if [ -z "$FORCE" ]; then
  FORCE_ARG=""
else
  FORCE_ARG="-f"
fi

if [ -z "$CLIENT" ]; then
  CLIENT_ARG=""
else
  CLIENT_ARG="-c"
fi

if [ -z "$DIR" ]; then
  DIR_ARG=""
else
  DIR_ARG="-d $DIR"
fi

mapps code:push $APP_ID_ARG $REGION_ARG $VERSION_ID_ARG $FORCE_ARG $DIR_ARG $CLIENT_ARG
