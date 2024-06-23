# Monday Code deploy action
This action deploys your project to your monday app

## Inputs

## `token`

**Required** 

Monday developer token.

Can be acquired here: https://<your-monday-subdomain>.monday.com/apps/manage/tokens

## `appId`

**Required** 

The app ID to push your code into.

Can be found using `mapps app:list` command in your terminal or in the dev center. This will deploy monday code to the latest draft version of that app (if you also have only live / deprecated versions, this will fail)


## Example usage
```
name: Deploy to monday code

on:
  push:
    branches:
      - main

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v2
      - name: Deploy to monday code
        uses: mondaycom/monday-code-deploy-action@master
        with:
          token: ${{ secrets.MONDAY_TOKEN }}
          appId: 10110073
          region: eu
```

