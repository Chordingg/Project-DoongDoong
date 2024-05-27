create table tbl_member(
      userid varchar2(50) not null primary key,
      userpw varchar2(100) ,
      userName varchar2(100) not null,
      phone varchar2(50) not null,
      memberAddr1 varchar2(100) not null, 
      memberAddr2 varchar2(100) not null, 
      memberAddr3 varchar2(100),
      regdate date default sysdate, 
      updatedate date default sysdate,
      enabled char(1) default '1'
);

drop table tbl_member;

select * from tbl_member order by userid;

commit;
