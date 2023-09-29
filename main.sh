#! /bin/bash

DEBIAN_FRONTEND=noninteractive

# Clone Upstream
git clone --recurse-submodules https://github.com/JakeStanger/ironbar.git -b v0.13.0
cp -rvf ./debian ./ironbar/
cp -vf ./Makefile ./ironbar/
cd ./ironbar

# Get build deps
apt-get build-dep ./ -y

# Build package
dpkg-buildpackage --no-sign

# Move the debs to output
cd ../
mkdir -p ./output
mv ./*.deb ./output/
