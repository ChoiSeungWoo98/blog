---
title: "[Linux] Linux 심화"
date: 2024-07-08T22:32:35+09:00
draft: false
author: "choiseU"
tags: ["리눅스", "CGroup", "NameSpace", "Chroot", "UDS", "OverlayFS",]
categories: ["Linux"]
---
> 리눅스에 대해 배웠다.  
> 오늘은 실습이 주를 이뤘다.
> 각각의 명령어가 무슨 일을 하는지 모르다 보니
> 사실상 한컴타자연습 느낌..
> 이렇구나 하고 넘어가는 정도라 다시 정리...!

## CGroup(Control Group)
***
#### 개념
- 프로세서가 사용하는 자원(CPU, 메모리, 디스크, I/O, 네트워크 대역폭 등) 관리 및 제한
- 애플리케이션의 성능 최적화 및 제어
- 프로세스를 그룹으로 묶고 사용할 수 있는 자원을 제한, 제어하는 방식

#### 주요 기능
- 리소스 제한 : 자원을 제한해 안정성 보장
- 리소스 우선순위 : 중요도에 따른 자원을 할당 및 제한
- 리소스 계정 : 그룹 별 자원 사용량 모니터링 및 통계 정보 제공
- 리소스 격리 : 다른 프로세서 그룹 간의 자원 사용을 격리하여 타 그룹에 영향이 미치지 않도록 함

#### 구조
- cpu : 사용량 제한 및 보장
  - cpuacct : 사용량 모니터링
- memory : 사용량 제한 및 통계 제공
- blkio : 블록(디스크) I/O 사용량 제한 및 모니터링
- net_cls : 네트워크 트래픽 분류 및 제한
- freezer: 프로세스 중단, 재개
- devices: 장치 접근 제어
- hugetlb: 큰 페이지 메모리 사용량 제한
- perf_event: 성능 이벤트 모니터링

#### 사용법
```shell
# cgroup 실습 환경 세팅
sudo apt-get install cgroup-tools-stress




# cpu 제한 실습
# cpulimit이라는 이름으로 cgroup 생성
sudo cgcreate -g cpu:/cpulimit

# 생성 여부 확인
lscgroup | grep cpulimit

# cpu 제한 설정(50000을 출력 후 출력 값을 cpu.max 파일에 기록)
echo 50000 | sudo tee /sys/fs/cgroup/cpulimit/cpu.max

# cpu 실행(cgroup의 cpu 서브시스템을 사용하는데 stress 도구를 사용해 부하를 준다)
# cpulitmit을 실행하는데 cpu는 2개 vm(메모리 작업)은 1개를 작업 시작하고 30초 후 작업 종료 이 과정을 백그라운드에서 실행하고 작업 상태를 실시간으로 보여줘
sudo cgexec -g cpu:/cpulimit stress --cpu 2 --vm 1 --timeout 30s & top

# cgroup 삭제
sudo cgdelete -g cpu:/cpulimit




# memory 제한 실습
# memorylimit 이름의 그룹 생성
sudo cgcreate -g memory:/memorylimit

# 512MB로 메모리 제한 설정
echo $((512 * 1024 * 1024)) | sudo tee /sys/fs/cgroup/memorylimit/memory.max

# 메모리 시스템 부하 주기 및 0.5초 마다 memory.current 파일 내용 출력
sudo eegexec -g memory:/memorylimit stress --vm-byte 1024M --vm 1 --timeout 30s & watch -n 0.5 cat /sys/fs/cgroup/memorylimit/memory.current

# cgroup 삭제
sudo cgdelete -g memory:/memorylimit
```

<div style="height: 50px;"></div>

## NameSpace
***
#### 개념
- 프로세스가 시스템 리소스를 격리하여 독립된 환경에서 실행되도록 하는 기술
- 컨테이너 기술에서 중요하게 사용

#### 종류
- Mount Namespace : 파일 시스템 마운트를 격리하여 각각 독립적인 파일 시스템 트리를 갖고 있다.
- Process ID Namespace : 프로세스 ID 격리하고 독립된 프로세스 ID 공간을 가지므로, 네임스페이스 마다 동일한 PID를 가질수 있다.
- Network Namespace(net) : 네트워크 장치, IP 주소, 포트 번호 등을 격리하여 독립적인 네트워크 스택을 가지며 네임스페이스 간 장치를 독립적으로 사용 가능
- User Namespace : 사용자와 그룹 ID를 격리하여 비루트 사용자가 네임스페이스 내에 루트 권한을 가질수 있다.
- IPC Namespace(ipc) : 프로세스간 통신(메시지, 큐, 세마포어, 공유 메모리 등)을 격리하여 타 네임스페이스와 충돌 없이 사용 가능하다.
- UTS Namespace(uts) : 호스트와 도메인 이름을 격리하여 독립적으로 사용 가능, 이는 컨테이너화 된 시스템 식별 정보를 별도 설정하기 유용하다.

