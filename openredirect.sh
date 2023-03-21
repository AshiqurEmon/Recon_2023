#!/bin/bash
#install uro qsreplace httpx anew
domain=$1

url=$2

cat $url |uro|while read d;do cat $1|grep '='| qsreplace $d|python3 -c "import sys; from urllib.parse import unquote; print(unquote(sys.stdin.read()));"|grep $d|anew>> urls.txt;done

cat $url |uro|while read d;do cat $1|grep '='| qsreplace $d|anew>> urls.txt;done

cat urls.txt | httpx -location | tee -a redirect_vul_url.txt
