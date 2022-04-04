#!/bin/sh

mkdir $HOME/Downloads/macOS-init
cd $HOME/Downloads/macOS-init
curl -sL https://github.com/juliennicouleaud/macOS-init/archive/master.zip -o master.zip
unzip -qj master.zip
rm master.zip run.sh
chmod +x post-install.sh
./post-install.sh