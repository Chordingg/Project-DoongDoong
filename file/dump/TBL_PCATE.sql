create table tbl_pcate(
    tier number(1) not null,
    cateName varchar2(30) not null,
    cateCode varchar2(30) not null,
    cateParent varchar2(30),
    productPrice number,
    primary key(cateCode),
    foreign key(cateParent) references tbl_pcate(cateCode)
);

    insert into tbl_pcate(tier, cateName, cateCode) values(1,'일반사진','100000');
    
    insert into tbl_pcate(tier, cateName, cateCode, cateParent) values (2,'3*5','101000','100000');
    insert into tbl_pcate(tier, cateName, cateCode, cateParent, productPrice) values (3, '120원', '101001', '101000', 120);
    
    insert into tbl_pcate(tier, cateName, cateCode, cateParent) values (2,'폴라로이드','102000','100000');
    insert into tbl_pcate(tier, cateName, cateCode, cateParent, productPrice) values (3, '120원', '102001', '102000', 120);
    
    insert into tbl_pcate(tier, cateName, cateCode, cateParent) values (2,'정사각(4*4)','103000','100000');
    insert into tbl_pcate(tier, cateName, cateCode, cateParent, productPrice) values (3, '120원', '103001', '103000', 120);
    
    insert into tbl_pcate(tier, cateName, cateCode, cateParent) values (2,'D4(4:3)','104000','100000');
    insert into tbl_pcate(tier, cateName, cateCode, cateParent, productPrice) values (3, '150원', '104001', '104000', 150);
    
    insert into tbl_pcate(tier, cateName, cateCode, cateParent) values (2,'4*6','105000','100000');
    insert into tbl_pcate(tier, cateName, cateCode, cateParent, productPrice) values (3, '150원', '105001', '105000', 150);   
    
    insert into tbl_pcate(tier, cateName, cateCode, cateParent) values (2,'5*7','106000','100000');
    insert into tbl_pcate(tier, cateName, cateCode, cateParent, productPrice) values (3, '300원', '106001', '106000', 300); 
    
    insert into tbl_pcate(tier, cateName, cateCode, cateParent) values (2,'8*10','107000','100000');
    insert into tbl_pcate(tier, cateName, cateCode, cateParent, productPrice) values (3, '1000원', '107001', '107000', 1000);
    
    insert into tbl_pcate(tier, cateName, cateCode, cateParent) values (2,'A4','108000','100000');
    insert into tbl_pcate(tier, cateName, cateCode, cateParent, productPrice) values (3, '1000원', '108001', '108000', 1000);  
    
    insert into tbl_pcate(tier, cateName, cateCode, cateParent) values (2,'10*15','109000','100000');
    insert into tbl_pcate(tier, cateName, cateCode, cateParent, productPrice) values (3, '2000원', '109001', '109000', 2000); 
    
    insert into tbl_pcate(tier, cateName, cateCode, cateParent) values (2,'11*14','110000','100000');
    insert into tbl_pcate(tier, cateName, cateCode, cateParent, productPrice) values (3, '2000원', '110001', '110000', 2000);   
    
    insert into tbl_pcate(tier, cateName, cateCode, cateParent) values (2,'A3','111000','100000');
    insert into tbl_pcate(tier, cateName, cateCode, cateParent, productPrice) values (3, '3900원', '111001', '111000', 3900);  
    
    insert into tbl_pcate(tier, cateName, cateCode, cateParent) values (2,'지갑용(1+1)','112000','100000');
    insert into tbl_pcate(tier, cateName, cateCode, cateParent, productPrice) values (3, '500원', '112001', '112000', 500);              

drop table tbl_pcate;

select * from tbl_pcate;

commit;
