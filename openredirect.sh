#!/bin/bash
#install uro qsreplace httpx anew
domain=$1

url=$2

cat $url |while read d;do cat $1|uro|grep '='| qsreplace $d|python3 -c "import sys; from urllib.parse import unquote; print(unquote(sys.stdin.read()));"|grep $d|anew>> urls.txt;done

cat $url |while read d;do cat $1|uro|grep '='| qsreplace $d|anew>> urls.txt;done

cat urls.txt | httpx -location |grep -Fv '[]'| tee -a redirect_vul_url.txt
