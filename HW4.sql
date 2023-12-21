CREATE DATABASE LearningJoins;

USE LearningJoins;

CREATE TABLE Workers
(
	id int auto_increment,
    name varchar(20),
    telephone varchar(15),
    primary key(id)
	
);

CREATE TABLE salary
(
	id int auto_increment,
    salaryId int,
    post varchar(20),
    amount int,
    primary key(id),
    FOREIGN KEY (salaryId) REFERENCES Workers(id)
	
);

CREATE TABLE personalInfo
(
	id int auto_increment,
    personalId int,
    married bool,
    birthDate date,
    city varchar(20),
    primary key(id),
    FOREIGN KEY (personalId) REFERENCES Workers(id)
	
);


INSERT Workers(name, telephone)
VALUES
('Jack Willson', '+1123456789'),
('Andrew Lock', '+1312456789'),
('Harry Harryson', '+1412356789'),
('Adam Black', '+1213456789');

INSERT salary(salaryId, post, amount)
VALUES
(1, 'worker', 5000),
(2, 'worker', 5000),
(3, 'manager', 7000),
(4, 'director', 10000);

drop table personalInfo;

INSERT personalInfo(personalId, married, birthDate, city)
VALUES
(1, 1, '1986-07-25', 'Detroit'),
(2, 1, '1995-12-14', 'Miami'),
(3, 1, '1989-06-08', 'Las-Vegas'),
(4, 0, '1981-01-01', 'San-Diego');

SELECT Workers.name,
 Workers.telephone,
 personalInfo.city
 FROM Workers
 INNER JOIN personalInfo ON Workers.id = personalInfo.personalId;
 
 
 SELECT Workers.name,
 Workers.telephone,
 personalInfo.city
 FROM Workers
 INNER JOIN personalInfo ON Workers.id = personalInfo.personalId
 WHERE NOT personalInfo.married;
 
 SELECT Workers.name,
 Workers.telephone,
 personalInfo.birthDate
 FROM Workers
 INNER JOIN personalInfo ON Workers.id = personalInfo.personalId;
 
SELECT t1.OrderID, 
SUM(t1.TotalPrice),
t2.CustomerNo,
t2.EmployeeID, 
t3.LName AS Seller,
t4.LName AS Buyer
FROM OrderDetails t1
JOIN Orders t2 ON t1.OrderID = t2.OrderID
JOIN Employees t3 ON t2.EmployeeID = t3.EmployeeID
JOIN Customers t4 ON t2.CustomerNo = t4.CustomerNo
WHERE t1.TotalPrice >500
Group By t1.OrderID;    
 
 /*
 https://www.w3schools.com/sql/sql_join.asp joins
 https://www.w3schools.com/sql/sql_join_inner.asp - inner join
 https://www.w3schools.com/sql/sql_join_left.asp - left join
 https://www.w3schools.com/sql/sql_join_right.asp - right join
 https://www.w3schools.com/mysql/mysql_join_cross.asp - cross join
 https://www.w3schools.com/sql/sql_join_full.asp - full join
 https://www.w3schools.com/sql/sql_union.asp - union
 */
