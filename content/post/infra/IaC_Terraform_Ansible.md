---
title: "[IaC] IaC 기초 및 Terraform, Ansible"
date: 2024-07-18T09:54:15+09:00
draft: false
author: "choiseU"
tags: ["AWS", "IaC", "Terraform", "Ansible"]
categories: ["IaC"]
---
> 오늘은 배포 자동화에 대해 배웠다.  
> 거의 대부분의 프로젝트가 자동화를 사용하는 만큼 집중해서 잘 들어야지      
> 잊지 않기 위해 복습 또 복습...

## IaC(Infrastructure As Code)
*** 
- 서버, 네트워크, DB, 애플리케이션 구성 등 IT 인프라를 수동 관리 대신 코드로 정의하고 관리하는 방식
- 프로그래밍 언어, 구성 파일을 사용하여 인프라 자동 배포 및 관리

#### 특징
- 자동화, 일관성 : 수동 오류를 줄이고 배포, 관리의 일관성 유지
- 버전 관리 : 변경 이력 추적 및 복구 가능
- 재사용성 : 코드 모듈화 및 템플릿화 를 통해 재사용성을 높여 비용 절감
- 협업 : Devops 문화의 핵심 요소
- 가시성, 투명성 : 모든 설정을 명시적으로 정의해, 인프라 구성 상태를 명확히 파악

#### 구현 방식
- 선언적 접근 방식 : 원하는 최종 상태 정의, 시스템 자동 구성(Terraform, AWS CloudFormation 등), 간결한 설정으로 이해가 쉽고 필요한 설정만 변경
- 명령적 접근 방식 : 수행할 명령어 순서 명시 및 인프라 설정을 위한 단계별 명령 작성(Ansible, Chef 등), 세부적인 제어 가능, 복잡한 논리와 조건 처리를 쉽게 구현

#### 도구
- Terraform : 클라우드 인프라를 코드로 정의하는 오픈소스 도구
- AWS CloudFormation : AWS 리소스 템플릿으로 정의하여 배포
- Ansible : 서버 구성 및 애플리케이션 배포 자동화 도구, YAML 포맷의 플레이북 사용
- Kubernetes : 컨테이너화된 애플리케이션 배포, 스케일링, 운영 자동화, Yaml 파일을 통해 클러스터 상태 관리

#### 워크플로우
- 계획 : 요구사항 분석 및 인프라 구조 설계
- 코드 작성 : 인프라를 코드로 정의
- 버전 관리 : 작성된 코드를 Git 등의 버전 관리 시스템에 저장 및 이력 관리
- 테스트 : 테스트 환경에서 코드 실행 및 결과 검증
- 적용 : 검증된 코드를 실제 환경에 배포
- 모니터링, 관리 : 배포된 인프라 모니터링 및 수정, 업데이트

#### 장점
- 신속한 배포 : 자동화된 프로세스를 통해 신속하게 배포
- 효율성 : 반복적인 작업을 자동화
- 일관성 : 모든 환경에서 동일한 설정 적용
- 복구 능력 : 코드 기반 인프라는 장애 시 빠르게 복구 가능
- 확장성 : 필요에 따라 쉽게 확장 및 축소 가능

<div style="height: 50px;"></div>

## Terraform
*** 
- 인프라를 코드로 관리하는 도구, HashiCorp에서 개발
- 인프라를 선언적으로 정의 및 관리
- 대부분 인프라를 테라폼해서 배포, 진짜 중요한 사업인 경우 손으로 배포

#### 특징
- 프로바이더 : AWS, Azure, GCP 등 다양한 클라우드 서비스 제공자 지원
- 인프라 코드화 : JSON과 유사한 HCL(HashiCorp Configuration Language) 사용
- 실행 계획 : 변경사항 적용 전 계획 미리 확인
- 모듈화 : 재사용 가능한 모듈 사용

#### 워크플로우
- init : 프로젝트 디렉토리 초기화 및 필요한 플러그인 다운로드
- plan : 변경 사항 시뮬레이션 및 계획서 제출
- apply : 계획된 변경 사항 실제 인프라 적용
- state : 인프라 상태 확인 및 관리
- destroy : 인프라 자원 제거

#### 예제
```shell
# CSP 설정
provider "aws" {
    # 할당 지역 설정
    region = "ap-northeast-2"
}

# 변수 설정
variable "instance_count" {
    # 기본 값 설정
    default = 3
}

# CSP 내부에서 사용할 리소스 명칭
resource "aws_instance" "example" {
    ami = "ami-123456"
    instance_type = "t2.micro"
}

# 오브젝트의 특정 항목을 파일로 출력
output "instance_ip" {
    value = aws_instance.example.public_ip
}
```

<div style="height: 50px;"></div>

## Ansible
*** 
- IT 자동화 도구로 서버 구성 관리, 애플리케이션 배포, 작업 자동화 지원
- 원격에서 수백, 수천대 까지 명령어를 한번에 실행해 모든 자동화 가능

#### 특징
- Agentless : SSH를 통해 연결 진행
- 모듈 기반 : 모듈을 통해 다양한 작업 수행
- YAML : 가독성 높은 YAML 포맷 사용
- 확장성 : 커뮤니티 모듈 및 플러그인을 통해 기능 확장 가능

#### 구성요소
- Inventory : 관리할 호스트 목록 정의
- Playbook : 작업 정의서(YAML 포맷 사용), 실질적인 명령 수행 부분
- Modules : 특정 작업을 수행하는 코드 블록
- Roles : 관련 작업을 그룹화하여 재사용
- Tasks : 실행할 작업 정의
- Handlers : 특정 조건에 따라 실행되느 작업
- Templates : Jinja2 템플릿을 통해 설정 파일 생성

#### 워크플로우
- 인벤토리 작성 : 호스트 목록 작성
- 플레이북 작성 : 수행할 작업을 정의한 YAML 파일 작성
- 작업 실행 : 플레이북 실행
- 상태 확인 : 호스트 상태 및 관리

<div style="height: 50px;"></div>

## 실습
***
1. 유저 생성(AdminstratorAccess)
2. 액세스키 생성(CLI)

```shell
# 액세스 키 등록
# 액세스키, 비밀 액세스 키, 리전, 타입 - json 추천 입력
aws configure

# 설정 확인
cat ~/.aws/credentials

# main.tf 파일 생성 후 붙여넣기(키 위치 밑 ip 변경)
vi main.tf

# 현재 디렉토리에 있는 Terraform 구성 파일 초기화 및 필요한 플러그인, 모듈 다운로드
terraform init

# 현재 구성 파일 기반으로 실행 계획 생성 및 적용될 변경 사항 확인
terraform plan

# 실행 계획을 실제로 적용하여 인프라 생성 혹은 업데이트
terraform apply

# hosts.ini 파일에 문구 추가
echo "[webservers]" > hosts.ini
# Terraform 출력 값에서 인스턴스 IP를 json 형식으로 가져와 hosts.ini 파일에 적용
terraform output -json instance_ips | jq -r '.[]' >> hosts.ini

# playbook.yml 파일 생성
vi playbook.yml

# ansible.cfg 파일 생성
vi ansible.cfg

# hosts.ini 파일을 인벤토리로 사용하여 Ansible 플레이북 실행
ansible-playbook -i hosts.ini playbook.yml

# ssh 접속
ssh -i <key> <os>@<ip>

# 실행 중인 모든 프로세서 중 nginx 필터링
ps -ef | grep nginx

# Terraform 구성을 기반으로 인프라를 제거
terraform destroy
```
