source $HOME/private/work.sh # $HOME should *not* have a .git https://askubuntu.com/a/1316504

alias k='gitkraken &'   # WSL + Git = bullshit: https://chuckdries.medium.com/installing-gitkraken-in-wsl-2-15bf6459f823
                        # Unused - but related: https://www.reddit.com/r/bashonubuntuonwindows/comments/cbafun/opening_a_git_repository_inside_wsl_with_windows/
                        # https://gist.github.com/carlolars/ed976078a66e7d57bb04f959270bdee3
                        # https://github.com/microsoft/WSL/issues/4273
alias aptup='sudo apt update && sudo apt upgrade'
alias say='/mnt/c/Program\ Files\ \(x86\)/eSpeak/command_line/espeak.exe'

export PATH=$PATH:$HOME/bin
export PATH=$PATH:$HOME/.emacs.d/bin

alias code="/mnt/c/Users/dharm/AppData/Local/Programs/Microsoft\ VS\ Code/Code.exe"

function precmd () {
    # https://askubuntu.com/a/832061 explains \033]0;
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) = true ]]; then # https://gist.github.com/nathan-v/dc57a9beb79b6d5bee7e3ddc1a48b5bc
        # Set the title to <git parent folder name>:<current branch> like "mycoollib:master"
        echo -ne "\033]0;$(basename `git rev-parse --show-toplevel`):$(git rev-parse --abbrev-ref HEAD)\007"
    else
        # https://github.com/gokcehan/lf/wiki/Tips#show-current-directory-in-window-title
        printf "\033]0; $(pwd | sed "s|$HOME|~|")\007" > /dev/tty
    fi
}
