# Introduction

This repository is for storing all the necessary instructions and scripts for neovim and coding in general for *NIX systems 
(MacOS, Ubuntu, RaspberryOS, etc).
For setup there is a bash script that tries to automate most of the installing and versioning parts, but it may not work
properly, so there is also a  step-by-step setup.

# General Setup 

## Script
To download and run the setup script you can just run the following command:
```bash
curl https://github.com/Pedro4064/nvim_dotfiles/blob/master/setup.sh -o - | sh
```

## Manual
To manually install everything needed you will need:

- [NodeJS](https://www.educative.io/answers/how-to-install-nodejs-on-ubuntu) - For Coc on Neovim, and it needs to be version 14.x or greater.
- Neovim - To install neovim on most systems using `apt install neovim` pr using `brew install neovim` is enough,
but on raspberrypi using the above method will download and outdated version, so you need to install through the [snap stor](https://snapcraft.io/install/nvim/raspbian).
- Git - To install git just follow any online tutorial.
- Rust - To install rust just follow the [official setup guide](https://www.rust-lang.org/tools/install)

# NeoVim Setup
Most of the configuration is handled by the [*Plugin*](https://github.com/junegunn/vim-plug) plugins manager, but some parts of it need to setup manually inside of NeoVim (e.g on Rust).

## Plugins
After cloning the repository to `~/.config/nvim/` you just need to open nvim and type:

```bash
:PlugInstall
```

and it will download all the necessary plugins on the init.vim

## Rust Programming
To setup `rust-analyzer` as the COC server for rust programming you need to, inside neovim, type:
```bash
:CocInstall coc-rust-analyzer
```

