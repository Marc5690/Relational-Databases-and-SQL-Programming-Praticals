--Q1--

set serveroutput on

BEGIN
FOR i IN 1..100 LOOP
DBMS_OUTPUT.PUT_LINE( i );
END LOOP;
END;
/
/* output
SQL> set serveroutput on
SQL>
SQL> BEGIN
  2  FOR i IN 1..100 LOOP
  3  DBMS_OUTPUT.PUT_LINE( i );
  4  END LOOP;
  5  END;
  6  /
1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34
35
36
37
38
39
40
41
42
43
44
45
46
47
48
49
50
51
52
53
54
55
56
57
58
59
60
61
62
63
64
65
66
67
68
69
70
71
72
73
74
75
76
77
78
79
80
81
82
83
84
85
86
87
88
89
90
91
92
93
94
95
96
97
98
99
100

PL/SQL procedure successfully completed.

SQL>
*/

--Q2--
set serveroutput on

BEGIN
<<outer>>
FOR e IN 1..100 LOOP

<<inner>>
FOR i IN 1..100 LOOP
DBMS_OUTPUT.PUT_LINE(e || '.' || i );
END LOOP inner;

END LOOP outer;
END;
/


/* output

1.6
1.7
1.8
1.9
1.10
1.11
1.12
1.13
1.14
1.15
1.16
1.17
1.18
1.19
1.20
1.21
1.22
1.23
1.24
1.25
1.26
1.27
1.28
1.29
1.30
1.31
1.32
1.33
1.34
1.35
1.36
1.37
1.38
1.39
1.40
1.41
1.42
1.43
1.44
1.45
1.46
1.47
1.48
1.49
1.50
1.51
1.52
1.53
1.54
1.55
1.56


...

100.75
100.76
100.77
100.78
100.79
100.80
100.81
100.82
100.83
100.84
100.85
100.86
100.87
100.88
100.89
100.90
100.91
100.92
100.93
100.94
100.95
100.96
100.97
100.98
100.99
100.100

PL/SQL procedure successfully completed.

SQL>
*/

--Q3--
set serveroutput on

DECLARE
b NUMBER := 0;

BEGIN
<<outer>>
FOR e IN 1..30 LOOP


<<inner>>
FOR i IN 2..e-1 LOOP
IF(MOD(e, i) = 0) THEN
b:=1;
END IF;
END LOOP inner;

IF(b=1 OR e = 1) THEN
DBMS_OUTPUT.PUT_LINE(e);
END IF; 
b:=0;
END LOOP outer;
END;
/

/* output
SQL> set serveroutput on
SQL>
SQL> DECLARE
  2  b NUMBER := 0;
  3
  4  BEGIN
  5  <<outer>>
  6  FOR e IN 1..30 LOOP
  7
  8
  9  <<inner>>
 10  FOR i IN 2..e-1 LOOP
 11  IF(MOD(e, i) = 0) THEN
 12  b:=1;
 13  END IF;
 14  END LOOP inner;
 15
 16  IF(b=1 OR e = 1) THEN
 17  DBMS_OUTPUT.PUT_LINE(e);
 18  END IF;
 19  b:=0;
 20  END LOOP outer;
 21  END;
 22  /
1
4
6
8
9
10
12
14
15
16
18
20
21
22
24
25
26
27
28
30

PL/SQL procedure successfully completed.

SQL>
*/

--Q4--

CREATE SEQUENCE emp_prim_seq
MINVALUE 1
MAXVALUE 9999999	
START WITH 1000	
INCREMENT BY 1;


