---
title: "[Docker] Docker는 뭘까?"
date: 2023-03-17T01:03:57+09:00
draft: false
author: "choiseU"
tags: ["Docker"]
categories: ["Docker"]
---
> Mysql을 사용하여 프로젝트를 하나 진행 중이었습니다.  
> 해당 프로젝트가 끝나고 새로운 프로젝트를 진행하게 되었는데,  
> 새로운 프로젝트에서는 MariaDB를 사용해야하는 상황이었고,
> Mysql과 MariaDB는 서로 프로토콜, 프로세스 명, 명령어 등을 쉐어하고 있다고 알려져 있어
> MySql이 설치되어있는 상황에서 MariaDB를 다운하면 충돌이 발생하고  
> MySql을 지우고 다운받을 수 없는 상황이라 동시에 사용하기 위해 Docker로 설치해여 사용하려 합니다.

<img src="/img/posts/docker/docker.png">

## Docker??
***
**컨테이너 기반의 오픈소스 가상화 플랫폼**  
- **다양한 프로그램, 실행 환경을 컨테이너로 추상화하고 동일한 인터페이스를 제공하여 프로그램 배포 및 관리를 단순화** 한다.
- 컨테이너 엔진으로 리눅스 커널 기능을 사용하여 운영체제 위에 컨테이너를 만들고, 데몬으로 실행된다.


<details>
    <summary style="margin-left: 30px; color: rgba(113, 187, 222, 1); cursor: pointer;">Linux 커널의 도커 엔진</summary>
    <img style="margin-left: 30px; width: 500px;" src="/img/posts/docker/docker_engine.png">
</details>

<div style="height: 50px;"></div>

## 컨테이너??
***
- 호스트 OS상에 논리적인 구획(컨테이너)을 만들고, 어플리케이션을 작동시키기 위해  
  필요한 라이브러리나 어플리케이션 등을 하나로 모아, 마치 별도의 서버인 것처럼 사용할 수 있게 만든 것  
- 컨테이너는 오버헤드가 적기 때문에 가볍고 고속으로 작동하는 것이 특징입니다.

<div style="height: 50px;"></div>

## Docker Image??
***
- Docker에서 image는 파일로 어플리케이션 실행에 필요한 독립적인 환경을 포함한 일종의 템플릿  
- 소스 코드, 라이브러리, 종속성, 도구 및 응용 프로그램을 실행하는데 필요한 기타 파일을 포함하는 불변 파일
- 읽기 전용이며 스냅샷 이라고도 부르고 이러한 일관성은 개발자에게 안정적이고 균일한 조건에서 테스트 할 수 있도록 함.

<div style="height: 50px;"></div>

## Docker Install
***
1. brew로 설치  
  - virtualbox, vargrant 등 가상머신 위에 도커를 띄우는 작업 필요
  - compose, machine등 추가 설치 필요
  - 서버 실행시 호스트 OS에서 서버 접근시 포트 포워딩 필요
2. brew cask로 설치
- brew cask 는 Docker Desktop on Mac 도커를 설치해주며, docker-compose, docker-machine을 같이 설치 해줌
- 맥 OS에서 띄우기 때문에 가상 머신에서 포트 포워딩을 할 필요 없음

~~~bash
# 먼저 cask 먼저 설치
$ brew install cask

# Docker Install
$ brew install --cask docker
~~~
위와 같이 입력하면 docker는 정상적으로 잘 다운된다!

<div style="height: 50px;"></div>

## MariaDB Install
***
~~~bash
# Docker Image 받기
$ docker pull mariadb

# mariadb 확인
$ docker images

# MariaDB 컨테이너 실행
# (1) docker run : docker image에서 container를 생성
# (2) –name maria-db : maria-db라는 이름을 가진 컨테이너 생성
# (3) -p 3307:3306 : 해당 컨테이너의 포트 forwarding에 대해 inbound는 3307로 하고,
#                    outbound는 3306으로 설정한다.
# 외부에서 접속 시 3307 포트를 사용하여 컨테이너에 정보를 전달하면, 컨테이너는 내부적으로 3306 포트를
# 사용하여 처리하고 정보를 외부로 보낸다. mySQL에서도 MariaDB와 동일하게 3306 포트를 사용하기 때문.
# (4) -e : 컨테이너 내 변수 설정
# (5) MYSQL_ROOT_PASSWORD=”암호” : ROOT 암호 설정
# (6) -d mariadb : mariadb라는 이미지에서 분리하여 컨테이너 생성
# (7) --lower_case_table_names=1 : 대소문자 구분을 제거해준다.
$ docker run --name mariadb -p 3307:3306 -e MYSQL_ROOT_PASSWORD=1234 -d mariadb --lower_case_table_names=1

# 실행 중인 도커 확인
$ docker ps

# 도커 명령어를 통해 DB 접속
$ docker exec -it mariadb mysql -u root -p
~~~

여기까지 잘 하셨으면 이제 local에서 세팅 가능합니다. 저는 DataGrip을 통해 연결해보도록 하겠습니다.

<div style="height: 50px;"></div>

## DataGrip 연결
***
아래 순서대로 진행하면 연결 가능하다!!!

<img src="/img/posts/docker/first.jpg">
<img src="/img/posts/docker/second.jpg">
<img src="/img/posts/docker/third.jpg">

<div style="height: 50px;"></div>

## 포스트 작성 시 참고한 링크
[도커란?](https://kplog.tistory.com/288)  
[Docker Install](https://joshwon.tistory.com/m/36)  
[MariaDB Install](https://fl0wering.tistory.com/50)  