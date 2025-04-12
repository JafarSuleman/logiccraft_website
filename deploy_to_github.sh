#!/bin/bash

# Stop on errors
set -e

echo "LogicCraft Website - GitHub Deployment Script"
echo "----------------------------------------"

# Check if git is installed
if ! command -v git &> /dev/null; then
  echo "Git is not installed. Please install git and try again."
  exit 1
fi

# Check if the user is in the root directory of the project
if [ ! -f "pubspec.yaml" ] || ! grep -q "name: logiccraft_website" pubspec.yaml; then
  echo "Error: You must run this script from the root of the logiccraft_website project."
  exit 1
fi

# Ensure GitHub workflow directory exists
mkdir -p .github/workflows

# Check if the repository is already initialized
if [ ! -d ".git" ]; then
  echo "Initializing git repository..."
  git init
  git add .
  git commit -m "Initial commit"
else
  echo "Git repository already initialized."
fi

echo ""
echo "To deploy to GitHub, follow these steps:"
echo ""
echo "1. Create a new repository on GitHub named 'logiccraft_website'"
echo "   at https://github.com/new"
echo ""
echo "2. Add your GitHub repository as a remote and push:"
echo "   git remote add origin https://github.com/YOURUSERNAME/logiccraft_website.git"
echo "   git branch -M main"
echo "   git push -u origin main"
echo ""
echo "3. Go to your repository settings on GitHub:"
echo "   https://github.com/YOURUSERNAME/logiccraft_website/settings/pages"
echo ""
echo "4. Under 'Build and deployment', set:"
echo "   - Source: 'GitHub Actions'"
echo ""
echo "5. Your website will be built and deployed automatically."
echo "   It will be available at:"
echo "   https://YOURUSERNAME.github.io/logiccraft_website/"
echo ""
echo "Note: Replace YOURUSERNAME with your actual GitHub username."
echo ""

read -p "Would you like to set up GitHub remote now? (y/n): " SETUP_REMOTE

if [ "$SETUP_REMOTE" = "y" ] || [ "$SETUP_REMOTE" = "Y" ]; then
  read -p "Enter your GitHub username: " GITHUB_USERNAME
  
  if [ -n "$GITHUB_USERNAME" ]; then
    echo "Setting up GitHub remote..."
    git remote add origin "https://github.com/$GITHUB_USERNAME/logiccraft_website.git"
    git branch -M main
    
    echo "Ready to push. Run this command when you're ready:"
    echo "git push -u origin main"
  else
    echo "No username provided. You can set up the remote manually later."
  fi
fi

echo ""
echo "Script completed successfully!" 