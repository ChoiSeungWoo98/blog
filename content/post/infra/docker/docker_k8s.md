---
title: "[Docker] 쿠버네티스를 배우기 전 도커에 대한 이해"
date: 2024-07-12T18:25:27+09:00
draft: true
author: "choiseU"
tags: ["Docker", "K8S", "Kubernetes"]
categories: ["Docker"]
---
> 오늘은 실습보다 이론위주의 수업이었다.  
> 쿠버네티스를 배우기 전 도커에 대해 간단하게 설명하고 들었던 것들을 정리하고자 한다.

## CRI(Container Runtime Interface)
***
#### 개념
- Kubernetes에 도입된 개념으로 kubelet이 컨테이너 런타임을 호출할 수 있는 인터페이스, 이를 통해 특정 컨테이너 런타임에 종속되지 않고 유연성을 갖는다.
  - High-level Container runtime과 연계되기 위해 필요
  - Kubernetes CRI는 kubelet과 Continer Runtime 사이에 통신을 위해 주요 gRPC 프로토콜 정의
- Docker는 Dockerd가 CRI를 구현하지 않았기 때문에 Kubelet과 dockerd 사이에 dockerd-shim을 구현하여 이 역할을 대신 담당
  - 하지만 docker도 container를 기본으로 사용하지 않기 때문에 더이상 dockerd-shim 존재 이유가 없어졌다.

<div style="height: 50px;"></div>

## OCI(Open Container Initiative)
***
#### 개념
- 빠르게 발전하는 Container 기술에 비해 규격이 존재하지 않아 Container Runtime 별로 서로 다른 interface를 가지게 된다.
- 따라서, 컨테이너 런타임 명세와 이미지 명세를 준수하는 표준을 제시해 현재 대부분의 컨테이너 런타임은 이를 따르도록 함

#### OCI 표준 요구사항
- 표준 동작(Standard Operations)
  - 표준 컨테이너 도구를 이용해 컨테이너 생성, 시작, 정지가 가능해야함
  - 표준 파일 시스템 도구를 통해 컨테이너 스냅샷(특정 시점에 대한 상태를 캡처하는 것, 주로 백업, 복구, 테스트 등으로 사용)과 복사가 가능해야함
  - 표준 네트워크 도구들을 통해 컨테이너 업로드와 다운로드가 가능해야함
- 내용 중립성(Content-agnostic)
  - 컨테이너가 담고 있는 애플리케이션의 종류 상관 없이 표준 동작들이 동일하게 동작해야함
- 인프라 중립성(Infrastructure-agnostic)
  - OCI 자원 인프라라면 종류 상관 없이 실행이 가능해야함
- 자동화를 위한 설계(Designed for Automation)
  - 컨테이너 내용과 인프라 상관 없이 동일한 동작을 지원해 자동화에 용이
- 산업 수준의 배포(Industry-grade delivery)
  - 기업 규모에 상관 없이 산업 수준의 배포가 가능해야함

<div style="height: 50px;"></div>

## Container Runtime
***

<img style="margin-left: 60px; width: 500px;" src="/img/posts/docker/Container_Runtime.png">

#### 개념
- OCI가 만들어질 당시 비공식적 표준 역할을 하던 도커는 컨테이너 런타임의 표준화를 위해 필요한 모든 단계가 아닌 세번 단계인 컨테이너 실행 부분만 표준화
- 실제 컨테이너를 실행하는 저수준 컨테이너 런타임인 OCI 런타임과 이미지 전송 및 관리 압축 풀기 등을 실행하는 고수주 컨테이너 런타임으로 나뉜다.

#### High-Level Container Runtime
- 일반적으로 Container Engine로 불리며 논리적으로 실행, 이미지 전송 및 관리, 실행중인 모니터링 및 관리를 제공하면서 데몬 프로세스로 동작
- ContainerD는 컨테이너 관리를 위한 고수준 런타임(컨테이너의 생명주기 관리, 이미지 전송 및 저장, 네트워크 인터페이스 설정 등을 포함한 다양한 기능 제공)

#### Low-Level Container Runtime
- 일반적으로 Container Engine로 불리며, 컨테이너를 실행하는 기능만 제공 및 실행 중인 컨테이너를 관리만 하기 때문에 저수준이라고 불린다.
- 컨테이너는 Linux Namespace와 Cgroup으로 구현
  - Namespace : 파일 시스템이나 네트워킹과 같은 시스템 리소스를 가상화
  - Cgroup : 컨테이너 안에서 사용할 수 있는 리소스(cpu, memory 등)의 양을 제한

<div style="height: 50px;"></div>

## Kubernetes에서 사용 중단된 Docker
***
#### 배경
도커는 CRI를 직접 지원하지 않았기 때문에 쿠버네티스에서 도커와 호환을 위해 Dockershim이라는 중간 계층을 사용하였으나
Docker의 버전 업데이트를 하면서 의존성에 문제가 생겨 지원을 중단했습니다.

#### 대안
docker는 CRI를 준수하지 않았지만, OCI는 준수하고 있기 때문에 도커에서 빌드한 이미지들도 OCI 표준을 따르는 다른 컨테이너 런타임(containerd, CRI-O)을 통해 그대로 사용 가능하다.
- containerd : Docker 자체도 내부적으로 사용하는 고성능 컨테이너 런타임으로, Kubernetes와 직접 호환됩니다.
- CRI-O : Kubernetes와의 호환성을 염두에 두고 설계된 경량의 컨테이너 런타임입니다.

<div style="height: 50px;"></div>

## Container Layer 실습
***
#### 개념
- Upper
  - 컨테이너의 최상위레이어
  - 컨테이너에서 발생하는 모든 변경 사항(파일 추가, 수정, 삭제 등) 저장
- Lower
  - 읽기 전용 레이어
  - 베이스 이미지와 부모 이미지 레이어
  - 여러개의 Lower 레이어가 있을 수 있음
- Merge
  - 컨테이너가 실행될 때 사용자에게 보이는 파일 시스템
  - Upper와 Lower 레이어가 결합되어 나타남

#### 실습
```shell
# nginx 이미지 내려받기
docker pull nginx

# 저장된 layerdb의 경로를 확인해본다
docker image inspect nginx | jq '.[].RootFS'

# 맥에서 확인 시 alias 등록 후 접근 가능
alias dockervm="docker start dockervm_instance -i || docker run --name=dockervm_instance -it --privileged --pid=host debian nsenter -t 1 -m -u -n -i sh"

# dockervm 접근
dockervm

# 아래의 경로에 layerdb에 저장된 폴더들을 확인해본다
/var/lib/docker/image/overlay2/layerdb/sha256

# 확인된 cache-id를 /var/lib/docker/overlay2/ 경로에 접근하여 파일시스템 구조를 확인해본다
# Docker run -it nginx /bin/bash 에 접근하여 파일시스템에 생성된 파일들을 확인해본다













```

<div style="height: 50px;"></div>