import os
import sys

keyword_scanner = ["password", "secret", "api_key", "token", "credential"]

def scan_file_safety(file_name):
    print(f"🕵️‍♂️ Running security scan on {file_name}...")
    
    # Error handling if file doens't exist
    if not os.path.exists(file_name):
        print("❌ ERROR: Target file does not exist!")
        sys.exit(1)
    
    #Reading the file
    with open(file_name, "r") as file:
        text = file.read().lower()
    vulnerability_found = False
    
    #looping through our keywords to find secrets or anything hardcoded
    for badword in keyword_scanner:
        if badword in text:
            print(f"🚨 DANGEROUS: Detected sensitive keyword reference -> '{badword}'")
            vulnerability_found = True
    if vulnerability_found:
        print("❌ DEPLOYMENT BLOCKED: Secure your code before pushing to production.")
        sys.exit(1)
    else:
        print("✅ SAFE: No sensitive keywords detected. wohoo! Ready for deployment.")
        sys.exit(0)


# Trigger the updated function
if __name__ == "__main__":
    scan_file_safety("main.py")