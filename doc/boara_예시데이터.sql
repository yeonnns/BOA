-- 예시 데이터 세팅 : 테이블 생성 후 실행 바람 --
-- 예시 데이터 : 회원 --
INSERT INTO
    member(mno, id, pw, name, mail, tel, isshow, isadult, birth)
VALUES(
    1001, 'ksoy', '12345',
    '김소연', 'ksoy@naver.com', '01012345678', 'Y', 'N', TO_DATE('20001209', 'YYYYMMDD')
);
INSERT INTO
    member(mno, id, pw, name, mail, tel, isshow, isadult, birth)
VALUES(
    1002, 'psoy', '12345',
    '박소연', 'psoy@naver.com', '01056781234', 'Y', 'Y', TO_DATE('20001209', 'YYYYMMDD')
);
INSERT INTO
    member(mno, id, pw, name, mail, tel, isshow, isadult, birth, lodate)
VALUES(
    1003, 'ez', '12345',
    '최이지', 'ez@naver.com', '01040732848', 'R', 'Y',
    TO_DATE('20001209', 'YYYYMMDD'), TO_DATE('20210720', 'YYYYMMDD')
);
INSERT INTO
    member(mno, id, pw, name, mail, tel, isshow, isadult, birth)
VALUES(
    100, 'admin', '12345',
    '관리자', 'admin@naver.com', '01087654321', 'R', 'Y',
    TO_DATE('20001209', 'YYYYMMDD')
);
--------------------------------------------------------------------------------
-- 예시 데이터 : 포인트 상세 코드 --
INSERT INTO
    detailcode(pcode, detail, upcode)
VALUES(
    100, '포인트적립', null
);
INSERT INTO
    detailcode(pcode, detail, upcode)
VALUES(
    101, '포인트충전', 100
);
INSERT INTO
    detailcode(pcode, detail, upcode)
VALUES(
    102, '댓글작성', 100
);
INSERT INTO
    detailcode(pcode, detail, upcode)
VALUES(
    103, '대댓글작성', 100
);
INSERT INTO
    detailcode(pcode, detail, upcode)
VALUES(
    104, '게시글작성', 100
);
INSERT INTO
    detailcode(pcode, detail, upcode)
VALUES(
    105, '작품 판매', 100
);
INSERT INTO
    detailcode(pcode, detail, upcode)
VALUES(
    110, '가입축하기념', 100
);
INSERT INTO
    detailcode(pcode, detail, upcode)
VALUES(
    200, '포인트사용', null
);
INSERT INTO
    detailcode(pcode, detail, upcode)
VALUES(
    201, '작품구매', 200
);
INSERT INTO
    detailcode(pcode, detail, upcode)
VALUES(
    202, '이모티콘구매', 200
);
INSERT INTO
    detailcode(pcode, detail, upcode)
VALUES(
    203, '이벤트참여', 200
);
INSERT INTO
    detailcode(pcode, detail, upcode)
VALUES(
    204, 'HOT포스팅등록', 200
);
INSERT INTO
    detailcode(pcode, detail, upcode)
VALUES(
    205, '결제취소', 200
);
--------------------------------------------------------------------------------
-- 예시 데이터 : 장르 --
INSERT INTO
    genre(gno, gname)
VALUES(
    1001, '시'
);
INSERT INTO
    genre(gno, gname)
VALUES(
    1002, '소설'
);
INSERT INTO
    genre(gno, gname)
VALUES(
    1003, '웹툰'
);
INSERT INTO
    genre(gno, gname)
VALUES(
    1004, '에세이'
);
INSERT INTO
    genre(gno, gname)
VALUES(
    1005, '코미디'
);
INSERT INTO
    genre(gno, gname)
VALUES(
    1006, '멜로/로맨스'
);
INSERT INTO
    genre(gno, gname)
VALUES(
    1007, '일상'
);
INSERT INTO
    genre(gno, gname)
VALUES(
    1008, '판타지'
);
INSERT INTO
    genre(gno, gname)
VALUES(
    1009, 'SF'
);
INSERT INTO
    genre(gno, gname)
VALUES(
    1010, '사극'
);
INSERT INTO
    genre(gno, gname)
VALUES(
    1011, '중세'
);
INSERT INTO
    genre(gno, gname)
