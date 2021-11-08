#
# .zshrc is sourced in interactive shells.
# It should contain commands to set up aliases,
# functions, options, key bindings, etc.
#

# call local setting
ZSHHOME="${HOME}/.zsh.d"

if [ -d $ZSHHOME -a -r $ZSHHOME -a \
     -x $ZSHHOME ]; then
    for i in $ZSHHOME/*; do
        [[ ${i##*/} = *.zsh ]] &&
            [ \( -f $i -o -h $i \) -a -r $i ] && . $i
    done
fi

autoload -Uz compinit && compinit

#allow tab completion in the middle of a word
setopt COMPLETE_IN_WORD

## keep background processes at full speed
#setopt NOBGNICE
## restart running processes on exit
#setopt HUP

## history
setopt APPEND_HISTORY
## for sharing history between zsh processes
#setopt INC_APPEND_HISTORY
#setopt SHARE_HISTORY

## never ever beep ever
setopt NO_BEEP

## automatically decide when to page a list of completions
#LISTMAX=0

## disable mail checking
#MAILCHECK=0

#colors
autoload -U colors

# original
## alias
alias rsh='exec -l $SHELL'
alias qsub='pjsub'
alias qu='pjstat'
alias qul='pjstat --limit'
alias quh='pjstat | head -n 20'
alias qut='pjstat | tail'
alias qdel='pjdel'
alias qcat='pjcat'
alias qnode='pjstat --nodeuse'
alias jobs='jobs -l'    # jobs 詳細を常に表示

## trash goes into .Trash
if ! [ -d ${HOME}/.Trash ]; then
    mkdir ${HOME}/.Trash
fi
  alias rm='mv --backup=numbered --target-directory=${HOME}/.Trash'
  alias rmr='mv --backup=numbered --target-directory=${HOME}/.Trash'

## ディレクトリの色を明るくする
eval `dircolors ~/.colorrc`
alias ls='ls --color=auto'
## cdでcdls関数を利用する
alias cd='cdls'
## cdコマンドの後自動でlsコマンドを実行する関数を定義
cdls () {
  \cd "$@" && ls
}

# zstyle
# まず入力された文字そのままで補完してみて
# --> それでマッチするものがなければ，小文字を大文字に変えつつ補完してみて
# --> それでもマッチするものがなければ，大文字を小文字に変えるルールを追加（`+'）して補完してみよ
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' '+m:{A-Z}={a-z}'

zstyle ':completion:*' list-colors ''       # 補完に色をつける

# setopt
setopt correct      # コマンドのスペルを訂正
setopt list_packed  # 補完候補を詰めて表示




# PATH
export PATH=$PATH:/work/gp27/share/local/bin
export PATH=$PATH:/home/p27001/dotfiles/bin/
export PATH=/work/00/gp27/share/local/miniconda3/bin:$PATH

