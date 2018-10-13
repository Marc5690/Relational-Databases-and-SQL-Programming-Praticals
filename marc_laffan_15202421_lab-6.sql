--Q1-- 
COMMIT;
SET AUTOCOMMIT OFF;
INSERT INTO CUSTOMER (CUST_NBR, FNAME, LNAME) VALUES ( 110, 'Jack', 'Cusack');
INSERT INTO CUSTOMER (CUST_NBR, FNAME, LNAME) VALUES ( 111, 'Catherine','Lawlor');
INSERT INTO EMPLOYEE (EMP_ID, FNAME, LNAME, MANAGER_EMP_ID) VALUES( 299,'Marcus', 'Reynolds', 304);
INSERT INTO CUST_ORDER (ORDER_NBR, CUST_NBR, SALES_EMP_ID, SALE_PRICE) VALUES(1026, 110, 299, 600.99);
INSERT INTO CUST_ORDER (ORDER_NBR, CUST_NBR, SALES_EMP_ID, SALE_PRICE) VALUES(1027, 111, 299, 80.00);
COMMIT;
select * from customer

/* Output
SQL> COMMIT;

Commit complete.

SQL> SET AUTOCOMMIT OFF;
SQL>
SQL> INSERT INTO CUSTOMER (CUST_NBR, FNAME, LNAME) VALUES ( 110, 'Jack', 'Cusack');

1 row created.

SQL> INSERT INTO CUSTOMER (CUST_NBR, FNAME, LNAME) VALUES ( 111, 'Catherine','Lawlor');

1 row created.

SQL>
SQL> INSERT INTO EMPLOYEE (EMP_ID, FNAME, LNAME, MANAGER_EMP_ID) VALUES( 299,'Marcus', 'Reynolds', 304);

1 row created.

SQL>
SQL> INSERT INTO CUST_ORDER (ORDER_NBR, CUST_NBR, SALES_EMP_ID, SALE_PRICE) VALUES(1026, 110, 299, 600.99);

1 row created.

SQL> INSERT INTO CUST_ORDER (ORDER_NBR, CUST_NBR, SALES_EMP_ID, SALE_PRICE) VALUES(1027, 111, 299, 80.00);

1 row created.

SQL>
SQL> COMMIT;

Commit complete.

SQL> select * from customer;

  CUST_NBR FNAME                LNAME
---------- -------------------- --------------------
       100 John                 Smith
       101 David                Williams
       102 Angelina             Wolf
       103 Natalie              Clarrins
       104 Carl                 Sagan
       105 Renata               Jones
       106 Julie                DeValera
       107 Bruce                Ezell
       108 Mark                 Pruitt
       109 Nigel                Kennedy
       110 Jack                 Cusack

  CUST_NBR FNAME                LNAME
---------- -------------------- --------------------
       111 Catherine            Lawlor

12 rows selected.

*/

--Q2--
COMMIT;
SET AUTOCOMMIT OFF;
INSERT INTO CUSTOMER (CUST_NBR, FNAME, LNAME) VALUES ( 116, 'Sam', 'Aspel');
INSERT INTO CUSTOMER (CUST_NBR, FNAME, LNAME) VALUES ( 117, 'Katie','Smith');
INSERT INTO EMPLOYEE (EMP_ID, FNAME, LNAME, MANAGER_EMP_ID) VALUES( 297,'Anthony', 'Spielburg', 304);
INSERT INTO CUST_ORDER (ORDER_NBR, CUST_NBR, SALES_EMP_ID, SALE_PRICE) VALUES(1032, 116, 297, 600.99);
INSERT INTO CUST_ORDER (ORDER_NBR, CUST_NBR, SALES_EMP_ID, SALE_PRICE) VALUES(1033, 117, 297, 80.00);
COMMIT;
INSERT INTO CUST_ORDER (ORDER_NBR, CUST_NBR, SALES_EMP_ID, SALE_PRICE) VALUES(1034, 117, 297, 1000.00);
ROLLBACK;
select * from cust_order;

