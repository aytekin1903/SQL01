CREATE TABLE employees
(
id CHAR(9),
name VARCHAR(50),
state VARCHAR(50),
salary SMALLINT,
company VARCHAR(50)
);


INSERT INTO employees VALUES (123456789, 'John Walker', 'Florida',2500, 'IBM' );
INSERT INTO employees VALUES (234567890, 'Brad Pitt', 'Florida',1500, 'APPLE' );
INSERT INTO employees VALUES (345678901, 'Eddie Murphy', 'Texas',3000, 'IBM' );
INSERT INTO employees VALUES (456789012, 'Eddie Murphy',  'Viriginia',1000, 'GOOGLE' );
INSERT INTO employees VALUES (567890123, 'Eddie Murphy' , 'Texas',7000, 'MICROSOFT' );
INSERT INTO employees VALUES (567890123, 'Brad Pitt', 'Texas',1500, 'GOOGLE' );
INSERT INTO employees VALUES (456789012, 'Mark Stone', 'Pennsylvania',2500, 'IBM' );

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

--1 Soru : Herbir company icin company , number_of_employees ve ortalama salary degerlerini bulunuz.
SELECT company, number_of_employees, (SELECT AVG (salary) FROM employees
									 WHERE companies.company=employees.company ) AS avg_salary_per_company
FROM companies;

--2.Soru:  Herbir company icin company_id company ,en yuksek ve en dusuk salary degerlerini bulunuz
 SELECT company, company_id, (SELECT MAX(salary) FROM employees WHERE companies.company = employees.company ),
                           (SELECT MIN(salary) FROM employees WHERE companies.company = employees.company)
FROM companies;

--LIKE Condition : Wildcard ile kullanilir
--1 { % } Wildcard: Sifir veya daha fazla karakteri temsil eder
--2 { _ } Wildcard: Tek karakteri temsil eder

--1. Soru:  'E' ile baslayan employees 'name ' degerlerini cagirin

SELECT name FROM employees
WHERE name LIKE 'E%';

--2.Soru:  'e' biten employees 'name ' degerlerini cagirin

SELECT name FROM employees
WHERE name LIKE '%e';

--3.Soru:  'B' ile baslayan 't'ile biten employees 'name ' degerlerini cagirin

SELECT name FROM employees
WHERE name LIKE 'B%t'
;

--4.Soru Herhangi bir yerinde 'a' bulunan 'name' degerlerini cagiriniz

SELECT name FROM employees
WHERE name LIKE '%a%'
;

--5.Soru Herhangi bir yerinde 'e' veya 'r' bulunan employees 'name' degerlerini cagiriniz
SELECT name FROM employees
WHERE name LIKE '%e%r%' OR name LIKE '%r%e%'
;

--2 { _ } Wildcard: Tek karakteri temsil eder

--1. Soru: Ikinci karakteri 'e' ve dorduncu karakteri 'n' olan "state" degerlerini cagiriniz
SELECT state FROM employees
WHERE state LIKE '_e_n%'
;

--2.Soru: Sondan 2. karakteri 'i' olan "state" degerlerini cagiriniz
SELECT state FROM employees
WHERE state LIKE '%i_';

--3.Soru: 2. karakteri 'e'olan ve en az 6 karakteri bulunan "state" degerlerini cagiriniz
SELECT state FROM employees
WHERE state LIKE '_e____%';

--4. Soru 2. karakterinden sonra herhangi bir yerinde 'i' bulunan "state" degerlerini cagiriniz
SELECT state FROM employees
WHERE state LIKE '__%i%';

SELECT * FROM companies;
SELECT * FROM employees;

CREATE TABLE words
(
word_id CHAR (10) UNIQUE,
word VARCHAR(50) NOT NULL,
number_of_letters SMALLINT
);

INSERT INTO words VALUES(1001,'hot',3);
INSERT INTO words VALUES(1002,'hat',3);
INSERT INTO words VALUES(1003,'hit',3);
INSERT INTO words VALUES(1004,'hbt',3);
INSERT INTO words VALUES(1005,'hct',3);
INSERT INTO words VALUES(1006,'adem',4);
INSERT INTO words VALUES(1007,'selena',6);
INSERT INTO words VALUES(1008,'yusuf',5);

