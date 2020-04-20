# vim:fileencoding=utf-8:ft=conf:foldmethod=marker

bindkey -e

#tfetch

setopt autocd

#: Prompt {{{
SP='▒'
#SP='%{[1m%}>%{[22m%}'
#RSP='%{[1m%}<%{[22m%}'
[ -z $RSP ] && RSP=`echo $SP | rev`

export PS1="%(1j.%{[48;05;170m%} %j .)"\
"%{[107;30m%} %n@%{[1;34m%}%m %{[22;7m%}$SP%{[0m%}"\
"%{[44;30m%} %1~ %{[49;34m%}$SP %{[0m%}"\
"%{]0;Le terminol%}"

export RPS1="%(0?.%{[0m%}$RSP%{[7m%} %?.%{[0m%}$RSP%{[7;46m%} %?) %{[0m%}"
export PS2="%{[34;21;7m%} %_ %{[27;49m%}$SP%{[0m%} "
export PS3="%{[30;44m%} SELECT %{[30;7m%}$SP%{[0m%} "
#}}}

#: Aliases {{{
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
alias ls='ls --color'
alias la='ls -A'
alias vim='nvim'
alias l.='ls -d .*'
#}}}

#: Cache and completion {{{
ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi
zstyle :compinstall filename '/home/maruseu/.zshrc'
autoload -Uz compaudit compinit
compinit
_comp_options+=(globdots)
#}}}

#: History {{{
HISTFILE=~/.histfile
HISTSIZE=50000
SAVEHIST=2000
#}}}

#: Hist Search {{{
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

bindkey "[A" history-beginning-search-backward-end
bindkey "[B" history-beginning-search-forward-end
bindkey "[H" beginning-of-line
#}}}

#: Key Bindings {{{
bindkey "\033[1~" beginning-of-line
bindkey "[F" end-of-line
bindkey "\033[4~" end-of-line
bindkey "[3~" delete-char
#}}}
