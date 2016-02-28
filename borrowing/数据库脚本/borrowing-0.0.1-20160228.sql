prompt PL/SQL Developer import file
prompt Created on 2016��2��28�� by Administrator
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
  is '�鱾��
';
comment on column BOOK.id
  is '���';
comment on column BOOK.bname
  is '�鱾��';
comment on column BOOK.fauthor
  is '��һ����';
comment on column BOOK.sauthor
  is '�ڶ�����';
comment on column BOOK.tauthor
  is '��������';
comment on column BOOK.translator
  is '����';
comment on column BOOK.publisher
  is '������';
comment on column BOOK.publshdate
  is '��������';
comment on column BOOK.type
  is '���';
comment on column BOOK.isborrowed
  is '�ݲ�״̬';
comment on column BOOK.ssh
  is '�����';
comment on column BOOK.tmh
  is '�����';
comment on column BOOK.returndate
  is 'Ӧ��ʱ��';
comment on column BOOK.orglib
  is '����������';
comment on column BOOK.curlib
  is '���ڹ�';
comment on column BOOK.curlocal
  is '���ڹ�λ��';
comment on column BOOK.cirtype
  is '��ͨ����';
comment on column BOOK.totalloannum
  is '���Ĵ���';
comment on column BOOK.totalrenewnum
  is '�������';
comment on column BOOK.page
  is 'ҳ��';
comment on column BOOK.publisherlocal
  is '�����';
comment on column BOOK.cd
  is '�Ƿ��й���';
comment on column BOOK.photo
  is 'ͼƬ';
comment on column BOOK.intro
  is '���';
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
  is 'ͼ������';
comment on column BOOK_TYPE.id
  is '���';
comment on column BOOK_TYPE.parentid
  is '���ڵ�';
comment on column BOOK_TYPE.name
  is '����';
comment on column BOOK_TYPE.code
  is '�ƺ�';
comment on column BOOK_TYPE.explain
  is '��ע';
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
  is '���ļ�¼';
comment on column RECORD.id
  is '���';
comment on column RECORD.readid
  is '����';
comment on column RECORD.bookid
  is '�鱾';
comment on column RECORD.begin
  is '��ʼ����';
comment on column RECORD.end
  is '��������';
comment on column RECORD.money
  is 'ΥԼ���';
comment on column RECORD.renew
  is '�ܷ�����';
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
  is '�û���';
comment on column USERROLE.id
  is '���';
comment on column USERROLE.code
  is '����֤��(����¼��)';
comment on column USERROLE.password
  is '����';
comment on column USERROLE.name
  is '����';
comment on column USERROLE.type
  is '��¼���ԣ�0--pc��1--�ֻ���';
comment on column USERROLE.state
  is '��ǰ״̬(0--��Ч��1--��Ч��';
comment on column USERROLE.violate
  is 'ΥԼ״��(0--������1--ΥԼ��';
comment on column USERROLE.aggregate
  is '�ۼƽ���';
comment on column USERROLE.certify
  is '���֤����';
comment on column USERROLE.lib
  is '������';
comment on column USERROLE.bed
  is '֤��������';
comment on column USERROLE.endd
  is '֤��ֹ����';
comment on column USERROLE.unit
  is '��λ';
comment on column USERROLE.address
  is 'סַ';
comment on column USERROLE.nation
  is '����';
comment on column USERROLE.jg
  is '����';
comment on column USERROLE.postcd
  is '�ʱ�';
comment on column USERROLE.birthday
  is '��������';
comment on column USERROLE.age
  is '����';
comment on column USERROLE.email
  is 'email';
comment on column USERROLE.phone
  is '�ֻ�';
comment on column USERROLE.role
  is '��¼��ɫ(0--��������Ա��1--ϵͳ����Ա��2--��ͨ�û�)';
comment on column USERROLE.remarks
  is '��ע';
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
  is '��ҵ����';
comment on column WORK_TYPE.id
  is '���';
comment on column WORK_TYPE.fid
  is '���ڵ�';
comment on column WORK_TYPE.name
  is '����';
comment on column WORK_TYPE.code
  is '�ƺ�';
comment on column WORK_TYPE.explain
  is '��ע';
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
