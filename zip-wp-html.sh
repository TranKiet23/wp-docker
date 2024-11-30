#!/bin/bash

BACKUP_FILE_FORMAT="php"
# Declare datetime variables from current datetime
CURRENT_DATE=$(date +"%Y_%m_%d")
CURRENT_TIME=$(date +"%H-%M-%S")
CURRENT_TIMESTAMP=$(date "+%s")

zip_wp_site() {
    read -p "Enter your directory name (Ex: wp-html): " dir
    full_dir=$(pwd)/$dir
    echo "Your current directory: $full_dir"
    if [[ ! -d "$full_dir" ]]; then
        echo -e "Directory $full_dir does not exist!!!"
        exit 1
    fi

    local BACKUP_FILES=("$full_dir"/*."$BACKUP_FILE_FORMAT")
    echo "BACKUP_FILES:   ${#BACKUP_FILES[@]}"
    if [ ${#BACKUP_FILES[@]} -eq 0 ]; then
        echo -e "\nThis is an empty directory!!!"
        exit 1
    fi
    cd $full_dir
    mkdir htdocs
    tar -cC $full_dir --exclude='htdocs' --exclude='htdocs.zip' --exclude='wp-config.php' --exclude='readme.html' -cf - . | tar -xf - -C htdocs
    file_name=htdocs_$CURRENT_DATE_$CURRENT_TIMESTAMP.zip
    # zip -r $file_name htdocs/
    zip -r htdocs.zip htdocs/
    rm -rf htdocs/
}
dump_mysql_db() {

}

zip_wp_site
dump_mysql_db