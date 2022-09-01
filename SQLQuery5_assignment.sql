create database ASSIGNMENTDB;
USE ASSIGNMENTDB;

CREATE TABLE tblClient(
   Client_ID NUMERIC(4) NOT NULL PRIMARY KEY ,
   Cname     VARCHAR(40) NOT NULL,
   Address   VARCHAR(30),
   Email     VARCHAR(30) UNIQUE,
   Phone     NUMERIC(10),
   Business  VARCHAR(20) NOT NULL
);


CREATE TABLE tblDepartment(
   Deptno NUMERIC(2,0) NOT NULL PRIMARY KEY,
   Dname  VARCHAR(15) NOT NULL,
   Loc    VARCHAR(20)
);


CREATE TABLE tblEmployee(
   Empno  NUMERIC(4,0) NOT NULL PRIMARY KEY,
   Ename  VARCHAR(20) NOT NULL,
   Job    VARCHAR(15),
   Salary NUMERIC(7,0) check (Salary > 0),
   Deptno NUMERIC(2,0) foreign key references tblDepartment(Deptno)
);

CREATE TABLE tblProject(
   Project_ID       NUMERIC(3,0) NOT NULL PRIMARY KEY, 
   Descr            VARCHAR(30) NOT NULL,
   Start_Date       DATE ,
   Planned_End_Date DATE , 
   Actual_End_date  DATE ,
   Budget           NUMERIC(10,0) check (Budget > 0),
   Client_ID        NUMERIC(4,0) foreign key references tblClient(Client_ID),
   constraint ckdate_plannededata_actualedata check(Planned_End_Date < Actual_End_date )
);

CREATE TABLE tblEmpProjectTasks(
   Project_ID NUMERIC(3,0) NOT NULL,
   Empno      NUMERIC(4,0) NOT NULL,
   Start_Date DATE,
   End_Date   DATE,
   Task       VARCHAR(25) NOT NULL,
   Status     VARCHAR(15) NOT NULL,
   constraint pk_projectId_empNo PRIMARY KEY(Project_ID, Empno),
   constraint fkey_tblProjectTask_projectid FOREIGN KEY(Project_ID) REFERENCES tblProject(Project_ID),
   constraint fkey_tblProjectTask_empno FOREIGN KEY(Empno) REFERENCES tblEmployee(Empno)
  
);



--- insert values client
INSERT INTO tblClient(Client_ID,Cname,Address,Email,Phone,Business) VALUES (1001,'ACME Utilities','Noida','contact@acmeutil.com',9567880032,'Manufacturing');
INSERT INTO tblClient(Client_ID,Cname,Address,Email,Phone,Business) VALUES (1002,'Trackon Consultants','Mumbai','consult@trackon.com',8734210090,'Consultant');
INSERT INTO tblClient(Client_ID,Cname,Address,Email,Phone,Business) VALUES (1003,'MoneySaver Distributors','Kolkata','save@moneysaver.com',7799886655,'Reseller');
INSERT INTO tblClient(Client_ID,Cname,Address,Email,Phone,Business) VALUES (1004,'Lawful Corp','Chennai','justice@lawful.com',9210342219,'Professional');

-- insert values department

INSERT INTO tblDepartment(Deptno,Dname,Loc) VALUES (10,'Design','Pune');
INSERT INTO tblDepartment(Deptno,Dname,Loc) VALUES (20,'Development','Pune');
INSERT INTO tblDepartment(Deptno,Dname,Loc) VALUES (30,'Testing','Mumbai');
INSERT INTO tblDepartment(Deptno,Dname,Loc) VALUES (40,'Document','Mumbai');
-- insert values employee

INSERT INTO tblEmployee(Empno,Ename,Job,Salary,Deptno) VALUES (7001,'Sandeep','Analyst',25000,10);
INSERT INTO tblEmployee(Empno,Ename,Job,Salary,Deptno) VALUES (7002,'Rajesh','Designer',30000,10);
INSERT INTO tblEmployee(Empno,Ename,Job,Salary,Deptno) VALUES (7003,'Madhav','Developer',40000,20);
INSERT INTO tblEmployee(Empno,Ename,Job,Salary,Deptno) VALUES (7004,'Manoj','Developer',40000,20);
INSERT INTO tblEmployee(Empno,Ename,Job,Salary,Deptno) VALUES (7005,'Abhay','Designer',35000,10);
INSERT INTO tblEmployee(Empno,Ename,Job,Salary,Deptno) VALUES (7006,'Uma','Tester',30000,30);
INSERT INTO tblEmployee(Empno,Ename,Job,Salary,Deptno) VALUES (7007,'Gita','Tech. Writer',30000,40);
INSERT INTO tblEmployee(Empno,Ename,Job,Salary,Deptno) VALUES (7008,'Priya','Tester',35000,30);
INSERT INTO tblEmployee(Empno,Ename,Job,Salary,Deptno) VALUES (7009,'Nutan','Developer',45000,20);
INSERT INTO tblEmployee(Empno,Ename,Job,Salary,Deptno) VALUES (7010,'Smita','Analyst',20000,10);
INSERT INTO tblEmployee(Empno,Ename,Job,Salary,Deptno) VALUES (7011,'Anand','Project Mgr',65000,10);