#### 사용법
```shell
# Namespace 실습 환경 세팅
sudo apt-get update
sudo apt-get install -y util-linux

# 새 마운트 네임스페이스 에서 관리자 권한으로 새로운 bash 셸 실행
sudo unshare --mount /bin/bash

# 셸 안에 /mnt/test 디렉토리 생성
mkdir /mnt/test

# tmpfs 타임의 임시 파일 시스템을 /mnt/test 에 마운트(운영체제에서 파일 시스템을 특정 디렉토리에 연결하여 사용할 수있도록 하는 과정)
mount -t tmpfs none /mnt/test

# "Hello from Mount Namespace"라는 텍스트를 /mnt/test/hello.txt 파일에 작성
echo "Hello from Mount Namespace" > /mnt/test/hello.txt

# 방금 작성 hello.txt의 내용 출력
cat /mnt/test/hello.txt

# 새롭게 만든 마운트 네임스페이스(현재 셸) 종료
exit

# 호스트 네임스페이스에서 /mnt/test 디렉토리의 내용 나열
ls /mnt/test




# PID Namespace 실습
# PID 네임 스페이스 생성
sudo unshare -pid -fork /bin/bash

# 생성된 PID 네임 스페이스 안에 실행 중인 모든 프로세스 출력
ps -none

# 현재 bash 쉘의 프로세스 id 출력
echo $$

#PID 네임 스페이스 bash 쉘 종료
exit

# 기존 PID 네임스페이스로 위 동작과 동일
ps -e
echo $$




# User(UID, GID) Namespace 실습
# USER 네임 스페이스 생성
sudo unshare --user /bin/bash

# 현재 id 정보 출력
id

# root_test_file이라는 이름으로 빈 파일 생성
touch /root_test_file

# 생성한 빈 파일 정보 출력 및 나가기
ls -l /root_test_file
exit

# 관리자 권한으로 root_test_file 삭제
sudo rm /root_test_file




# UTS Namespace
# 현재 시스템 호스트명 출력
hostname

# 새로운 UTS 네임스페이스 생성 후 bash 쉘 실행
sudo unshare --uts /bin/bash

# 새로운 UTS 안에 호스트 명을 kakao로 변경 후 출력 후 나가기
hostname kakao
hostname
exit

# 기존 호스트 네임 출력
hostname
```

<div style="height: 50px;"></div>

## Chroot(Change Root)
***
#### 개념
- 특정 디렉토리를 시스템의 루트 디렉토리로 설정하여 그 안에서 실행되는 프로그램이 해당 디렉토리를 루트로 인식(chroot jail)
- 시스템 일부를 격리하여 제한된 환경에서 테스트나 보안 목적으로 사용
- 특정 디렉토리를 빠져나가지 못하기 때문에 감옥 이라고도 부른다.
#### 주요 기능
- 보안 : 사용자가 시스템의 다른 부분에 접근하지 못하도록 한다.
- 테스트 : 새로운 소프트웨어나 설정을 격리된 환경에서 테스트
#### 사용법
```shell
# /mychroot 디렉토리 아래에 여러 디렉토리를 한번에 생성
sudo mkdir -p /mychroot/<bin,lib,lib64,dev,etc,proc,sys>

# /bin 디렉토리의 모든 파일과 /bin/bash, /bin/ls, /bin/cat이 의존하는 모든 라이브러리 파일을 디렉토리 구조를 유지한 채 /mychroot로 복사
sudo cp /bin/* /mychroot/bin/
for lib in $(ldd /bin/bash /bin/ls /bin/cat | grep -o '/lib[^ ]*'); do sudo cp --parents "$lib" /mychroot; done

# mychroot 환경에서 proc, sys, dev를 사용할 수 있도록 마운트 하는 작업을 수행한다.
sudo mount -t proc proc /mychroot/proc
sudo mount -t sysfs sys /mychroot/sys
sudo mount --bind /dev /mychroot/dev

# mychroot 디렉토리로 변경하고 쉘을 실행해 root 인 것처럼 동작하게 하는 작업
sudo chroot /mychroot /bin/bash

# 현재 루트 디렉토리의 내용 나열
ls /

# /etc/kakao에 파일 저장 후 출력 및 쉘 종료
echo "Hello from chroot" > /etc/kakao
cat /etc/kakao
exit

# 마운트한 proc, sys, dev를 언마운트 한 후 mychroot 디렉토리 및 하위 모든 내용 삭제
sudo umount /mychroot/proc
sudo umount /mychroot/sys
sudo umount /mychroot/dev
sudo rm -rf /mychroot
```

<div style="height: 50px;"></div>

## UDS(Unix Domain Socket)
***
#### 개념
- 동일한 컴퓨터 내의 프로세스 간 통신(Inter-Process Communication, IPC)를 위한 매커니즘 중 하나
- TCP/IP 네트워크 소켓과 유사하지만 로컬 파일 시스템을 통해 통신

