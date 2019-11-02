#!/bin/bash
DB_USER='';
DB_PASS='';
DB='';

echo "Type in database username"
read DB_USER

echo "Type in database password"
stty -echo
read DB_PASS
stty echo

DATABASES=`mysql --user=$DB_USER -p$DB_PASS -e "SHOW DATABASES;" | grep -Ev "(Database|information_schema|performance_schema|sys)"`
echo "";

for DB in $DATABASES
do
    DATE=`date +%Y_%m_%d_%H_%M_%S`
    FILENAME=$DB"__"$DATE"_dump.sql"
    echo -e "--- Dumping \033[0;31m$DB\033[0;m --> $FILENAME"
    mysqldump -u$DB_USER -p$DB_PASS $DB --routines=true --triggers=true --events=true | gzip -9 >> $FILENAME.gz
done

echo ""
echo -e "\033[0;32mDone.\033[0;m"

