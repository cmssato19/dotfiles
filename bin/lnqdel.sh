#!/bin/bash

if [ $# -lt 2 ]; then
    echo "This script has too few arguments."
    exit
else
    # check args
    echo ${#}
    if [ ${#} -eq 2 ];then
        st=$1
        end=$2
    else
        echo "This script has too much arguments."
        exit
    fi
    # 連番
    for i in `seq $1 $2`;do
        pjdel $i
    done
fi
