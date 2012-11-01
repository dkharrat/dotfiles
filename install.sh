#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="bash_profile bashrc vimrc vim dircolors gitconfig"    # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir

echo "Moving any existing dotfiles from ~ to $olddir, and placing new ones in their place..."
for file in $files; do
  echo "  $file"
  [[ -e ~/.$file ]] && mv ~/.$file ~/dotfiles_old/
  ln -s $dir/$file ~/.$file
done
