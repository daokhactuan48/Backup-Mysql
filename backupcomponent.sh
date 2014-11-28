#!/bin/bash
backup_dir="/var/lib/backups/mysql"
filenamenova="${backup_dir}/mysql-nova-`hostname`-`eval date +%d%m%Y-%H%M%S`.sql.gz"
filenamecinder="${backup_dir}/mysql-cinder-`hostname`-`eval date +%d%m%Y-%H%M%S`.sql.gz"
filenameglance="${backup_dir}/mysql-glance-`hostname`-`eval date +%d%m%Y-%H%M%S`.sql.gz"
filenamekeystone="${backup_dir}/mysql-keystone-`hostname`-`eval date +%d%m%Y-%H%M%S`.sql.gz"
filenameneutron="${backup_dir}/mysql-neutron-`hostname`-`eval date +%d%m%Y-%H%M%S`.sql.gz"
filenameinformation_schema="${backup_dir}/mysql-information_schema-`hostname`-`eval date +%d%m%Y-%H%M%S`.sql.gz"
filenameperformance_schema="${backup_dir}/mysql-performance_schema-`hostname`-`eval date +%d%m%Y-%H%M%S`.sql.gz"
filenamemysql="${backup_dir}/mysql-mysql-`hostname`-`eval date +%d%m%Y-%H%M%S`.sql.gz"
# Dump the nova MySQL database
mysqldump --opt -u root  nova | gzip > $filenamenova
# Dump the cinder MySQL database
mysqldump --opt -u root  cinder | gzip > $filenamecinder
# Dump the glance MySQL database
mysqldump --opt -u root  glance | gzip > $filenameglance
# Dump the keystone MySQL database
mysqldump --opt -u root  keystone | gzip > $filenamekeystone
# Dump the neutron MySQL database
mysqldump --opt -u root  neutron | gzip > $filenameneutron
# Dump the information_schema MySQL database
mysqldump --opt -u root  information_schema | gzip > $filenameinformation_schema
# Dump the performance_schema MySQL database
mysqldump --opt -u root  performance_schema | gzip > $filenameperformance_schema
# Dump the mysql MySQL database
mysqldump --opt -u root  mysql | gzip > $filenamemysql
# Delete backups older than 7 days
# find $backup_dir -ctime 7 -type f -delete
