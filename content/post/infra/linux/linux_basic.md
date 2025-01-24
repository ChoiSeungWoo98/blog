---
title: "[Linux] Linux 기초"
date: 2024-07-05T22:03:57+09:00
draft: false
author: "choiseU"
tags: ["Linux", "리눅스", "기초"]
categories: ["Linux"]
---
> 리눅스에 대해 배웠다.  
> 처음 알게된 명령어도 많았지만  
> 하다보면 외워지겠지...  
> 일단 정리정리..  

## 리눅스
***
- 유닉스 계열의 OS 중 하나로 전 세계적으로 널리 사용되고 있는 오픈 소스 소프트웨어이다.
- 다양한 시스템에서 동작하며 특히 서버, 데스크탑, 모바일 기기에서 사용

<div style="height: 50px;"></div>

## 오픈소스
***
- 개념
  - 오픈 소스 소프트웨어(OOS : Open Source Software)로 누구나 열람, 수정, 배포가 가능한 소프트웨어이다.
- 중요성
  - 투명성 : 공개 소스로 동작 방식 확인 가능
  - 협업과 혁신 : 누구나 수정, 배포가 가능해 빠른 소프트웨어 개선
  - 비용 절감 : 라이센스 비용이 없거나 저렴함
  - 자유와 통제 : 자유롭게 수정할 수 있는 권한

<div style="height: 50px;"></div>

## GPL License
***
- 자유 소프트웨어 재단에서 만든 라이선스로 자유롭게 사용할 수 있고 수정, 배포 할 수 있는 권리 보장

<div style="height: 50px;"></div>

## 자유 소프트웨어 운동
***
- 사용, 수정, 공유의 자유를 보장하는 소프트웨어
- 소프트웨어는 사용자의 자유와 권리를 침해하지 않아야 한다는 철학
- 자유와 접근성을 증진하고 독점 소프트웨어에 대한 대안을 제공

<div style="height: 50px;"></div>

## 리눅스 구조
***
- 어플리케이션
  - 사용자가 직접 상호작용하는 단계로 빌드된 앱, 바이너리, 명령어, 빌드된 파일을 통틀어 어플리케이션이라고 한다.
  - 주요 기능
    - 사용자가 상호작용할 수 있는 인터페이스 제공
    - 커널을 통한 시스템 리소스(CPU, Memory, I/O 장치 등)을 사용
- 쉘
  - 어플리케이션이 커널에서 사용하는 명령어를 가려주고 쉘을 사용해 스크립트도 만들 수 있다.
  - 주요 기능
    - 명령어 해석 : 사용자가 입력한 명령어 해석, 실행하기 위해 시스템 콜
    - 스크립트 실행 : 쉘 스크립트를 통해 여러 명령어 조합이나 여러 명령어를 일괄 실행
    - 환경 관리 : 환경 변수 설정 및 관리
- 커널
  - OS의 핵심 부분으로 하드웨어와 상호작용하는 단계
  - 주요 기능
    - 프로세스 관리 : 프로세스 생성, 스케줄링, 종료 등을 관리
    - 메모리 관리 : 가상 메모리, 페이징, 스왑 메모리등을 통해 효율적인 메모리 관리
    - 가상 메모리  : 보조기억장치를 이용해 실제 사용 가능한 메모리보다 더 많은 메모리를 사용가능하게 하는 기법
    - 페이징  : 메모리를 좀 더 효율적으로 사용하기 위해 고안된 기법으로 메모리를 일정 크기만큼 잘라서 사용하는 기법
    - 스왑 메모리  : 실제로 사용하지 않는 나머지 부분(페이지)을 보조기억장치의 특정 영역(스왑 영역)으로 옮겨서 공간을 확보하는 기법
    - 파일 시스템 관리 : 파일의 저장, 접근, 조작을 지원하는 파일 시스템 관리
    - 장치 관리 : 하드웨어 장치와의 상호작용을 관리하고 장치 드라이버를 통한 추상화
    - 보안및접근제어 : 사용자와 시스템 자원 간의 보안정책을 관리하고 적용
