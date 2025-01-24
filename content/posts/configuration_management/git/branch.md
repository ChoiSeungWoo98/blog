---
title: "[Git] branch가 자세히 뭘까?"
date: 2023-03-05T00:40:51+09:00
draft: false
author: "choiseU"
tags: ["Git", "Branch"]
categories: ["Git"]
---
## 브랜치??
***
여러 개발자들이 **동시에 다양한 작업을 할 수 있게 만들어 주는 기능**이 바로 브랜치(Branch) 이다.  
각자 **독립적인 작업 영역(저장소) 안에서 마음대로 소스코드를 변경**할 수 있다.  
이렇게 분리된 작업 영역에서 **변경된 내용은 나중에 원래의 버전과 비교해서 하나의 새로운 버전으로 만들어** 낼 수 있다.

<div style="height: 50px;"></div>

## 브랜치 사용법
***
1. 메인 브랜치에서 자신의 작업 전용 브랜치를 만듦
2. 각자 작업을 진행한 후, 작업이 끝난 사람은 메인 브랜치에 자신의 브랜치의 변경 사항을 적용
3. 다른 사람의 작업에 영향을 받지 않고 독립적으로 특정 작업을 수행하고 그 결과를 하나로 모음
4. 브랜치로 그 작업의 기록을 중간 중간에 남기게 되므로 문제가 발생했을 경우 원인이 되는 작업을 찾아내거나 그에 따른 대책을 세우기 쉬워짐

<div style="height: 50px;"></div>

## Code
***
~~~bash
# 브랜치 생성
# git branch branchName
$ git branch myWork-1

# 브랜치 이동
# switch 혹은 checkout 둘 다 가능
# git switch branchName
$ git switch myWork-1

# 브랜치 생성 및 이동
# git checkout -b branch_name
# git switch -c branch_name
$ git switch -c myWork-2

# 현재 브랜치 확인
$ git branch

# 브랜치 삭제
# git branch -d branchName
$ git branch -d myWork-1
~~~

<div style="height: 50px;"></div>

## 포스트 작성 시 참고한 링크
- [브랜치란?](https://backlog.com/git-tutorial/kr/stepup/stepup1_1.html)