# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="jespr"

function grepr {
  "grep -r ${1} *"
}

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
RPROMPT='$GIT_PROMPT_INFO'

# if [ -e /usr/share/terminfo/x/xterm-256color ]; then
  export TERM='xterm-256color'
# else
#   export TERM='xterm-color'
# fi

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(autojump git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/local/bin::/Users/jespr/bin:/Users/jespr/.zendesk/bin:/Users/jespr/.zendesk/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/Users/jespr/.zendesk/workarea/z/bin
export EDITOR=vim
export LC_ALL=en_US.UTF-8
export TERM=xterm-256color
export PKG_CONFIG_PATH=/usr/X11/lib/pkgconfig/:$PKG_CONFIG_PATH





# ruby version
chruby 1.9.3-p125


# eval "$(rbenv init -)"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

alias classic='cd ~/.zendesk/workarea/zendesk'
alias lotus='cd ~/.zendesk/workarea/zendesk_console'
alias reporting='cd ~/.zendesk/workarea/zendesk_reporting'
alias t='bundle exec testrb -ltest $@'
alias ss='cd ~/.zendesk/workarea/zendesk ; bundle exec unicorn_rails -p 3000'
alias p='git checkout production'
alias m='git checkout master'
alias s='git checkout staging'
alias pick='git cherry-pick'
alias fs='bundle exec foreman start'
alias ga='git add .'
alias gca='git commit --amend'
alias global-off='sudo mv /Applications/GlobalProtect{,OFF}.app && pkill -9 -f GlobalProtect'
alias global-on='sudo mv /Applications/GlobalProtect{OFF,}.app'
alias be='bundle exec'
export PATH="$HOME/.rbenv/bin:$PATH"