--NOT LIKE Condition

--1,Soru: Herhangi bir yerinde 'h' bulunmayan "word" degerlerini cagiriniz
SELECT word FROM words
WHERE word NOT LIKE '%h%';

--2.Soru:'t'veya 'f'ile bitmeyen "word" degerlerini cagiriniz
SELECT word FROM words
WHERE word NOT LIKE '%t' AND word NOT LIKE  '%f' ;

--3. Soru: Herhangi bir karakterle baslayip (2.harfi) 'a' veya 'e' ile devam etmeyen "word" degerlerini cagiriniz
SELECT word FROM words
WHERE word NOT LIKE '_a%' AND word NOT LIKE  '_e%' ;

-- Regular Expression Ondition:


--1.Soru: ilk karakteri 'h', ikinci karakteri 'o','a'veya 'i' son karakteri 't' olan "word" degerlerini cagiriniz
SELECT word FROM words
WHERE word ~ 'h[oai](.*)t';

--2.Soru: ilk karakteri 'h', son karakteri 't've ikinci karakteri 'a' dan 'e' ye  herhangi bir karakteri olan "word" degerlerini cagiriniz
SELECT word FROM words
WHERE word ~ 'h[a-e](.*)t';--[a-e] ==>a,b,c,d,e

--3.Soru: ilk karakteri 's', 'a' veya 'y' olan "word" degerlerini cagiriniz
SELECT word FROM words
WHERE word ~ '^[say](.*)';--(.*)==> ifadesi sifir yada coklu karakterler icin kullanilir

--4.Soru: Son karakteri 'm', 'a' veya 'f' olan "word" degerlerini cagiriniz
SELECT word FROM words
WHERE word ~ '(.*)[maf]$'-- [ ]$==> karakterlerle biter

--5. Soru: ilk karakteri 's' son karakteri 'a' olan "word" degerlerini cagiriniz

SELECT word FROM words
WHERE word ~'^[s](.*)[a]$';

--6.Soru: Herhangi bir yerinde 'a' olan "word" degerlerini cagiriniz
SELECT word FROM words
WHERE word ~ 'a'; 'a'==> %a%

--7.Soru: ilk karakteri 'd' den 't' ye olan, herhangi bir karakter ile devam edep ucuncu karakteri 'l' olan "word" degerlerini cagiriniz
SELECT word FROM words
WHERE word ~ '^[d-t].[l](.*)';

--8.Soru :  ilk karakteri 'd' den 't' ye olan, herhangi bir karakter ile devam edep dorduncu karakteri 'l' olan "word" degerlerini cagiriniz

SELECT word FROM words
WHERE word ~ '^[d-t]..[e](.*)';

SELECT * FROM words;

CREATE TABLE workers
(
id CHAR(9),
name VARCHAR(50),
state VARCHAR(50),
salary SMALLINT,
company VARCHAR(20)
);


INSERT INTO workers VALUES (123456789, 'John Walker', 'Florida',2500, 'IBM' );
INSERT INTO workers VALUES (234567890, 'Brad Pitt', 'Florida',1500, 'APPLE' );
INSERT INTO workers VALUES (345678901, 'Eddie Murphy', 'Texas',3000, 'IBM' );
INSERT INTO workers VALUES (456789012, 'Eddie Murphy',  'Viriginia',1000, 'GOOGLE' );
INSERT INTO workers VALUES (567890123, 'Eddie Murphy' , 'Texas',7000, 'MICROSOFT' );
INSERT INTO workers VALUES (567890123, 'Brad Pitt', 'Texas',1500, 'GOOGLE' );
INSERT INTO workers VALUES (456789012, 'Mark Stone', 'Pennsylvania',2500, 'IBM' );

--1.Soru: 'E' ile baslayip 'y'ile biten "name" disindaki degerileri cagiriniz
--1.Yol NOT LIKE kullanarak
SELECT name FROM workers
WHERE name NOT LIKE 'E%y'

