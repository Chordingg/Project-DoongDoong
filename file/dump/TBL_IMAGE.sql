create table tbl_image(
    product_id NUMBER(10,0),
    fileName varchar2(100) not null,
    uploadPath varchar2(200) not null,
    uuid varchar2(100) not null,
    primary key (uuid),
    foreign key (product_id) REFERENCES tbl_product(product_id)
);

drop table tbl_image;

select * from tbl_image;

commit;
