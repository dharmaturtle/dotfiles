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
