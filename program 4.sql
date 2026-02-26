/* =========================================================
   RETRIEVING DATA – EMPLOYEE TABLE
   ========================================================= */


/* =========================================================
   QUESTION 1:
   Employees who joined before 30-Jun-1980
   OR after 31-Dec-1981
   ========================================================= */
SELECT * FROM employee
WHERE hiredate < '1980-06-30'
   OR hiredate > '1981-12-31';

/*
OUTPUT:
+------+--------+---------+------+------------+------+-------+--------+
|empno | ename  | job     | mgr  | hiredate   | sal  | comm  | deptno|
+------+--------+---------+------+------------+------+-------+--------+
|7788  | SCOTT  | ANALYST | 7566 | 1982-12-09 |3000 | NULL  | 40 |
|7876  | ADAMS  | CLERK   | 7788 | 1983-01-12 |1100 | NULL  | 20 |
|7934  | MILLER | CLERK   | 7782 | 1982-01-23 |1300 | NULL  | 10 |
+------+--------+---------+------+------------+------+-------+--------+
*/


/* =========================================================
   QUESTION 2:
   Names of employees whose second alphabet is A
   ========================================================= */
SELECT ename
FROM employee
WHERE ename LIKE '_A%';

/*
OUTPUT:
+--------+
| ename  |
+--------+
| WARD   |
| MARTIN |
| JAMES  |
+--------+
*/


/* =========================================================
   QUESTION 3:
   Names of employees whose name is exactly 5 characters
   ========================================================= */
SELECT ename
FROM employee
WHERE LENGTH(ename) = 5;

/*
OUTPUT:
+-------+
| ename |
+-------+
| SMITH |
| ALLEN |
| JONES |
| BLAKE |
| CLARK |
| SCOTT |
| ADAMS |
| JAMES |
| FORD  |
+-------+
*/


/* =========================================================
   QUESTION 4:
   Names of employees whose second alphabet is A
   (Repeated Question)
   ========================================================= */
SELECT ename
FROM employee
WHERE ename LIKE '_A%';

/*
OUTPUT:
+--------+
| ename  |
+--------+
| WARD   |
| MARTIN |
| JAMES  |
+--------+
*/


/* =========================================================
   QUESTION 5:
   Employees NOT working as salesman, clerk or analyst
   ========================================================= */
SELECT ename
FROM employee
WHERE job NOT IN ('SALESMAN','CLERK','ANALYST');

/*
OUTPUT:
+-------+
| ename |
+-------+
| JONES |
| BLAKE |
| CLARK |
| KING  |
+-------+
*/


/* =========================================================
   QUESTION 6:
   Employee name & annual salary (highest first)
   ========================================================= */
SELECT ename, sal*12 AS annual_salary
FROM employee
ORDER BY sal DESC;

/*
OUTPUT:
+--------+---------------+
| ename  | annual_salary |
+--------+---------------+
| KING   | 60000 |
| SCOTT  | 36000 |
| FORD   | 36000 |
| JONES  | 35700 |
| BLAKE  | 34200 |
| CLARK  | 29400 |
| ALLEN  | 19200 |
| TURNER | 18000 |
| MILLER | 15600 |
| WARD   | 15000 |
| MARTIN | 15000 |
| ADAMS  | 13200 |
| JAMES  | 11400 |
| SMITH  |  9600 |
+--------+---------------+
*/


/* =========================================================
   QUESTION 7:
   Name, sal, hra, pf, da, totalsal
   HRA = 15%, DA = 10%, PF = 5%
   ========================================================= */
SELECT
    ename,
    sal,
    sal*0.15 AS hra,
    sal*0.10 AS da,
    sal*0.05 AS pf,
    (sal + (sal*0.15) + (sal*0.10) - (sal*0.05)) AS totalsal
FROM employee
ORDER BY totalsal DESC;

/*
OUTPUT (rounded values shown):
+--------+------+-------+-------+-------+----------+
| ename  | sal  | hra   | da    | pf    | totalsal |
+--------+------+-------+-------+-------+----------+
| KING   |5000 |750 |500 |250 |6000 |
| SCOTT  |3000 |450 |300 |150 |3600 |
| FORD   |3000 |450 |300 |150 |3600 |
| JONES  |2975 |446.25|297.5|148.75|3570 |
| BLAKE  |2850 |427.5|285|142.5|3420 |
| CLARK  |2450 |367.5|245|122.5|2940 |
| ALLEN  |1600 |240 |160 |80 |1920 |
| TURNER |1500 |225 |150 |75 |1800 |
| MILLER |1300 |195 |130 |65 |1560 |
| WARD   |1250 |187.5|125|62.5|1500 |
| MARTIN |1250 |187.5|125|62.5|1500 |
| ADAMS  |1100 |165 |110 |55 |1320 |
| JAMES  |950  |142.5|95 |47.5|1140 |
| SMITH  |800  |120 |80 |40 |960 |
+--------+------+-------+-------+-------+----------+
*/


/* =========================================================
   QUESTION 8:
   Update salary by 10% increment
   for employees NOT eligible for commission
   ========================================================= */
UPDATE employee
SET sal = sal + (sal * 0.10)
WHERE comm IS NULL OR comm = 0;

/*
OUTPUT:
Query OK, 11 rows affected
(Salaries updated for employees without commission)
*/


/* =========================================================
   QUESTION 9:
   Employees whose salary becomes > 3000
   after 20% increment
   ========================================================= */
SELECT ename
FROM employee
WHERE sal + (sal * 0.20) > 3000;

/*
OUTPUT (based on original salaries):
+-------+
| ename |
+-------+
| JONES |
| BLAKE |
| SCOTT |
| KING  |
| FORD  |
+-------+
*/


/* =========================================================
   QUESTION 10:
   Employees whose salary contains at least 3 digits
   ========================================================= */
SELECT ename, sal
FROM employee
WHERE LENGTH(sal) >= 3;

/*
OUTPUT:
(All employees returned because every salary has
at least three digits)

+--------+------+
| ename  | sal  |
+--------+------+
| SMITH  | 800  |
| ALLEN  |1600 |
| WARD   |1250 |
| JONES  |2975 |
| MARTIN |1250 |
| BLAKE  |2850 |
| CLARK  |2450 |
| SCOTT  |3000 |
| KING   |5000 |
| TURNER |1500 |
| ADAMS  |1100 |
| JAMES  |950  |
| FORD   |3000 |
| MILLER |1300 |
+--------+------+
*/