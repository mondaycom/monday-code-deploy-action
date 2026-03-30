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

### `client`
Boolean flag to push client-side code to the CDN instead of deploying server-side code.
Default is `false`.

### `dirPath`
Path to the directory to upload.
When deploying client-side code, this should point to your build output directory (e.g., `build`, `dist`).

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
        uses: actions/checkout@v3
      
      # Deploy using app ID
      - name: Deploy to monday code
        uses: mondaycom/monday-code-deploy-action@v3
        with:
          token: ${{ secrets.MONDAY_TOKEN }}
          appId: 10110073
          region: eu

      # Or deploy using version ID
      - name: Deploy to specific version
        uses: mondaycom/monday-code-deploy-action@v3
        with:
          token: ${{ secrets.MONDAY_TOKEN }}
          versionId: 12345678
          force: true  # required if version is live
          region: eu
```

### Client-Side Deployment

```yaml
name: Deploy client side to monday code
on:
  push:
    branches:
      - main
jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v3

      - name: Install dependencies and build
        run: |
          npm ci
          npm run build

      - name: Deploy client side to monday code
        uses: mondaycom/monday-code-deploy-action@v3
        with:
          token: ${{ secrets.MONDAY_TOKEN }}
          appId: 10110073
          client: true
          dirPath: build
          region: eu
```

Note: You must provide either `appId` or `versionId`. If both are provided, `versionId` will take precedence over `appId`.
