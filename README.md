# Monday Code deploy action
This action deploys your project to your monday app

## Inputs

## `token`

**Required** 

Monday developer token.

Can be acquired here: https://<your-monday-subdomain>.monday.com/apps/manage/tokens

## `versionId`

**Required** 

The app version to push your code into.

Can be found using `mapps app-version:list --appId=<ID>` command in your terminal.

The appId can be obtained in the dev center on the app page.


## Example usage
```
uses: mondaycom/monday-code-deploy-action
with:
  token: ${{ secrets.MONDAY_TOKEN }}
  versionId: 1234567
```

