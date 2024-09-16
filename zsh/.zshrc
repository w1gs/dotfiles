# Enable Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# Oh My Zsh configuration
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="powerlevel10k/powerlevel10k"
POWERLEVEL9K_MODE="nerdfont-complete"
typeset -g POWERLEVEL9K_INSTANT_PROMPT=off
ENABLE_CORRECTION="true"
plugins=(git fast-syntax-highlighting zoxide tmux)

# Path and environment variables
export PATH=$PATH:$HOME/go/bin:$HOME/.config/emacs/bin:$(brew --prefix openssh)/bin:/usr/bin
export GOPATH=$HOME/go
export EDITOR='nvim'
export PYTHONUNBUFFERED=1
export PYTHONDONTWRITEBYTECODE=None

# Load Oh My Zsh
source $ZSH/oh-my-zsh.sh

# NVM setup
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Pyenv setup
# export PYENV_ROOT="$HOME/.pyenv"
# [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"

# Load Powerlevel10k configuration
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Function to create a virtual environment using uv
function create_venv() {
    if [ $# -gt 1 ]; then
        uv venv --python "$1" "$HOME/venvs/$2"
    else
        uv venv "$HOME/venvs/$1"
    fi
}

function activate_venv() {
        source "$HOME/venvs/$1/bin/activate"
}

# Aliases
alias sourcetmux='tmux source ~/.tmux.conf'
alias lint='golangci-lint run'
alias pj='cd ~/projects/project-management'
alias theme="kitty +kitten themes --reload-in=all"
alias icat="kitty +kitten icat"
alias connect="kitty +kitten ssh"
alias cd="z"
alias venv="create_venv"
alias activate="activate_venv"

# Productivity aliases
alias work="timer 60m && terminal-notifier -message 'Pomodoro' -title 'Work Timer is up! Take a Break 😊' -appIcon '~/Pictures/pumpkin.png' -sound Crystal"
alias rest="timer 10m && terminal-notifier -message 'Pomodoro' -title 'Break is over! Get back to work 😬' -appIcon '~/Pictures/pumpkin.png' -sound Crystal"

# Display banner
cat ~/banner
