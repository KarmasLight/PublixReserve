#!/bin/bash

# Compile test runner
javac -cp .:junit-4.13.2.jar:hamcrest-core-1.3.jar TestRunner.java

# Run tests
java -ea -cp .:junit-4.13.2.jar:hamcrest-core-1.3.jar TestRunner > test_results.txt 2>&1

# Generate markdown report
echo "# Ad Revenue App - Test Report" > TEST_REPORT.md
echo "" >> TEST_REPORT.md
echo "## Test Execution Date: $(date)" >> TEST_REPORT.md
echo "" >> TEST_REPORT.md
echo "### Test Results" >> TEST_REPORT.md
echo "\`\`\`" >> TEST_REPORT.md
cat test_results.txt >> TEST_REPORT.md
echo "\`\`\`" >> TEST_REPORT.md

# Print results
cat TEST_REPORT.md
