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
'读者表';

comment on column BASIC_READER.ID is
'编号';

comment on column BASIC_READER.RDCODE is
'借阅证号';

comment on column BASIC_READER.RDPASSWORD is
'密码';

comment on column BASIC_READER.RDNAME is
'姓名';

comment on column BASIC_READER.RDTYPE is
'登录策略（0--pc，1--手机）';

comment on column BASIC_READER.RDSTATE is
'当前状态(0--有效，1--无效）';

comment on column BASIC_READER.RDVIOLATE is
'违约状况(0--正常，1--违约）';

comment on column BASIC_READER.RDAGGREGATE is
'累计借书';

comment on column BASIC_READER.RDCERTIFY is
'身份证号码';

comment on column BASIC_READER.RDLIB is
'开户馆';

comment on column BASIC_READER.RDBED is
'证启用日期';

comment on column BASIC_READER.RDENDD is
'证终止日期';

comment on column BASIC_READER.RDUNIT is
'读者单位';

comment on column BASIC_READER.RDADDRESS is
'住址';

comment on column BASIC_READER.RDNATION is
'民族';

comment on column BASIC_READER.RDJG is
'籍贯';

comment on column BASIC_READER.RDPOSTCD is
'邮编';

comment on column BASIC_READER.RDBIRTHDAY is
'出生日期';

comment on column BASIC_READER.RDAGE is
'年龄';

comment on column BASIC_READER.RDEMAIL is
'email';

comment on column BASIC_READER.RDPHONE is
'手机';

comment on column BASIC_READER.RDREMARKS is
'备注';

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
'书本表
';

comment on column BOOK.ID is
'编号';

comment on column BOOK.BNAME is
'书本名';

comment on column BOOK.FAUTHOR is
'第一作者';

comment on column BOOK.SAUTHOR is
'第二作者';

comment on column BOOK.TAUTHOR is
'第三作者';

comment on column BOOK.TRANSLATOR is
'译者';

comment on column BOOK.PUBLISHER is
'出版社';

comment on column BOOK.PUBLSHDATE is
'出版日期';

comment on column BOOK.INTRO is
'简介';

comment on column BOOK.TYPE is
'类别';

comment on column BOOK.ISBORROWED is
'状态';

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
'图书类别表';

comment on column BOOK_TYPE.ID is
'编号';

comment on column BOOK_TYPE.FID is
'父节点';

comment on column BOOK_TYPE.NAME is
'名称';

comment on column BOOK_TYPE.CODE is
'称号';

comment on column BOOK_TYPE.EXPLAIN is
'备注';

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
'管理员表';

comment on column CONTROLLER.ID is
'编号';

comment on column CONTROLLER.ADCODE is
'登录名';

comment on column CONTROLLER.ADPASSWORD is
'密码';

comment on column CONTROLLER.ADNAME is
'姓名';

comment on column CONTROLLER.ADPOST is
'职位';

comment on column CONTROLLER.ADROLS is
'权限';

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
'借阅记录';

comment on column RECORD.ID is
'编号';

comment on column RECORD.READID is
'读者';

comment on column RECORD.BOOKID is
'书本';

comment on column RECORD.BEGIN is
'开始日期';

comment on column RECORD.END is
'结束日期';

comment on column RECORD.MONEY is
'违约金额';

comment on column RECORD.RENEW is
'能否续借';

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
'行业类别表';

comment on column WORK_TYPE.ID is
'编号';

comment on column WORK_TYPE.FID is
'父节点';

comment on column WORK_TYPE.NAME is
'名称';

comment on column WORK_TYPE.CODE is
'称号';

comment on column WORK_TYPE.EXPLAIN is
'备注';

