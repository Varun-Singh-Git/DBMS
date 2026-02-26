/* =========================================================
   RETRIEVING DATA – SET 2 (EMPLOYEE TABLE)
   ========================================================= */


/* =========================================================
   QUESTION 1:
   Employees & jobs in Dept 30 ordered by salary (DESC)
   ========================================================= */
SELECT ename, job, sal FROM employee
WHERE deptno = 30
ORDER BY sal DESC;

/*
OUTPUT:
+--------+----------+------+
| ename  | job      | sal  |
+--------+----------+------+
| BLAKE  | MANAGER  | 2850 |
| ALLEN  | SALESMAN | 1600 |
| TURNER | SALESMAN | 1500 |
| WARD   | SALESMAN | 1250 |
| MARTIN | SALESMAN | 1250 |
| JAMES  | CLERK    |  950 |
+--------+----------+------+
*/


/* =========================================================
   QUESTION 2:
   Job & DeptNo of employees whose
   Name = 5 letters, starts with A and ends with N
   ========================================================= */
SELECT job, deptno FROM employee
WHERE ename LIKE 'A___N';

/*
OUTPUT:
+----------+--------+
| job      | deptno|
+----------+--------+
| SALESMAN | 30 |
+----------+--------+

(Employee: ALLEN)
*/


/* =========================================================
   QUESTION 3:
   Names of employees starting with S
   ========================================================= */
SELECT ename FROM employee
WHERE ename LIKE 'S%';

/*
OUTPUT:
+-------+
| ename |
+-------+
| SMITH |
| SCOTT |
+-------+
*/


/* =========================================================
   QUESTION 4:
   Names of employees ending with S
   ========================================================= */
SELECT ename FROM employee
WHERE ename LIKE '%S';

/*
OUTPUT:
+-------+
| ename |
+-------+
| JONES |
| ADAMS |
| JAMES |
+-------+
*/


/* =========================================================
   QUESTION 5:
   Employees working in Dept 10 / 20 / 40
   OR working as Clerk / Salesman / Analyst
   ========================================================= */
SELECT ename FROM employee
WHERE deptno IN (10,20,40)
   OR job IN ('CLERK','SALESMAN','ANALYST');

/*
OUTPUT:
+--------+
| ename  |
+--------+
| SMITH  |
| ALLEN  |
| WARD   |
| JONES  |
| MARTIN |
| CLARK  |
| SCOTT  |
| KING   |
| TURNER |
| ADAMS  |
| JAMES  |
| FORD   |
| MILLER |
+--------+
*/


/* =========================================================
   QUESTION 6:
   Employee number & name of employees who earn commission
   ========================================================= */
SELECT empno, ename FROM employee
WHERE comm IS NOT NULL AND comm > 0;

/*
OUTPUT:
+------+--------+
|empno | ename  |
+------+--------+
|7499  | ALLEN  |
|7521  | WARD   |
|7654  | MARTIN |
+------+--------+
*/


/* =========================================================
   QUESTION 7:
   Employee number & total salary (Salary + Commission)
   ========================================================= */
SELECT empno, (sal + IFNULL(comm,0)) AS total_salary
FROM employee;

/*
OUTPUT:
+------+--------------+
|empno | total_salary |
+------+--------------+
|7369  |  800 |
|7499  | 1900 |
|7521  | 1550 |
|7566  | 2975 |
|7654  | 2650 |
|7698  | 2850 |
|7782  | 2450 |
|7788  | 3000 |
|7839  | 5000 |
|7844  | 1500 |
|7876  | 1100 |
|7900  |  950 |
|7902  | 3000 |
|7934  | 1300 |
+------+--------------+
*/


/* =========================================================
   QUESTION 8:
   Employee number & annual salary
   ========================================================= */
SELECT empno, sal*12 AS annual_salary FROM employee;

/*
OUTPUT:
+------+---------------+
|empno | annual_salary |
+------+---------------+
|7369  |  9600 |
|7499  | 19200 |
|7521  | 15000 |
|7566  | 35700 |
|7654  | 15000 |
|7698  | 34200 |
|7782  | 29400 |
|7788  | 36000 |
|7839  | 60000 |
|7844  | 18000 |
|7876  | 13200 |
|7900  | 11400 |
|7902  | 36000 |
|7934  | 15600 |
+------+---------------+
*/


/* =========================================================
   QUESTION 9:
   Employees who are clerks earning > 3000
   ========================================================= */
SELECT ename FROM employee
WHERE job = 'CLERK' AND sal > 3000;

/*
OUTPUT:
Empty set (0 rows)
*/


/* =========================================================
   QUESTION 10:
   Employees who are clerk / salesman / analyst
   and earning > 3000
   ========================================================= */
SELECT ename FROM employee
WHERE job IN ('CLERK','SALESMAN','ANALYST')
AND sal > 3000;

/*
OUTPUT:
Empty set (0 rows)
*/