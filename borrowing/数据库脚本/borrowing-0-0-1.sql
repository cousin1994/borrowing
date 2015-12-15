/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     2015/12/16 2:07:59                           */
/*==============================================================*/


alter table BASIC_READER
   drop constraint FK_BASIC_RE_FK_BASIC__WORKTYPE;

alter table BOOK
   drop constraint FK_BOOK_FK_BOOK_R_BOOKTYPE;

alter table RECORD
   drop constraint FK_RECORD_FK_RECORD_BASIC_RE;

alter table RECORD
   drop constraint FK_RECORD_FK_RECORD_BOOK;

drop table ADMIN cascade constraints;

drop table BASIC_READER cascade constraints;

drop table BOOK cascade constraints;

drop table BOOKTYPE cascade constraints;

drop table RECORD cascade constraints;

drop table WORKTYPE cascade constraints;

/*==============================================================*/
/* Table: ADMIN                                                 */
/*==============================================================*/
create table ADMIN 
(
   ID                   NUMBER(28)           not null,
   ADCODE               VARCHAR2(32),
   ADPASSWORD           VARCHAR2(255),
   ADNAME               VARCHAR2(32),
   ADPOST               VARCHAR2(100),
   ADROLS               NUMBER(2),
   constraint PK_ADMIN primary key (ID)
);

comment on table ADMIN is
'����Ա��';

comment on column ADMIN.ID is
'���';

comment on column ADMIN.ADCODE is
'��¼��';

comment on column ADMIN.ADPASSWORD is
'����';

comment on column ADMIN.ADNAME is
'����';

comment on column ADMIN.ADPOST is
'ְλ';

comment on column ADMIN.ADROLS is
'Ȩ��';

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
'�Ƿ���';

/*==============================================================*/
/* Table: BOOKTYPE                                              */
/*==============================================================*/
create table BOOKTYPE 
(
   ID                   NUMBER(28)           not null,
   FID                  NUMBER(28),
   NAME                 VARCHAR2(100),
   CODE                 VARCHAR2(100),
   EXPLAIN              VARCHAR2(500),
   constraint PK_BOOKTYPE primary key (ID)
);

comment on table BOOKTYPE is
'ͼ������';

comment on column BOOKTYPE.ID is
'���';

comment on column BOOKTYPE.FID is
'���ڵ�';

comment on column BOOKTYPE.NAME is
'����';

comment on column BOOKTYPE.CODE is
'�ƺ�';

comment on column BOOKTYPE.EXPLAIN is
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
/* Table: WORKTYPE                                              */
/*==============================================================*/
create table WORKTYPE 
(
   ID                   NUMBER(28)           not null,
   FID                  NUMBER(28),
   NAME                 VARCHAR2(100),
   CODE                 VARCHAR2(100),
   EXPLAIN              VARCHAR2(500),
   constraint PK_WORKTYPE primary key (ID)
);

comment on table WORKTYPE is
'��ҵ����';

comment on column WORKTYPE.ID is
'���';

comment on column WORKTYPE.FID is
'���ڵ�';

comment on column WORKTYPE.NAME is
'����';

comment on column WORKTYPE.CODE is
'�ƺ�';

comment on column WORKTYPE.EXPLAIN is
'��ע';

alter table BASIC_READER
   add constraint FK_BASIC_RE_FK_BASIC__WORKTYPE foreign key (RDUNIT)
      references WORKTYPE (ID);

alter table BOOK
   add constraint FK_BOOK_FK_BOOK_R_BOOKTYPE foreign key (TYPE)
      references BOOKTYPE (ID);

alter table RECORD
   add constraint FK_RECORD_FK_RECORD_BASIC_RE foreign key (READID)
      references BASIC_READER (ID);

alter table RECORD
   add constraint FK_RECORD_FK_RECORD_BOOK foreign key (BOOKID)
      references BOOK (ID);

