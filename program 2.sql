/* =========================================================
   RETRIEVING DATA USING EMPLOYEE TABLE
   ========================================================= */


/* =========================================================
   QUESTION 1:
   List all distinct jobs in Employee table
   (Removes duplicate job names)
   ========================================================= */
SELECT DISTINCT job FROM employee;

/*
OUTPUT:
+-----------+
| job       |
+-----------+
| CLERK     |
| SALESMAN  |
| MANAGER   |
| ANALYST   |
| PRESIDENT |
+-----------+
*/


/* =========================================================
   QUESTION 2:
   List all information about employees in Department 30
   ========================================================= */
SELECT * FROM employee WHERE deptno = 30;

/*
OUTPUT:
+------+--------+-----------+------+------------+------+-------+--------+
|empno | ename  | job       | mgr  | hiredate   | sal  | comm  | deptno|
+------+--------+-----------+------+------------+------+-------+--------+
|7499  | ALLEN  | SALESMAN  | 7698 | 1981-02-20 |1600  | 300   | 30 |
|7521  | WARD   | SALESMAN  | 7698 | 1981-02-22 |1250  | 300   | 30 |
|7654  | MARTIN | SALESMAN  | 7698 | 1981-09-28 |1250  |1400   | 30 |
|7698  | BLAKE  | MANAGER   | 7839 | 1981-05-01 |2850  | NULL  | 30 |
|7844  | TURNER | SALESMAN  | 7698 | 1981-09-08 |1500  | 0     | 30 |
|7900  | JAMES  | CLERK     | 7698 | 1981-12-03 | 950  | NULL  | 30 |
+------+--------+-----------+------+------------+------+-------+--------+
*/


/* =========================================================
   QUESTION 3:
   Find all department numbers greater than 20
   ========================================================= */
SELECT deptno FROM department WHERE deptno > 20;

/*
OUTPUT:
+--------+
| deptno |
+--------+
| 30     |
| 40     |
+--------+
*/


/* =========================================================
   QUESTION 4:
   Find all information about managers and clerks in department 30
   ========================================================= */
SELECT * FROM employee
WHERE deptno = 30 AND job IN ('MANAGER','CLERK');

/*
OUTPUT:
+------+--------+---------+------+------------+------+-------+--------+
|empno | ename  | job     | mgr  | hiredate   | sal  | comm  | deptno|
+------+--------+---------+------+------------+------+-------+--------+
|7698  | BLAKE  | MANAGER | 7839 | 1981-05-01 |2850  | NULL  | 30 |
|7900  | JAMES  | CLERK   | 7698 | 1981-12-03 | 950  | NULL  | 30 |
+------+--------+---------+------+------------+------+-------+--------+
*/


/* =========================================================
   QUESTION 5:
   List Employee name, Employee number, Department of all clerks
   ========================================================= */
SELECT empno, ename, deptno FROM employee
WHERE job = 'CLERK';

/*
OUTPUT:
+------+--------+--------+
|empno | ename  | deptno|
+------+--------+--------+
|7369  | SMITH  | 20 |
|7876  | ADAMS  | 20 |
|7900  | JAMES  | 30 |
|7934  | MILLER | 10 |
+------+--------+--------+
*/


/* =========================================================
   QUESTION 6:
   Find all managers NOT in department 30
   ========================================================= */
SELECT * FROM employee
WHERE job = 'MANAGER' AND deptno <> 30;

/*
OUTPUT:
+------+-------+---------+------+------------+------+-------+--------+
|empno | ename | job     | mgr  | hiredate   | sal  | comm  | deptno|
+------+-------+---------+------+------------+------+-------+--------+
|7566  | JONES | MANAGER | 7839 | 1981-04-02 |2975  | NULL  | 20 |
|7782  | CLARK | MANAGER | 7839 | 1981-06-09 |2450  | NULL  | 20 |
+------+-------+---------+------+------------+------+-------+--------+
*/


/* =========================================================
   QUESTION 7:
   List all employees in department 10 who are not managers or clerks
   ========================================================= */
SELECT * FROM employee
WHERE deptno = 10 AND job NOT IN ('MANAGER','CLERK');

/*
OUTPUT:
Empty set (0 rows)
-- Because employee in dept 10 (MILLER) is a CLERK.
*/


/* =========================================================
   QUESTION 8:
   Find employees and jobs earning between 1200 and 1400
   ========================================================= */
SELECT ename, job, sal FROM employee
WHERE sal BETWEEN 1200 AND 1400;

/*
OUTPUT:
+--------+----------+------+
| ename  | job      | sal  |
+--------+----------+------+
| WARD   | SALESMAN |1250 |
| MARTIN | SALESMAN |1250 |
| MILLER | CLERK    |1300 |
+--------+----------+------+
*/


/* =========================================================
   QUESTION 9:
   List Name and Department Number of employees who are
   clerks, analysts or salesman
   ========================================================= */
SELECT ename, deptno FROM employee
WHERE job IN ('CLERK','ANALYST','SALESMAN');

/*
OUTPUT:
+--------+--------+
| ename  | deptno|
+--------+--------+
| SMITH  | 20 |
| ALLEN  | 30 |
| WARD   | 30 |
| MARTIN | 30 |
| SCOTT  | 40 |
| TURNER | 30 |
| ADAMS  | 20 |
| JAMES  | 30 |
| FORD   | 20 |
| MILLER | 10 |
+--------+--------+
*/


/* =========================================================
   QUESTION 10:
   List Name and Department Number of employees whose
   names begin with M
   ========================================================= */
SELECT ename, deptno FROM employee
WHERE ename LIKE 'M%';

/*
OUTPUT:
+--------+--------+
| ename  | deptno|
+--------+--------+
| MARTIN | 30 |
| MILLER | 10 |
+--------+--------+
*/