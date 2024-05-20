#!/bin/bash

set -e

# Clone the SVN repository
git svn clone $SVN_REPO_URL --stdlayout --username $SVN_USERNAME --password $SVN_PASSWORD svn-repo
cd svn-repo

# Configure Git
git config --global user.name "$GIT_USERNAME"
git config --global user.email "$GIT_EMAIL"

# Add the remote repository
git remote add origin https://$GIT_USERNAME:$GIT_TOKEN@$GIT_REPO_URL

# Push the code to the remote repository
git push -u origin --all
git push -u origin --tags
