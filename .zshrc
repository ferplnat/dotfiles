# Set up the prompt

autoload -Uz promptinit
promptinit
prompt adam1 8

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -v

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history
SHELL=/bin/zsh
KEYTIMEOUT=1

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

DOTNET_INSTALL_DIR="/usr/share/dotnet"
export DOTNET_INSTALL_DIR

if [[ -z "${TMUX}" ]]; then
    tmux new-session -As main
fi

alias ls='ls --color=auto'
alias lsa='ls -al'

if [[ -n "$(which git)" ]]; then
    git config --global push.autoSetupRemote true
    git config --global fetch.prune true

    if [[ -n "$(which nvim)" ]]; then
        git config --global core.editor "nvim"
    else
        git config --global core.editor "vim"
    fi
fi
