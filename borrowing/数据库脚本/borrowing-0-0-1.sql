/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     2016/2/1 3:55:06                             */
/*==============================================================*/


drop table BOOK cascade constraints;

drop table BOOK_TYPE cascade constraints;

drop table RECORD cascade constraints;

drop table USERROLE cascade constraints;

drop table WORK_TYPE cascade constraints;

/*==============================================================*/
/* Table: BOOK                                                  */
/*==============================================================*/
create table BOOK 
(
   ID                   NUMBER(28)           not null,
   BNAME                VARCHAR2(100),
   FAUTHOR              VARCHAR2(32),
   SAUTHOR              VARCHAR2(32),
   TAUTHOR              VARCHAR2(32),
   TRANSLATOR           VARCHAR2(32),
   PUBLISHER            VARCHAR2(32),
   PUBLSHDATE           DATE,
   TYPE                 NUMBER(28),
   ISBORROWED           NUMBER(1),
   SSH                  VARCHAR2(100),
   TMH                  VARCHAR2(50),
   RETURNDATE           DATE,
   ORGLIB               VARCHAR2(500),
   CURLIB               VARCHAR2(500),
   CURLOCAL             VARCHAR2(1000),
   CIRTYPE              NUMBER(2),
   TOTALLOANNUM         NUMBER(20),
   TOTALRENEWNUM        NUMBER(20),
   PAGE                 NUMBER(10),
   PUBLISHERLOCAL       VARCHAR2(500),
   CD                   NUMBER(2),
   PHOTO                VARCHAR2(1000),
   INTRO                VARCHAR2(1000),
   constraint PK_BOOK primary key (ID)
         using index 
     tablespace BORROW
     pctfree 10
     initrans 2
     maxtrans 255
)
tablespace BORROW
  pctfree 10
  initrans 1
  maxtrans 255;

comment on table BOOK is
'�鱾��';

comment on column BOOK.ID is
'���';

comment on column BOOK.BNAME is
'�鱾��';

comment on column BOOK.FAUTHOR is
'��һ����';

comment on column BOOK.SAUTHOR is
'�ڶ�����';

comment on column BOOK.TAUTHOR is
'��������';

comment on column BOOK.TRANSLATOR is
'����';

comment on column BOOK.PUBLISHER is
'������';

comment on column BOOK.PUBLSHDATE is
'��������';

comment on column BOOK.TYPE is
'���';

comment on column BOOK.ISBORROWED is
'�ݲ�״̬';

comment on column BOOK.SSH is
'�����';

comment on column BOOK.TMH is
'�����';

comment on column BOOK.RETURNDATE is
'Ӧ��ʱ��';

comment on column BOOK.ORGLIB is
'����������';

comment on column BOOK.CURLIB is
'���ڹ�';

comment on column BOOK.CURLOCAL is
'���ڹ�λ��';

comment on column BOOK.CIRTYPE is
'��ͨ����';

comment on column BOOK.TOTALLOANNUM is
'���Ĵ���';

comment on column BOOK.TOTALRENEWNUM is
'�������';

comment on column BOOK.PAGE is
'ҳ��';

comment on column BOOK.PUBLISHERLOCAL is
'�����';

comment on column BOOK.CD is
'�Ƿ��й���';

comment on column BOOK.PHOTO is
'ͼƬ';

comment on column BOOK.INTRO is
'���';

/*==============================================================*/
/* Table: BOOK_TYPE                                             */
/*==============================================================*/
create table BOOK_TYPE 
(
   ID                   NUMBER(28)           not null,
   PARENTID             NUMBER(28),
   NAME                 VARCHAR2(100),
   CODE                 VARCHAR2(100),
   EXPLAIN              VARCHAR2(500),
   constraint PK_BOOK_TYPE primary key (ID)
         using index 
     tablespace BORROW
     pctfree 10
     initrans 2
     maxtrans 255
)
tablespace BORROW
  pctfree 10
  initrans 1
  maxtrans 255;

comment on table BOOK_TYPE is
'ͼ������';

comment on column BOOK_TYPE.ID is
'���';

comment on column BOOK_TYPE.PARENTID is
'���ڵ�';

comment on column BOOK_TYPE.NAME is
'����';

comment on column BOOK_TYPE.CODE is
'�ƺ�';

comment on column BOOK_TYPE.EXPLAIN is
'��ע';

/*==============================================================*/
/* Table: RECORD                                                */
/*==============================================================*/
create table RECORD 
(
   ID                   NUMBER(28)           not null,
   READID               NUMBER(28),
   BOOKID               NUMBER(28),
   BEGIN                DATE,
   END                  DATE,
   MONEY                NUMBER(3),
   RENEW                NUMBER(2),
   constraint PK_RECORD primary key (ID)
         using index 
     tablespace BORROW
     pctfree 10
     initrans 2
     maxtrans 255
)
tablespace BORROW
  pctfree 10
  initrans 1
  maxtrans 255;

