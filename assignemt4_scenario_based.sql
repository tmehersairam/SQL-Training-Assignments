use ASSIGNMENTDB

create table tblBook(id int identity(1,1) primary key , title varchar(max), author varchar(max), isbn numeric(20,0) unique, published_date datetime)
insert into tblBook values
('My First SQL book', 'Mary parker',1363636224,'2012-02-22 12:08:17.260'),
('My Second SQL book', 'John Mayer',5428570112,'1972-02-22 12:08:17.260'),
('My Third SQL book', 'Cary Flint',1641777152,'2015-02-22 12:08:17.260');

-- Write a query to fetch the details of the books written by author whose name ends with er.
select * from tblBook where author like '%er';

drop table tblReview;
create table tblReview(id int identity(1,1) primary key, book_id int foreign key references tblBook(id), reviewer_name varchar(20), content varchar(max), rating numeric(10), published_date datetime);

select * from tblReview;

insert into tblReview values
(1, 'John Smith', 'First review of john',1,'2012-02-22 12:08:17.260'),
(2,'John Smith', 'Second review',4,'1972-02-22 12:08:17.260'),
(3,'Alice waker', 'Third review',5,'2015-02-22 12:08:17.260');

-- Display the Title ,Author and ReviewerName for all the books from the above tabl
select title, author, reviewer_name as 'reviewer name' from tblBook, tblReview where tblBook.id = tblReview.book_id;

-- Display the reviewer name who reviewed more than one book.
select reviewer_name from tblReview group by reviewer_name having count(reviewer_name) > 1;


create table tblCustomer(id int identity(1,1) primary key, name varchar(20),  age numeric(4), address varchar(max), salary numeric(10));
create table tblOrder(int int identity(1, 1)primary key, odr_date date, customer_id int foreign key references tblCustomer(id), amount numeric(10))

-- Display the Name for the customer from above customer table who live in same address which has character o anywhere in address
-- method 1
select * from tblCustomer where address in (select address from tblCustomer where address like  '%o%' group by address having count(address) > 1);
-- method 2
select * from tblCustomer c1 join tblCustomer c2  on c1.address = c2.address where c1.id != c2.id and c1.address like '%o%';

-- Write a query to display the Date,Total no of customer placed order on same Date
select count(*) ' Total number of customers placed on same date ', odr_date 'order date' from tblCustomer c1 join tblOrder o1 on c1.id = o1.customer_id group by odr_date having count(*) > 1;

-- Display the Names of the Employee in lower case, whose salary is null
select lower(ename) 'Employee name' from tblEMP where salary is null; 



create table tblStudentDetails(registerNo int primary key identity(1,1), Name varchar(20), age numeric(4), qualification varchar(10), mobileNo numeric(10), mailId varchar(40), Location varchar(20), gender char); 
-- Write a sql server query to display the Gender,Total no of male and female from the above
-- relation
select gender, count(*) 'Gender count'from tblStudentDetails group by gender;

create table tblCourse(cid varchar(6) primary key , c_name varchar(20), start_date date, end_date date, fee numeric(4));
create table tblCourseRegistration(registerNo int primary key identity(1,1), cid  varchar(6) foreign key references tblCourse(cid), batch varchar(4));

-- Retrieve the CourseName and the number of student registered for each course between 2018-01-02 and 2018-02-28 and arrange the result by courseid in descending order
select c_name 'Course name', (select count(*) from tblCourseRegistration where cid = c.cid) 'Number of student registered' from tblCourse c where start_date > '2018-01-02' and end_date <= '2018-02-28' 


create table tblCustomer2(c_id int identity(1,1) primary key, first_name varchar(10), last_name varchar(10));
create table tblOrder2(order_id int identity(1,1) primary key, order_date date, amount numeric(10),	c_id int foreign key references tblCustomer2(c_id));	

--Display the Firstname and LastName of the customer who have placed exactly 2 orders.
select * from tblCustomer2 c where (select count(*) from tblOrder2 where c_id = c.c_id)  = 2;

--Display all the student name in reverse order and Capitalize all the character in location
select Name, upper(Location) as 'Location' from tblStudentDetails order by name desc; 

create table tblOrder3(order_id int identity(1,1) primary key, order_date date, order_number numeric (20), amount numeric(10),	c_id int foreign key references tblCustomer2(c_id));	
create table tblProduct(id int identity(1,1) primary key, product_name varchar(20), supplierId numeric(20), unitPrice numeric(4), package varchar(10), isDiscontinued numeric(1));
create table tblOrderItem(id int identity(1,1) primary key, orderId int foreign key references tblOrder3(order_id), product_id int foreign key references tblProduct(id),unitPrice numeric(4), quantity numeric(20));

--Create a view table to display the ProductName,ordered Quantity and OrderNumber from the above relations
create view orderView as select product_name, quantity, order_number from tblOrder3 o join tblOrderItem oi on o.order_id = oi.orderId join tblProduct p on oi.product_id = p.id;

--Display the Course Name registered by student Nisha
select c.c_name 'Course Name' from tblStudentDetails sd join tblCourseRegistration cr on sd.registerNo = cr.registerNo join tblCourse c on cr.cid = c.cid where sd.name = 'Neha';