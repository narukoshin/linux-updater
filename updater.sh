#!/bin/bash

main_dir="/root/linux-updater"
updates_to_install=$(apt update 2>&1 | egrep -o "[0-9]+ package(s?) can be upgraded." | egrep -o "[0-9]+")
update_log="$main_dir/logs/$(date +"%d-%m-%Y_%H-%M-update").log"

# checking if the logs folder exists; creates if it doesn't 
if [[ ! -d "$main_dir/logs" ]]; then
        mkdir $main_dir/logs
fi

# checking for updates and installing them

if [[ updates_to_install -gt 0 ]]; then
        echo "[+] There are $updates_to_install packages to update" >> $update_log
        echo "$(apt list --upgradeable 2>&1)" >> $update_log
        export DEBIAN_FRONTEND=noninteractive
        apt upgrade -y >> $update_log 2>&1
        apt autoremove -y > /dev/null # removing the files that aren't necessary anymore.
fi

# creating an archive for previous month

if (( $(date +"%-d") == 1 )); then
    prev_month=`expr $(date +"%m") - 1`
    if [[ $prev_month -lt 10 ]]; then
        prev_month="0$prev_month"
    fi
    archive_name=$(date -d $(date +"%Y-$prev_month-%d") '+%B-%Y').tar.gz
    # changing the working directory
    cd $main_dir/logs
    # archiving the files.
    tar zcvf $archive_name *-$prev_month-$(date +"%Y")* --remove-files > /dev/null
    
fi
