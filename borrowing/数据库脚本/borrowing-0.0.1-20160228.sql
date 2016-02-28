prompt PL/SQL Developer import file
prompt Created on 2016年2月28日 by Administrator
set feedback off
set define off
prompt Creating BOOK...
create table BOOK
(
  id             NUMBER(28) not null,
  bname          VARCHAR2(100),
  fauthor        VARCHAR2(32),
  sauthor        VARCHAR2(32),
  tauthor        VARCHAR2(32),
  translator     VARCHAR2(32),
  publisher      VARCHAR2(32),
  publshdate     DATE,
  type           NUMBER(28),
  isborrowed     NUMBER(1),
  ssh            VARCHAR2(100),
  tmh            VARCHAR2(50),
  returndate     DATE,
  orglib         VARCHAR2(500),
  curlib         VARCHAR2(500),
  curlocal       VARCHAR2(1000),
  cirtype        NUMBER(2),
  totalloannum   NUMBER(20),
  totalrenewnum  NUMBER(20),
  page           NUMBER(10),
  publisherlocal VARCHAR2(500),
  cd             NUMBER(2),
  photo          VARCHAR2(1000),
  intro          VARCHAR2(1000)
)
tablespace BORROW
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table BOOK
  is '书本表
';
comment on column BOOK.id
  is '编号';
comment on column BOOK.bname
  is '书本名';
comment on column BOOK.fauthor
  is '第一作者';
comment on column BOOK.sauthor
  is '第二作者';
comment on column BOOK.tauthor
  is '第三作者';
comment on column BOOK.translator
  is '译者';
comment on column BOOK.publisher
  is '出版社';
comment on column BOOK.publshdate
  is '出版日期';
comment on column BOOK.type
  is '类别';
comment on column BOOK.isborrowed
  is '馆藏状态';
comment on column BOOK.ssh
  is '索书号';
comment on column BOOK.tmh
  is '条码号';
comment on column BOOK.returndate
  is '应还时间';
comment on column BOOK.orglib
  is '文献所属馆';
comment on column BOOK.curlib
  is '所在馆';
comment on column BOOK.curlocal
  is '所在馆位置';
comment on column BOOK.cirtype
  is '流通类型';
comment on column BOOK.totalloannum
  is '借阅次数';
comment on column BOOK.totalrenewnum
  is '续借次数';
comment on column BOOK.page
  is '页数';
comment on column BOOK.publisherlocal
  is '出版地';
comment on column BOOK.cd
  is '是否有光盘';
comment on column BOOK.photo
  is '图片';
comment on column BOOK.intro
  is '简介';
alter table BOOK
  add constraint PK_BOOK primary key (ID)
  using index 
  tablespace BORROW
  pctfree 10
  initrans 2
  maxtrans 255;

prompt Creating BOOK_TYPE...
create table BOOK_TYPE
(
  id       NUMBER(28) not null,
  parentid NUMBER(28),
  name     VARCHAR2(100),
  code     VARCHAR2(100),
  explain  VARCHAR2(500)
)
tablespace BORROW
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table BOOK_TYPE
  is '图书类别表';
comment on column BOOK_TYPE.id
  is '编号';
comment on column BOOK_TYPE.parentid
  is '父节点';
comment on column BOOK_TYPE.name
  is '名称';
comment on column BOOK_TYPE.code
  is '称号';
comment on column BOOK_TYPE.explain
  is '备注';
alter table BOOK_TYPE
  add constraint PK_BOOK_TYPE primary key (ID)
  using index 
  tablespace BORROW
  pctfree 10
  initrans 2
  maxtrans 255;

prompt Creating RECORD...
create table RECORD
(
  id     NUMBER(28) not null,
  readid NUMBER(28),
  bookid NUMBER(28),
  begin  DATE,
  end    DATE,
  money  NUMBER(3),
  renew  NUMBER(2)
)
tablespace BORROW
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table RECORD
  is '借阅记录';
comment on column RECORD.id
  is '编号';
comment on column RECORD.readid
  is '读者';
comment on column RECORD.bookid
  is '书本';
comment on column RECORD.begin
  is '开始日期';
comment on column RECORD.end
  is '结束日期';
comment on column RECORD.money
  is '违约金额';
comment on column RECORD.renew
  is '能否续借';
alter table RECORD
  add constraint PK_RECORD primary key (ID)
  using index 
  tablespace BORROW
  pctfree 10
  initrans 2
  maxtrans 255;