VALUES(
    1012, '웨스턴'
);
INSERT INTO
    genre(gno, gname)
VALUES(
    1013, '아포칼립스'
);
INSERT INTO
    genre(gno, gname)
VALUES(
    1014, '미스터리'
);
INSERT INTO
    genre(gno, gname)
VALUES(
    1015, '액션'
);
INSERT INTO
    genre(gno, gname)
VALUES(
    1016, '범죄/느와르'
);
INSERT INTO
    genre(gno, gname)
VALUES(
    1017, '스릴러'
);
INSERT INTO
    genre(gno, gname)
VALUES(
    1018, '호러'
);
INSERT INTO
    genre(gno, gname)
VALUES(
    1019, '힐링'
);
INSERT INTO
    genre(gno, gname)
VALUES(
    1020, '음악'
);
--------------------------------------------------------------------------------
-- 예시 데이터 : 컬렉션 --
-- 최이지 : 10개
INSERT INTO
    collection(cno, cname, mno)
VALUES(
    100001, '이지한 테스트 1', 1003
);
INSERT INTO
    collection(cno, cname, mno)
VALUES(
    100002, '이지한 테스트 2', 1003
);
INSERT INTO
    collection(cno, cname, mno)
VALUES(
    100003, '이지한 테스트 3', 1003
);
INSERT INTO
    collection(cno, cname, mno)
VALUES(
    100004, '이지한 테스트 4', 1003
);
INSERT INTO
    collection(cno, cname, mno)
VALUES(
    100005, '이지한 테스트 5', 1003
);
INSERT INTO
    collection(cno, cname, mno)
VALUES(
    100006, '사람들은 무엇에 공포를 느낄까', 1003
);
INSERT INTO
    collection(cno, cname, mno)
VALUES(
    100007, '공포 실화 : 예체능의 취업 도전기', 1003
);
INSERT INTO
    collection(cno, cname, mno)
VALUES(
    100008, '충격과 공포! 버그 발견?!', 1003
);
INSERT INTO
    collection(cno, cname, mno, descr)
VALUES(
    100009, '공포의 압박 면접후기', 1003, '우리 모두 힘냅시다...'
);
INSERT INTO
    collection(cno, cname, mno)
VALUES(
    100010, '이지의 공포게임 리뷰', 1003
);
-- 김소연 : 2개
INSERT INTO
    collection(cno, cname, descr, mno, gnr)
VALUES(
    100011, '웃기는 연애', '로맨스 코미디 시리즈 연재중!', 1001, '1002/1005/1006'
);
INSERT INTO
    collection(cno, cname, descr, mno, gnr)
VALUES(
    100012, '소연의 일상', '코딩 뉴비의 일상툰', 1001, '1003/1007'
);
-- 박소연 : 1개
INSERT INTO
    collection(cno, cname, descr, mno, gnr)
VALUES(
    100013, '공포영화 리뷰', null, 1002, '1004/1018'
);
--------------------------------------------------------------------------------
-- 예시 데이터 : 게시글 --
-- 박소연 : 열혈 회원 --
INSERT INTO
    board(cno, bno, title, body, gnr, isshow, price, click, forwho, mno)
VALUES(
    100013, 100001, 'suspiria 1997/리메이크 리뷰', 'suspiria 영화가 2018년 여름, 리메이크로 돌아왔습니다.
사운드 트랙 아티스트로 라디오헤드의 톰요크가 참여해 화제가 되고 있는데요,
이건 추후 따로 리뷰하도록 하겠습니다!(유료글 예정)
내용을 더 적고싶지만 예시데이터 담당자 머리가 터질것 같으니 이만 마칩니다.',
    '1017/1018', 'Y', 0, 154, 'A', 1002
);
INSERT INTO
    board(cno, bno, title, body, gnr, isshow, price, click, mno)
