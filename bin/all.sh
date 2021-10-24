#!/bin/bash
function check_qu(){
  if pjstat | grep -q 'No unfinished job found'; then
    echo True
  else
    echo False
  fi
}

function check_cryspy_done(){
  if tail "$now/log" | grep -q 'Done all structures!'; then
    echo True
  else
    echo False
  fi
}

function check_lock_cryspy(){
  if [ -e "$now/lock_cryspy" ]; then
    echo True
  else
    echo False
  fi
}

# ----- main
now=$(pwd)    #実行地
echo $now

# cryspy.inからnstageを抜き取る
if [ -e "$now/cryspy.in" ]; then
  nstage_line=`grep nstage $now/cryspy.in`
  if [ ${nstage_line:0:1} = "#" ]; then   # nstageをコメントアウト
    nstage=1
  else
    nstage=`echo $nstage_line | grep -o "[0-9]*"`
  fi
else
  echo "you don't have cryspy.in"
  exit
fi

# 構造生成
echo 'cryspy'
time=60    # 実行間隔(秒)
while [ check_lock_cryspy = "False" ]
do
  sleep $time
done


# nstageの数だけcrypsyを実行
for i in `seq $nstage`
do
  echo "cryspy"
  while [ check_qu = "False" ]
  do
    sleep $time
  done
done

# 構造の回収
echo "cryspy"
if [check_cryspy_done == True]; then
  echo "well done!"
else
  echo "occur problem!"
fi

