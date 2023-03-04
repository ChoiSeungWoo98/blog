---
title: "Workflow란?"
date: 2023-03-05T04:39:34+09:00
draft: false
author: "choiseU"
tags: ["Git", "workflow"]
categories: ["Git"]
---
> workflow는 어떤 것이 있고 어떤 방법론이 있는지 조사해보자고 마음을 먹어 작성하게되었다. 

## WorkFlow란?
***
Git은 브랜치로 작업을 관리한다.  
팀에서 브랜치를 어떻게 사용할 지에 대한 규칙을 Workflow라고 한다.  
Git에서 대표적인 Workflow는 `Git flow`, `Github flow`, `Gitlab flow`가 있다.

<div style="height: 50px;"></div>

## Git flow
브랜치의 역할이 명확하고 대규모 프로젝트에 적합.  
2개의 메인 브랜치, 3개의 보조 브랜치로 나뉨.  

<p style="font-size: 18px;">Main Branch</p>

- master
  - 제품으로 출시하는 브랜치
  - **실제 배포 중**이 상용 버전
- develop
  - 다음 출시 버전을 개발하는 브랜치
  - 실제 작동 중인 버전의 **다음 버전을 개발**하기 위한 메인 스트림

<p style="font-size: 18px;">Serve Branch</p>

- feature
  - **기능을 개발**하는 브랜치
  - **develop에서 뻗어 나와 develop으로** 합쳐짐
  - 실제 개발을 할때 **가장 많이 쓰이는** 브랜치
  - 기능 별 브랜치 생성 후 개발 완료 시 develop 병합
  - 자유로운 브랜치명, 서버에 올리지 않고 **local에서 작업**
- release
  - 새로운 **버전을 배포**하기 위한 브랜치(QA 용도)
  - develop에서 뻗어나와 develop으로 합쳐지거나 배포 준비 완료 시 master로 합쳐짐
  - 주로 **버그를 수정하는 디버깅만 커밋**
  - release-* 라는 이름을 사용
  - master에 병합했다면 develop에도 병합해 내용 일치시킴
- hotfix
  - **상용 제품에서 버그 발생 시 처리**하는 브랜치
  - master에서 뻗어 나와 버그 수정 후 master와 develop으로 병합
  - 버그 픽스를 위한 브랜치로 **다버깅만 커밋하며, 보통 일회성 사용**

<p style="font-size: 18px;">작업 과정</p>

1. 개인 작업은 develop에서 feature 브랜치를 따서 작업한다.
2. 개인 작업이 끝나면 develop에 병합한다.
3. develop브랜치에서 배포 준비가 끝나면 release 브랜치로 분할한다.
4. release 브랜치에서 디버깅하고 문제가 없으면 master와 develop 브랜치에 합친다.
5. master브랜치를 배포한다.
6. 만약 배포 버전에서 문제가 생겨 급하게 수정해야 하면 hotfix 브랜치를 따서 작업한다.
7. hotfix에서 버그픽스가 끝나면 master와 develop에 합친다.

<details>
    <summary>Git flow</summary>
    <img src="/img/posts/형상관리/git/git_flow.png">
</details>

<div style="height: 50px;"></div>

## Github flow
하나의 메인 브랜치인 **master 브랜치를 중점으로 운용하며 pull request을 활용**한 방식    
master 브랜치는 **항상 최신 버전 유지 및 안정적**이어야 함    
브랜치의 용도가 명확하게 분류되어 있지 않아 브랜치 생성 시 **브랜치 명을 명확하게 작성**    
일반적으로 feature 브랜치의 작업은 local 저장소가 아닌 **원격 저장소에 저장**   

<p style="font-size: 18px;">작업 과정</p>  

- 개인 작업은 **feature 브랜치에서 작업하며 작업이 끝나면 pull request를 생성**한다.
- pull request에서 **코드 리뷰 후에 문제가 없으면 master로 병합**한다.
- **master에 병합하면 바로 배포 작업을 수행**한다. (CI 자동화 권장)

<details>
    <summary>Github flow</summary>
    <img src="/img/posts/형상관리/git/github_workflow.png">
</details>

<div style="height: 50px;"></div>

## Gitlab flow
master, develop(production) 2개의 메인 브랜치로 관리  
항상 최신 버전의 버전을 유지하지 않아도 됨  
배포 버전과 개발 버전을 따로 둘 수 있다는 장점  

- develop 브랜치는 github flow의 develop브랜치와 같은 역할을 한다.
- master 브랜치는 배포 버전이다.

작업 과정
1. 개인 개발은 **feature 브랜치에서 작업하고 완료 시 merge**
2. develop 브랜치가 **배포되기 적합하다고 판단되면 master브랜치로 merge**한다.


<details>
    <summary>Gitlab flow</summary>
    <img src="/img/posts/형상관리/git/gitlab_workflow.png">
</details>

<div style="height: 50px;"></div>

## 포스트 작성 시 참고한 링크
- [Git Workflow](https://velog.io/@pond1029/Git-Workflow)