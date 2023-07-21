#!/bin/bash

# Clean up the "public" folder
echo "===Cleaning up the public folder"
rm -rf docs/*
sleep 1s

# Run `hugo`
echo "===Running hugo"
hugo
sleep 1s

# Add all changes with `git add -A`
echo "===Adding changes with git add"
git add -A
sleep 1s

# Commit changes with `git commit -m "update"`
echo "===Committing changes with git commit"
git commit -m "update"
sleep 1s

# Push changes with `git push`
echo "===Pushing changes with git push"
git push