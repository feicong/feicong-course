#!/bin/bash
# /* Copyright (c) 2024 fei_cong(https://github.com/feicong/ebpf-course) */

set -exE
trap 'echo Error: in $0 on line $LINENO' ERR

if [ "$(id -u)" -eq 0 ]; then 
    echo "Please run script as normal user, not root user."
    exit 1
fi

REPO="feicong/ebpf-course"
IMAGE_NAME="alpine"
VERSION="latest"
ARCHITECTURE="linux/arm64"

export https_proxy=http://192.168.0.120:7890 http_proxy=http://192.168.0.120:7890 all_proxy=socks5://192.168.0.120:7890

curl -L -o meta.json "https://github.com/$REPO/releases/download/mirror/meta.json" || echo '[]' > meta.json

SHA512=$(jq -r --arg image "$IMAGE_NAME" --arg version "$VERSION"  --arg architecture "$ARCHITECTURE" \
'.[] | select(.image == $image and .version == $version and .architecture == $architecture) | .sha512' meta.json)

if [ -n "$SHA512" ]; then
    echo "Found cached image. Downloading ${SHA512}.tar..."
    curl -L -o "${IMAGE_NAME}.tar" "https://github.com/$REPO/releases/latest/download/${SHA512}.tar"
    gh release download --repo $REPO mirror -O ${SHA512}.tar -p ${SHA512}.tar --clobber
    docker load -i "${SHA512}.tar"
    echo "Docker image $IMAGE_NAME loaded successfully."
else
    echo "Image not found in cache. Triggering GitHub Actions workflow..."
    gh workflow run --repo $REPO "Docker Image Cache Update" --field image_name="$IMAGE_NAME" --field version="$VERSION" --field architecture="linux/amd64"
    echo '{"image_name":"$IMAGE_NAME", "version":"$VERSION", "architecture":"$ARCHITECTURE"}' | gh workflow run --repo $REPO mirror.yml --json
    gh run list --workflow=mirror.yml --repo $REPO

    echo "Waiting for the workflow to finish..."
    gh run watch --repo $REPO
    echo "Cache completed, run script again."
fi

docker images | grep $IMAGE_NAME
echo done.

set +exE
