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

export https_proxy=http://192.168.0.120:7890 
export http_proxy=http://192.168.0.120:7890 
export all_proxy=socks5://192.168.0.120:7890

# 下载 meta.json
curl -L -o meta.json "https://github.com/$REPO/releases/download/mirror/meta.json" || echo '[]' > meta.json

# 获取 SHA512
SHA512=$(jq -r --arg image "$IMAGE_NAME" --arg version "$VERSION" --arg architecture "$ARCHITECTURE" \
'.[] | select(.image == $image and .version == $version and .architecture == $architecture) | .sha512' meta.json)

if [ -n "$SHA512" ]; then
    echo "Found cached image. Downloading ${SHA512}.tar..."
    gh release download --repo $REPO mirror -O ${SHA512}.tar -p ${SHA512}.tar --clobber || {
        echo "Failed to download ${SHA512}.tar, trying ${SHA512}.tar.xz..."
        gh release download --repo $REPO mirror -O ${SHA512}.tar.xz -p ${SHA512}.tar.xz --clobber
        
        # 解压 .tar.xz 文件
        echo "Extracting ${SHA512}.tar.xz..."
        tar -xJf "${SHA512}.tar.xz" -C . || {
            echo "Failed to extract ${SHA512}.tar.xz"
            exit 1
        }
        
        # 使用解压后的文件进行 docker load
        docker load -i "${SHA512}.tar"
        echo "Docker image $IMAGE_NAME loaded successfully from .tar.xz"
        exit 0
    }

    # 如果成功下载 .tar 文件
    docker load -i "${SHA512}.tar"
    echo "Docker image $IMAGE_NAME loaded successfully from .tar"
else
    echo "Image not found in cache. Triggering GitHub Actions workflow..."
    gh workflow run --repo $REPO "Docker Image Cache Update" --field image_name="$IMAGE_NAME" --field version="$VERSION" --field architecture="linux/amd64"
    echo '{"image_name":"'"$IMAGE_NAME"'", "version":"'"$VERSION"'", "architecture":"'"$ARCHITECTURE"'"}' | gh workflow run --repo $REPO mirror.yml --json
    gh run list --workflow=mirror.yml --repo $REPO
    echo "Waiting for the workflow to finish..."
    gh run watch --repo $REPO
    echo "Cache completed, run script again."
fi

docker images | grep $IMAGE_NAME

echo done.

set +exE
