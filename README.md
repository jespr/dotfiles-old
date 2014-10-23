# Dotfiles

These are my personal dotfiles

## Git aliases

`git create branch_name`
Creates a new branch prefixed with my github username, jespr (hardcoded for now).

`git switch branch_name`
Switches to `jespr/branch_name` or `master` if you specify that.

`git pbr`
Runs a git pull --rebase, bundle install and touches `tmp/restart.txt` if it exists.