--2.Yol Regular Expression
SELECT name FROM workers
WHERE name ~ '^[^E](.*)[^y]$'--> Koseli parantez icinde ^ isareti kullanilirsa 'den farkli' anlamina gelir

--Odev: 'E' ile baslayip 'y'ile biten "name"  degerileri cagiriniz
--1.Yol NOT LIKE kullanarak
SELECT name FROM workers
WHERE name LIKE 'E%y'

--2.Yol Regular Expression
SELECT name FROM workers
WHERE name ~ '^[E](.*)[y]$'

--2.Soru: 'J','B'yada 'E' ile baslayan VE 'r'yada 't' ile biten "name" degerleini cagiriniz
SELECT name FROM workers
WHERE name ~ '^[JBE](.*)[rt]$';

--3. Soru: Son karekteri 'r' yada 't' olan VEYA ilk karakteri 'J','B'yada 'E' olan "name" degerleini cagiriniz
SELECT name FROM workers
WHERE name ~ '^[JBE]' OR name  ~ ' [rt]$';

--4.Soru: Son karekteri 'r' yada 't' olmayan VE ilk karakteri 'J','B'yada 'E' olmayan "name" degerleini cagiriniz
SELECT name FROM workers
WHERE name ~ '^[^JBE](.*)[^rt]$';

--5.Soru: Son karekteri 'r' yada 't' olmayan VEYA ilk karakteri 'J','B'yada 'E' olmayan "name" degerleini cagiriniz
SELECT name FROM workers
WHERE name ~ '^[^JBE]' OR name  ~ '[^rt]$';

--6.Soru: Herhangi bir yerinde 'a' yada 'k' bulunan "name" degerleini cagiriniz
SELECT name FROM workers 
WHERE name ~ '[ak]';

--7. Soru: ilk harfi 'A'dan 'F' ye bir karakter olan ve ikinci harfi herhangi bir karakter olan ucuncu harfi 'a'  olan "name" degerleini cagiriniz
SELECT name FROM workers
WHERE name ~ '^[A-F].a(.*)';

--Odev Soru: ilk harfi 'A'dan 'F' ye bir karakter olan ve ikinci ve ucuncu harfi herhangi bir karakter olan dorduncu harfi 'i'  olan "name" degerleini cagiriniz
SELECT name FROM workers
WHERE name ~ '^[A-F](.*).[i]';

--8.Soru: Ucuncu karakteri 'o' yada 'x' olan "state" degerlerini cagiriniz
SELECT state FROM workers
WHERE state ~ '..[ox]';

--9..Soru: Ucuncu karakteri 'o' yada 'x' olmayan "state" degerlerini cagiriniz
SELECT state FROM workers
WHERE state ~ '^..[^ox]';

-- Odev: Sondan ucuncu karakteri 'n'yada 'x' olan "state" degerlerini cagiriniz
SELECT state FROM workers
WHERE state ~ '[nx]..$';

-- Odev: Sondan ucuncu karakteri 'n'yada 'x' olmayan "state" degerlerini cagiriniz
SELECT state FROM workers
WHERE state ~ '[^nx]..$';

--ORDER BY : Recordlari artan(ASC) yada azalan(DESC) duzeyde siralamak icin kullanilir
--          ORDER BY sadece SELECT Statement ile kullanilir.

--1.Soru: Recordlari artan duzeyde number_of_letters degerine gore siralayin
SELECT * FROM words
ORDER BY number_of_letters;-- ASC keyword u zorunlu degildir. Cunku artan siralama varsayilan siralama tipidir

--2.Soru: Recordlari azalan duzeyde "word" sutunune gore siralayiniz
SELECT * FROM words
ORDER BY  word DESC;--Azalan siralamalarda DESC keyword u kullanmak zorunludur

--Not :Sutun adi yerine sutun numarasi ile de siralama yapabiliriz

SELECT * FROM words
ORDER BY 3 DESC; --> 3 , number_of_letters yerine gecer.








  



 



SELECT * FROM words

DROP TABLE workers





