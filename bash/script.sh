#!/bin/bash
while true; do
    cp "/var/www/access.log" "/var/www/log1.txt"
    awk '$9 ~ /^4[0-9][0-9]$/ { print }' "/var/www/log1.txt" > "/var/www/log3.txt"
    awk '$9 ~ /^5[0-9][0-9]$/ { print }' "/var/www/log1.txt" > "/var/www/log4.txt"
    if [ $(stat -c%s "/var/www/log1.txt") -ge 307200 ] 
    then
    echo "$(date) - дата удаления лога, удалено строк: $(wc -l "/var/www/log1.txt" | awk '{print $1}')" >> "/var/www/log2.txt"
    echo > /var/www/log1.txt
    echo > /var/www/access.log
    fi
    sleep 5
done
