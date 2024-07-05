---
title: "가상화 기술"
date: 2024-07-03T18:03:57+09:00
draft: false
author: "choiseU"
tags: ["KakaoTechBootCamp", "BootCamp", "가상화기술", "IaaS", "PaaS", "SaaS"]
categories: ["KakaoTechBootCamp", "가상화"]
---
> 어제 어수선한 분위기 속에 첫날이 마무리되고  
> 두번째 수업이 진행되었습니다.  
> 오늘은 클라우드 개론에 대해 배웠고 까먹지 않기 위해 정리해보고자 합니다.  

## 가상화 기술
*** 
- 클라우드 서비스(IaaS : Infrastructure as a Service 혹은 CSP : Cloud Service Provider)
  - 각종 자원들을 가상화하여 서비스 제공(서버, 네트워크, 스토리지 등)
  - 기본 기능 : Compute, Network, Storage, Container, Database, Security, Ai 등
  - AWS, GCP, Kakao Cloud 등
- 플랫폼 기반 서비스(PaaS : Platform as a Service)
  - 본인 애플리케이션을 쉽게 업로드하여 서비스 활용
  - 가상화된 자원을 자동으로 할당받아 애플리케이션이 실행
  - Heroku, Vercel, Netlify, 카페24 등
- 솔루션 기반 서비스(SaaS : Software as a Service)
  - 사용자의 니즈가 반영된 애플리케이션이 가상화된 자원을 할당받아 곧바로 서비스 제공
  - 사용량에 따른 과금 정책이 대부분
  - 구글 드라이브, 드롭박스, 네이버 MyBox등 대부분의 서비스가 여기에 속한다.
 
<details>
    <summary style="margin-left: 60px; color: rgba(113, 187, 222, 1); cursor: pointer;">가상화 기술</summary>
    <img style="margin-left: 60px; width: 500px;" src="/img/posts/cloud/가상화기술.png">
</details>

<div style="height: 50px;"></div>

## 집중적으로 공부해야하는 가상화 기술
***
- 대부분의 기업이 IaaS를 통해 SaaS를 출시한다.
  - IaaS를 하는 기업은 대기업 위주이며(네이버 클라우드, 카카오 클라우드 등)
  - 대부분의 클라우드는 IaaS를 이용해 SaaS를 개발한다.
- 클라우드 시장
  - 보통 Iaas, PaaS, SaaS로 나누어 보고 IaaS 시장에서 가장 많이 사용되는 서비스는 현재 AWS다.
- IaaS를 만든다는 뜻
  - openStack 등의 솔루션을 통해 각 리소스를 가상화하고 서비스를 만드는것
  - 여기에 흥미가 있다면 C/C++/Python 등을 공부하여 openStack을 활용해보는 것이 좋다.
  - 다만, 현재로써는 석박사 과정이 필수이다.

<div style="height: 50px;"></div>

## 자주 사용하는 기능
***
- 가장 기본적으로 Network를 아용하여 네트워크 구조 세팅
- 세팅된 Network 위에 Compute를 이용한 서버 구축
- Database를 이용한 애플리케이션 DB 연결
- Storage를 이용하여 애플리케이션에서 나오는 로그와 같은 파일 저장
- 그 외로 Security를 통해 보안 강화, AI를 통해 AI 서비스 붙이기  
  즉, 이외에는 필요한 것들을 찾아 붙이는 방식

<div style="height: 50px;"></div>