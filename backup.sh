#!/bin/bash

# 설정 변수
DB_CONTAINER_NAME=bookstack_db
MYSQL_USER=bookstack
MYSQL_PASSWORD=password
DATABASE_NAME=bookstackdb
BACKUP_DIR=./backups
TIMESTAMP=$(date +"%Y%m%d%H%M%S")
BACKUP_FILE="$BACKUP_DIR/backup_$TIMESTAMP.sql"

# 백업 디렉토리 생성
mkdir -p $BACKUP_DIR

# MySQL 데이터베이스 백업
docker exec -it $DB_CONTAINER_NAME /bin/bash -c "mysqldump -u $MYSQL_USER -p$MYSQL_PASSWORD $DATABASE_NAME" > $BACKUP_FILE

echo "Backup completed: $BACKUP_FILE"