VALUES(
    100013, 100002, 'suspiria 리메이크:사운드 트랙 리뷰', 'suspiria 사운드트랙 리뷰로 돌아왔습니다!
본 게시글은 스포일러를 포함하는 것을 미리 공지합니다.

이번 suspiria 리메이크는, 라디어 헤드의 수장이자 보컬 및 기타를 맡고 있는 톰요크(Thom Yorke)가 담당하였는데요,
개인적으로 정말 애정하고 있는 아티스트이기 때문에 사실 저는 suspiria 리메이크 일정보다 사운드 트랙 발매 정보를 더 먼저 접하게 되었습니다.

(사실 LP까지 구매했다는건 비밀)

suspiria 사운드 트랙은 타이틀곡 suspirium을 시작으로 volk, unmade, has ended가 이어서 공개되었습니다. 사운드 트랙 전체는 CD2장으로 나뉘어 있습니다.
[CD1]
1. A Storm That Took Everything
2. The Hooks
3. Suspirium
4. Belongings Thrown in a River
5. Has Ended
6. Klemperer Walks
7. Open Again
8. Sabbath incantation
9. The lnevitable Pull
10. Olgas Destruction (Volk Tape)
11. The Conjuring of Anke
12. A Light Green
13. Unmade
14. The Jumps

CD2
1. Volk
2. The Universe is Indifferent
3. The Balance of Things
4. A Soft Hand Across Your Face
5. Suspirium Finale
6. A Choir of One
7. Synthesizer Speaks
8. The Room of Compartments
9. An Audition
10. Voiceless Terror
11. The Epilogue

영화 suspiria는 톰요크의 suspirium으로 암울한 시작을 알립니다.
배우들은 내내 괴기한 분위기를 품기는 volk에 춤을 맞추어 가다, 주인공 수지는 허망한 분위기의 has ended와 함께 춤의 이면을 알아버리며, 단조로운 코드와 따뜻한 목소리로 파멸을 노래하는 unmade와 함께 영화는 막을 내립니다.

여러분은 어떤 곡이 가장 마음에 드시나요? 제 맘에 들었던 트랙은 의외로 Synthesizer Speaks라는 곡이었는데요, 평소에도 현대음악쪽 노래를 많이 내는 톰요크의 색깔이 짙게 표현될 수 있었던것 같아 팬으로서 뿌듯해집니다.
톰요크의 사운드 트랙은 Suspiria(Unreleased Material)버전으로 음원사이트에서 접하실수도 있으니, 관심있으시면 한번씩 들어보세요!',
'1018/1020', 'Y', 1000, 35, 1002
);
INSERT INTO
    board(cno, bno, title, body, gnr, isshow, price, click, mno)
VALUES(
    100013, 100003, '입문 공포영화 추천', '(내용 생략)
예시 데이터 담당자 : 저도 사실 공포영화 잘 모릅니다.',
    '1017/1018', 'Y', 0, 123, 1002
);
INSERT INTO
    board(cno, bno, title, body, gnr, isshow, price, click, mno)
VALUES(
    100013, 100004, '유튜브 채널 개설 공지', '유튜브 채널을 개설했습니다. 보아라 업로드를 중단하는건 아니에요!',
    null, 'A', 0, 358, 1002
);
INSERT INTO
    board(cno, bno, title, body, gnr, price, click, isshow, mno)
VALUES(
    100013, 100005, '반교(返校) 리뷰', '여러분은 게임을 자주 하시는 편인가요?
저는 게임을 좋아하진 않지만, 이번 리뷰를 계기로 오랜만에 공포게임을 해보게 되었습니다.
영화 반교는 동명의 공포게임 원작으로, ...(생략)', '1017/1018', 0, 234, 'Y', 1002
);
INSERT INTO
    board(cno, bno, title, body, gnr, price, click, isshow, forwho, mno)
VALUES(
    100013, 100006, '어스(us) 리뷰', '오랜만에 대작이 찾아온 느낌입니다. 사실 저도 어스 안봤습니다. 헷',
    '1018', 0, 94, 'Y', 'A', 1002
);
INSERT INTO
    board(cno, bno, title, body, gnr, price, click, isshow, mno)
VALUES(
    100013, 100007, '타장르 영화 추천 리스트(+리뷰)', '가끔 제 리뷰가 재밌다고 해주시는 분들 중에 공포물을 잘 못보시는 분들이 있는데,
그 분들을 위해 공포영화가 아닌 영화 추천을 해 볼까 합니다. 저는 사실 뮤지컬 영화도 좋아하는데요...(생략)',
    null, 0, 486, 'Y', 1002
);
INSERT INTO
    board(cno, bno, title, body, gnr, price, isshow, click, mno)
