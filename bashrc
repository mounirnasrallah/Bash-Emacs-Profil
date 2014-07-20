
export EDITOR='emacs -nw'
export HISTSIZE=1000
export MAIL="/u/all/${USER}/mail/${USER}"
export PAGER='more'

export SAVEHIST=100000
export WATCH='all'
export SHELL='/bin/bash'
export PATH="~/bin:$PATH"

if [ -f /Applications/Emacs.app/Contents/MacOS/Emacs ]; then
    alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs -nw'
else
    alias emacs='emacs -nw'
fi

alias authors='echo "***** NASR ALLAH Mounir <nasrallah.mounir@gmail.com>" > AUTHORS'
alias cc='gcc -Wextra -Wall -Wuninitialized -Wunused -std=c99 -pedantic'
alias gnus='emacs -f gnus'
alias reload='source ~/.bashrc'

alias debian='ssh -X root@192.168.56.101'
alias openbsd='ssh -X root@192.168.56.102'
alias freebsd='ssh root@88.191.132.132'
alias kali='ssh root@88.191.132.132'


#############        PS1          ################

__gitdir ()
{
  if [ -z "${1-}" ]; then
    if [ -n "${__git_dir-}" ]; then
      echo "$__git_dir"
    elif [ -d .git ]; then
      echo .git
    else
      git rev-parse --git-dir 2>/dev/null
    fi
  elif [ -d "$1/.git" ]; then
    echo "$1/.git"
  else
    echo "$1"
  fi
}
__git_ps1 ()
{
  local g="$(__gitdir)"
  if [ -n "$g" ]; then
    local r
    local b
    if [ -f "$g/rebase-merge/interactive" ]; then
      r="|REBASE-i"
      b="$(cat "$g/rebase-merge/head-name")"
    elif [ -d "$g/rebase-merge" ]; then
      r="|REBASE-m"
      b="$(cat "$g/rebase-merge/head-name")"
    else
      if [ -d "$g/rebase-apply" ]; then
        if [ -f "$g/rebase-apply/rebasing" ]; then
          r="|REBASE"
        elif [ -f "$g/rebase-apply/applying" ]; then
          r="|AM"
        else
          r="|AM/REBASE"
        fi
      elif [ -f "$g/MERGE_HEAD" ]; then
        r="|MERGING"
      elif [ -f "$g/BISECT_LOG" ]; then
        r="|BISECTING"
      fi

      b="$(git symbolic-ref HEAD 2>/dev/null)" || {

        b="$(
        case "${GIT_PS1_DESCRIBE_STYLE-}" in
        (contains)
          git describe --contains HEAD ;;
        (branch)
          git describe --contains --all HEAD ;;
        (describe)
          git describe HEAD ;;
        (* | default)
          git describe --exact-match HEAD ;;
        esac 2>/dev/null)" ||

        b="$(cut -c1-7 "$g/HEAD" 2>/dev/null)..." ||
        b="unknown"
        b="($b)"
      }
    fi

    local w
    local i
    local s
    local u
    local c

    if [ "true" = "$(git rev-parse --is-inside-git-dir 2>/dev/null)" ]; then
      if [ "true" = "$(git rev-parse --is-bare-repository 2>/dev/null)" ]; then
        c="BARE:"
      else
        b="GIT_DIR!"
      fi
    elif [ "true" = "$(git rev-parse --is-inside-work-tree 2>/dev/null)" ]; then
      if [ -n "${GIT_PS1_SHOWDIRTYSTATE-}" ]; then
        if [ "$(git config --bool bash.showDirtyState)" != "false" ]; then
          git diff --no-ext-diff --ignore-submodules \
            --quiet --exit-code || w="*"
          if git rev-parse --quiet --verify HEAD >/dev/null; then
            git diff-index --cached --quiet \
              --ignore-submodules HEAD -- || i="+"
          else
            i="#"
          fi
        fi
      fi
      if [ -n "${GIT_PS1_SHOWSTASHSTATE-}" ]; then
              git rev-parse --verify refs/stash >/dev/null 2>&1 && s="$"
      fi

      if [ -n "${GIT_PS1_SHOWUNTRACKEDFILES-}" ]; then
         if [ -n "$(git ls-files --others --exclude-standard)" ]; then
            u="%"
         fi
      fi
    fi

    if [ -n "${1-}" ]; then
      printf "$1" "$c${b##refs/heads/}$w$i$s$u$r"
    else
      printf " (%s)" "$c${b##refs/heads/}$w$i$s$u$r"
    fi
  fi
}

export GIT_PS1_SHOWDIRTYSTATE=1 GIT_PS1_SHOWUNTRACKEDFILES=1 GIT_PS1_SHOWSTASHSTATE=1

#export PS1='\033[31m_______________________________________________________________________________\n|\033[37m\u @ \h: \W \[\033[1;33m\]($?)\[\033[0m\]\[\033[1;32m\]$(__git_ps1)\[\033[0m\] \[\e[0m\]\033[31m \n|\033[0m\[\033[1;37m\]=>\[\e[0m\] '

export PS1='\[\033[0;37m\]\u@\h:\[\033[0;33m\]\W\[\033[0m\]\[\033[1;32m\]$(__git_ps1)\[\033[0m\] \$ '

# export PS1=' _______________________________________________________________________________\n| \W @ \h: \u \[\033[1;33m\]($?) \[\e[0m\]\n| \[\033[1;33m\]=>\[\e[0m\] '


