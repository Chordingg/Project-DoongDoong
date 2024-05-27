create table tbl_product(
    product_id NUMBER(10,0),
    userid varchar2(50) not null,
    cateCode varchar2(30) not null,
    regDate date default sysdate,
    updateDate date default sysdate
);

alter table tbl_product add constraint pk_product primary key (product_id);

create sequence seq_product start with 1 increment by 1;


drop table tbl_product;

select * from tbl_product;

commit;
