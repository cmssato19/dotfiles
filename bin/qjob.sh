#!/bin/bash

files="/home/p27001/cryspy-w/Li2MgSiO4_RS/3-200/work/*"
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

echo "ディレクトリ一覧"
for i in ${dirary[@]}; do
  cd $i
  pjsub job_cryspy
  pwd

done
