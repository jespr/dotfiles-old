#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dotfiles_dir=~/dotfiles                    # dotfiles directory
dotfiles_backup_dir=~/dotfiles_old             # old dotfiles backup directory
files="gitconfig gitignore oh-my-zsh vim vimrc zshrc"    # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo "Creating $dotfiles_backup_dir for backup of any existing dotfiles in ~"
mkdir -p $dotfiles_backup_dir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dotfiles_dir directory"
cd $dotfiles_dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
  echo "Moving any existing dotfiles from ~ to $dotfiles_backup_dir"
  mv ~/.$file ~/dotfiles_old/
  echo "Creating symlink to $file in home directory."
  ln -s $dotfiles_dir/$file ~/.$file
done
