--Q1-- 
select cust_order.order_nbr as order_number, employee.fname as first_name, employee.lname as last_name from cust_order join employee on employee.emp_id = cust_order.sales_emp_id;
/*Output 
select cust_order.order_nbr as order_number, employee.fname as first_name, employee.lname as last_name from cust_order join employee on employee.emp_id = cust_order.sales_emp_id;
ORDER_NUMBER FIRST_NAME           LAST_NAME
------------ -------------------- --------------------
        1000 Jason                Chase
        1001 James                Mason
        1002 Mila                 Freeman
        1003 Michael              Berry
        1004 Jason                Chase
        1005 James                Mason
        1006 Mila                 Freeman
        1007 Michael              Berry
        1008 Jason                Chase
        1009 James                Mason
        1010 Mila                 Freeman

ORDER_NUMBER FIRST_NAME           LAST_NAME
------------ -------------------- --------------------
        1011 Michael              Berry
        1012 Jason                Chase
        1013 James                Mason
        1014 Mila                 Freeman
        1015 Michael              Berry
        1016 Jason                Chase
        1017 James                Mason
        1018 Mila                 Freeman
        1019 Michael              Berry
        1020 Jason                Chase
        1021 James                Mason

ORDER_NUMBER FIRST_NAME           LAST_NAME
------------ -------------------- --------------------
        1022 Mila                 Freeman
        1023 Michael              Berry
        1024 Jason                Chase
        1025 James                Mason

26 rows selected.*/



--Q2-- 
SELECT worker.fname as employee_first_name, worker.lname as employee_last_name, manager.fname as manager_first_name, manager.lname as manager_last_name FROM Employee worker JOIN Employee manager ON worker.manager_emp_id = manager.emp_id;
/*Output 
SQL> SELECT worker.fname as employee_first_name, worker.lname as employee_last_name, manager.fname as manager_first_name, manager.lname as manager_last_name FROM Employee worker JOIN Employee manager ON worker.manager_emp_id = manager.emp_id;

EMPLOYEE_FIRST_NAME  EMPLOYEE_LAST_NAME   MANAGER_FIRST_NAME
-------------------- -------------------- --------------------
MANAGER_LAST_NAME
--------------------
James                Mason                Reno
Lopez

Jason                Chase                Reno
Lopez

Reno                 Lopez                Reno
Lopez


EMPLOYEE_FIRST_NAME  EMPLOYEE_LAST_NAME   MANAGER_FIRST_NAME
-------------------- -------------------- --------------------
MANAGER_LAST_NAME
--------------------
Michael              Berry                Stewart
Fulbright

Mila                 Freeman              Stewart
Fulbright

Stewart              Fulbright            Stewart
Fulbright


6 rows selected.
*/




--Q3-- 
select cust_order.order_nbr as order_number, employee.fname as first_name, employee.lname as last_name from employee left outer join cust_order on employee.emp_id = cust_order.sales_emp_id;
/*Output 
SQL> select cust_order.order_nbr as order_number, employee.fname as first_name, employee.lname as last_name from employee left outer join cust_order on employee.emp_id = cust_order.sales_emp_id;

ORDER_NUMBER FIRST_NAME           LAST_NAME
------------ -------------------- --------------------
        1000 Jason                Chase
        1001 James                Mason
        1002 Mila                 Freeman
        1003 Michael              Berry
        1004 Jason                Chase
        1005 James                Mason
        1006 Mila                 Freeman
        1007 Michael              Berry
        1008 Jason                Chase
        1009 James                Mason
        1010 Mila                 Freeman

ORDER_NUMBER FIRST_NAME           LAST_NAME
------------ -------------------- --------------------
        1011 Michael              Berry
        1012 Jason                Chase
        1013 James                Mason
        1014 Mila                 Freeman
        1015 Michael              Berry
        1016 Jason                Chase
        1017 James                Mason
        1018 Mila                 Freeman
        1019 Michael              Berry
        1020 Jason                Chase
        1021 James                Mason

ORDER_NUMBER FIRST_NAME           LAST_NAME
------------ -------------------- --------------------
        1022 Mila                 Freeman
        1023 Michael              Berry
        1024 Jason                Chase
        1025 James                Mason
             Reno                 Lopez
             Stewart              Fulbright

28 rows selected.
*/




--Q4-- 
select sum(sale_price) from cust_order;
/*Output 
SQL> select sum(sale_price) from cust_order;

SUM(SALE_PRICE)
---------------
        9595.59
*/




--Q5--
select sales_emp_id, AVG(cust_order.sale_price) as average from cust_order group by sales_emp_id;
/*Output 
SQL> select sales_emp_id, AVG(cust_order.sale_price) as average from cust_order group by sales_emp_id;

SALES_EMP_ID    AVERAGE
------------ ----------
         303     333.83
         300 396.797143
         301 562.528571
         302 146.221667

SQL>
*/




