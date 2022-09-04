-- 
select * from tblDPT;
select * from tblEMP;

-- ASSIGNMENT SET 2



-- 1. Retrieve a list of MANAGERS. 
select * from tblEMP where job='MANAGER';

-- 2. Find out the names and salaries of all employees earning more than 1000 per 
--month. 
select ename, salary from tblEMP where salary > 1000;


--3. Display the names and salaries of all employees except JAMES. 
select ename, salary from tblEMP where ename != 'JAMES';



--4. Find out the details of employees whose names begin with ‘S’. 
select * from tblEMP where ename like 'S%';


--5. Find out the names of all employees that have ‘A’ anywhere in their name. 
select ename from tblEMP where ename like '%A%';


--6. Find out the names of all employees that have ‘L’ as their third character in 
--their name.
select ename from tblEMP where ename like '___L%';



--7. Compute daily salary of JONES. 
select salary/30 as 'DAILY SALARY OF JONES' from tblEMP where ename = 'JONES';



--8. Calculate the total monthly salary of all employees. 
select sum(salary) as 'TOTAL MONTHLY SALARY OF ALL EMPLOYEES' from tblEMP;



--9. Print the average annual salary . 
select AVG(salary*12) as 'AVERAGE ANNUAL SALARY' from tblEMP;



--10. Select the name, job, salary, department number of all employees except 
--SALESMAN from department number 30. 
select ename, job, salary, deptno from tblEMP where job != 'SALESMAN' OR deptno <> 30;



--11. List unique departments of the EMP table. 
select distinct(e.deptno) as 'DEPARTMENTS',(select dname from tblDPT where deptno = e.deptno) 'DEPARTMENT NAME'  from tblEMP e where deptno is not null;



--12. List the name and salary of employees who earn more than 1500 and are in department 10 or 30. Label the columns Employee and Monthly Salary respectively.
select ename 'EMPLOYEE', salary 'MONTLY SALARY'from tblEMP where salary > 1500 and deptno in (10, 30)



--13. Display the name, job, and salary of all the employees whose job is MANAGER or 
--ANALYST and their salary is not equal to 1000, 3000, or 5000. 
select ename , job ,  salary from tblEMP where job in ('MANAGER', 'ANALYST') AND salary not in 
(1000, 3000, 5000);



--14. Display the name, salary and commission for all employees whose commission 
--amount is greater than their salary increased by 10%. 
select ename, job, comm 'commission' from tblEMP where comm > (salary + salary * 0.1);



--15. Display the name of all employees who have two Ls in their name and are in 
--department 30 or their manager is 7782. 
select ename from tblEMP where ename like '%L%L%' and deptno = 30 or mgr_id = 7782;



--16. Display the names of employees with experience of over 10 years and under 20 yrs.
-- Count the total number of employees. 
select ename from tblEMP where DATEDIFF(YEAR, hiredate, GETDATE())  BETWEEN 10 AND 20;
select COUNT(empno) from tblEMP where DATEDIFF(YEAR, hiredate, GETDATE())  BETWEEN 10 AND 20;



--17. Retrieve the names of departments in ascending order and their employees in 
--descending order. 
select ename, dname from tblEMP e join tblDPT d on e.deptno = d.deptno order by dname asc , ename desc;



--18. Find out experience of MILLER. 
select DATEDIFF(YEAR, hiredate, GETDATE()) 'EXPERIENCE OF MILLER' from tblEMP where ename='MILLER';

 
