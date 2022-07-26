-- system 계정으로 실행 : 계정 생성 --
CREATE USER boara IDENTIFIED BY boara ACCOUNT UNLOCK;
GRANT CONNECT,RESOURCE,UNLIMITED TABLESPACE TO boara;
ALTER USER boara DEFAULT TABLESPACE USERS;
--------------------------------------------------------------------------------
-- 이미 계정이 있다면 이 아래부터 실행 --
-- 기존 테이블 삭제 --
DROP TABLE attend CASCADE CONSTRAINTS;
DROP TABLE board CASCADE CONSTRAINTS;
DROP TABLE cert CASCADE CONSTRAINTS;
DROP TABLE collection CASCADE CONSTRAINTS;
DROP TABLE detailcode CASCADE CONSTRAINTS;
DROP TABLE genre CASCADE CONSTRAINTS;
DROP TABLE imgfile CASCADE CONSTRAINTS;
DROP TABLE mark CASCADE CONSTRAINTS;
DROP TABLE member CASCADE CONSTRAINTS;
DROP TABLE point CASCADE CONSTRAINTS;
DROP TABLE reply CASCADE CONSTRAINTS;
DROP TABLE subscribe CASCADE CONSTRAINTS;
DROP TABLE message CASCADE CONSTRAINTS;
DROP TABLE hot CASCADE CONSTRAINTS;
DROP TABLE viewlog CASCADE CONSTRAINTS;
--------------------------------------------------------------------------------
-- 회원 테이블 --
CREATE TABLE member(
    mno NUMBER(4)
        CONSTRAINT MEMB_NO_PK PRIMARY KEY,
    id VARCHAR2(10 CHAR)
        CONSTRAINT MEMB_ID_UK UNIQUE
        CONSTRAINT MEMB_ID_NN NOT NULL,
    pw VARCHAR2(20 CHAR)
        CONSTRAINT MEMB_PW_NN NOT NULL,
    name VARCHAR2(5 CHAR)
        CONSTRAINT MEMB_NAME_NN NOT NULL,
    mail VARCHAR2(30 CHAR)
        CONSTRAINT MEMB_MAIL_UK UNIQUE
        CONSTRAINT MEMB_MAIL_NN NOT NULL,
    tel VARCHAR2(11 CHAR)
        CONSTRAINT MEMB_TEL_UK UNIQUE
        CONSTRAINT MEMB_TEL_NN NOT NULL,
    jdate DATE DEFAULT sysdate
        CONSTRAINT MEMB_DATE_NN NOT NULL,
    isshow CHAR(1) DEFAULT 'R'
        CONSTRAINT MEMB_SHOW_CK CHECK (isshow IN('Y', 'R', 'N'))
        CONSTRAINT MEMB_SHOW_NN NOT NULL,
    isadult CHAR(1) DEFAULT 'N'
        CONSTRAINT MEMB_ADT_CK CHECK (isadult IN('Y','N'))
        CONSTRAINT MEMB_ADT_NN NOT NULL,
    birth DATE
        CONSTRAINT MEMB_BIRTH_NN NOT NULL,
    lodate DATE DEFAULT sysdate
        CONSTRAINT MEMB_LODATE_NN NOT NULL
);

-- 포인트 코드 테이블 --
CREATE TABLE detailcode(
    pcode NUMBER(3)
        CONSTRAINT DTL_CODE_PK PRIMARY KEY,
    detail VARCHAR2(20 CHAR)
        CONSTRAINT DTL_DTL_NN NOT NULL,
    upcode NUMBER(3)
);

-- 인증 테이블 --
CREATE TABLE cert(
    vno NUMBER(6)
        CONSTRAINT CERT_NO_PK PRIMARY KEY,
    vmno NUMBER(4)
        CONSTRAINT CERT_MNO_NN NOT NULL,
    vcode NUMBER(6)
        CONSTRAINT CERT_CODE_NN NOT NULL,
    checked CHAR(1) DEFAULT 'N'
        CONSTRAINT CERT_CK_CK CHECK (checked IN('Y', 'N'))
        CONSTRAINT CERT_CK_NN NOT NULL
);

-- 장르 테이블 --
CREATE TABLE genre(
    gno NUMBER(4)
        CONSTRAINT GNR_NO_PK PRIMARY KEY,
    gname VARCHAR2(10 CHAR)
        CONSTRAINT GNR_NAME_UK UNIQUE
        CONSTRAINT GNR_NAME_NN NOT NULL
);

