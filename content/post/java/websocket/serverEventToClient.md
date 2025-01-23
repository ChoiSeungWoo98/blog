---
title: "[Java] 서버에서 클라이언트로 이벤트를 보내는 4가지 방법"
date: 2023-05-06T19:29:42+09:00
draft: false
author: "choiseU"
tags: ["WebSocket", "Java", "Spring-Boot", "웹소켓"]
categories: ["WebSocket"]
---
> 일을 하던 중 프로그래스 바와 같은 작업의 완료 타이밍을 알 수 있는 방법이 있을까?  
> 같은 고민을 하다가 WebSocket을 알게 되었고 그 과정을 글로 작성해보려고 한다.

## 서버에서 클라이언트로 이벤트를 보내는 4가지 방법
***

### 1. Polling

- 클라이언트가 평벙한 http request를 서버로 계속 날려서 이벤트 내용을 받는 방법
- 가장 쉬운 방법이지만 클라이언트가 지속적으로 request를 보내야 하기 때문에 클라이언트가 많아 질 수록 서버 부담이 급증
- 실시간으로 정보를 응답 받는 것이 아닌 반복해서 request를 보내는 사이에 바뀐 내용을 받아오는 방식
- http 오버헤드가 발생한다는 큰 단점. 하지만 일정 시간 갱신되는 서버 데이터의 경우 유용.

<details>
    <summary style="margin-left: 30px; color: rgba(113, 187, 222, 1); cursor: pointer;">Polling 방식</summary>
    <img style="margin-left: 30px; width: 500px;" src="/img/posts/java/webSocket/Polling.png">
</details>

### 2. Long Polling
- 서버 측에서 접속을 열어두는 시간을 길게하는 빙식
- 클라이언트가 서버에 http request를 날리면 서버에서 응답해야할 이벤트가 발생하면 그 순간 응답을 하는 방식
- 응답을 받은 클라이언트는 바로 http request를 날려 다음 이벤트 대기
- polling 방식보다 서버 부담은 줄지만 이벤트 발생 간격이 좁다면 polling이랑 다르지 않음
- 다수의 클라이언트에게 동시에 이벤트가 발생될 경우 클라이언트가 바로 접속을 시도하면서 서버 부담이 급증

<details>
    <summary style="margin-left: 30px; color: rgba(113, 187, 222, 1); cursor: pointer;">Long Polling 방식</summary>
    <img style="margin-left: 30px; width: 500px;" src="/img/posts/java/webSocket/Long_Polling.png">
</details>

### 3. WebSocket
- 양방향 채널을 이용해 채팅방 처럼 양방향 통신하는 방식
- 기존 http요청 응답 방식은 요청한 클라이언트에 응답만 가능했지만, ws 프로토콜을 통해 웹소켓 포트에 접속해 있는 모든 클라이언트에 이벤트 응답 가능
- 최초 접속이 일반 http request를 통해 handshaeking 과정을 통해 이루어 지기 때문에, 기존 80, 443포트로 접속하므로 추가 방화벽을 열지 않아도 가능
- http 규격인 CORS 적용이나 인증등의 과정을 기존과 동일하다는 장점
- 단, websocket 프로토콜을 처리하기 위한 전이중 연결과 새로운 웹소켓 서버 필요

<details>
    <summary style="margin-left: 30px; color: rgba(113, 187, 222, 1); cursor: pointer;">WebSocket 방식</summary>
    <img style="margin-left: 30px; width: 500px;" src="/img/posts/java/webSocket/WebSocket.png">
</details>

### 4. SSE(Server-Sent-Events)
- HTML5 표준안이며 어느정도 웹소켓의 역할을 하면서 가벼움
- WebSocket과 같이 양방향이 아닌 server -> client 단방향이기 때문에 서버에서 이벤트나 메시지를 client로 push 하는 작업에 유용
- 양방향이 아니라 요청 시 ajax로 쉽게 이용
- 재접속 처리 같은 대부분이 저수준 처리가 자동 지원
- IE는 기본 미지원이지만, polyFill을 이용할 경우 IE를 포함한 크로스브라우징 가능

<details>
    <summary style="margin-left: 30px; color: rgba(113, 187, 222, 1); cursor: pointer;">SSE(Server-Sent Event) 방식</summary>
    <img style="margin-left: 30px; width: 500px;" src="/img/posts/java/webSocket/Server-Sent-Events.png">
</details>

<div style="height: 50px;"></div>

## WebSocket + Stomp를 이용하여 서버와 양방향 통신
[다음 게시물은 WebSocket과 Stomp를 이용하여 서버와 양방향 통신을 하는 방법에 대해 스몰 모듈 프로젝트를 만들고자 한다.](https://ChoiSeungWoo98.github.io/websocket/)

## 포스트 작성 시 참고한 링크
- [서버에서 클라이언트로 이벤트를 보내는 4가지 방법](https://inpa.tistory.com/entry/WEB-%F0%9F%93%9A-Polling-Long-Polling-Server-Sent-Event-WebSocket-%EC%9A%94%EC%95%BD-%EC%A0%95%EB%A6%AC)