/* Output
SQL> COMMIT;

Commit complete.

SQL> SET AUTOCOMMIT OFF;
SQL> INSERT INTO CUSTOMER (CUST_NBR, FNAME, LNAME) VALUES ( 116, 'Sam', 'Aspel');

1 row created.

SQL> INSERT INTO CUSTOMER (CUST_NBR, FNAME, LNAME) VALUES ( 117, 'Katie','Smith');

1 row created.

SQL> INSERT INTO EMPLOYEE (EMP_ID, FNAME, LNAME, MANAGER_EMP_ID) VALUES( 297,'Anthony', 'Spielburg', 304);

1 row created.

SQL> INSERT INTO CUST_ORDER (ORDER_NBR, CUST_NBR, SALES_EMP_ID, SALE_PRICE) VALUES(1032, 116, 297, 600.99);

1 row created.

SQL> INSERT INTO CUST_ORDER (ORDER_NBR, CUST_NBR, SALES_EMP_ID, SALE_PRICE) VALUES(1033, 117, 297, 80.00);

1 row created.

SQL> COMMIT;

Commit complete.

SQL> INSERT INTO CUST_ORDER (ORDER_NBR, CUST_NBR, SALES_EMP_ID, SALE_PRICE) VALUES(1034, 117, 297, 1000.00);

1 row created.

SQL> ROLLBACK;

Rollback complete.

SQL> select * from cust_order
  2  ;

 ORDER_NBR   CUST_NBR SALES_EMP_ID SALE_PRICE
---------- ---------- ------------ ----------
      1000        100          300     400.99
      1001        100          301        800
      1002        100          302      90.99
      1003        101          303        200
      1004        101          300       1000
      1005        101          301       78.1
      1006        102          302     330.25
      1007        102          303      890.5
      1008        102          300        220
      1009        103          301       1300
      1010        103          302      99.99

 ORDER_NBR   CUST_NBR SALES_EMP_ID SALE_PRICE
---------- ---------- ------------ ----------
      1011        103          303      300.5
      1012        104          300     770.25
      1013        104          301        230
      1014        104          302       90.1
      1015        105          303        143
      1016        105          300     184.99
      1017        105          301      988.1
      1018        106          302       34.5
      1019        106          303      23.99
      1020        107          300     189.25
      1021        107          301        412

 ORDER_NBR   CUST_NBR SALES_EMP_ID SALE_PRICE
---------- ---------- ------------ ----------
      1022        108          302      231.5
      1023        108          303     444.99
      1024        109          300       12.1
      1025        109          301      129.5
      1026        110          299     600.99
      1027        111          299         80
      1029        114          299     600.99
      1030        115          299         80
      1032        116          297     600.99
      1033        117          297         80

32 rows selected.

SQL>
*/

--Q3--
COMMIT;
SET AUTOCOMMIT OFF;
INSERT INTO CUSTOMER (CUST_NBR, FNAME, LNAME) VALUES ( 21, 'Tammy', 'Setzer');
INSERT INTO CUSTOMER (CUST_NBR, FNAME, LNAME) VALUES ( 20, 'Thomas','Martinez');
INSERT INTO EMPLOYEE (EMP_ID, FNAME, LNAME, MANAGER_EMP_ID) VALUES( 35,'Ibrahim', 'Frost', 304);
INSERT INTO CUST_ORDER (ORDER_NBR, CUST_NBR, SALES_EMP_ID, SALE_PRICE) VALUES(1040, 21, 35, 600.99);
INSERT INTO CUST_ORDER (ORDER_NBR, CUST_NBR, SALES_EMP_ID, SALE_PRICE) VALUES(1041, 20, 35, 80.00);
SAVEPOINT first_two_orders;
COMMIT;
INSERT INTO CUST_ORDER (ORDER_NBR, CUST_NBR, SALES_EMP_ID, SALE_PRICE) VALUES(1042, 20, 35, 1000.00);
select * from CUST_ORDER;
ROLLBACK;
select * from CUST_ORDER;

