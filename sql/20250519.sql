-- DB 제거
DROP DATABASE tabledb;

-- DB 생성
CREATE DATABASE tabledb;


USE tabledb;

-- 테이블이 존재하면 삭제
DROP TABLE IF EXISTS usertbl;

CREATE TABLE usertbl(
    userID      CHAR(8) NOT NULL PRIMARY KEY,
    name        VARCHAR(10) NOT NULL,
    birthYear   INT NOT NULL,
    addr        CHAR(2) NOT NULL,
    mobile1     CHAR(3) NULL,
    mobile2     CHAR(8) NULL,
    height      SMALLINT NULL,
    mDate       DATE NULL
);


-- 회원 테이블 샘플 데이터
INSERT INTO usertbl VALUES('LSG', '이승기', 1987, '서울', '011', '1111111', 182, '2008-8-8');
INSERT INTO usertbl VALUES('KBS', '김범수', 1979, '경남', '011', '2222222', 173, '2012-4-4');
INSERT INTO usertbl VALUES('KKH', '김경호', 1971, '전남', '019', '3333333', 177, '2007-7-7');




-- 테이블이 존재하면 삭제
DROP TABLE IF EXISTS buytbl;

CREATE TABLE buytbl(
   num         INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
   userid      CHAR(8) NOT NULL,
   prodName    CHAR(6) NOT NULL,
   groupName   CHAR(4) NULL,
   price       INT NOT NULL,
   amount      SMALLINT NOT NULL,
   FOREIGN KEY(userid) REFERENCES usertbl(userID)
);

-- 구매 테이블 샘플 데이터
INSERT INTO buytbl VALUES(NULL, 'KBS', '운동화', NULL, 30, 2);
INSERT INTO buytbl VALUES(NULL, 'KBS', '노트북', '전자', 1000, 1);

-- 오류 발생 : userid 컬럼이 참조하는 usertbl테이블의 userID 컬럼에 'JYP'가 없음
INSERT INTO buytbl VALUES(NULL, 'JYP', '모니터', '전자', 200, 1);






DROP TABLE IF EXISTS prodTbl;

-- prodTbl 테이블 생성 + prodCode, prodID 복합PK 설정
CREATE TABLE prodTbl (
   prodCode  CHAR(3) NOT NULL,
   prodID    CHAR(4) NOT NULL,
   prodDate  DATETIME NOT NULL,
   prodCur   CHAR(10) NULL,
   CONSTRAINT PK_prodTbl_proCode_prodID 
       PRIMARY KEY (prodCode, prodID)
);




use sqldb;

CREATE View v_userbuytbl
AS
SELECT U.userid, U.name, B.prodName, U.addr, CONCAT(U.mobile1, U.mobile2) AS '연락처'
FROM usertbl U
	INNER JOIN buytbl B
		ON U.userid = B.userid;
        
SELECT * FROM v_userbuytbl WHERE name = '김범수';

-- 심화 문제 -- 

DROP TABLE IF EXISTS usertbl;

-- usertbl 테이블 생성 + userID 컬럼 PK 지정
CREATE TABLE usertbl (
    userID CHAR(8) NOT NULL,
    name VARCHAR(10) NOT NULL,
    birthYear INT NOT NULL,
    CONSTRAINT PRIMARY KEY PK_userTBL_userID(userID)
);

DROP TABLE IF EXISTS buytbl;

CREATE TABLE buytbl (
	num INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    userID CHAR(8) NOT NULL,
    prodName CHAR(6) NOT NULL,
    FOREIGN KEY(userID) REFERENCES userTBL(userID)
);


USE tableDB;

DROP TABLE IF EXISTS buyTBL, userTBL;

CREATE TABLE userTBL (
userID CHAR(8) NOT NULL PRIMARY KEY,
name VARCHAR(10) NOT NULL,
birthYear INT NOT NULL,
email CHAR(30) NULL UNIQUE
);

DROP TABLE IF EXISTS userTBL;

CREATE TABLE userTBL(
userID CHAR(8) PRIMARY KEY,
name VARCHAR(10),
birthYear INT CHECK (birthYear >= 1900 AND birthyear <= 2023),
mobile1 CHAR(3) NULL,
CONSTRAINT CK_name CHECK ( name IS NOT NULL)
);



DROP TABLE IF EXISTS userTBL;

CREATE TABLE userTBL(
userID CHAR(8) NOT NULL PRIMARY KEY,
name VARCHAR(10) NOT NULL,
birthyear INT NOT NULL DEFAULT -1,
addr CHAR(2) NOT NULL DEFAULT '서울',
mobile1 CHAR(3) NULL,
mobi1e2 CHAR(8) NULL,
height SMALLINT NULL DEFAULT 170,
mDate DATE NULL
);


ALTER TABLE usertbl
DROP column mobile1;

ALTER TABLE usertbl
CHANGE COLUMN name uName VARCHAR(20) NULL;

ALTER TABLE usertbl
DROP PRIMARY KEY;

-- 뷰

USE employees;

CREATE TABLE table_c (SELECT * FROM employees.salaries);
ALTER TABLE table_c TABLESPACE ts_c;

CREATE VIEW EMPLOYEES_INFO AS
SELECT
    e.emp_no,
    e.birth_date,
    e.first_name,
    e.last_name,
    e.gender,
    e.hire_date,
    t.title,
    t.from_date AS t_from,
    t.to_date AS t_to,
    s.salary,
    s.from_date AS s_from,
    s.to_date AS s_to
FROM
    employees e
JOIN
    titles t ON e.emp_no = t.emp_no
JOIN
    salaries s ON e.emp_no = s.emp_no;
    
    
    
SELECT *
FROM EMPLOYEES_INFO
WHERE t_to = '9999-01-01'
  AND s_to = '9999-01-01';
  
  
CREATE VIEW EMP_DEPT_INFO AS
SELECT
    de.emp_no,
    de.dept_no,
    d.dept_name,
    de.from_date,
    de.to_date
FROM
    dept_emp de
JOIN
    departments d ON de.dept_no = d.dept_no
WHERE
    de.to_date = '9999-01-01';
    


SELECT * 
FROM EMP_DEPT_INFO 
	
	


    
    






    

