#!/usr/bin/env bash

set -euo pipefail

img="eu.gcr.io/$PROJECT_ID/oscoin-website-$1"
branch_name_tag=$(echo "$BRANCH_NAME" | tr "/" "-")

docker build --label "version=$COMMIT_SHA" \
  --tag "$img:$branch_name_tag" \
  --tag "$img:$COMMIT_SHA" \
  --target "$1" .

if [[ $BRANCH_NAME == "master" ]]; then
  docker tag "$img:$BRANCH_NAME" "$img:latest"
fi

docker push "$img"
