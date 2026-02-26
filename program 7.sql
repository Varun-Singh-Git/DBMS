/* =========================================================
   RETRIEVING DATA (Functions & Aggregates)
   ========================================================= */


/* =========================================================
   1. Compute number of days remaining in this year
   ========================================================= */
SELECT DATEDIFF(
    MAKEDATE(YEAR(CURDATE()) + 1, 1),
    CURDATE()
) AS days_remaining;

/*
OUTPUT (example – depends on current date):
+----------------+
| days_remaining |
+----------------+
| 308 approx     |
+----------------+
Logic → First day of next year − today
*/


/* =========================================================
   2. Highest salary, Lowest salary & Difference
   ========================================================= */
SELECT
    MAX(sal) AS highest_salary,
    MIN(sal) AS lowest_salary,
    MAX(sal) - MIN(sal) AS difference
FROM employee;

/*
OUTPUT:
+----------------+---------------+------------+
| highest_salary | lowest_salary | difference |
+----------------+---------------+------------+
| 5000           | 800           | 4200       |
+----------------+---------------+------------+
*/


/* =========================================================
   3. Employees whose commission > 25% of salary
   ========================================================= */
SELECT ename, sal, comm
FROM employee
WHERE comm > sal * 0.25;

/*
OUTPUT:
+--------+------+------+
| ename  | sal  | comm |
+--------+------+------+
| ALLEN  | 1600 | 300  |
| WARD   | 1250 | 300  |
| MARTIN | 1250 | 1400 |
+--------+------+------+
*/


/* =========================================================
   4. Display salary in Dollar format
   ========================================================= */
SELECT ename, CONCAT('$', sal) AS salary
FROM employee;

/*
OUTPUT:
+--------+---------+
| ename  | salary  |
+--------+---------+
| SMITH  | $800    |
| ALLEN  | $1600   |
| WARD   | $1250   |
| JONES  | $2975   |
| MARTIN | $1250   |
| BLAKE  | $2850   |
| CLARK  | $2450   |
| SCOTT  | $3000   |
| KING   | $5000   |
| TURNER | $1500   |
| ADAMS  | $1100   |
| JAMES  | $950    |
| FORD   | $3000   |
| MILLER | $1300   |
+--------+---------+
*/


/* =========================================================
   5. Matrix Query (Pivot Style)
   Salary per job based on department
   ========================================================= */
SELECT
    job,
    SUM(CASE WHEN deptno = 10 THEN sal ELSE 0 END) AS dept10,
    SUM(CASE WHEN deptno = 20 THEN sal ELSE 0 END) AS dept20,
    SUM(CASE WHEN deptno = 30 THEN sal ELSE 0 END) AS dept30,
    SUM(CASE WHEN deptno = 40 THEN sal ELSE 0 END) AS dept40,
    SUM(sal) AS total_salary
FROM employee
GROUP BY job;

/*
OUTPUT:
+-----------+--------+--------+--------+--------+--------------+
| job       | dept10 | dept20 | dept30 | dept40 | total_salary |
+-----------+--------+--------+--------+--------+--------------+
| ANALYST   |   0    | 3000   |   0    | 3000   | 6000 |
| CLERK     | 1300   | 1900   | 950    |   0    | 4150 |
| MANAGER   |   0    | 5425   | 2850   |   0    | 8275 |
| PRESIDENT |   0    | 5000   |   0    |   0    | 5000 |
| SALESMAN  |   0    |   0    | 5600   |   0    | 5600 |
+-----------+--------+--------+--------+--------+--------------+
*/


/* =========================================================
   6. Total employees & employees hired per year
   ========================================================= */
SELECT
    COUNT(*) AS total_employees,
    SUM(CASE WHEN YEAR(hiredate)=1980 THEN 1 ELSE 0 END) AS y1980,
    SUM(CASE WHEN YEAR(hiredate)=1981 THEN 1 ELSE 0 END) AS y1981,
    SUM(CASE WHEN YEAR(hiredate)=1982 THEN 1 ELSE 0 END) AS y1982,
    SUM(CASE WHEN YEAR(hiredate)=1983 THEN 1 ELSE 0 END) AS y1983
FROM employee;

/*
OUTPUT:
+----------------+------+-------+------+------+
| total_employees| y1980| y1981 | y1982| y1983|
+----------------+------+-------+------+------+
| 14             | 1    | 10    | 2    | 1    |
+----------------+------+-------+------+------+
*/


/* =========================================================
   7. Query to get Last Sunday of February 2026
   ========================================================= */
SELECT DATE_SUB(
    LAST_DAY('2026-02-01'),
    INTERVAL (DAYOFWEEK(LAST_DAY('2026-02-01')) - 1) DAY
) AS last_sunday;

/*
OUTPUT:
+-------------+
| last_sunday |
+-------------+
| 2026-02-22  |
+-------------+
*/


/* =========================================================
   8. Department numbers & total employees per department
   ========================================================= */
SELECT deptno, COUNT(*) AS total_employees
FROM employee
GROUP BY deptno;

/*
OUTPUT:
+--------+------------------+
| deptno | total_employees  |
+--------+------------------+
| 10     | 1 |
| 20     | 5 |
| 30     | 6 |
| 40     | 1 |
+--------+------------------+
*/


/* =========================================================
   9. Jobs & total employees per job
   ========================================================= */
SELECT job, COUNT(*) AS total_employees
FROM employee
GROUP BY job;

/*
OUTPUT:
+-----------+------------------+
| job       | total_employees  |
+-----------+------------------+
| ANALYST   | 2 |
| CLERK     | 4 |
| MANAGER   | 3 |
| PRESIDENT | 1 |
| SALESMAN  | 4 |
+-----------+------------------+
*/


/* =========================================================
   10. Department numbers & total salary per department
   ========================================================= */
SELECT deptno, SUM(sal) AS total_salary
FROM employee
GROUP BY deptno;

/*
OUTPUT:
+--------+--------------+
| deptno | total_salary |
+--------+--------------+
| 10     | 1300 |
| 20     | 12225 |
| 30     | 9400 |
| 40     | 3000 |
+--------+--------------+
*/