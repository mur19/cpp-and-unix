#!/bin/bash
CURRENT_BRANCH=$(git branch --show-current)
echo "Current branch: $CURRENT_BRANCH"
echo "Switching to stg..."
git checkout stg || exit 1
echo "Pulling latest stg..."
git pull origin stg || exit 1
echo "Merging dev into stg..."
git merge dev --no-ff -m "Merge dev into stg" || exit 1
TAG="stg-$(date +%Y-%m-%d-%H%M%S)"
echo "Creating tag: $TAG"
git tag -a "$TAG" -m "Release to STG on $(date)"
echo "Pushing stg and tags..."
git push origin stg --tags || exit 1
echo "Returning to $CURRENT_BRANCH..."
git checkout "$CURRENT_BRANCH" || exit 1
echo "Done! Tag: $TAG"
