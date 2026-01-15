#!/bin/bash

# Check for the presence of the required tools
if ! command -v curl &> /dev/null; then
    echo "Error: curl is not installed or not found in the PATH."
    exit 1
fi

if ! command -v jq &> /dev/null; then
    echo "Error: jq is not installed or not found in the PATH."
    echo "Please install jq (e.g., 'brew install jq' or 'apt install jq') to parse the JSON response."
    exit 1
fi

# Check if the COPILOT_API_KEY environment variable is set
if [ -z "$COPILOT_API_KEY" ]; then
    echo "Error: COPILOT_API_KEY environment variable is not set."
    echo "Please create a GitHub Personal Access Token (PAT) with 'repo' and 'read:org' scopes and set it as the COPILOT_API_KEY."
    echo "Example: export COPILOT_API_KEY=\"YOUR_PAT_HERE\""
    exit 1
fi

# Make the API request and parse the usage data
echo "Fetching GitHub Copilot personal quota usage..."

API_URL="https://api.github.com/copilot_internal/user"
CURL_RESULT=$(curl -s -H "Authorization: Bearer $COPILOT_API_KEY" -H "Accept: application/vnd.github.v3+json" "$API_URL")

# Check if the request was successful
if [ $? -ne 0 ]; then
    echo "Error: Failed to fetch data from the GitHub API. Please check your token and network connection."
    exit 1
fi

# Check for a 404 error specifically
if echo "$CURL_RESULT" | jq -e '.message' | grep -q "Not Found"; then
    echo "Error: 404 Not Found. Please check the API URL or your access permissions."
    exit 1
fi

# Extract usage data
USAGE_DATA=$(echo "$CURL_RESULT" | jq '.quota_snapshots.premium_interactions')

if [ "$USAGE_DATA" = "null" ]; then
    echo "Error: Could not retrieve quota data. The PAT might be invalid or missing the correct permissions."
    exit 1
fi

echo "Copilot Quota Information:"

# Use jq to extract specific information
TOTAL=$(echo "$USAGE_DATA" | jq '.total // 0')
USED=$(echo "$USAGE_DATA" | jq '.used // 0')
REMAINING=$(echo "$USAGE_DATA" | jq '.remaining // 0')
RESET_DATE=$(echo "$USAGE_DATA" | jq -r '.next_reset_at // "N/A"')

echo "* Total requests allowed: $TOTAL"
echo "* Requests used this cycle: $USED"
echo "* Requests remaining: $REMAINING"
echo "* Quota reset date: $RESET_DATE"
