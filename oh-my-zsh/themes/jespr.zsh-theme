# ZSH Theme - Preview: http://img.skitch.com/20091113-qqtd3j8xinysujg5ugrsbr7x1y.jpg
function collapse_pwd {
    echo $(pwd | sed -e "s,^$HOME,~,")
}


PROMPT='%{$fg[cyan]%}%n%{$reset_color%} %~ $(git_prompt_info)%{$reset_color%}%B»%b '
RPROMPT='%T'
# RPS1="${return_code}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %{$reset_color%}"
