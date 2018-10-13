--Q1--
CREATE OR REPLACE PROCEDURE Question1 (firstname
IN VARCHAR2, surname IN VARCHAR2)
IS
BEGIN
DBMS_OUTPUT.PUT_LINE(LOWER(firstname) || ' ' || LOWER(surname));
DBMS_OUTPUT.PUT_LINE(UPPER(firstname) || ' ' || UPPER(surname));
DBMS_OUTPUT.PUT_LINE(INITCAP(firstname) || ' ' || INITCAP(surname));
END Question1;
/

set serveroutput on

BEGIN
Question1('Marc','Laffan');
END;
/

/* output
SQL> CREATE OR REPLACE PROCEDURE Question1 (firstname
  2  IN VARCHAR2, surname IN VARCHAR2)
  3  IS
  4  BEGIN
  5  DBMS_OUTPUT.PUT_LINE(LOWER(firstname) || ' ' || LOWER(surname));
  6  DBMS_OUTPUT.PUT_LINE(UPPER(firstname) || ' ' || UPPER(surname));
  7  DBMS_OUTPUT.PUT_LINE(INITCAP(firstname) || ' ' || INITCAP(surname));
  8  END Question1;
  9  /

Procedure created.

SQL>
SQL> set serveroutput on
SQL>
SQL> BEGIN
  2  Question1('Marc','Laffan');
  3  END;
  4  /
marc laffan
MARC LAFFAN
Marc Laffan

PL/SQL procedure successfully completed.

SQL>
*/

--Q2--
CREATE OR REPLACE PROCEDURE Question2 (name
IN VARCHAR2)
IS
transformedName VARCHAR2(50);
tNameSize VARCHAR2(10);
BEGIN
transformedName := INITCAP(TRIM(BOTH from name));
DBMS_OUTPUT.PUT_LINE(transformedName);
select VSIZE(transformedName) into tNameSize from dual;
DBMS_OUTPUT.PUT_LINE(tNameSize);
END Question2;
/

set serveroutput on

BEGIN
Question2('Marc Laffan');
END;
/

/* output
SQL> CREATE OR REPLACE PROCEDURE Question2 (name
  2  IN VARCHAR2)
  3  IS
  4  transformedName VARCHAR2(50);
  5  tNameSize VARCHAR2(10);
  6  BEGIN
  7  transformedName := INITCAP(TRIM(BOTH from name));
  8  DBMS_OUTPUT.PUT_LINE(transformedName);
  9  select VSIZE(transformedName) into tNameSize from dual;
 10  DBMS_OUTPUT.PUT_LINE(tNameSize);
 11  END Question2;
 12  /

Procedure created.

SQL>
SQL> set serveroutput on
SQL>
SQL> BEGIN
  2  Question2('Marc Laffan');
  3  END;
  4  /
Marc Laffan
11

PL/SQL procedure successfully completed.

SQL>
*/

--Q3--
CREATE OR REPLACE PROCEDURE Question3 (name IN OUT VARCHAR2)
IS
BEGIN
name := REPLACE(name,'a','');
name := REPLACE(name,'e','');
name := REPLACE(name,'i','');
name := REPLACE(name,'o','');
name := REPLACE(name,'u','');
name := REPLACE(name,'A','');
name := REPLACE(name,'E','');
name := REPLACE(name,'I','');
name := REPLACE(name,'O','');
name := REPLACE(name,'U','');
DBMS_OUTPUT.PUT_LINE(name);
END Question3;
/

set serveroutput on

DECLARE 
alphabet VARCHAR2(30) := 'abcdefghijklmnopqrstuvwxyz';
BEGIN 
Question3(alphabet);
END;
/

/* output
SQL> CREATE OR REPLACE PROCEDURE Question3 (name IN OUT VARCHAR2)
  2  IS
  3  BEGIN
  4  name := REPLACE(name,'a','');
  5  name := REPLACE(name,'e','');
  6  name := REPLACE(name,'i','');
  7  name := REPLACE(name,'o','');
  8  name := REPLACE(name,'u','');
  9  name := REPLACE(name,'A','');
 10  name := REPLACE(name,'E','');
 11  name := REPLACE(name,'I','');
 12  name := REPLACE(name,'O','');
 13  name := REPLACE(name,'U','');
 14  DBMS_OUTPUT.PUT_LINE(name);
 15  END Question3;
 16  /

Procedure created.

SQL>
SQL> set serveroutput on
SQL>
SQL> DECLARE
  2  alphabet VARCHAR2(30) := 'abcdefghijklmnopqrstuvwxyz';
  3  BEGIN
  4  Question3(alphabet);
  5  END;
  6  /
bcdfghjklmnpqrstvwxyz

PL/SQL procedure successfully completed.

SQL>
*/

