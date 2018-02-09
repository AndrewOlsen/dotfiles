#######
# ZSH #
#######

# Oh-my-zsh dir
export ZSH=/home/andy/.oh-my-zsh

# oh-my-zsh theme
ZSH_THEME="xero"

# program variables
export TERMINAL=/usr/bin/urxvtc
export EDITOR=/usr/bin/vim
export BROWSER=/usr/bin/qutebrowser
export VISUAL="vim"

# oh-my-zsh plugins
plugins=(git colored-man-pages sudo)

# Source it
source $ZSH/oh-my-zsh.sh

# User PATH
PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin"
PATH="$PATH:/usr/bin/core_perl:/home/andy/.gem/ruby/2.4.0/bin"
PATH="$PATH:/home/andy/.local/bin/:/home/andy/.scripts/"

###########
#  ALIAS  #
###########

# Lazy directory change
alias sec="cd ~/Documents/code/sec"
alias doc="cd ~/Documents"
alias code="cd ~/Documents/code"
alias proj="cd ~/Documents/code/projects"
alias pt="cd ~/Documents/code/sec/webappsec/pentesterlabs"
alias work="cd ~/Documents/work"

# Prevent stupidity
alias rm='noglob timeout 3 rm -Iv --one-file-system'
alias cp="cp -i"
alias mv='timeout 8 mv -iv'

# Quick config edits
alias vimi3="vim ~/.i3/config"
alias vimpoly="vim ~/.config/polybar/config"
alias vimzsh="vim ~/.zshrc"
alias vimx="vim ~/.Xresources"
alias vimherb="vim ~/.config/herbstluftwm/autostart"
alias qvim='vim -c "setlocal nonumber | setlocal norelativenumber | AirlineToggle | set noshowmode | set laststatus=0 | set noshowcmd | highlight EndOfBuffer ctermfg=black ctermbg=black"'

# Command alias
alias t="todo.sh"
alias clip="xclip -selection clipboard"
alias config='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'
alias screencap="ffmpeg -f x11grab -video_size 1920x1080 -framerate 60 -i :0 -f pulse -i default -c:v ffvhuff -c:a flac /tmp/grab.mkv"
alias passmenu='~/.scripts/passmenu -nb "$color0" -nf "$color15" -sb "$color1" -sf "$color15" -b -fn "Dina-12"'
alias hc="herbstclient"
alias pacaur="trizen"

#############
# FUNCTIONS #
#############

# Search for youtube music and give info to polybar
function mm() {
	youtube-dl --skip-download --get-title --get-id ytsearch:"$@" > ~/.config/polybar/mpv-info
	title=`head -n 1 ~/.config/polybar/mpv-info`
	id=`tail -n 1 ~/.config/polybar/mpv-info`
	echo $title > ~/.config/polybar/mpv-title
	mpv --no-video --ytdl-format=bestaudio ytdl://$id
	rm ~/.config/polybar/mpv-title
}

# Quick int to hex
function hex() {
	python -c "print(hex($1)[2:].upper().zfill(2))"
}

#########
# OTHER #
#########

# Virtualenv
export WORKON_HOME=~/.virtualenvs
source /usr/bin/virtualenvwrapper.sh

# Wal goodness
. ~/.cache/wal/colors.sh
(cat ~/.cache/wal/sequences &)

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Syntax highlight
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
