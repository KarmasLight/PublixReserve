#!/bin/bash

# Synchronization script for Ad Revenue App

# Configuration
LOCAL_PROJECT="/home/karmaslightening/CascadeProjects/PublixReserve/ad-revenue-app"
ANDROID_STUDIO_PROJECT="/path/to/your/AndroidStudioProjects/AdRevenueApp"

# Ensure paths exist
mkdir -p "$ANDROID_STUDIO_PROJECT"

# Sync directories
rsync -av --delete \
    --exclude=".git" \
    --exclude=".gradle" \
    --exclude="build" \
    --exclude=".idea" \
    "$LOCAL_PROJECT/" "$ANDROID_STUDIO_PROJECT/"

# Create symlinks for critical development files
ln -sf "$LOCAL_PROJECT/README.md" "$ANDROID_STUDIO_PROJECT/README.md"
ln -sf "$LOCAL_PROJECT/TESTING.md" "$ANDROID_STUDIO_PROJECT/TESTING.md"
ln -sf "$LOCAL_PROJECT/CONFIGURATION.md" "$ANDROID_STUDIO_PROJECT/CONFIGURATION.md"

# Git configuration
cd "$ANDROID_STUDIO_PROJECT"
git init
git remote add origin https://github.com/yourusername/ad-revenue-app.git

echo "Project synchronized successfully!"
echo "Remember to update the Android Studio project path in this script."
