#!/bin/bash

set -e

# Create .netrc file for SVN authentication
echo "machine $(echo $SVN_REPO_URL | awk -F/ '{print $3}') login $SVN_USERNAME password $SVN_PASSWORD" > ~/.netrc
chmod 600 ~/.netrc

# Clone the SVN repository
git svn clone $SVN_REPO_URL --stdlayout svn-repo
cd svn-repo

# Configure Git
git config --global user.name "$GIT_USERNAME"
git config --global user.email "$GIT_EMAIL"

# Add the remote repository
git remote add origin https://$GIT_USERNAME:$GIT_TOKEN@$(echo $GIT_REPO_URL | awk -F/ '{print $3}')/${GIT_REPO_URL##*/}

# Push the code to the remote repository
git push -u origin --all
git push -u origin --tags