VALUES(
    100013, 100008, '여름 휴가 공지(7월 말)', '7월 말에 여름 휴가를 가게 됐습니다.
그 동안은 유튜브, 보아라 업로드가 좀 뜸해질 것 같습니다. 여러분도 좋은 휴가철 되세요!',
    null, 0, 'A', 1224, 1002
);
INSERT INTO
    board(cno, bno, title, body, gnr, price, click, isshow, mno)
VALUES(
    100013, 100009, '유튜브 개설 비하인드', '돈벌려고 시작했습니다 ^_^',
    '1007', 500, 43, 'Y', 1002
);
INSERT INTO
    board(cno, bno, title, body, gnr, price, click, isshow, mno)
VALUES(
    100013, 100010, '컨저링4 시사회 후기', '컨저링4 시사회에 다녀왔습니다!
컨저링4가 벌써 개봉했냐구요? 네 맞습니다! 아직 개봉안했습니다! 하하!',
    '1018', 0, 1209, 'Y', 1002
);
INSERT INTO
    board(cno, bno, title, body, gnr, price, click, isshow, mno)
VALUES(
    100013, 100011, '시사회 초청 비하인드', '가상의 시사회인데 비하인드가 있을까요!
별내용 없습니다! 유료글 구매 테스트 용입니다! 오예~',
    '1007', 500, 415, 'Y', 1002
);
--------------------------------------------------------------------------------
-- 예시 데이터 : 댓글 --
INSERT INTO
    reply(rno, bno, uprno, mno, body, isshow)
VALUES(
    100001, 100008, null, 1002, '휴가 전까지 업로드는 계속 합니다.', 'Y'
);
INSERT INTO
    reply(rno, bno, uprno, mno, body, isshow)
VALUES(
    100002, 100008, 100001, 1003, '건강 챙기면서 하셔요 ㅠㅠ', 'Y'
);
INSERT INTO
    reply(rno, bno, uprno, mno, body, isshow)
VALUES(
    100003, 100008, null, 1003, '맛있는거 많이 드시고 오세요', 'Y'
);
INSERT INTO
    reply(rno, bno, uprno, mno, body, isshow)
VALUES(
    100004, 100008, null, 1003, '[스포일러] 스포일러 댓글 테스트', 'S'
);
INSERT INTO
    reply(rno, bno, uprno, mno, body, isshow)
VALUES(
    100005, 100008, 100003, 1001, '요즘 마라탕 맛집이 많아요!', 'Y'
);
INSERT INTO
    reply(rno, bno, uprno, mno, body, isshow)
VALUES(
    100006, 100008, 100003, 1002, '감사합니다.', 'Y'
);
INSERT INTO
    reply(rno, bno, uprno, mno, body, isshow)
VALUES(
    100007, 100008, null, 1001, '요즘에 강원도도 볼 데 많더라구요~', 'Y'
);
INSERT INTO
    reply(rno, bno, uprno, mno, body, isshow)
VALUES(
    100008, 100008, 100007, 1002, '그런가요? 한번 생각해 봐야겠네요', 'Y'
);
--------------------------------------------------------------------------------
-- 예시 데이터 : 찜&좋아요 --
INSERT INTO
    mark(mkno, mno, bno, isshow)
VALUES(
    1000000001, 1003, 100001, 'L'
);
INSERT INTO
    mark(mkno, mno, bno, isshow)
VALUES(
    1000000002, 1003, 100002, 'L'
);
INSERT INTO
    mark(mkno, mno, bno, isshow)
VALUES(
    1000000003, 1003, 100005, 'L'
);
INSERT INTO
    mark(mkno, mno, bno, isshow)
VALUES(
    1000000004, 1003, 100006, 'L'
);
INSERT INTO
    mark(mkno, mno, bno, isshow)
VALUES(
    1000000005, 1003, 100010, 'L'
);
INSERT INTO
    mark(mkno, mno, bno, isshow)
VALUES(
    1000000006, 1003, 100009, 'J'
);
INSERT INTO
    mark(mkno, mno, bno, isshow)
VALUES(
    1000000007, 1003, 100011, 'J'
);
--------------------------------------------------------------------------------
-- 예시 데이터 : 포인트 --
INSERT INTO
    point(mno, pno, gnp, pcode, sumpoint)
VALUES(
    1003, 1000000001, 500, 110, 500
);
INSERT INTO
    point(mno, pno, gnp, pcode, sumpoint)
