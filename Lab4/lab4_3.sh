#!/bin/bash

declare -i view_count=0
while true
do
    view_count=$view_count+1
    echo -e "HTTP/1.1 200 OK\n\n<h1>$(date +%F_%H-%M-%S)</h1>\n<h1>Ilosc wyswietlen: $view_count</h1>" > index.html
    cat index.html | nc -lN 8080
done

# opisać curl i nc ( i opcje )