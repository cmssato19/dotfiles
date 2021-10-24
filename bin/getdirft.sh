#!/bin/bash
#files="/home/p27001/cryspy-w/Li2MgSiO4_RS/2-400/work/*"

# check args
exepath=$(pwd)
if [ $# -eq 0 ]; then
  files="$(pwd)/*"
elif [ $# -eq 1 ]; then
  files="$(cd $1 && pwd)/*"
else
  echo "This script has too much arguments."
  exit
fi

# check dirs
dirary=()
for filepath in $files; do
  if [ -d $filepath ] ; then
    #echo ${filepath}
    if [[ $filepath =~ .*0000.* ]];then   # 真偽判定に正規表現が使えるようになる
      #echo "OK"
      dirary+=("$filepath")
    fi
  fi
done

# get TOTAL FORCE
Fsdir="$exepath/TOTAL-Fs"
if [ ! -d $Fsdir ]; then
  mkdir $Fsdir
fi
echo "ディレクトリ一覧"
for d in ${dirary[@]}; do
  ID=$(basename $d)
  cd $d
  cat OUTCAR | sed -ne '/TOTAL-FORCE/,/total drift/p' -ne '/Iteration/p' > "$Fsdir/$ID"
done
