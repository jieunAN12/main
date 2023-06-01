create table tb_board(
bno number not null,
title varchar2(200) not null,
bcontent varchar2(4000),
writer varchar2(50) not null,
regdate Date default sysdate,
viewcnt number default 0,
primary key(bno)
);

select * from tb_board;

delete from tb_board where bno = '26';

drop table tb_board;

select count(*) from reply where bno='2';

insert into tb_board(bno, title, bcontent, writer)
values(rboard_seq.nextval, '제목이다', '내용이다', '작성자'
);

create table tb_member(
userId varchar2(50) primary key,
userPw varchar2(50),
userName varchar2(50),
userEmail varchar2(100),
userRegdate Date default sysdate,
userUpdatedate Date,
userAuth varchar2(10)
);

alter table tb_member modify(userAuth varchar2(10));
alter table tb_member drop column userAuth;
alter table tb_member add(userAuth varchar2(3));

insert into tb_member (userId, userPw, userName, userEmail, userAuth)
values('admin', '1234', '관리자', 'admin@naver.com', 'admin');

select * from tb_member;

create table tb_admin(
userId varchar2(50),
userPw varchar2(50),
userName varchar2(50),
userEmail varchar2(100),
userRegdate Date default sysdate,
userUpdatedate Date
);

insert into tb_admin (userId, userPw, userName, userEmail)
values('admin', '1234', '관리자', 'admin@naver.com');
            
create table tb_cart(
cartId number not null primary key,
userId varchar2(50) not null,
productId number not null,
amount number default 0
);

create table tb_product(
productId number not null primary key,
productName varchar2(50),
productPrice number,
productDesc varchar2(500),
productUrl varchar2(500)
);

select * from tb_product;

create sequence tb_cart_seq start with 10 increment by 1;

alter table tb_cart add constraint cart_userid_fk foreign key(userId)
references tb_member(userId);

alter table tb_cart add constraint cart_product_fk foreign key(productId)
references tb_product(productId);

insert into tb_product 
values(tb_product_seq.nextval, '갤럭시핸드폰', 1000000, '핸드폰입니다', 'phone.jpg');

select * from tb_product;

create sequence tb_product_seq;

select productId, productName, productPrice, productDesc, productUrl
from tb_product
order by productName;

select productId, productName, productPrice, productDesc, productUrl
from tb_product
where productId = '2';

insert into tb_cart(cartId, userId, productId, amount)
values(tb_cart_seq.nextval, 'admin', '2', '10'
);

select * from tb_cart;

select c.cartId, c.userId, p.productId, m.userName, p.productName, c.amount
, p.productPrice, (productPrice * amount) as money
from tb_member m, tb_product p, tb_cart c
where m.userId = c.userId
and p.productId = c.productId
and c.userId = 'admin'
order by c.cartId;

select nvl(sum(productPrice*amount), 0) as money
from tb_cart c, tb_product p
where c.productId = p.productId and c.userId = 'user1';

update tb_cart set amount = amount + '2'
where userId = 'user1' and productId='1';

select * from tb_cart;
select * from tb_product;

select count(*) from tb_cart
where productId = '1'
and userId = 'user1';