/*
SQL> COMMIT;

Commit complete.

SQL> SET AUTOCOMMIT OFF;
SQL> INSERT INTO CUSTOMER (CUST_NBR, FNAME, LNAME) VALUES ( 21, 'Tammy', 'Setzer');

1 row created.

SQL> INSERT INTO CUSTOMER (CUST_NBR, FNAME, LNAME) VALUES ( 20, 'Thomas','Martinez');

1 row created.

SQL> INSERT INTO EMPLOYEE (EMP_ID, FNAME, LNAME, MANAGER_EMP_ID) VALUES( 35,'Ibrahim', 'Frost', 304);

1 row created.

SQL> INSERT INTO CUST_ORDER (ORDER_NBR, CUST_NBR, SALES_EMP_ID, SALE_PRICE) VALUES(1040, 21, 35, 600.99);

1 row created.

SQL> INSERT INTO CUST_ORDER (ORDER_NBR, CUST_NBR, SALES_EMP_ID, SALE_PRICE) VALUES(1041, 20, 35, 80.00);

1 row created.

SQL> SAVEPOINT first_two_orders;

Savepoint created.

SQL> COMMIT;

Commit complete.

SQL> INSERT INTO CUST_ORDER (ORDER_NBR, CUST_NBR, SALES_EMP_ID, SALE_PRICE) VALUES(1042, 20, 35, 1000.00);

1 row created.

SQL> select * from CUST_ORDER;

 ORDER_NBR   CUST_NBR SALES_EMP_ID SALE_PRICE
---------- ---------- ------------ ----------
      1000        100          300     400.99
      1001        100          301        800
      1002        100          302      90.99
      1003        101          303        200
      1004        101          300       1000
      1005        101          301       78.1
      1006        102          302     330.25
      1007        102          303      890.5
      1008        102          300        220
      1009        103          301       1300
      1010        103          302      99.99

 ORDER_NBR   CUST_NBR SALES_EMP_ID SALE_PRICE
---------- ---------- ------------ ----------
      1011        103          303      300.5
      1012        104          300     770.25
      1013        104          301        230
      1014        104          302       90.1
      1015        105          303        143
      1016        105          300     184.99
      1017        105          301      988.1
      1018        106          302       34.5
      1019        106          303      23.99
      1020        107          300     189.25
      1021        107          301        412

 ORDER_NBR   CUST_NBR SALES_EMP_ID SALE_PRICE
---------- ---------- ------------ ----------
      1022        108          302      231.5
      1023        108          303     444.99
      1024        109          300       12.1
      1025        109          301      129.5
      1026        110          299     600.99
      1027        111          299         80
      1029        114          299     600.99
      1030        115          299         80
      1032        116          297     600.99
      1033        117          297         80
      1035        118          296     600.99

 ORDER_NBR   CUST_NBR SALES_EMP_ID SALE_PRICE
---------- ---------- ------------ ----------
      1036        119          296         80
      1040         21           35     600.99
      1041         20           35         80
      1042         20           35       1000

37 rows selected.

SQL> ROLLBACK;

Rollback complete.

SQL> select * from CUST_ORDER;

 ORDER_NBR   CUST_NBR SALES_EMP_ID SALE_PRICE
---------- ---------- ------------ ----------
      1000        100          300     400.99
      1001        100          301        800
      1002        100          302      90.99
      1003        101          303        200
      1004        101          300       1000
      1005        101          301       78.1
      1006        102          302     330.25
      1007        102          303      890.5
      1008        102          300        220
      1009        103          301       1300
      1010        103          302      99.99

 ORDER_NBR   CUST_NBR SALES_EMP_ID SALE_PRICE
---------- ---------- ------------ ----------
      1011        103          303      300.5
      1012        104          300     770.25
      1013        104          301        230
      1014        104          302       90.1
      1015        105          303        143
      1016        105          300     184.99
      1017        105          301      988.1
      1018        106          302       34.5
      1019        106          303      23.99
      1020        107          300     189.25
      1021        107          301        412

 ORDER_NBR   CUST_NBR SALES_EMP_ID SALE_PRICE
---------- ---------- ------------ ----------
      1022        108          302      231.5
      1023        108          303     444.99
      1024        109          300       12.1
      1025        109          301      129.5
      1026        110          299     600.99
      1027        111          299         80
      1029        114          299     600.99
      1030        115          299         80
      1032        116          297     600.99
      1033        117          297         80
      1035        118          296     600.99

 ORDER_NBR   CUST_NBR SALES_EMP_ID SALE_PRICE
---------- ---------- ------------ ----------
      1036        119          296         80
      1040         21           35     600.99
      1041         20           35         80

36 rows selected.

SQL>


*/