CREATE OR REPLACE TRIGGER Q4
BEFORE INSERT ON EMPLOYEE
FOR EACH ROW
BEGIN
IF(:new.emp_id IS NULL )
  THEN
    :new.emp_id := emp_prim_seq.nextval;
  END IF;
 END;
 /

 select * from employee;
 
 INSERT INTO EMPLOYEE (FNAME, LNAME, MANAGER_EMP_ID) VALUES ('Marc','Laffan', 304);
 
 select * from employee;
 
 /* output
 SQL> CREATE SEQUENCE emp_prim_seq
  2  MINVALUE 1
  3  MAXVALUE 9999999
  4  START WITH 1000
  5  INCREMENT BY 1;

Sequence created.

SQL>
SQL>
SQL> CREATE OR REPLACE TRIGGER Q4
  2  BEFORE INSERT ON EMPLOYEE
  3  FOR EACH ROW
  4  BEGIN
  5  IF(:new.emp_id IS NULL )
  6    THEN
  7      :new.emp_id := emp_prim_seq.nextval;
  8    END IF;
  9   END;
 10   /

Trigger created.

SQL> select * from employee;

    EMP_ID FNAME                LNAME                MANAGER_EMP_ID
---------- -------------------- -------------------- --------------
       304 Reno                 Lopez                           304
       305 Stewart              Fulbright                       305
       300 Jason                Chase                           304
       301 James                Mason                           304
       302 Mila                 Freeman                         305
       303 Michael              Berry                           305
       299 Marcus               Reynolds                        304
       298 Marcus               Reynolds                        304
       297 Anthony              Spielburg                       304
       296 Jack                 Montague                        304
        29 Ibrahim              Frost                           304

    EMP_ID FNAME                LNAME                MANAGER_EMP_ID
---------- -------------------- -------------------- --------------
        35 Ibrahim              Frost                           304
        30 Anthony              Spielburg                       304

13 rows selected.

SQL> INSERT INTO EMPLOYEE (FNAME, LNAME, MANAGER_EMP_ID) VALUES ('Marc','Laffan', 304);

1 row created.

SQL> select * from employee;

    EMP_ID FNAME                LNAME                MANAGER_EMP_ID
---------- -------------------- -------------------- --------------
       304 Reno                 Lopez                           304
       305 Stewart              Fulbright                       305
       300 Jason                Chase                           304
       301 James                Mason                           304
       302 Mila                 Freeman                         305
       303 Michael              Berry                           305
       299 Marcus               Reynolds                        304
       298 Marcus               Reynolds                        304
       297 Anthony              Spielburg                       304
       296 Jack                 Montague                        304
        29 Ibrahim              Frost                           304

    EMP_ID FNAME                LNAME                MANAGER_EMP_ID
---------- -------------------- -------------------- --------------
        35 Ibrahim              Frost                           304
        30 Anthony              Spielburg                       304
      1000 Marc                 Laffan                          304

14 rows selected.

SQL>*/

--Q5--

ALTER TABLE employee ADD salary number;

UPDATE EMPLOYEE SET salary=50000 where emp_id = 29;
UPDATE EMPLOYEE SET salary=45000 where emp_id = 30;
UPDATE EMPLOYEE SET salary=46000 where emp_id = 35;
UPDATE EMPLOYEE SET salary=30000 where emp_id = 296;
UPDATE EMPLOYEE SET salary=33000 where emp_id = 297;
UPDATE EMPLOYEE SET salary=19000 where emp_id = 298;
UPDATE EMPLOYEE SET salary=42000 where emp_id = 299;
UPDATE EMPLOYEE SET salary=45000 where emp_id = 300;
UPDATE EMPLOYEE SET salary=100000 where emp_id = 301;
UPDATE EMPLOYEE SET salary=100000 where emp_id = 302;
UPDATE EMPLOYEE SET salary=150000 where emp_id = 303;
UPDATE EMPLOYEE SET salary=130000 where emp_id = 304;
UPDATE EMPLOYEE SET salary=12000 where emp_id = 305;


CREATE OR REPLACE TRIGGER Q5
BEFORE INSERT OR UPDATE ON EMPLOYEE
FOR EACH ROW
BEGIN
IF(:new.salary > 100000)
  THEN
    DBMS_OUTPUT.PUT_LINE(:new.salary);
  END IF;
 END;
 /
 
 set serveroutput on
 
 UPDATE EMPLOYEE set salary = 50000 where emp_id = 300;
 UPDATE EMPLOYEE set salary = 110000 where emp_id = 300;

