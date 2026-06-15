#!/bin/bash
echo "Pipeline is starting..."
python security_scan.py
if [ $? -ne 0 ]; then
    echo "the deployment has been blocked"
    exit 1
else
    echo "Starting Integration Tests..."
fi
python test_app.py
if [ $? -ne 0 ]; then
    echo "ALERT: Dynamic Testing Failed"
else
    echo "the code is safe and is successfully deployed"
    echo "SUCCESS: Live Integration test passed"
fi

