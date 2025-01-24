---
title: "[Blog] 깃 블로그 만드는 방법"
date: 2023-03-04T14:16:49+09:00
draft: false
author: "choiseU"
tags: ["Blog", "Hugo"]
categories: ["Blog"]
---

> 현업에서 일하기 시작한지 이제 3개월이 지나가고 있는 시점에 공부가 필요하다고 뼈저리게 느끼고 있습니다.  
> 직장에 다니기 전에 네이버 블로그를 통해 배운 내용을 정리하였지만   
> 조금 더 개발자스러운 블로그를 운영하고 싶다고 느껴 깃 블로그를 만들게 되었습니다.  
> 시작하기 앞서 운영체제는 MAC에서 제작하였습니다.  

## 블로그 플랫폼 선택
***
블로그를 쓰려고 마음먹고 나서 플랫폼이 뭐가 있는지 찾아보면서  
나한테 가장 잘 맞는 플랫폼은 뭐가 있을까?  
많은 고민을 하던 중 가장 많이 사용되고 있는듯(?)한 플랫폼 3가지를 비교해 보았다.
<div style="border-radius: 20px; padding: 5px 30px;background-color: rgba(98,92,92,0.3);">
    <p style="font-weight: bold;">Jekyll</p>
    <ul>
        <li>Ruby 기반</li>
        <li>GitHub Page에 최적화되어 있음</li>
        <li>현재 가장 대중적으로 사용하는 플랫폼</li>
        <li>한글 레퍼런스가 제일 많음</li>
        <li>빌드를 진행하는데 너무 오래걸림</li>
    </ul>
    <p style="font-weight: bold;">Hexo</p>
    <ul>
        <li>JS(Node.js) 기반</li>
        <li>한글 레퍼런스 꽤 있음</li>
        <li>마크다운 문서로 만든 포스팅을 하는 방법이 간단</li>
        <li>Git으로 포스트 버전관리 불가능(두가지 브랜치로 관리)</li>
    </ul>
    <p style="font-weight: bold;">Hugo</p>
    <ul>
        <li>GoLang 기반</li>
        <li>빌드가 빠름</li>
        <li>문서화 잘되어 있음</li>
        <li>한글 레퍼런스가 거의 없음</li>
    </ul>
</div>

<div style="height: 50px;"></div>

## **Hugo!!** 너로 정했다!!
***
기존 네이버 블로그를 작성하면서 테마가 이쁘고 커스텀 할 수있는 요소가 많은 블로그를 만들고 싶었다.  
테마가 마음에 들면서 기능이 많았으면 좋다고 생각했고 jekyll, hexo, hugo 중 빌드 속도가 제일 빠르고 Golang을 사용해 볼 수 있는 좋은 기회라는 생각이 들어 hugo를 선택하게 되었다.

<div style="height: 50px;"></div>

