#! /bin/bash

DEBIAN_FRONTEND=noninteractive

# Clone Upstream
git clone --recurse-submodules https://github.com/JakeStanger/ironbar.git
cd ironbar
git checkout v0.12.1
cp -rvf ../debian ./
cp -vf ../Makefile ./Makefile

# Get build deps
apt-get build-dep ./ -y

# Build package
dpkg-buildpackage --no-sign

# Move the debs to output
cd ../
mkdir -p ./output
mv ./*.deb ./output/
