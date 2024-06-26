#!/bin/bash

# 복원할 백업 파일 지정
BACKUP_FILE=$1

# 백업 파일이 지정되지 않았을 경우 오류 메시지 출력
if [ -z "$BACKUP_FILE" ]; then
  echo "Usage: $0 <backup_file>"
  exit 1
fi

# 백업 파일이 존재하는지 확인
if [ ! -f $BACKUP_FILE ]; then
  echo "Backup file not found: $BACKUP_FILE"
  exit 1
fi

# Docker Compose 다운
docker-compose down

# 기존 데이터를 삭제
rm -rf ./bookstack/config/*
rm -rf ./bookstack_db/data/*

# 백업 파일에서 데이터 복원
tar -xzvf $BACKUP_FILE

# Docker Compose 다시 시작
docker-compose up -d

echo "Restoration completed: $BACKUP_FILE"

