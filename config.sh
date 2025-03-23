#!/usr/bin/env bash
if sudo true; then true; else apt update && apt install sudo -y; fi
sudo bash -c "apt-get install software-properties-common build-essential clang lldb lld libc++-dev g++-14 zsh nodejs git curl wget gdb pip neovim ranger make cmake pkg-config python-is-python3 tmux libboost-all-dev libyaml-cpp-dev libeigen3-dev -y && apt-get update && apt-get dist-upgrade -y && update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 100 && update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 100 && update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-14 100 && update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-14 100"
python3 -m pip install --upgrade --break-system-packages numpy matplotlib scipy pandas arrow pyarrow pillow chrono ipython jedi neovim argparse termcolor setuptools pkgconfig torch torchvision torchaudio mlxtend scikit-learn scikit-image sympy pybind11
git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/Vundle.vim
bash -c "$(curl -fsSL https://gef.blah.cat/sh)" # for gdb-gef
mkdir -p ~/.config/nvim && printf "source ~/.vimrc\n" > ~/.config/nvim/init.vim
curl -sS https://starship.rs/install.sh | sh
cp .bashrc ~/
cp .vimrc ~/
cp .pythonstartup ~/
cp .pythonrc ~/
cp starship.toml ~/.config/
nvim +PluginInstall -c qall
git clone https://github.com/foundryzero/llef.git && llef/install.sh # for lldb-llef
mkdir -p ~/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-s390x.sh -O ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm ~/miniconda3/miniconda.sh
source ~/miniconda3/bin/activate
conda init --all
echo "eval \"\$(starship init bash)\"" >> ~/.bashrc