VALUES(
    1003, 1000000002, 5000, 101, 5500
);
INSERT INTO
    point(mno, pno, gnp, pcode, sumpoint, bno)
VALUES(
    1003, 1000000003, -1000, 201, 4500, 100002
);
INSERT INTO
    point(mno, pno, gnp, pcode, sumpoint)
VALUES(
    1003, 1000000004, 3, 102, 4503
);
INSERT INTO
    point(mno, pno, gnp, pcode, sumpoint)
VALUES(
    1003, 1000000005, 1, 103, 4504
);
INSERT INTO
    point(mno, pno, gnp, pcode, sumpoint)
VALUES(
    100, 1000000006, 100, 110, 100
);
INSERT INTO
    point(mno, pno, gnp, pcode, sumpoint)
VALUES(
    1001, 1000000007, 100, 110, 100
);
INSERT INTO
    point(mno, pno, gnp, pcode, sumpoint)
VALUES(
    1002, 1000000008, 100, 110, 100
);
--------------------------------------------------------------------------------
-- 예시 데이터 : 이미지 파일 --
INSERT INTO
    imgfile(fno, mno, cno, whereis, oriname, savename, len, isshow)
VALUES(
    100001, 1001, 100011, 'C', 'pulse.jpg', 'pulse.jpg', 165179, 'Y'
);
INSERT INTO
    imgfile(fno, mno, cno, whereis, oriname, savename, len, isshow)
VALUES(
    100002, 1001, 100011, 'C', 'loveislove.jpg', 'loveislove.jpg', 74038, 'C'
);
INSERT INTO
    imgfile(fno, mno, cno, whereis, oriname, savename, len, isshow)
VALUES(
    100003, 1001, 100011, 'C', 'heart.jpg', 'heart.jpg', 146735, 'Y'
);
INSERT INTO
    imgfile(fno, mno, cno, whereis, oriname, savename, len, isshow)
VALUES(
    100004, 1001, 100012, 'C', '바른자세 소연.png', '바른자세 소연.png', 121930, 'Y'
);
INSERT INTO
    imgfile(fno, mno, cno, whereis, oriname, savename, len, isshow)
VALUES(
    100005, 1001, 100012, 'C', '버그소연.png', '버그소연.png', 128286, 'Y'
);
INSERT INTO
    imgfile(fno, mno, cno, whereis, oriname, savename, len, isshow)
VALUES(
    100006, 1001, 100012, 'C', '잠든소연.png', '잠든소연.png', 124627, 'Y'
);
INSERT INTO
    imgfile(fno, mno, cno, whereis, oriname, savename, len, isshow)
VALUES(
    100007, 1001, 100012, 'C', '회의소연.png', '회의소연.png', 220310, 'Y'
);
INSERT INTO
    imgfile(fno, mno, cno, whereis, oriname, savename, len, isshow)
VALUES(
    100008, 1001, 100012, 'C', '코딩소연.png', '코딩소연.png', 128681, 'C'
);
INSERT INTO
    imgfile(fno, mno, cno, whereis, oriname, savename, len, isshow)
VALUES(
    100009, 1002, 100013, 'C', '리뷰.jpg', '리뷰.jpg', 4804, 'C'
);
INSERT INTO
    imgfile(fno, mno, cno, whereis, oriname, savename, len, isshow)
VALUES(
    100010, 1003, 100001, 'C', 'test.jpg', 'test.jpg', 4837, 'C'
);
INSERT INTO
    imgfile(fno, mno, cno, whereis, oriname, savename, len, isshow)
VALUES(
    100011, 1003, 100002, 'C', 'test.jpg', 'test_1.jpg', 4837, 'C'
);
INSERT INTO
    imgfile(fno, mno, cno, whereis, oriname, savename, len, isshow)
VALUES(
    100012, 1003, 100003, 'C', 'test.jpg', 'test_2.jpg', 4837, 'C'
);
INSERT INTO
    imgfile(fno, mno, cno, whereis, oriname, savename, len, isshow)
VALUES(
    100013, 1003, 100004, 'C', 'test.jpg', 'test_3.jpg', 4837, 'C'
);
INSERT INTO
    imgfile(fno, mno, cno, whereis, oriname, savename, len, isshow)
