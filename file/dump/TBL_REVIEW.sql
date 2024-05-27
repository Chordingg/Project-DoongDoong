create table tbl_review (
    userid varchar2(50) not null,
    rno number(10,0),
    product_id varchar2(50) not null,
    title varchar2(200) not null,
    content varchar2(2000),
    score NUMBER(1,0) NOT NULL,
    photo BLOB,
    regdate date default sysdate,
    upadtedate date default sysdate
    ,constraint fk_review foreign key(userid) references tbl_member(userid)
);

create sequence seq_review;

alter table tbl_review add constraint pk_review primary key (rno);

drop table tbl_review;

select * from tbl_review;

commit;
