# My functions
get_git_branch() {
    branchName=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)

    if [ "$branchName" = "" ]; then
        echo "$branchName"
        return
    fi

    echo " $branchName"
}

cd_git_root() {
    rootDir=$(git rev-parse --show-toplevel 2> /dev/null)

    if [ "$rootDir" = "" ]; then
        return
    fi

    cd "$rootDir" || return
}

zsh_plugin_dir="$HOME/.zsh/plugins/"

if [[ -n "$(which git)" ]]; then
    git config --global core.excludesFile "$HOME/.gitignore"
    git config --global core.untrackedCache true

    git config --global column.ui auto

    git config --global branch.sort "-committerdate"
    git config --global tag.sort "version:refname"

    git config --global init.defaultBranch main

    git config --global diff.algorithm histogram
    git config --global diff.colorMoved plain
    git config --global diff.mnemonicPrefix true
    git config --global diff.renames true

    git config --global push.default simple
    git config --global push.autoSetupRemote true
    git config --global push.followTags true

    git config --global fetch.prune true
    git config --global fetch.pruneTags true
    git config --global fetch.all true

    git config --global merge.conflictStyle zdiff3

    git config --global pull.rebase true

    git config --global rebase.autoSquash true
    git config --global rebase.autoStash true
    git config --global rebase.updateRefs true

    git config --global help.autocorrect prompt

    git config --global commit.verbose true

    git config --global rerere.enabled true
    git config --global rerere.autoUpdate true
    
    # Set up zsh and plugins
    if ! [[ -d "$zsh_plugin_dir" ]]; then
        mkdir -p "$zsh_plugin_dir"
    fi

    if ! [[ -d "$zsh_plugin_dir/zsh-autosuggestions" ]]; then
        ( cd "$zsh_plugin_dir" && git clone "https://github.com/zsh-users/zsh-autosuggestions" )
        source "$HOME/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
    fi

    if ! [[ -d "$zsh_plugin_dir/zsh-syntax-highlighting" ]]; then
        ( cd "$zsh_plugin_dir" && git clone "https://github.com/zsh-users/zsh-syntax-highlighting" )
        source "$HOME/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
    fi

    # Set up tmux plugin manager
    if [[ -n "$(which tmux)" ]]; then
        if ! [[ -d "$HOME/.tmux/plugins/tpm" ]]; then
            git clone "https://github.com/tmux-plugins/tpm" "$HOME/.tmux/plugins/tpm"
        fi
    fi

    if [[ -n "$(which nvim)" ]]; then
        git config --global core.editor "nvim"
    else
        git config --global core.editor "vim"
    fi
fi

if [[ -n "$(which fzf)" ]]; then
    # fzf shell integration
    source <(fzf --zsh)
fi

unset zsh_plugin_dir

autoload -Uz compinit
compinit

# set block cursor
printf '\e[1 q'

# My aliases
alias ls="ls -a --color=auto"
alias sl="ls" # I typo this all the time
alias gitroot=cd_git_root # cd to git root
alias tree="tree -C" # force tree full color

# My prompt
setopt prompt_subst
PROMPT='%F{green}%n [%f %~ %F{green}]%f%F{red}$(get_git_branch)%f %F{green}\$%f '

# Global ripgrep config
export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"

# Set up PATH
typeset -U path
path=("$HOME/.local/bin" $path)
export PATH
