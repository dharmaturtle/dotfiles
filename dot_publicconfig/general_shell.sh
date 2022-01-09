source $HOME/private/work.sh # $HOME should *not* have a .git https://askubuntu.com/a/1316504

alias k='gitkraken &'   # WSL + Git = bullshit: https://chuckdries.medium.com/installing-gitkraken-in-wsl-2-15bf6459f823
                        # Unused - but related: https://www.reddit.com/r/bashonubuntuonwindows/comments/cbafun/opening_a_git_repository_inside_wsl_with_windows/
                        # https://gist.github.com/carlolars/ed976078a66e7d57bb04f959270bdee3
                        # https://github.com/microsoft/WSL/issues/4273
alias aptup='sudo apt update && sudo apt upgrade'
alias say='/mnt/c/Program\ Files\ \(x86\)/eSpeak/command_line/espeak.exe'
alias ls='ls --color=auto'
alias ll="ls -lah"
alias la="ls -a"
alias ..='cd ..'
alias mv='mv -iv'
alias rm='rm -iv'
alias cp='cp -iv'

# Switch BAT_THEME based on Windows Terminal settings https://stackoverflow.com/a/11287896/625919
# Maybe someday https://github.com/sharkdp/bat/issues/1104
windowsTerminalSettings=/mnt/c/Users/dharm/Local\ Settings/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json
if rg -q "colorScheme\": \"Campbell" "$windowsTerminalSettings"; then
    export BAT_THEME="OneHalfDark";
else
    export BAT_THEME="OneHalfLight";
fi

export FZF_DEFAULT_COMMAND="rg --files --follow --no-ignore-vcs --hidden -g '!{**/node_modules/*,**/.git/*}'" # https://github.com/junegunn/fzf/issues/634#issuecomment-1008200731
# https://github.com/sharkdp/bat/issues/448#issuecomment-558068337 https://github.com/sharkdp/bat/issues/357#issuecomment-555942979
alias fz="fzf\
  --bind='ctrl-/:toggle-preview'\
  --bind='ctrl-u:preview-page-up'\
  --bind='ctrl-d:preview-page-down'\
  --preview-window 'right:60%'\
  --preview '([[ -d {} ]] && tree -C {}) || ([[ -f {} ]] && bat --style=full --color=always {}) || echo {}'"

export PATH=$PATH:$HOME/bin
export PATH=$PATH:$HOME/.emacs.d/bin

alias code="/mnt/c/Users/dharm/AppData/Local/Programs/Microsoft\ VS\ Code/Code.exe"

# Named Directories https://sorrell.github.io/2020/03/16/WSL-and-ZSH.html https://github.com/romkatv/powerlevel10k/issues/796#issuecomment-638609634
hash -d d=/mnt/c/Users/dharm/Desktop
hash -d c=/mnt/c
hash -d code=/mnt/c/code

