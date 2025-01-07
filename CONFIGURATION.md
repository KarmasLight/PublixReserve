# Firebase and AdMob Configuration Guide

## Firebase Setup
1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Create a new project
3. Add Android app
   - Package name: `com.adrevenue.app`
   - Download `google-services.json`
   - Place in `app/` directory

## Firebase Authentication
1. In Firebase Console, go to Authentication
2. Enable Email/Password sign-in method

## Firebase Realtime Database
1. Create Realtime Database
2. Set security rules:
```json
{
  "rules": {
    "users": {
      "$uid": {
        ".read": "$uid === auth.uid",
        ".write": "$uid === auth.uid"
      }
    }
  }
}
```

## Google AdMob Configuration
1. Go to [AdMob Console](https://apps.admob.com/)
2. Create new app
   - Platform: Android
   - App name: Ad Revenue App

3. Create Ad Units
   - Rewarded Video Ad Unit
   - Banner Ad Unit
   - Replace test ad units in code with your actual units

## Local Testing
Use these test ad units for development:
- Rewarded Video: `ca-app-pub-3940256099942544/5224354917`
- Banner: `ca-app-pub-3940256099942544/6300978111`

## Gradle Configuration
Ensure you have the latest Google Services and AdMob dependencies in `build.gradle`

## Emulator Testing
- Use Google Play enabled emulator
- Ensure Google Play Services are installed