--Q4--
CREATE USER testaccount IDENTIFIED BY pass;
GRANT SELECT, INSERT, UPDATE, DELETE ON EMPLOYEE TO testaccount;
/* output
SQL> CREATE USER testaccount IDENTIFIED BY pass;

User created.

SQL> GRANT SELECT, INSERT, UPDATE, DELETE ON EMPLOYEE TO testaccount
  2  ;

Grant succeeded.

SQL>
*/

--Q5--
REVOKE DELETE ON EMPLOYEE FROM testaccount;
/* output
SQL> REVOKE DELETE ON EMPLOYEE FROM testaccount;

Revoke succeeded.

SQL>
*/

--Q6--
SELECT cust_order.ORDER_NBR, cust_order.CUST_NBR, cust_order.SALES_EMP_ID, cust_order.SALE_PRICE, customer.FNAME, customer.LNAME FROM customer JOIN cust_order ON cust_order.CUST_NBR = customer.CUST_NBR JOIN (SELECT MIN(SALE_PRICE) as price FROM CUST_ORDER) minprice on minprice.price = cust_order.SALE_PRICE;
/*output
SQL> SELECT cust_order.ORDER_NBR, cust_order.CUST_NBR, cust_order.SALES_EMP_ID, cust_order.SALE_PRICE, customer.FNAME, customer.LNAME FROM customer JOIN cust_order ON cust_order.CUST_NBR = customer.CUST_NBR JOIN (SELECT MIN(SALE_PRICE) as price FROM CUST_ORDER) minprice on minprice.price = cust_order.SALE_PRICE;

 ORDER_NBR   CUST_NBR SALES_EMP_ID SALE_PRICE FNAME
---------- ---------- ------------ ---------- --------------------
LNAME
--------------------
      1024        109          300       12.1 Nigel
Kennedy


SQL>
*/

