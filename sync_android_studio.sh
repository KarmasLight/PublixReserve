#!/bin/bash

# PublixReserve Android Studio Synchronization Script

# Configuration
LOCAL_PROJECT="/home/karmaslightening/CascadeProjects/PublixReserve/PublixReserve"
ANDROID_STUDIO_PATH="/opt/android-studio"
ANDROID_STUDIO_PROJECTS="/home/karmaslightening/AndroidStudioProjects"
PROJECT_NAME="PublixReserve"

# Ensure Android Studio projects directory exists
mkdir -p "$ANDROID_STUDIO_PROJECTS"

# Full project sync with exclusions
rsync -av --delete \
    --exclude=".git" \
    --exclude=".gradle" \
    --exclude="build" \
    --exclude=".idea" \
    --exclude="*.iml" \
    "$LOCAL_PROJECT/" "$ANDROID_STUDIO_PROJECTS/$PROJECT_NAME/"

# Update project package name in files
find "$ANDROID_STUDIO_PROJECTS/$PROJECT_NAME" -type f \( -name "*.xml" -o -name "*.gradle" -o -name "*.kt" \) -print0 | xargs -0 sed -i 's/com\.adrevenue\.app/com\.publixreserve\.app/g'

# Create symlinks for important development files
ln -sf "$LOCAL_PROJECT/README.md" "$ANDROID_STUDIO_PROJECTS/$PROJECT_NAME/README.md"
ln -sf "$LOCAL_PROJECT/DEVELOPMENT.md" "$ANDROID_STUDIO_PROJECTS/$PROJECT_NAME/DEVELOPMENT.md"
ln -sf "$LOCAL_PROJECT/CONFIGURATION.md" "$ANDROID_STUDIO_PROJECTS/$PROJECT_NAME/CONFIGURATION.md"

# Initialize git in Android Studio project directory
cd "$ANDROID_STUDIO_PROJECTS/$PROJECT_NAME"
git init
git remote add origin git@github.com:KarmasLight/PublixReserve.git

# Set up git configuration
git config user.name "KarmasLight"
git config user.email "developer@example.com"

# Fetch remote branches
git fetch origin

# Set up tracking for main branch
git branch --set-upstream-to=origin/main main

echo "Project synchronized with Android Studio!"
echo "Project Location: $ANDROID_STUDIO_PROJECTS/$PROJECT_NAME"

# Optional: Open Android Studio (comment out if not needed)
# "$ANDROID_STUDIO_PATH/bin/studio.sh" "$ANDROID_STUDIO_PROJECTS/$PROJECT_NAME" &
