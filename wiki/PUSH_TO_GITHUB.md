# Instructions to Push Documentation to GitHub Wiki

## Step 1: Enable Wiki in GitHub Repository

1. Go to your repository: https://github.com/a7eidar/claims
2. Click on **Settings** tab
3. Scroll down to **Features** section
4. Check **Wikis** checkbox to enable it
5. Click **Save**

## Step 2: Create a Personal Access Token (PAT)

GitHub no longer accepts passwords for Git operations. You need a Personal Access Token:

1. Go to: https://github.com/settings/tokens
2. Click **Generate new token** → **Generate new token (classic)**
3. Give it a name: "Claims Wiki Push"
4. Select scopes:
   - ✅ `repo` (Full control of private repositories)
   - ✅ `write:packages` (if needed)
5. Click **Generate token**
6. **COPY THE TOKEN IMMEDIATELY** (you won't see it again!)

## Step 3: Push Using Personal Access Token

Run these commands from the `claims-wiki` directory:

```bash
cd /Users/aheidar/Documents/AI/muleforceaigent-platform-main-sb/claims-wiki

# Replace YOUR_TOKEN with your Personal Access Token
git push https://YOUR_TOKEN@github.com/a7eidar/claims.wiki.git main
```

Or set it up as remote and push:

```bash
cd /Users/aheidar/Documents/AI/muleforceaigent-platform-main-sb/claims-wiki

# Set remote URL with token (replace YOUR_TOKEN)
git remote set-url origin https://YOUR_TOKEN@github.com/a7eidar/claims.wiki.git

# Push to GitHub
git push -u origin main
```

## Alternative: Use GitHub CLI

If you have GitHub CLI installed:

```bash
gh auth login
cd /Users/aheidar/Documents/AI/muleforceaigent-platform-main-sb/claims-wiki
git push -u origin main
```

## Verify

After pushing, check:
- https://github.com/a7eidar/claims/wiki
- You should see all the documentation files

## Security Note

⚠️ **Never commit your Personal Access Token to Git!**
- Use environment variables or Git credential helper
- Revoke tokens if accidentally exposed
- Use fine-grained tokens with minimal permissions when possible

