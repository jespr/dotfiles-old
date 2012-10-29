# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

function grepr {
  "grep -r ${1} *"
}

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="jespr"
RPROMPT='$GIT_PROMPT_INFO'

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(autojump git rvm bundler)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/local/bin::/Users/jespr/bin:/Users/jespr/.zendesk/bin:/Users/jespr/.zendesk/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin
# PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

export EDITOR=vim
export LC_ALL=en_US.UTF-8
export TERM=xterm-256color

alias t='bundle exec testrb -ltest $@'
alias ss='cd ~/.zendesk/workarea/zendesk ; bundle exec unicorn_rails -p 3000'
alias p='git checkout production'
alias m='git checkout master'
alias s='git checkout staging'
alias pick='git cherry-pick'
