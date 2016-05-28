# --- Sources ---
source $HOME/.aliases
#source /usr/share/bash-completion/completions 
#source /etc/profile.d/cnf.sh


# --- Exports ---
export EDITOR="vim"
#export JAVA_HOME=/usr/lib/jvm/java-8-oracle/jre
export JAVA_FONTS=/usr/share/fonts/TTF


# --- History ---
HISTFILE=~/.zhistory
HISTSIZE=2500
SAVEHIST=2500
bindkey -e


# --- Capabilities ---
# Create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -A key

key[Home]=${terminfo[khome]}

key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}

# setup key accordingly
[[ -n "${key[Home]}"    ]]  && bindkey  "${key[Home]}"    beginning-of-line
[[ -n "${key[End]}"     ]]  && bindkey  "${key[End]}"     end-of-line
[[ -n "${key[Insert]}"  ]]  && bindkey  "${key[Insert]}"  overwrite-mode
[[ -n "${key[Delete]}"  ]]  && bindkey  "${key[Delete]}"  delete-char
[[ -n "${key[Up]}"      ]]  && bindkey  "${key[Up]}"      up-line-or-history
[[ -n "${key[Down]}"    ]]  && bindkey  "${key[Down]}"    down-line-or-history
[[ -n "${key[Left]}"    ]]  && bindkey  "${key[Left]}"    backward-char
[[ -n "${key[Right]}"   ]]  && bindkey  "${key[Right]}"   forward-char

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
    function zle-line-init () {
        printf '%s' "${terminfo[smkx]}"
    }
    function zle-line-finish () {
        printf '%s' "${terminfo[rmkx]}"
    }
    zle -N zle-line-init
    zle -N zle-line-finish
fi


# --- History search ---
[[ -n "${key[PageUp]}"   ]]  && bindkey  "${key[PageUp]}"    history-beginning-search-backward
[[ -n "${key[PageDown]}" ]]  && bindkey  "${key[PageDown]}"  history-beginning-search-forward


# --- Command not found ---
#[ -r /usr/share/doc/pkgfile/command-not-found.zsh ] && . /usr/share/doc/pkgfile/command-not-found.zsh

if [[ -s '/etc/zsh_command_not_found' ]]; then
  source '/etc/zsh_command_not_found'
fi


# --- Color man pages ---
man() {
    env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
        man "$@"
}


# --- Additional colors ---
eval $(dircolors -b)


# --- Function to decompress archives ---
extract () {
    if [ -f $1 ] ; then
	case $1 in
            *.tar.bz2) tar xvjf $1;;
            *.tar.gz) tar xvzf $1;;
	    *.tar.xz) tar xJf $1;;
            *.bz2) bunzip2 $1;;
            *.rar) unrar x $1;;
            *.gz) gunzip $1;;
            *.tar) tar xvf $1;;
            *.tbz2) tar xvjf $1;;
            *.tgz) tar xvzf $1;;
            *.zip) unzip $1;;
            *.Z) uncompress $1;;
            *.7z) 7za x $1;;
            *) echo "'$1' cannot be extracted via >extract<" ;;
        esac
    else
	echo "'$1' is not a valid file"
    fi
}

# --- External IP ---
function ext-ip () { curl http://ipecho.net/plain; echo; }


# --- Terminal title ---
case $TERM in
    xterm*|rxvt*|screen*|sakura*|terminator*)
         #precmd() { print -Pn "\e]0;%m:%~\a" }
         precmd() { print -Pn "\e]0;%n@%m:%~\a" }
         preexec () { print -Pn "\e]0;$1\a" }
        ;;
esac


# --- Autoload ---
zmodload zsh/complist

autoload -Uz compinit promptinit && compinit -C && promptinit
autoload -U colors && colors
autoload bashcompinit && bashcompinit


# --- Prompt ---
PROMPT="[%{$fg[yellow]%}%n%{$reset_color%}@%m %{$fg_no_bold[white]%}%1~%{$reset_color%}]%# "
RPROMPT=""


# --- Autocompletion ---
#zstyle ':completion:*' menu select
setopt completealiases

### If you want zsh's completion to pick up new commands in $path automatically
### comment out the next line and un-comment the following 5 lines
zstyle ':completion:::::' completer _complete _approximate
#_force_rehash() {
#  (( CURRENT == 1 )) && rehash
#  return 1	# Because we didn't really complete anything
#}
#zstyle ':completion:::::' completer _force_rehash _complete _approximate
zstyle -e ':completion:*:approximate:*' max-errors 'reply=( $(( ($#PREFIX + $#SUFFIX) / 3 )) )'
zstyle ':completion:*:descriptions' format "- %d -"
zstyle ':completion:*:corrections' format "- %d - (errors %e})"
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:manuals.(^1*)' insert-sections true
zstyle ':completion:*' menu select
zstyle ':completion:*' verbose yes
