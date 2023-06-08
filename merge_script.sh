#!/bin/bash

# Clone the repository
git clone https://github.com/sharan-vayakkady/conflict.git
cd conflict

# Checkout the target branch
git checkout  main
# Merge the source branch into the target branch
git merge staging

# Check for conflicts
if [[ -n $(git ls-files -u) ]]; then
  # Send Slack notification for merge conflict
  curl -X POST -H 'Content-type: application/json' --data '{"text":"Merge conflict occurred in the repository: conflict"}' https://hooks.slack.com/services/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
  
  # Exit with an error status
  exit 1
fi

# Push the changes to the remote repository
git push origin main
