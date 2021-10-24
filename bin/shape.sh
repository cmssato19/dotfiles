#!/bin/bash
file="/home/p27001/cryspy-w/Li2MgSiO4_RS/2-400/work/Total-Fs/000000"

iter=$(grep -E "Iteration *1\(" $file)
echo $iter
#for i in ${iter[@]};do
#  #echo $i
#done
