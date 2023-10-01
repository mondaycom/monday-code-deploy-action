TOKEN=$1
APP_VERSION_ID=$2

mapps init -t $TOKEN
mapps code:push -i $APP_VERSION_ID
