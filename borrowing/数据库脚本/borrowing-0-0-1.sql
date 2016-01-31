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
'书本表';

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

comment on column BOOK.TYPE is
'类别';

comment on column BOOK.ISBORROWED is
'馆藏状态';

comment on column BOOK.SSH is
'索书号';

comment on column BOOK.TMH is
'条码号';

comment on column BOOK.RETURNDATE is
'应还时间';

comment on column BOOK.ORGLIB is
'文献所属馆';

comment on column BOOK.CURLIB is
'所在馆';

comment on column BOOK.CURLOCAL is
'所在馆位置';

comment on column BOOK.CIRTYPE is
'流通类型';

comment on column BOOK.TOTALLOANNUM is
'借阅次数';

comment on column BOOK.TOTALRENEWNUM is
'续借次数';

comment on column BOOK.PAGE is
'页数';

comment on column BOOK.PUBLISHERLOCAL is
'出版地';

comment on column BOOK.CD is
'是否有光盘';

comment on column BOOK.PHOTO is
'图片';

comment on column BOOK.INTRO is
'简介';

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
'图书类别表';

comment on column BOOK_TYPE.ID is
'编号';

comment on column BOOK_TYPE.PARENTID is
'父节点';

comment on column BOOK_TYPE.NAME is
'名称';

comment on column BOOK_TYPE.CODE is
'称号';

comment on column BOOK_TYPE.EXPLAIN is
'备注';

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
'用户表';

comment on column USERROLE.ID is
'编号';

comment on column USERROLE.CODE is
'借阅证号(即登录号)';

comment on column USERROLE.PASSWORD is
'密码';

comment on column USERROLE.NAME is
'姓名';

comment on column USERROLE.TYPE is
'登录策略（0--pc，1--手机）';

comment on column USERROLE.STATE is
'当前状态(0--有效，1--无效）';

comment on column USERROLE.VIOLATE is
'违约状况(0--正常，1--违约）';

comment on column USERROLE.AGGREGATE is
'累计借书';

comment on column USERROLE.CERTIFY is
'身份证号码';

comment on column USERROLE.LIB is
'开户馆';

comment on column USERROLE.BED is
'证启用日期';

comment on column USERROLE.ENDD is
'证终止日期';

comment on column USERROLE.UNIT is
'单位';

comment on column USERROLE.ADDRESS is
'住址';

comment on column USERROLE.NATION is
'民族';

comment on column USERROLE.JG is
'籍贯';

comment on column USERROLE.POSTCD is
'邮编';

comment on column USERROLE.BIRTHDAY is
'出生日期';

comment on column USERROLE.AGE is
'年龄';

comment on column USERROLE.EMAIL is
'email';

comment on column USERROLE.PHONE is
'手机';

comment on column USERROLE.ROLE is
'登录角色(0--超级管理员，1--系统管理员，2--普通用户)';

comment on column USERROLE.REMARKS is
'备注';

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

