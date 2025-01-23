---
title: "[Java] String은 기본 타입인가? 그리고 StringBuffer, StringBuilder"
date: 2023-08-19T18:11:51+09:00
draft: false
author: "choiseU"
tags: ["Java-Basic", "Java", "String", "Class", "StringBuffer", "StringBuilder"]
categories: ["Java"]
---
> 커리어리라는 어플을 보다가 주니어 자바 개발자를 위한 100가지 질문을 보게 되었다.  
> 오늘은 여러가지 질문 중 String에 대해 알아보고자 한다.
> String은 기본 데이터 타입인지?
> 문자열을 조작하는 클래스는 무엇이 있는지?

## String은 무엇인가?
***
기본 자료형(int, float, char, boolean)처럼 자주 사용되는 class이다.  
String은 이 기본 자료형들과는 다르게 참조 자료형 class이다.  
참조 자료형이란 객체 자체에 값을 가지는 것이 아닌 객체에는 referenece(주소) 값을 갖고 있고 해당 reference에 객체의 값이 있는 형태다.  

## String은 기본 데이터 타입인가?
***
위에서도 말씀 드렸지만 String은 기본 데이터 타입이 아닌 참조 자료형 클래스 이다.  
기본 타입과 달리 heap 영역에 생성된다.

### 1. 문자열 생성 및 비교
아래와 같이 문자열을 리터럴로 생성한다면 literalName이라는 변수는 스택 영역에 저장되고 문자열인 "최승우"는 힙 영역에 String 객체로 생성된다.  
literalName이라는 변수에는 힙 영역에 저장된 주소 값이 저장된다.  
따라서 문자열 리터럴이 동일한 경우 같은 주소 값을 저장하게 돼 ==와 .equals 상관 없이 같다고 나온다.  
다만, new 연산자를 사용하여 객체를 생성하면 문자열의 값이 같더라도 다른 주소 값을 저장하기 때문에 ==을 사용하면 다르다고 출력한다.  
따라서 저장된 값을 비교하고 싶으면 equals()를 사용해야 한다.
~~~java
    public class StringTest {
        String literalName = "최승우";
        String newName = new String("최승우");
        
        System.out.println(literalName == newName); // false
        System.out.println(literalName.equals(newName)); // true
    }
~~~

### 2. 가변성을 갖고 있는 StringBuilder와 StringBuffer
들어가기 앞서, String은 불변속성을 갖는다.  
만약, 아래와 같이 sayHello라는 변수에 안녕!이라는 값을 리터럴로 생성하면 힙 영역에 String 객체로 생성하고,  
그 이후 " 승우야!"라는 값을 추가하게 되면 해당 객체에 "안녕 승우야!" 라는 값으로 변경했다고 생각할 수 있다.  
  
하지만 기존에 "안녕!"이 들어가 있던 객체를 참조하던 sayHello 변수는 힙 영역에 "안녕 승우야!"의 값을 갖고 있는 객체를 새로 생성한 후 해당 주소 값을 바라보고 있도록 변경된 것이고  
처음 생성되었던 "안녕!"이라는 값을 갖고 있는 메모리 영역은 Garbage로 남아 있다가 GC(Garbage Collection)에 의해 사라지게 된다.  
  
이는, String 클래스는 불변하며 문자열을 수정하는 시점에 새로운 String 인스턴스가 생성된다는 것을 의미한다.  
이 처럼 String은 불변하기 때문에 빈번한 수정이 있는 경우 힙 메모리 영역에 많은 Garbage가 쌓이므로 성능의 치명적인 영향을 끼친다.
  
그래서 가변성을 갖고 있는  StringBuilder와 StringBuffer 클래스를 도입했다.  

이 두 클래스는 .append(), .delete()를 이용하여 동일 객체내에서 문자열을 변경하는 것이 가능하다.  
문자열의 추가, 수정, 삭제가 빈번하게 발생하는 경우 이 두가지 클래스를 사용하는 것이 적합하다.

### 3. StringBuffer, StringBuilder의 차이점
가장 큰 차이점은 동기화 유무 이다.  
- Buffer는 동기화 키워드를 지원하여 멀티 쓰레드 환경에서 안전하다는 점(thread-safe)  
참고로 String도 불변성을 갖기 때문에 멀티 쓰레드 환경에서의 안성정을 갖고 있다.
- Builder는 동기화를 지원하지 않기 때문에 멀티 쓰레드 환경에서 사용하는 것은 적합하지 않지만 동기화를 고려하지 않는 만큼 단일 쓰레드에서의 성능은 Buffer보다 뛰어나다.
  
### 4. 정리
- 간단히 정리하면, String은 불변성으로 인해 안전하고 쓰기 쉽지만 문자열을 자주 조작하는 경우 오버헤드가 발생할 수 있습니다.  
- StringBuilder는 가변성으로 인해 자주 조작하는 경우 효율적이고, 단일 스레드 환경에서 사용하기 적합합니다.  
- StringBuffer는 StringBuilder와 유사하게 가변성을 제공하면서 멀티스레드 환경에서도 안전하게 사용할 수 있습니다.  
- 따라서 단일 스레드 환경에서는 StringBuilder를, 멀티스레드 환경에서는 StringBuffer를 선호하는 것이 좋습니다.
 
문자열 연산이 적고 멀티 쓰레드인 경우 : String  
문자열 연산이 많고 멀티 쓰레드인 경우 : StringBuffer  
문자열 연산이 많고 단일 쓰레드이거나 동기화를 고려하지 않아도 되는 경우 : StringBuilder  




<div style="height: 100px;"></div>

## 포스트 작성 시 참고한 링크
- [String 클래스](https://mimah.tistory.com/entry/Java-%EC%9E%90%EB%B0%94%EC%97%90%EC%84%9C%EC%9D%98-String-%ED%83%80%EC%9E%85)
- [문자열 조작 클래](https://ifuwanna.tistory.com/221)
