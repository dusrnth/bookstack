# BookStack

- [BookStack](https://www.bookstackapp.com/) 간편하게 사용하기 위한 초기 설정 버전
- 사내 협력사와의 커뮤니케이션 문제 해결하기 위함 및 DB 그룹 관련 데이터 통합
- Docker로 배포 및 백업
- 같은 오픈소스로 개인 위키 운영
  - https://kyupid.wiki
  - 개인위키는 AWS LightSail $3.5 요금제 활용중
  - 제공 RAM 512mb 밖에 안되지만 swap memory 사용하면 됨

## 사용법

- docker, docker compose 설치
- docker-compose up
```
docker-compose up -d
```

### 수동 백업

```
./scripts/backup.sh
```

### 자동 백업

- crontab에 scripts/backup_and_git_push.sh 실행하도록 설정
```bash
crontab -e
0 */3 * * * /path/to/bookstack/db-group-bookstack/scripts/backup_and_git_push.sh >> /path/to/bookstack/db-group-bookstack/auto_backup.log 2>&1
```

### 복구

```
./scripts/restore.sh ./backups/{{filename}}.sql
```

## 인프라

<img width=80% src=https://github.com/user-attachments/assets/30985e9a-d450-4374-9cfc-8fb6a16ee3e1></img>
