#!/bin/bash

MESSAGE=$1
# public upload
hugo -t .
cd public
git add .
git commit -m "$MESSAGE"
git push

# blog upload
cd ..
git add .
git commit -m "$MESSAGE"ㅍㅍ
git push
