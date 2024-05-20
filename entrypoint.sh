#!/bin/bash

set -e

git svn clone $SVN_REPO_URL --stdlayout --username $SVN_USERNAME --password $SVN_PASSWORD svn-repo
cd svn-repo
git config --global user.name "$GIT_USERNAME"
git config --global user.email "$GIT_EMAIL"
git remote add origin https://$GIT_USERNAME:$GIT_TOKEN@$GIT_REPO_URL
git push -u origin --all
git push -u origin --tags
