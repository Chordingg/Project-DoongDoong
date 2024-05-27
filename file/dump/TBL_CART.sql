create table tbl_cart(
    cart_id number not null PRIMARY KEY,
    userid varchar2(50) not null, 
    product_id number not null,
    amount number default 0
);

create sequence seq_cart;

alter table tbl_cart add CONSTRAINT cart_userid_fk FOREIGN key(userid) REFERENCES tbl_member(userid);
alter table tbl_cart add CONSTRAINT cart_product_id_fk FOREIGN KEY (product_id) REFERENCES tbl_product(product_id);

drop table tbl_cart;

select * from tbl_cart;

commit;
