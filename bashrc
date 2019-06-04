/Users/mouns/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

## COLORS ETC..##

RS="\[\033[0m\]"    # reset
HC="\[\033[1m\]"    # hicolor
UL="\[\033[4m\]"    # underline
INV="\[\033[7m\]"   # inverse background and foreground
FBLK="\[\033[30m\]" # foreground black
FRED="\[\033[31m\]" # foreground red
FGRN="\[\033[32m\]" # foreground green
FYEL="\[\033[33m\]" # foreground yellow
FBLE="\[\033[34m\]" # foreground blue
FMAG="\[\033[35m\]" # foreground magenta
FCYN="\[\033[36m\]" # foreground cyan
FWHT="\[\033[37m\]" # foreground white
BBLK="\[\033[40m\]" # background black
BRED="\[\033[41m\]" # background red
BGRN="\[\033[42m\]" # background green
BYEL="\[\033[43m\]" # background yellow
BBLE="\[\033[44m\]" # background blue
BMAG="\[\033[45m\]" # background magenta
BCYN="\[\033[46m\]" # background cyan
BWHT="\[\033[47m\]" # background white

export PS1="$FRED[$RS$FGRN\u@\h$RS $FBLE\w$RS$FYEL\$(__git_ps1_callback)$RS$FRED]$RS "

shopt -u interactive_comments
shopt -s nullglob
set -o noclobber

### Alias ###

alias debian='ssh -X root@192.168.56.101'
alias reload='source ~/.bashrc'

alias ll='ls -l'

export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
alias ls='ls -GFh'

if which gls; then
  alias ls='gls --color --indicator-style=slash --group-directories-first'
    eval "$(gdircolors ~/.dir_colors)"
    else
      alias ls='ls -G'
      fi

if command -v mvim >/dev/null 2>&1 && [ -z "$SSH_CONNECTION" ]; then
  alias vim='mvim --remote-tab-silent'
  fi


### COMPLETION ###

shopt -s no_empty_cmd_completion
complete -cf sudo
complete -c man

### GIT ###

__git_run_subdir()
{
  if [ -n "$1" ]; then
      target="$1"
        else
	    target="."
	      fi
	        cd "$target" || return 1
		  shift

  "$@"
    res=$?

  cd "$OLDPWD"

  return $res
  }

__git_is_repo()
{
  [ $# -le 1 ] || return 1
    __git_run_subdir "$1" git rev-parse --git-dir >/dev/null 2>&1
    }

__git_current_branch()
{
  [ $# -le 1 ] || return 1
    __git_is_repo "$1" || return 1
      __git_run_subdir "$1" git branch | grep '^*' | sed -e 's,\*[[:space:]]*,,' | tr -d '()'
      }

__git_ps1_callback()
{
  __git_is_repo . || return
    echo " ($(__git_current_branch .))"
    }

git-merges-cleanly()
{
  [ $# -eq 1 ] || return 1
    __git_is_repo . || return 1
      if [ "$(git rev-parse HEAD)" = "$(git merge-base HEAD "$1")" ]; then
          echo "yes"
	      return 0
	        else
		    echo "no"
		        return 1
			  fi
			  }

alias gg='git grep -n'


## HISTORY ##

shopt -u lithist
shopt -s histappend

export HISTSIZE="1000000"
export HISTCONTROL="ignoredups:erasedups"



# OPAM configuration
. /Users/mouns/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
