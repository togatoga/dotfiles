#!/bin/bash

pushd /tmp
wget "https://github.com/peco/peco/releases/download/v0.5.2/peco_linux_386.tar.gz"

# 解凍
tar xzvf peco_linux_386.tar.gz

# 移動
cd peco_linux_386

# 実行権限を付与
sudo chmod +x peco

# pecoを配置
sudo cp peco /usr/local/bin

# 実行できるかを確認
peco --version

popd
