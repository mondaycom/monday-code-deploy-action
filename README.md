# Monday Code Deploy Action
This action deploys your project to your monday app.

## Inputs

### `token`
**Required**  
Monday developer token.
Can be acquired here: https://<your-monday-subdomain>.monday.com/apps/manage/tokens

### `appId`
The app ID to push your code into (required if versionId is not provided).
Can be found using `mapps app:list` command in your terminal or in the dev center.

### `versionId`
The specific version ID to deploy to (required if appId is not provided).
Can be found using `mapps app:versions` command.
Note: If deploying to a live version, you must also set `force: true`.

### `force`
Boolean flag to force push to the latest version (draft or live).
Required when deploying to a live version.
Default is `false`.

### `region`
The region to deploy the app to: `us`, `eu`, or `au`.

## Example Usage

```yaml
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
      
      # Deploy using app ID
      - name: Deploy to monday code
        uses: mondaycom/monday-code-deploy-action@master
        with:
          token: ${{ secrets.MONDAY_TOKEN }}
          appId: 10110073
          region: eu

      # Or deploy using version ID
      - name: Deploy to specific version
        uses: mondaycom/monday-code-deploy-action@master
        with:
          token: ${{ secrets.MONDAY_TOKEN }}
          versionId: 12345678
          force: true  # required if version is live
          region: eu
```

Note: You must provide either `appId` or `versionId`. If both are provided, `versionId` will take precedence over `appId`.
