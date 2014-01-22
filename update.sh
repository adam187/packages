#!/bin/sh

satis build
git add .
git commit -m "update"
git push
