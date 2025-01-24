---
title: "[Network] 네트워크 개념"
date: 2024-07-04T22:03:57+09:00
draft: false
author: "choiseU"
tags: ["Network", ""]
categories: ["Network"]
---
> 네트워크에 대해 배웠는데 너무 모르겠다...  
> 잘 따라 가려면 더욱 공부해야겠다..

## 네트워크
***
- 둘 이상의 컴퓨터와 연결하는 링크의 조합이다.
- 물리적 네트워크는 어댑터, 케이블 및 전화선과 같은 장비이고 소프트웨어 및 개념 모델이 논리적 네트워크를 형성한다.

<div style="height: 50px;"></div>

## 네트워크를 알아야 하는 이유
***
- 통신 및 데이터 교환(컴퓨터와 다른 장치들이 서로 통신하고 데이터를 교환할 수 있게 한다.)
- 분산 시스템 및 클라우드 컴퓨팅(여러 컴퓨터가 네트워크를 통해 하나의 시스템 처럼 작동, 대규모 데이터 처리 및 저장 분석 등)
- 해킹, 데이터유출 등 다양한 공격으로 부터 보호하기 위해

<div style="height: 50px;"></div>

## OSI 7 Layer, OSI 4 Layer
***
- OSI(Open System Interconnection : 개방형 시스템 상호 연결) : 다양한 통신 시스템이 통신 할 수 있도록 국제표준화기구에서 만든 개념 모델

<details>
    <summary style="margin-left: 30px; color: rgba(113, 187, 222, 1); cursor: pointer;">OSI 7 Layer</summary>
    <img style="margin-left: 30px; width: 500px;" src="/img/posts/network/osi_7_layers.png">
</details>

