---
title: "String_Method"
date: 2023-08-20T02:35:44+09:00
draft: false
author: "choiseU"
tags: ["Java-Basic", "Java", "String", "Method"]
categories: ["Java"]
---
> 커리어리라는 어플을 보다가 주니어 자바 개발자를 위한 100가지 질문을 보게 되었다.    
> 오늘의 질문! String 클래스의 메서드는 무엇이 있을까?  
> 오늘은 해당 질문에 대한 답변을 정리해보려 한다.  

1. length(): 문자열의 길이를 반환합니다.  
1. isEmpty(): 문자열이 비어있는지 확인합니다.  
1. equals(Object obj): 주어진 객체와 문자열이 동일한지 비교합니다.  
1. equalsIgnoreCase(String str): 대소문자를 무시하고 문자열을 비교합니다.  
1. indexOf(String str): 지정된 문자열이 처음으로 나타나는 인덱스를 반환합니다.  
1. substring(int beginIndex): 지정된 인덱스부터 문자열 끝까지의 부분 문자열을 반환합니다.  
1. substring(int beginIndex, int endIndex): 지정된 범위의 부분 문자열을 반환합니다.  
1. split(String regex): 정규식을 기준으로 문자열을 나누어 배열로 반환합니다.  
1. toUpperCase(): 문자열의 모든 문자를 대문자로 변환합니다.  
1. toLowerCase(): 문자열의 모든 문자를 소문자로 변환합니다.  
1. trim(): 문자열의 앞뒤 공백을 제거합니다.  
1. replace(char oldChar, char newChar): 지정된 문자를 새로운 문자로 치환합니다.  
1. charAt(int index): 지정된 인덱스에 위치한 문자를 반환합니다.   
1. contains(CharSequence sequence): 주어진 문자열 또는 문자 시퀀스를 포함하는지 확인합니다.  
1. matches(String regex): 정규식과 일치하는지 확인합니다.  
1. concat(String str): 다른 문자열을 현재 문자열에 연결합니다.  
1. startsWith(String prefix): 주어진 접두어로 시작하는지 확인합니다.  
1. endsWith(String suffix): 주어진 접미어로 끝나는지 확인합니다.  
1. compareTo(String anotherString): 다른 문자열과의 사전 순서 비교를 수행합니다.  
1. compareToIgnoreCase(String str): 대소문자를 무시하고 사전 순서 비교를 수행합니다.  
1. format(String format, Object... args): 지정된 포맷으로 문자열을 생성합니다.  
1. valueOf(primitive data type): 기본 데이터 타입의 값을 문자열로 변환합니다.  
1. getBytes(): 문자열을 바이트 배열로 변환합니다.  




<div style="height: 100px;"></div>

## 포스트 작성 시 참고한 링크
- [문자열 메서드]()