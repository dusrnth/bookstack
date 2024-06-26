# BookStack

- bookstack 쉽게 사용하기 위한 init 버전

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
