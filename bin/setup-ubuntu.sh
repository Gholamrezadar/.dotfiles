#!/bin/bash
# Setups GHD Ubuntu

GREEN='\033[0;32m'
NC='\033[0m' # No Color

print() {
    echo -e "${GREEN}--$1--${NC}"
}

# only for docker(ubuntu image)
print "--Running apt update--"
apt -qq update
print "--Installing sudo--"
apt -qq install sudo -y

# update and upgrade
print "--sudo apt update--"
sudo apt -qq update

print "--sudo apt upgrade--"
sudo apt -qq upgrade -y

# install necessary packages (git, curl, wget, zsh, iputils-ping, net-tools, htop, neofetch)
print "--Installing git--"
sudo apt -qq install git -y

print "--Installing curl--"
sudo apt -qq install curl -y

print "--Installing wget--"
sudo apt -qq install wget -y

print "--Installing zsh--"
sudo apt -qq install zsh -y

print "--Installing iputils-ping--"
sudo apt -qq install iputils-ping -y    

print "--Installing net-tools--"
sudo apt -qq install net-tools -y

print "--Installing htop--"
sudo apt -qq install htop -y

print "--Installing neofetch--"
# sudo apt -qq install neofetch -y

# Configure zsh
print "--Change shell to zshh--"
chsh -s $(which zsh)

print "--Install oh-my-zsh--"
yes | sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

print "--Install p10k--"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

print "--Installing Neovim--"
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install neovim -y

# download the zshrc file from github https://github.com/Gholamrezadar/.dotfiles/blob/main/.zshrc
print "--Downloading zshrc file--"
wget https://raw.githubusercontent.com/Gholamrezadar/.dotfiles/main/.zshrc -O ~/.zshrc
