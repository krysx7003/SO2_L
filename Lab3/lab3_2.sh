#!/bin/bash

cd ../../../../../../dev
echo $PWD

cat urandom |
    tr a-z A-Z |
    tr -cd 0-9 |
    head -c 7 > ../home/napnap/Studia/SO2/SO2_L/Lab3/Wynik.txt 

echo