#!/bin/bash

cd ../../../../../../dev
echo $PWD

cat urandom |
    head -c 40 |
    tr a-z A-Z | tr -cd A-Z > ../home/napnap/Studia/SO2/SO2_L/Lab3/Wynik.txt 

echo