---
title: "[Java] final 사용법"
date: 2023-07-22T18:37:42+09:00
draft: false
author: "choiseU"
tags: ["Java-Basic", "Java", "final"]
categories: ["Java"]
---
> 커리어리라는 어플을 보다가 주니어 자바 개발자를 위한 100가지 질문을 보게 되었다.  
> 오늘은 여러가지 질문 중 final에 대해 알아보고자 한다.  

## java에서 final 키워드란 뭘까?
***

### 1. final 의미
- 자바에서 final은 변수, 메서드, 클래스에 사용되는 키워드로서 불변성을 나타낸다.
- final로 선언된 요소는 한번 초가화하면 그 값을 변경할 수 없다.
- 예를 들면 정보처리기사라는 시험의 점수는 고정되어 있다! 시험을 보는 사람마다 점수가 다르게 선정된다면 혼란을 야기할듯..
- 다만, 시험보는 사람의 수험번호와 같은 경우 모든 사람이 다를 것이다.
- 이와 같은 경우 각각의 점수를 final로 이름을 변수로 선언하는 것이 바람직하다!

### 2. final 종류
 1. final 변수
 - 값 변경 불가능
 - 컴파일 시간 상수(final 변수는 컴파일 시간에 값을 결정하므로, 값을 바로 인라인하여 코드 삽입 가능)
 - 인스턴스와 정적 변수에 적용 가능
~~~java

public class Score() {
    // final 변수 선언과 초기화(최대 점수 : 100점)
    // 만약 초기화를 비어둔다면 추후에 초기화가 불가능 하다...(반드시 선언과 동시에 초기화 해주자!!)
    // 자바 명명 규칙은 나중에 게시물로 상세하게 작성해보겠다! 오늘 사용하는 상수는 대문자로! 단어와 단어 사이는 언더바를 이용한다!
    final int MAX_SCORE = 100;
  
    // 컴파일 에러가 발생
    MAX_SCORE = 60;
}
~~~
 2. final 메서드
 - 오버라이딩 방지
 - 안정성 확보(의도하지 않은 동작 변경 방지, 일관성 유지)
~~~java
final class Exam {
  // 시험의 최대 점수는 final로 선언하고 name은 변수로 선언
  private final int MAX_SCORE = 100;
  private String name;

  // 이름 입력
  public setName(String name) {
    this.name = name;
  }

  // 이름 가져오기
  public String getName() {
    return name;
  }

  // 최대 점수 가져오기
  public final String getMaxScore() {
    return MAX_SCORE;
  }

}


class MathExam extends Exam {

    // 이름 가져오기 메서드 오버라이딩 가능
    public String getName() {
        System.out.println("이름 : " + name);
        return name;
    }
  
    // 컴파일 에러 발생(최대 점수 가져오기 메서드를 오버라이딩 불가)
    public final String getMaxScore() {
        // ...
    }
}
~~~
 3. final 클래스
 - 상속이 불가능
 - 메서드 오버라이딩이 불가능
 - 해당 클래스를 변경하지 못하기 때문에 보안성 및 안정성이 강화
~~~java
final class Exam {
    // 시험의 최대 점수는 final로 선언하고 name은 변수로 선언
    private final int MAX_SCORE = 100;
    private String name;

    // 이름 입력
    public setName(String name) {
        this.name = name;
    }

    // 이름 가져오기
    public String getName() {
        return name;
    }

    // 최대 점수 가져오기
    public String getMaxScore() {
        return MAX_SCORE;
    }
    
}

// 아래의 코드는 컴파일 에러 발생
class MathExam extends Exam {
  // ...
}
~~~

<div style="height: 100px;"></div>

## 포스트 작성 시 참고한 링크
- [자바에서 final에 대한 이해](https://advenoh.tistory.com/13)
