sudo apt update &&
sudo apt install -y \
    curl \
    git \
    htop \
    jq \
    python3 \
    python3-pip \
    python3-venv \
    ripgrep \
    fd-find \
    tree \
    zsh \
    zsh-syntax-highlighting &&
sudo apt autoremove -y

sudo apt remove tmux -y
