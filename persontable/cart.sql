
create table ingredient (
    ingNum       number          not null,
    ingName      varchar2(50)    not null,
    ingCateCode     varchar2(30)    not null,
    ingPrice     number          not null,
    ingStock     number          null,
    ingDes       clob    		 null,
    ingImg       varchar(200)    null,
    regDate      date            default sysdate,
    ingThumbImg varchar(200),
    primary key(ingNum)  
);
alter table ingredient add(ingWeight varchar2(50));

drop table ingredient;
drop table ing_category;

create table ingredient (
    ingNum       number          not null,
    ingName      varchar2(50)    not null,
    ingCateCode     varchar2(30)    not null,
    ingPrice     number          not null,
    ingStock     number          null,
    ingDes       clob    		 null,
    ingImg       varchar(200)    null,
    regDate      date            default sysdate,
    ingThumbImg varchar(200),
    ingWeight varchar2(50) not null,
    primary key(ingNum)  
);

create table ing_reply (
    ingNum      number          not null,
    userId      varchar2(50)    not null,
    repNum      number          not null,
    repCon      varchar2(2000)  not null,
    repDate     date            default sysdate,
    primary key(ingNum, repNum) 
);

CREATE SEQUENCE ing_reply_seq;

alter table ing_reply
    add constraint ing_reply_ingNum foreign key(ingNum)
    references ingredient(ingNum) on delete cascade;
   
alter table ing_reply
    add constraint ing_reply_userId foreign key(userId)
    references member(userId) on delete cascade;
    

     
commit


create table cart (
    cartNum     number          not null,
    userId      varchar2(50)    not null,
    ingNum      number          not null,
    cartStock   number          not null,
    addDate     date            default sysdate,
    primary key(cartNum, userId) 
);

create sequence cart_seq;

alter table cart
    add constraint cart_userId foreign key(userId)
    references member(userId) on delete cascade;

alter table cart
    add constraint cart_ingNum foreign key(ingNum)
    references ingredient(ingNum) on delete cascade;
    

commit

create table tbl_order (
    orderId     varchar2(50) not null,
    userId      varchar2(50) not null,
    orderRec    varchar2(50) not null,
    zip   varchar2(20) not null,
    addr1   varchar2(50) not null,
    addr2   varchar2(50) not null,
    orderPhone   varchar2(30) not null,
    amount      number       not null,
    orderDate   Date         default sysdate,   
    primary key(orderId)
);



alter table tbl_order
    add constraint tbl_order_userId foreign key(userId)
    references member(userId);
    
create table tbl_order_details (
    orderDetailsNum number       not null,
    orderId         varchar2(50) not null,
    ingNum          number          not null,
    cartStock       number          not null,
    primary key(orderDetailsNum)
);
create sequence tbl_order_details_seq;

alter table tbl_order_details
    add constraint tbl_order_details_orderId foreign key(orderId)
    references tbl_order(orderId);
    
    
alter table tal_order_details drop constraint tbl_order_details_orderId
alter table tbl_order
    add(
        delivery    varchar2(20)    default '배송준비'
    );
commit