- 하드웨어
  - 물리적인 컴퓨터 구성요소로 CPU, Memory, SSD, HDD, Network Interface 등
  - 직접 통제하지 않고 커널의 추상화를 통해 관리할 수 있도록 간접적으로 접근
  - 주요 기능
    - CPU: 명령어 처리 및 프로그램을 실행
    - Memory: 실행 중인 프로그램과 데이터를 저장
    - 저장 장치: 데이터를 (반)영구적으로 저장

<div style="height: 50px;"></div>

## 대표적인 Linux 배포판
***
- Ubuntu
  - Debian 계열중에 가장 유명한 배포판
  - 쉬운 설계 및 직관적인 GUI 제공
  - 방대한 레퍼런스
  - 2년 단위의 버전 출시 및 5년간 유지보수로 보안성이 강하고 안정적
- CentOS
  - RHEL(RedHat Enterprise Linux)계열로 안정성과 보안이 뛰어나 주로 기업에서 많이 사용하는 OS
  - 방대한 레퍼런스
  - CentOS 7까지는 무료였으나 CentOS 8부터는 유료로 제공
- Arch Linux
  - 경량화, 커스터마이징에 특화된 OS
  - 자체 용량이 굉장히 작다.

<img style="margin-left: 30px; width: 500px;" src="/img/posts/linux/linux배포판.png">

<div style="height: 50px;"></div>

## 패키지 매니저
***
- APT
  - Demian 계열에서 주로 사용하는 패키지 매니저
    - Demian : 여러 파생 배포판의 기반(Ex : Ubuntu, Linux Mint 등)
  - 패키지 설치 시 의존성 패키지도 자동 설치
- YUM/DNF
  - RHEL 계열에서 주로 사용하는 패키지
    - RHEL(Red Hat Enterprise Linux) : 레드햇이 개발한 상용 리눅스 배포판, 주로 기업환경에서 사용되며 고성능, 안정성, 보안, 지원 서비스 제공
  - 플러그인 시스템을 통해 기능 확장 가능
  - YUM보다 DNF를 사용하는 추세

<img style="margin-left: 30px; width: 500px;" src="/img/posts/linux/패키지매니저.png">

<div style="height: 50px;"></div>

## 권한 및 소유자
***
- 모든 파일 및 디렉토리는 사용자(User)와 그룹(Group)에 의해 소유(Ex : colton:KTB 라면 colton과 KTB에 속한 그룹의 소유)
- 사용자와 그룹 말고도 접근 권한을 지정 할 수 있다.
  - R(Read) : 읽기 권한, cat으로 파일 내용 확인 가능
  - W(Write) : 쓰기 권한, vim, echo, sed 명령어 등으로 수정 가능
  - X(eXecute) : 실행 권한, sh, bash에 의해 실행될 수 있음
- 파일의 부여할 수 있는 권한은 Bit로 관리되며 Read 4, Write 2, Execute 1로 설정
- 한 파일이 갖는 모든 권한은 User, Group, Others(Ex : 754 라면 유저는 모든 권한, 그룹은 읽기 및 실행, 그 외는 읽기의 권한)

<div style="height: 50px;"></div>