#### 주요 특징
- 로컬 통신 : 호스트 내에세 실행되는 프로세스 간의 통신을 지원해 네트워크 소켓에 비해 성능 우수
- 파일 시스템을 이용한 주소 지정 : 파일 시스템 경로를 사용해 소켓을 식별하며 /tmp/mysocket과 같은 파일 경로 사용
- 데이터 전송 속도 : 네트워크 계층을 거치지 않아 빠른 데이터 전송 가능(네트워크 스택의 오버헤드를 줄이기 때문)
- 보안 : 파일 시스템 권한 설정을 통해 접근 제어, 특정 사용자나 프로세스만 소켓에 접근하도록 제한

#### 사용법
```python3
# file name : server.py

import socket
import os

SOCKET_FILE = "/tmp/mysocket"

if os.path.exists(SOCKET_FILE):
    os.remove(SOCKET_FILE)

server = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
server.bind(SOCKET_FILE)
server.listen(1)

print("서버가 클라이언트를 기다리고 있습니다...")

conn, addr = server.accept()
print("클라이언트 연결 수락")

while True:
    data = conn.recv(1024)
    if not data:
        break
    print("클라이언트로부터 받은 데이터:", data.decode())
    conn.sendall(data)

conn.close()

```

```python3
# file name : client.py

import socket

SOCKET_FILE = "/tmp/mysocket"
client = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
client.connect(SOCKET_FILE)

message = "안녕하세요, 서버!"
client.sendall(message.encode())
data = client.recv(1024)

print("서버로부터 받은 데이터:", data.decode())

client.close()
```

```shell
# 하나의 터미널에서 작업 시 
python3 server.py &
python3 client.py
```

<div style="height: 50px;"></div>

## OverlayFS
***
#### 개념
- 여러 디렉토리를 하나의 계층적 파일 시스템으로 병합 후 제공
- 읽기 전용 파일 시스템에 쓰기 가능한 레이어를 추가해 기본 파일 시스템을 변경 없이 수정, 추가 가능

#### 주요 특징
- 파일 시스템 계층화 : 읽기 전용 및 쓰기 가능한 계층을 병합 후 사용
- 스냅샷 및 버전관리 : 파일 시스템의 상태를 스냅샷으로 저장 필요 시 복원
- 컨테이너 : Docker와 같은 컨테이너 기술에서 이미지 레이어링을 위해 사용

#### 구조
- Lowerdir : 읽기 전용 파일 시스템
- Upperdir : 쓰기 전용 파일 시스템
- Workdir : Lowerdir과 Upperdir의 변경사항 추적을 위한 디렉토리, Docker에서 해당 디렉토리가 없으면 동작x
- Merged : Lowerdir과 Upperdir을 합쳐서 만든 현재 상태의 파일 시스템 디렉토리

#### 작동방식
- 새로운 파일 생성 : Upperdir에 파일 생성
- 기존 파일 읽기 : 파일이 Upperdir에 있으면 Upperdir에서 읽고 없으면 Lowerdir에서 읽음
- 기존 파일 수정 : 파일이 Upperdir에 없으면 Lowerdir에서 Upperdir로 복사 후 수정
- 파일 삭제 : 파일이 Upperdir에 있으면 삭제, Lowerdir에 있으면 Upperdir에 삭제 마커 생성

#### 사용법
```shell
sudo mkdir -p /lower /upper /work /merged
# /lower, /upper, /work, /merged 디렉토리를 생성합니다. (필요시 부모 디렉토리도 함께 생성)

echo "Lowerdir 입니다" | sudo tee /lower/lowerfile.txt
# "Lowerdir 입니다"라는 문자열을 /lower/lowerfile.txt 파일에 씁니다. (파일이 없으면 생성)

echo "Upperdir 입니다" | sudo tee /upper/upperfile.txt
# "Upperdir 입니다"라는 문자열을 /upper/upperfile.txt 파일에 씁니다. (파일이 없으면 생성)

sudo mount -t overlay overlay -o lowerdir=/lower,upperdir=/upper,workdir=/work /merged
# lowerdir로 /lower, upperdir로 /upper, workdir로 /work를 사용하여 /merged에 overlay 파일 시스템을 마운트합니다.

ls /merged
# /merged 디렉토리의 내용을 나열합니다.
# >> merged에서 lowerfile.txt와 upperfile.txt 확인

cat /merged/lowerfile.txt
# /merged 디렉토리 안의 lowerfile.txt 파일의 내용을 출력합니다.

cat /merged/upperfile.txt
# /merged 디렉토리 안의 upperfile.txt 파일의 내용을 출력합니다.

echo "Mergeddir 입니다" | sudo tee /merged/mergedfile.txt
# "Mergeddir 입니다"라는 문자열을 /merged/mergedfile.txt 파일에 씁니다. (파일이 없으면 생성)

ls /upper
# /upper 디렉토리의 내용을 나열합니다. (mergedfile.txt가 여기에 나타납니다)

sudo umount /merged
# /merged 디렉토리에 마운트된 파일 시스템을 언마운트합니다.

sudo rm -rf /lower /upper /merged /work
# /lower, /upper, /merged, /work 디렉토리와 그 안의 모든 파일을 강제로 삭제합니다.

```