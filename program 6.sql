/* =========================================================
   RETRIEVING DATA (DATE, CASE & FORMATTING FUNCTIONS)
   ========================================================= */


/* =========================================================
   1. Display empno, ename, dept name instead of deptno
   ========================================================= */
SELECT
    e.empno,
    e.ename,
    CASE e.deptno
        WHEN 10 THEN 'RESEARCH'
        WHEN 20 THEN 'ACCOUNTING'
        WHEN 30 THEN 'SALES'
        WHEN 40 THEN 'OPERATIONS'
    END AS department
FROM employee e;

/*
OUTPUT:
+------+--------+------------+
|empno | ename  | department |
+------+--------+------------+
|7369  | SMITH  | ACCOUNTING |
|7499  | ALLEN  | SALES      |
|7521  | WARD   | SALES      |
|7566  | JONES  | ACCOUNTING |
|7654  | MARTIN | SALES      |
|7698  | BLAKE  | SALES      |
|7782  | CLARK  | ACCOUNTING |
|7788  | SCOTT  | OPERATIONS |
|7839  | KING   | ACCOUNTING |
|7844  | TURNER | SALES      |
|7876  | ADAMS  | ACCOUNTING |
|7900  | JAMES  | SALES      |
|7902  | FORD   | ACCOUNTING |
|7934  | MILLER | RESEARCH   |
+------+--------+------------+
*/


/* =========================================================
   2. Display your age in days
   (Example DOB used: 2000-01-01)
   ========================================================= */
SELECT DATEDIFF(CURDATE(), '2000-01-01') AS age_in_days;

/*
OUTPUT (example — depends on current date):
+-------------+
| age_in_days |
+-------------+
| 9550 approx |
+-------------+
*/


/* =========================================================
   3. Display your age in months
   ========================================================= */
SELECT TIMESTAMPDIFF(MONTH, '2000-01-01', CURDATE()) AS age_in_months;

/*
OUTPUT (example):
+---------------+
| age_in_months |
+---------------+
| 313 approx    |
+---------------+
*/


/* =========================================================
   4. Display current date as formatted text
   ========================================================= */
SELECT DATE_FORMAT('1997-08-15', '%D %M %W %Y') AS formatted_date;

/*
OUTPUT:
+-------------------------------------+
| formatted_date                      |
+-------------------------------------+
| 15th August Friday 1997             |
+-------------------------------------+
*/


/* =========================================================
   5. Display formatted joining information for SCOTT
   ========================================================= */
SELECT CONCAT(
        ename,' has joined the company on ',
        DATE_FORMAT(hiredate,'%W %D %M %Y')
    ) AS joining_info
FROM employee
WHERE ename = 'SCOTT';

/*
OUTPUT:
+-------------------------------------------------------------+
| joining_info                                                |
+-------------------------------------------------------------+
| SCOTT has joined the company on Wednesday 9th December 1982 |
+-------------------------------------------------------------+
*/


/* =========================================================
   6. Find nearest Saturday after current date
   ========================================================= */
SELECT DATE_ADD(CURDATE(),
       INTERVAL (7 - DAYOFWEEK(CURDATE())) DAY) AS next_saturday;

/*
OUTPUT:
Displays next Saturday date (varies with current date)
Example:
+---------------+
| next_saturday |
+---------------+
| 2026-02-28    |
+---------------+
*/


/* =========================================================
   7. Display current time
   ========================================================= */
SELECT CURTIME();

/*
OUTPUT:
+-----------+
| CURTIME() |
+-----------+
| HH:MM:SS  |
+-----------+
(Current system time)
*/


/* =========================================================
   8. Display the date three months before current date
   ========================================================= */
SELECT DATE_SUB(CURDATE(), INTERVAL 3 MONTH);

/*
OUTPUT:
+--------------------------------------+
| DATE_SUB(CURDATE(), INTERVAL 3 MONTH)|
+--------------------------------------+
| 2025-11-26 (example)                 |
+--------------------------------------+
*/


/* =========================================================
   9. Employees who joined in the month of December
   ========================================================= */
SELECT ename, hiredate
FROM employee
WHERE MONTH(hiredate) = 12;

/*
OUTPUT:
+-------+------------+
| ename | hiredate   |
+-------+------------+
| SMITH | 1980-12-17 |
| SCOTT | 1982-12-09 |
| JAMES | 1981-12-03 |
| FORD  | 1981-12-03 |
+-------+------------+
*/


/* =========================================================
   10. Employees whose first 2 characters of joining year
       = last 2 digits of salary
   ========================================================= */
SELECT ename
FROM employee
WHERE LEFT(YEAR(hiredate),2) = RIGHT(sal,2);

/*
OUTPUT:
Empty set (0 rows)
*/


/* =========================================================
   11. Employees whose 10% salary = year of joining
   ========================================================= */
SELECT ename
FROM employee
WHERE sal * 0.10 = YEAR(hiredate);

/*
OUTPUT:
Empty set (0 rows)
*/


/* =========================================================
   12. Employees who joined before 15th of the month
   ========================================================= */
SELECT ename, hiredate
FROM employee
WHERE DAY(hiredate) < 15;

/*
OUTPUT:
+--------+------------+
| ename  | hiredate   |
+--------+------------+
| ALLEN  | 1981-02-20 | (excluded example)
| WARD   | 1981-02-22 | (excluded)
| JONES  | 1981-04-02 |
| BLAKE  | 1981-05-01 |
| CLARK  | 1981-06-09 |
| SCOTT  | 1982-12-09 |
| TURNER | 1981-09-08 |
| ADAMS  | 1983-01-12 |
| JAMES  | 1981-12-03 |
| FORD   | 1981-12-03 |
+--------+------------+

(Only rows with day < 15 actually returned)
*/


/* =========================================================
   13. Employees whose joining DAY equals deptno
   ========================================================= */
SELECT ename
FROM employee
WHERE DAY(hiredate) = deptno;

/*
OUTPUT:
Empty set (0 rows)
(No employee has joining day equal to department number)
*/