prompt Creating USERROLE...
create table USERROLE
(
  id        NUMBER(28) not null,
  code      VARCHAR2(500),
  password  VARCHAR2(120) default '123456',
  name      VARCHAR2(100),
  type      NUMBER(2),
  state     NUMBER(2),
  violate   NUMBER(2) default 0,
  aggregate NUMBER(10),
  certify   VARCHAR2(255),
  lib       VARCHAR2(32),
  bed       DATE,
  endd      DATE,
  unit      NUMBER(28),
  address   VARCHAR2(255),
  nation    VARCHAR2(32),
  jg        VARCHAR2(32),
  postcd    NUMBER(32),
  birthday  DATE,
  age       NUMBER(32),
  email     VARCHAR2(255),
  phone     NUMBER(32),
  role      NUMBER(2),
  remarks   VARCHAR2(1000)
)
tablespace BORROW
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table USERROLE
  is '用户表';
comment on column USERROLE.id
  is '编号';
comment on column USERROLE.code
  is '借阅证号(即登录号)';
comment on column USERROLE.password
  is '密码';
comment on column USERROLE.name
  is '姓名';
comment on column USERROLE.type
  is '登录策略（0--pc，1--手机）';
comment on column USERROLE.state
  is '当前状态(0--有效，1--无效）';
comment on column USERROLE.violate
  is '违约状况(0--正常，1--违约）';
comment on column USERROLE.aggregate
  is '累计借书';
comment on column USERROLE.certify
  is '身份证号码';
comment on column USERROLE.lib
  is '开户馆';
comment on column USERROLE.bed
  is '证启用日期';
comment on column USERROLE.endd
  is '证终止日期';
comment on column USERROLE.unit
  is '单位';
comment on column USERROLE.address
  is '住址';
comment on column USERROLE.nation
  is '民族';
comment on column USERROLE.jg
  is '籍贯';
comment on column USERROLE.postcd
  is '邮编';
comment on column USERROLE.birthday
  is '出生日期';
comment on column USERROLE.age
  is '年龄';
comment on column USERROLE.email
  is 'email';
comment on column USERROLE.phone
  is '手机';
comment on column USERROLE.role
  is '登录角色(0--超级管理员，1--系统管理员，2--普通用户)';
comment on column USERROLE.remarks
  is '备注';
alter table USERROLE
  add constraint PK_USERROLE primary key (ID)
  using index 
  tablespace BORROW
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating WORK_TYPE...
create table WORK_TYPE
(
  id      NUMBER(28) not null,
  fid     NUMBER(28),
  name    VARCHAR2(100),
  code    VARCHAR2(100),
  explain VARCHAR2(500)
)
tablespace BORROW
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table WORK_TYPE
  is '行业类别表';
comment on column WORK_TYPE.id
  is '编号';
comment on column WORK_TYPE.fid
  is '父节点';
comment on column WORK_TYPE.name
  is '名称';
comment on column WORK_TYPE.code
  is '称号';
comment on column WORK_TYPE.explain
  is '备注';
alter table WORK_TYPE
  add constraint PK_WORK_TYPE primary key (ID)
  using index 
  tablespace BORROW
  pctfree 10
  initrans 2
  maxtrans 255;

prompt Disabling triggers for BOOK...
alter table BOOK disable all triggers;
prompt Disabling triggers for BOOK_TYPE...
alter table BOOK_TYPE disable all triggers;
prompt Disabling triggers for RECORD...
alter table RECORD disable all triggers;
prompt Disabling triggers for USERROLE...
alter table USERROLE disable all triggers;
prompt Disabling triggers for WORK_TYPE...
alter table WORK_TYPE disable all triggers;
prompt Truncating WORK_TYPE...
truncate table WORK_TYPE;
prompt Truncating USERROLE...
truncate table USERROLE;
prompt Truncating RECORD...
truncate table RECORD;
prompt Truncating BOOK_TYPE...
truncate table BOOK_TYPE;
prompt Truncating BOOK...
truncate table BOOK;
prompt Loading BOOK...
prompt Table is empty
prompt Loading BOOK_TYPE...
prompt Table is empty
prompt Loading RECORD...
prompt Table is empty
prompt Loading USERROLE...
insert into USERROLE (id, code, password, name, type, state, violate, aggregate, certify, lib, bed, endd, unit, address, nation, jg, postcd, birthday, age, email, phone, role, remarks)
values (5, 'admin', '123', 'admin', 0, 0, 0, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 0, null);
commit;
prompt 1 records loaded
prompt Loading WORK_TYPE...
prompt Table is empty
prompt Enabling triggers for BOOK...
alter table BOOK enable all triggers;
prompt Enabling triggers for BOOK_TYPE...
alter table BOOK_TYPE enable all triggers;
prompt Enabling triggers for RECORD...
alter table RECORD enable all triggers;
prompt Enabling triggers for USERROLE...
alter table USERROLE enable all triggers;
prompt Enabling triggers for WORK_TYPE...
alter table WORK_TYPE enable all triggers;
set feedback on
set define on
prompt Done.
