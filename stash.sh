#!/bin/bash

if [ -d "stash" ]; then
  rm -rf stash
fi

mkdir stash

cd stash
git init > /dev/null

echo "Hello World" > README.md
git add README.md
git commit -m "Initial commit" > /dev/null

echo "# Git Stash" > README.md

echo "Faites les commandes suivantes:"
echo "git status"
read -p "Press key to continue.. " -n1 -s

echo "git stash"
echo "git status"
read -p "Press key to continue.. " -n1 -s

echo "git stash list"
echo "git stash show"
echo "git stash pop"