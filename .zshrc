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

# aliases
## Configs quick edit
EDITOR="nvim"
alias zshconfig="$EDITOR ~/.zshrc"
alias ohmyzsh="$EDITOR ~/.oh-my-zsh"
alias nvimconfig="cd ~/.dotfiles/.config/nvim/lua/user/ && $EDITOR ."
alias vimconfig="$EDITOR ~/.config/nvim/vimrc.vim"
alias alacconfig="$EDITOR ~/.config/alacritty/alacritty.yml"
alias dotf="cd ~/.dotfiles/"

## Shorthand for commands
alias cls="clear"
alias nv="nvim"
alias py="python"
alias ipy="ipython"

## Diagnostic shortcuts
alias pingv="ping varzesh3.com"
alias pingg="ping google.com"
alias dns="resolvectl status | bat -l py"
alias gw="ip route | bat -l py"
alias addgw="sudo route add default gw 192.168.1.1"
alias speed="curl https://video-vcdn.varzesh3.com/videos-quality/2023/04/23/D/e1j0b42h.mp4 --output /tmp/video.mp4"
alias ram="free -h --si"
alias port="ss -tulwn"

## Git commands
alias gs="git status"
alias gad="git add ."
alias gp="git push"
alias gcm="git commit -m"

## Tools/Custom commands
alias sd="cd \$(find . -type d | fzf)" # fuzzy finder select directory bah bah
alias sf="nv \$(find . -type f | fzf)" # fuzzy finder select directory bah bah
# alias sd="cd ~ && cd \$(find . -type d | fzf)" # fuzzy finder select directory bah bah

## Docker aliases
function getwd() {
  echo $(pwd)
}
alias docker-jupyter-scipy="docker run -it --rm --user root -e GRANT_SUDO=yes -e CHOWN_EXTRA="/home/jovyan/work" -e CHOWN_EXTRA_OPTS="-R" -p 8889:8888 -v "$(getwd)":/home/jovyan/work jupyter/scipy-notebook:latest"

## Test fn
testfn ()
{
  echo $(pwd) 
}
alias testfn="testfn"


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Add to PATH
export PATH="$HOME/node/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export XDG_CONFIG_HOME="$HOME/.config"

# tmux attach || tmux new

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/ghd/miniconda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/ghd/miniconda/etc/profile.d/conda.sh" ]; then
        . "/home/ghd/miniconda/etc/profile.d/conda.sh"
    else
        export PATH="/home/ghd/miniconda/bin:$PATH"
    fi
fi
unset __conda_setup

# Disable if you dont have datascience env
conda activate datascience
# <<< conda initialize <<<

