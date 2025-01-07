# GitHub Repository Setup Guide

## Prerequisites
- GitHub Account
- Git installed locally
- SSH Key (recommended) or Personal Access Token

## Steps to Create Repository
1. Go to [GitHub](https://github.com)
2. Click '+' icon in top right corner
3. Select 'New repository'
4. Repository Details:
   - Name: `ad-revenue-app`
   - Description: "Android app for earning revenue by watching ads"
   - Visibility: Public or Private (your choice)
   - Initialize with:
     - ✓ README
     - ✓ .gitignore (Android)
     - ✓ License (Optional: MIT recommended)

## After Creating Repository
```bash
# In your local project directory
git remote add origin git@github.com:YOUR_USERNAME/ad-revenue-app.git
git branch -M main
git push -u origin main
```

## Recommended Repository Settings
- Enable Issues
- Enable Projects
- Enable Wiki
- Protect main branch
- Require pull request reviews

## CI/CD Suggestions
- Set up GitHub Actions for:
  - Automated testing
  - Build verification
  - Code quality checks
