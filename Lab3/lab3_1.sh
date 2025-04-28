#!/bin/bash

cd ../../../../../../dev
echo $PWD

cat urandom | 
    tr -cd 0-9 | 
    head -c 40 |
    tee ../home/napnap/Studia/SO2/SO2_L/Lab3/A.txt | 
    tr 0 O | 
    tee ../home/napnap/Studia/SO2/SO2_L/Lab3/B.txt

echo