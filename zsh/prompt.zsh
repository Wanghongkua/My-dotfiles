ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "

# This is an issue caused by the terminal system display
# ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%}⚡"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN=""

if [[ -z "$SSH_CLIENT" ]]; then
    prompt_host=""
else
    prompt_host="%{$reset_color%}%{$fg[yellow]%}$(hostname -s)%{$reset_color%}%{$fg[red]%}|"
fi

PROMPT='${prompt_host}%{$fg[cyan]%}%1~%{$reset_color%}%{$fg[red]%}|%{$reset_color%}$(git_prompt_info)%{$fg[cyan]%}⇒%{$reset_color%} '
