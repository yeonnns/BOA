# Boara! 자유로운 텍스트 기반 플랫폼
목적 : 전문성에 관계없이 누구나 자신의 창작물을 공유할 수 있는 프로그램

  - 게시글 폴더 개념의 컬렉션 기능
  - 메인 페이지에서 게시글/컬렉션 검색, 추천 도서 기능
  - 이메일 인증, 문자 인증으로 회원 관련 기능 체계화
  - 포인트 충전으로 더욱 편리한 사이트 활동
  - 스포일러 댓글 기능으로 작품 내용 유출 방지
  - 회원들 사이의 소통을 증대시킬 쪽지 기능

사용 기술 및 개발환경
  
  - O/S : Windows 10
  - Server : Tomcat 8.5.78
  - DB : Orarcle 11g
  - Framework : Spring 4.3.20 release
  - Language/skills : JAVA 1.8, HTML5, JavaScript, css3, jQuery 3.6.0, ajax, jsp 2.3.1, mybatis 3.4.6
  - TOOL : eclipse
  - API : interpark Developer, import Developer

## 역할 분배 현황
### 김소연
- 회원 관련 기능
  - 회원가입/탈퇴
  - 로그인
  - 회원정보 변경
  - ID/PW찾기
  - 이메일 인증
  - 쪽지
- 게시글 관련 기능
  - 키워드 검색
- 기본 레이아웃 관련
  - 홈페이지 메인
  - hot 포스팅 메인페이지 노출처리
-------------------------------------
### 박소연
- 회원 관련 기능
  - 회원 정보 페이지 메인
  - 로그 조회기능 (구매 게시글, 포인트 사용 내역 포함)
- 게시판 관련 기능
  - 댓글, 대댓글 작성/수정/삭제
  - 댓글 스포일러 방지 기능
- 결제 관련 기능
  - 포인트 충전(결제 api 사용)
  - hot 포스팅 등록 처리
  - 유료 포스팅 구매/환불 처리
-------------------------------------
### 최이지
- 회원 관련 기능
  - 회원 최다 조회 장르 파악, 실물 도서 추천(도서 api사용)
  - 컬렉션 작성/수정/삭제
  - 게시글 작성/수정/삭제
  - 게시글 공지글, 비공개글, 성인글 처리
  - 게시글 상세 페이지 : 유료 게시글 미구매시 미리보기
  - 찜/좋아요 기능
  --------------------------------------
## DB 모델링
  ![image](https://user-images.githubusercontent.com/100174595/182540544-82326e5d-ad2e-4f36-9209-8937e46ef387.png)

