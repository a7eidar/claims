#!/bin/bash
# Quick push script - Replace YOUR_TOKEN with your GitHub Personal Access Token

echo "To push, you need a GitHub Personal Access Token."
echo ""
echo "Quick steps to get a token:"
echo "1. Go to: https://github.com/settings/tokens"
echo "2. Click 'Generate new token (classic)'"
echo "3. Select 'repo' scope"
echo "4. Generate and copy token"
echo ""
read -p "Enter your Personal Access Token: " TOKEN

if [ -z "$TOKEN" ]; then
    echo "No token provided. Exiting."
    exit 1
fi

echo "Pushing to GitHub wiki..."
git remote set-url origin https://${TOKEN}@github.com/a7eidar/claims.wiki.git
git push -u origin main

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Successfully pushed!"
    echo "View wiki at: https://github.com/a7eidar/claims/wiki"
else
    echo ""
    echo "❌ Push failed. Make sure:"
    echo "1. Wiki is enabled in repo settings"
    echo "2. Token has 'repo' scope"
fi

