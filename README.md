# Monday Code deploy action
This action push your project into monday code hosting.

## Inputs

## `token`

**Required** Monday developer token.

## `versionId`

**Required** The app version to push your code into, can be grabbed via running the cli locally.

## Example usage

uses: @mondaycom/monday-code-deploy-action
with:
  token: 'some-dev-token-from-dev-portal'
  versionId: 1234567