/* output
SQL> ALTER TABLE employee ADD salary number;

Table altered.

SQL> UPDATE EMPLOYEE SET salary=50000 where emp_id = 29;

1 row updated.

SQL> UPDATE EMPLOYEE SET salary=45000 where emp_id = 30;

1 row updated.

SQL> UPDATE EMPLOYEE SET salary=46000 where emp_id = 35;

1 row updated.

SQL> UPDATE EMPLOYEE SET salary=30000 where emp_id = 296;

1 row updated.

SQL> UPDATE EMPLOYEE SET salary=33000 where emp_id = 297;

1 row updated.

SQL> UPDATE EMPLOYEE SET salary=19000 where emp_id = 298;

1 row updated.

SQL> UPDATE EMPLOYEE SET salary=42000 where emp_id = 299;

1 row updated.

SQL> UPDATE EMPLOYEE SET salary=45000 where emp_id = 300;

1 row updated.

SQL> UPDATE EMPLOYEE SET salary=100000 where emp_id = 301;

1 row updated.

SQL> UPDATE EMPLOYEE SET salary=100000 where emp_id = 302;

1 row updated.

SQL> UPDATE EMPLOYEE SET salary=150000 where emp_id = 303;

1 row updated.

SQL> UPDATE EMPLOYEE SET salary=130000 where emp_id = 304;

1 row updated.

SQL> UPDATE EMPLOYEE SET salary=12000 where emp_id = 305;

1 row updated.

SQL> CREATE OR REPLACE TRIGGER Q5
  2  BEFORE INSERT OR UPDATE ON EMPLOYEE
  3  FOR EACH ROW
  4  BEGIN
  5  IF(:new.salary > 100000)
  6    THEN
  7      DBMS_OUTPUT.PUT_LINE(:new.salary);
  8    END IF;
  9   END;
 10   /

Trigger created.

SQL>  set serveroutput on
SQL>
SQL>  UPDATE EMPLOYEE set salary = 50000 where emp_id = 300;

1 row updated.

SQL>  UPDATE EMPLOYEE set salary = 110000 where emp_id = 300;
110000

1 row updated.

SQL>
*/

--Q6--

select * from employee;

BEGIN
FOR i IN 1..1000 LOOP
IF (i>500) THEN
INSERT INTO EMPLOYEE (FNAME, LNAME, MANAGER_EMP_ID) VALUES ('testFname','testLname', 304);
ELSE
INSERT INTO EMPLOYEE (FNAME, LNAME, MANAGER_EMP_ID) VALUES ('testFname','testLname', 305);
END IF;
END LOOP;
END;
/

select * from employee;

