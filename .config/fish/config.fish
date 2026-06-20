set -U fish_greeting ""

fish_add_path ~/.local/bin

set -x EDITOR helix

set -x FZF_DEFAULT_OPTS '--height 40% --layout=reverse --border'
set -x FZF_CTRL_T_OPTS '--preview "bat --color=always --style=numbers --line-range=:500 {}" --preview-window right:60%:wrap'
set -x FZF_ALT_C_OPTS '--preview "eza -la --color=always --icons --group-directories-first {}" --preview-window right:60%'
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

# install eza bat zoxide dust fd ripgrep ouch btop/htop helix fzf p7zip
command -q eza; and alias ls='eza --icons --group-directories-first'
command -q eza; and alias ll='eza --icons -la --git --group-directories-first'
command -q eza; and alias tree='eza --icons --tree --group-directories-first'
command -q bat; and alias cat='bat --paging=never'
command -q fd; and alias find='fd --hidden'
command -q rg; and alias grep='rg'
command -q dust; and alias du='dust'

abbr -a y yazi
# abbr -a f 'fastfetch -c ~/.config/fastfetch/configmin.jsonc'
# abbr -a ff 'fastfetch -c ~/.config/fastfetch/config.jsonc'
abbr -a fucking sudo
abbr -a hx helix

alias f='fastfetch -c ~/.config/fastfetch/configmin.jsonc'
alias ff='fastfetch -c ~/.config/fastfetch/config.jsonc'

alias dot='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

command -q starship; and starship init fish | source
command -q zoxide; and zoxide init fish --cmd cd | source
command -q fzf; and fzf --fish | source
