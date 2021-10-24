#!/bin/bash
#files="/home/p27001/cryspy-w/Li2MgSiO4_RS/2-400/work/*"

# check args
if [ $# -lt 1 -o $# -ge 2 ]; then
  echo "This script has too few/much arguments."
  exit
else
  path=$(pwd)
  files="$(cd $path && pwd)/*"
  #echo $files
fi

# check dirs
dirary=()
for filepath in $files; do
  if [ -d $filepath ] ; then
    dirary+=("$filepath")
    #echo ${filepath}
    #if [[ $filepath =~ .*0000.* ]];then   # 真偽判定に正規表現が使えるようになる
    #  #echo "OK"
    #  dirary+=("$filepath")
    #fi
  fi
done

# print dirs
echo "ディレクトリ一覧"
for d in ${dirary[@]}; do
  #cd $d
  echo $(basename $d)

done
