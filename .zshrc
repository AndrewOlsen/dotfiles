# Path to your oh-my-zsh installation.
  export ZSH=/home/andy/.oh-my-zsh

# terminal for i3
  export TERMINAL=/usr/bin/urxvtc
  export EDITOR=/usr/bin/vim
  export BROWSER=/usr/bin/qutebrowser

# Set name of the theme to load.
ZSH_THEME="classyTouch"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
plugins=(git archlinux sudo)

# User configuration

export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/usr/bin/core_perl:/home/andy/.gem/ruby/2.4.0/bin:/home/andy/.local/bin/"
export VISUAL="vim"

source $ZSH/oh-my-zsh.sh

# Set personal aliases

# Lazy directory change
alias sec="cd ~/Documents/sec"
alias doc="cd ~/Documents/"
alias code="cd ~/Documents/code/"
alias pt="cd ~/Documents/code/pentesterlabs/"
alias work="cd ~/Documents/work/"


# Quick config edits
alias vimi3="vim ~/.i3/config"
alias vimpoly="vim ~/.config/polybar/config"
alias vimzsh="vim ~/.zshrc"
alias vimx="vim ~/.Xresources"

# Command alias
alias t="todo.sh"
alias clip="xclip -selection clipboard"
alias config='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'
alias pu="pacaur -Syu"
alias qutebrowser="qutebrowser --backend webengine"
alias rainbowstream="workon rs; rainbowstream -iot; deactivate"

# Virtualenv
export WORKON_HOME=~/.virtualenvs
source /usr/bin/virtualenvwrapper.sh

# Wal goodness
source "$HOME/.cache/wal/colors.sh"
(wal -r -q &)

# Search for youtube music
function mm() {
    mpv --no-video --ytdl-format=bestaudio ytdl://ytsearch10:"$@"
}
