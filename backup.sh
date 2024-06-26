#!/bin/bash

# 백업 디렉토리 설정
BACKUP_DIR=./backups
TIMESTAMP=$(date +"%Y%m%d%H%M%S")
BACKUP_FILE="$BACKUP_DIR/backup_$TIMESTAMP.tar.gz"

# 백업 디렉토리 생성
mkdir -p $BACKUP_DIR

# MySQL 데이터와 BookStack 설정을 압축하여 백업
tar -czvf $BACKUP_FILE ./bookstack/config ./bookstack_db/data

echo "Backup completed: $BACKUP_FILE"

