/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     2016/1/15 16:22:00                           */
/*==============================================================*/


drop table BASIC_READER cascade constraints;

drop table BOOK cascade constraints;

drop table BOOK_TYPE cascade constraints;

drop table CONTROLLER cascade constraints;

drop table RECORD cascade constraints;

drop table WORK_TYPE cascade constraints;

/*==============================================================*/
/* Table: BASIC_READER                                          */
/*==============================================================*/
create table BASIC_READER 
(
   ID                   NUMBER(28)           not null,
   RDCODE               NUMBER(28),
   RDPASSWORD           VARCHAR2(120)        default '123456'
      constraint CKC_RDPASSWORD_BASIC_RE check (RDPASSWORD is null or (RDPASSWORD >= '6')),
   RDNAME               VARCHAR2(100),
   RDTYPE               NUMBER(2),
   RDSTATE              NUMBER(2),
   RDVIOLATE            NUMBER(2)            default 0,
   RDAGGREGATE          NUMBER(10),
   RDCERTIFY            VARCHAR2(255),
   RDLIB                VARCHAR2(32),
   RDBED                DATE,
   RDENDD               DATE,
   RDUNIT               NUMBER(28),
   RDADDRESS            VARCHAR2(255),
   RDNATION             VARCHAR2(32),
   RDJG                 VARCHAR2(32),
   RDPOSTCD             NUMBER(32),
   RDBIRTHDAY           DATE,
   RDAGE                NUMBER(32),
   RDEMAIL              VARCHAR2(255),
   RDPHONE              NUMBER(32),
   RDREMARKS            CLOB,
   constraint PK_BASIC_READER primary key (ID)
);

comment on table BASIC_READER is
'���߱�';

comment on column BASIC_READER.ID is
'���';

comment on column BASIC_READER.RDCODE is
'����֤��';

comment on column BASIC_READER.RDPASSWORD is
'����';

comment on column BASIC_READER.RDNAME is
'����';

comment on column BASIC_READER.RDTYPE is
'��¼���ԣ�0--pc��1--�ֻ���';

comment on column BASIC_READER.RDSTATE is
'��ǰ״̬(0--��Ч��1--��Ч��';

comment on column BASIC_READER.RDVIOLATE is
'ΥԼ״��(0--������1--ΥԼ��';

comment on column BASIC_READER.RDAGGREGATE is
'�ۼƽ���';

comment on column BASIC_READER.RDCERTIFY is
'���֤����';

comment on column BASIC_READER.RDLIB is
'������';

comment on column BASIC_READER.RDBED is
'֤��������';

comment on column BASIC_READER.RDENDD is
'֤��ֹ����';

comment on column BASIC_READER.RDUNIT is
'���ߵ�λ';

comment on column BASIC_READER.RDADDRESS is
'סַ';

comment on column BASIC_READER.RDNATION is
'����';

comment on column BASIC_READER.RDJG is
'����';

comment on column BASIC_READER.RDPOSTCD is
'�ʱ�';

comment on column BASIC_READER.RDBIRTHDAY is
'��������';

comment on column BASIC_READER.RDAGE is
'����';

comment on column BASIC_READER.RDEMAIL is
'email';

comment on column BASIC_READER.RDPHONE is
'�ֻ�';

comment on column BASIC_READER.RDREMARKS is
'��ע';

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
   INTRO                CLOB,
   TYPE                 NUMBER(28),
   ISBORROWED           NUMBER(1),
   constraint PK_BOOK primary key (ID)
);

comment on table BOOK is
'�鱾��
';

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

comment on column BOOK.INTRO is
'���';

comment on column BOOK.TYPE is
'���';

comment on column BOOK.ISBORROWED is
'״̬';

/*==============================================================*/
/* Table: BOOK_TYPE                                             */
/*==============================================================*/
create table BOOK_TYPE 
(
   ID                   NUMBER(28)           not null,
   FID                  NUMBER(28),
   NAME                 VARCHAR2(100),
   CODE                 VARCHAR2(100),
   EXPLAIN              VARCHAR2(500),
   constraint PK_BOOK_TYPE primary key (ID)
);

comment on table BOOK_TYPE is
'ͼ������';

comment on column BOOK_TYPE.ID is
'���';

comment on column BOOK_TYPE.FID is
'���ڵ�';

comment on column BOOK_TYPE.NAME is
'����';

comment on column BOOK_TYPE.CODE is
'�ƺ�';

comment on column BOOK_TYPE.EXPLAIN is
'��ע';

/*==============================================================*/
/* Table: CONTROLLER                                            */
/*==============================================================*/
create table CONTROLLER 
(
   ID                   NUMBER(28)           not null,
   ADCODE               VARCHAR2(32),
   ADPASSWORD           VARCHAR2(255),
   ADNAME               VARCHAR2(32),
   ADPOST               VARCHAR2(100),
   ADROLS               NUMBER(2),
   constraint PK_CONTROLLER primary key (ID)
);

comment on table CONTROLLER is
'����Ա��';

comment on column CONTROLLER.ID is
'���';

comment on column CONTROLLER.ADCODE is
'��¼��';

comment on column CONTROLLER.ADPASSWORD is
'����';

comment on column CONTROLLER.ADNAME is
'����';

comment on column CONTROLLER.ADPOST is
'ְλ';

comment on column CONTROLLER.ADROLS is
'Ȩ��';

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
);

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
);

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

