create    table    department(dept_id    int primary    key,dname    varchar(30),hod varchar(20)

desc department;

desc department;

create table dept_ph(dept_id int,phno numeric(10),primary key(dept_id,phno));

desc dept_ph;

create table professor(empid int primary key,pname varchar(20),sex varchar(7),strt_yr int,dept_id int,foreign key(dept_id)references department(dept_id)on delete cascade);

desc professor;

create table prof_ph(empid int,phno numeric(10),primary key(empid,phno));

desc prof_ph;

create table student(rollno int primary key,sname varchar(20),degree varchar(20),year int,sex varchar(7),dept_id int,empid int,foreign key(dept_id)references department(dept_id)on delete cascade,foreign key(empid)references professor(empid)on delete cascade);

desc student;

create  table  course(cid  intprimary  key,cname  varchar(20),min_cred  int,dept_id int,empid    int,foreign    key(dept_id)references    department(dept_id)on    delete cascade,foreign key(empid)references professor(empid)on delete cascade);

desc course;

create table enrollment(rollno int,cid int,primary key(rollno,cid));

desc enrollment;

insert into department values (121,'MCA','Prof. Reena'), (122,'CSE','Prof. Madhav'), (123,'MBA','Prof. John');

select * from department;

insert into professor values(1001,'Alice','Female',1998,121),(1002,'Madhu','Male',2002,121),(1003,'Nidhin','Male',1992,122),(1004,'Sheela','Female',2001,123),(1005,'Viji','Female',1990,123),(1006,'Arun','Male',1990,122);

select * from professor;

insert into student values(1,'Anju','BCA',2019,'Female',121,1001),(2,'Botto','BscCS',2018,'Male',122,1003),(3,'Arjun','BscPh',2019,'Male',121,1002),(4,'Jinu','BBA',2019,'Male',123,1004);

select * from student;

insert into prof_ph values (1001,9999999991), (1002,9999999992), (1003,9999999993), (1004,9999999994),(1005,9999999995), (1006,9999999996);

select * from prof_ph;

insert into dept_ph values (121,9999999980), (122,9999999981), (123,9999999982);

select * from dep_ph;

insert into course value(201,'Btech CSE',8,122,1003),(202,'Mtech CSE',10,122,1003),(203,'MCA',9,121,1001),(204,'MBA',9,123,1005);

select * from course;

insert into enrollment values (1,203), (2,201), (3,203), (4,204);

select * from enrollment;

delete from professor where strt_yr=1992;

select * from professor;

update  prof_ph  set  phno=04764567878  where  empid  in(select  empid  from professor    where    dept_id=(select dept_id    from    department    where dname='MCA'));

select * from prof_ph;

select * from professor where strt_yr>1990 order by pname;

select * from professor where strt_yr between 1990 and 2000;

select empid,pname from professor where sex='Female' and dept_id=(select dept_id from department where dname='MCA');

select    e.empid,e.pname,p.phno    from    professor    e,prof_ph    p    where e.empid=p.empid  and  e.strt_yr>2000  and  e.dept_id=(select  dept_idfrom department where dname='MCA');

select  *  from  student  where  empid=(select  empid  from  professor  where pname='Alice');

select  s.rollno,s.sname  from  student  s,professor  p  where  s.empid=p.empid and s.sex=p.sex);

select empid,pname from professor where strt_yr=(select min(strt_yr) from professor);

select  empid,pname  from  professor  where  empid  in(select  empid  from student where sex='Female');

select  rollno  from  enrollment  where  cid  in(select  cid  from  course  where cname like '%btech%' or cname='MCA');

select    count(*)    from    student    where    dept_id=(select    dept_idfrom department where dname='MCA');

select c.cname,p.pname from course c,professor p where c.empid=p.empid;

select count(*),cid from enrollment group by cid;

reate  view  employee  as  select  e.empid,e.pname,p.phno  from  professor e,prof_ph as  p  where  e.dept_id=(select  dept_id  from  department  where dname='CSE') and e.empid=p.empid and e.strt_yr>=1990;

select * from employee;

select * from employee where pname like 'M%' or pname like '%n';

select d.dname,c.* from department as d join(select count(cid),dept_id from course group by dept_id) c using (dept_id);

select s.rollno,s.sname,p.pname,c.cname from student s,professor p,course c  where  s.empid=p.empid  and  c.cid  in(select  cid  from  enrollment  where s.rollno=rollno)   and   s.dept_id=(select   dept_id   from   department   where dname='MCA');
