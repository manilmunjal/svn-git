#!/bin/bash

set -e

# Ensure the SVN_USERNAME and SVN_PASSWORD environment variables are set
if [ -z "$SVN_USERNAME" ] || [ -z "$SVN_PASSWORD" ]; then
  echo "SVN_USERNAME and SVN_PASSWORD environment variables must be set."
  exit 1
fi

# Create .netrc file for SVN authentication
echo "machine $(echo $SVN_REPO_URL | awk -F/ '{print $3}') login $SVN_USERNAME password $SVN_PASSWORD" > ~/.netrc
chmod 600 ~/.netrc

# Clone the SVN repository
git svn clone --username "$SVN_USERNAME" "$SVN_REPO_URL" --stdlayout svn-repo
cd svn-repo

# Configure Git
git config --global user.name "$GIT_USERNAME"
git config --global user.email "$GIT_EMAIL"

# Add the remote repository
git remote add origin "https://$GIT_USERNAME:$GIT_TOKEN@$(echo $GIT_REPO_URL | awk -F/ '{print $3}')/${GIT_REPO_URL##*/}"

# Push the code to the remote repository
git push -u origin --all
git push -u origin --tags
