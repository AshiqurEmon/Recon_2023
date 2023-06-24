#!/bin/bash
#install uro qsreplace httpx anew
# openredirect.sh gau.txt openredirect_payload.txt onlydomain.txt
domain=$1
url=$2
onlydomain=$3

cat $url |while read d;do cat $1|anew|grep '='| qsreplace $d|python3 -c "import sys; from urllib.parse import unquote; print(unquote(sys.stdin.read()));"|grep $d|anew>> urls.txt;done

cat $url |while read d;do cat $1|anew|grep '='| qsreplace $d|anew>> urls.txt;done

cat urls.txt | httpx -location -x all
cat $3 |while read d;do echo $d'/'|tee -a url_slashed.txt;done
cat url_slashed.txt| httpx -mr 'webhook' -silent -x all -path $2 
rm url_slashed.txt
