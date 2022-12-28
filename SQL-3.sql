--DATE QUERY LANGUEGE DQL (SELECT)  
-- DATE MENIPULATION LANGUEGE DML(DELETE)
CREATE TABLE workers
(
   id SMALLINT,-- not matematik islemleri yapilabilmesi icin SMALLINT tercih edilmeli 
   name VARCHAR(50),
   salary SMALLINT,
    CONSTRAINT  id_pk PRIMARY KEY (id)
);

INSERT INTO workers VALUES ('1001','ALI CIN',12000);
INSERT INTO workers VALUES ('1002','VELI TAN',2000);
INSERT INTO workers VALUES ('1003','AYSE BAN',7000);
INSERT INTO workers VALUES ('1004','ANGIE OCEAN',8500);

--Example 1 :En dusuk ve en buyuk salary degerlerine sahip recordlari cagiriniz
--1. Yol:
SELECT * FROM workers
WHERE salary IN ((SELECT MAX(salary) FROM workers),(SELECT MIN(salary) FROM workers));
--NOT : AND ve OR yerine IN kullanilmasi tavsiye edilir ayni gorevi yapar
--2. Yol:
SELECT * FROM workers
WHERE salary =(SELECT MAX(salary) FROM workers)  OR salary =(SELECT MIN(salary) FROM workers);

--Example 2: En buyuk salary degerini bulunuz
SELECT MAX(salary) AS maximum_salary 
FROM workers
--NOT: 'AS' keywordu kullanilarak konsola gecici(temporary) field(sutun) olusturulabilir

--Example 3: En dusuk salary degerini bulunuz
SELECT MIN(salary) AS minimum_salary 
FROM workers;

--Example 4: Salary ortalamasini bulunuz
SELECT AVG(salary) AS ortalama_salary 
FROM workers;

--Example 5 : Record(satir) sayisini (adetini) bulunuz
SELECT COUNT(name) AS number_of_workers 
FROM workers;


--Exampla 6 : Salary degerlerinin toplamini bulunuz
SELECT SUM(salary) AS sum_salary
FROM workers;

--NOT : COUNT keywordu Record(satir), field(sutun) adetlerini bulmak icin kullanirz
--    : SUM keywordu toplama islemi yapmak icin kullanilir


--***Interviw Question: En yuksek ikinci salary degerini cagiriniz

SELECT MAX(salary) AS secod_highest_salary
FROM workers
WHERE salary < (SELECT MAX(salary) FROM workers );

--***Interviw Question: En dusuk ikinci salary degerini cagiriniz
SELECT MIN(salary) AS secod_lowest_salary
FROM workers
WHERE salary > (SELECT MIN(salary) FROM workers );


--Example 7: En yuksek ucuncu salary degerini cagiriniz
SELECT MAX(salary) AS third_max_salary
FROM workers
WHERE salary < (SELECT MAX(salary)
				FROM workers  
                WHERE salary < (SELECT MAX(salary) FROM workers ));


--Example 8(ODEV) : En dusuk ucuncu salary degerini bulunuz

SELECT MIN(salary) AS third_min_salary
FROM workers
WHERE salary > (SELECT MIN(salary)
				FROM workers  
                WHERE salary < (SELECT MIN(salary) FROM workers ));


-- Example 9 :Salary degeri en yuksek ikinci degere sahip record'i cagiriniz
--1.Yol:
SELECT * FROM workers
WHERE salary = (SELECT MAX(salary) 
                FROM workers
                WHERE salary < (SELECT MAX(salary) FROM workers ));
--2.Yol:
SELECT * FROM workers
ORDER BY salary DESC -- buyukden kucuge siraladi
OFFSET 1 ROW         -- ilk satiri atladi
FETCH NEXT 1 ROW ONLY; -- yeni siradaki ilk satiri aldi

--Example 10(odev) :Salary degeri en dusuk ikinci degere sahip record'i (satir) cagiriniz
SELECT * FROM workers
ORDER BY salary  --kucukden buyuge  siraladi
OFFSET 1 ROW         -- ilk satiri atladi
FETCH NEXT 1 ROW ONLY; -- yeni siradaki ilk satiri aldi

--Example 11 :Salary degeri en yuksek ucuncu degere sahip record'i (satir) cagiriniz
--1. Yol:
SELECT * FROM workers
WHERE salary = (SELECT MAX(salary) 
               FROM workers
               WHERE salary < (SELECT MAX(salary)
			   FROM workers  
                WHERE salary < (SELECT MAX(salary) FROM workers )));
--2. Yol:
SELECT * FROM workers
ORDER BY salary DESC   --azalan sirala
OFFSET 2 ROW           -- 2 satir atla
FETCH NEXT 1 ROW ONLY; -- yeni siradaki ilk satiri aldi

--NOT : ORDER BY -> natural siralama(kucukden buyuge),
--      ORDER BY __ DESC -> AZALAN SIRALAMA (buyukden kucuge dogru)
SELECT * FROM workers;

CREATE TABLE customers_products
(
product_id INT,
customer_name VARCHAR(50),
product_name VARCHAR(50)
);
INSERT INTO customers_products VALUES (10,'Mark','Orange');
INSERT INTO customers_products VALUES (10,'Mark','Orange');
INSERT INTO customers_products VALUES (20,'John','Apple');
INSERT INTO customers_products VALUES (30,'Amy','Palm');
INSERT INTO customers_products VALUES (20,'Mark','Apple');
INSERT INTO customers_products VALUES (10,'Adem','Orange');
INSERT INTO customers_products VALUES (40,'John','Apricot');
INSERT INTO customers_products VALUES (20,'Eddie','Apple');



