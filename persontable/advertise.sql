create table advertise(
	adNum       number          not null,
    adName      varchar2(50)    not null,
    adDes       clob    		 null,
    adImg       varchar(200)    null,
    regDate      date            default sysdate,
    primary key(adNum)  
)

create sequence advertise_seq
start with 1
increment by 1;

alter table advertise add (adThumbImg varchar(200));