--Q7--
COMMIT;
SET AUTOCOMMIT OFF;
INSERT INTO CUSTOMER (CUST_NBR, FNAME, LNAME) VALUES ( 240, 'Sam', 'Aspel');
INSERT INTO CUSTOMER (CUST_NBR, FNAME, LNAME) VALUES ( 241, 'Katie','Smith');
INSERT INTO EMPLOYEE (EMP_ID, FNAME, LNAME, MANAGER_EMP_ID) VALUES( 31,'Anthony', 'Spielburg', 304);
INSERT INTO CUST_ORDER (ORDER_NBR, CUST_NBR, SALES_EMP_ID, SALE_PRICE) VALUES(2040, 240, 31, 600.99);
INSERT INTO CUST_ORDER (ORDER_NBR, CUST_NBR, SALES_EMP_ID, SALE_PRICE) VALUES(2041, 241, 31, 80.00);
SAVEPOINT safesave;
INSERT INTO CUST_ORDER (ORDER_NBR, CUST_NBR, SALES_EMP_ID, SALE_PRICE) VALUES(2042, 240, 31, 83.00);
BEGIN
INSERT INTO CUST_ORDER (ORDER_NBR, CUST_NBR, SALES_EMP_ID, SALE_PRICE) VALUES(2042, 240, 31, 1000.00);
EXCEPTION
WHEN DUP_VAL_ON_INDEX THEN
ROLLBACK TO safesave;
END;
/
SELECT * FROM CUST_ORDER;
/*OUTPUT
SQL> COMMIT;

Commit complete.

SQL> SET AUTOCOMMIT OFF;
SQL> INSERT INTO CUSTOMER (CUST_NBR, FNAME, LNAME) VALUES ( 240, 'Sam', 'Aspel');

1 row created.

SQL> INSERT INTO CUSTOMER (CUST_NBR, FNAME, LNAME) VALUES ( 241, 'Katie','Smith');

1 row created.

SQL> INSERT INTO EMPLOYEE (EMP_ID, FNAME, LNAME, MANAGER_EMP_ID) VALUES( 31,'Anthony', 'Spielburg', 304);

1 row created.

SQL> INSERT INTO CUST_ORDER (ORDER_NBR, CUST_NBR, SALES_EMP_ID, SALE_PRICE) VALUES(2040, 240, 31, 600.99);

1 row created.

SQL> INSERT INTO CUST_ORDER (ORDER_NBR, CUST_NBR, SALES_EMP_ID, SALE_PRICE) VALUES(2041, 241, 31, 80.00);

1 row created.

SQL> SAVEPOINT safesave;

Savepoint created.

SQL> INSERT INTO CUST_ORDER (ORDER_NBR, CUST_NBR, SALES_EMP_ID, SALE_PRICE) VALUES(2042, 240, 31, 83.00);

1 row created.

SQL> BEGIN
  2  INSERT INTO CUST_ORDER (ORDER_NBR, CUST_NBR, SALES_EMP_ID, SALE_PRICE) VALUES(2042, 240, 31, 1000.00);
  3  EXCEPTION
  4  WHEN DUP_VAL_ON_INDEX THEN
  5  ROLLBACK TO safesave;
  6  END;
  7  /

PL/SQL procedure successfully completed.

SQL> SELECT * FROM CUST_ORDER;

 ORDER_NBR   CUST_NBR SALES_EMP_ID SALE_PRICE
---------- ---------- ------------ ----------
      1000        100          300     400.99
      1001        100          301        800
      1002        100          302      90.99
      1003        101          303        200
      1004        101          300       1000
      1005        101          301       78.1
      1006        102          302     330.25
      1007        102          303      890.5
      1008        102          300        220
      1009        103          301       1300
      1010        103          302      99.99

 ORDER_NBR   CUST_NBR SALES_EMP_ID SALE_PRICE
---------- ---------- ------------ ----------
      1011        103          303      300.5
      1012        104          300     770.25
      1013        104          301        230
      1014        104          302       90.1
      1015        105          303        143
      1016        105          300     184.99
      1017        105          301      988.1
      1018        106          302       34.5
      1019        106          303      23.99
      1020        107          300     189.25
      1021        107          301        412

 ORDER_NBR   CUST_NBR SALES_EMP_ID SALE_PRICE
---------- ---------- ------------ ----------
      1022        108          302      231.5
      1023        108          303     444.99
      1024        109          300       12.1
      1025        109          301      129.5
      1026        110          299     600.99
      1027        111          299         80
      1029        114          299     600.99
      1030        115          299         80
      1032        116          297     600.99
      1033        117          297         80
      1035        118          296     600.99

 ORDER_NBR   CUST_NBR SALES_EMP_ID SALE_PRICE
---------- ---------- ------------ ----------
      1036        119          296         80
      1040         21           35     600.99
      1041         20           35         80
      1060        202           30     600.99
      1061        203           30         80
      1062        202           30         83
      1067        203           30         80
      1070        202           30         83
      1071        202           30         83
      1073        202           30         83
      1074        202           30         83

 ORDER_NBR   CUST_NBR SALES_EMP_ID SALE_PRICE
---------- ---------- ------------ ----------
      1075        202           30         83
      1077        202           30         83
      1078        202           30         83
      1079        202           30         83
      1080        202           30         83
      1081        202           30         83
      1082        202           30         83
      2040        240           31     600.99
      2041        241           31         80

53 rows selected.

SQL>
*/