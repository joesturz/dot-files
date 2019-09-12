alias ls="ls -lG"
alias about="archey"
alias emacs="/usr/local/Cellar/emacs/26.2/bin/emacs-26.2 -nw"
alias emacs_old="/usr/bin/emacs"
alias repos="cd /Users/Joe/Documents/Repositories"
alias backup="/Users/Joe/Documents/backup_music"
alias backup_local="/Users/Joe/Documents/backup_music_local"
alias sb="source ~/.bash_profile"
alias remote="ssh Joe@joesturz.no-ip.biz"
alias local="ssh Joe@192.168.86.64"
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
#export PS1="\u@\h \[\033[34m\]\w\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "
export PS1="⚡️🔥🔮 \[\033[34m\]\W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "
export CLICOLOR=1
#export PS1="\h:\W \u\$"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
