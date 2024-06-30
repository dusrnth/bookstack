FROM alpine:latest

# msmtp 설치
RUN apk --no-cache add msmtp ca-certificates

# 설정 파일 복사
COPY msmtprc /etc/msmtprc

# 설정 파일 권한 설정
RUN chmod 600 /etc/msmtprc

# 이미지 실행 명령어
CMD ["sh", "-c", "tail -f /dev/null"]

