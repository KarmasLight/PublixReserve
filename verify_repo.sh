#!/bin/bash

# Repository Verification Script

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# GitHub Repository Details
REPO_OWNER="KarmasLightening"
REPO_NAME="ad-revenue-app"

echo -e "${YELLOW}🔍 Starting Repository Verification${NC}"

# 1. Verify Local Git Configuration
echo -e "\n${YELLOW}1. Checking Local Git Configuration${NC}"
LOCAL_USER=$(git config user.name)
LOCAL_EMAIL=$(git config user.email)
echo "Local Git User: $LOCAL_USER"
echo "Local Git Email: $LOCAL_EMAIL"

# 2. Check Remote Repository Connection
echo -e "\n${YELLOW}2. Verifying Remote Repository Connection${NC}"
git remote -v

# 3. Check Branch Information
echo -e "\n${YELLOW}3. Checking Git Branches${NC}"
git branch -a

# 4. Verify GitHub Repository Existence
echo -e "\n${YELLOW}4. Checking GitHub Repository Existence${NC}"
REPO_CHECK=$(gh repo view "$REPO_OWNER/$REPO_NAME" 2>&1)
if [ $? -eq 0 ]; then
    echo -e "${GREEN}✓ Repository exists on GitHub${NC}"
    
    # 5. Check Repository Details
    echo -e "\n${YELLOW}5. Repository Details${NC}"
    gh repo view "$REPO_OWNER/$REPO_NAME" --web
    
    # 6. Check GitHub Actions
    echo -e "\n${YELLOW}6. Checking GitHub Actions Workflow${NC}"
    WORKFLOW_STATUS=$(gh run list -R "$REPO_OWNER/$REPO_NAME" -w "Android CI" --limit 1)
    echo "$WORKFLOW_STATUS"
else
    echo -e "${RED}✗ Repository not found on GitHub${NC}"
fi

# 7. Verify File Synchronization
echo -e "\n${YELLOW}7. Checking Critical Files${NC}"
CRITICAL_FILES=(
    "README.md"
    "DEVELOPMENT.md"
    "CONFIGURATION.md"
    "app/build.gradle.kts"
    ".github/workflows/android_test.yml"
)

for file in "${CRITICAL_FILES[@]}"; do
    if [ -f "$file" ]; then
        echo -e "${GREEN}✓ $file exists${NC}"
    else
        echo -e "${RED}✗ $file is missing${NC}"
    fi
done

# 8. Test Connectivity
echo -e "\n${YELLOW}8. Testing SSH Connectivity${NC}"
ssh -T git@github.com

echo -e "\n${GREEN}🎉 Repository Verification Complete!${NC}"
