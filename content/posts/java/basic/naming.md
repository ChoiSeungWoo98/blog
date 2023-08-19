---
title: "[Java] 자바 네이밍 규칙(Java Naming Convention)"
date: 2023-08-19T16:03:49+09:00
draft: false
author: "choiseU"
tags: ["Java-Basic", "Java", "Naming", "Convention"]
categories: ["Java"]
---
> 프로젝트를 하다보면 각자 다른 네이밍을 사용하다 보니 다른 사람이 작업한 코드를 보면 헷갈릴 때가 있다.  
> 그래서 나온것이 표준 네이밍 규칙이며 보통 권장사항 이다보니 많이 놓치고 있어서 한번 정리해보려 한다!  
> 오늘 정리할 네이밍 규칙은 Java 이다.  

## 1. 네이밍 규칙이란?
***
- 프로그래밍에서 변수, 함수, 클래스, 상수, 패키지 등의 작성할 때 따르는 규칙이다.
- 이러한 규칙을 따르면 코드의 가독성이 좋아지고 일관석 있게 작성할 수 있다.

## 2. 네이밍 규칙을 사용하면 따라오는 효과
***
- 가독성 향상 : 의미 있는 단어를 사용해 코드의 의도를 쉽게 알 수 있고, 유지보수나 협업에 도움이 된다.
- 일관성 유지 : 일관된 네이밍 규칙을 따르면 코드가 전체적으로 일관성 있어 다양한 파일과 모듈 간의 이동과 이해를 용이하게 만든다. 
- 버그 감소 : 명확한 이름을 사용하면 변수나 함수의 역할을 파악하기 쉬워지므로 실수나 버그 발생 가능성이 줄어든다.

## 3. 자바 네이밍 규칙
### 1. 공통 규칙
***
- 대소문자가 구분되어야 하고 길이에 제한이 없다.
- 예약어는 사용하면 안된다.(ex : class, import, char, break 등···)
- 숫자로 시작하면 안된다.
- 특수문자는 '_'(언더바)와 '$'(달러 기호)만 사용 가능하다.
- 파스칼 표기법과 카멜 표기법을 사용한다.
- 파스칼 표기법 : 모든 단어의 첫 번째 문자는 대문자이며 나머지는 소문자로 작성한다. (ex : PasclaCase )
- 카멜 표기법 : 최초로 사용되는 단어는 모두 소문자로 작성하고 그 이후 첫번째 문자는 대문자 나머지는 소문자로 작성한다. (ex : camelCase)
- 반의어는 반드시 대응하는 개념으로 사용해야 한다. ([반의어 종류 보러가기](#반의어))

### 2. 패키지 명명 규칙
***
- 소문자로 시작(모든 소문자를 권장)
- 가급적 한던어 사용 권장
- 표준 패턴 권장(com.(회사명 / 팀 이름).프로젝트명.상위패키지.하위패키지.클래스)  
- ex : com.choi.management.user.controller

### 3. 클래스 명명 규칙
***
- 파스칼 표기법 사용
- 명사 시작
- ex : UserController

### 4. 인터페이스 명명 규칙
***
- 클래스랑 비슷한 명명 규칙을 갖고있다.
- 복수형 개념인 경우 복수형을 작성해준다.
- 축약어, 약어는 가급적 작성하지 않고 의미있는 단어로만 작성한다.
- 특별한 접두사나 접미사를 사용하지 않고 파스칼 표기법 사용
- 형용사 사용 할 수 있다.(Runnable, Remote 등…)
- ex : ConvertUserToMemberHandler

### 5. 인터페이스 명명 규칙
***
- 클래스랑 비슷한 명명 규칙을 갖고있다.
- 복수형 개념인 경우 복수형을 작성해준다.
- 축약어, 약어는 가급적 작성하지 않고 의미있는 단어로만 작성한다.
- 특별한 접두사나 접미사를 사용하지 않고 파스칼 표기법 사용
- 형용사 사용(Runnable, Remote 등···)
- ex : ConvertUserToMemberHandler

### 6. 메서드 명명 규칙
***
- 카멜 표기법 사용한다.
- 동사로 시작한다.
- ex : sendMessage(String message)

### 7. 변수 명명 규칙
***
- 카멜 표기법 사용한다.
- 명확한 이름으로 작성한다.
- boolean으로 가져올 때는 앞에 is를 붙인다.
- ex : userName, isChecked 

### 8. 상수 명명 규칙
***
- 전부 대문자료 표기한다.
- 스네이크 케이스를 사용한다.(Snake Case : 단어와 단어 사이를 언더바('_')로 구분)
- ex : PI, MAX_COUNT

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
    public setName(String name) {스
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

## 반의어
- 돌아가기([자바 네이밍 공통 규칙 보러가기](#1-공통-규칙))
- get / set : 가져오다. / 할당하다.  
(ex : getAge() / setAge() )

- add / delete : 추가하다. / 제거하다.  
(ex : addUser() / deleteUser() )

- insert / delete : 삽입 / 삭제  
(ex : insertUser() / deleteUser() )  
  
- min / max : 최소 / 최대  
(ex : minCnt() / maxCnt() )  
  
- show / hide : 보이다 / 숨기다  
(ex : showMove() / hideMove() )  
  
- start / stop : 시동 / 정지  
(ex : startMethod() / stopMethod() )  
  
- suspend / resume : 일시 정지 / 재개하다  
(ex : suspendMove() / resumeMove() )  
  
- increment / decrement : 증가 / 감소  
(ex : incrementViews() / decrementViews() )  

- create / destroy : 창조하다. / 파괴하다.  
  (ex : createMap() / destroyMap() )  
  
- next / previous : 다음 / 이전  
(ex : nextUser() / previousUser() )  
  
- open / close : 열다 / 닫다  
(ex : openFile() / closeFile() )
  

<div style="height: 100px;"></div>

## 포스트 작성 시 참고한 링크
- [자바 네이밍 규칙 - 1](https://thalals.tistory.com/325)
- [자바 네이밍 규칙 - 2](https://dkswnkk.tistory.com/539)

