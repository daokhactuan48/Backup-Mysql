#!/bin/bash
# Cai dat ccrypt truoc khi chay shell: # apt-get install ccrypt
backup_dir="/var/lib/backups/mysql"
filenamenova="${backup_dir}/mysql-nova-`hostname`-`eval date +%d%m%Y-%H%M%S`.sql.gz"
filenamecinder="${backup_dir}/mysql-cinder-`hostname`-`eval date +%d%m%Y-%H%M%S`.sql.gz"
filenameglance="${backup_dir}/mysql-glance-`hostname`-`eval date +%d%m%Y-%H%M%S`.sql.gz"
filenamekeystone="${backup_dir}/mysql-keystone-`hostname`-`eval date +%d%m%Y-%H%M%S`.sql.gz"
filenameneutron="${backup_dir}/mysql-neutron-`hostname`-`eval date +%d%m%Y-%H%M%S`.sql.gz"
filenameinformation_schema="${backup_dir}/mysql-information_schema-`hostname`-`eval date +%d%m%Y-%H%M%S`.sql.gz"
filenameperformance_schema="${backup_dir}/mysql-performance_schema-`hostname`-`eval date +%d%m%Y-%H%M%S`.sql.gz"
filenamemysql="${backup_dir}/mysql-mysql-`hostname`-`eval date +%d%m%Y-%H%M%S`.sql.gz"
# backup database nova 
mysqldump --opt -u root nova | gzip > $filenamenova
# Ma hoa file voi password la Admin123
ccrypt $filenamenova -KAdmin123
# backup database cinder 
mysqldump --opt -u root cinder | gzip > $filenamecinder
ccrypt $filenamecinder -KAdmin123
# backup database glance 
mysqldump --opt -u root glance | gzip > $filenameglance
ccrypt $filenameglance -KAdmin123
# backup database keystone 
mysqldump --opt -u root keystone | gzip > $filenamekeystone
ccrypt $filenamekeystone -KAdmin123
# backup database neutron 
mysqldump --opt -u root neutron | gzip > $filenameneutron
ccrypt $filenameneutron -KAdmin123
# backup database information_schema
mysqldump --opt -u root information_schema | gzip > $filenameinformation_schema
ccrypt $filenameinformation_schema -KAdmin123
# backup database performance_schema
mysqldump --opt -u root performance_schema | gzip > $filenameperformance_schema
# backup database mysql
mysqldump --opt -u root mysql | gzip > $filenamemysql
ccrypt $filenamemysql -KAdmin123
