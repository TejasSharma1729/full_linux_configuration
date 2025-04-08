#!/usr/bin/env bash
sudo bash sudo_config.sh
python3 -m pip install --upgrade --break-system-packages numpy matplotlib scipy pandas arrow pyarrow pillow chrono ipython jedi neovim argparse termcolor setuptools pkgconfig torch torchvision torchaudio mlxtend scikit-learn scikit-image sympy pybind11
git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/Vundle.vim
bash -c "$(curl -fsSL https://gef.blah.cat/sh)" # for gdb-gef
mkdir -p ~/.config/nvim && printf "source ~/.vimrc\n" > ~/.config/nvim/init.vim
cp .bashrc ~/
cp .vimrc ~/
cp .pythonstartup ~/
cp .pythonrc ~/
cp starship.toml ~/.config/
nvim +PluginInstall -c qall
# git clone https://github.com/foundryzero/llef.git && llef/install.sh # for lldb-llef
mkdir -p ~/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-aarch64.sh -O ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm ~/miniconda3/miniconda.sh
source ~/miniconda3/bin/activate
conda init --all
~/miniconda/bin/pip install IPython neovim
echo "export CONDA_CHANGEPS1=false" >> ~/.bashrc
echo "eval \"\$(starship init bash)\"" >> ~/.bashrc
