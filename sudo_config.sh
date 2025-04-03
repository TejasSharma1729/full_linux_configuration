#!/usr/bin/env bash
apt-get update
apt-get dist-upgrade -y
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
apt-get install -y build-essential clang lldb lld libc++-dev g++-14 zsh nodejs git curl wget bzip2 gdb pip neovim ranger make cmake pkg-config python-is-python3 tmux libboost-all-dev libyaml-cpp-dev libeigen3-dev
update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 100
update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 100
update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-14 100
update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-14 100
curl -sS https://starship.rs/install.sh | sh -s -- -y
