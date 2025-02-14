# Powerlevel10k setup
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Plugins
plugins=(
  git 
 # zsh-autosuggestions 
 # zsh-syntax-highlighting 
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

# aliases
## Configs quick edit
alias sshtitan="ssh mammad@172.23.153.117"
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
alias port="ss -tulwn"

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

## Test fn
testfn ()
{
  echo $(pwd) 
}
alias testfn="testfn"


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Add to PATH
export PATH="$PATH:/opt/nvim-linux64/bin"
export PATH="$HOME/node/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.zig:$PATH"
export PATH="$HOME/go/bin:/usr/local/go/bin:$PATH"

export XDG_CONFIG_HOME="$HOME/.config"
export TERM=xterm-256color

# tmux start
tmux attach || tmux new
