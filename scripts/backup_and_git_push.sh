#!/bin/bash

# 이동할 Git 저장소 경로 설정
cd /home/ec2-user/bookstack/db-group-bookstack || { echo "Failed to change directory. Directory does not exist. Exiting script."; exit 1; }

# Git 리셋 - 충돌나지 않도록
git fetch --all
git reset --hard origin/main

################### BACKUP START ######################

/home/ec2-user/bookstack/db-group-bookstack/scripts/backup.sh

###################### BACKUP END #####################

# Git 변경사항 추가
git add .

# 현재 날짜와 시간을 커밋 메시지로 사용
commit_message="Auto commit on $(date '+%Y-%m-%d %H:%M:%S') UTC"

# 변경사항 커밋
git commit -m "$commit_message"

# 변경사항 푸시
git push -u origin main

