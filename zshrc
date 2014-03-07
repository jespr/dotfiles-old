### ZSH
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="jespr"
RPROMPT='$GIT_PROMPT_INFO'
plugins=(autojump git)
source $ZSH/oh-my-zsh.sh

[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

### PATH AND STUFF
export EDITOR=vim
export TERM=xterm-256color
export TERM='xterm-256color'

### ALIASES
alias classic='cd ~/zendesk/zendesk'
alias lotus='cd ~/zendesk/zendesk_console'
alias reporting='cd ~/zendesk/zendesk_reporting'
alias t='bundle exec testrb -ltest $@'
alias fs='foreman start'
alias be='bundle exec'
alias work='script/resque-work'
alias restart='touch tmp/restart.txt'
alias ttr='touch tmp/restart.txt'

### GIT ALIASES
alias gpr='git pull --rebase'
alias ga='git add .'
alias pick='git cherry-pick'
alias re='touch tmp/restart.txt'

# added by travis gem
[ -f /Users/jespr/.travis/travis.sh ] && source /Users/jespr/.travis/travis.sh
