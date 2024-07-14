#!/bin/bash

MESSAGE=$1

hugo -t loveit

cd public

git add .

git commit -m "$MESSAGE"

git push

cd ..

git add .

git commit -m "$MESSAGE"

git push
