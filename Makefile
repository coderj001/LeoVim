.DEFAULT_GOAL := build
APPLICATION = leovim

build:
	 docker build -t coderj001/leovim -f Dockerfile --build-arg neovim_version=release-0.7 .

run:
	docker run -it --rm -v $(dir $(realpath $(lastword $(MAKEFILE_LIST)))):/root/.config/nvim/ coderj001/leovim
