#!/bin/bash

if [ -z "$NVM_DIR" ]; then
    echo "Error: NVM_DIR environment variable is not set" >&2
    exit 1
fi
if [ -z "$NODE_VERSION" ]; then
    echo "Error: NODE_VERSION environment variable is not set" >&2
    exit 1
fi

for i in {1..20}; do
    apt-get update && apt-get install -y curl gpg-agent && break
    echo "apt-get failed, retrying... ($i/20)"
    sleep 30
done

mkdir -p $NVM_DIR
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
source $NVM_DIR/nvm.sh
nvm install $NODE_VERSION
nvm alias default $NODE_VERSION

for i in {1..20}; do
    apt-get install -y unzip p7zip-full libgtk-3-0 --no-install-recommends && npm install -g nodemon && break
    echo "apt-get failed, retrying... ($i/20)"
    sleep 30
done

npm install --production

curl -o- https://github.com/uav4geo/NodeThermalTools/releases/download/v0.0.1/Thermal_Tools.AppImage


cd $(dirname "$0")

TT_BIN="bin/Thermal_Tools.AppImage"
curl -L -o $TT_BIN https://github.com/uav4geo/NodeThermalTools/releases/download/v0.0.1/Thermal_Tools.AppImage
chmod +x $TT_BIN
$TT_BIN --appimage-extract
mv squashfs-root/{.,}* bin
rm $TT_BIN
mv AppRun Thermal_Tools.AppImage