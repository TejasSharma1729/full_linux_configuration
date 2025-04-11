# COMPLETE SETUP OF DOCKER ENVIRONMENT
FROM ubuntu:24.04

ENV TZ=Asia/Kolkata
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get full-upgrade -y 

RUN apt-get install sudo software-properties-common build-essential clang lldb lld libc++-dev g++-14 zsh nodejs git curl wget bzip2 gdb pip neovim ranger make cmake pkg-config python-is-python3 tmux libboost-all-dev libyaml-cpp-dev libeigen3-dev nsolid -y
RUN update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-14 100
RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-14 100
RUN update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 100
RUN update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 100
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -

COPY .bashrc /root/.bashrc
# COPY .vimrc /root/.vimrc
COPY .pythonrc /root/.pythonrc
COPY .pythonstartup /root/.pythonstartup
COPY starship.toml /root/.config/starship.toml

RUN python3 -m pip install --upgrade --break-system-packages numpy matplotlib scipy pandas arrow pyarrow pillow chrono ipython jedi neovim argparse termcolor setuptools pkgconfig torch torchvision torchaudio mlxtend scikit-learn scikit-image sympy pybind11
RUN curl -fsSL https://starship.rs/install.sh | sh -s -- -y
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-aarch64.sh -O miniconda.sh
# Change the above line to -x86_64.sh if you are not on a MacBook.
RUN bash miniconda.sh -b -p /root/miniconda -f
RUN /root/miniconda/bin/conda init --all
RUN echo "eval \"\$(starship init bash)\"" >> /root/.bashrc
RUN rm miniconda.sh
RUN /root/miniconda/bin/pip install IPython neovim

# RUN git clone https://github.com/VundleVim/Vundle.vim.git /root/.vim/bundle/Vundle.vim
RUN bash -c "$(curl -fsSL https://gef.blah.cat/sh)"
RUN mkdir -p /root/.config/nvim
COPY init.lua /root/.config/nvim/init.lua
RUN nvim --headless -c "Lazy sync" -c "qall"
# RUN nvim +PluginInstall +qall

CMD ["/bin/bash"]
