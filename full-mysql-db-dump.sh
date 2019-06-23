DB_USER='';
DB_PASS='';
DB='';
DATE=`date +%Y_%m_%d_%H_%M_%S`

echo "Type in database user"
read DB_USER

echo "Type in database password"
stty -echo
read DB_PASS
stty echo

echo "Type in database name"
read DB

FILENAME=$DB"__"$DATE"_dump.sql"

echo "DUMP"

mysqldump -u$DB_USER -p$DB_PASS $DB \
--routines=true \
--triggers=true \
| gzip -9 >> $FILENAME.gz

echo "DONE"
