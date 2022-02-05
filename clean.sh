#!/bin/bash

if [ -d "stash" ]; then
  rm -rf stash
fi

if [ -d "merge" ]; then
  rm -rf merge
fi

if [ -d "rebase-interactif" ]; then
  rm -rf rebase-interactif
fi
