CREATE DATABASE Library_db;
USE Library_db;
SET SQL_SAFE_UPDATES=0;

CREATE TABLE Members (
member_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100) NOT NULL,
email VARCHAR(100) UNIQUE,
phone VARCHAR(100),
address VARCHAR(200)
);

CREATE TABLE Books (
book_id INT AUTO_INCREMENT PRIMARY KEY,
title VARCHAR(100) NOT NULL,
author VARCHAR(100),
publisher_date DATE,
genre VARCHAR(100),
total_copies INT DEFAULT 1
);

CREATE TABLE Records (
record_id INT AUTO_INCREMENT PRIMARY KEY,
member_id INT,
book_id INT,
borrow_date DATE,
return_date DATE,
FOREIGN KEY (member_id) REFERENCES Members (member_id),
FOREIGN KEY (book_id) REFERENCES Books (book_id)
);

CREATE TABLE Staffs (
staff_id INT AUTO_INCREMENT PRIMARY KEY,
staff_name VARCHAR(100),
staff_position VARCHAR(100)
);

SHOW TABLES;

INSERT INTO Members VALUES (1, "Attu", "atluridhanu129@gmail.com", 8499909845, "Chrompet"),
(2, "Bhuvi", "bhuvanapriya@gmail.com", 9003492706, "Chengalpattu"),
(3, "Fadhil", "fadhilahmed@gmail.com", 9133358895, "Guduvancherry"),
(4, "Meena", "gokulameena@gmail.com", 9662258936, "Kelambakkam"), 
(5, "Peru", "arshadpervez@gmail.com", 9953461888, "Red Hills"),
(6, "Asif", "asifmohammed@gmail.com", 916588532, "Ambattur"),
(7, "Jubair", "mohamedjubair@gmail.com", 8500732943, "Velachery"),
(8, "Arun", "srarun@gmail.com", 9003457324, "Tambaram");

INSERT INTO Books VALUES (1, "Can We Be Strangers Again", "Aisha Saeed", "2025-08-21", "Healing", 14),
(2, "Maybe You Should Talk To Someone", "Lori Gottlieb", "2024-04-02", "Psychology", 8), 
(3, "Before We Were Strangers", "Renee Carlino", "2024-011-18", "Lost Love", 20),
(4, "The Art of Not Overthinking", "Anne Bogel", "2025-03-15", "Self-Help", 3),
(5, "It Ends With Us", "Coollen Hoover", "2025-08-02", "Emotional Healing", 23),
(6, "Things We Never Get Over", "Lucy Score", "2025-01-13", "Romance", 11);

INSERT INTO Records VALUES (1, 1, 4, "2025-03-20", NULL),
(2, 3, 1, "2025-09-15", "2025-09-30"),
(3, 6, 5, "2025-10-02", "2025-10-28"),
(4, 5, 2, "2025-07-21", NULL),
(5, 2, 3, "2025-01-10", "2025-02-10"),
(6, 7, 6, "2025-03-05", "2025-03-15"); 

INSERT INTO Staffs VALUES (1, "Blessey", "Librarian"),
(2, "Rahul", "Archivist"), 
(3, "Neeraj", "Secretary"),
(4, "Keerthy", "Attendant"),
(5, "Afrin", "Cataloger"),
(6, "Suman", "Attendant"); 

UPDATE Members SET phone=9165885532 WHERE member_id=6;
UPDATE Members SET address="Perungudi" WHERE name="Arun";
UPDATE Books SET total_copies=26 WHERE book_id=4;
UPDATE Books SET genre="Mental Health" WHERE title="It Ends With Us";
UPDATE Records SET borrow_date="2025-07-02" WHERE record_id=1;
UPDATE Records SET return_date="2025-10-31" WHERE record_id=3;
UPDATE Staffs SET staff_position="Attendant" WHERE staff_id=1;

DELETE FROM Members WHERE member_id=8;
DELETE FROM Books WHERE book_id=6;
DELETE FROM Records WHERE record_id=6;
DELETE FROM Staffs WHERE staff_name="Suman";

SELECT * FROM Members;
SELECT title, author, genre FROM Books;
SELECT * FROM Records;
SELECT staff_name, staff_position FROM Staffs;

# Select with WHERE
SELECT * FROM Members WHERE address="Chrompet";
SELECT * FROM Books WHERE total_copies>20;
SELECT * FROM Records WHERE return_date IS NULL;  

# Select with AND/OR
SELECT * FROM Members WHERE name="Fadhil" AND phone="9133358895";
SELECT * FROM Books WHERE author="Aisha Saeed" OR genre="Mental Health";
SELECT * FROM Records WHERE borrow_date="2025-10-02" AND return_date="2025-10-31";
SELECT * FROM Staffs WHERE staff_name="Keerthy" OR staff_position="Cataloger";

# Select with LIKE
SELECT * FROM Members WHERE name LIKE "a%";
SELECT * FROM Books WHERE title LIKE "%Strangers%";
SELECT * FROM Staffs WHERE staff_name LIKE "%n%";

# Select with BETWEEN
SELECT * FROM Books WHERE publisher_date BETWEEN "2024-01-01" AND "2025-01-01";
SELECT * FROM Records WHERE borrow_date BETWEEN "2025-01-01" AND "2025-06-01";
SELECT * FROM Records WHERE return_date BETWEEN "2025-06-01" AND "2025-12-31";

# Select with ORDER BY
SELECT * FROM Members ORDER BY name ASC;
SELECT * FROM Books ORDER BY genre DESC;
SELECT * FROM Records ORDER BY borrow_date ASC;
SELECT * FROM Staffs ORDER BY staff_position DESC;

# Select with LIMIT
SELECT * FROM Members LIMIT 4;
SELECT * FROM Books ORDER BY total_copies DESC LIMIT 3;
SELECT * FROM Records ORDER BY borrow_date ASC LIMIT 3;
SELECT * FROM Staffs LIMIT 2;
