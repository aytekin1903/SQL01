
CREATE TABLE workers
(
worker_id SMALLINT,-- not matematik islemleri yapilabilmesi icin SMALLINT tercih edilmeli 
worker_name VARCHAR(50),
worker_salary SMALLINT,
CONSTRAINT  worker_id_pk PRIMARY KEY (worker_id)
);

INSERT INTO workers VALUES ('101','ALI CIN',12000);
INSERT INTO workers VALUES ('102','VELI TAN',2000);
INSERT INTO workers VALUES ('103','AYSE BAN',7000);
INSERT INTO workers VALUES ('104','ANGIE OCEAN',8500);
 
--Example 1 :VELI TAN'in salary degerini, en yuksek salary degerinin %20 dusugune yukseltin
UPDATE workers
SET worker_salary=(SELECT MAX(worker_salary)*0.8 FROM workers)
WHERE worker_id=102;
 
--Example 2 : Ali Cin'in salary degerini en dusuk salary degerinin %30 fazlasina dusurunuz 
UPDATE workers
SET worker_salary=(SELECT MIN(worker_salary) FROM workers)*1.3
WHERE worker_id=101;
 
 --Example 3 : Ortalama salary degerinden dusuk olan salary degerlerini 1000 artiriniz
 UPDATE workers
 SET worker_salary = worker_salary +1000  --NOT ortalama bulmak icin 'AVG' kodu kullanilir
 WHERE worker_salary <(SELECT AVG(worker_salary)  FROM workers);
 
 --Example 4 : Ortalama salary degerinden dusuk salary degerlerine, ortalama salary degeri atayiniz
 UPDATE workers
 SET worker_salary = (SELECT AVG(worker_salary) FROM workers)
 WHERE worker_salary <(SELECT AVG(worker_salary) FROM workers);
 
 
 --       IS NULL comdition
 
CREATE TABLE people
(
ssn INT,
name VARCHAR(50),
address VARCHAR(80)
);
 
INSERT INTO people VALUES (123456789,'Mark Star','Florida');
INSERT INTO people VALUES (234567890,'Angie Way','Virigina');
INSERT INTO people VALUES (345678901,'Maryy Tien','New Jersey');
INSERT INTO people (ssn, address) VALUES (456789012,'Michigan'); 
INSERT INTO people (ssn, address) VALUES (567890123, 'California');
INSERT INTO people (ssn, name) VALUES  (567890123, 'California');
 
 --Example 1 : null name degerlerini "To be inserted later (daha sonra girilecek)" degerlerine guncelleyniz
 
 UPDATE people
 SET name = 'To be inserted later'
 WHERE  name  IS NULL;
 
--Example 2 :null address degerlerini "To be inserted later (daha sonra girilecek)" degerlerine guncelleyniz
 UPDATE people
 SET address ='To be inserted later'
 WHERE address IS NULL;
 
--**** Bir table RECORT nasil silinir 
DELETE FROM people
WHERE ssn= '234567890';
 
--Example 1 :Isimsiz record'lari siliniz
DELETE FROM people
WHERE name ='To be inserted later';
 
--Example 2 : Tum recortlari siliniz
DELETE FROM people

--NOT : DELETE komutu sadece recortlari siler, table' yi yok etmez

--  Example 3 : name veya address degerleri null olan recirtlari siliniz
DELETE FROM people
WHERE name IS NULL OR address IS NULL;
 
--Example 4 :ssn degeri 123456789'dan buyuk ve 345678901'dan kucuk olan recordlari siliniz
DELETE FROM people
WHERE ssn >123456789 AND ssn <345678901;
 
--Example 5 :name degerleri NULL olmayan tum recordlari siliniz
DELETE FROM people
WHERE name IS NOT NULL;

--NOT :  TRUNCATE commend tum recordlari siler
--       DELETE ile kismen ayni islemi gorur.

-- TRUNCATE ile DELETE arasindaki farklar nedir
--1)DELETE komutunda filtrelemek icin WHERE Clause kullanilabilir ,fakat TRUNCATE komutunda kullanilmaz.
--2)DELETE komutunda sildigimiz recordlari geri cagirabiliriz, fakat TRUNCATE komutunda recordlar geri cagrilamaz (Roll Back)
  
  TRUNCATE TABLE people;
 
--Schema(sema)'dan  table nasil kaldirilir
DROP TABLE people;


SELECT * FROM people;
--DQL: Data Query Languege. Dta okumak icin kullanilan dil (SELECT) komutu ile kullanilir


CREATE TABLE workers
(
   id SMALLINT,-- not matematik islemleri yapilabilmesi icin SMALLINT tercih edilmeli 
   name VARCHAR(50),
   salary SMALLINT,
    CONSTRAINT  id_pk PRIMARY KEY (id)
);

INSERT INTO workers VALUES ('101','ALI CIN',12000);
INSERT INTO workers VALUES ('102','VELI TAN',2000);
INSERT INTO workers VALUES ('103','AYSE BAN',7000);
INSERT INTO workers VALUES ('104','ANGIE OCEAN',8500);

--Tum recordlar nasil cagrilir
SELECT * 
FROM workers;

--Spesifik bir field(sutun)nasil cagrilir
SELECT name
FROM workers;

-- Spesifik coklu bir field(sutun)nasil cagrilir
SELECT name , salary FROM workers;

-- Spesifik bir record (satir) nasil cagrilir
SELECT * FROM workers 
WHERE id=101;

--Spesifik coklu recordlar (satir) nasil cagrilir
SELECT * FROM workers 
WHERE id <103;

--Salary degerleri 2 bin 7bin ya da 12bin olan recordlari cagiralim
--1. yol:
SELECT * FROM workers
WHERE salary = 2000 OR salary=7000 OR salary= 12000;

--2.yol: terkar tekrar 'or' kullanin yerine 'in 'kullanimi
SELECT * FROM workers
WHERE salary IN(2000,7000,12000);

----Spesifik bir hucre(cell) nasil cagrilir
SELECT * FROM workers
WHERE id=102;

--En yukse salary degeri olan record i cagiralim- getirin- bulun
SELECT * FROM workers
WHERE salary =(SELECT MAX(salary) FROM workers );

--En dusuk salary degeri olan name'i getirin
SELECT name  FROM workers
WHERE salary =(SELECT min(salary) FROM workers );











DROP TABLE workers;








 