VALUES(
    100014, 1003, 100005, 'C', 'test.jpg', 'test_4.jpg', 4837, 'C'
);
INSERT INTO
    imgfile(fno, mno, cno, whereis, oriname, savename, len, isshow)
VALUES(
    100015, 1003, 100006, 'C', '의문.png', '의문.png', 194611, 'C'
);
INSERT INTO
    imgfile(fno, mno, cno, whereis, oriname, savename, len, isshow)
VALUES(
    100016, 1003, 100007, 'C', '예체능의 비애.png', '예체능의 비애.png', 118554, 'C'
);
INSERT INTO
    imgfile(fno, mno, cno, whereis, oriname, savename, len, isshow)
VALUES(
    100017, 1003, 100008, 'C', '버그라니.png', '버그라니.png', 70292, 'C'
);
INSERT INTO
    imgfile(fno, mno, cno, whereis, oriname, savename, len, isshow)
VALUES(
    100018, 1003, 100009, 'C', '압박면접.png', '압박면접.png', 149784, 'C'
);
INSERT INTO
    imgfile(fno, mno, cno, whereis, oriname, savename, len, isshow)
VALUES(
    100019, 1003, 100010, 'C', '공포게임.png', '공포게임.png', 969292, 'C'
);
--------
INSERT INTO
    imgfile(fno, mno, bno, whereis, oriname, savename, len, isshow)
VALUES(
    100020, 1002, 100001, 'B', 'suspiria.jpg', 'suspiria.jpg', 100590, 'C'
);
INSERT INTO
    imgfile(fno, mno, bno, whereis, oriname, savename, len, isshow)
VALUES(
    100021, 1002, 100002, 'B', 'suspiria_ThomYorke.jpg', 'suspiria_ThomYorke.jpg',
    15260, 'C'
);
INSERT INTO
    imgfile(fno, mno, bno, whereis, oriname, savename, len, isshow)
VALUES(
    100022, 1002, 100005, 'B', '반교.jpg', '반교.jpg', 44140, 'C'
);
INSERT INTO
    imgfile(fno, mno, bno, whereis, oriname, savename, len, isshow)
VALUES(
    100023, 1002, 100006, 'B', 'us.png', 'us.png', 315949, 'C'
);
INSERT INTO
    imgfile(fno, mno, bno, whereis, oriname, savename, len, isshow)
VALUES(
    100024, 1002, 100007, 'B', '영화추천.jpg', '영화추천.jpg', 98156, 'C'
);
INSERT INTO
    imgfile(fno, mno, bno, whereis, oriname, savename, len, isshow)
VALUES(
    100025, 1002, 100008, 'B', '공지.jpg', '공지.jpg', 9582, 'C'
);
INSERT INTO
    imgfile(fno, mno, bno, whereis, oriname, savename, len, isshow)
VALUES(
    100026, 1002, 100010, 'B', '티켓.jpg', '티켓.jpg', 29299, 'Y'
);
INSERT INTO
    imgfile(fno, mno, bno, whereis, oriname, savename, len, isshow)
VALUES(
    100027, 1002, 100010, 'B', '팝콘.jpg', '팝콘.jpg', 157004, 'Y'
);
INSERT INTO
    imgfile(fno, mno, bno, whereis, oriname, savename, len, isshow)
VALUES(
    100028, 1002, 100010, 'B', '컨저링2.jpg', '컨저링2.jpg', 67215, 'Y'
);
INSERT INTO
    imgfile(fno, mno, bno, whereis, oriname, savename, len, isshow)
VALUES(
    100029, 1002, 100010, 'B', '티켓배부처.jpg', '티켓배부처.jpg', 35552, 'C'
);
INSERT INTO
    imgfile(fno, mno, bno, whereis, oriname, savename, len, isshow)
VALUES(
    100030, 1002, 100010, 'B', '영화관.jpg', '영화관.jpg', 54224, 'Y'
);
-------
INSERT INTO
    imgfile(fno, mno, whereis, oriname, savename, len, isshow)
VALUES(
    100031, 1001, 'M', '뵤.png', '뵤.png', 277957, 'C'
);
INSERT INTO
    imgfile(fno, mno, whereis, oriname, savename, len, isshow)
VALUES(
    100032, 1002, 'M', 'cat.jpg', 'cat.jpg', 140532, 'C'
);
INSERT INTO
    imgfile(fno, mno, whereis, oriname, savename, len, isshow)
