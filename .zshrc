# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
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
  
)

source $ZSH/oh-my-zsh.sh

# User configuration

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias nvimconfig="cd ~/.dotfiles/.config/nvim/lua/user/ && nvim ."
alias vimconfig="nvim ~/.config/nvim/vimrc.vim"
alias alacconfig="nvim ~/.config/alacritty/alacritty.yml"
alias cls="clear"
alias nv=nvim
alias pingv="ping varzesh3.com"
alias pingg="ping google.com"
# alias python="python3.11"
# alias pip="pip3.11"
# alias sd="cd ~ && cd \$(find . -type d | fzf)" # fuzzy finder select directory bah bah
alias sd="cd \$(find . -type d | fzf)" # fuzzy finder select directory bah bah
alias sf="nv \$(find . -type f | fzf)" # fuzzy finder select directory bah bah

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PATH="$HOME/node/bin:$PATH"
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

