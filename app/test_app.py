import requests
import sys

def test_live_api():
    print("🔍 Running live API test...")
    url = "http://host.docker.internal:8000/register"
    try:
        response = requests.get(url)

        print(f"📡 Server responded with Status Code: {response.status_code}")

        if response.status_code != 200:
            print("❌ TEST FAILED: Live server returned an unhealthy response code!")
            sys.exit(1)
        # 2. Extract the actual JSON data sent back by your main.py file
        data = response.json()
        print(f"📦 Payload Received: {data}")
        # Check for that typo we talked about!
        if "status" in data:
            print("✅ TEST PASSED: Core status key structure is valid.")
            sys.exit(0)
        else:
            print("❌ TEST FAILED: Response structure is malformed!")
            sys.exit(1)
    except requests.exceptions.ConnectionError:
        print("❌ CRITICAL FAILURE: Could not connect to the server!")
        print("💡 Is your Uvicorn server running in your other terminal tab?")
        sys.exit(1)
    
if __name__ == "__main__":
    test_live_api()