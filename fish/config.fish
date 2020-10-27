# Change Fisher directory
set -g fisher_path ~/.local/share/fish/fisher
set fish_function_path $fish_function_path[1] $fisher_path/functions $fish_function_path[2..-1]
set fish_complete_path $fish_complete_path[1] $fisher_path/completions $fish_complete_path[2..-1]

set FISH_PLATFORM (uname)
# Neovim のクソ野郎 $COLORTERM を握り潰しやがった
set fish_term24bit 1
# set -U FZF_LEGACY_KEYBINDINGS 0

# Load dependency file
set -l dependency_file "$HOME/dotfiles/environments/"(hostname)".fish"
if [ -e "$dependency_file" ]
  source $dependency_file
else
  set_color -ro -b white red
  echo "Dependency file for "(hostname)" was not found!"
end

# Change dircolors
if [ -e "$HOME/.dir_colors" ]
  switch $FISH_PLATFORM
    case Linux
      eval (dircolors -c $HOME/.dir_colors)
    case Darwin
      eval (gdircolors -c $HOME/.dir_colors)
  end
end

# Load plugins
for file in $fisher_path/conf.d/*.fish
    builtin source $file 2> /dev/null
end
