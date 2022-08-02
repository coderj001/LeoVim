.DEFAULT_GOAL := build
APPLICATION = leovim

build:
	 docker build -t coderj001/leovim -f Dockerfile .

run:
	docker run -it --rm -v $(pwd):/root/.config/nvim coderj001/leovim