--Q6--
select cust_nbr, SUM(cust_order.sale_price) as total from cust_order group by cust_nbr;
/*Output 
SQL> select cust_nbr, SUM(cust_order.sale_price) as total from cust_order group by cust_nbr;

  CUST_NBR      TOTAL
---------- ----------
       100    1291.98
       108     676.49
       102    1440.75
       101     1278.1
       107     601.25
       104    1090.35
       105    1316.09
       109      141.6
       103    1700.49
       106      58.49

10 rows selected.

SQL>
*/




--Q7-- 
select cust_nbr, SUM(cust_order.sale_price) as total from cust_order group by cust_nbr having SUM(cust_order.sale_price) > 1000;
/*Output 
SQL> select cust_nbr, SUM(cust_order.sale_price) as total from cust_order group by cust_nbr having SUM(cust_order.sale_price) > 1000;

  CUST_NBR      TOTAL
---------- ----------
       100    1291.98
       102    1440.75
       101     1278.1
       104    1090.35
       105    1316.09
       103    1700.49

6 rows selected.

SQL>
*/




--Q8-- 
SELECT c.cust_nbr, manager.emp_id, SUM(co.sale_price)
FROM cust_order co JOIN customer c ON co.cust_nbr = c.cust_nbr JOIN Employee emp ON co.sales_emp_id = emp.emp_id JOIN Employee manager ON emp.manager_emp_id = manager.emp_id
GROUP BY CUBE(co.cust_nbr, manager.emp_id);
/*Output
SQL> SELECT c.cust_nbr, manager.emp_id, SUM(co.sale_price)
  2  FROM cust_order co JOIN customer c ON co.cust_nbr = c.cust_nbr JOIN Employee emp ON co.sales_emp_id = emp.emp_id JOIN Employee manager ON emp.manager_emp_id = manager.emp_id
  3  GROUP BY CUBE(co.cust_nbr, manager.emp_id);

  CUST_NBR     EMP_ID SUM(CO.SALE_PRICE)
---------- ---------- ------------------
                                 9595.59
                  304            6715.28
                  305            2880.31
       100                       1291.98
       100        304            1200.99
       100        305              90.99
       101                        1278.1
       101        304             1078.1
       101        305                200
       102                       1440.75
       102        304                220

  CUST_NBR     EMP_ID SUM(CO.SALE_PRICE)
---------- ---------- ------------------
       102        305            1220.75
       103                       1700.49
       103        304               1300
       103        305             400.49
       104                       1090.35
       104        304            1000.25
       104        305               90.1
       105                       1316.09
       105        304            1173.09
       105        305                143
       106                         58.49

  CUST_NBR     EMP_ID SUM(CO.SALE_PRICE)
---------- ---------- ------------------
       106        305              58.49
       107                        601.25
       107        304             601.25
       108                        676.49
       108        305             676.49
       109                         141.6
       109        304              141.6

29 rows selected.

SQL>
*/




--Q9--
SELECT e.emp_id as id, co.cust_nbr as custNum, SUM(co.sale_price)
FROM employee e JOIN cust_order co ON co.sales_emp_id = e.emp_id
GROUP BY ROLLUP(e.emp_id, co.cust_nbr);
/*Output 
SQL> SELECT e.emp_id as id, co.cust_nbr as custNum, SUM(co.sale_price)
  2  FROM employee e JOIN cust_order co ON co.sales_emp_id = e.emp_id
  3  GROUP BY ROLLUP(e.emp_id, co.cust_nbr);

        ID    CUSTNUM SUM(CO.SALE_PRICE)
---------- ---------- ------------------
       300        100             400.99
       300        101               1000
       300        102                220
       300        104             770.25
       300        105             184.99
       300        107             189.25
       300        109               12.1
       300                       2777.58
       301        100                800
       301        101               78.1
       301        103               1300

        ID    CUSTNUM SUM(CO.SALE_PRICE)
---------- ---------- ------------------
       301        104                230
       301        105              988.1
       301        107                412
       301        109              129.5
       301                        3937.7
       302        100              90.99
       302        102             330.25
       302        103              99.99
       302        104               90.1
       302        106               34.5
       302        108              231.5

        ID    CUSTNUM SUM(CO.SALE_PRICE)
---------- ---------- ------------------
       302                        877.33
       303        101                200
       303        102              890.5
       303        103              300.5
       303        105                143
       303        106              23.99
       303        108             444.99
       303                       2002.98
                                 9595.59

31 rows selected.

SQL>
*/
