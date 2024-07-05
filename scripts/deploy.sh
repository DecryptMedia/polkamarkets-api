#!/usr/bin/env bash

image_version=$(git rev-parse --short HEAD)
image_tag="dastan.azurecr.io/dastan/polkamarkets-api:$image_version"

# Build only if the image does not exist
if [ -z "$(docker manifest inspect $image_tag)" ]; then
  docker buildx build --platform linux/amd64 -t $image_tag \
    --push .
fi

helm upgrade --install --values=chart/values.yaml \
  --set apiImage=$image_tag \
  polkamarkets-api ./chart