#!/bin/bash

cp vim-setup/.vimrc ~/.vimrc 

# Install Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Install Pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Install Tagbar/Taglist
pushd ~/.vim/bundle
git clone git://github.com/majutsushi/tagbar
git clone https://github.com/vim-scripts/taglist.vim.git
popd 

# Install ctrlp
pushd ~/.vim
git clone https://github.com/ctrlpvim/ctrlp.vim.git bundle/ctrlp.vim
popd 

# Add vividchalk color scheme
git clone https://github.com/tpope/vim-vividchalk.git 
cp -r vim-vividchalk/colors ~/.vim/
