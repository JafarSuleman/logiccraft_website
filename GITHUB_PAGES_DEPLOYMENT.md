# Deploying LogicCraft Website to GitHub Pages

This guide will walk you through the process of deploying your LogicCraft website to GitHub Pages so you can share it with others using a URL like `https://yourusername.github.io/logiccraft_website/`.

## Prerequisites

- A GitHub account (create one at [github.com](https://github.com/signup) if you don't have one)
- Git installed on your computer ([Download Git](https://git-scm.com/downloads))
- Flutter SDK installed ([Flutter installation guide](https://docs.flutter.dev/get-started/install))

## Step 1: Create a New GitHub Repository

1. Go to [github.com/new](https://github.com/new)
2. Name your repository `logiccraft_website`
3. Keep it as a Public repository
4. Click "Create repository"

## Step 2: Push Your Code to GitHub

Open a terminal/command prompt in your project directory (where the `pubspec.yaml` file is located) and run the following commands:

```bash
# Initialize Git (if not already done)
git init

# Add all files to Git
git add .

# Commit the files
git commit -m "Initial commit"

# Set the remote GitHub repository (replace YOUR_USERNAME with your GitHub username)
git remote add origin https://github.com/YOUR_USERNAME/logiccraft_website.git

# Rename the default branch to main
git branch -M main

# Push your code to GitHub
git push -u origin main
```

## Step 3: Enable GitHub Pages with GitHub Actions

1. Go to your repository on GitHub
2. Click on "Settings" tab
3. From the left sidebar, click on "Pages"
4. Under "Build and deployment", set:
   - Source: "GitHub Actions"

GitHub will detect the workflow file in your repository (`.github/workflows/deploy.yml`) and use it to build and deploy your website.

## Step 4: Trigger the Deployment

The deployment should start automatically after pushing your code. If not:

1. Go to the "Actions" tab in your repository
2. You should see the "Deploy to GitHub Pages" workflow
3. Click on it to view the progress of the deployment

## Step 5: Access Your Published Website

After the workflow completes successfully (it takes a few minutes), your website will be available at:

```
https://YOUR_USERNAME.github.io/logiccraft_website/
```

Replace `YOUR_USERNAME` with your actual GitHub username.

## Troubleshooting

If your deployment fails or the website doesn't appear correctly:

1. Check the Actions tab for any error messages in the workflow
2. Make sure your repository is public (or you have GitHub Pro for private repository Pages)
3. Verify that the base href is correctly set in the workflow file

## Updating Your Website

To update your website after making changes:

1. Make your changes to the code
2. Commit the changes:
   ```bash
   git add .
   git commit -m "Updated website"
   ```
3. Push to GitHub:
   ```bash
   git push
   ```

The GitHub Actions workflow will automatically rebuild and redeploy your website.

## Custom Domain (Optional)

If you want to use a custom domain (like `www.logiccraft.tech`) instead of the GitHub Pages URL:

1. In your repository settings, under Pages, add your custom domain
2. Create/update DNS records with your domain registrar
3. Update the `--base-href` parameter in the GitHub workflow file to match your domain

Refer to [GitHub's documentation on custom domains](https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site/managing-a-custom-domain-for-your-github-pages-site) for detailed instructions. 