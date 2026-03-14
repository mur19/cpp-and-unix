#!/bin/bash
CURRENT_BRANCH=$(git branch --show-current)
echo "Current branch: $CURRENT_BRANCH"
echo "Switching to prd..."
git checkout prd || exit 1
echo "Pulling latest prd..."
git pull origin prd || exit 1
echo "Merging stg into prd..."
git merge stg --no-ff -m "Merge stg into prd" || exit 1
TAG="prd-$(date +%Y-%m-%d-%H%M%S)"
echo "Creating tag: $TAG"
git tag -a "$TAG" -m "Release to PRD on $(date)"
echo "Pushing prd and tags..."
git push origin prd --tags || exit 1
echo "Returning to $CURRENT_BRANCH..."
git checkout "$CURRENT_BRANCH" || exit 1
echo "Done! Tag: $TAG"
