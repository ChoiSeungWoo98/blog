---
title: "[Docker] Docker Compose에 대해"
date: 2024-07-11T13:13:32+09:00
draft: false
author: "choiseU"
tags: ["Docker"]
categories: ["Docker"]
---
> 오늘은 docker compose에 대해 배웠습니다.  
> 이론이 많지는 않았지만  
> 앞으로 자주 사용할 것이란 생각이 들어 실습까지 다시 진행하며 복습하겠습니다.   

## Docker compose
***
#### 개념
- 여러 Docker Continer를 정의하고 실행할 수 있도록 도와주는 도구
- docker-compose.yaml 파일을 사용해 서비스, 네트워크, 볼륨 등을 정의

#### 기능
- 멀티 컨테이너 애플리케이션 정의 : docker-compose-yaml 파일을 통해 여러 컨테이너 정의
- 서비스 간 의존성 관리 : 여러 컨테이너 간의 의존성을 정의하고, 필요한 순서에 따라 컨테이너 시작
- 일관된 개발 환경 제공 : 동일한 docker-compose.yaml 파일을 사용해 로컬 개발환경과 프로덕션 환경을 일관되게 설정
- 간편한 실행 및 종료 : docker compose up / down을 사용해 한번에 시작 및 종료 가능

#### 기능 설명
- build
  - context : Dockerfile이 있는 디렉토리 지정
  - dockerfile : Dockerfile 경로 지정
- image : 기존에 존재하는 이미지를 사용할 때 사용할 이미지 지정
- ports : 호스트와 컨테이너 간의 포트 매핑 지정
- environment : 컨테이너 내에서 사용할 환경 변수 지정
- volumes : 호스트와 컨테이너 간의 파일 시스템 마운트를 지정
- depends_on : 컨테이너 간의 의존성 지정(Ex : db 서비스 시작 후 web 서비스 시작)
- networks : 서비스가 연결될 네트워크 지정
- restart : 컨테이너 재시작 정책
- (전역)volumes : 네트워크 정의, 서비스에서 네트워크 사용 전 전역에 정의
- (전역)networks : 서비스에서 네트워크 사용 전 전역에 정의

#### 실습
```shell
# 이미지를 내려받는다
docker pull <이미지명>

# Docker 이미지를 백그라운드에 무한히 실행되는 컨테이너 시작
docker run -d <이미지명> sleep infinity

# 실행한 이미지 접속
docker exec <컨테이너명> /bin/bash

# Docker 내부 파일 로컬에 복사
docker cp <컨테이너명>:/<복사할 파일명> <복사할 위치>

# Docker compose를 백그라운드로 실행
docker compose -f <실행할 yaml명> up -d

# 현재 디렉토리의 Docker-compose.yaml로 정의된 모든 컨테이너 표시
docker compose ps -a

# Docker compose 종료
docker compose down
```