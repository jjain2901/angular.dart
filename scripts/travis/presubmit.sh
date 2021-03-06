#!/bin/bash
 
#  If we're on the presubmit branch, the stable Dart release, and all unit 
#  tests pass, merge the presubmit branch into master and push it. 
 
 
CHANNEL=`echo $JOB | cut -f 2 -d -`
SHA=`git rev-parse HEAD`
 
echo Current channel is: $CHANNEL
echo Current branch is: $TRAVIS_BRANCH
echo Test result is: $TRAVIS_TEST_RESULT
 
if [ "$CHANNEL" = "stable" ] && [ "$TRAVIS_REPO_SLUG" = "angular/angular.dart" ]; then
  if [ $TRAVIS_TEST_RESULT -eq 0 ] && [[ $TRAVIS_BRANCH == "presubmit-"* ]]; then
    git config credential.helper "store --file=.git/credentials"
    # travis encrypt GITHUB_TOKEN_ANGULAR_ORG=??? --repo=angular/angular.dart
    echo "https://${GITHUB_TOKEN_ANGULAR_ORG}:@github.com" > .git/credentials
    git config user.name "travis@travis-ci.org"

    echo "Pushing HEAD to master..."
    git remote add upstream https://github.com/angular/angular.dart.git
    git push upstream HEAD:master
  fi
fi
