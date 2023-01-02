--JOINS  1) INNER JOIN: Ortak (common) data verir.
--       2) RIGHT JOIN: Ikinci tablenin tum datasini verir
--       3) LEFT JOIN : BIrinci tablenin tum datasini verir
--       4) FULL JOIN : Iki tablenin de tum datasini verir
--       5)SELF JOIN : Tek table uzerinde calisirken iki table varmis gibi calisilir.
  CREATE TABLE companies
(
    company_id CHAR(9),
	company_name VARCHAR(20)	
);
INSERT INTO companies VALUES (100,'IBM');
INSERT INTO companies VALUES (101,'GOOGLE');
INSERT INTO companies VALUES (102,'MICROSOFT');
INSERT INTO companies VALUES (103,'APPLE');

CREATE TABLE orders
(
company_id CHAR(3),
order_id  CHAR(3),
order_data DATE
);

INSERT INTO orders VALUES(101,11,'17-Apr-2020');
INSERT INTO orders VALUES(102,22,'18-Apr-2020');
INSERT INTO orders VALUES(103,33,'19-Apr-2020');
INSERT INTO orders VALUES(104,44,'20-Apr-2020');
INSERT INTO orders VALUES(105,55,'21-Apr-2020');



--INNER JOIN:
--1.Soru : Ortak companyler icin company_name, order_id ve order_data degerlerini cagiriniz

SELECT company_name, order_id, order_data 
FROM orders o INNER JOIN companies c
ON  c.company_id = o.company_id;

--LEFT JOIN :
--2.Soru : companies table'sindeki compayler icin order_id ve order_data degerlerini cagiriniz

SELECT c.company_name, o.order_id, o.order_data 
FROM companies c  LEFT JOIN orders o
ON c.company_id = o.company_id;

--RIGHT JOIN
--3.Soru : orders table'sindeki companyler icin company_name, company_id ve order_date degerlerini cagiriniz
--1.Yol: RIGHT JOIN
SELECT c.company_name, o.order_id, o.order_data 
FROM companies c  RIGHT JOIN orders o
ON c.company_id = o.company_id;

-- 2.Yol:LEFT JOIN : genellikle bu yonten kullanilir
SELECT c.company_name, o.order_id, o.order_data 
FROM orders o   RIGHT JOIN companies c
ON c.company_id = o.company_id;

--FULL JOIN :
--4.Soru: Iki table'den de company_name, order_id ve order_data degerlerini cagiriniz
SELECT c.company_name, o.order_id, o.order_data 
FROM orders o  FULL JOIN companies c
ON c.company_id = o.company_id;

SELECT * FROM orders;

SELECT * FROM companies;

--SELF JOIN

CREATE TABLE workers
(
id CHAR(2),
name VARCHAR (20),
title VARCHAR (60),
manager_id CHAR(2)
);

INSERT INTO workers VALUES(1,'Ali Can', 'SDET',2);
INSERT INTO workers VALUES(2,'John Walker', 'QA',3);
INSERT INTO workers VALUES(3,'Angie Star', 'QA Lead',4);
INSERT INTO workers VALUES(4,'Amy Sky', 'CEO',5);

--      SELF JOIN : Tek table uzerinde calisirken iki table varmis gibi calisilir.


--5.Soru: workers table'sunu kullanarak calisanlarin yoneticilerini gosteren bir tablo hazirlayiniz
SELECT employee.name, manager.name 
FROM workers employee INNER JOIN workers manager -- ortan liste olusturuldu
ON employee.manager_id=manager.id; -- ortak degerler cagrildi



--  ALTER TABLE

--1) Field(sutun ) Ekleme:
ALTER TABLE workers
ADD company_industry VARCHAR(20);

--2) Default (varsayilan) degerle ile field(sutun) ekleme
ALTER TABLE workers
ADD worker_address VARCHAR(80) DEFAULT 'Miami,FL , USA';

--3) Coklu field ekleme:
ALTER TABLE workers
ADD COLUMN number_of_workers CHAR(5) DEFAULT 0,
ADD COLUMN name_of_ceo VARCHAR(20);

--4) Field nasil kaldirilir(silinir)
ALTER TABLE workers
DROP COLUMN name_of_ceo;

--5) Field yeniden nasil adlandirilir
ALTER TABLE workers
RENAME COLUMN company_industry TO company_proffession;

--6) Table yeniden nasil adlandirilir
ALTER TABLE workers
RENAME TO employees;

--7) Field nasil modifiye edilir:(constrint ekleme, data tipi degirstirme, data kapasite degistirme)

--Not: constrint eklerken mevcut data durumuna dikkat edmeliyiz

--a) constrint ekleme: 
--1.Soru: number_of_workers field(sutun)una 'NOT NULL' constraint ekleyiniz
 ALTER TABLE employees
 ALTER COLUMN number_of_workers SET NOT NULL;
 
 --2.Soru: company_proffession field(sutun)una 'UNIQUE' CONSTRAINT ekleyiniz
 ALTER TABLE employees
 ADD CONSTRAINT company_proffession_unique UNIQUE (company_proffession);
 
 --3.Soru: worker_address field(sutun)una 'UNIQUE' CONSTRAINT ekleyiniz
 ALTER TABLE employees
 ADD CONSTRAINT worker_address_unique UNIQUE (worker_address);--Mevcut veri tekrarli oldugundan 'UNIQUE' CONSTRAINT atanamaz
 
-- b) Data Tipi/Boyutunu Degirstirme :
--1.Soru: company_proffession field(sutun)unun data tipini CHAR(5) yapiniz
 ALTER TABLE employees
 ALTER COLUMN company_proffession TYPE CHAR(5);
 
 --2.Soru: worker_address field(sutun)unun data tipini CHAR(5) yapiniz
 ALTER TABLE employees
 ALTER COLUMN worker_address TYPE CHAR(5);-- Sutunun data boyutu kucultulememektedir, bazi datalar verilmek istenen boyuttan yuksekdir.
 
 --3.Soru: worker_address field(sutun)unun data tipini CHAR(30) yapiniz
ALTER TABLE employees
ALTER COLUMN worker_address TYPE CHAR(30); 

SELECT * FROM employees;

--FUNCTION(fonksiyon) nasil yazilir.

--Bazi gorevleri daha hizli yapabilmek icin function olusturulur.(Ortalama alma vs.)
--CRUD operation icin function olusturlabilir.

--SQL 'de her function, return type olarak bir data verir.
--Return type olarak data vermeyen islemlere ' Procedure' denir

CREATE FUNCTION addf(x NUMERIC, y NUMERIC)
RETURNS NUMERIC
LANGUAGE plpgsql
AS
$$
BEGIN
RETURN x+y;
END
$$

-- 'OR REPLACE' eger ayni fonksiyondan mevcut ise ustune yenisini olusturur.
CREATE OR REPLACE FUNCTION addf(x NUMERIC, y NUMERIC)
RETURNS NUMERIC
LANGUAGE plpgsql
AS
$$
BEGIN
RETURN x+y;
END
$$

SELECT * FROM addf(-3,3) AS "Addition"; -- fonksiyonda islem yapildi

--1.Soru: Koninin hacmini hesaplayan function yaziniz
CREATE OR REPLACE FUNCTION velue_of_cone(r NUMERIC, h NUMERIC)
RETURNS NUMERIC
LANGUAGE plpgsql
AS
$$
BEGIN
RETURN 3.14*r*r*h*1/3;
END
$$

SELECT * FROM velue_of_cone(3,6) AS "alan"; -- fonksiyonda islem yapildi



















 













