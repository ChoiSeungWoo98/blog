---
title: "Dockerfile 기초"
date: 2024-07-10T16:16:44+09:00
draft: false
author: "choiseU"
tags: ["KakaoTechBootCamp", "BootCamp", "Docker"]
categories: ["KakaoTechBootCamp", "Docker"]
---
> 어제는 도커의 개념과 동작 방식에 대해 정리하였습니다.  
> 오늘은 docker를 실질적으로 사용해보면서 필요한 내용을 정리해보고자 합니다.  

## Dockerfile
***
#### 개념
이미지 생성 목적으로 작성되는 파일

#### 특징
- 환경 일관성 : 개발, 테스트, 운영 등 모든 환경에서 동일한 설정 유지
- 이식성 : 다양한 운영체제에서 동일하게 동작
- 자동화 : CI/CD 파이프라인 과정에서 빌드 및 배포 과정 자동화
- 반복 가능성 : 동일한 방식으로 이미지를 빌드해 반복 가능한 환경 제공
- 확장성 : 마이크로 아키텍처를 이용해 쉽게 확장

#### 지시자

<img style="margin-left: 60px; width: 500px;" src="/img/posts/docker/dockerfile-지시자.png">
<img style="margin-left: 60px; width: 500px;" src="/img/posts/docker/dockerfile-지시자2.png">

<div style="height: 50px;"></div>

## Dockerfile 만들기
***
#### 이미지 크기 최적화
- 멀티 스테이지 빌드 사용 : 불필요한 빌드 종속성 제거
- 불필요한 파일 제외 : .dockerignore을 사용해 빌드에 포함되지 않아도 되는 파일 제외
- 불필요한 패키지 설치 X

```dockerfile
FROM golang:1.16 as builder WORKDIR /app
COPY . .
RUN go build -o myapp

FROM alpine-latest
WORKDIR /app
COPY --from=builder /app/myapp . CMD ["./myapp"]
```

#### 레이어 캐싱 활용
- 변경이 적은 레이어 위에 변경이 잦은 레이어 위치 : 자주 변경되는 파일보다 덜 변경되는 파일을 추가해 빌드 캐시 최대한 활용
- OverayFS(Upperdir, Lowerdir, Workdir, Merged)

```dockerfile
COPY package*.json ./ RUN npm install
COPY . .
```

#### 보안 고려
- 최소 권한 원칙 : 루트 권한이 아닌 사용자로 애플리케이션 실행
- 최신 베이스 이미지 사용 : 보안 패치가 적용된 상태 유지
- 비밀 정보 제외 : 환경 변수나 소스 코드에 비밀 정보가 포함되지 않도록 주의

#### 성능 최적화
- 적절한 베이스 이미지 선택 : 필요에 맞는 가장 작은 베이스 이미지 선택
- 의존성 최소화 : 필요한 라이브러리, 도구만 설치

#### 유지 관리 용이성
- 명확하고 일관된 Dockerfile 작성 : 주석 추가 및 지사자의 목적을 설명하고 일관된 코드 스타일 유지

```dockerfile
# 베이스 이미지 설정
FROM node:14

# 작업 디렉토리 설정
WORKDIR /app

# 의존성 설치
COPY package*.json ./ RUN npm install

# 애플리케이션 소스 코드 복사
COPY . .

# 컨테이너 시작 명령어
CMD ["npm", "start"]
```

#### 유지 관리 용이성
- 명확하고 일관된 Dockerfile 작성 : 주석 추가 및 지사자의 목적을 설명하고 일관된 코드 스타일 유지

```dockerfile
# 베이스 이미지 설정
FROM node:14

# 작업 디렉토리 설정
WORKDIR /app

# 의존성 설치
COPY package*.json ./ RUN npm install

# 애플리케이션 소스 코드 복사
COPY . .

# 컨테이너 시작 명령어
CMD ["npm", "start"]
```

