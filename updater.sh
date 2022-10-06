#!/bin/bash

updates_to_install=$(apt update 2>&1 | egrep -o "[0-9]+ package(s?) can be upgraded." | egrep -o "[0-9]+")
update_log="/root/updater/logs/$(date +"%d-%m-%Y_%H-%M-update").log"

# checking for updates and installing them

if [[ updates_to_install -gt 0 ]]; then
        echo "[+] There's $updates_to_install packages to update" >> $update_log
        echo "$(apt list --upgradeable 2>&1)" >> $update_log
        export DEBIAN_FRONTEND=noninteractive
        apt upgrade -y >> $update_log 2>&1
fi

# creating an archive for previous month

if (( $(date +"%-d") == 1 )); then
    prev_month=0`expr $(date +"%m") - 1`
    archive_name=$(date -d $(date +"%Y-$prev_month-%d") '+%B-%Y').tar.gz
    tar -zcvf /root/updater/logs/$archive_name /root/updater/logs/*-$prev_month-$(date +"%Y")* --remove-files > /dev/null
fi
