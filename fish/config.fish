# Change Fisher directory
set -g fisher_path ~/.local/share/fish/fisher
set fish_function_path $fish_function_path[1] $fisher_path/functions $fish_function_path[2..-1]
set fish_complete_path $fish_complete_path[1] $fisher_path/completions $fish_complete_path[2..-1]
for file in $fisher_path/conf.d/*.fish
    builtin source $file 2> /dev/null
end

# Load dependency file
set -l dependency_file "$HOME/dotfiles/environments/"(hostname)".fish"
if [ -e "$dependency_file" ]
  source $dependency_file
else
  set_color -ro -b white red
  echo "Dependency file for "(hostname)" was not found!"
end

if [ -e "$HOME/.dir_colors" ]
  eval (dircolors -c $HOME/.dir_colors)
end
