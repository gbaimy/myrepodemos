#!/bin/bash

# Define the commit message
COMMIT_MESSAGE="Commit to all"

# Get the list of all branches
branches=$(git branch -r | grep -v '\->' | sed 's/origin\///')

# Loop through each branch
for branch in $branches; do
    echo "Processing branch: $branch"
    
    # Checkout the branch
    git checkout $branch
    
    # Pull the latest changes
    git pull origin $branch
    
    # Add your files (specify the files or use . for all changes)
    git add .
    
    # Commit the changes
    git commit -m "$COMMIT_MESSAGE"
    
    # Push the changes to the remote repository
    git push origin $branch
done

# Return to the main branch (replace 'main' with your default branch if different)
git checkout main

