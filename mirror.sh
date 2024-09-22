#!/bin/bash
# /* Copyright (c) 2024 fei_cong(https://github.com/feicong/ebpf-course) */

if [ "$(id -u)" -eq 0 ]; then 
    echo "Please run script as normal user, not root user."
    exit 1
fi

REPO="feicong/ebpf-course"
TAG="mirror"

if [ -z "$3" ]; then
    echo "usage: ./mirror.sh fsx199/strongdroid 12-arm64 linux/arm64"
    exit 1
fi

set -exE
trap 'echo Error: in $0 on line $LINENO' ERR


IMAGE_NAME="$1"
VERSION="$2"
ARCHITECTURE="$3"

export https_proxy=http://192.168.0.120:7890
export http_proxy=http://192.168.0.120:7890
export all_proxy=socks5://192.168.0.120:7890

curl -L -o meta.json "https://github.com/$REPO/releases/download/${TAG}/meta.json" || echo '[]' > meta.json

SHA512=$(jq -r --arg image "$IMAGE_NAME" --arg version "$VERSION" --arg architecture "$ARCHITECTURE" \
'.[] | select(.image == $image and .version == $version and .architecture == $architecture) | .sha512' meta.json)

if [ -n "$SHA512" ]; then
    if [ -f "${SHA512}.tar" ]; then
        echo "Found cached image ${SHA512}.tar"
    else
        if [ ! -f "${SHA512}.tar.xz" ]; then
            curl -L -o "${SHA512}.tar.xz" "https://github.com/${REPO}/releases/download/${TAG}/${SHA512}.tar.xz" || {
                echo "Failed to download ${SHA512}.tar.xz"
                exit 1
            }
        fi

        echo "Extracting ${SHA512}.tar.xz..."
        tar -xJf "${SHA512}.tar.xz" -C . || {
            echo "Failed to extract ${SHA512}.tar.xz"
            exit 1
        }
    fi
    
    docker load -i "${SHA512}.tar"
    echo "Docker image $IMAGE_NAME loaded successfully from ${SHA512}.tar"
else
    echo "Image not found in cache. Triggering GitHub Actions workflow..."
    if [ -n "$GITHUB_TOKEN" ]; then
        echo "login to github..."
        echo "$GITHUB_TOKEN" | gh auth login --with-token
    else
        gh auth login
    fi

    echo '{"image_name":"'"$IMAGE_NAME"'", "version":"'"$VERSION"'", "architecture":"'"$ARCHITECTURE"'"}' | gh workflow run --repo $REPO mirror.yml --json
    gh run list --workflow=mirror.yml --repo $REPO
    echo "Waiting for the workflow to finish..."
    gh run watch --repo $REPO
    echo "Cache completed, run script again."
fi

docker images | grep $IMAGE_NAME
docker rmi $(docker images -f "dangling=true" -q) 2>/dev/null || true
docker images | grep $IMAGE_NAME

echo done.

set +exE
