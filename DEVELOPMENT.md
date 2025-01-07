# Ad Revenue App - Development Workflow

## Local Development Environment
- Primary Development Location: PublixReserve/ad-revenue-app
- Synchronization with Android Studio via `sync_project.sh`

## Workflow Steps
1. Make Changes Locally
   - Work in PublixReserve/ad-revenue-app
   - Run local tests using `./test_report.sh`

2. Synchronize with Android Studio
   ```bash
   # Update the ANDROID_STUDIO_PROJECT path in sync_project.sh first
   ./sync_project.sh
   ```

3. Open in Android Studio
   - Use the synchronized project directory
   - Perform additional Android-specific testing

## Testing
- Local Tests: `./test_report.sh`
- Android Studio: Use built-in test runner
- Emulator Testing: Recommended for full integration tests

## Version Control
- Primary Repo: Local Git repository
- Recommended: Set up remote GitHub/GitLab repository

## Recommended Tools
- JDK 17
- Android Studio Hedgehog or later
- Git
- Gradle

## Troubleshooting
- If sync fails, check paths in `sync_project.sh`
- Ensure consistent Java and Gradle versions
- Clear Android Studio cache if needed

## Best Practices
- Always run local tests before Android Studio sync
- Keep `.gitignore` updated
- Use meaningful commit messages
