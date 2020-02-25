# vim:fileencoding=utf-8:ft=conf:foldmethod=marker
# #
# #      _________        ______  _
# #     {_______  }      /  ____}{ }
# #           /  /      {  |___  { }       ____     ____
# #         /  /         \____ \ { }__    {    }   {  __}
# #   _  /  /_____       ____|  }{ __ }   { |\ \   { |__
# #  {_}{_________}OOMER{______/ {_}{_}ELL{_| \_}un{____}ommands

bindkey -e
pfetch


#: Separator {{{
SP='▓▒░'

if [[ -z $RSP ]]; then
	RSP=`echo $SP | rev`
fi

source ~/.zsh-git
setopt PROMPT_SUBST

#: Colors {{{
C1="%{[48;05;170m%}"
C2="%{[107;30m%}"
C3="%{[34;7m%}"
C4="%{[34m%}"
C5="%{[0m%}"
C6="%{[7;46m%}"
#}}}

export PS1=$'%(1j.$C1 %j .)$C2 %n@%{[1m%}$C4%m $C3$SP %{[22;40m%}%1~ %{[34m%}$(prompt_git)%{[49;27m%}$SP %{[0m%}'
export RPS1=$'%(0?.$C5$RSP%{[7m%} %?.$C5$RSP$C6 %?) %{[0m%}'
export PS2=$'$C4%{[21;7m%} %_ %{[27;49m%}$SP%{[0m%} '
export PS3=$'$C3 SELECT %{[49;27m%}$SP%{[0m%} '
#}}}

#: Aliases {{{
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias pkg='sudo pacman'
alias ls='ls --color'
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
