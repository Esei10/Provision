#!/bin/bash
git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
#https://github.com/ohmyzsh/ohmyzsh?tab=readme-ov-file#manual-installation
#so that ohmyzsh vars exist
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
