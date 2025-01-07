#!/bin/bash

# Set Java Home
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
export PATH=$JAVA_HOME/bin:$PATH

# Navigate to project directory
cd /home/karmaslightening/CascadeProjects/PublixReserve/ad-revenue-app

# Compile test classes
javac -cp .:app/build/test-classes app/src/test/java/com/adrevenue/app/AuthenticationTest.kt

# Run tests
java -cp .:app/build/test-classes org.junit.runner.JUnitCore com.adrevenue.app.AuthenticationTest

# Generate test report
echo "Test Report" > TEST_RESULTS.md
echo "=============" >> TEST_RESULTS.md
date >> TEST_RESULTS.md
echo "" >> TEST_RESULTS.md
echo "Test Results:" >> TEST_RESULTS.md
