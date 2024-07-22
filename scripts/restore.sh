#!/bin/bash

source ../.env

# 설정 변수
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

# Docker Compose 업
docker-compose up -d

# MySQL 컨테이너가 정상적으로 기동될 때까지 대기
echo "Waiting for MySQL to start..."
until docker exec -it $DB_CONTAINER_NAME mysqladmin ping -u $MYSQL_USER -p$MYSQL_PASSWORD --silent; do
  sleep 1
done

# 데이터베이스 복원
cat $BACKUP_FILE | docker exec -i $DB_CONTAINER_NAME /bin/bash -c "mysql -u $MYSQL_USER -p$MYSQL_PASSWORD $DATABASE_NAME"

echo "Restoration completed: $BACKUP_FILE"

