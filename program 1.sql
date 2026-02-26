/* =========================================================
   QUESTION 1: Create Database
   ========================================================= */
CREATE DATABASE VARUN_SINGH_2CSE9;
USE VARUN_SINGH_2CSE9;

/*
OUTPUT:
Query OK, 1 row affected
Database changed
*/


/* =========================================================
   QUESTION 2: Create DEPARTMENT table
   ========================================================= */
CREATE TABLE department (
    deptno INT(2) PRIMARY KEY,
    dname VARCHAR(15) NOT NULL
);

/*
OUTPUT:
Query OK, 0 rows affected
*/


/* =========================================================
   QUESTION 3: Create EMPLOYEE table
   ========================================================= */
CREATE TABLE employee (
    empno INT(4) PRIMARY KEY,
    ename VARCHAR(20) NOT NULL,
    job VARCHAR(20),
    mgr INT(4),
    hiredate DATE,
    sal DECIMAL(10,0),
    comm DECIMAL(7,0),
    deptno INT(2),
    FOREIGN KEY (deptno) REFERENCES department(deptno)
);

/*
OUTPUT:
Query OK, 0 rows affected
*/


/* =========================================================
   QUESTION 4: Insert values into DEPARTMENT
   ========================================================= */
INSERT INTO department VALUES
(10,'RESEARCH'),
(20,'ACCOUNTING'),
(30,'SALES'),
(40,'OPERATIONS');

/*
OUTPUT:
Query OK, 4 rows affected

+--------+------------+
| deptno | dname      |
+--------+------------+
| 10     | RESEARCH   |
| 20     | ACCOUNTING |
| 30     | SALES      |
| 40     | OPERATIONS |
+--------+------------+
*/


/* =========================================================
   QUESTION 5: Insert values into EMPLOYEE
   ========================================================= */
INSERT INTO employee VALUES
(7369,'SMITH','CLERK',7902,'1980-12-17',800,NULL,20),
(7499,'ALLEN','SALESMAN',7698,'1981-02-20',1600,300,30),
(7521,'WARD','SALESMAN',7698,'1981-02-22',1250,300,30),
(7566,'JONES','MANAGER',7839,'1981-04-02',2975,NULL,20),
(7654,'MARTIN','SALESMAN',7698,'1981-09-28',1250,1400,30),
(7698,'BLAKE','MANAGER',7839,'1981-05-01',2850,NULL,30),
(7782,'CLARK','MANAGER',7839,'1981-06-09',2450,NULL,20),
(7788,'SCOTT','ANALYST',7566,'1982-12-09',3000,NULL,40),
(7839,'KING','PRESIDENT',NULL,'1981-11-17',5000,NULL,20),
(7844,'TURNER','SALESMAN',7698,'1981-09-08',1500,0,30),
(7876,'ADAMS','CLERK',7788,'1983-01-12',1100,NULL,20),
(7900,'JAMES','CLERK',7698,'1981-12-03',950,NULL,30),
(7902,'FORD','ANALYST',7566,'1981-12-03',3000,NULL,20),
(7934,'MILLER','CLERK',7782,'1982-01-23',1300,NULL,10);

/*
OUTPUT:
Query OK, 14 rows affected
*/


/* =========================================================
   SHOW EMPLOYEE TABLE
   ========================================================= */
SELECT * FROM employee;

/*
OUTPUT:
+------+--------+-----------+------+------------+------+-------+--------+
|empno | ename  | job       | mgr  | hiredate   | sal  | comm  | deptno|
+------+--------+-----------+------+------------+------+-------+--------+
|7369  | SMITH  | CLERK     | 7902 | 1980-12-17 |  800 | NULL  | 20 |
|7499  | ALLEN  | SALESMAN  | 7698 | 1981-02-20 | 1600 |  300  | 30 |
|7521  | WARD   | SALESMAN  | 7698 | 1981-02-22 | 1250 |  300  | 30 |
|7566  | JONES  | MANAGER   | 7839 | 1981-04-02 | 2975 | NULL  | 20 |
|7654  | MARTIN | SALESMAN  | 7698 | 1981-09-28 | 1250 | 1400  | 30 |
|7698  | BLAKE  | MANAGER   | 7839 | 1981-05-01 | 2850 | NULL  | 30 |
|7782  | CLARK  | MANAGER   | 7839 | 1981-06-09 | 2450 | NULL  | 20 |
|7788  | SCOTT  | ANALYST   | 7566 | 1982-12-09 | 3000 | NULL  | 40 |
|7839  | KING   | PRESIDENT | NULL | 1981-11-17 | 5000 | NULL  | 20 |
|7844  | TURNER | SALESMAN  | 7698 | 1981-09-08 | 1500 |   0   | 30 |
|7876  | ADAMS  | CLERK     | 7788 | 1983-01-12 | 1100 | NULL  | 20 |
|7900  | JAMES  | CLERK     | 7698 | 1981-12-03 |  950 | NULL  | 30 |
|7902  | FORD   | ANALYST   | 7566 | 1981-12-03 | 3000 | NULL  | 20 |
|7934  | MILLER | CLERK     | 7782 | 1982-01-23 | 1300 | NULL  | 10 |
+------+--------+-----------+------+------------+------+-------+--------+
*/


/* =========================================================
   SHOW DEPARTMENT TABLE
   ========================================================= */
SELECT * FROM department;

/*
OUTPUT:
+--------+------------+
| deptno | dname      |
+--------+------------+
| 10     | RESEARCH   |
| 20     | ACCOUNTING |
| 30     | SALES      |
| 40     | OPERATIONS |
+--------+------------+
*/


/* =========================================================
   REQUIRED QUERY 1:
   Create employee_master table
   ========================================================= */
CREATE TABLE employee_master AS
SELECT * FROM employee;

/*
OUTPUT:
Query OK, 14 rows copied
*/


/* =========================================================
   REQUIRED QUERY 2:
   Delete records where DeptNo = 10
   ========================================================= */
DELETE FROM employee_master
WHERE deptno = 10;

/*
OUTPUT:
Query OK, 1 row affected

Remaining rows = 13
*/


/* =========================================================
   REQUIRED QUERY 3:
   Increase salary by 10% for DeptNo = 20
   ========================================================= */
UPDATE employee_master
SET sal = sal + (sal * 0.10)
WHERE deptno = 20;

/*
OUTPUT:
Query OK, 6 rows affected

Updated salaries:
SMITH  : 800  -> 880.00
JONES  : 2975 -> 3272.50
CLARK  : 2450 -> 2695.00
KING   : 5000 -> 5500.00
ADAMS  : 1100 -> 1210.00
FORD   : 3000 -> 3300.00
*/


/* =========================================================
   REQUIRED QUERY 4:
   Modify SAL datatype
   ========================================================= */
ALTER TABLE employee_master
MODIFY sal DECIMAL(10,2);

/*
OUTPUT:
Query OK, table altered
*/


/* =========================================================
   REQUIRED QUERY 5:
   Drop employee_master table
   ========================================================= */
DROP TABLE employee_master;

/*
OUTPUT:
Query OK, table dropped
*/


/* =========================================================
   FINAL CHECK
   ========================================================= */
SELECT * FROM employee;
SELECT * FROM department;
SELECT * FROM employee_master;

/*
OUTPUT:
employee        -> shows 14 original records (unchanged)
department      -> shows 4 records
employee_master -> ERROR 1146 (42S02): Table does not exist
*/