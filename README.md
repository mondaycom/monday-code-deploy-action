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

Can be found using `mapps list` command.


## Example usage
```
uses: @mondaycom/monday-code-deploy-action
with:
  token: 'some-dev-token-from-dev-portal'
  versionId: 1234567
```

