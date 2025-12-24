/* 1st Database */
CREATE DATABASE school;

USE school;

CREATE TABLE student (
	id INT PRIMARY KEY,
    NAME VARCHAR (50),
    age INT NOT NULL );
    
INSERT INTO student VALUES(1,"Aman",26);
INSERT INTO student VALUES(2,"Shraddha",24);    

SELECT * FROM student;

DROP TABLE student;



/* 2nd Database */

CREATE DATABASE xyz_company;
USE xyz_company;

CREATE TABLE employee(
	id INT PRIMARY KEY,
    name VARCHAR(100),
    salary INT );
    
INSERT INTO employee (id,name,salary)VALUES
(1,"Adam",25000),
(2,"Bob",30000),
(3,"Casey",40000);    

SELECT * FROM employee;





/* ORDER BY , DISTINCT , WHERE , IN , HAVING , GROUP BY , LIMIT , ASC, DESC , WILDCARD */

CREATE DATABASE college;
USE college;

CREATE TABLE student ( 
	rollno INT PRIMARY KEY,
    name VARCHAR(50),
    marks INT NOT NULL,
    grade VARCHAR(1),
    city VARCHAR(20));
    
    
INSERT INTO student VALUES
(101,"Anil",78,"C","Pune"),
(102,"Bhumika",93,"A","Mumbai"),
(103,"Chetan",85,"B","Mumbai"),
(104,"Dhruv",96,"A","Kolkata"),
(105,"Emanuel",12,"F","Delhi"),
(106,"Farah",82,"B","Delhi");


SELECT DISTINCT city FROM student;

SELECT * FROM student WHERE marks > 80 AND city = "Mumbai";

SELECT * FROM student WHERE marks > 80 OR city = "Delhi";

SELECT * FROM student WHERE marks BETWEEN 80 AND 90;

SELECT * FROM student WHERE city IN("Delhi","Mumbai");

SELECT * FROM student WHERE city NOT IN ("Delhi","Mumbai");

SELECT * FROM student WHERE marks > 75 LIMIT 3;

SELECT * FROM student ORDER BY city ASC;

SELECT MAX(marks) FROM student;

SELECT AVG(marks) FROM student;

SELECT COUNT(rollno) FROM student;

SELECT city,COUNT(rollno) FROM student GROUP BY city;

SELECT city,AVG(marks) FROM student GROUP BY city ORDER BY city;

SELECT COUNT(name),city FROM student GROUP BY city HAVING MAX(marks) > 90;

SELECT city FROM student WHERE grade = "A" GROUP BY city HAVING MAX(marks) > 93 ORDER BY city DESC;

SELECT * FROM student WHERE NAME LIKE "D%";

SELECT * FROM student WHERE NAME LIKE "%a";

SELECT * FROM student WHERE NAME LIKE "%an%";

SELECT * FROM student WHERE NAME LIKE "E%l";




-- SET / UPDATE 

SET SQL_SAFE_UPDATES = 0; -- to disable safe mode

UPDATE student SET grade = "O" WHERE grade = "A";

SELECT * FROM student;

UPDATE student SET grade = "B" WHERE marks BETWEEN 80 AND 90;

UPDATE student SET marks = marks+1;

DELETE FROM student WHERE marks < 33;


/* FOREIGN KEY , UPDATE , CASCADE */

CREATE TABLE dept (
  id INT PRIMARY KEY,
  name VARCHAR(50) );
  
  
INSERT INTO  dept VALUES
(101,"English"),
(102,"IT");  
  
  
CREATE TABLE teacher (
	id INT PRIMARY KEY,
    name VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES dept(id) 
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

INSERT INTO teacher VALUES
(101,"Adam",101),
(102,"Eve",102);

SELECT * FROM teacher;

UPDATE dept SET id=103 WHERE id=102;

SELECT * FROM dept;


/* ALTER , ADD COLUMN, RENAME COLUMN , DROP COLUMN , MODIFY , RENAME(CHANGE) , RENAME TABLE , TRUNCATE */

CREATE DATABASE college;
USE college;

CREATE TABLE student ( 
	rollno INT PRIMARY KEY,
    name VARCHAR(50),
    marks INT NOT NULL,
    grade VARCHAR(1),
    city VARCHAR(20));
    
    
INSERT INTO student VALUES
(101,"Anil",78,"C","Pune"),
(102,"Bhumika",93,"A","Mumbai"),
(103,"Chetan",85,"B","Mumbai"),
(104,"Dhruv",96,"A","Kolkata"),
(105,"Emanuel",12,"F","Delhi"),
(106,"Farah",82,"B","Delhi");

SELECT * FROM student;

ALTER TABLE student ADD COLUMN age INT;

ALTER TABLE student DROP COLUMN age;

ALTER TABLE student ADD COLUMN age INT NOT NULL DEFAULT 19;     
  
ALTER TABLE student MODIFY COLUMN age VARCHAR(2);

INSERT INTO student (rollno,name,marks,stu_age) VALUES (107,"Gargi",68,100);

ALTER TABLE student CHANGE  age stu_age INT;

SELECT * FROM student;
  
ALTER TABLE student DROP COLUMN stu_age;  

ALTER TABLE student RENAME TO stud;

TRUNCATE TABLE student; -- drop deletes table while truncate deletes all table data only


/* INNER JOIN, LEFT JOIN , RIGHT JOIN , FULL JOIN */

CREATE DATABASE college2;

USE college2;

 CREATE TABLE student (
  id INT PRIMARY KEY,
  name VARCHAR(50) );

INSERT INTO student (id,name) VALUES
(101,"Adam"),
(102,"Bob"),
(103,"Casey");

CREATE TABLE course ( id INT PRIMARY KEY, course VARCHAR(50));

INSERT INTO course (id,course) VALUES
(102,"English"),
(105,"Math"),
(103,"Science"),
(107,"Computer Science");

SELECT * FROM student;

SELECT * FROM course;

SELECT * FROM student INNER JOIN course ON student.id = course.id; -- INTERSECTION

SELECT * FROM student LEFT JOIN course ON student.id = course.id; 

SELECT * FROM student RIGHT JOIN course ON student.id = course.id;

SELECT * FROM student LEFT JOIN course ON student.id = course.id UNION SELECT * FROM student RIGHT JOIN course ON student.id = course.id; -- FULL JOIN/ UNION

SELECT * FROM student LEFT JOIN course ON student.id=course.id WHERE course.id IS NULL; -- left exclusive join

SELECT * FROM student RIGHT JOIN course ON student.id=course.id WHERE student.id IS NULL; -- right exclusive join

SELECT * FROM student JOIN course ON student.id = course.id; -- union - intersection


/* SQL SUBQUERIES */

USE college;

SELECT * FROM student;

SELECT AVG(marks) FROM student;

SELECT name,marks FROM student WHERE marks > (SELECT AVG(marks) FROM student);

SELECT name,rollno FROM student WHERE rollno IN ( SELECT rollno FROM student WHERE rollno % 2 = 0);






    