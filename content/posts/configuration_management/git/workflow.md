---
title: "[Git] Workflow? 작업 방식?"
date: 2023-03-05T04:39:34+09:00
draft: false
author: "choiseU"
tags: ["Git", "workflow"]
categories: ["Git"]
---
> workflow는 어떤 것이 있고 어떤 방법론이 있는지 조사해보자고 마음을 먹어 작성하게되었다. 

## WorkFlow??
***
Git은 브랜치로 작업을 관리한다.  
팀에서 브랜치를 어떻게 사용할 지에 대한 규칙을 Workflow라고 한다.  
Git에서 대표적인 Workflow는 `Git flow`, `Github flow`, `Gitlab flow`가 있다.

<div style="height: 50px;"></div>

## Git flow
브랜치의 역할이 명확하고 **대규모 프로젝트에 적합**.  
2개의 메인 브랜치, 3개의 보조 브랜치로 나뉨.

<div style="height: 20px;"></div>
<p style="font-size: 18px; color: snow">Main Branch</p>

- master
  - 제품으로 출시하는 브랜치
  - **실제 배포 중**이 상용 버전
- develop
  - 다음 출시 버전을 개발하는 브랜치
  - 실제 작동 중인 버전의 **다음 버전을 개발**하기 위한 메인 스트림

<div style="height: 20px;"></div>
<p style="font-size: 18px; color: snow">Serve Branch</p>

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

<div style="height: 20px;"></div>
<p style="font-size: 18px; color: snow">작업 과정</p>

1. 개인 작업은 develop에서 feature 브랜치를 따서 작업한다.
2. 개인 작업이 끝나면 develop에 병합한다.
3. develop브랜치에서 배포 준비가 끝나면 release 브랜치로 분할한다.
4. release 브랜치에서 디버깅하고 문제가 없으면 master와 develop 브랜치에 합친다.
5. master브랜치를 배포한다.
6. 만약 배포 버전에서 문제가 생겨 급하게 수정해야 하면 hotfix 브랜치를 따서 작업한다.
7. hotfix에서 버그픽스가 끝나면 master와 develop에 합친다.

<details>
    <summary style="margin-left: 30px; color: rgba(113, 187, 222, 1); cursor: pointer;">Git flow</summary>
    <img style="margin-left: 30px; width: 500px;" src="/img/posts/형상관리/git/git_flow.png">
</details>

<div style="height: 50px;"></div>

## Github flow
하나의 메인 브랜치인 **master 브랜치를 중점으로 운용하며 pull request을 활용**한 방식    
master 브랜치는 **항상 최신 버전 유지 및 안정적**이어야 함    
브랜치의 용도가 명확하게 분류되어 있지 않아 브랜치 생성 시 **브랜치 명을 명확하게 작성**    
일반적으로 feature 브랜치의 작업은 local 저장소가 아닌 **원격 저장소에 저장**   

<div style="height: 20px;"></div>
<p style="font-size: 18px; color: snow">작업 과정</p>  

- 개인 작업은 **feature 브랜치에서 작업하며 작업이 끝나면 pull request를 생성**한다.
- pull request에서 **코드 리뷰 후에 문제가 없으면 master로 병합**한다.
- **master에 병합하면 바로 배포 작업을 수행**한다. (CI 자동화 권장)

<details>
    <summary style="margin-left: 30px; color: rgba(113, 187, 222, 1); cursor: pointer;">Github flow</summary>
    <img style="margin-left: 30px; width: 500px;" src="/img/posts/형상관리/git/github_workflow.png">
</details>

<div style="height: 50px;"></div>

## Gitlab flow
master, develop(production) 2개의 메인 브랜치로 관리  
항상 최신 버전의 버전을 유지하지 않아도 됨  
**배포 버전과 개발 버전을 따로 둘 수 있다**는 장점  

- develop 브랜치는 github flow의 develop브랜치와 같은 역할을 한다.
- master 브랜치는 배포 버전이다.

<div style="height: 20px;"></div>
<p style="font-size: 18px; color: snow">작업 과정</p>

1. 개인 개발은 **feature 브랜치에서 작업하고 완료 시 merge**
2. develop 브랜치가 **배포되기 적합하다고 판단되면 master브랜치로 merge**한다.


<details>
    <summary style="margin-left: 30px; color: rgba(113, 187, 222, 1); cursor: pointer;">Gitlab flow</summary>
    <img style="margin-left: 30px; width: 500px;" src="/img/posts/형상관리/git/gitlab_workflow.png">
</details>

<div style="height: 50px;"></div>

## Centralized Workflow
***
단일 중앙 저장소를 사용하며 **master 브랜치 하나만 사용**  
팀 구성원들은 중앙 저장소를 복제하여 로컬 저장소를 만들고, **변경 내용을 커밋하고 언제든 중앙 저장소와 동기화 진행**  
중앙 저장소의 커밋이 기준이 되므로, 변경 사항을 푸시할 때, 저장소의 커밋과 **충돌난다면 Git은 푸시를 거부**  
이 때 **중앙 저장소의 변경 내용을 가져와 자신의 변경 내용과 병합하거나 재배열하여 충돌 해결 후 푸시**  

<div style="height: 20px;"></div>
<p style="font-size: 18px; color: snow">작업 과정</p>

