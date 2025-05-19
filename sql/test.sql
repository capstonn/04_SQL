DROP TABLE IF EXISTS `departments`;

CREATE TABLE `departments` (
	`dept_id`	INT	NOT NULL,
	`undergraduate_id`	INT	NOT NULL,
	`dept_name`	VARCHAR(100)	NULL
);

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
	`category_id`	INT	NOT NULL,
	`category_name`	VARCHAR(100)	NOT NULL,
	`position`	VARCHAR(100)	NOT NULL
);

DROP TABLE IF EXISTS `undergraduates`;

CREATE TABLE `undergraduates` (
	`undergraduate_id`	INT	NOT NULL,
	`undergraduate_name`	VARCHAR(100)	NOT NULL,
	`establish_date`	DATETIME	NULL
);

DROP TABLE IF EXISTS `loan_records`;

CREATE TABLE `loan_records` (
	`loan_id`	INT	NOT NULL,
	`student_id`	INT	NOT NULL,
	`book_id`	INT	NOT NULL,
	`loan_date`	DATETIME	NOT NULL	DEFAULT CURRENT_TIMESTAMP,
	`due_date`	DATETIME	NOT NULL
);

DROP TABLE IF EXISTS `students`;

CREATE TABLE `students` (
	`student_id`	INT	NOT NULL,
	`dept_id`	INT	NOT NULL,
	`student_name`	VARCHAR(100)	NULL,
	`address`	VARCHAR(100)	NULL,
	`phone`	VARCHAR(100)	NULL
);

DROP TABLE IF EXISTS `books`;

CREATE TABLE `books` (
	`book_id`	INT	NOT NULL,
	`category_id`	INT	NOT NULL,
	`title`	VARCHAR(200)	NOT NULL,
	`author`	VARCHAR(50)	NOT NULL,
	`publisher`	VARCHAR(100)	NOT NULL,
	`price`	INT	NOT NULL
);

ALTER TABLE `departments` ADD CONSTRAINT `PK_DEPARTMENTS` PRIMARY KEY (
	`dept_id`
);

ALTER TABLE `categories` ADD CONSTRAINT `PK_CATEGORIES` PRIMARY KEY (
	`category_id`
);

ALTER TABLE `undergraduates` ADD CONSTRAINT `PK_UNDERGRADUATES` PRIMARY KEY (
	`undergraduate_id`
);

ALTER TABLE `loan_records` ADD CONSTRAINT `PK_LOAN_RECORDS` PRIMARY KEY (
	`loan_id`
);

ALTER TABLE `students` ADD CONSTRAINT `PK_STUDENTS` PRIMARY KEY (
	`student_id`
);

ALTER TABLE `books` ADD CONSTRAINT `PK_BOOKS` PRIMARY KEY (
	`book_id`
);

ALTER TABLE `departments` ADD CONSTRAINT `FK_undergraduates_TO_departments_1` FOREIGN KEY (
	`undergraduate_id`
)
REFERENCES `undergraduates` (
	`undergraduate_id`
);

ALTER TABLE `loan_records` ADD CONSTRAINT `FK_students_TO_loan_records_1` FOREIGN KEY (
	`student_id`
)
REFERENCES `students` (
	`student_id`
);

ALTER TABLE `loan_records` ADD CONSTRAINT `FK_books_TO_loan_records_1` FOREIGN KEY (
	`book_id`
)
REFERENCES `books` (
	`book_id`
);

ALTER TABLE `students` ADD CONSTRAINT `FK_departments_TO_students_1` FOREIGN KEY (
	`dept_id`
)
REFERENCES `departments` (
	`dept_id`
);

ALTER TABLE `books` ADD CONSTRAINT `FK_categories_TO_books_1` FOREIGN KEY (
	`category_id`
)
REFERENCES `categories` (
	`category_id`
);

