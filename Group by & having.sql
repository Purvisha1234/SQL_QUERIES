

--1)Find the department with an average salary greater than 20,000
SELECT DEPARTMENT,AVG(SALARY)
FROM EMPLOYEEDETAILS 
GROUP BY DEPARTMENT
HAVING AVG(SALARY) > 20000

--2)list the cities where the average employee age is greater than 20
select CITY,AVG(EAGE)
FROM EMPLOYEEDETAILS
GROUP BY CITY
HAVING AVG(EAGE) > 20

--3)find the departments with more than 5 employees
select DEPARTMENT, count(*)
from EMPLOYEEDETAILS
GROUP BY DEPARTMENT
HAVING COUNT(*) > 5

--4)List the cities where the total salary of all employees exceeds 300000
select CITY,SUM(SALARY)
FROM EMPLOYEEDETAILS
GROUP BY CITY
HAVING SUM(SALARY) > 30000

--5)find the departments where the average age of employees is between 20 and 25
select department 
from EMPLOYEEDETAILS
group by DEPARTMENT
having avg(eage) between 20 and 25