---
title: "클라우드 개념"
date: 2024-07-03T22:03:57+09:00
draft: false
author: "choiseU"
tags: ["KakaoTechBootCamp", "BootCamp", "클라우드개념", "리소스", "가상화"]
categories: ["KakaoTechBootCamp", "클라우드"]
---
> 어제 어수선한 분위기 속에 첫날이 마무리되고  
> 두번째 수업이 진행되었습니다.  
> 오늘은 클라우드 개론에 대해 배웠고 까먹지 않기 위해 정리해보고자 합니다.  

## 클라우드 개념
*** 
- 컴퓨터 네트워크를 통해 인터넷 상에서 데이터 저장, 컴퓨팅 파워, 소프트웨어 등을 제공하는 기술이다.
- 즉, 인터넷 상에서 **여러 리소스**를 내가 원할 때 원하는 만큼 제공한다.

<div style="height: 50px;"></div>

## 리소스 제공
***
1. 통째로 빌려주는 방법
   - 쉬운 방법이나, 내가 원하는 리소스랑 다를 수 있다.
     - 원하는 리소스가 8코어 16기가 인데 16코어 32기가 서버가 존재한 경우 오버스펙이 된다.
2. 사용자가 원하는 만큼 서버를 띄우는 방법
   - 통째로 빌려주는 것이 아닌 큰 서버에서 사용자가 원하는 만큼 서버를 만들어 제공한다.
   - 이때 사용하는 기술이 가상화(Virtualization)이다.

<div style="height: 50px;"></div>

## 가상화(Virtualization)
***
1. 개념
   - 물리적인 자원을 추상화하여 가상 자원을 만들어 관리하는 기술이다.(Ex : 안드로이드 애뮬레이터 등)
2. 방법
   - 호스트 가상화
     - 가장 쉬운 방법, window 혹은 mac에서 가상화 소프트웨어를 이용하여 서버를 만드는 방법이다.(Ex : Virtual Box, VMware Fusion 등)
    <details>
        <summary style="margin-left: 60px; color: rgba(113, 187, 222, 1); cursor: pointer;">호스트 가상화</summary>
        <img style="margin-left: 60px; width: 500px;" src="/img/posts/cloud/호스트가상화.png">
    </details>

    - 하이퍼바이저 가상화
      - 하드웨어에 하이퍼바이저를 설치하여 가상 자원을 만드는 방법이다.(Ex : Xen, KVM 등)
      - OS 명령어를 하이퍼바이저가 모두 받아들이거나(Para-Virtualization, PV)  
        하드웨어에서 OS 명령어를 이해하는 경우(Hardware Virtual
        Machine, HVM / Bare-Metal Hypervisor)가 있다.
      - 엔지니어가 주로 사용하는 방법이다.
      - 호스트 가상화와 가장 큰 차이점은 OS 위에 다른 OS를 띄우는 호스트 가상화와 달리  
        하드웨어 위에 하이퍼바이저를 설치 후 그 위에 OS를 띄운다.

    <details>
        <summary style="margin-left: 60px; color: rgba(113, 187, 222, 1); cursor: pointer;">하이퍼바이저 가상화</summary>
        <img style="margin-left: 60px; width: 500px;" src="/img/posts/cloud/하이퍼바이저가상화.png">
    </details>

    - 컨테이너 가상화
      - 컨테이너 관리 소프트웨어를 설치하여, 논리적으로 나누어 사용한다.(Ex : Docker, Linux Container 등)

    <details>
        <summary style="margin-left: 60px; color: rgba(113, 187, 222, 1); cursor: pointer;">컨테이너 가상화</summary>
        <img style="margin-left: 60px; width: 500px;" src="/img/posts/cloud/컨테이너가상화.png">
    </details>

<div style="height: 50px;"></div>

## AWS(Amazon Web Services)는 어떤 가상화를 사용할까?
***
- AWS EC2에서는 초반에 PV 방식을 사용하다가 HVM 방식을 사용하고 있으며, 최근 [Nitro System](https://aws.amazon.com/ko/ec2/nitro/)을 사용하기 시작했다.
- AWS ECS에서는 컨테이너 가상화를 활용 중이다.

<div style="height: 50px;"></div>

## 가상화 종류
***
1. 서버 가상화
   - 하나의 물리적 서버를 여러 가상 서버로 분할하여 사용
2. 데스크탑 가상화
   - 사용자의 데스크탑 환경 가상화
3. 애플리케이션 가상화
   - 애플리케이션을 가상 환경에서 실행하여 운영 체제와 분리
4. 네트워크 가상화
   - 물리적 네트워크 자원을 가상화하여 여러 가상 네트워크 생성
5. 스토리지 가상화
   - 물리적 스토리지를 추상화하여 논리적 스토리지 풀 생성

<div style="height: 50px;"></div>

## Virtual Machine과 Bare Metal
***
- Virtual Machine(VM)
  - 가상 머신. 가상화 방식(PV or HVM)기반의 서버
  - 대부분의 클라우드 내 서버는 VM 방식 사용
- Bare Metal(BM)
  - 큰 서버에서 분할해 제공하는 VM 방식과 달리 통째로 서버를 제공해주는 방법
  - 필요한 CPU, Memory, Storage 만큼 하드웨어를 만들어 전달
- Virtual Machine vs Bare Metal
  - VM은 같은 하드웨어 위에서 분할하여 사용하므로  
    한 사용자가 대량으로 리소스를 사용하면 하이퍼바이저에 영향이 가고 다른 사용자에게 까지 영향을 미칠수 있다.  
    따라서, 안정적으로 좋은 성능을 요구한다면 BM을 비용 절감을 요구한다면 VM을 사용을 추천한다.

<div style="height: 50px;"></div>

## CPU와 vCPU
***
- CPU
  - 실제 하드웨어 자원, 물리적인 서버에서 실제 연산
- vCPU
  - 가상화 환경에서 물리적 CPU 자원을 추상화한 자원, VM에 할당된 가상 자원
- CPU vs vCPU
  - 두 자원은 엄연히 다른 자원이다.