### ZSH
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="jespr"
RPROMPT='$GIT_PROMPT_INFO'
plugins=(autojump git)
source $ZSH/oh-my-zsh.sh

[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

### PATH AND STUFF
export PATH=/usr/local/sbin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=~/dotfiles/bin:$PATH
export EDITOR=vim
export TERM=xterm-256color
export PKG_CONFIG_PATH=/usr/X11/lib/pkgconfig/:$PKG_CONFIG_PATH
export TERM='xterm-256color'

#eval "$(/Users/jespr/zendesk/z/bin/z init -)"

### ALIASES
alias classic='cd ~/zendesk/zendesk'
alias lotus='cd ~/zendesk/zendesk_console'
alias reporting='cd ~/zendesk/zendesk_reporting'
alias t='bundle exec testrb -ltest $@'
alias fs='foreman start'
alias global-off='sudo mv /Applications/GlobalProtect{,OFF}.app && pkill -9 -f GlobalProtect'
alias global-on='sudo mv /Applications/GlobalProtect{OFF,}.app'
alias be='bundle exec'
alias work='VERBOSE=true QUEUES=* bundle exec rake environment resque:no_fork resque:work'

### GIT ALIASES
alias gpr='git pull --rebase'
alias ga='git add .'
alias pick='git cherry-pick'

# CHRUBY
RUBIES=(/Users/jespr/.rubies/rub*)
source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh
chruby 2.0.0

# added by travis gem
[ -f /Users/jespr/.travis/travis.sh ] && source /Users/jespr/.travis/travis.sh
