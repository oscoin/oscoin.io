#!/usr/bin/env bash

set -euo pipefail

if [[ "$BRANCH_NAME" != "master" ]]; then
  echo "Skipping deployment of $BRANCH_NAME..."
  exit 0
fi

img="eu.gcr.io/$PROJECT_ID/oscoin-website-$1:$COMMIT_SHA"

gcloud compute instances create-with-container "oscoin-website-$1--vm" \
  --container-image "$img" \
  --description "Oscoin $1 website VM" \
  --machine-type "g1-small" || \

  gcloud compute instances update-container "oscoin-website-$1-vm" \
    --container-image "$img"
