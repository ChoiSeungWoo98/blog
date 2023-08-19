---
title: "[Java] 문자열을 반전 시키는 가장 좋은 방법"
date: 2023-08-20T01:22:51+09:00
draft: false
author: "choiseU"
tags: ["Java-Basic", "Java", "String", "Reverse", "ReverseString", "StringBuilder"]
categories: ["Java"]
---
> 커리어리라는 어플을 보다가 주니어 자바 개발자를 위한 100가지 질문을 보게 되었다.    
> 오늘의 질문! 문자열을 반전 시키는 가장 좋은 방법은 무엇인가?  
> 오늘은 해당 질문에 대한 답변을 정리해보려 한다.  

## 문자열을 반전 시키는 가장 좋은 방법이란
***
문자열을 반전 시키는 방법은 정말 많이 있다.  
예를 들어 반복문을 사용하는 방법, 라이브러리 함수를 이용하는 방법, 재귀함수를 이용하는 방법 등 정말 다양한 방법이 있다.  
이 중에서 효율이 좋다고 생각하는 방법 1가지에 대해 알아보고자 한다.  


## StringBuilder를 사용해 문자열 반전 시키기
자바에서 문자열을 반전 시키는 가장 일반적인 방법으로 StringBuilder의 reverse() 메서드를 사용하는 방법이다.  
이 방법은 가장 효율적인 방법 중 하나입니다.  
문자열은 불변 객체이기 때문에 문자열을 직접 수정을 시도하면 매번 힙 영역의 새로운 문자열 객체를 생성하게 된다.  
이는 매번 Garbage가 쌓여 메모리 효율을 떨어트릴 수 있으며 StringBuilder를 사용하면 이러한 비 효율성을 줄여줄 수 있다.
~~~java
    public class reverseString {
    String origin = "Hello World";
    String reverse = new StringBuilder(origin).reverse().toString();
    
    System.out.println(reverse);  // 출력: "dlroW olleH"
    }
~~~

<div style="height: 100px;"></div>

## 포스트 작성 시 참고한 링크
- [자바 문자열 반전](https://velog.io/@sudong/%EA%B8%B0%EC%88%A0%EB%A9%B4%EC%A0%91%EB%AC%B8%EC%9E%90%EC%97%B4%EC%9D%84-%EB%B0%98%EC%A0%84%EC%8B%9C%ED%82%A4%EB%8A%94-%EA%B0%80%EC%9E%A5-%EC%A2%8B%EC%9D%80-%EB%B0%A9%EB%B2%95)