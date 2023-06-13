mysql> create database job;
Query OK, 1 row affected (0.05 sec)

mysql> use job;
Database changed

mysql> show tables;
Empty set (0.00 sec)

mysql> create table departments(dept_id int,dept_name varchar(20),location_id int,primary key(dept_id));
Query OK, 0 rows affected (0.44 sec)

mysql> desc departments;
+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| dept_id     | int(11)     | NO   | PRI | NULL    |       |
| dept_name   | varchar(20) | YES  |     | NULL    |       |
| location_id | int(11)     | YES  |     | NULL    |       |
+-------------+-------------+------+-----+---------+-------+
3 rows in set (0.05 sec)

mysql> create table jobs(job_id int,job_title  varchar(50),min_salary int,max_salary int,primary key(job_id));
Query OK, 0 rows affected (0.27 sec)

mysql> desc jobs;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| job_id     | int(11)     | NO   | PRI | NULL    |       |
| job_title  | varchar(50) | YES  |     | NULL    |       |
| min_salary | int(11)     | YES  |     | NULL    |       |
| max_salary | int(11)     | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
4 rows in set (0.02 sec)
create table department(employee_id int,first_name  varchar(20),last_name varchar(20),email varchar(20),phone bigint(10),hire_date date,job_id int,foreign key(job_id)references jobs(job_id),salary int,manager_id int,dept_id int,foreign key(dept_id) references departments(dept_id));
Query OK, 0 rows affected (0.36 sec)
mysql> desc department;
+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| employee_id | int(11)     | YES  |     | NULL    |       |
| first_name  | varchar(20) | YES  |     | NULL    |       |
| last_name   | varchar(20) | YES  |     | NULL    |       |
| email       | varchar(20) | YES  |     | NULL    |       |
| phone       | bigint(10)  | YES  |     | NULL    |       |
| hire_date   | date        | YES  |     | NULL    |       |
| job_id      | int(11)     | YES  | MUL | NULL    |       |
| salary      | int(11)     | YES  |     | NULL    |       |
| manager_id  | int(11)     | YES  |     | NULL    |       |
| dept_id     | int(11)     | YES  | MUL | NULL    |       |
+-------------+-------------+------+-----+---------+-------+
10 rows in set (0.00 sec)
mysql> alter table department rename to employee;
Query OK, 0 rows affected (0.61 sec)

mysql> desc employee;
+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| employee_id | int(11)     | YES  |     | NULL    |       |
| first_name  | varchar(20) | YES  |     | NULL    |       |
| last_name   | varchar(20) | YES  |     | NULL    |       |
| email       | varchar(20) | YES  |     | NULL    |       |
| phone       | bigint(10)  | YES  |     | NULL    |       |
| hire_date   | date        | YES  |     | NULL    |       |
| job_id      | int(11)     | YES  | MUL | NULL    |       |
| salary      | int(11)     | YES  |     | NULL    |       |
| manager_id  | int(11)     | YES  |     | NULL    |       |
| dept_id     | int(11)     | YES  | MUL | NULL    |       |
+-------------+-------------+------+-----+---------+-------+
10 rows in set (0.06 sec)

mysql> create table region(region_id int primary key,region_name varchar(20));
Query OK, 0 rows affected (0.38 sec)

mysql> desc region;
+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| region_id   | int(11)     | NO   | PRI | NULL    |       |
| region_name | varchar(20) | YES  |     | NULL    |       |
+-------------+-------------+------+-----+---------+-------+
2 rows in set (0.02 sec)

mysql> create table countries(country_id int primary key,country_name varchar(20),region_id int,foreign key(region_id) references region(region_id));
Query OK, 0 rows affected (0.32 sec)

mysql> desc countries;
+--------------+-------------+------+-----+---------+-------+
| Field        | Type        | Null | Key | Default | Extra |
+--------------+-------------+------+-----+---------+-------+
| country_id   | int(11)     | NO   | PRI | NULL    |       |
| country_name | varchar(20) | YES  |     | NULL    |       |
| region_id    | int(11)     | YES  | MUL | NULL    |       |
+--------------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)



