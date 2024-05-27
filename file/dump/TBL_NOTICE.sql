create table tbl_notice (
    nno number(10,0),
    title varchar2(200) not null,
    content varchar2(2000) not null,
    writer varchar2(50) not null,
    regdate date default sysdate,
    upadtedate date default sysdate
);

create sequence seq_notice;

alter table tbl_notice add constraint pk_notice primary key (nno);

drop table tbl_notice;

select * from tbl_notice;

commit;