--1.Soru : customer_name degeri Orange, Apple, ya da Palm olan recordlari (satir) cagiriniz
--1.YOL
SELECT * FROM customers_products
WHERE product_name ='Orange' OR product_name ='Apple' OR product_name = 'Palm' ;
--2. YOL
SELECT * FROM customers_products
WHERE product_name IN('Orange', 'Apple', 'Palm') ;

--2.Soru : customer_name degeri Orange, Apple, ya da Palm olmayan recordlari (satir) cagiriniz
SELECT * FROM customers_products
WHERE product_name NOT IN('Orange', 'Apple', 'Palm') ;

--BETWEEN condition : arasinda 

--3.Soru : product_id' si 30'dan kucuk veya esitVE 20'den buyuk veya esit recotdlari(satir) cagiriniz
--1. YOL
SELECT * FROM customers_products
WHERE product_id <=30 AND product_id >=20;
--2.YOL
SELECT * FROM customers_products
WHERE product_id BETWEEN 20 AND 30; -- 20 ve 30 dahildir

--3.Soru product_id' si 20'den kucuk  30'dan buyuk  recotdlari(satir) cagiriniz
SELECT * FROM customers_products
WHERE product_id NOT BETWEEN 20 AND 25;-- 20 ve 30 dahil degildir.

--EXISTS Condition : EXISTS Condition 'Subquery' ile kullanilir
--                  Eger Subquery herhangi bir data cagirirsa 'Quter Query'(main) calistirilir
--                  Eger Subquery herhangi bir data cagirmazsa 'Quter Query'(main) calistirilmaz
--                  EXISTS Condition select, Insert, Delete komutlarinda kullanilir.


SELECT * FROM customers_products
 

CREATE TABLE customers_likes
(
product_id CHAR(10),
customer_name VARCHAR(50),
liked_product VARCHAR(50)
);
INSERT INTO customers_likes VALUES (10,'Mark','Orange');
INSERT INTO customers_likes VALUES (50,'Mark','Pineapple');
INSERT INTO customers_likes VALUES (60,'John','Avocado');
INSERT INTO customers_likes VALUES (30,'Lary','Cherries');
INSERT INTO customers_likes VALUES (20,'Mark','Apple');
INSERT INTO customers_likes VALUES (10,'Adem','Orange');
INSERT INTO customers_likes VALUES (40,'John','Apricot');
INSERT INTO customers_likes VALUES (20,'Eddie','Apple');

--1. soru customer_name degerleri arasinda Lary varsa customer_name degerlerini 'No name'olarak gucelleyiniz
UPDATE customers_likes
SET customer_name ='No name'
WHERE EXISTS (SELECT liked_product FROM customers_likes WHERE customer_name ='Lary' );

--2.Soru : liked_product degerleri arasinda Orange, Pineapple yada Avacado varsa nema degerlerini "No Name " olarak gencelleyiniz

UPDATE customers_likes
SET customer_name = 'No Name'
WHERE EXISTS  (SELECT liked_product FROM customers_likes WHERE liked_product IN ('Orange', 'Pineapple', 'Avocado'));

--3 . Soru liked_product degerleri arasinda Orange deger varsa recordlari siliniz
DELETE * FROM customers_likes
WHERE EXISTS (SELECT liked_product FROM customers_likes WHERE liked_product ='Orange' );

SELECT * FROM customers_likes;

--SUBQUERY
CREATE tABLE employees
(
	id CHAR (9),
	name VARCHAR(50),
	state VARCHAR(50),
	salary SMALLINT,
	company VARCHAR(20)
);

INSERT INTO employees VALUES (123456789, 'John Walker','Floride',2500 ,'IBM');
INSERT INTO employees VALUES (234567890, 'Brad Pitt','Floride',1500 ,'APPLE');
INSERT INTO employees VALUES (345678901, 'Eddie Murphy','Texes', 3000,'IBM');
INSERT INTO employees VALUES (456789012, 'Eddie Murphy','Virginia',1000 ,'GOOGLE');
INSERT INTO employees VALUES (567890123, 'Eddie Murphy','Tesax',7000 ,'MICROSOFT');
INSERT INTO employees VALUES (567890123, 'Mark Stone','Pennsylvania',2500 ,'IBM');


CREATE TABLE companies
(
    company_id CHAR(9),
	company VARCHAR(20),
	number_of_employees SMALLINT
);
INSERT INTO companies VALUES (100,'IBM',12000);
INSERT INTO companies VALUES (101,'GOOGLE',18000);
INSERT INTO companies VALUES (102,'MICROSOFT',10000);
INSERT INTO companies VALUES (103,'APPLE',21000);

--1.Soru : number_of_employees 15000'den buyuk olan name ve company degerlerini cagirin
SELECT name, company 
FROM employees
WHERE company IN(SELECT company FROM companies WHERE number_of_employees >15000 );

--2.Soru : Floruda'da bulunan company_id ve company degerlerini cagirin
SELECT company_id, company 
FROM companies
WHERE company IN(SELECT company FROM employees WHERE state='Floride');

--3. Soru company_id deger 100'den buyuk olan name ve state degerlerini cagiriniz
SELECT name, state,company 
FROM employees
WHERE company IN (SELECT company FROM companies WHERE company_id>'100' );




SELECT * FROM employees;
SELECT * FROM companies;





--  DK DE KALDIM