-- insert values projects

INSERT INTO tblProject(Project_ID,Descr,Start_Date,Planned_End_Date,Actual_End_date,Budget,Client_ID) VALUES (401,'Inventory','1-Apr-11','1-Oct-11','31-Oct-11',150000,1001);
INSERT INTO tblProject(Project_ID,Descr,Start_Date,Planned_End_Date,Actual_End_date,Budget,Client_ID) VALUES (402,'Accounting','1-Aug-11','1-Jan-12',NULL,500000,1002);
INSERT INTO tblProject(Project_ID,Descr,Start_Date,Planned_End_Date,Actual_End_date,Budget,Client_ID) VALUES (403,'Payroll','1-Oct-11','31-Dec-11',NULL,75000,1003);
INSERT INTO tblProject(Project_ID,Descr,Start_Date,Planned_End_Date,Actual_End_date,Budget,Client_ID) VALUES (404,'Contact Mgmt','1-Nov-11','31-Dec-11',NULL,50000,1004);


-- insert values EmpProjectTasks

INSERT INTO tblEmpProjectTasks(Project_ID,Empno,Start_Date,End_Date,Task,Status) VALUES (401,7001,'1-Apr-11','20-Apr-11','System Analysis','Completed');
INSERT INTO tblEmpProjectTasks(Project_ID,Empno,Start_Date,End_Date,Task,Status) VALUES (401,7002,'21-Apr-11','30-May-11','System Design','Completed');
INSERT INTO tblEmpProjectTasks(Project_ID,Empno,Start_Date,End_Date,Task,Status) VALUES (401,7003,'1-Jun-11','15-Jul-11','Coding','Completed');
INSERT INTO tblEmpProjectTasks(Project_ID,Empno,Start_Date,End_Date,Task,Status) VALUES (401,7004,'18-Jul-11','1-Sep-11','Coding','Completed');
INSERT INTO tblEmpProjectTasks(Project_ID,Empno,Start_Date,End_Date,Task,Status) VALUES (401,7006,'3-Sep-11','15-Sep-11','Testing','Completed');
INSERT INTO tblEmpProjectTasks(Project_ID,Empno,Start_Date,End_Date,Task,Status) VALUES (401,7009,'18-Sep-11','5-Oct-11','Code Change','Completed');
INSERT INTO tblEmpProjectTasks(Project_ID,Empno,Start_Date,End_Date,Task,Status) VALUES (401,7008,'6-Oct-11','16-Oct-11','Testing','Completed');
INSERT INTO tblEmpProjectTasks(Project_ID,Empno,Start_Date,End_Date,Task,Status) VALUES (401,7007,'6-Oct-11','22-Oct-11','Documentation','Completed');
INSERT INTO tblEmpProjectTasks(Project_ID,Empno,Start_Date,End_Date,Task,Status) VALUES (401,7011,'22-Oct-11','31-Oct-11','Sign off','Completed');
INSERT INTO tblEmpProjectTasks(Project_ID,Empno,Start_Date,End_Date,Task,Status) VALUES (402,7010,'1-Aug-11','20-Aug-11','System Analysis','Completed');
INSERT INTO tblEmpProjectTasks(Project_ID,Empno,Start_Date,End_Date,Task,Status) VALUES (402,7002,'22-Aug-11','30-Sep-11','System Design','Completed');
INSERT INTO tblEmpProjectTasks(Project_ID,Empno,Start_Date,End_Date,Task,Status) VALUES (402,7004,'1-Oct-11',NULL,'Coding','In Progress');



select * from tblClient;
select * from tblDepartment;
select * from tblEmployee;
select * from tblProject;
select * from tblEmpProjectTasks;