#### 환경 변수 사용
- ENV 지시자나 ARG 지시자를 사용해 환경 변수 설정
  - ARG
    - Docker build 시간에 사용되는 변수로 빌드 할 때만 유효하며 컨테이너가 실행될 때는 사용 불가
    - 사용방법
      ```dockerfile
      FROM alpine
    
      ARG MY_ARG
    
      RUN echo "Build-time argument: $MY_ARG"
    
      ENV MY_ENV=$MY_ARG
    
      ARG DEFAULT_ARG=default_value
    
      RUN echo "Default argument: $DEFAULT_ARG"
      ```shell
      docker build --build-arg MY_ARG=my_value -t my_image .

      # 빌드할 때 MY_ARG의 값을 넘겨준다.
      docker build --build-arg MY_ARG=my_value -t my_image .
      ```
  - ENV : 컨테이너 실행 시간에 사용할 환경 변수
    - 사용방법
      ```dockerfile
      # ENV 사용 예시
      FROM alpine
      
      ENV MY_ENV=my_value
      
      RUN echo "Environment variable: $MY_ENV"
      
      ENV MY_ENV=another_value
      
      RUN echo "Overridden environment variable: $MY_ENV"
      ```
      ```shell
      docker run -e MY_ENV=runtime_value my_image
      ```

<div style="height: 50px;"></div>

## Dorkerfile DeepDive
***
#### Multi-Stage Build
- Dockerfile 작성 시 여러 단계를 사용해 이미지를 빌드하는 기법
- 빌드에만 필요한 툴, 라이브러리 또는 불필요한 파일, 도구는 최종 이미지에서 제거해 보안 강화 및 크기 감소 효과
- 여러 단계로 빌드를 나누어 관리 용이

```dockerfile
# Go 언어 이미지를 기반으로 설정 (golang:1.16)
FROM golang:1.16 AS builder

# 작업 디렉토리 설정 (/app).
WORKDIR /app

# 소스 코드 복사.
COPY . .

# 애플리케이션 빌드 (go build).
RUN go build -o myapp .

# 경량의 Alpine Linux 이미지를 기반으로 설정
FROM alpine:latest

# 작업 디렉토리 설정 (/app).
WORKDIR /app

# builder 스테이지에서 빌드된 애플리케이션 복사.
COPY --from=builder /app/myapp .

# Expose port 8080
EXPOSE 8080

# 애플리케이션 실행 (CMD ["./myapp"]).
CMD ["./myapp"]
```

#### Layer Caching
- 이전에 빌드된 레이어를 캐시하여 빌드 속도 향상시키는 기술
- 각 레이어가 해시를 사용해 동일한 명령어와 결과를 생성하면 이전에 빌드된 레이어 재사용
- Dockerfile에 명령어가 변경되면 그 이후 모든 레이어 다시 빌드

```dockerfile
# Node.js 이미지를 기반으로 설정.
FROM node:14

#  package.json 파일을 복사. 이 레이어는 종속성을 설치하는 데 사용됩니다.
COPY package.json /app/

# 작업 디렉토리 설정 (/app).
WORKDIR /app

# 종속성을 설치. package.json이 변경되지 않으면 이 레이어는 캐시됩니다.
RUN npm install

# 나머지 소스 코드를 복사. 이 명령어가 변경되면 이후 레이어는 다시 빌드됩니다.
COPY . /app

# 애플리케이션을 빌드.
RUN npm run build

# 애플리케이션 시작
CMD ["npm", "start"]
```

#### 최적화
이전에 작성해 놓은 부분 참고 [Docker 개론](https://choiseungwoo98.github.io/docker_basic.html#최적화-방법) 

<div style="height: 50px;"></div>

## Docker 저장소
***
#### Docker Hub
- 이미지 호스팅 서비스 : 개인이 이미지를 만들어 배포 가능, 공식 저장소의 소프트웨어 포함
- Docker Local Registry : 로컬 환경에서 관리 및 사용 가능

<div style="height: 50px;"></div>

## 오늘의 실습
***
- dockerfile을 통해 이미지를 만들고 Docker Hub에 repository 생성하기 및 내려받기
```shell
# 테스트 폴더 생성
mkdir dockerfile-test

# Dockerfile 파일, 간단한 테스트용 Python 파일, 필요한 패키지와 버전을 명시하는 requirements 파일 생성
touch Dockerfile app.py requirements.txt

# 파일 내용 수정(상황에 맞게 작성)
cat Dockerfile
# Docker 로그인
docker login

# 이미지 빌드
docker -f Dockerfile -t <user-name>/<repo-name> .

# 내 레포지토리에 이미지 생성
docker push <user-name>/<repo-name>

# 실행 및 컨테이너 접속
docker run -it <Container> /bin/bash

# Docker 객체에 대한 자세한 정보 출력
docker inspect <Container_id or name>

# 이미지 실행 반복적으로
docker run -d <image> sleep infinity

# 실행되고 있는 컨테이너의 모든 아이디 값 가져오기
docker ps -q

# 실행되고 있는 컨테이너 전체 종료
docker stop $(docker ps -q)

# 생성한 레포지토리에서 이미지 내려받기
docker pull <user-name>/<repo-name>
```
<div style="height: 50px;"></div>
