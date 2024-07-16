---
title: "AWS IAM을 이용한 S3 실습"
date: 2024-07-15T15:01:46+09:00
draft: false
author: "choiseU"
tags: ["KakaoTechBootCamp", "BootCamp", "AWS", "IAM", "S#"]
categories: ["KakaoTechBootCamp", "AWS"]
---
> 오늘은 AWS 첫번째 실습 시간이다.  
> IAM에 대해 공부 후  
> S3를 통해 제어하는 실습  

## IAM
*** 
- 클라우드 서비스에서 사용자의 리소스 접근을 제어하는 웹 서비스
- 사용자 및 그룹을 생성해 리소스 권한 관리

#### IAM User
- Aws 리소스에 접근하기 위해 생성되는 개별 엔티티
- 고유한 자격 증명(로그인 정보)과 함께 제공, 권한을 부여받아 작업 수행

#### IAM Group
- 공통적인 권한을 부여하기 위해 사요되는 논리적 단위
- 사용자별 권한을 할당하는 대신 그룹에 권한 할당

<div style="height: 50px;"></div>

## IAM 정책(Policy)
*** 
- AWS 리소스에 대한 접근 권한을 정의하는 JSON 문서
- 권한을 세부적으로 제어
- 보안과 권한 관리를 위해 필수적인 구성 요소

#### 관리형 정책(Managed Policies)
미리 정의된 정책으로 사용자가 쉽게 권한을 부여할 수 있도록 설계

#### 인라인 정책(Inline Policies)
특정 사용자, 그룹 또는 역할에 직접 연결된 정책  
다른 엔티티와 공유되지 않고 연결된 엔티티 삭제 시 정책도 삭제  
권한을 좀 더 세밀하게 제어하고자 할 때 사용

#### 구성요소
- statement : 정책의 주요 내용이 포함된 부분, 다중 statement 가능
- Effect : 권한 효과를 정의(허용 혹은 거부)
- Action : 허용, 거부할 작업 정의
- Resource : 작업이 적용되는 리소스 정의
- Condition : 조건을 추가해 세부적인 적용 제어

<div style="height: 50px;"></div>

## 실습
*** 
1. IAM User 생성
2. IAM User Group 생성
3. 생성한 유저 로그인 후 권한 확인
4. 정책 추가
5. 버킷 생성
6. 권한 정책 연결 후 테스트
7. 서버 접속 후 s3 테스트

```shell
# 인스턴스 접속
ssh -i <key> <os>@<ip>

# aws 설치 확인
asw --version

# S3에 파일 업로드
aws s3 cp <파일명> s3://<버킷이름>/

# S3에 업로드된 파일 내려받기
aws s3 cp <파일명> s3://<버킷이름>/<버킷내 파일명> <로컬 파일명>

# S3에 업로드된 파일 리스트
aws s3 ls <파일명> s3://<버킷이름>/

# S3에 업로드된 파일 삭제
aws s3 rm <파일명> s3://<버킷이름>/<버킷내 파일명>
```