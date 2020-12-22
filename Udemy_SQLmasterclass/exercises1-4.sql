CREATE TABLE customer_table(
cust_id int, 
firstname varchar,
last_name varchar,
age int,
email_id varchar);

/* exercise 1
1. Create a Database ‘Classroom’
2. Create a table named ‘Science_class’ with the following properties
3 Cloumns (Enrollment_no INT, Name VARCHAR, Science_Marks INT)
*/

CREATE TABLE Science_class (
enrollment_no int,
name varchar,
science_marks int);

/* exercise 2
1. Insert the following data into Science_class using insert into command
2. Import data from csv file ’Student.csv’ attached in resources to Science_class to insert data of next 8 students
*/

INSERT INTO Science_class VALUES 
(1, 'Popeye', 33), 
(2, 'Olive', 54), 
(3, 'Brutus' , 98);

COPY science_class FROM '/Users/kcondeixa/repositories/SQL/Udemy_SQLmasterclass/Student.csv' delimiter ',' csv header;

-- Solution:
-- insert into science_class values (1,'Popeye',33);
-- insert into science_class values (2,'Olive',54);
-- insert into science_class values (3,'Brutus',98);
-- COPY science_class FROM 'address/student.csv‘ CSV HEADER;

/* exercise 3
1. Retrieve all data from the table ‘Science_Class’
2. Retrieve the name of students who have scored more than 60 marks
3. Retrieve all data of students who have scored more than 35 but less
than 60 marks
4. Retrieve all other students i.e. who have scored less than or equal to
35 or more than or equal to 60
*/

SELECT * FROM science_class;

SELECT name FROM science_class WHERE science_marks > 60;

SELECT * FROM science_class WHERE science_marks > 35 and science_marks < 60;

SELECT * FROM science_class where NOT  science_marks > 35 and science_marks < 60;

select * from science_class;

/* exercise 4
1. Update the marks of Popeye to 45
2. Delete the row containing details of student named ‘Robb’
3. Rename column ‘Name’ to ‘student_name’.
*/

UPDATE science_class
SET science_marks = 45
WHERE name = 'Popeye';

DELETE FROM science_class
WHERE name = 'Robb';

alter table science_class
rename name to student_name;

-- drop database "SuperMart_DB";




