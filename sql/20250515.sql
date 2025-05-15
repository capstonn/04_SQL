SELECT * FROM buytbl
WHERE userid IS NOT NULL;

SELECT * FROM buytbl
WHERE userid = 'JYP';

SELECT U.userID, U.name, B.prodName, U.addr, CONCAT(U.mobile1, U.mobile2) AS '연락처' 
FROM usertbl U LEFT OUTER JOIN buytbl B
ON U.userID = B.userID
ORDER BY U.userID;

SELECT name, CONCAT(mobile1, mobile2) AS '전화번호' FROM usertbl
WHERE name NOT IN (SELECT name FROM usertbl WHERE mobile1 is null);


SELECT name, CONCAT(mobile1, mobile2) AS '전화번호' FROM usertbl
WHERE name IN (SELECT name FROM usertbl WHERE mobile1 IS NULL);

------------------------

SELECT s.stdname, s.addr, sc.clubname, c.roomno
FROM stdtbl s
INNER JOIN stdclubtbl sc
ON s.stdname = sc.stdname
INNER JOIN clubtbl c
ON sc.clubname = c.clubname
ORDER BY s.stdname;


SELECT c.clubname, c.roomno, s.stdname, s.addr
FROM stdtbl s
INNER JOIN stdclubtbl sc
ON s.stdname = sc.stdname
INNER JOIN clubtbl c
ON sc.clubName = C.clubName
ORDER BY c.clubname;



SELECT a.emp as '부하직원', b.emp as '직속상관', b.emptel as '직속상관연락처'
FROM emptbl a
INNER JOIN emptbl B
on a.manager = b.emp
where a.emp = '우대리';


--------------------
USE employees;

SELECT e.emp_no, e.first_name, e.last_name, t.title 
FROM employees e
INNER JOIN titles t
ON e.emp_no = t.emp_no;

SELECT *, t.title, s.salary
FROM employees e
INNER JOIN titles t
ON e.emp_no = t.emp_no
INNER JOIN salaries s
ON e.emp_no = s.emp_no;

SELECT e.emp_no, e.first_name, e.last_name, d.dept_name, d.dept_no
FROM employees e
INNER JOIN dept_manager m ON e.emp_no = m.emp_no
INNER JOIN departments d ON m.dept_no = d.dept_no
ORDER BY e.emp_no;


SELECT d.dept_no, d.dept_name, COUNT(e.emp_no) AS employee_count
FROM employees e
INNER JOIN dept_manager m ON e.emp_no = m.emp_no
INNER JOIN departments d ON m.dept_no = d.dept_no
GROUP BY d.dept_no, d.dept_name
ORDER BY d.dept_no;

SELECT e.emp_no, e.first_name, e.last_name, d.dept_name, m.from_date, m.to_date
FROM employees e
INNER JOIN dept_manager m ON e.emp_no = m.emp_no
INNER JOIN departments d ON m.dept_no = d.dept_no
WHERE e.emp_no = '10209';