comment on table RECORD is
'���ļ�¼';

comment on column RECORD.ID is
'���';

comment on column RECORD.READID is
'����';

comment on column RECORD.BOOKID is
'�鱾';

comment on column RECORD.BEGIN is
'��ʼ����';

comment on column RECORD.END is
'��������';

comment on column RECORD.MONEY is
'ΥԼ���';

comment on column RECORD.RENEW is
'�ܷ�����';

/*==============================================================*/
/* Table: USERROLE                                              */
/*==============================================================*/
create table USERROLE 
(
   ID                   NUMBER(28)           not null,
   CODE                 NUMBER(28),
   PASSWORD             VARCHAR2(120)        default '123456',
   NAME                 VARCHAR2(100),
   TYPE                 NUMBER(2),
   STATE                NUMBER(2),
   VIOLATE              NUMBER(2)            default 0,
   AGGREGATE            NUMBER(10),
   CERTIFY              VARCHAR2(255),
   LIB                  VARCHAR2(32),
   BED                  DATE,
   ENDD                 DATE,
   UNIT                 NUMBER(28),
   ADDRESS              VARCHAR2(255),
   NATION               VARCHAR2(32),
   JG                   VARCHAR2(32),
   POSTCD               NUMBER(32),
   BIRTHDAY             DATE,
   AGE                  NUMBER(32),
   EMAIL                VARCHAR2(255),
   PHONE                NUMBER(32),
   ROLE                 NUMBER(2),
   REMARKS              VARCHAR2(1000),
   constraint PK_USERROLE primary key (ID)
         using index 
     tablespace BORROW
     pctfree 10
     initrans 2
     maxtrans 255,
   constraint CKC_PASSWORD_USERROLE check (PASSWORD is null or (PASSWORD >= '6'))
)
tablespace BORROW
  pctfree 10
  initrans 1
  maxtrans 255;

comment on table USERROLE is
'�û���';

comment on column USERROLE.ID is
'���';

comment on column USERROLE.CODE is
'����֤��(����¼��)';

comment on column USERROLE.PASSWORD is
'����';

comment on column USERROLE.NAME is
'����';

comment on column USERROLE.TYPE is
'��¼���ԣ�0--pc��1--�ֻ���';

comment on column USERROLE.STATE is
'��ǰ״̬(0--��Ч��1--��Ч��';

comment on column USERROLE.VIOLATE is
'ΥԼ״��(0--������1--ΥԼ��';

comment on column USERROLE.AGGREGATE is
'�ۼƽ���';

comment on column USERROLE.CERTIFY is
'���֤����';

comment on column USERROLE.LIB is
'������';

comment on column USERROLE.BED is
'֤��������';

comment on column USERROLE.ENDD is
'֤��ֹ����';

comment on column USERROLE.UNIT is
'��λ';

comment on column USERROLE.ADDRESS is
'סַ';

comment on column USERROLE.NATION is
'����';

comment on column USERROLE.JG is
'����';

comment on column USERROLE.POSTCD is
'�ʱ�';

comment on column USERROLE.BIRTHDAY is
'��������';

comment on column USERROLE.AGE is
'����';

comment on column USERROLE.EMAIL is
'email';

comment on column USERROLE.PHONE is
'�ֻ�';

comment on column USERROLE.ROLE is
'��¼��ɫ(0--��������Ա��1--ϵͳ����Ա��2--��ͨ�û�)';

comment on column USERROLE.REMARKS is
'��ע';

/*==============================================================*/
/* Table: WORK_TYPE                                             */
/*==============================================================*/
create table WORK_TYPE 
(
   ID                   NUMBER(28)           not null,
   FID                  NUMBER(28),
   NAME                 VARCHAR2(100),
   CODE                 VARCHAR2(100),
   EXPLAIN              VARCHAR2(500),
   constraint PK_WORK_TYPE primary key (ID)
         using index 
     tablespace BORROW
     pctfree 10
     initrans 2
     maxtrans 255
)
tablespace BORROW
  pctfree 10
  initrans 1
  maxtrans 255;

comment on table WORK_TYPE is
'��ҵ����';

comment on column WORK_TYPE.ID is
'���';

comment on column WORK_TYPE.FID is
'���ڵ�';

comment on column WORK_TYPE.NAME is
'����';

comment on column WORK_TYPE.CODE is
'�ƺ�';

comment on column WORK_TYPE.EXPLAIN is
'��ע';

