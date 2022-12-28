CREATE TABLE points
(
name VARCHAR(50),
point SMALLINT
);

INSERT INTO points VALUES('Ali',25);
INSERT INTO points VALUES('Veli',37);
INSERT INTO points VALUES('Kemal',43);
INSERT INTO points VALUES('Ali',36);
INSERT INTO points VALUES('Ali',25);
INSERT INTO points VALUES('Veli',29);
INSERT INTO points VALUES('Ali',45);
INSERT INTO points VALUES('Ali',125);

--1. Soru: Recordlari azalan duzeyde "name" sutununa gore ve artan duzezde "point" sutununa gore siralayiniz
SELECT * FROM points
ORDER BY name DESC, poit;

DROP TABLE points
SELECT *FROM points;
----------------------------------------------------

CREATE TABLE employees
(
employee_id CHAR(9),
employee_first_name VARCHAR (20),
employee_last_name VARCHAR(20)
);

INSERT INTO employees VALUES (14,'Chris','Tea');
INSERT INTO employees VALUES (11,'John','Walker');
INSERT INTO employees VALUES (12,'Amy','Star');
INSERT INTO employees VALUES (13,'Brad','Pitt');
INSERT INTO employees VALUES (15,'Chris','Way');

CREATE TABLE addresses
(
employee_id CHAR(9),
street VARCHAR(20),
city VARCHAR(20),
state CHAR(2),
zipcode CHAR(5)
);


INSERT INTO addresses VALUES (11, '32nd Star 1234', 'Miami', 'FL', '33018');
INSERT INTO addresses VALUES (12,'23rd Rain 567','Jacksonville', 'FL', '32256');
INSERT INTO addresses VALUES (13,'5th Snow 765','Hialeah', 'VA', '20121');
INSERT INTO addresses VALUES (14,'3rd Man 12','Weston', 'MI', '12345');
INSERT INTO addresses VALUES (15,'11th Chris 12','St Johns', 'FL', '32259');


----ALIASES

--Table isimleri icin alias nasil kullanilir

--1.Soru: employee_first_name ve state degerlerini cagiriniz, employee_first_name sutunu icin "firstname" state sutunu icin "employee state" isimlerini kullaniniz
SELECT e.employee_first_name AS firstname ,  a.state AS "employee state"
FROM employees e, addresses a
WHERE e.employee_id=a.employee_id;

--Tek bir sutuna coklu sutun nasil konulur va alias nasil kullanilir
--2.Soru: employee_id degerlerini "id" adiyla employee_first_name ve employee_last_name degerlerini tek sutunda "full_ name "adinda cagiriniz
SELECT employee_id AS id, employee_first_name ||' '|| employee_last_name AS full_name 
FROM  employees
;
-- || sutun birlestirma islemi ile yapilir
SELECT * FROM addresses;
---GROUP BY

CREATE TABLE workers
(
id CHAR(9),
name VARCHAR(50),
state VARCHAR(50),
salary SMALLINT,
company VARCHAR(50)
);


INSERT INTO workers VALUES (123456789, 'John Walker', 'Florida',2500, 'IBM' );
INSERT INTO workers VALUES (234567890, 'Brad Pitt', 'Florida',1500, 'APPLE' );
INSERT INTO workers VALUES (345678901, 'Eddie Murphy', 'Texas',3000, 'IBM' );
INSERT INTO workers VALUES (456789012, 'Eddie Murphy',  'Viriginia',1000, 'GOOGLE' );
INSERT INTO workers VALUES (567890123, 'Eddie Murphy' , 'Texas',7000, 'MICROSOFT' );
INSERT INTO workers VALUES (567890123, 'Brad Pitt', 'Texas',1500, 'GOOGLE' );
INSERT INTO workers VALUES (456789012, 'Mark Stone', 'Pennsylvania',2500, 'IBM' );

--1.Soru: Her bir name icin toplam salary degerlerini bulunuz
SELECT name, SUM(salary) AS total_salary
FROM workers 
GROUP BY name
ORDER BY total_salary DESC;

--2.Soru: Her bir state degeri icin calisan sayisini bulup azalan duzeyde siralayiniz
SELECT state, COUNT(state) AS num_of_employee
FROM workers
GROUP BY state
ORDER BY num_of_employee DESC;

--3.Soru:Her bir campany icin 2000$ uzeri maas alan calisan sayisini bulunuz
SELECT company, COUNT(company) AS "num of workers" FROM workers
WHERE salary > 2000
GROUP BY company;

--4.Soru: Her bir company icin en dusuk ve en yuksek salary degerlerini bulunuz
SELECT company, MAX(salary) AS "Max Salary", MIN(salary) AS "Min Salary" FROM workers
GROUP BY company;

--HAVING Clause
--1. HAVING, GROUP BY ardindan filtrelemek icin kullanilir.
--2. HAVING ardindan aggregare function kullanilmaz, sutun adi(sield name) kullanamayiz

-- 1.Soru: Toplam salary degeri 2500 uzeri olan her bir calisan icin salary toplamini bulunuz
SELECT name , SUM(salary) AS "Tatal Salary"
FROM workers
GROUP BY name
HAVING SUM(salary) >2500;
--NOT: GOUP BY in ardindan WHERE kullanilmaz, HAVING Clause kullani

SELECT name , SUM(salary) AS "Tatal Salary"
FROM workers
WHERE SUM(salary) >2500 
GROUP BY name;

--NOT:  WHERE ardindan "aggregate funtion" (SUM(), MAX(), MIN(), COUNT(), AVG()) kullanilamaz

-- 2.Soru: Birden fazla calisani olan, her bir state icin calisan toplamlarini bulunuz
SELECT state , COUNT(state) AS total_workers FROM workers
GROUP BY state
HAVING COUNT(state)>1;

--3.Soru: Her bir company icin degeri 2 bin den fazla olan minimum salary degerlerini bulunuz
SELECT company, MIN(salary)  FROM workers
GROUP BY company
HAVING MIN(salary) >2000;

--4. Soru: Her bir state icin degeri 3000 den az olan maximum salary degerlerini bulunuz
SELECT state, MAX(salary) AS max_salary FROM workers
GROUP BY state
HAVING MAX(salary)<3000;

---UNION Operator: 1- Iki sorgu(query) sonucunu birlestirmek icin kullanilir.

--1.soru: 

--1.37 dk de kaldim


SELECT * FROM workers;
DROP TABLE workers;






