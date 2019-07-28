#######
# ZSH #
#######

# Oh-my-zsh dir
#export ZSH=/home/andy/.oh-my-zsh

# oh-my-zsh theme
#ZSH_THEME="xero"

# program variables
export TERMINAL=/usr/bin/urxvtc
export EDITOR=/usr/bin/vim
export BROWSER=/usr/bin/qutebrowser
export VISUAL="vim"

# oh-my-zsh plugins
#plugins=(git colored-man-pages sudo)

# Source it
#source $ZSH/oh-my-zsh.sh

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
alias voxm="mpv 'https://www.youtube.com/watch?v=i-p9lWIhcLQ&list=PL7atuZxmT954bCkC062rKwXTvJtcqFB8i' --save-position-on-quit"

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

# Syntax highlight
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# linux theme
. ~/.cache/wal/colors.sh

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

### ohmyzsh stuff ###
autoload -U compaudit compinit
autoload -U colors && colors
export LSCOLORS="Gxfxcxdxbxegedabagacad"
eval "$(dircolors -b)"
alias ls='ls --color=tty'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:[%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}] %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%}]"

function git_prompt_info() {
   local ref
   if [[ "$(command git config --get oh-my-zsh.hide-status 2>/dev/null)" != "1" ]]; then
     ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
     ref=$(command git rev-parse --short HEAD 2> /dev/null) || return 0
     echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_SUFFIX"
   fi
 }
function parse_git_dirty() {
   local STATUS=''
   local -a FLAGS
   FLAGS=('--porcelain')
   if [[ "$(command git config --get oh-my-zsh.hide-dirty)" != "1" ]]; then
     if [[ $POST_1_7_2_GIT -gt 0 ]]; then
       FLAGS+='--ignore-submodules=dirty'
     fi
     if [[ "$DISABLE_UNTRACKED_FILES_DIRTY" == "true" ]]; then
       FLAGS+='--untracked-files=no'
     fi
     STATUS=$(command git status ${FLAGS} 2> /dev/null | tail -n1)
   fi
   if [[ -n $STATUS ]]; then
     echo "$ZSH_THEME_GIT_PROMPT_DIRTY"
   else
     echo "$ZSH_THEME_GIT_PROMPT_CLEAN"
   fi
 }
# prompt
#local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
setopt prompt_subst
export PS1='%{$fg[cyan]%}[%{$reset_color%}%c%{$fg[cyan]%}]%{$reset_color%} $(git_prompt_info)'
PS1_VI="%{$fg[cyan]%}[%{$reset_color%}vi%{$fg[cyan]%}]%{$reset_color%}"
# show what vi mode we're in
function zle-line-init zle-keymap-select {
    PS1="${${KEYMAP/vicmd/$PS1_VI}/(main|viins)/}%{$fg[cyan]%}[%{$reset_color%}%c%{$fg[cyan]%}]%{$reset_color%} $(git_prompt_info)"
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

#source $ZSH/oh-my-zsh.sh

# up and down substring search
autoload -U up-line-or-beginning-search
zle -N up-line-or-beginning-search
bindkey "$terminfo[kcuu1]" up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "$terminfo[kcud1]" down-line-or-beginning-search
bindkey '^P' up-history
bindkey '^N' down-history

# add sudo with two esc hits
#sudo-command-line() {
#    [[ -z $BUFFER ]] && zle up-history
#    if [[ $BUFFER == sudo\ * ]]; then
#        LBUFFER="${LBUFFER#sudo }"
#    elif [[ $BUFFER == $EDITOR\ * ]]; then
#        LBUFFER="${LBUFFER#$EDITOR }"
#        LBUFFER="sudoedit $LBUFFER"
#    elif [[ $BUFFER == sudoedit\ * ]]; then
#        LBUFFER="${LBUFFER#sudoedit }"
#        LBUFFER="$EDITOR $LBUFFER"
#    else
#        LBUFFER="sudo $LBUFFER"
#    fi
#}
#zle -N sudo-command-line
## Defined shortcut keys: [Esc] [Esc]
#bindkey "\e\e" sudo-command-line

# colored man pages
function man() {
	env \
		LESS_TERMCAP_mb=$(printf "\e[1;34m") \
		LESS_TERMCAP_md=$(printf "\e[1;34m") \
		LESS_TERMCAP_me=$(printf "\e[0m") \
		LESS_TERMCAP_so=$(printf "\e[1;47;33m") \
		LESS_TERMCAP_se=$(printf "\e[0m") \
		LESS_TERMCAP_us=$(printf "\e[1;32m") \
		LESS_TERMCAP_ue=$(printf "\e[0m") \
		PAGER="${commands[less]:-$PAGER}" \
		man "$@"
}

## History file configuration
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=10000
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt inc_append_history     # add commands to HISTFILE in order of execution
setopt share_history          # share command history data
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus
setopt autocd

# cd stuff
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'
alias lsa='ls -lah'
alias l='ls -lah'
alias ll='ls -lh'
alias la='ls -lAh'
alias grep='grep --color=auto'

# tab complete
zmodload -i zsh/complist
unsetopt menu_complete   # do not autoselect the first completion entry
unsetopt flowcontrol
setopt auto_menu         # show completion menu on successive tab press
setopt complete_in_word
setopt always_to_end
bindkey -M menuselect '^o' accept-and-infer-next-history
bindkey '^[[Z' reverse-menu-complete
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' list-colors ''
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm -w -w"
zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion::complete:*' cache-path $HOME/.cache/zsh

# ignore these users in tab completes
zstyle ':completion:*:*:*:users' ignored-patterns \
      adm amanda apache at avahi avahi-autoipd beaglidx bin cacti canna \
      clamav daemon dbus distcache dnsmasq dovecot fax ftp games gdm \
      gkrellmd gopher hacluster haldaemon halt hsqldb ident junkbust kdm \
      ldap lp mail mailman mailnull man messagebus  mldonkey mysql nagios \
      named netdump news nfsnobody nobody nscd ntp nut nx obsrun openvpn \
      operator pcap polkitd postfix postgres privoxy pulse pvm quagga radvd \
      rpc rpcuser rpm rtkit scard shutdown squid sshd statd svn sync tftp \
      usbmux uucp vcsa wwwrun xfs '_*'

# stop ^W at /
my-backward-delete-word() {
    local WORDCHARS=${WORDCHARS/\//}
    zle backward-delete-word
}
zle -N my-backward-delete-word
bindkey '^W' my-backward-delete-word

bindkey '^?' backward-delete-char
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line
bindkey '^[b' backward-word
bindkey '^[f' forward-word
bindkey -r '^D'
