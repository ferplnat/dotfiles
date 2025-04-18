get_git_branch() {
    branchName=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)

    if [ "$branchName" = "" ]; then
        echo "$branchName"
        return
    fi

    echo " $branchName"
}

zsh_plugin_dir="$HOME/.zsh/plugins/"

printf '\e[1 q'

alias ls="ls -a --color=auto"
alias sl="ls"

if [[ -n "$(which git)" ]]; then
    git config --global push.autoSetupRemote true
    git config --global fetch.prune true
    git config --global init.defaultBranch main
    
    if ! [[ -d "$zsh_plugin_dir" ]]; then
        mkdir -p "$zsh_plugin_dir"
    fi

    if ! [[ -d "$zsh_plugin_dir/zsh-autosuggestions" ]]; then
        ( cd "$zsh_plugin_dir" && git clone "https://github.com/zsh-users/zsh-autosuggestions" )
    fi

    if ! [[ -d "$zsh_plugin_dir/zsh-syntax-highlighting" ]]; then
        ( cd "$zsh_plugin_dir" && git clone "https://github.com/zsh-users/zsh-syntax-highlighting" )
    fi

    if [[ -n "$(which nvim)" ]]; then
        git config --global core.editor "nvim"
    else
        git config --global core.editor "vim"
    fi
fi

setopt prompt_subst
PROMPT='%F{green}%n [%f %~ %F{green}]%f%F{red}$(get_git_branch)%f %F{green}\$%f '

source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
