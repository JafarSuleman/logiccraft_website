# Fixing GitHub Pages 404 Error

If you're encountering a 404 error when accessing your GitHub Pages site, follow these steps to fix the issue:

## Step 1: Update Your Repository Settings

1. Go to your GitHub repository (https://github.com/JafarSuleman/logiccraft_website)
2. Click on "Settings" tab
3. In the left sidebar, click on "Pages"
4. Under "Build and deployment":
   - Source: Select "Deploy from a branch"
   - Branch: Select "gh-pages" branch and "/ (root)" folder
   - Click "Save"

## Step 2: Run the Deployment Workflow Manually

1. Go to the "Actions" tab in your repository
2. Click on "Deploy Flutter Web to GitHub Pages" workflow
3. Click on "Run workflow" dropdown
4. Select the "main" branch
5. Click "Run workflow"

## Step 3: Verify the Deployment

1. Wait for the workflow to complete (it should take a few minutes)
2. Go back to "Settings" > "Pages"
3. You should now see a message saying "Your site is live at https://jafarsuleman.github.io/logiccraft_website/"

## Step 4: Access Your Website

Your website should now be accessible at:
- https://jafarsuleman.github.io/logiccraft_website/

If you're still encountering issues, try the following:

1. Clear your browser cache
2. Try accessing the site in an incognito/private browsing window
3. Check that the gh-pages branch has been created with your website files
4. Ensure there are no build errors in the Actions logs

## Common Issues

1. **404 Error**: This usually means GitHub Pages can't find the correct files to serve. Make sure your website files are in the root of the gh-pages branch.

2. **Blank Page**: If you see a blank page instead of your website, check the browser console for errors. It might be an issue with paths or resources.

3. **No gh-pages Branch**: If the deployment workflow didn't create the gh-pages branch, try running the workflow manually or check for errors in the workflow run logs.

4. **Custom Domain Issues**: If you're using a custom domain, make sure the CNAME file is properly set up in the gh-pages branch. 