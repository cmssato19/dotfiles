# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=
export PATH=$PATH:/home/p27001/dotfiles/bin/

# User specific aliases and functions
alias rsh='exec -l $SHELL'
alias qsub='pjsub'
alias qu='pjstat'
alias qul='pjstat --limit'
alias quh='pjstat | head -n 20'
alias qut='pjstat | tail'
alias qdel='pjdel'
alias qcat='pjcat'
alias qnode='pjstat --nodeuse'

# trash goes into .Trash
if [ -d ${HOME}/.Trash ]
then
  alias rm='mv --backup=numbered --target-directory=${HOME}/.Trash'
  alias rmr='mv --backup=numbered --target-directory=${HOME}/.Trash'
fi

# ディレクトリの色を明るくする
eval `dircolors ~/.colorrc`
alias ls='ls --color=auto'
# cdでcdls関数を利用する
alias cd='cdls'
# cdコマンドの後自動でlsコマンドを実行する関数を定義
cdls () {
  \cd "$@" && ls
}
# jobs 詳細を常に表示
alias jobs='jobs -l'
