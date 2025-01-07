# Ad Revenue App Testing Guide

## Prerequisites
- Android Studio (Latest Version)
- Android Emulator or Physical Android Device
- Firebase Account
- Google AdMob Account

## Testing Scenarios

### 1. Authentication Flow
- [ ] Register new user
  - Enter valid email and password
  - Verify account creation
  - Check initial points are 0

- [ ] Login Flow
  - Use registered credentials
  - Verify successful login
  - Check navigation to main screen

- [ ] Error Handling
  - Try registering with existing email
  - Try login with incorrect password
  - Verify appropriate error messages

### 2. Ad Interaction
- [ ] Rewarded Video Ad
  - Click "Watch Ad and Earn Points"
  - Verify ad loads
  - Complete ad watching
  - Check point increment

- [ ] Banner Ad
  - Verify banner ad displays
  - Check for no crashes or layout issues

### 3. Points System
- [ ] Point Tracking
  - Watch multiple ads
  - Verify cumulative point increase
  - Check Firebase database for point updates

### 4. Edge Cases
- [ ] No Internet Connection
  - Disable network
  - Attempt ad watching
  - Verify graceful error handling

- [ ] Ad Loading Failures
  - Simulate ad loading errors
  - Check app stability

## Testing Tools
- Android Studio Logcat
- Firebase Console
- AdMob Test Ads

## Test Ad Units
- Rewarded Video: `ca-app-pub-3940256099942544/5224354917`
- Banner: `ca-app-pub-3940256099942544/6300978111`

## Recommended Test Devices
- Pixel 4 Emulator
- Physical mid-range Android device

## Troubleshooting
1. Clear app data if authentication fails
2. Verify Google Services JSON is correctly configured
3. Check Firebase and AdMob configurations
