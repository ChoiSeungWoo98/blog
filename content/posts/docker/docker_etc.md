---
title: "도커 이론"
date: 2024-07-12T14:25:27+09:00
draft: false
author: "choiseU"
tags: ["KakaoTechBootCamp", "BootCamp", "Docker", "security"]
categories: ["KakaoTechBootCamp", "Docker"]
---
> 오늘은 실습보다 이론위주의 수업이었다.  
> 도커 보안에 대해 간단하게 설명하고 들었던 것들을 정리하고자 한다.  

## Docker Security
***
#### Rootless Mode
- 개념
  - Docker를 실행할 때 관리자 권한 없이 실행시키는 모드
- 특징
  - 시스템 전체에 대한 권한 없이 사용할 수 있어 잠재적 보안 위험을 낮출 수 있다.
  - 모두 일반 사용자 권한으로 시스템 자원에 대한 접근 제한

#### Linux Capabilities
- 개념
  - 리눅스 커널에서 제공하는 기능으로 시스템 관리 권한을 세분화하여 특정 작업에 대해 권한을 부여할 수 있다.
- 특징
  - 컨테이너 생성 시 필요한 권한만 부여해 보안성 향상
  - Privileged : 컨테이너가 호스트 시스템의 모든 권한을 갖고 있음.(보안 취약)

#### Share Namespace
- 개념
  - 리눅스 커널의 기능으로 프로세스와 자원(PID, 네트워크, IPC 등)을 격리 시킬 수 있다.
- 특징
  - Docker에서는 컨테이너 마다 별도의 네임스페이스를 할당해 다른 컨테이너나 호스트와 격리한다.
  - PID Namespace : 호스트의 프로세스를 볼 수 있음, 프로세스 ID를 격리하여 각 컨테이너가 다른 프로세스를 보지 못하게 한다.
  - IPC Namespace : 호스트의 , 인터이페스 통신을 격리한다.
  - Network Namespace : 호스트의 , 네트워크 인터페이스를 격리해 컨테이너 간 네트워크 충돌을 방지한다.
  - 추가적인 내용 [리눅스 심화](https://choiseungwoo98.github.io/linux_detail.html#namespace)

#### Security Layer
- 개념
  - 리눅스 커널에서 제공하는 보안 메커니즘으로 Docker 이미지에서 보안 패치를 적용한 레이어이다.
  - 시스템 호출 제어와 프로그램 동작 제한을 통해 보안을 강화하는데 사용
- 특징
  - Docker 이미지는 여러 레이어로 구성되며, 취약점 발견 시 해당 레이어만 업데이트 해 보안성 유지
  - 이미지 전체를 다시 빌드할 필요 없이 특정 레이어만 업데이트 할 수 있어 효율적이다.
  - AppArmor : 리눅스 커널에서 제공하는 보안 모듈로 애플리케이션 접근할 수 있는 자원을 제어
  - Seccomp : 리눅스 커널에서 제공하는 보안 기능으로 시스템 콜을 필터링해 애플리케이션을 실행할 수 있는 시스템 콜 제한 

<div style="height: 50px;"></div>

## Privileged Container와 UnPrivileged Container
***
#### Privileged Container
- 컨테이너는 Host에서 독립된 namespace 영역을 가지고 있어 시스템의 주요자원에 접근할 수 있는 권한이 없음
- Privileged 옵션으로 Container를 생성하면 Host의 리눅스 커널 기능을 모두 사용할 수 있고 모든 Host 주요 자원에 접근할 수 있음

#### UnPrivileged Container
- 시스템 주요 자원에 접근할 수 있는 권한이 부족해 네트워크 인터페이스 활성화/비활성화나 IP주소의 변경 불가능

<div style="height: 50px;"></div>

## Capabilities
***
- 모든 권한을 열어주게 되면, 보안적으로 위험할 수 있어 세분화하여 권한을 관리
- CAP_NET_ADMIN : 네트워크설정변경
- CAP_SYS_ADMIN : 시스템관리작업
- CAP_SYS_PTRACE : 다른프로세스추적

<div style="height: 50px;"></div>