-- 컬렉션 테이블 --
CREATE TABLE collection(
    cno NUMBER(6)
        CONSTRAINT COLL_NO_PK PRIMARY KEY,
    cdate DATE DEFAULT sysdate
        CONSTRAINT COLL_DATE_NN NOT NULL,
    cname VARCHAR2(30 CHAR)
        CONSTRAINT COLL_NAME_UK UNIQUE
        CONSTRAINT COLL_NAME_NN NOT NULL,
    descr VARCHAR2(30 CHAR),
    mno NUMBER(4)
        CONSTRAINT COLL_MNO_FK REFERENCES member(mno)
        CONSTRAINT COLL_MNO_NN NOT NULL,
    gnr VARCHAR2(24 CHAR),
    isshow CHAR(1) DEFAULT 'Y'
        CONSTRAINT COLL_SHOW_CK CHECK (isshow IN('Y', 'N'))
        CONSTRAINT COLL_SHOW_NN NOT NULL
);

-- 게시글 테이블 --
CREATE TABLE board(
    bno NUMBER(6)
        CONSTRAINT BRD_NO_PK PRIMARY KEY,
    title VARCHAR2(50 CHAR)
        CONSTRAINT BRD_TIT_UK UNIQUE
        CONSTRAINT BRD_TIT_NN NOT NULL,
    body VARCHAR2(2000 CHAR)
        CONSTRAINT BRD_BODY_NN NOT NULL,
    wdate DATE DEFAULT sysdate
        CONSTRAINT BRD_DATE_NN NOT NULL,
    price NUMBER(5),
    cno NUMBER(6)
        CONSTRAINT BRD_CNO_FK REFERENCES collection(cno)
        CONSTRAINT BRD_CNO_NN NOT NULL,
    gnr VARCHAR2(24CHAR),
    click NUMBER(5) DEFAULT 0
        CONSTRAINT BRD_CLK_NN NOT NULL,
    isshow CHAR(1)
        CONSTRAINT BRD_SHOW_CK CHECK (isshow IN('Y','A','N','L'))
        CONSTRAINT BRD_SHOW_NN NOT NULL,
    forwho CHAR(1) DEFAULT 'C'
        CONSTRAINT BRD_WHO_CK CHECK (forwho IN('C','A')) -- C: 전체, A: 성인
        CONSTRAINT BRD_WHO_NN NOT NULL,
    mno NUMBER(4)
        CONSTRAINT BRD_MNO_FK REFERENCES member(mno)
        CONSTRAINT BRD_MNO_NN NOT NULL
);


-- 포인트 테이블 --
CREATE TABLE point(
    pno NUMBER(10)
        CONSTRAINT PNT_NO_PK PRIMARY KEY,
    mno NUMBER(4)
        CONSTRAINT PNT_MNO_FK REFERENCES member(mno)
        CONSTRAINT PNT_MNO_NN NOT NULL,
    gnp NUMBER(6)
        CONSTRAINT PNT_GNP_NN NOT NULL,
    pdate DATE DEFAULT sysdate
        CONSTRAINT PNT_DATE_NN NOT NULL,
    pcode NUMBER(3)
        CONSTRAINT PNT_CODE_FK REFERENCES detailcode(pcode)
        CONSTRAINT PNT_CODE_NN NOT NULL,
    sumpoint NUMBER
        CONSTRAINT PNT_SUM_NN NOT NULL,
    bno NUMBER(6)
        CONSTRAINT PNT_BNO_FK REFERENCES board(bno),
    merchant_uid VARCHAR2(50),
    imp_uid VARCHAR2(50),
    isRefund char(1)
        CONSTRAINT PNT_REFUND_CK CHECK(isRefund IN('Y', 'N')),
    isAuto CHAR(1)
        CONSTRAINT PNT_AUTO_CK CHECK(isAuto IN('A', 'N'))
);

-- 댓글 테이블 --
CREATE TABLE reply(
    rno NUMBER(6)
        CONSTRAINT RPL_NO_PK PRIMARY KEY,
    bno NUMBER(6)
        CONSTRAINT RPL_BNO_FK REFERENCES board(bno)
        CONSTRAINT RPL_BNO_NN NOT NULL,
    uprno NUMBER(6),
    mno NUMBER(4)
        CONSTRAINT RPL_MNO_FK REFERENCES member(mno)
        CONSTRAINT RPL_MNO_NN NOT NULL,
    body VARCHAR2(300 CHAR)
        CONSTRAINT RPL_BODY_NN NOT NULL,
    rdate DATE DEFAULT sysdate
        CONSTRAINT RPL_DATE_NN NOT NULL,
    isshow CHAR(1) DEFAULT 'Y'
        CONSTRAINT RPL_SHOW_CK CHECK (isshow IN('Y','S','N'))
        CONSTRAINT RPL_SHOW_NN NOT NULL
);

-- 찜&좋아요 테이블 --
CREATE TABLE mark(
    mkno NUMBER(10)
        CONSTRAINT MK_NO_PK PRIMARY KEY,
    mno NUMBER(4)
        CONSTRAINT MK_MNO_FK REFERENCES member(mno)
        CONSTRAINT MK_MNO_NN NOT NULL,
    bno NUMBER(6)
        CONSTRAINT MK_BNO_FK REFERENCES board(bno)
        CONSTRAINT MK_BNO_NN NOT NULL,
    isshow CHAR(1)
        CONSTRAINT MK_SHOW_CK CHECK (isshow IN('J','L','N'))
        CONSTRAINT MK_SHOW_NN NOT NULL
);