--Q4--
CREATE OR REPLACE PROCEDURE Question4 (numbertobemultiplied IN OUT NUMBER)
IS
BEGIN
numbertobemultiplied := numbertobemultiplied * 2;
END Question4;
/

set serveroutput on

DECLARE 
numbertobemultiplied NUMBER(5) := 5;
BEGIN 
Question4(numbertobemultiplied);
END;
/

/* output
SQL> CREATE OR REPLACE PROCEDURE Question4 (numbertobemultiplied IN OUT NUMBER)
  2  IS
  3  BEGIN
  4  numbertobemultiplied := numbertobemultiplied * 2;
  5  END Question4;
  6  /

Procedure created.

SQL>
SQL> set serveroutput on
SQL>
SQL> DECLARE
  2  numbertobemultiplied NUMBER(5) := 5;
  3  BEGIN
  4  Question4(numbertobemultiplied);
  5  END;
  6  /

PL/SQL procedure successfully completed.

SQL>
*/

--Q5--
CREATE OR REPLACE PROCEDURE Question5 (number1 IN OUT NUMBER, number2 IN NUMBER, number3 IN NUMBER, number4 IN NUMBER, number5 IN NUMBER)
IS
BEGIN
number1 := number1 + number2;
number1 := number1 + number3;
number1 := number1 + number4;
number1 := number1 + number5;
number1 := number1 - 1;
END Question5;
/

set serveroutput on

DECLARE 
number1 NUMBER(4) := 1;
number2 NUMBER(4) := 2;
number3 NUMBER(4) := 3;
number4 NUMBER(4) := 4;
number5 NUMBER(4) := 5;
BEGIN 
Question5(number1, number2, number3, number4, number5);
END;
/

/* output
SQL> CREATE OR REPLACE PROCEDURE Question5 (number1 IN OUT NUMBER, number2 IN NUMBER, number3 IN NUMBER, number4 IN NUMBER, number5 IN NUMBER)
  2  IS
  3  BEGIN
  4  number1 := number1 + number2;
  5  number1 := number1 + number3;
  6  number1 := number1 + number4;
  7  number1 := number1 + number5;
  8  number1 := number1 - 1;
  9  END Question5;
 10  /

Procedure created.

SQL>
SQL> set serveroutput on
SQL>
SQL> DECLARE
  2  number1 NUMBER(4) := 1;
  3  number2 NUMBER(4) := 2;
  4  number3 NUMBER(4) := 3;
  5  number4 NUMBER(4) := 4;
  6  number5 NUMBER(4) := 5;
  7  BEGIN
  8  Question5(number1, number2, number3, number4, number5);
  9  END;
 10  /

PL/SQL procedure successfully completed.

SQL>
*/

--Q6--

CREATE OR REPLACE PACKAGE Question6 AS
FUNCTION overload(number1 IN NUMBER, number2 IN NUMBER) RETURN NUMBER;
FUNCTION overload(number1 IN NUMBER, number2 IN NUMBER, number3 IN NUMBER) RETURN NUMBER;
FUNCTION overload(number1 IN NUMBER, number2 IN NUMBER, number3 IN NUMBER, number4 IN NUMBER) RETURN NUMBER;
FUNCTION overload(number1 IN NUMBER, number2 IN NUMBER, number3 IN NUMBER, number4 IN NUMBER, number5 IN NUMBER) RETURN NUMBER;
END;
/

CREATE OR REPLACE PACKAGE BODY Question6 AS
FUNCTION overload(number1 IN NUMBER, number2 IN NUMBER) RETURN NUMBER
IS
total NUMBER(4);
BEGIN
total := number1 + number2 - 1;
RETURN total;
END overload;

FUNCTION overload(number1 IN NUMBER, number2 IN NUMBER, number3 IN NUMBER) RETURN NUMBER
IS
total NUMBER(4);
BEGIN
total := number1 + number2 + number3 - 1;
RETURN total;
END overload;

FUNCTION overload(number1 IN NUMBER, number2 IN NUMBER, number3 IN NUMBER, number4 IN NUMBER) RETURN NUMBER
IS
total NUMBER(4);
BEGIN
total := number1 + number2 + number3 + number4 - 1;
RETURN total;
END overload;

FUNCTION overload(number1 IN NUMBER, number2 IN NUMBER, number3 IN NUMBER, number4 IN NUMBER, number5 IN NUMBER) RETURN NUMBER
IS
total NUMBER(4);
BEGIN
total := number1 + number2 + number3 + number4 + number5 - 1;
RETURN total;
END overload;
END;
/

