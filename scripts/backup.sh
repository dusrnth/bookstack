#!/bin/bash

source /home/ec2-user/bookstack/db-group-bookstack/.env

# 설정 변수
BACKUP_FILE="backup.sql"
BACKUP_FILE_PATH="$BACKUP_DIR/$BACKUP_FILE"

# 백업 디렉토리 생성
mkdir -p $BACKUP_DIR

# MySQL 데이터베이스 백업
docker exec -it $DB_CONTAINER_NAME /bin/bash -c "mysqldump -u $MYSQL_USER -p$MYSQL_PASSWORD $DATABASE_NAME" > $BACKUP_FILE_PATH

echo "Backup completed: $BACKUP_FILE_PATH"

