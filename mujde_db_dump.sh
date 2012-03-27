#!/bin/bash
mysqldump=$MUJDE_HOME/mysql/faal/bin/mysqldump
mysql=$MUJDE_HOME/mysql/faal/bin/mysql
echo "mysqldump: $mysqldump"
echo "mysql: $mysql"
database=`rails runner 'print Rails.configuration.database_configuration[Rails.env]["database"]'`
echo "database: $database"
tables= $mysql -u root -p123456 -D $database -Bse "show tables like 'student%';"
$mysqldump -h 127.0.0.1 -u root -p123456 $database $tables > db/mujde_dump/last_dump
#ls -lah db/mujde_dump/last_dump