## 디렉토리 구조
***
- Root Directory(/) : 시스템의 모든 디렉토리는 루트 하위에서 관리
- bin(/bin) : 사용자 명령어가 저장되는 디렉토리(ls, cd, mv, rm, bash 등)
- lib(/lib) : 시스템, 어플리케이션의 공유 라이브러리가 저장
- usr(/usr) : 앞서 설명한 디렉토리들이 모두 포함(앞선 디렉토리가 바라보고 있음)
- dev(/dev) : 장치 파일들이 저장되는 디렉토리(터미널, 널 장치 등 포함), 모든 장치가 파일 형태로 표시
- etc(/etc) : 전반적인 시스템 설정 파일이 저장, 사용자 계정 정보, 암호정보, 호스트 네임/IP 매핑 파일 등
- opt(/opt) : CLI 보다 GUI에서 자주 사용되는 디렉토리, 설치 매니저를 통해 설치된 어플리케이션이 주로 포함
- proc(/proc) : 커널과 프로세스에 대한 가상 파일 시스템 저장(/proc/cpuinfo : CPU 정보, /proc/meminfo : 메모리 정보), 시스템 상태와 커널 정보등을 제공하며 동적으로 생성되는 파일들로 구성
- home(/home) : 개인 디렉토리가 저장되는 위치, 기본적으로 권한과 소유자가 해당 유저에 맞게 설정
- root(/root) : root 계정의 홈 디렉토리
- tmp(/tmp) : 삭제되어도 문제 없는 파일이나 디렉토리와 같은 임시파일을 저장하는 디렉토리

<div style="height: 50px;"></div>

## 명령어 정리
***
- sudo : root(다른 사용자)의 명령 실행(sudo apt-get update)
- su : 사용자 변경(su <userName>)
- adduser : 사용자 추가(adduser <userName>)
- cat : 파일 내용 출력, 파일 연결 후 출력(cat <fileName>)
- usermod : 사용자 속성 변경(usermod -aG <groupName> <userName>)
- addgroup : 새로운 그룹 추가(addgroup <groupName>)
- vim : 강력한 텍스트 편집기(vim <fileName>)
- echo : 문자열 출력(echo "Hello world!")
- cd(change Directory) : 디렉토리 변경(cd ..)
- chmod : 권한 변경(chmod <775 : 권한> <fileName>)
- ls -al(ll) : 자세한 내용을 포함한 목록 표시
- ls : 디렉토리 내용 나열
- mv : 파일, 디렉토리 이름 변경 혹은 이동(mv <temp2 : 기존이름> <temp : 바꿀 이름>)
- rm : 파일, 디렉토리 삭제(rm <fileName>)
- bash : bash 셀 실행
- exit : 현재 스크립트 종료
- passwd : 사용자 비밀번호 변경
- shadow : /etc/shadow 파일에 저장된 암호화된 비밀번호 관리
- hosts : /etc/hosts 파일 관리
- apt-get : 데비안 기반 시스템에서 패키지 관리(apt-get <install : 동작> <fileName>)
- export : 셸 환경 변수 설정(export PATH=$PATH:</new/path>)
- lsblk : 블록 장치 목록 표시
- df -TH : 파일 시스템의 디스크 공간 사용량 표사
- mkdir : 디렉토리 생성(mkdir <directoryName>)
- rmdir : 빈 디렉토리 삭제(rmdir <directoryName>)
- touch : 빈 파일 생성 or 기존 파일 타임 스탬프 변경(touch <fileName>)
- head : 파일의 처음 몇 줄 출력(head <fileName>)
- tail : 파일의 마지막 몇 줄 출력(tail <fileName>)
- pwd : 현재 경로 출력
- whoami : 현재 사용자 이름 출력
- top : 실시간 시스템 상태 모니터링
- df -h : 디스크 사용량을 읽기 쉽게 표시
- du -h : 디렉토리 사용량을 읽기 쉽게 표시(du -h <directoryName>)
- ping : 네트워크 연결 상태 체크(ping www.google.com)
- curl : 데이터 전송 및 가져오기(curl www.google.com)
- ifconfig : 네트워크 인터페이스 구성 표시 및 변경
- ps : 현재 실행중인 프로세스 목록 표시
- find : 파일 시스템에서 파일과 디렉토리 검색(find <path> -name <fileName>)
- service : 서비스 시작, 중지, 재시작, 상태 확인 등을 수행(service <serviceName> <start / stop / restart / status / --status-all>)
- ip addr : 네트워크 인터페이스와 IP 주소 관리 및 사용