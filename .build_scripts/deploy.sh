#!/usr/bin/env bash
set -e # halt script on error

echo "Get ready, we're pushing to gh-pages!"
rm -rf site
mkdir site
cp -a dist site
cp -a img fonts index.html style-rtl.css locale.js oauth.json CNAME translations site

git config --global user.email "longliangyou@gmail.com"
git config --global user.name "CircleCI"

MESSAGE="CircleCI[$CIRCLE_BUILD_NUM]:$CIRCLE_SHA1@$CIRCLE_BRANCH[ci skip]"
COMMIT_MESSAGE="$MESSAGE" npm run deploy
