#!/bin/bash
# Script to push claims documentation to GitHub wiki
# Usage: ./push_wiki.sh YOUR_PERSONAL_ACCESS_TOKEN

if [ -z "$1" ]; then
    echo "Usage: ./push_wiki.sh YOUR_PERSONAL_ACCESS_TOKEN"
    echo ""
    echo "To create a Personal Access Token:"
    echo "1. Go to https://github.com/settings/tokens"
    echo "2. Click 'Generate new token (classic)'"
    echo "3. Select 'repo' scope"
    echo "4. Generate and copy the token"
    exit 1
fi

TOKEN=$1
REMOTE_URL="https://${TOKEN}@github.com/a7eidar/claims.wiki.git"

echo "Setting remote URL..."
git remote set-url origin "$REMOTE_URL"

echo "Pushing to GitHub wiki..."
git push -u origin main

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Successfully pushed to GitHub wiki!"
    echo "View your wiki at: https://github.com/a7eidar/claims/wiki"
else
    echo ""
    echo "❌ Push failed. Make sure:"
    echo "1. Wiki is enabled in repository settings"
    echo "2. Personal Access Token has 'repo' scope"
    echo "3. Token is valid and not expired"
fi
