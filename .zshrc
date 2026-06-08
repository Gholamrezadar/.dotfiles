# Powerlevel10k setup
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p11k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_CUSTOM=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Plugins
plugins=(
  git 
  zsh-autosuggestions 
  zsh-syntax-highlighting 
  z 
  sudo 
  copypath
  dirhistory 
  history
  colorize
  colored-man-pages
  jsontools  
)

source $ZSH/oh-my-zsh.sh

export XDG_CONFIG_HOME="$HOME/.config"
export TERM=xterm-256color

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# aliases

## Configs quick edit
EDITOR="nvim"
alias zshconfig="$EDITOR ~/.zshrc"
alias ohmyzsh="$EDITOR ~/.oh-my-zsh"
alias nvimconfig="cd ~/.dotfiles/.config/nvim/lua/user/ && $EDITOR ."
alias vimconfig="$EDITOR ~/.config/nvim/vimrc.vim"
alias alacconfig="$EDITOR ~/.config/alacritty/alacritty.yml"
alias tmuxconfig="$EDITOR ~/.tmux.conf.local"
alias dotf="cd ~/.dotfiles/"

## Shorthand for commands
alias cls="clear"
alias nv="nvim"
alias py="python"
alias ipy="ipython"
alias bat="batcat"

## Diagnostic shortcuts
alias pingv="ping varzesh3.com"
alias pingg="ping google.com"
alias dns="resolvectl status | bat -l py"
alias gw="ip route | bat -l py"
alias addgw="sudo route add default gw 192.168.1.1"
alias speed="curl https://www.python.org/ftp/python/3.12.3/python-3.12.3-amd64.exe --output /tmp/tempfileforspeed"
alias ram="free -h --si"
alias myip="hostname -I"
alias port="sudo ss -tulnp"
alias ports="sudo lsof -i -P -n"

# Python commands
alias ipy="python3 -m IPython"
alias python="python3"
alias py="python3"
alias pip="pip3"

## Git commands
alias gs="git status"
alias gad="git add ."
alias gp="git push"
alias gcm="git commit -m"

## Tools/Custom commands
alias sd="cd \$(find . -type d | fzf)" # fuzzy finder select directory bah bah
alias sf="$EDITOR \$(find . -type f | fzf)" # fuzzy finder select directory bah bah
# alias sd="cd ~ && cd \$(find . -type d | fzf)" # fuzzy finder select directory bah bah

## Docker aliases
function getwd() {
  echo $(pwd)
}

#alias docker-jupyter-scipy="docker run -it --rm --user root -e GRANT_SUDO=yes -e CHOWN_EXTRA="/home/jovyan/work" -e CHOWN_EXTRA_OPTS="-R" -p 8889:8888 -v "$(getwd)":/home/jovyan/work jupyter/scipy-notebook:latest"

# ---- Proxy functions ----
set_proxy() {
    export http_proxy="http://127.0.0.1:10808"
    export https_proxy="http://127.0.0.1:10808"
    export ftp_proxy="http://127.0.0.1:10808"
    export all_proxy="http://127.0.0.1:10808"
    echo "Proxy set to http://127.0.0.1:10808"
}

unset_proxy() {
    unset http_proxy
    unset https_proxy
    unset ftp_proxy
    unset all_proxy
    echo "Proxy unset"
}

# VSCode Tmux new session
if [[ -n "$VSCODE_INJECTION" || -n "$VSCODE_GIT_IPC_HANDLE" ]]; then
  exec tmux new-session -A -s vscode -c "$PWD"
fi

# Automatically launch or attach to tmux if not already inside a session
if [ -z "$TMUX" ] && [ -n "$PS1" ]; then
    tmux attach-session -t default 2>/dev/null || tmux new-session -s default
fi

. "$HOME/.local/bin/env"

# --- System Dependent ---
export ANTHROPIC_BASE_URL="http://localhost:8080"
export OLLAMA_MODELS="$HOME/Downloads/OLLAMA_MODELS"

# Add to PATH
export PATH="$HOME/node/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.zig:$PATH"
export PATH="$HOME/go/bin:/usr/local/go/bin:$PATH"
export PATH="$HOME/Apps/nvim-linux-x86_64/bin:$PATH"
export PATH="$HOME/Apps/cmake-4.1.0-rc1-linux-x86_64/bin:$PATH"

# NVM
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias llama="llama-server -c 32768 --models-preset $HOME/gguf/config.ini --spec-default --models-max 1 --port 8081"
alias ghdllm="python3 $HOME/code/ghdllm/ghdllm.py"

# go
export PATH=/usr/local/bin/go/bin:$PATH

# opencode
export PATH=/home/ghd/.opencode/bin:$PATH

# llama.cpp
export PATH=/home/ghd/Downloads/llamacpp:$PATH

# qt
export PATH=/home/ghd/Qt/6.9.1/gcc_64:$PATH
export QT6_DIR=/home/ghd/Qt/6.9.1/gcc_64
export PATH=/home/ghd/Downloads/odin-linux-amd64-nightly+2026-05-03:$PATH
