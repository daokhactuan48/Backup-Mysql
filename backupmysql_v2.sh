#!/bin/bash
# Trước khi chạy file shell này ta phải cài đặt tools ccrypt với lệnh sau: # apt-get install ccrypt
backup_dir="/var/lib/backups/mysql"
filename="${backup_dir}/mysql-`hostname`-`eval date +%d%m%Y-%H%M%S`.sql.gz"
# Dump the entire MySQL database
mysqldump --opt -u root --all-databases | gzip > $filename
# Ma hóa file với password là Admin123
ccrypt $filename -KAdmin123
