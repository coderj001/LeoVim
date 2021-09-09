FROM ubuntu:latest

RUN yes | unminimize

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
  ninja-build gettext libtool libtool-bin autoconf automake cmake g++ \
  pkg-config unzip git python3 python3-dev

RUN apt-get install -y python3-pip lua5.3 nodejs npm luarocks
RUN pip3 install pynvim
RUN npm i -g tree-sitter-cli --unsafe-perm=true --allow-root

RUN echo 'export PATH=$HOME/local/nvim/bin:$PATH' >> ~/.bashrc
RUN echo 'nvim --version' >> ~/.bashrc
RUN echo 'luarocks --version' >> ~/.bashrc
RUN echo 'python -V' >> ~/.bashrc
RUN echo 'lua -v' >> ~/.bashrc

RUN git clone --single-branch \
  https://github.com/neovim/neovim ~/neovim \
  && cd ~/neovim \
  && make CMAKE_BUILD_TYPE=Release \
  && make CMAKE_INSTALL_PREFIX=$HOME/local/nvim install

RUN git clone https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

ENV $CONFIG_PATH=$HOME/.config/nvim/
RUN mkdir -p ${$CONFIG_PATH}

RUN apt-get install -y \
    ripgrep ctags fzf

RUN npm i -g neovim

USER LeoVim

WORKDIR ${$CONFIG_PATH}
ENTRYPOINT /bin/bash