VALUES(
    100033, 1003, 'M', '추억.jpg', '추억.jpg', 26610, 'C'
);
--------------------------------------------------------------------------------
-- 예시 데이터 : 쪽지 --
INSERT INTO
       message(mgno, sendid, recvid, title, body, read)
VALUES(
    100001, 'admin', 'ksoy' , '안녕하세요', '회원가입을 축하드립니다.<br>가입축하 포인트로 500p가 지급되었습니다', sysdate
);

INSERT INTO
       message(mgno, sendid, recvid, title, body)
VALUES(
    100002, 'admin', 'psoy' , '안녕하세요', '회원가입을 축하드립니다.<br>가입축하 포인트로 500p가 지급되었습니다'
);

INSERT INTO
       message(mgno, sendid, recvid, title, body)
VALUES(
    100003, 'admin', 'ez' , '안녕하세요', '회원가입을 축하드립니다.<br>가입축하 포인트로 500p가 지급되었습니다'
);

INSERT INTO
       message(mgno, sendid, recvid, title, body, read )
VALUES(
    100005, 'ksoy', 'psoy' , '작가님 안녕하세요', '공포영화 리뷰 너무 재밌게 보고 있습니다.', sysdate
);

INSERT INTO
       message(mgno, sendid, recvid, title, body)
VALUES(
    100006, 'psoy', 'ksoy' , '안녕하세요 ksoy구독자님', '리뷰 컬렉션에 많은 사랑 주셔서 감사합니다.<br>좋아요 찜도 부탁드립니다.'
);

INSERT INTO
       message(mgno, sendid, recvid, title, body, read)
VALUES(
    100007, 'psoy', 'ez' , '축하드립니다.', 'ez 작가님 이지한테스트 10까지 완주하시느라 고생 많으셨습니다~*^^*', sysdate+1
);

INSERT INTO
       message(mgno, sendid, recvid, title, body, mdate, read)
VALUES(
    100008, 'ez', 'psoy' , '감사합니다.', 'psoy 구독자님 격려 감사합니다. 곧 11로 찾아뵙겠습니다.', sysdate+1, sysdate+2
);

INSERT INTO
       message(mgno, sendid, recvid, title, body, mdate, read)
VALUES(
    100009, 'ksoy', 'psoy' , '공지문의', '구체적인 여름휴가 날짜를 알 수 있을까요?', sysdate+1, sysdate+1
);

INSERT INTO
       message(mgno, sendid, recvid, title, body, mdate, read)
VALUES(
    100010, 'psoy', 'ksoy' , '문의답변', '7월 25~29일로 예정되어 있으며 변경 될수 있습니다. 감사합니다.', sysdate+1, sysdate+1
);

INSERT INTO
       message(mgno, sendid, recvid, title, body, mdate)
VALUES(
    100011, 'ksoy', 'psoy' , '감사합니다.', '답변 감사합니다. 즐거운 휴가 보내세요.^__^', sysdate+2
);

INSERT INTO
       message(mgno, sendid, recvid, title, body, mdate, read)
VALUES(
    100012, 'ez', 'psoy' , 'ez 작가입니다.', '안녕하세요. 유튜브 개설 문의드립니다.', sysdate+2, sysdate+3
);

INSERT INTO
       message(mgno, sendid, recvid, title, body, mdate, read)
VALUES(
    100013, 'psoy', 'ez' , '안녕하세요 ez작가님!!!!!!!!', '관련 내용은 관리자에게 문의 부탁드립니다.', sysdate+3, sysdate+3
);
--------------------------------------------------------------------------------
-- 예시 데이터 : hot 게시글 --
INSERT INTO
    hot(hno, bno, hstart, hend)
VALUES(
    (SELECT NVL(MAX(hno+1), 100001) FROM hot),
    100002, sysdate, TO_DATE('20220730', 'YYYYMMDD')
);

INSERT INTO
    hot(hno, bno, hstart)
VALUES(
    (SELECT NVL(MAX(hno+1), 100001) FROM hot),
    100008, sysdate
);

INSERT INTO
    hot(hno, bno, hstart)
VALUES(
    (SELECT NVL(MAX(hno+1), 100001) FROM hot),
    100009, sysdate
);

commit;