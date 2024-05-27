create table tbl_member_auth (
     userid varchar2(50) not null,
     auth varchar2(50) default 'ROLE_MEMBER',
     constraint fk_member_auth foreign key(userid) references tbl_member(userid)
);

drop table tbl_member_auth;

select * from tbl_member_auth order by userid;

commit;
