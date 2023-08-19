---
title: "[Java] JDK와 JRE의 차이 그리고 JIT, JVM"
date: 2023-07-21T19:29:42+09:00
draft: false
author: "choiseU"
tags: ["Java-Basic", "Java", "JDK", "JRE", "JIT", "JVM"]
categories: ["Java"]
---
> 커리어리라는 어플을 보다가 주니어 자바 개발자를 위한 100가지 질문을 보게 되었다.  
> 8개월 동안 회사에서 프로젝트를 여러개 진행하면서 다양한 기술을 사용해봤다.  
> 하지만 기초 및 이론 공부는 굉장히 소홀했었다..  
> 기초가 단단하지 않으면 나의 개발 스펙트럼도 짧아 질것 같아서 하나하나 정리해보려 한다.  
> 요즘 다시 괜찮아져서 블로그도 다시 시작... 화이팅..!

## 들어가기 앞서
***
- 오늘은 자바 플랫폼에 대해 알아보고자 한다.
- JDK, JRE, JVM은 자바 플랫폼의 3대 구성요소이다.
- 오늘은 JDK, JRE, JVM에 추가로 JIT까지 알아보고자 한다.
- 이미지를 먼저 확인 후 본격적으로 들어가보자..!

<details>
    <summary style="color: rgba(113, 187, 222, 1); margin-left: 30px; cursor: pointer;">JDK와 JRE 그리고 JVM</summary>
    <img style="margin-left: 30px; width: 500px" src="/img/posts/java/basic/differenceBetweenJDKAndJRE.png">
</details>
<div style="height: 100px;"></div>

## JDK(Java Development Kit : 자바 개발 키트)
***

### 1. JDK는 무엇일까?
- Java를 사용하기 위해 모든 기능을 갖춘 SDK(Software Development Kit)
- JRE를 포함한 컴파일러(javac)와 jdb, javadoc 같은 도구를 포함
- 즉, 프로그램을 생성하고 컴파일 할 수 있다.

<div style="height: 25px;"></div>

### 2. JDK 종류
* Java SE(Java Standard Edition)
  * 표준 에디션의 자바 플랫폼, 자바 언어의 핵심 기능 제공
  * 주요패키지 java.lang.\*, java.io.\*, java.util.\*, java.awt.\*, java.rmi.\*, java.net.\*
* Java EE(Java Enterprise Edition)
  * Java SE에 웹 애플리케이션 서버에서 동작하는 기능을 추가한 플랫폼
  * 즉, 서버측 개발을 하기 위해 필요(JSP, Servlet, JDBC 등 기업용 애플리케이션 개발에 필요한 다양한 플랫폼)
  * 이 스펙에 따라 제품을 구현한 것이 WAS로 부름
* Java ME(Java Micro Edition)
  * 임베디드 기기들에서 구동되기 위한 환경을 제공하는 API를 모아둔 플랫폼
  * 제한된 자원을 가진 휴대전화, PDA(소형 전자 기기) 등에서 Java 프로그래밍 언어를 지원하기 위해 만든 플랫폼

<div style="height: 25px;"></div>

### 3. JDK 기본 도구
- javac : 자바 컴파일러(자바 소스파일 => 바이트 코드)
- java : javac가 만든 클래스 파일을 해석 및 실행
- jdb : 자바 디버깅 툴

<div style="height: 100px;"></div>

## JRE(Java Runtime Environment : 자바 런타임 환경)
***

### 1. JRE는 무엇일까?
- 자바로 만든 애플리케이션을 실행할 수 있는 런타임 환경 구축
- JVM과 핵심 라이브러리 및 자바 런타임 환경에서 사용하는 프로퍼티 세팅이나 리소스 파일 제공
- JDK와 달리 개발하는데 필요한 툴은 제공되지 않는다.
- 클래스 로더, 클래스 라이브러리를 통해 작성한 코드를 라이브러리와 결합 후 JVM에 넘겨 실행
- JRE는 특별한 기능을 수행하기 보단 JVM이 원할하게 잘 작동할 수 있도록 환경에 맞춰주는 역할

<div style="height: 25px;"></div>

### 2. JRE 구성요소
- JVM(Java Virtual Machine) : 자바 가상 머신으로 아래 따로 다루겠습니다.
- Java Class Libraries : 개발하면서 자주 사용하는 여러 유용한 기능들을 모아놓은 클래스 집합 라이브러리
- Java Class Loader : JVM이 동작하다가 클래스 파일을 참조하는 순간 동적으로 읽어 JVM에 링크되고 메모리에 로딩하는 역할 

<div style="height: 100px;"></div>

## JVM(Java Virtual Machine : 자바 가상 머신)
***

### 1. JVM은 무엇일까?
- 자바 프로그램이 어느 기기, 운영체제 상에서도 실행될 수 있도록 만듦(WORA : 한 번 쓰고 모든 곳에서 실행한다)
- 메모리를 효율적으로 관리 및 최적화(Garbage Collection)
- JVM은 단독으로 사용이 불가, 최소 배포 단위는 JRE이다.

<div style="height: 25px;"></div>

### 2. 가비지 컬렉션(Garbage Collection)?
- JVM이 메모리를 관리하는 프로세스
- 사용하지 않는 메모리를 지속적으로 찾아 제거해 효육적인 메모리 관리


<details>
  <summary style="color: rgba(113, 187, 222, 1); margin-left: 30px; cursor: pointer;">가비지 컬렉션</summary>
  <img style="margin-left: 30px; width: 500px" src="/img/posts/java/basic/jvm.png">
</details>

<div style="height: 100px;"></div>

## JIT(Just In Time Compilation) 방식
***

### 1. JIT는 무엇일까?
- 프로그램을 실제 실행하는 시점에 기계어로 번역하는 컴파일 기법

<div style="height: 25px;"></div>

### 2. 컴파일 기법
- 컴파일 기법에는 인터프리터 방식와 컴파일러 방식로 나뉨
- 인터프리터 방식는 코드를 한 줄씩 중간 코드인 바이트 코드로 변환 후 실행
- 컴파일링 방식는 코드 실행 전, 소스 코드를 한번에 기계어로 변환 후 실행

<details>
  <summary style="color: rgba(113, 187, 222, 1); margin-left: 30px; cursor: pointer;">컴파일 기법</summary>
  <img style="margin-left: 30px; width: 500px" src="/img/posts/java/basic/compiler.jpeg">
</details>


<div style="height: 25px;"></div>

### 3. Java 컴파일 기법
- 자바는 컴파일러 방식을 사용한다
- Java Compiler를 통해 Byte Code로 변환되고 다시 기계어로 변환된다. 이 과정이 있기 때문에 느리다 평가가 존재한다.
- 이러한 단점을 극복하기 위해 JIT 방식이 채택되었다.

<div style="height: 25px;"></div>

### 4. JIT 방식
- 자주 쓸만한 코드들을 기계어로 변환 시켜놓고 저장 후 이미 변환된 기계어 코드를 재사용하는 방식

<div style="height: 100px;"></div>

## 포스트 작성 시 참고한 링크
- [JDK(Java Development Kit)](https://pythontoomuchinformation.tistory.com/277)
- [JRE(Java Development Kit)](https://www.itworld.co.kr/news/110768)
- [JVM(Java Virtual Machine)](https://m.blog.naver.com/goreng2/221770110714)
- [JIT(Just In Time Compilation)](https://medium.com/@lazysoul/jit-just-in-time-16bb63f3ae26)
