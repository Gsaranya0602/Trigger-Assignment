
use trigger_table;
CREATE TABLE student (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    student_name VARCHAR(50),
    marks INT
);

CREATE TABLE student_result (
    subject_code INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    student_name VARCHAR(50),
    marks INT,
    result varchar(10),
   log_time TIMESTAMP 
);

DELIMITER $$
CREATE TRIGGER after_student_insert
AFTER INSERT ON student
FOR EACH ROW
BEGIN
INSERT INTO student_result ( student_id, student_name ,marks,  result,log_time )
VALUES(NEW.student_id,NEW.student_name,NEW.marks,'PASS',NOW());
END$$
DELIMITER ;

INSERT INTO student(student_name ,marks) VALUES ( 'Priya', 85),('SARAN',80);

SELECT *FROM student_result;




 Explanation:
An INSERT Trigger is  runs automatically when a new record 
is inserted into a table.
AFTER INSERT → Trigger executes after inserting data.
FOR EACH ROW → Trigger runs for every inserted row.
NEW keyword → Refers to newly inserted values.

 Working:
A record is inserted into student.
Trigger after_student_insert is activated automatically.
The inserted data is copied into student_result.
The result is stored as 'PASS' and current time is recorded using NOW().