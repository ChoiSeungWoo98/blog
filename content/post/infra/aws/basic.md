---
title: "[AWS] AWS와 LB 실습"
date: 2024-07-15T15:01:46+09:00
draft: false
author: "choiseU"
tags: ["AWS", "ec2"]
categories: ["AWS"]
---
> 오늘은 AWS 첫번째 실습 시간이다.  
> EC2에서 VPC를 사용하고 public이랑 private를 열어  
> public은 LB를 테스트하고  
> private은 NAT를 이용한 인터넷 연결을 실습했다.

## CSP(Cloud Service Provider)
*** 
- 클라우드 컴퓨팅 서비스를 제공하는 회사(Ex. AWS, Azure, GCP, NCP 등)
- 인프라 서비스(IaaS), 플랫폼 서비스(PaaS), 소프트웨어 서비스(SaaS) 제공

<div style="height: 50px;"></div>

## AWS(Amazon Web Services)
*** 
- 아마존에서 제공하는 클라우드 컴퓨팅 플랫폼
- 현재 높은 점유율로 클라우드 시장에서 강세를 보이고 있다.

<div style="height: 50px;"></div>

## 클라우드 컴퓨팅
***
#### 내용
- 온프레미스(On-premise) 환경과 반대의 의미로 많이 사용
  - IT 인프라를 조직 내부에 직접 설치하고 운영하는 방식
#### 장점
- 비용 절감 : 필요한 만큼 컴퓨팅 자원과 스토리지 대여를 통해 비용 절감
- 속도와 민첩성 : 시스템 자체에 대한 확정을지원하는 클라우드 특성상 빠르게 확장을 진행 할 수 있다.
- 글로벌 서비스 : 특정 지역에 한정되는 온프레미스와 달리 전세계적인 데이터 센터를 통해 사용
- 탄력성 : 모든 CSP에서는 리소스 사용량 증가로 인한 서비스 장애 방지를 위해 탄력적으로 사용 가능한 리소스 조절
- 보안 : 네트워크 방화벽, WAF 등을 통해 강력한 보안 유지

<div style="height: 50px;"></div>

## AZ(Availability Zone)
***
#### 내용
- 하나의 Region 내에 위치한 데이터 센터 그룹
- 고가용성과 내결함성을 위해 여러 AZ에 걸쳐 앱 배포

#### Region
- 지리적으로 분리되어 여러 위치로 구분
- 리전끼리 통신 시 별도 비용이 추가될 수 있다.
- 글로벌 서비스 특성상 빠른 서비스를 제공하기 위해 여러 리전에 걸쳐 앱 배포

<div style="height: 50px;"></div>


## VPC(Virtual Private Cloud)
***
#### 내용
- 개인 네트워크를 구성하는 요소
- 서브넷, 라우팅 테이블, 보안 그룹, 인터넷 게이트웨이, NAT 게이트웨이

#### 이점
- 격리성 : 격리된 환경에서 구성하기 때문에 다른 네트워크에 간섭을 받지 않는다.
- 보안성 : 세부적인 보안 설정 가능
- 확장성 : 필요에 따라 서브넷 추가 구성, 라우팅 테이블, 보안 그룹 등 쉽게 추가
- 유연성 : 요구에 따라 온프레미스와 혼합해 하이브리드 클라우드 구성

<div style="height: 50px;"></div>

## VPC 요소
***
#### 서브넷
- 실제 VM이 올라갈 네트워크 대역을 설정
- private와 public은 인터넷 게이트웨이 유무와 라우팅 테이블에 인터넷 게이트웨이 추가 여부
- private는 NAT 게이트웨이를 통하지 않는 이상 인터넷 통신 불가 public은 기본적으로 가능

#### 라우팅 테이블
- 서브넷에서 사용되는 네트워크 네비게이션 같은 존재
- CIDR 기반으로 동작, 각각의 대역에 대해 경로 설정 가능

#### 보안 그룹
- ACL(Access Control List)처럼 출발 IP, Port에 따라 출입 여부 결정
- 아웃바운드는 보통 통신의 원활함을 위해 열어두는 편
- 인바운드는 접속 및 통신용 포트를 제외한 나머지 통제

#### 인터넷 게이트웨이
- 퍼블릭 서브넷을 결정하는 요소
- 라우팅 테이블과 조합하여 특정 대역만 인터넷이 가능하도록 설정(대부분 관리 비용이 때문에 다 열어둔다.)

#### NAT(Network Address Translation) 게이트웨어
- private에서도 인터넷 사용 가능
- 모든 경로를 다 열지 않고 특정 포트만 보안 그룹을 통해 연다.

<div style="height: 50px;"></div>

## AWS EC2(Elastic Cloud Computer)
***
- UTM을 통해 VM을 생성하던 것과 비슷한 구조
- CPU, Memory, 저장소 용량 등을 미리 정하고 생성

<div style="height: 50px;"></div>

## LB(Load Balancer)
***
- AWS에서 네트워크 트래픽을 여러 대상으로 분산시켜 가용성과 탄력성을 높이는 서비스
- ALB(Application Load Balance)
  - HTTP 및 HTTPS 트래픽에 최적화된 7 단계 로드 밸런서
  - CloudWatch와 통합되어 다양한 지표와 로그 모니터링 
- NLB(Network Load Balancer)
  - 고성능을 요구하는 TCP, UDP 및 TLS 트래픽에 최적화된 4계층 로드 밸런서
  - 매우 낮은 지연 시간, 고가용성
- CLB(Classic Load Balancer)
  - 구형 로드 밸런서로 4계층 + 7계층 로드 밸런서
  - 설정이 간단하고 직관적

<div style="height: 50px;"></div>

## 실습
***
LB 생성 순서
1. VPC 생성
2. 서브넷 생성(여러개)
3. 공통 보안 그룹 생성
4. 인터넷 게이트웨이 생성
5. nat 게이트웨이 생성
6. 인스턴스 생성(여러개)
7. 라우팅 테이블 생성(public, private)
8. LB 생성
   - 타겟 그룹 생성

```shell
# 양쪽 서버에서 똑같이 진행
# 퍼블릭 서버 접속
ssh -i <key 파일 명> <OS 명>@<ip 주소>

# 파이썬 실행을 위한 다운로드
sudo apt(yum) update && sudo apt(yum) install -y python3-flask

# 파이썬 파일 작성
vi app.py

# 파일 실행
sudo python3 app.py

# LB DNS를 활용해 접근

# private 접근 하기
# public 서버에 접근 한 후 tem 파일 복사 후 파일 생성
vi key.tem

# private 접속 - 같은 네트워크 대역이라 접속이 가능하다.
ssh -i key.tem <OS>@<IPv4>

# private 접속 후 apt(yum) update
# 인터넷 연결이 없기 때문에 update 되지 않음
sudo apt(yum) update

# NAT 연결 후 인터넷 연결 테스트
sudo apt(yum) update
```