- OSI 7 Layer
  - 응용 프로그램 계층(Application) - 데이터
    - 사용자 사용하는 응용프로그램과 인터페이스를 제공하는 계층
    - 네트워크 서비스에 접근 할 수 있는 인터페이스 제공
    - 주요 프로토콜 : HTTP, FTP, SMTP, DNS, Telnet, SSH등
    - 주요 프로토콜 포트: FTP(20 : 전송, 21 : 제어), SSH(22), SMTP(25), DNS(53), HTTP(80), POP3(110), NTP(123), HTTPS(443)
  <details>
      <summary style="margin-left: 30px; color: rgba(113, 187, 222, 1); cursor: pointer;">Application Layer</summary>
      <img style="margin-left: 30px; width: 500px;" src="/img/posts/network/application_layer.png">
  </details>
  
  - 프레젠테이션 계층(Presentation) - 데이터
    - 데이터 표현 방식 정의 및 압축, 암호화, 인코딩 수행
    - 데이터 형식 변환, 암호화, 압축 기능 제공
    - 주요 프로토콜 : JPEG, MPEG, ASCII
  <details>
      <summary style="margin-left: 30px; color: rgba(113, 187, 222, 1); cursor: pointer;">Presentation Layer</summary>
      <img style="margin-left: 30px; width: 500px;" src="/img/posts/network/presentation_layer.png">
  </details>
  
  - 세션 계층(Session) - 데이터
    - 양 끝단의 애플리케이션 간의 대화 관리와 동기화를 담당
    - 세션 설정, 유지, 종료 관리 및 데이터 동기화 보장
    - 주요 프로토콜 : RPC, NetBIOS
  <details>
      <summary style="margin-left: 30px; color: rgba(113, 187, 222, 1); cursor: pointer;">Session Layer</summary>
      <img style="margin-left: 30px; width: 500px;" src="/img/posts/network/session_layer.png">
  </details>
  
  - 전송 계층(Transport) - 세그먼트
    - 데이터 전송의 신뢰성과 흐름 제이를 담당
    - 데이터 분할, 재조립, 오류 복구등을 처리
    - 예 : TCP(Transmission Control Protocol), UDP(User Datagram Protocol
    - 주요 프로토콜 : TCP, UDP, SCTP
  <details>
      <summary style="margin-left: 30px; color: rgba(113, 187, 222, 1); cursor: pointer;">Transport Layer</summary>
      <img style="margin-left: 30px; width: 500px;" src="/img/posts/network/transport_layer.png">
  </details>
  
  - 네트워크 계층(Network) - 패킷
    - 데이터를 목적지까지 전달하는 경로 선택 및 패킷 라우팅
    - 라우팅, 패킷 전달, 트래픽 제어등을 수행
    - 예 : 라이터, IP 주소
    - 주요 프로토콜 : IP, ICMP, ARP, OSPF, BGP
  <details>
      <summary style="margin-left: 30px; color: rgba(113, 187, 222, 1); cursor: pointer;">Network Layer</summary>
      <img style="margin-left: 30px; width: 500px;" src="/img/posts/network/network_layer.png">
  </details>
  
  - 데이터 링크 계층(Data Link) - 프레임
    - 물리 계층에서 받은 데이터를 프레임 형태로 만들어 네트워크 계층으로 전달
    - 에러 검출, 흐름제어, 접근 제어 기능 수행
    - 예: 이더넷 스위치, MAC 주소
    - 주요 프로토콜 : Ethernet, PPP(Point-to-Point Protocol), HDLC, WI-FI
  <details>
      <summary style="margin-left: 30px; color: rgba(113, 187, 222, 1); cursor: pointer;">Data Link Layer</summary>
      <img style="margin-left: 30px; width: 500px;" src="/img/posts/network/data_link_layer.png">
  </details>
  
  - 물리 계층(Physical) - 비트
    - 데이터 전송을 위한 물리적 매체를 이용해 비트 스트림, 전송하는 계층
    - 전기적, 기계적, 기능적 틍성을 정의 및 데이터 송수신 담당
    - 예: 케이블, 허브, 리피트 등
    - 주요 프로토콜 : Ethernet, RS-232, USB 등

  <details>
      <summary style="margin-left: 30px; color: rgba(113, 187, 222, 1); cursor: pointer;">Physical Layer</summary>
    <img style="margin-left: 30px; width: 500px;" src="/img/posts/network/physical_layer.png">
  </details>

- 7 Layer vs 4 Layer
  - 단계가 많고 구조가 복잡해서 간단하고 인터넷 서비스에 적합한 4계층 모델이 개발됐다.

<details>
    <summary style="margin-left: 30px; color: rgba(113, 187, 222, 1); cursor: pointer;">차이</summary>
    <img style="margin-left: 30px; width: 500px;" src="/img/posts/network/osi7_osi4.png">
</details>

<div style="height: 50px;"></div>

## 계층별 장비
***
- 리피터(Repeater)
  - 물리 계층
  - 신호를 멀리 보내기 위한 증폭 장치
  - 신호 감쇠 방지 및 전송 거리 증가
- 허브(Hub)
  - 데이터 링크 계층
  - 여러 장치를 하나의 네트워크로 연결시켜주는 장치
  - 여러 컴퓨터 연결하지만 데이터 충돌 가능성이 있으며 Mac 주소를 인식하지 못한다.
- 브리지(Bridge)
  - 데이터 링크 계층
  - 두 개의 세그먼트를 연결 및 Mac 주소를 사용해 데이터 프레임 필터링
  - 세그먼트 간의 트래픽 필터링 및 브로드캐스트 도메인 분할하려 충돌 감소
- 스위치
  - 데이터 링크 계층
  - 여러 장치를 연결하고 Mac 주소를 사용하여 프레임을 특정 포트로 전송
  - 각 포트에 연결된 장치간 통신을 효율적으로 관리 및 충돌 도메인 분리해 성능 향상
- 라우터
  - 네트워크 계층
  - 다른 네트워크 간 데이터 전송, IP주소를 사용해 경로 결정
  - 여러 네트워크를 연결해 데이터 패킷을 올바른 경로로 라우팅, 논리적 주소(IP 주소)를 기반으로 네트워크 트래픽 관리

<div style="height: 50px;"></div>

## 주요 기술
***
- Ethernet
  - 가장 많이 사용되는 유선 네트워크, LAN(Local Area Network)에서 데이터 전송을 위해 사용
  - 데이터를 프레임 단위로 나누어 전송(Mac 주소, 데이터 오류 검출 코드 등을 포함)
- IP(Internet Protocol)
  - 네트워크에서 어떤 정보를 송수신하는 통신 규약, 호스트 주소를 지정 및 패킷 분할, 조립 기능 담당
  - 특징
    - 주소지정 : 고유한 IP 할당(IPv4, IPv6)
    - 패킷 분할 및 재조립 : 큰 데이터 패킷을 분할 후 전송, 수신 측에서 재조립
    - 경로 선택 : 패킷의 목적지까지 최적의 경로 선택
    - 비연결형 : 패킷 전송 시 연결 설정 없이 독립적으로 전송
    - 오류처리 : 패킷 전송 중 발생한 오류 처리 및 필요 시 재전송
    - 생존시간 : 패킷의 수명을 설정해 네트워크가 무한정으로 떠돌지 않게함, 라우터를 거칠 때 마다 TTL 감소
    - 프로토콜 식별 : 상위 계층 프로토콜 식별을 위해 헤더에 프로토콜 번호 포함
    - 헤더 체크섬 : IP 헤더의 오류 검출을 위한 체크섬 필드 포함
    - 패킷 형식 및 구조 : 헤더와 데이터로 구성되며 헤더는 목적지, 출발지 주소, TTL, 프로토콜 정보 등이 포함
  - IPv4 구조
    - 실습(WireShark)

    <img style="margin-left: 30px; width: 500px;" src="/img/posts/network/ipv4_header_format.png">
    
    - IPv4 구성 및 헤더
      - 32비트로 이루어져 있으며 최근 주소 부족으로 개별적으로 부여할 수 없다.
      - IPv4 주소 부족 현상을 해결하기 위해 네트워크 클래스가 등장했다.
      - 네트워크 클래스
        - A Class : 1.0.0.1   ~ 126.255.255.254
        - B Class : 128.0.0.1 ~ 191.255.255.254
        - C Class : 192.0.0.1 ~ 223.255.255.254
        - D Class : 224.0.0.0 ~ 239.255.255.255
        - E Class : 240.0.0.0 ~ 254.255.255.254
        - 특수 용도
          - 0.0.0.0/8 : 자체 네트워크
          - 10.0.0.0/8 : 사설 네트워크
          - 127.0.0.0/8 : 루프백(자기자신)
          - 169.254.0.0/16 : 링크 로컬(link local)
          - 172.16.0.0/12 : 사설 네트워크
          - 192.0.2.0/24 : 예제 등 문서에서 사용
          - 192.88.99.0/24 : 6to4 릴레이 애니캐스트
          - 192.168.0.0/16 : 사설 네트워크
          - 198.18.0.0/15 : 네트워크 장비 벤치마킹 테스트
          - 224.0.0.0/4 : 멀티캐스트
          - 240.0.0.0/4 : 미래 사용 용도로 예약
    

<div style="height: 50px;"></div>

## 서브넷, 서브넷팅, 서브넷마스크
***
- 서브넷
  - IP 네트워크 보다 더 작은 네트워크
  - 네트워크에 효율성을 높이고 쉽게 만들기 위해 사용, 분할로 인해 트래픽을 줄이고 보안을 강화 할 수 있다
- 서브넷팅
  - IP 주소 공간을 여러 개의 작은 서브넷으로 나누는 과정
- 서브넷마스크
  - IP에 네트워크와 호스트 부분을 구분하기 위해 사용되는 비트 패턴

<div style="height: 50px;"></div>

## 전송 계층
***
- TCP
  - 인터넷 같은 네트워크에서 데이터를 신뢰성 있게 전송하기 위해 설계된 연결 지향형 프로토콜
  - 구조
    - 3-way handshak : TCP 연결 설정 과정(SYN -> SYN-ACK -> ACK)
    - 흐름제어 : 데이터 전송 속도 조절, 수신자 버퍼 오버플로우 방지(슬라이딩 윈도우)
    - 혼잡제어 : 네트워크 혼잡 방지 및 해결, 패킷 손실과 지연 방지
- UDP
  - 데이터를 빠르고 효율적으로 전송하기 위해 설계된 비연결형 프로토콜
  - 전송 순서와 신뢰성은 보장되지 않지만 속도와 효율성이 필요한 부분에 적합(ex : 실시간 스트리밍)
    - 구조
      - 데이터그램 : 비연결형 데이터 전송 단위, 순서 보장 x
      - 스트리밍 : 실시간 연속 데이터 전송 방식, 주로 멀티 콘텐츠에 이용

<img style="margin-left: 30px; width: 500px;" src="/img/posts/network/TCP_UDP.png">

<div style="height: 50px;"></div>

## HTTP, HTTPs
***
- 서버/클라이언트 모델에 따라 데이터를 주고 받기 위한 프로토콜, TCP/IP 위에서 동작
- 연결 상태를 유지하지는 않는다.(비연결형) -> 요청/응답 방식으로 동작, Cookie와 Session의 등장으로 비연결성, 비상태성 보완
- 암호화되지 않기 때문에 보안에 취약하다.
- HTTP Response : 200, 404, 500 등 

<div style="height: 50px;"></div>

## 캡슐화 동작 방식
***

<img style="margin-left: 30px; width: 500px;" src="/img/posts/network/캡슐화동작방식.png">

<div style="height: 50px;"></div>

## 네트워크 용어 정리
***
- LAN(근거리 통신망) : 허브, 스위치로 연결하는 소큐모 네트워크, 주로 컴퓨터 장치와 연결된 네트워크를 말한다.
- MAN(대도시 통신망) : 도시와 도시의 통신망을 뜻하며 2개 이상의 LAN을 라우터, 브릿지로 연결, 고속 데이터 전송을 지원하며 통신사나 공공기관에서 운영한다.
- WAN(국가간 통신망) : 광역 네트워크로 지리적으로 넓은 영역에 걸쳐 여러 LAN, MAN을 연결하는 네트워크, 주로 Internet이라고 한다.
- WLAN(무선 근거리 통신망) : 라디오, 마이크로파(무선 랜 카드 등)를 이용해 데이터를 전송
- VPN(사설 통신망) : 가상 사설망으로 공중 네트워크를 암호화된 방법으로 접속할 수 있는 기술
- IP(Internet Protocol) : 인터넷을 통하는 네트워크에서 정보를 송수신하는 통신 규약
- 라우터 : 둘 이상의 패킷 전환 네트워크 또는 서브네트워크를 연결하는 장치, 네트워크 계층에서 동작한다.
- 라우팅 : 다양한 네트워크 간에 데이터를 전송하는 역할, 네트워크에서 패킷을 받아 목적지까지 최적의 경로를 결정 후 데이터 전달
- 패킷 : 네트워크에서 출발지와 목적지간에 라우팅되는 데이터 단위
- 포트 : 소프트웨어 기반이며 OS에서 관리하는 네트워크 연결이 시작되고 끝나는 가상의 지점
- 네트워크 케이블 유형 : 이더넷 케이블, 광섬유 케이블 등
- 프로토콜 : 데이터 교환 방식을 정의하는 규칙 체계
- CIDR : 데이터 라우팅 효율성을 향상시키는 IP주소 할당 방법
- VPC : 퍼블릭 클라우드 환경에서 사용할 수 있는 고객 전용 사설 네트워크
- NAT : Private IP 주소로 외부와 통신할 수 없어 Public IP 주소로 변환(Ex : 공유기)
- 루프백 : localhost로 알려져 있으며 자신의 ip 스택을 통해 네트워크 인터페이스로 전송된 데이터를 동일한 시스템으로 다시 전송
- 멀티캐스트 : 하나의 송신자가 여러 수신자에게 동시에 데이터를 전송하는 방식 주로 스트리밍, 주식 거래 등 대규모 수신자에게 동일한 데이터를 효율적으로 전달해야 하는 경우
- 포트포워딩 : 외부 네트워크에서 특정 포트로 들어오는 트래필을 내부 네트워크의 특정 IP 주소와 포트로 전달하는 네트워크 설정
- 보수표현법 : 컴퓨터에서 음수를 표현하는 데 사용하는 방법, 1의 보수는 반전(1010 -> 0101), 2의 보수는 반전 후 1을 더함(1010 -> 0110)

<div style="height: 50px;"></div>

## 포스트 작성 시 참고한 링크
[네트워크 및 통신개념](https://www.ibm.com/docs/ko/aix/7.2?topic=management-network-communication-concepts)  
