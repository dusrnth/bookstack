# BookStack

- BookStack을 간편하게 사용하기 위한 초기 설정 버전
- 사내 협력사와의 커뮤니케이션 문제를 해결하기 위함

## 사용법

```
docker-compose up -d
```

### 백업

```
chmod +x ./backup.sh
./backup.sh
```

### 복구

```
./restore ./backups/{{filename}}.sql
```
