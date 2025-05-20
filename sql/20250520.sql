USE sqldb;

CREATE TABLE tbl1 (
	a INT PRIMARY KEY,
    b INT,
    c INT
);

SHOW INDEX FROM tbl1;

CREATE TABLE tbl2 (
	a INT PRIMARY KEY,
    b INT UNIQUE,
    c INT UNIQUE,
    d INT
);

SHOW INDEX FROM tbl2;


CREATE TABLE tbl3 (
a INT UNIQUE,
b INT UNIQUE,
c INT UNIQUE,
d INT
);

SHOW INDEX FROM tbl3;


CREATE TABLE tbl4 (
a INT UNIQUE NOT NULL,
b INT UNIQUE,
c INT UNIQUE,
d INT
);


CREATE TABLE tbl5 (
a INT UNIQUE NOT NULL,
b INT UNIQUE,
c INT UNIQUE,
d INT PRIMARY KEY
);

SHOW INDEX FROM tbl5;


CREATE DATABASE IF NOT EXISTS testdb;

USE testdb;

DROP TABLE IF EXISTS usertbl;

CREATE TABLE usertbl(
userID CHAR(8) NOT NULL PRIMARY KEY,
name VARCHAR(10) NOT NULL,
birthYear INT NOT NULL,
addr NCHAR(2) NOT NULL
);

INSERT INTO usertbl VALUES('LSG', '이승기', 1987, '서울');
INSERT INTO usertbl VALUES('KBS', '김범수', 1979, '경남');
INSERT INTO usertbl VALUES('KKH', '김경호', 1971, '전남');
INSERT INTO usertbl VALUES('JYP', '조용필', 1950, '경기');
INSERT INTO usertbl VALUES('SSK', '성시경', 1979, '서울');

SELECT * FROM usertbl;

ALTER TABLE usertbl DROP PRIMARY KEY;

ALTER TABLE usertbl
ADD CONSTRAINT pk_name PRIMARY KEY(name);

SELECT * FROM usertbl;

USE sqldb;

SHOW INDEX FROM usertbl;

SHOW TABLE STATUS LIKE 'usertbl';

CREATE INDEX idx_usertbl_addr
ON usertbl(addr);

show index from usertbl;

SHOW TABLE STATUS LIKE 'usertbl';

ANALYZE tABLE usertbl;
SHOW table status like 'usertbl';



create unique index idx_usertbl_name
on usertbl(name);

show index from usertbl;

drop index idx_usertbl_name on usertbl;

create unique index idx_usertbl_name_birthyear
on usertbl(name,birthYear);

show index from usertbl;

show index from usertbl;

drop index idx_usertbl_addr on usertbl;
drop index idx_usertbl_name_birthyear on usertbl;