-- 파일 테이블 --
CREATE TABLE imgfile(
    fno NUMBER(6)
        CONSTRAINT FILE_NO_PK PRIMARY KEY,
    mno NUMBER(4)
        CONSTRAINT FILE_MNO_FK REFERENCES member(mno)
        CONSTRAINT FILE_MNO_NN NOT NULL,
    bno NUMBER(6)
        CONSTRAINT FILE_BNO_FK REFERENCES board(bno),
    cno NUMBER(6)
        CONSTRAINT FILE_CNO_FK REFERENCES collection(cno),
    oriname VARCHAR2(30 CHAR)
        CONSTRAINT FILE_ONAME_NN NOT NULL,
    savename VARCHAR2(50 CHAR)
        CONSTRAINT FILE_SNAME_UK UNIQUE
        CONSTRAINT FILE_SNAME_NN NOT NULL,
    len NUMBER
        CONSTRAINT FILE_LEN_NN NOT NULL,
    fdate DATE DEFAULT sysdate
        CONSTRAINT FILE_DATE_NN NOT NULL,
    isshow CHAR(1)
        CONSTRAINT FILE_SHOW_CK CHECK (isshow IN('Y','C','N'))
        CONSTRAINT FILE_SHOW_NN NOT NULL,
    whereis CHAR(1)
        CONSTRAINT FILE_WHERE_CK CHECK (whereis IN('B','C','M'))
        CONSTRAINT FILE_WHERE_NN NOT NULL
);

-- hot 포스팅 테이블 --
CREATE TABLE hot(
    hno NUMBER(6)
        CONSTRAINT HOT_NO_PK PRIMARY KEY,
    bno NUMBER(6)
        CONSTRAINT HOT_BNO_FK REFERENCES board(bno)
        CONSTRAINT HOT_BNO_NN NOT NULL,
    hStart DATE DEFAULT sysdate
        CONSTRAINT HOT_STRT_NN NOT NULL,
    hEnd DATE DEFAULT (sysdate + INTERVAL '7' DAY)
        CONSTRAINT HOT_END_NN NOT NULL
);

-- 게시글 조회수 테이블 --
CREATE TABLE viewlog(
    vno NUMBER(8)
        CONSTRAINT VLOG_NO_PK PRIMARY KEY,
    vbno NUMBER(6)
        CONSTRAINT VLOG_BNO_FK REFERENCES board(bno)
        CONSTRAINT VLOG_BNO_NN NOT NULL,
    vmno NUMBER(4)
        CONSTRAINT VLOG_MNO_FK REFERENCES member(mno)
        CONSTRAINT VLOG_MNO_NN NOT NULL,
    vdate DATE DEFAULT sysdate
        CONSTRAINT VLOG_DATE_NN NOT NULL
);

-- 쪽지 테이블 --
CREATE TABLE message(
    mgno NUMBER(6)
        CONSTRAINT MSG_NO_PK PRIMARY KEY,
    sendid VARCHAR2(10 CHAR)
        CONSTRAINT MSG_SID_FK REFERENCES member(id)
        CONSTRAINT MSG_SID_NN NOT NULL,
    recvid VARCHAR2(10 CHAR)
        CONSTRAINT MSG_RID_FK REFERENCES member(id)
        CONSTRAINT MSG_RID_NN NOT NULL, 
    title VARCHAR2(20 CHAR)
        CONSTRAINT MSG_TITLE_NN NOT NULL,
    body VARCHAR2(2000 CHAR)
        CONSTRAINT MSG_BODY_NN NOT NULL,
    mdate DATE DEFAULT sysdate
        CONSTRAINT MSG_DATE_NN NOT NULL,
    read DATE,
    isshow CHAR(1) DEFAULT 'Y'
        CONSTRAINT MSG_SHOW_CK CHECK (isshow IN('Y', 'N'))
        CONSTRAINT MSG_SHOW_NN NOT NULL
);

-- 자동 충전 테이블 --
CREATE TABLE AutoPayment(
    tno NUMBER(6)
        CONSTRAINT PAY_TNO_PK PRIMARY KEY,
    mno NUMBER(4)
        CONSTRAINT PAY_MNO_FK REFERENCES member(mno)
        CONSTRAINT PAY_MNO_NN NOT NULL,
    tdate DATE DEFAULT sysdate,
    isAuto char(1)
        CONSTRAINT PAY_AUTO_CK CHECK (isAuto IN('A', 'N'))
        CONSTRAINT PAY_AUTO_NN NOT NULL
);