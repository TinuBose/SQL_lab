create database BANK;

Use BANK;

SHOW DATABASE;


create table account(accno int,cid int primary key,bid int,amount int);

desc account;

alter table account drop primary key;

desc account;

create table customer(cid int primary key,cname varchar(20),city varchar(30));


desc customer;

create table bid int primary key,bname varchar(20),city varchar(20));


desc branch;

 create table borrower(loan_no int primary key,cid int,bid int,foreign key(cid) references customer(cid),foreign key(bid) references branch(bid));


alter table account add foreign key(cid) references customer(cid);


desc account;

alter table account add foreign key(bid) references branch(bid);

insert into customer values(101,"sam curren","australia");

insert into customer values(102,"chris gyle","washington DC");

insert into customer values(103,"walter white","los angeles");

insert into customer values(104,"thomas shelby","london");


select * from customer;

insert into branch values(1001,"losangeles","usa");

insert into branch values(1002,"sydney","australia");

insert into branch values(1003,"tokyo","japan");

insert into branch values(1004,"london","england");

select * from branch;

insert into borrower values(1010,101,1001);

insert into borrower values(1011,102,1002);

insert into borrower values(1012,103,1003);

insert into borrower values(1013,104,1004);

select * from borrower;

insert into account values(1111,101,1001,10000);

insert into account values(2222,102,1002,20000);

insert into account values(3333,103,1003,30000);

insert into account values(4444,104,1004,40000);

select * from customer;

1.select cname from customer where city="london";

2.select bname from branch where city="japan";

//update customer set city="london" where cname="sam curren";

3.select c.cname from customer c,account a,branch b where c.cid=a.cid and b.bid=a.bid and b.bname="london";


4.select cname from customer c,borrower b where c.cid=b.cid and c.city="london";