set serveroutput on

DECLARE 
twonums NUMBER(3);
threenums NUMBER(3);
fournums NUMBER(3);
fivenums NUMBER(3);
BEGIN
SELECT Question6.overload(1, 5) INTO twonums FROM Dual;
SELECT Question6.overload(1, 5, 6) INTO threenums FROM Dual;
SELECT Question6.overload(1, 5, 6, 7) INTO fournums FROM Dual;
SELECT Question6.overload(1, 5, 6, 7, 3) INTO fivenums FROM Dual;

DBMS_OUTPUT.PUT_LINE('Sum of two numbers (minus one): ' || twonums);
DBMS_OUTPUT.PUT_LINE('Sum of three numbers (minus one): ' || threenums);
DBMS_OUTPUT.PUT_LINE('Sum of four numbers (minus one): ' || fournums);
DBMS_OUTPUT.PUT_LINE('Sum of five numbers (minus one): ' || fivenums);

END;
/

/* output
SQL> CREATE OR REPLACE PACKAGE Question6 AS
  2  FUNCTION overload(number1 IN NUMBER, number2 IN NUMBER) RETURN NUMBER;
  3  FUNCTION overload(number1 IN NUMBER, number2 IN NUMBER, number3 IN NUMBER) RETURN NUMBER;
  4  FUNCTION overload(number1 IN NUMBER, number2 IN NUMBER, number3 IN NUMBER, number4 IN NUMBER) RETURN NUMBER;
  5  FUNCTION overload(number1 IN NUMBER, number2 IN NUMBER, number3 IN NUMBER, number4 IN NUMBER, number5 IN NUMBER) RETURN NUMBER;
  6  END;
  7  /

Package created.

SQL>
SQL> CREATE OR REPLACE PACKAGE BODY Question6 AS
  2  FUNCTION overload(number1 IN NUMBER, number2 IN NUMBER) RETURN NUMBER
  3  IS
  4  total NUMBER(4);
  5  BEGIN
  6  total := number1 + number2 - 1;
  7  RETURN total;
  8  END overload;
  9
 10  FUNCTION overload(number1 IN NUMBER, number2 IN NUMBER, number3 IN NUMBER) RETURN NUMBER
 11  IS
 12  total NUMBER(4);
 13  BEGIN
 14  total := number1 + number2 + number3 - 1;
 15  RETURN total;
 16  END overload;
 17
 18  FUNCTION overload(number1 IN NUMBER, number2 IN NUMBER, number3 IN NUMBER, number4 IN NUMBER) RETURN NUMBER
 19  IS
 20  total NUMBER(4);
 21  BEGIN
 22  total := number1 + number2 + number3 + number4 - 1;
 23  RETURN total;
 24  END overload;
 25
 26  FUNCTION overload(number1 IN NUMBER, number2 IN NUMBER, number3 IN NUMBER, number4 IN NUMBER, number5 IN NUMBER) RETURN NUMBER
 27  IS
 28  total NUMBER(4);
 29  BEGIN
 30  total := number1 + number2 + number3 + number4 + number5 - 1;
 31  RETURN total;
 32  END overload;
 33  END;
 34  /

Package body created.

SQL>
SQL> set serveroutput on
SQL>
SQL> DECLARE
  2  twonums NUMBER(3);
  3  threenums NUMBER(3);
  4  fournums NUMBER(3);
  5  fivenums NUMBER(3);
  6  BEGIN
  7  SELECT Question6.overload(1, 5) INTO twonums FROM Dual;
  8  SELECT Question6.overload(1, 5, 6) INTO threenums FROM Dual;
  9  SELECT Question6.overload(1, 5, 6, 7) INTO fournums FROM Dual;
 10  SELECT Question6.overload(1, 5, 6, 7, 3) INTO fivenums FROM Dual;
 11
 12  DBMS_OUTPUT.PUT_LINE('Sum of two numbers (minus one): ' || twonums);
 13  DBMS_OUTPUT.PUT_LINE('Sum of three numbers (minus one): ' || threenums);
 14  DBMS_OUTPUT.PUT_LINE('Sum of four numbers (minus one): ' || fournums);
 15  DBMS_OUTPUT.PUT_LINE('Sum of five numbers (minus one): ' || fivenums);
 16
 17  END;
 18  /
Sum of two numbers (minus one): 5
Sum of three numbers (minus one): 11
Sum of four numbers (minus one): 18
Sum of five numbers (minus one): 21

PL/SQL procedure successfully completed.

SQL>
*/