## 기본 환경 세팅
***
1. [HomeBrew 설치](https://brew.sh/index_ko)  
터미널에 아래 코드를 입력해주면 다운로드가 완료 된다!
~~~
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
~~~

<div style="height: 10px;"></div>

2. [Github 회원가입](https://github.com/signup?ref_cta=Sign+up&ref_loc=header+logged+out&ref_page=%2F&source=header-home)  
순서대로 진행해주면 가입된다! 또는 포털 사이트에서 github 입력 후 오른쪽 상단 sing-in을 누르면 위 링크와 같이 가입할 수 있다!

<div style="height: 10px;"></div>

3. [Git Downloads](https://git-scm.com/downloads)
홈페이지에 방문해 운영체제에 맞게 다운받아준다!

<div style="height: 10px;"></div>

4. [Golang 설치](https://go.dev/dl/)  
필자는 install을 통해 Golang을 다운했다  
pakege-version : go1.20.1.darwin-amd64.pkg

<div style="height: 50px;"></div>

## Hugo 설치
***
터미널에 다음과 같이 입력한다.
~~~bash
# hugo 설치
$ brew install hugo

# hugo version 확인
$ hugo version  

# 다음과 같이 뜨면 정상적으로 설치가 완료 된 것이다.  
hugo v0.110.0+extended darwin/amd64 BuildDate=unknown

# 만약 brew link 에러가 발생한다면 brew에 권한을 설정해줘야함
$ sudo chown -R $(whoami) $(brew --prefix)/*
~~~

<div style="height: 50px;"></div>

## Github repository 생성
***
2개의 레포지토리를 만들어야한다.  
 ex) `blog`, `<username>.github.io`  

내가 만든 레포지토리  
`blog`, `choiseungWoo98.github.io`

<div style="height: 50px;"></div>

## Hugo로 프로젝트 생성
***
내가 따로 프로젝트를 만들지 않아도 hugo가 알아서 만들어 준다.  
간편해..👍🏻
~~~bash
# hugo 프로젝트 생성
$ hugo new site blog  

# 생성 완료되면 출력 문구
Congratulations! Your new Hugo site is created in /Users/username/folder/blog.

Just a few more steps and you're ready to go:

1. Download a theme into the same-named folder.
   Choose a theme from https://themes.gohugo.io/ or
   create your own with the "hugo new theme <THEMENAME>" command.
2. Perhaps you want to add some content. You can add single files
   with "hugo new <SECTIONNAME>/<FILENAME>.<FORMAT>".
3. Start the built-in live server via "hugo server".

Visit https://gohugo.io/ for quickstart guide and full documentation.
~~~

<div style="height: 50px;"></div>

## 테마 설정
***
테마는 직접 만들 수 있다고 한다. 하지만 저는.. [기존 공개된 테마](https://themes.gohugo.io/) 중 가장 마음에 드는거로 사용하려한다.  
원하는 테마를 선택했다면 아까 다운받은 프로젝트에 적용시켜 주자!  
필자는 [LoveIt테마](https://themes.gohugo.io/themes/loveit/)를 사용하였다!!  
해당 사이트 이동 후 Download를 누르면 Github 페이지로 이동한다. 오른쪽 초록색 Code를 클릭 후 링크를 복사하자!
~~~bash
# 현재 경로 확인
$ pwd

# 프로젝트 경로로 이동 보통 유저 정보는 default로 설정되어 있다. 나갈때는 cd ..
$ cd blog

# 프로젝트 폴더에 들어왔는지 확인
$ pwd

# 잘 들어왔으면 아래와 같이 출력된다.
# /Users/<username>/blog 

# git 저장소로 사용하기 위한 git 명령어
$ git init

# git branch 명을 변경하려면 사용해주면 된다 나는 master가 아닌 main으로 사용하고 있다.
$ git branch -M main

# 아까 사용하려고 했던 테마의 깃 주소를 복사해 아래와 같이 작성해주면 테마가 다운로드 된다.
# git submodule add <복사한 테마 주소> themes/<테마 이름>
$ git submodule add https://github.com/dillonzq/LoveIt.git themes/LoveIt

# blog 폴더 내부에 있는 config.toml을 다운받은 테마에 맞게 수정해준다
# 기존에 config.toml
#    baseURL = 'http://example.org/'
#    languageCode = 'en-us'
#    title = 'My New Hugo Site'
# cp themes/<위에서 설정한 테마 이름>/exampleSite/config.toml config.toml
$ cp themes/LoveIt/exampleSite/config.toml config.toml
~~~

<div style="height: 10px;"></div>

이후 config.toml을 자신의 맞게 수정하면 된다. baseURL은 반드시 수정해야함!  
[블로그 커스텀](https://ChoiSeungWoo98.github.io/)은 추후에 한번에 다루겠습니다!  

위에서 설정한 Repository name을 baseURL에 작성  
`ex) baseURL = "https://ChoiSeungWoo98.github.io/"`  
`baseURL = "https://<username>.github.io/"`

다 설정했다면 로컬에서 테스트 해보자!  
`$ hugo server`
성공하면 아래와 같은 화면을 볼 수 있다. `http://localhost:1313 접속하여 확인`
<div style="height: 10px;"></div>
<details>
    <summary style="color: rgba(113, 187, 222, 1); cursor: pointer;">에러 로그</summary>
    <div style="border-radius: 20px; padding: 5px 30px;background-color: rgba(98,92,92,0.3);">
        <p>Error: module "LoveIt" not found; either add it as a Hugo Module or store it in "/Users/<username>".: module does not exist</username>
        <p>해당 로그가 뜬다면 themes 폴더 내부에 LoveIt이 없다는 소리다 확인 후 config.toml에서</p> 
        <p style="color: white;">themes = "폴더명" 으로 바꿔주자!</p> <br>
        <p>Error: module "test" not found; either add it as a Hugo Module or store it in "/Users/<username>".: module does not exist</username>
        <p>test 폴더를 찾을 수 없다는 에러이다. 현재 LoveIt테마는 directory 주소를 설정 해주고 있다 이것을 제거해주자!</p>
        <p style="color: white">config.toml 에서 아래 부분을 찾아서 제거</p>
        <p>themes directory</p>
        <p>主题目录</p>
        <p>themesDir = "../.."</p>
    </div>
</details>
<details>
    <summary style="color: rgba(113, 187, 222, 1); cursor: pointer; cursor: pointer;">PC 이미지</summary>
    <img style="width: 500px;" src="/img/posts/blog/createdGitBlog/pc.png">
</details>
<details>
    <summary style="color: rgba(113, 187, 222, 1); cursor: pointer;">mobile 이미지</summary>
    <img style="width: 500px;" src="/img/posts/blog/createdGitBlog/mobile.jpg">
</details>

<div style="height: 50px;"></div>

## Git Repository 연결
***
여태까지 노력해서 만든 블로그를 git이랑 연동해보자!
~~~bash
# blog -> blog 레포지토리 연결
# git remote add origin http://github.com/<username>/blog.git
$ git remote add origin https://github.com/choiseungwoo98/blog.git

# blog/public -> <username>.github.io 연결
# 아래 코드를 수행하기 전에 blog 폴더에 public이 없는지 확인하자! 있으면 오류가 발생한다....
# git submodule add -b main http://github.com/<username>/<username>.github.io.git public
# 만약 기존에 등록한 것이 있다면 git rm -r --cached public 를 입력해서 제거 후 등록
# 그래도 안된다면 강제로 하자..
# git submodule add -b main --force https://github.com/ChoiSeungWoo98/ChoiSeungWoo98.github.io.git public
$ git submodule add -b main https://github.com/ChoiSeungWoo98/ChoiSeungWoo98.github.io.git public
~~~

<div style="height: 50px;"></div>

## 게시글 작성
***
새로운 포스트를 만드는 것도 hugo에서 수행해준다.. hugo 짱..
~~~bash
# 아래 명령어를 입력하면 blog/content/posts/firstPost/test.md가 생성된다. 그걸 수정해서 글을 작성하면 된다!
# hugo new posts/<원하는 패쓰>/파일 이름.md
$ hugo new posts/firstPost/test.md
Content "/Users/user/workspace/blog/content/posts/firstPost/test.md" created

# 이제 게시글을 로컬에서 확인해보자!
# 로컬 서버 실행
# draft: true로 설정 되어 있을때 hugo server로 실행하면 게시물이 보이지 않는다.
# 따라서 아래 명령어로 서버를 실행해준다. 혹은 그냥 false로 두면 보임
# draft는 수정 중일때 true 수정 끝나면 false로 바꾸어야 github에 올라간다..
# http://localhost:1313 접속하여 확인
# 서버를 닫기 위해서는 ctrl + c 를 입력한다.
$ hugo server -D
~~~

<div style="height: 50px;"></div>

## 드디어 배포!!!
***
이제 배포만 하면 깃 블로그가 생성된다!! 배포를 진행해보자! 배포하지 않으면 여태 까지 한 작업 다 필요 없다는건 안 비밀..
~~~bash
# 작성한 프로젝트 빌드하기
# hugo -t <여러분의 테마>
$ hugo -t loveit

# 빌드가 완료되면 public에 파일들이 생긴다. 이 부분은 위에 submodule로 나눠서 관리 하기 때문에
# 해당 폴더로 이동 후 배포해줘야함.. 
$ cd public

# 변경된 모든 파일 추가하기
$ git add .

# 커밋 남기기!
# 아래 코드로 커밋을 남기면 현재 시간 기준으로 커밋 메세지가 담김 꼭 이렇게 안해줘도 됨!
$ msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# 현재 폴더 상태 확인하기
$ git status

# 상태 확인하고 깨끗 하다면 커밋한 파일 배포해주기!
$ git push origin main

# blog 폴더로 이동하기
$ cd ..

# blog 변경 사항 추가. public에서 배포한 부분도 여기서 다시 추가해줌
git add .

# 추가한 사항 커밋
$ msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# blog 배포하기 
$ git push origin main
~~~

<div style="height: 10px;"></div>

배포가 완료 되었다면 git repository에서  build되는 과정을 확인하고 오류 없이 성공했다면 본인 블로그에 들어가서 확인 할 수 있다!

<details>
    <summary style="color: rgba(113, 187, 222, 1); cursor: pointer;">블로그 주소 확인하기</summary>
    <p>
        블로그 주소를 모르겠다면<br>
        1. username.github.io 레포지토리를 들어가기<br>
        2. Settings에 들어가기<br>
        3. Pages로 이동 후<br>
        4. Visit site에서 확인 할 수 있다.<br>
    </p>
    <p>보통 "https://username.github.io/ 이러한 주소일 것이다.</p>
</details>

<div style="height: 50px;"></div>

<p style="font-size: 35px; padding-bottom: 10px;">드디어 내 블로그 완성!!</p>

예쁘게 꾸미고 싶은 욕심이 많이 있기 때문에 추후에 [커스텀 포스트](https://ChoiSeungWoo98.github.io/)로 찾아뵙겠습니다!! 😄

## 포스트 작성 시 참고한 링크
- [정적 페이지 vs 동적 페이지 및 정적 페이지 비교](https://jihyehwang09.github.io/2019/01/02/blog-platform/)
- [Hugo를 사용한 깃 블로그 만들기](https://velog.io/@mellonggo/Github-%ED%8E%98%EC%9D%B4%EC%A7%80-%EB%B8%94%EB%A1%9C%EA%B7%B8-%EB%A7%8C%EB%93%A4%EA%B8%B0-with-Hugo)



