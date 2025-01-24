---
title: "[K8S] Kubernetes 기초"
date: 2024-07-22T21:27:45+09:00
author: "choiseU"
tags: ["Kubernetes"]
categories: ["Kubernetes"]
---
> 오늘은 드디어 그 유명한 쿠버네티스!!!  
> 쿠버만 잘해도 반은 간다는데  
> 화이팅! 부셔보자!!!  

## Kubenetes(K8S)
***
#### 설명
- 컨테이너화된 애플리케이션 배포, 확장 및 관리를 자동화 하는 오픈소스 시스템
- 대규모 애플리케이션을 신뢰성 있고 효율적인 운영을 도움

#### 특징
- 서비스 디스커버리 및 로드 밸런싱 : DNS 혹은 자체 IP를 사용해 컨테이너 노출(컨테이너에 트랙픽이 많으면 로드밸런싱 후 배포하여 안정적으로 운영 가능)
- 스토리지 오케스트레이션 : 로컬저장소, 클라우드 공급자 등과 같이 원하는 저장소 시스템 사용 가능
- 자동화된 롤아웃, 롤백 : 배포된 컨테이너의 원하는 상태 서술 및 현재 원하는 상태로 변경
- 자동화된 빈패킹 : 컨테이너 노드에 맞춰 리소스를 가장 잘 사용할 수 있도록 지원 
- 자동화된 복구 : 실패한 컨테이너를 다시 시작, 교체하며 사용자가 정의한 상태 이외에는 지속적으로 복구 가능
- 시크릿과 구성관리 : 암초, OAuth 토큰, SSH 키와 같은 중요한 정보를 저장 및 관리(컨테이너 이미지 재구성하지 않고 시크릿 및 애플리케이션 구성을 배포 및 업데이트)

<img style="margin-left: 60px; width: 500px;" src="/img/posts/kubenetes/kubenetes.png">

#### 핵심 개념
- cluster : 여러 대의 머신(노드)으로 구성된 그룹(마스터 노드와 여러 워커 노드로 구성)
- node : 클러스터 구성요소가 되는 물리적 또는 가상머신
- pod : k8s가 생성하고 관리할 수 있는 배포 가능한 가장 작은 단워(하나 이상의 컨테이너 그룹)
- replicaset : 동일한 포드의 복제본을 일정하게 유지해 가용성 보장 시 사용되는 리소스(Deploment 사용 권장)
- deployment : 파드와 레플리카셋에 대한 선언적 업데이트 제공
- statefulset :  관리하는 데 사용되는 워크로드, 파드 순서 및 고유성 보장(Deployment와 다르게 동자성 유지)
- Daemonset : 모든 노드가 파드의 사본을 실행(모든 노드에서 클러스터 스토리지, 로그 수집, 노드 모니터링 데몬 실행)
- Job : 하나 이상의 파드를 생성하고 종료될 때 까지 계속 파드 실행 시도
- Cronjob : 반복 일정에 따라 Job 생성
- Namespace : 클러스터 내에 리소스를 논리적으로 분리

<img style="margin-left: 60px; width: 500px;" src="/img/posts/kubenetes/cluster_node.png">

#### 실습

#### 실습 1
- UTM 3개 생성 후 각각 접속
```shell
# 쿠버네티스 설치
sudo snap install microk8s --classic --channel=1.30

# alias 등록
alias kubectl='microk8s kubectl'

# 2번 생성해서 각각 접속
microk8s add-node

# Worker Node 연결 정보 확인
kubectl get nodes
```

#### 실습 2
- Master에서 워커 노드로 분배해주기 때문에 별도 config 설정이 없다면 master에서 하지 못한다.
```shell
# 테스트 폴더 생성 및 접속
mkdir kubenetes && cd kubenetes

# pod, Replicaset, Deployment, Job, CornJob, Daemonset 생성
vi <파일명>.yml

# 생성한 파일 실행
kubectl apply -f <파일명>

# 생성한 정보 확인
kubectl get <리소스> -A -o wide

# 생성 안될 때 확인
kubectl describe pod <pod 이름>
```


#### 실습 3
- kubectl 명령어 익히기
- 차이점 비교
  - Create vs Apply
    - Create : 리소스 새로 생성시 사용, 이미 존재하는 리소스를 업데이트하지 않음
    - Apply : 리소스를 생성 혹은 업데이트시 사용, 변경 사항을 클러스터에 적용 시 유용
  - Log vs Describe
    - Log : Pod 로그를 출력해 디버깅 정보 제공
    - Describe : 리소스 상태와 이벤트를 포함한 상세 정보 출력
  - patch vs edit
    - patch : 리소스를 Json이나 Yml 패치 형식으로 부분 업데이트 시 사용
    - edit : 리소스를 직접 편집 시 사용, 편집 후 저장 시 변경사항 적용
```shell
# 테스트 폴더 생성 및 접속
```
<div style="height: 100px;"></div>
