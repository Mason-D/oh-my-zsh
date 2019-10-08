#!/usr/bin/env zsh 
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

setopt promptsubst

autoload -U add-zsh-hook
ROOT_ICON_COLOR=$fg_bold[green]
MACHINE_NAME_COLOR=$fg_bold[magenta]
PROMPT_SUCCESS_COLOR=$fg_bold[green]
PROMPT_FAILURE_COLOR=$fg_bold[red]
PROMPT_VCS_INFO_COLOR=$fg_bold[cyan]
PROMPT_PROMPT=$fg_bold[yellow]
GIT_DIRTY_COLOR=$fg_bold[red]
GIT_CLEAN_COLOR=$fg_bold[green]
GIT_PROMPT_INFO=$fg_bold[cyan]

# Hash
ROOT_ICON="# "
if [[ $EUID -ne 0 ]] ; then
	ROOT_ICON=""
fi

PROMPT='%{$ROOT_ICON_COLOR%}$ROOT_ICON%{$reset_color%}%{$MACHINE_NAME_COLOR%}%m➜  %{$reset_color%}%{$PROMPT_SUCCESS_COLOR%}%c%{$reset_color%} %{$GIT_PROMPT_INFO%}$(git_prompt_info)%{$GIT_DIRTY_COLOR%}$(git_prompt_status) %{$reset_color%}%{$PROMPT_PROMPT%}ᐅ %{$reset_color%} '

RPS1="${return_code}"

ZSH_THEME_GIT_PROMPT_PREFIX=": "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$GIT_PROMPT_INFO%} : "
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$GIT_DIRTY_COLOR%}✘ "
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$GIT_CLEAN_COLOR%}✔ "

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg_color[blue]%}✚ %{$rset_color%}"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg_color[blue]%}✹ %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg_color[blue]%}✖ %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg_color[blue]%}➜ %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg_color[blue]%}═ %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_color[blue]%}✭ %{$reset_color%}"
