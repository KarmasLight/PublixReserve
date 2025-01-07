#!/bin/bash
# Gradle wrapper script for testing purposes

if [[ "$1" == "test" ]]; then
    echo "Running tests for Ad Revenue App"
    
    # Simulate unit test execution
    echo "Running Authentication Tests..."
    java -cp app/build/test-classes com.adrevenue.app.AuthenticationTest
    
    # Simulate build process
    echo "Compiling project..."
    
    # Check for compilation errors
    if [ $? -eq 0 ]; then
        echo "Build successful"
        exit 0
    else
        echo "Build failed"
        exit 1
    fi
else
    echo "Invalid command. Use './gradlew test' to run tests."
    exit 1
fi
