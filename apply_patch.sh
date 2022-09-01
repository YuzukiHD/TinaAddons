#!/bin/bash

export SOURCE_PATH=$(pwd)

echo -e "\n**********************************\nPrepare Environment... **!!!ROOT Require!!!**\n**********************************\n"
sudo apt-get install build-essential subversion git libncurses5-dev zlib1g-dev gawk flex quilt libssl-dev xsltproc libxml-parser-perl mercurial bzr ecj cvs unzip lib32z1 lib32z1-dev lib32stdc++6 libstdc++6 libc6:i386 libstdc++6:i386 lib32ncurses5 lib32z1 -y

echo -e "\n**********************************\nApply T113 Patch...\n***********************************\n"
rm -rf .gitignore
git apply 0001-add-t113-platform-to-d1-h-sdk.patch

echo -e "\n**********************************\nFix Patch Error...\n**********************************\n"
rm -rf $SOURCE_PATH/lichee/brandy-2.0/spl/include/openssl/assert.h
echo -e "// Copyright 2010 Google Inc. All Rights Reserved." > $SOURCE_PATH/lichee/brandy-2.0/spl/include/openssl/assert.h

echo -e "\n**********************************\nAdd Toolchains...\n**********************************\n"
tar xf t113-toolchains.tar.gz

echo -e "\n**********************************\nStart Tina Linux\n**********************************\n"
source build/envsetup.sh 
lunch