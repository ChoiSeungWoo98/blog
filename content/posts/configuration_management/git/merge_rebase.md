---
title: "[Git] Merge와 Rebase 차이"
date: 2023-03-05T04:30:49+09:00
draft: false
author: "choiseU"
tags: ["Git", "Merge", "Rebase"]
categories: ["Git"]
---

> 프로그래밍을 공부 했을 시절 분기되었던 브랜치를 합치는 것 작업을 merge로 만 수행했었다.  
> 현업에 들어오고 나서 git history가 엉망이 되어가는 것을 직접 목격하였다...  
> 어떻게 해야 history를 잘 관리 할 수 있는지 궁금하였고 사수의 도움으로 rebase하는 것을 알게 되었다.  
> rebase 를 알고 사용하고 있지만 merge와 rebase의 차이점을 명확하게 알고 싶어 찾아보았다.  

## 들어가기 앞서
***
merge와 rebase의 차이를 알아보기 전에 이것들은 어떤 상황에서 사용하며 사용하면 어떤 일이 일어나는지 부터 간단하게 알아보고자 한다.  
[Git이란?](https://ChoiSeungWoo98.github.io/%ED%98%95%EC%82%B0%EA%B4%80%EB%A6%AC%EB%9E%80/)  
형상 관리 도구 중 하나이며 소스코드를 효과적으로 관리할 수 있게 해주는 공개 소프트웨어이다.

[branch란?](https://ChoiSeungWoo98.github.io/branch%EB%9E%80/)  
Software 개발 시 다양한 개발자들이 동일한 프로젝트 위에서 개발, 유지보수 등의 업무를 하는 경우가 많다.  
이때 하나의 프로젝트 에서 동시에 작업하게 되면 여러가지 문제가 발생한다.  
이 것을 해결하기 위해 각각 완전히 독립된 브랜치 생성하여 동시에 코드 개발 및 수정 할 수 있게 도와준다.

<div style="height: 50px;"></div>

## merge? rebase?
***
merge는 **분기된 branch를 다른 branch로 합치는 과정**이고  
rebase는 **branch의 base를 옮긴다**는 개념의 차이가 있다.

<div style="height: 50px;"></div>

## merge와 rebase의 특징
***
merge
- 병합을 하면 합쳐진 브랜치의 커밋 메시지가 중복으로 쌓임.
- 커밋 순서를 변경되지 않음.
- 존재하는 브랜치가 변경되지 않음.
- 새로운 merge commit을 생성.
<details>
    <summary style="margin-left: 30px; color: rgba(113, 187, 222, 1); cursor: pointer;">git merge</summary>
    <img style="margin-left: 30px; width: 500px;" src="/img/posts/형상관리/git/merge.png">
</details>

rebase
- 병합을 하면 브랜치의 커밋 메시지가 시간 순서대로 합침.
- 히스토리를 깔끔하게 유지하기 위해 사용.
- 분기된 브랜치를 마스터 브랜치 끝에 위치 시켜, master 브랜치를 재배치(rebase) 하는 것을 말함.
- 즉, rebase는 어떤 특정 브랜치의 커밋 이력을 base로 재정렬되면서 해쉬 ID가 바뀜

<details>
    <summary style="margin-left: 30px; color: rgba(113, 187, 222, 1); cursor: pointer;">git rebase</summary>
    <img style="margin-left: 30px; width: 500px;" src="/img/posts/형상관리/git/rebase.png">
</details>

<div style="height: 50px;"></div>

## rebase를 사용하는 이유
하나의 프로젝트의 많은 개발자들이 활발하게 작업을 진행하게 되면 많은 브랜치가 생기고  
master브랜치로 merge만 한다면 엄청나게 복잡한 git history를 볼 수 있을 것이다.   
rebase를 하여 **작업 순서대로 history를 관리하고 불필요한 병합 커밋을 제거**할 수 있다.

<details>
    <summary style="color: rgba(113, 187, 222, 1); cursor: pointer;">merge와 rebase history 비교</summary>
    <img src="/img/posts/형상관리/git/merge_disadvantage.png">
</details>

## rebase 사용 시 유의점
여러 사람이 사용하고 활발하게 커밋이 일어나는 브랜치라고 한다면, Rebase를 하는 것은 자칫 위험할 수 있습니다.  
왜냐하면 파생된 브랜치에서 이미 새로운 커밋이 발생하고 작업이 기록되고 있는데  
이전 기준 브랜치로 base를 변경해버리면 파생브랜치로 작업하고 있던 작업자들의 커밋 히스토리가 변경되어 버리기 때문입니다. 
각 작업자들은 자신의 커밋을 다시 반영하거나 재작업을 해야 할 수도 있습니다.  
따라서 혼자 작업하는 브랜치나 작업하는 사람이 적어 문제상황이 발생할 확률이 적은 경우에만 주의깊게 사용해야 합니다.

<div style="height: 50px;"></div>

## 포스트 작성 시 참고한 링크
- [merge와 rebase 차이](https://dongminyoon.tistory.com/9)
- [rebase 사용 시 유의사항](https://readystory.tistory.com/151)