- 중앙 저장소를 클론하려 로컬 저장소 생성
- 커밋 이력을 중앙 저장소에 푸시
- 다른 개발자가 중앙 저장소로 푸시할 때 최신 커밋을 반영되어 있지 않으면 푸시 거부
- push 할 때는 항상 최신 커밋 이력을 포함해서 올려야함

<div style="height: 20px;"></div>
<p style="font-size: 18px; color: snow">Centralized Workflow 특징</p>

Git에 특징인 **분산 버전 관리의 이점을 사용할 수 없지만 최소한의 명령어로 협업 가능**

<details>
    <summary style="color: rgba(113, 187, 222, 1); cursor: pointer;">Centralized Workflow</summary>
    <img style="width: 500px;" src="/img/posts/형상관리/git/centralized_workflow.png">
</details>

<div style="height: 50px;"></div>

## Feature Branch Workflow
***
**기능 별 브랜치를 만들어 작업** 하는 것  
master 브랜치에 손대지 않기 때문에 다른 기능 브랜치를 얼마든지 올려도 된다. 이는 로컬 저장소 백업 역할 수행   
master 브랜치는 **항상 버그 프리 상태로 유지하며, 병합 시 권한을 가진 사용자가 pull request 적용**

<div style="height: 20px;"></div>
<p style="font-size: 18px; color: snow">작업 과정</p>

- 중앙 저장소를 클론한 로컬 저장소에 **작업 브랜치 생성**
- 작업 브랜치에서 작업 후 커밋 생성 및 **원격 저장소로 푸시(브랜치와 같이)**
- **pull requst를 남겨 팀에게 작업 완료 사실을 알림**
- 담당자가 **작업 내용을 검증**하고 수정이 필요하다 판단되면 해당 내역을 알려줌
- 해당 부분을 **수정 후 푸시**(pr은 다시 올리지 않아도 수정 내용이 전부 표시)
- 담당자가 검증 후 pr을 수용하기로 결정 되었다면 **병합 진행**(병함은 아무나 가능)

<div style="height: 20px;"></div>
<p style="font-size: 18px; color: snow">Feature Branch Workflow 특징</p>

브랜치를 이용하면 안전하게 새 기능을 개발 할 수 있을 뿐만 아니라,  
pull request를 이용해서 브랜치에 대한 팀 구성원들의 토론 참여를 이끌어냄  
pull request는 코드 리뷰의 시작점  
코드 리뷰를 진행하면 [컨벤션](https://naver.github.io/hackday-conventions-java/)을 맞출 수 있음  
개발 중 막히는 부분이 pr을 통해 의견을 주고 받아 팀 구성원의 도움을 받을 수 있음.
큰 규모의 프로젝트를 관리할 때는 Gitflow Workflow를 사용해 기능 개발, 릴리스, 유지보수를 위해 좀 더 엄격한 워크플로우를 유지.

<details>
    <summary style="color: rgba(113, 187, 222, 1); cursor: pointer;">Feature Branch Workflow</summary>
    <img style="width: 500px;" src="/img/posts/형상관리/git/feature_branch_workflow.png">
</details>

<div style="height: 50px;"></div>

## Forking Workflow
***
하나의 중앙 저장소를 이용하는 것이 아니라, 개개인마다 **서로 다른 원격 저장소를 운영**  
자신의 **원격 저장소에 푸시**하고 그 내용을 **공식 저장소의 프로젝트 관리자에게 풀 리퀘스트**를 보냄   
**관리자는 공식 저장소에 푸시 권한을 주지 않고도 다른 개발자의 커밋을 수용**
프로젝트와 직접 관련이 없는 제 3자뿐만 아니라, **아주 큰 규모의 분산된 팀에서도 안전하게 협업**하기에 좋은 방법.  
특히, 오픈소스 프로젝트에서 많이 사용하는 방식

<div style="height: 20px;"></div>
<p style="font-size: 18px; color: snow">작업 과정</p>

- 공식 저장소를 fork해 나의 원격 저장소 생성
- 다른 개발자들은 나의 원격 저장소에 푸시 할 수 없음.
- fork한 원격 저장소를 clone해 작업 수행
- 내 원격 저장소에 push하고 작업분을 반영 할 수 있는 프로젝트 관리자에게 pr을 보냄. 

<div style="height: 20px;"></div>
<p style="font-size: 18px; color: snow">Forking Workflow 특징</p>

다른 워크플로우에서는 공식 저장소에 브랜치를 푸시해서 팀 구성원들이 공유했다면, Forking Workflow에서는 나의 브랜치를 다른 참여자들이 자신의 로컬 저장소로 내려 받아 참고하고 병합

<details>
    <summary style="color: rgba(113, 187, 222, 1); cursor: pointer;">Forking Workflow</summary>
    <img style="width: 500px;" src="/img/posts/형상관리/git/forking_workflow.png">
</details>

<div style="height: 50px;"></div>

## 포스트 작성 시 참고한 링크
- [Git Workflow](https://velog.io/@pond1029/Git-Workflow)
- [다양한 Workflow](https://lhy.kr/git-workflow)
- [centralized-workflow 이미지](https://gogojuni.dev/centralized-workflow/)
- [feature-branch-workflow 이미지](https://gogojuni.dev/feature-branch-workflow/)
- [forking-workflow](https://gogojuni.dev/forking-workflow/)