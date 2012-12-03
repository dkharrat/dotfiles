
# Configuration
for file in ~/dotfiles/bash/*.rc; do
  source $file
done

[[ -f ~/.bashrc_custom ]] && source ~/.bashrc_custom

