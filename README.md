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
uses: mondaycom/monday-code-deploy-action
with:
  token: ${{ secrets.MONDAY_TOKEN }}
  appId: 1234567
```

