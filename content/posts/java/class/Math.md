---
title: "[Java] Math 클래스"
date: 2023-08-19T17:49:27+09:00
draft: false
author: "choiseU"
tags: ["Java-Basic", "Java", "Math", "Class"]
categories: ["Java"]
---
> 커리어리라는 어플을 보다가 주니어 자바 개발자를 위한 100가지 질문을 보게 되었다.  
> 오늘은 여러가지 질문 중 Math 클래스에 대해 알아보고자 한다.  

## Math 클래스란?
***
자바에서 제공되는 유틸리티 클래스로 자주 사용하는 상수들과 함수들을 미리 구현해 놓은 클래스입니다.

### 1. Math에 정의된 대표적인 상수
- Math.PI : 원주율 π (약 3.141592653589793)
- Math.E : 자연 상수 e (약 2.718281828459045)

### 2. Math에 정의된 대표적인 메서드
- abs(int a) / abs(long a) : 정수의 절댓값을 반환합니다.
- ceil(double a) : 주어진 숫자보다 크거나 같은 최소 정수를 반환합니다.
- floor(double a) : 주어진 숫자보다 작거나 같은 최대 정수를 반환합니다.
- round(float a) / round(double a) : 주어진 숫자를 반올림하여 long 형태로 반환합니다.
- min(int a, int b) / min(long a, long b) : 두 정수 중 작은 값을 반환합니다.
- max(int a, int b) / max(long a, long b) : 두 정수 중 큰 값을 반환합니다.
- sqrt(double a) : 주어진 숫자의 제곱근을 반환합니다.
- pow(double a, double b) : a의 b승을 반환합니다.
- sin(double a), cos(double a), tan(double a) : 삼각 함수 값들을 반환합니다.
- random() : 0 이상 1 미만의 난수를 반환합니다. (0.0 <= x < 1.0)

### 3. 각 메서드 사용 및 결과
- Math.abs(-1.5) : 1.5
- Math.ceil(-1.5) : -1.0
- Math.floor(-1.5) : -2.0
- Math.round(-1.5) : -2
- Math.min(-1.5, 3.0) : -1.5
- Math.max(-1.5, 3.0) : 3.0
- Math.sqrt(-1.5) : NaN (Not a Number : 제곱근이 실수 범위 내에 없기 때문에 이 경우 허수와 관련된 복소수 연산이 필요하며 Math 클래스에서는 지원하지 않음)
- Math.sqrt(4) : 2.0
- Math.pow(-1.5, 2.0): 2.25
- Math.sin(-1.5): -0.9974949866040544
- Math.cos(-1.5): 0.0707372016677029
- Math.tan(-1.5): -14.101419947171719
- Math.random(): [0.0, 1.0) 범위의 난수 (실행할 때마다 값이 달라집니다)
- Math.random() * 100 : 0 ~ 99 까지 랜덤으로 1가지의 수



<div style="height: 100px;"></div>

## 포스트 작성 시 참고한 링크
- [Math 클래스](http://www.tcpschool.com/java/java_api_math)