/* output

SQL> select * from employee;

    EMP_ID FNAME                LNAME                MANAGER_EMP_ID     SALARY
---------- -------------------- -------------------- -------------- ----------
       304 Reno                 Lopez                           304     130000
       305 Stewart              Fulbright                       305      12000
       300 Jason                Chase                           304      45000
       301 James                Mason                           304     100000
       302 Mila                 Freeman                         305     100000
       303 Michael              Berry                           305     150000
       299 Marcus               Reynolds                        304      42000
       298 Marcus               Reynolds                        304      19000
       297 Anthony              Spielburg                       304      33000
       296 Jack                 Montague                        304      30000
        29 Ibrahim              Frost                           304      50000

    EMP_ID FNAME                LNAME                MANAGER_EMP_ID     SALARY
---------- -------------------- -------------------- -------------- ----------
        35 Ibrahim              Frost                           304      46000
        30 Anthony              Spielburg                       304      45000

13 rows selected.


SQL> BEGIN
  2  FOR i IN 1..1000 LOOP
  3  IF (i>500) THEN
  4  INSERT INTO EMPLOYEE (FNAME, LNAME, MANAGER_EMP_ID) VALUES ('testFname','testLname', 304);
  5  ELSE
  6  INSERT INTO EMPLOYEE (FNAME, LNAME, MANAGER_EMP_ID) VALUES ('testFname','testLname', 305);
  7  END IF;
  8  END LOOP;
  9  END;
 10  /

PL/SQL procedure successfully completed.


SQL> select * from employee;

    EMP_ID FNAME                LNAME                MANAGER_EMP_ID     SALARY
---------- -------------------- -------------------- -------------- ----------
       304 Reno                 Lopez                           304     130000
       305 Stewart              Fulbright                       305      12000
       300 Jason                Chase                           304      45000
       301 James                Mason                           304     100000
       302 Mila                 Freeman                         305     100000
       303 Michael              Berry                           305     150000
       299 Marcus               Reynolds                        304      42000
       298 Marcus               Reynolds                        304      19000
       297 Anthony              Spielburg                       304      33000
       296 Jack                 Montague                        304      30000
        29 Ibrahim              Frost                           304      50000

    EMP_ID FNAME                LNAME                MANAGER_EMP_ID     SALARY
---------- -------------------- -------------------- -------------- ----------
        35 Ibrahim              Frost                           304      46000
        30 Anthony              Spielburg                       304      45000
      1201 testFname            testLname                       305
      1202 testFname            testLname                       305
      1203 testFname            testLname                       305
      1204 testFname            testLname                       305
      1205 testFname            testLname                       305
      1206 testFname            testLname                       305
      1207 testFname            testLname                       305
      1208 testFname            testLname                       305
      1209 testFname            testLname                       305

    EMP_ID FNAME                LNAME                MANAGER_EMP_ID     SALARY
---------- -------------------- -------------------- -------------- ----------
      1210 testFname            testLname                       305
      1211 testFname            testLname                       305
      1212 testFname            testLname                       305
      1213 testFname            testLname                       305
      1214 testFname            testLname                       305
      1215 testFname            testLname                       305
      1216 testFname            testLname                       305
      1217 testFname            testLname                       305
      1218 testFname            testLname                       305
      1219 testFname            testLname                       305
      1220 testFname            testLname                       305

    EMP_ID FNAME                LNAME                MANAGER_EMP_ID     SALARY
---------- -------------------- -------------------- -------------- ----------
      1221 testFname            testLname                       305
      1222 testFname            testLname                       305
      1223 testFname            testLname                       305
      1224 testFname            testLname                       305
      1225 testFname            testLname                       305
      1226 testFname            testLname                       305
      1227 testFname            testLname                       305
      1228 testFname            testLname                       305
      1229 testFname            testLname                       305
      1230 testFname            testLname                       305
      1231 testFname            testLname                       305

    EMP_ID FNAME                LNAME                MANAGER_EMP_ID     SALARY
---------- -------------------- -------------------- -------------- ----------
      1232 testFname            testLname                       305
      1233 testFname            testLname                       305
      1234 testFname            testLname                       305
      1235 testFname            testLname                       305
      1236 testFname            testLname                       305
      1237 testFname            testLname                       305
      1238 testFname            testLname                       305
      1239 testFname            testLname                       305
      1240 testFname            testLname                       305
      1241 testFname            testLname                       305
      1242 testFname            testLname                       305

    EMP_ID FNAME                LNAME                MANAGER_EMP_ID     SALARY
---------- -------------------- -------------------- -------------- ----------
      1243 testFname            testLname                       305
      1244 testFname            testLname                       305
      1245 testFname            testLname                       305
      1246 testFname            testLname                       305
      1247 testFname            testLname                       305
      1248 testFname            testLname                       305
      1249 testFname            testLname                       305
      1250 testFname            testLname                       305
      1251 testFname            testLname                       305
      1252 testFname            testLname                       305
      1253 testFname            testLname                       305

    EMP_ID FNAME                LNAME                MANAGER_EMP_ID     SALARY
---------- -------------------- -------------------- -------------- ----------
      1254 testFname            testLname                       305
      1255 testFname            testLname                       305
      1256 testFname            testLname                       305
      1257 testFname            testLname                       305
      1258 testFname            testLname                       305
      1259 testFname            testLname                       305
      1260 testFname            testLname                       305
      1261 testFname            testLname                       305
      1262 testFname            testLname                       305
      1263 testFname            testLname                       305
      1264 testFname            testLname                       305

    EMP_ID FNAME                LNAME                MANAGER_EMP_ID     SALARY
---------- -------------------- -------------------- -------------- ----------
      1265 testFname            testLname                       305
      1266 testFname            testLname                       305
      1267 testFname            testLname                       305
      1268 testFname            testLname                       305
      1269 testFname            testLname                       305
      1270 testFname            testLname                       305
      1271 testFname            testLname                       305
      1272 testFname            testLname                       305
      1273 testFname            testLname                       305
      1274 testFname            testLname                       305
      1275 testFname            testLname                       305

    EMP_ID FNAME                LNAME                MANAGER_EMP_ID     SALARY
---------- -------------------- -------------------- -------------- ----------
      1276 testFname            testLname                       305
      1277 testFname            testLname                       305
      1278 testFname            testLname                       305
      1279 testFname            testLname                       305
      1280 testFname            testLname                       305
      1281 testFname            testLname                       305
      1282 testFname            testLname                       305
      1283 testFname            testLname                       305
	  
	  
	  ...
	  
	  
	  2182 testFname            testLname                       304
      2183 testFname            testLname                       304
      2184 testFname            testLname                       304
      2185 testFname            testLname                       304
      2186 testFname            testLname                       304
      2187 testFname            testLname                       304
      2188 testFname            testLname                       304

    EMP_ID FNAME                LNAME                MANAGER_EMP_ID     SALARY
---------- -------------------- -------------------- -------------- ----------
      2189 testFname            testLname                       304
      2190 testFname            testLname                       304
      2191 testFname            testLname                       304
      2192 testFname            testLname                       304
      2193 testFname            testLname                       304
      2194 testFname            testLname                       304
      2195 testFname            testLname                       304
      2196 testFname            testLname                       304
      2197 testFname            testLname                       304
      2198 testFname            testLname                       304
      2199 testFname            testLname                       304

    EMP_ID FNAME                LNAME                MANAGER_EMP_ID     SALARY
---------- -------------------- -------------------- -------------- ----------
      2200 testFname            testLname                       304

1013 rows selected.

SQL>
*/


