#!/bin/bash
set -eux
# Taken from https://github.com/zhxiaogg/cargo-static-build

# hack, move home to $HOME(/github/home)
ln -s /root/.cargo $HOME/.cargo
ln -s /root/.rustup $HOME/.rustup

# go to the repo root
cd $GITHUB_WORKSPACE
PATH=/usr/local/bin:/root/.cargo/bin:/usr/local/cargo/bin/cargo:$PATH
whoami
printenv
find .
mkdir target
chmod 0777 ./target
export CARGO_TARGET_DIR=$GITHUB_WORKSPACE/target
which cargo || true
/usr/local/cargo/bin/cargo --help || true
eval "$*"
chmod 0777 ./target