mysql> create table locations(location_id int primary key,street_address varchar(50),postal_code int,city varchar(30),state_province varchar(20),country_id int,foreign key(country_id) references countries(country_id));
Query OK, 0 rows affected (0.33 sec)

mysql> desc locations;
+----------------+-------------+------+-----+---------+-------+
| Field          | Type        | Null | Key | Default | Extra |
+----------------+-------------+------+-----+---------+-------+
| location_id    | int(11)     | NO   | PRI | NULL    |       |
| street_address | varchar(50) | YES  |     | NULL    |       |
| postal_code    | int(11)     | YES  |     | NULL    |       |
| city           | varchar(30) | YES  |     | NULL    |       |
| state_province | varchar(20) | YES  |     | NULL    |       |
| country_id     | int(11)     | YES  | MUL | NULL    |       |
+----------------+-------------+------+-----+---------+-------+
6 rows in set (0.02 sec)

mysql> create table dependents(dependent_id int primary key,first_name 

mysql> alter table employee add primary key(employee_id);
Query OK, 0 rows affected (0.79 sec)
Records: 0  Duplicates: 0  Warnings: 0


mysql> create table dependents(dependent_id int primary key,first_name varchar(20),last_name varchar(20),relationship varchar(20),employee_id int,foreign key(employee_id) references employee(employee_id));
Query OK, 0 rows affected (0.27 sec)

mysql> desc dependents;
+--------------+-------------+------+-----+---------+-------+
| Field        | Type        | Null | Key | Default | Extra |
+--------------+-------------+------+-----+---------+-------+
| dependent_id | int(11)     | NO   | PRI | NULL    |       |
| first_name   | varchar(20) | YES  |     | NULL    |       |
| last_name    | varchar(20) | YES  |     | NULL    |       |
| relationship | varchar(20) | YES  |     | NULL    |       |
| employee_id  | int(11)     | YES  | MUL | NULL    |       |
+--------------+-------------+------+-----+---------+-------+
5 rows in set (0.02 sec)


mysql> 
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| BANK               |
| College            |
| LIBRARY            |
| STAFF              |
| TRANSACTION        |
| airline            |
| airlinee           |
| application        |
| bank               |
| college            |
| college_1          |
| company            |
| db                 |
| flight_system      |
| job                |
| library            |
| library1           |
| my_company         |
| mydb               |
| mysql              |
| performance_schema |
| sherin             |
| sys                |
| test               |
| transaction        |
+--------------------+
26 rows in set (0.42 sec)

mysql> use job;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> show tables;
+---------------+
| Tables_in_job |
+---------------+
| countries     |
| departments   |
| dependents    |
| employee      |
| jobs          |
| locations     |
| region        |
+---------------+
7 rows in set (0.00 sec)

mysql> select*from countries;
Empty set (0.03 sec)

mysql> select*from departments;
Empty set (0.03 sec)

mysql> select*from region;
Empty set (0.02 sec)

mysql> select*from location;
ERROR 1146 (42S02): Table 'job.location' doesn't exist
mysql> select*from locations;
Empty set (0.01 sec)

mysql> select*from jobs;
Empty set (0.00 sec)

mysql> 


mysql> show tables;
+---------------+
| Tables_in_job |
+---------------+
| countries     |
| departments   |
| dependents    |
| employee      |
| jobs          |
| locations     |
| region        |
+---------------+
7 rows in set (0.00 sec)

mysql> insert into region values(701,"Asia"),(702,"Europe"),(703,"Australia");
Query OK, 3 rows affected (0.25 sec)
Records: 3  Duplicates: 0  Warnings: 0


mysql> select*from region;
+-----------+-------------+
| region_id | region_name |
+-----------+-------------+
|       701 | Asia        |
|       702 | Europe      |
|       703 | Australia   |
+-----------+-------------+
3 rows in set (0.00 sec)

mysql> desc countries;
+--------------+-------------+------+-----+---------+-------+
| Field        | Type        | Null | Key | Default | Extra |
+--------------+-------------+------+-----+---------+-------+
| country_id   | int(11)     | NO   | PRI | NULL    |       |
| country_name | varchar(20) | YES  |     | NULL    |       |
| region_id    | int(11)     | YES  | MUL | NULL    |       |
+--------------+-------------+------+-----+---------+-------+
3 rows in set (0.06 sec)


mysql> insert into countries values(601,"sydney",703),(602,"melbourne",703),(603,"india",701);
Query OK, 3 rows affected (0.07 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select*from countries;
+------------+--------------+-----------+
| country_id | country_name | region_id |
+------------+--------------+-----------+
|        601 | sydney       |       703 |
|        602 | melbourne    |       703 |
|        603 | india        |       701 |
+------------+--------------+-----------+
3 rows in set (0.00 sec)

mysql> desc departments;
+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| dept_id     | int(11)     | NO   | PRI | NULL    |       |
| dept_name   | varchar(20) | YES  |     | NULL    |       |
| location_id | int(11)     | YES  |     | NULL    |       |
+-------------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> desc locations;
+----------------+-------------+------+-----+---------+-------+
| Field          | Type        | Null | Key | Default | Extra |
+----------------+-------------+------+-----+---------+-------+
| location_id    | int(11)     | NO   | PRI | NULL    |       |
| street_address | varchar(50) | YES  |     | NULL    |       |
| postal_code    | int(11)     | YES  |     | NULL    |       |
| city           | varchar(30) | YES  |     | NULL    |       |
| state_province | varchar(20) | YES  |     | NULL    |       |
| country_id     | int(11)     | YES  | MUL | NULL    |       |
+----------------+-------------+------+-----+---------+-------+
6 rows in set (0.00 sec)


mysql> insert into locations values(1700,"chengannur",690155,"alappuzha","india",603),(1701,"mattancherry",680121,"eranakulam","india",603),(1702,"munnar",690158,"idukki","india",603);
Query OK, 3 rows affected (0.05 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select*from locations;
+-------------+----------------+-------------+------------+----------------+------------+
| location_id | street_address | postal_code | city       | state_province | country_id |
+-------------+----------------+-------------+------------+----------------+------------+
|        1700 | chengannur     |      690155 | alappuzha  | india          |        603 |
|        1701 | mattancherry   |      680121 | eranakulam | india          |        603 |
|        1702 | munnar         |      690158 | idukki     | india          |        603 |
+-------------+----------------+-------------+------------+----------------+------------+
3 rows in set (0.00 sec)


mysql> desc departments;
+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| dept_id     | int(11)     | NO   | PRI | NULL    |       |
| dept_name   | varchar(20) | YES  |     | NULL    |       |
| location_id | int(11)     | YES  |     | NULL    |       |
+-------------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> insert into locations values("1703","saroji nagar",678940,"delhi","india",603);
Query OK, 1 row affected (0.06 sec)

mysql> select*from locations;
+-------------+----------------+-------------+------------+----------------+------------+
| location_id | street_address | postal_code | city       | state_province | country_id |
+-------------+----------------+-------------+------------+----------------+------------+
|        1700 | chengannur     |      690155 | alappuzha  | india          |        603 |
|        1701 | mattancherry   |      680121 | eranakulam | india          |        603 |
|        1702 | munnar         |      690158 | idukki     | india          |        603 |
|        1703 | saroji nagar   |      678940 | delhi      | india          |        603 |
+-------------+----------------+-------------+------------+----------------+------------+
4 rows in set (0.00 sec)

mysql> desc departments;
+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| dept_id     | int(11)     | NO   | PRI | NULL    |       |
| dept_name   | varchar(20) | YES  |     | NULL    |       |
| location_id | int(11)     | YES  |     | NULL    |       |
+-------------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> insert into departments values(1,"computer science",1700),(2,"electronics",1701),(3,"electronics",1702),(4,"bio technology",1702),(5,"finance",1703);
Query OK, 5 rows affected (0.07 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> select*from departments;
+---------+------------------+-------------+
| dept_id | dept_name        | location_id |
+---------+------------------+-------------+
|       1 | computer science |        1700 |
|       2 | electronics      |        1701 |
|       3 | electronics      |        1702 |
|       4 | bio technology   |        1702 |
|       5 | finance          |        1703 |
+---------+------------------+-------------+
5 rows in set (0.00 sec)