--Q7--
set serveroutput on

DECLARE
CURSOR emp_cursor IS SELECT SALARY from employee;
emp_cursor_data emp_cursor %ROWTYPE; 
sal_error EXCEPTION;
BEGIN
OPEN emp_cursor;
fetch emp_cursor into emp_cursor_data; 

WHILE emp_cursor%FOUND LOOP
IF (emp_cursor_data.salary < 20000) THEN
DBMS_OUTPUT.PUT_LINE('This person is being paid too little!'); 
ELSIF (emp_cursor_data.salary > 90000) THEN
RAISE sal_error;
END IF;
FETCH emp_cursor INTO
emp_cursor_data;
END LOOP; 

CLOSE emp_cursor;
EXCEPTION
WHEN sal_error THEN
DBMS_OUTPUT.PUT_LINE('Wage fix required!'); 
END;
/

/* output
SQL> set serveroutput on
SQL>
SQL> DECLARE
  2  CURSOR emp_cursor IS SELECT SALARY from employee;
  3  emp_cursor_data emp_cursor %ROWTYPE;
  4  sal_error EXCEPTION;
  5  BEGIN
  6  OPEN emp_cursor;
  7  fetch emp_cursor into emp_cursor_data;
  8
  9  WHILE emp_cursor%FOUND LOOP
 10  IF (emp_cursor_data.salary < 20000) THEN
 11  DBMS_OUTPUT.PUT_LINE('This person is being paid too much!');
 12  ELSIF (emp_cursor_data.salary > 90000) THEN
 13  RAISE sal_error;
 14  END IF;
 15  FETCH emp_cursor INTO
 16  emp_cursor_data;
 17  END LOOP;
 18
 19  CLOSE emp_cursor;
 20  EXCEPTION
 21  WHEN sal_error THEN
 22  DBMS_OUTPUT.PUT_LINE('Wage fix required!');
 23  END;
 24  /
Wage fix required!

PL/SQL procedure successfully completed.

SQL>
*/

--Q8--
create table test_table(test_attr varchar(255));

set serveroutput on

DECLARE
zero_error EXCEPTION;
fillvar VARCHAR(255);
BEGIN
select test_attr into fillvar from test_table where test_attr = 'test';
EXCEPTION
WHEN NO_DATA_FOUND THEN
DBMS_OUTPUT.PUT_LINE('Could not return any rows!'); 
END;
/

/* output
SQL> create table test_table(test_attr varchar(255));

Table created.

SQL> set serveroutput on
SQL>
SQL> DECLARE
  2  zero_error EXCEPTION;
  3  fillvar VARCHAR(255);
  4  BEGIN
  5  select test_attr into fillvar from test_table where test_attr = 'test';
  6  EXCEPTION
  7  WHEN NO_DATA_FOUND THEN
  8  DBMS_OUTPUT.PUT_LINE('Could not return any rows!');
  9  END;
 10  /
Could not return any rows!

PL/SQL procedure successfully completed.

SQL>

*/
