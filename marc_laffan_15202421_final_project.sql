DROP TABLE person_appearance;
DROP TABLE check_out;
DROP TABLE case_group;
DROP TABLE entity_appearance;
DROP TABLE office;
DROP TABLE investigator;
DROP TABLE evidence;
DROP TABLE entities_involved;
DROP TABLE persons_involved;
DROP TABLE court_case;

CREATE table court_case (
case_id NUMBER(10) PRIMARY KEY,
date_and_time_began date, 
date_and_time_closed date,
solved CHAR(1),
cold CHAR(1),
ongoing CHAR(1),
type_of_crime VARCHAR2(50) 
);

CREATE table persons_involved (
persons_id NUMBER(10) PRIMARY KEY,
name VARCHAR2(50), 
address VARCHAR2(50), 
gender VARCHAR2(10), 
age NUMBER(3),
suspect CHAR(1),
contact_phone_number NUMBER(20) 
);

CREATE table entities_involved (
entity_id NUMBER(10) PRIMARY KEY,
name VARCHAR2(50), 
address VARCHAR2(50), 
contact_details VARCHAR2(100)
);

CREATE table evidence (
evidence_code NUMBER(10) PRIMARY KEY,
description VARCHAR2(50),
monetary_value NUMBER(20),
value_class VARCHAR2(10),
date_and_time_found date, 
date_and_time_stored date
);

CREATE table investigator (
investigator_id NUMBER(10) PRIMARY KEY,
name VARCHAR2(50), 
address VARCHAR2(50), 
gender VARCHAR2(10), 
age NUMBER(3),
contact_phone_number NUMBER(20),
court_case_id NUMBER(10) REFERENCES court_case(case_id)
);

CREATE table office (
office_code NUMBER(10) PRIMARY KEY,
investigator_id NUMBER(10) REFERENCES investigator(investigator_id),
building_address VARCHAR2(100)
);

CREATE table check_out (
investigator_id NUMBER(10) NOT NULL REFERENCES investigator(investigator_id),
evidence_code NUMBER(10) NOT NULL REFERENCES evidence(evidence_code),
date_and_time_checked_out date, 
date_and_time_returned date,
PRIMARY KEY (investigator_id, evidence_code, date_and_time_checked_out)
);

CREATE TABLE case_group (
evidence_code NUMBER(10) NOT NULL REFERENCES evidence(evidence_code),
case_id NUMBER(10) NOT NULL REFERENCES court_case(case_id), 
PRIMARY KEY (case_id, evidence_code)
);

CREATE TABLE entity_appearance (
case_id NUMBER(10) NOT NULL REFERENCES court_case(case_id), 
entity_id NUMBER(10) NOT NULL REFERENCES entities_involved(entity_id),
PRIMARY KEY (case_id, entity_id)
);

CREATE TABLE person_appearance (
case_id NUMBER(10) NOT NULL REFERENCES court_case(case_id), 
persons_id NUMBER(10) NOT NULL REFERENCES persons_involved(persons_id),
PRIMARY KEY (case_id, persons_id)
);

/*
DATA INSERTION
*/
INSERT INTO COURT_CASE (case_id, date_and_time_began, ongoing, type_of_crime) VALUES ( 1, to_date('February 28, 2014, 11:00:00 AM','Month dd, YYYY, HH:MI:SS AM'),'y', 'Hit And Run');
INSERT INTO COURT_CASE (case_id, date_and_time_began, ongoing, type_of_crime) VALUES ( 2, to_date('January 06, 2015, 01:00:00 AM','Month dd, YYYY, HH:MI:SS AM'),'y', 'Theft');
INSERT INTO COURT_CASE (case_id, date_and_time_began, ongoing, type_of_crime) VALUES ( 3, to_date('March 21, 2016, 03:00:00 PM','Month dd, YYYY, HH:MI:SS PM'),'y', 'Fraud');
INSERT INTO COURT_CASE (case_id, date_and_time_began, ongoing, type_of_crime) VALUES ( 4, to_date('March 20, 2016, 07:00:00 PM','Month dd, YYYY, HH:MI:SS PM'),'y', 'Manslaughter');
INSERT INTO COURT_CASE (case_id, date_and_time_began, ongoing, type_of_crime) VALUES ( 5, to_date('September 20, 2015, 08:00:00 AM','Month dd, YYYY, HH:MI:SS AM'),'y', 'Second-degree Murder');
INSERT INTO COURT_CASE (case_id, date_and_time_began, date_and_time_closed, solved, type_of_crime) VALUES ( 6, to_date('June 25, 2009, 11:00:00 AM','Month dd, YYYY, HH:MI:SS AM'), to_date('June 05, 2010, 10:00:00 AM','Month dd, YYYY, HH:MI:SS AM'),'y', 'Criminal Negligence');
INSERT INTO COURT_CASE (case_id, date_and_time_began, ongoing, type_of_crime) VALUES ( 7, to_date('March 02, 2011, 12:00:00 PM','Month dd, YYYY, HH:MI:SS PM'),'y', 'Hit and run');
INSERT INTO COURT_CASE (case_id, date_and_time_began, ongoing, type_of_crime) VALUES ( 8, to_date('October 17, 2014, 03:00:00 PM','Month dd, YYYY, HH:MI:SS PM'),'y', 'Corruption Of Office');
INSERT INTO COURT_CASE (case_id, date_and_time_began, ongoing, type_of_crime) VALUES ( 9, to_date('December 22, 2015, 11:00:00 AM','Month dd, YYYY, HH:MI:SS AM'),'y', 'Mass-Scamming');
INSERT INTO COURT_CASE (case_id, date_and_time_began, cold, type_of_crime) VALUES ( 10, to_date('January 01, 2015, 01:00:00 PM','Month dd, YYYY, HH:MI:SS PM'),'y', 'Fraud');

INSERT INTO PERSONS_INVOLVED (persons_id, name, address, gender, age, suspect, contact_phone_number) VALUES (1, 'Thomas Murphy', '123 Lane Avenue', 'Male', 18, 'y', 0872314543);
INSERT INTO PERSONS_INVOLVED (persons_id, name, address, gender, age, suspect, contact_phone_number) VALUES (2, 'Teresa Flanagan', '123 Lane Avenue', 'Female', 23, 'y', 0872314435);
INSERT INTO PERSONS_INVOLVED (persons_id, name, address, gender, age, suspect, contact_phone_number) VALUES (3, 'Thomas Murphy', '123 Lane Avenue', 'Male', 54, 'y', 0872314543);
INSERT INTO PERSONS_INVOLVED (persons_id, name, address, gender, age, suspect, contact_phone_number) VALUES (4, 'Thomas Murphy', '123 Lane Avenue', 'Male', 60, 'y', 0872314543);
INSERT INTO PERSONS_INVOLVED (persons_id, name, address, gender, age, suspect, contact_phone_number) VALUES (5, 'Thomas Murphy', '123 Lane Avenue', 'Male', 35, 'y', 0872314543);
INSERT INTO PERSONS_INVOLVED (persons_id, name, address, gender, age, suspect, contact_phone_number) VALUES (6, 'Thomas Murphy', '123 Lane Avenue', 'Male', 36, 'y', 0872314543);
INSERT INTO PERSONS_INVOLVED (persons_id, name, address, gender, age, suspect, contact_phone_number) VALUES (7, 'Thomas Murphy', '123 Lane Avenue', 'Male', 35, 'y', 0872314543);
INSERT INTO PERSONS_INVOLVED (persons_id, name, address, gender, age, suspect, contact_phone_number) VALUES (8, 'Thomas Murphy', '123 Lane Avenue', 'Male', 19, 'y', 0872314543);
INSERT INTO PERSONS_INVOLVED (persons_id, name, address, gender, age, suspect, contact_phone_number) VALUES (9, 'Thomas Murphy', '123 Lane Avenue', 'Male', 20, 'y', 0872314543);
INSERT INTO PERSONS_INVOLVED (persons_id, name, address, gender, age, suspect, contact_phone_number) VALUES (10, 'Thomas Murphy', '123 Lane Avenue', 'Male', 27, 'y', 0872314543);

INSERT INTO ENTITIES_INVOLVED (entity_id, name, address, contact_details) VALUES (1, 'Filming International Ltd.', '47 Brookhaven Avenue', '+393 5647-2900 or  go to Brookhaven and ask for Martha.');
INSERT INTO ENTITIES_INVOLVED (entity_id, name, address, contact_details) VALUES (2, 'Warner Bros.', 'Hollywood', '+393 5655-3421');
INSERT INTO ENTITIES_INVOLVED (entity_id, name, address, contact_details) VALUES (3, 'Sports And Health Ltd.', 'Online', 'Entity can only be contacted via skype name: sportH1');
INSERT INTO ENTITIES_INVOLVED (entity_id, name, address, contact_details) VALUES (4, 'Murphy and Sons', '21 Fairview Heights', '+300 8474-9333');
INSERT INTO ENTITIES_INVOLVED (entity_id, name, address, contact_details) VALUES (5, 'Music Corps', '45 Heavens Road', '+393 6637-2830');
INSERT INTO ENTITIES_INVOLVED (entity_id, name, address, contact_details) VALUES (6, 'Entity A', '21 Fairview Heights', '+300 8474-9333');
INSERT INTO ENTITIES_INVOLVED (entity_id, name, address, contact_details) VALUES (7, 'Entity B', '45 Heavens Road', '+393 6637-2830');

INSERT INTO EVIDENCE (evidence_code, description, monetary_value, value_class, date_and_time_found, date_and_time_stored) VALUES (1, 'crowbar', 200, 'D', to_date('March 02, 2011, 12:00:00 PM','Month dd, YYYY, HH:MI:SS PM'), to_date('March 02, 2014, 12:00:00 PM','Month dd, YYYY, HH:MI:SS PM') );
INSERT INTO EVIDENCE (evidence_code, description, monetary_value, value_class, date_and_time_found, date_and_time_stored) VALUES (2, 'bloody handkerchief', 10, 'D', to_date('March 02, 2011, 12:00:00 PM','Month dd, YYYY, HH:MI:SS PM'), to_date('March 02, 2015, 12:00:00 PM','Month dd, YYYY, HH:MI:SS PM') );
INSERT INTO EVIDENCE (evidence_code, description, monetary_value, value_class, date_and_time_found, date_and_time_stored) VALUES (3, 'phonecall record', 1, 'D', to_date('March 02, 2011, 12:00:00 PM','Month dd, YYYY, HH:MI:SS PM'), to_date('March 02, 2015, 12:00:00 PM','Month dd, YYYY, HH:MI:SS PM') );
INSERT INTO EVIDENCE (evidence_code, description, monetary_value, value_class, date_and_time_found, date_and_time_stored) VALUES (4, 'trophy case', 10100, 'B', to_date('March 02, 2011, 12:00:00 PM','Month dd, YYYY, HH:MI:SS PM'), to_date('January 06, 2011, 12:00:00 PM','Month dd, YYYY, HH:MI:SS PM') );
INSERT INTO EVIDENCE (evidence_code, description, monetary_value, value_class, date_and_time_found, date_and_time_stored) VALUES (5, 'sports vehicle', 1200000, 'A', to_date('March 02, 2011, 12:00:00 PM','Month dd, YYYY, HH:MI:SS PM'), to_date('March 02, 2011, 12:00:00 PM','Month dd, YYYY, HH:MI:SS PM') );
INSERT INTO EVIDENCE (evidence_code, description, monetary_value, value_class, date_and_time_found, date_and_time_stored) VALUES (6, 'chair', 50, 'D', to_date('March 02, 2011, 12:00:00 PM','Month dd, YYYY, HH:MI:SS PM'), to_date('March 02, 2011, 12:00:00 PM','Month dd, YYYY, HH:MI:SS PM') );
INSERT INTO EVIDENCE (evidence_code, description, monetary_value, value_class, date_and_time_found, date_and_time_stored) VALUES (7, 'spray can', 20, 'D', to_date('March 02, 2011, 12:00:00 PM','Month dd, YYYY, HH:MI:SS PM'), to_date('March 02, 2011, 12:00:00 PM','Month dd, YYYY, HH:MI:SS PM') );
INSERT INTO EVIDENCE (evidence_code, description, monetary_value, value_class, date_and_time_found, date_and_time_stored) VALUES (8, 'Heart of Africa', 2000000, 'A', to_date('March 02, 2011, 12:00:00 PM','Month dd, YYYY, HH:MI:SS PM'), to_date('March 02, 2011, 12:00:00 PM','Month dd, YYYY, HH:MI:SS PM') );

INSERT INTO INVESTIGATOR (investigator_id, name, address, gender, age, contact_phone_number, court_case_id) VALUES (1, 'Elizabeth Cross', '123 Lane Avenue', 'Female', '25', 0872314543, 1);
INSERT INTO INVESTIGATOR (investigator_id, name, address, gender, age, contact_phone_number, court_case_id) VALUES (2, 'James Musgrave', '124 Lane Avenue', 'Male', '50', 0872314543, 1);
INSERT INTO INVESTIGATOR (investigator_id, name, address, gender, age, contact_phone_number, court_case_id) VALUES (3, 'Sam Beckwith', '125 Lane Avenue', 'Male', '18', 0872314543, 1);
INSERT INTO INVESTIGATOR (investigator_id, name, address, gender, age, contact_phone_number, court_case_id) VALUES (4, 'Michael Henries', '126 Lane Avenue', 'Male', '45', 0872314543, 1);
INSERT INTO INVESTIGATOR (investigator_id, name, address, gender, age, contact_phone_number, court_case_id) VALUES (5, 'Ben Dunne', '126 Lane Avenue', 'Male', '35', 0872314543, 10);
INSERT INTO INVESTIGATOR (investigator_id, name, address, gender, age, contact_phone_number, court_case_id) VALUES (6, 'Test Investigator A', '126 Lane Avenue', 'Male', '45', 0872314543, 1);
INSERT INTO INVESTIGATOR (investigator_id, name, address, gender, age, contact_phone_number, court_case_id) VALUES (7, 'Test Investigator B', '126 Lane Avenue', 'Male', '35', 0872314543, 10);

INSERT INTO OFFICE (office_code, investigator_id, building_address) VALUES (1, 1, '123 Fake Street');
INSERT INTO OFFICE (office_code, investigator_id, building_address) VALUES (2, 2, '124 Fake Street');
INSERT INTO OFFICE (office_code, investigator_id, building_address) VALUES (3, 3, '125 Fake Street');
INSERT INTO OFFICE (office_code, investigator_id, building_address) VALUES (4, 4, '126 Fake Street');
INSERT INTO OFFICE (office_code, building_address) VALUES (5, '123 Fake Street');

INSERT INTO CHECK_OUT (investigator_id, evidence_code, date_and_time_checked_out, date_and_time_returned) VALUES (1, 1, to_date('February 28, 2014, 11:00:00 AM','Month dd, YYYY, HH:MI:SS AM'),to_date('February 28, 2014, 12:00:00 AM','Month dd, YYYY, HH:MI:SS AM'));
INSERT INTO CHECK_OUT (investigator_id, evidence_code, date_and_time_checked_out, date_and_time_returned) VALUES (1, 2, to_date('February 28, 2014, 11:00:00 AM','Month dd, YYYY, HH:MI:SS AM'),to_date('February 28, 2014, 12:00:00 AM','Month dd, YYYY, HH:MI:SS AM'));
INSERT INTO CHECK_OUT (investigator_id, evidence_code, date_and_time_checked_out, date_and_time_returned) VALUES (1, 3, to_date('February 28, 2014, 11:00:00 AM','Month dd, YYYY, HH:MI:SS AM'),to_date('February 28, 2014, 12:00:00 AM','Month dd, YYYY, HH:MI:SS AM'));
INSERT INTO CHECK_OUT (investigator_id, evidence_code, date_and_time_checked_out, date_and_time_returned) VALUES (1, 4, to_date('February 28, 2014, 11:00:00 AM','Month dd, YYYY, HH:MI:SS AM'),to_date('February 28, 2014, 12:00:00 AM','Month dd, YYYY, HH:MI:SS AM'));
INSERT INTO CHECK_OUT (investigator_id, evidence_code, date_and_time_checked_out, date_and_time_returned) VALUES (1, 5, to_date('February 28, 2014, 11:00:00 AM','Month dd, YYYY, HH:MI:SS AM'),to_date('February 28, 2014, 12:00:00 AM','Month dd, YYYY, HH:MI:SS AM'));
INSERT INTO CHECK_OUT (investigator_id, evidence_code, date_and_time_checked_out, date_and_time_returned) VALUES (1, 6, to_date('February 28, 2014, 11:00:00 AM','Month dd, YYYY, HH:MI:SS AM'), null);
INSERT INTO CHECK_OUT (investigator_id, evidence_code, date_and_time_checked_out, date_and_time_returned) VALUES (1, 7, to_date('February 28, 2014, 11:00:00 AM','Month dd, YYYY, HH:MI:SS AM'), null);

INSERT INTO CASE_GROUP(evidence_code, case_id) VALUES (1,1);
INSERT INTO CASE_GROUP(evidence_code, case_id) VALUES (2, 1);
INSERT INTO CASE_GROUP(evidence_code, case_id) VALUES (3,1);
INSERT INTO CASE_GROUP(evidence_code, case_id) VALUES (4,1);
INSERT INTO CASE_GROUP(evidence_code, case_id) VALUES (5,1);
INSERT INTO CASE_GROUP(evidence_code, case_id) VALUES (6,1);
INSERT INTO CASE_GROUP(evidence_code, case_id) VALUES (7,1);
INSERT INTO CASE_GROUP(evidence_code, case_id) VALUES (2,2);
INSERT INTO CASE_GROUP(evidence_code, case_id) VALUES (2, 3);
INSERT INTO CASE_GROUP(evidence_code, case_id) VALUES (4,2);
INSERT INTO CASE_GROUP(evidence_code, case_id) VALUES (2,4);
INSERT INTO CASE_GROUP(evidence_code, case_id) VALUES (3,3);
INSERT INTO CASE_GROUP(evidence_code, case_id) VALUES (8,4);

INSERT INTO ENTITY_APPEARANCE(case_id, entity_id) VALUES (1,1);
INSERT INTO ENTITY_APPEARANCE(case_id, entity_id) VALUES (1,2);
INSERT INTO ENTITY_APPEARANCE(case_id, entity_id) VALUES (1,3);
INSERT INTO ENTITY_APPEARANCE(case_id, entity_id) VALUES (2,1);
INSERT INTO ENTITY_APPEARANCE(case_id, entity_id) VALUES (2,2);
INSERT INTO ENTITY_APPEARANCE(case_id, entity_id) VALUES (2,3);
INSERT INTO ENTITY_APPEARANCE(case_id, entity_id) VALUES (1,4);
INSERT INTO ENTITY_APPEARANCE(case_id, entity_id) VALUES (1,5);

INSERT INTO PERSON_APPEARANCE(case_id, persons_id) VALUES (1,1);
INSERT INTO PERSON_APPEARANCE(case_id, persons_id) VALUES (1,2);
INSERT INTO PERSON_APPEARANCE(case_id, persons_id) VALUES (1,3);
INSERT INTO PERSON_APPEARANCE(case_id, persons_id) VALUES (2,1);
INSERT INTO PERSON_APPEARANCE(case_id, persons_id) VALUES (2,2);
INSERT INTO PERSON_APPEARANCE(case_id, persons_id) VALUES (2,3);
INSERT INTO PERSON_APPEARANCE(case_id, persons_id) VALUES (1,4);
INSERT INTO PERSON_APPEARANCE(case_id, persons_id) VALUES (1,5);


/*
INNER JOINS
*/

--Find all currently occupied offices--
SELECT building_address FROM Office JOIN Investigator ON investigator.investigator_id=office.investigator_id;

--Find all currently checked-out pieces of evidence--
SELECT evidence.description FROM check_out JOIN evidence ON check_out.evidence_code = evidence.evidence_code where check_out.date_and_time_returned is null;

--Find all investigators on a court case--
SELECT name FROM investigator JOIN court_case ON investigator.court_case_id=court_case.case_id;

-- All evidence that belongs to both an ongoing case--
SELECT evidence.description FROM evidence JOIN case_group ON evidence.evidence_code = case_group.evidence_code JOIN court_case ON case_group.case_id = court_case.case_id where court_case.ongoing = 'y';

/*
OUTER JOINS
*/

--Court cases that only involve legal entities--
--All evidence in a court case that involves a specific persons_involved--
--All investigators that have checked out a piece of evidence that they are not on the case of (where evidence_id in (...))--

--All persons and whatever court cases they appear in--
select persons_involved.name, persons_involved.persons_id, court_case.case_id from persons_involved left outer join person_appearance on person_appearance.persons_id = persons_involved.persons_id left outer join court_case on person_appearance.case_id = court_case.case_id;

--All past check-outs an investigator has made, excluding currently checked out items--
select investigator.name, evidence.description from investigator left outer join check_out on investigator.investigator_id = check_out.investigator_id left outer join evidence on check_out.evidence_code = evidence.evidence_code where check_out.date_and_time_returned IS NOT NULL;

--All court cases with a combined evidence value above one million--
select court_case.case_id, SUM(monetary_value) AS total_cost from evidence right outer join case_group on 
evidence.evidence_code = case_group.evidence_code right outer join court_case on case_group.case_id = court_case.case_id 
GROUP BY (court_case.case_id, case_group.case_id) having SUM(monetary_value) > 1000000 ;

--Every court case a piece of evidence belongs to--
select evidence.description, court_case.case_id from case_group right outer join court_case on 
case_group.case_id = court_case.case_id right outer join evidence on evidence.evidence_code = case_group.evidence_code;

--All investigators and all offices--
select * from investigator full outer join office on office.investigator_id = investigator.investigator_id;

--Court cases and legal entities--
select entities_involved.name, entities_involved.entity_id, court_case.case_id from entities_involved full outer join entity_appearance on entity_appearance.entity_id = entities_involved.entity_id left outer join court_case on entity_appearance.case_id = court_case.case_id;


/*
ROLLUP
*/

-- Find value of all evidence in all court cases-- 
select court_case.case_id, SUM(evidence.monetary_value) from case_group inner join court_case on 
case_group.case_id = court_case.case_id inner join evidence on evidence.evidence_code = case_group.evidence_code GROUP BY ROLLUP(court_case.case_id);

/*
SUBQUERIES
*/

-- Get the value of all value class A evidence items--
select evidence.evidence_code, evidence.description, evidence.monetary_value from evidence where evidence_code in (select evidence_code from evidence where value_class = 'A');

--All court cases without any evidence--
select * from court_case where case_id NOT IN (select case_id from case_group);

--All investigators working on cold cases--
select * from investigator where court_case_id  in (select case_id from court_case where cold = 'y');

--All investigators who have currently checked out at least one piece of evidence--
select * from investigator where investigator_id  in (select investigator_id from check_out);

--Identify any persons involved join rows that are missing data, thus identifying rows that break the foreign key constraint (Which should be deleted)--
select * from person_appearance where persons_id NOT IN (select persons_id from persons_involved);

--5 PL/SQL queries in one package--

-- provide 1 (case) id, output all investigators and evidence on that case --
-- provide 1 (person) id, output all of the investigators on their cases and evidence on their cases --
-- provide 1 investigator id, output the total value of evidence they have checked out--
-- output all pieces of evidence that belong to cold cases --
-- iterate all court cases and find their total evidence value, but rollback if they're not ongoing and set to zero--


CREATE OR REPLACE PACKAGE Task7 AS
PROCEDURE caseId(idNumber IN NUMBER);
PROCEDURE valueBracket(evidenceValue IN NUMBER);
PROCEDURE investigatorId(invIdNumber IN NUMBER);
PROCEDURE allColdEvidence;
PROCEDURE caseTotal;
END;
/

CREATE OR REPLACE PACKAGE BODY Task7 AS

PROCEDURE caseId(idNumber NUMBER)
IS
CURSOR case_cursor IS SELECT court_case.case_id, investigator.name, evidence.evidence_code from court_case join case_group on case_group.case_id = court_case.case_id join evidence on case_group.evidence_code = evidence.evidence_code join investigator on investigator.court_case_id = court_case.case_id;
case_cursor_data case_cursor %ROWTYPE; 
BEGIN
OPEN case_cursor;
fetch case_cursor into case_cursor_data; 
WHILE case_cursor%FOUND LOOP
if(case_cursor_data.case_id = idNumber) then
DBMS_OUTPUT.PUT_LINE(case_cursor_data.evidence_code || case_cursor_data.name);
end if;
FETCH case_cursor INTO case_cursor_data;
END LOOP; 
CLOSE case_cursor;
END caseId;


PROCEDURE valueBracket(evidenceValue IN NUMBER)
IS
total NUMBER(4);
BEGIN
if evidenceValue < 1000 THEN
DBMS_OUTPUT.PUT_LINE('Low value evidence');
ELSIF evidenceValue < 10000 THEN
DBMS_OUTPUT.PUT_LINE('Mid value evidence');
ELSE
DBMS_OUTPUT.PUT_LINE('Very high value evidence!');
END IF;
END valueBracket;

PROCEDURE investigatorId(invIdNumber NUMBER)
IS
idno NUMBER;

CURSOR inv_cursor IS SELECT investigator.investigator_id, investigator.name, SUM(evidence.monetary_value) as total from evidence join check_out on check_out.evidence_code = evidence.evidence_code join investigator on investigator.investigator_id = check_out.investigator_id group by (investigator.investigator_id, investigator.name);
inv_cursor_data inv_cursor %ROWTYPE; 
BEGIN

idno := invIdNumber;
OPEN inv_cursor;
fetch inv_cursor into inv_cursor_data; 
WHILE inv_cursor%FOUND LOOP
IF(inv_cursor_data.investigator_id = idno) THEN
DBMS_OUTPUT.PUT_LINE(inv_cursor_data.total);
END IF;
FETCH inv_cursor INTO inv_cursor_data;
END LOOP; 
CLOSE inv_cursor;
END investigatorId;

PROCEDURE allColdEvidence
IS
CURSOR cold_case_cursor IS SELECT evidence.description from evidence join case_group on case_group.evidence_code = evidence.evidence_code join court_case on case_group.case_id = court_case.case_id where court_case.cold = 'y';
cold_case_cursor_data cold_case_cursor %ROWTYPE; 
BEGIN
OPEN cold_case_cursor;
fetch cold_case_cursor into cold_case_cursor_data; 
WHILE cold_case_cursor%FOUND LOOP
DBMS_OUTPUT.PUT_LINE(cold_case_cursor_data.description);
FETCH cold_case_cursor INTO cold_case_cursor_data;
END LOOP; 
CLOSE cold_case_cursor;
END allColdEvidence;

-- cursor, savepoint and rollback iterate all court cases and find their total evidence value, but rollback if they're not ongoing and say "no value" instead --
PROCEDURE caseTotal
IS
CURSOR all_case_cursor IS SELECT court_case.case_id, court_case.ongoing, SUM(evidence.monetary_value) as cost from evidence join case_group on case_group.evidence_code = evidence.evidence_code join court_case on case_group.case_id = court_case.case_id group by (court_case.case_id, court_case.ongoing);
all_case_cursor_data all_case_cursor %ROWTYPE; 
total NUMBER;
skip VARCHAR2(1);
zero_val_error EXCEPTION;
BEGIN
skip := 'n';
OPEN all_case_cursor;
fetch all_case_cursor into all_case_cursor_data; 
WHILE all_case_cursor%FOUND LOOP
SAVEPOINT beforeCalc;
total := all_case_cursor_data.cost;
if(skip = 'y') then
DBMS_OUTPUT.PUT_LINE('No value');
skip := 'n';
elsif(total = 0) then
raise zero_val_error;
else
DBMS_OUTPUT.PUT_LINE(total);
end if;
FETCH all_case_cursor INTO all_case_cursor_data;
END LOOP; 
CLOSE all_case_cursor;
EXCEPTION
WHEN zero_val_error THEN
skip := 'y';
ROLLBACK TO beforeCalc;
END caseTotal;
END;
/


-- 2 PL/SQL functions--

--How many days a piece of evidence has been stored for--
CREATE OR REPLACE FUNCTION timespan(evidence_code IN NUMBER) RETURN NUMBER
IS
days NUMBER;
CURSOR evidence_cursor IS select extract(day from systimestamp  - to_date(evidence.date_and_time_found)) as days from evidence;
evidence_cursor_data evidence_cursor %ROWTYPE; 
BEGIN
OPEN evidence_cursor;
fetch evidence_cursor into evidence_cursor_data; 
WHILE evidence_cursor%FOUND LOOP
days := evidence_cursor_data.days;
FETCH evidence_cursor INTO evidence_cursor_data;
END LOOP; 
CLOSE evidence_cursor;
RETURN days;
END timespan;

-- The number of times a piece of evidence has been checked out--
CREATE OR REPLACE FUNCTION times_checked_out(evidence_code IN NUMBER) RETURN NUMBER
IS
checkouts NUMBER;
CURSOR evidence_cursor IS select evidence.evidence_code, count(check_out.evidence_code) as checkouts from evidence left outer join check_out on check_out.evidence_code = evidence.evidence_code group by (evidence.evidence_code);
evidence_cursor_data evidence_cursor %ROWTYPE; 
BEGIN
OPEN evidence_cursor;
fetch evidence_cursor into evidence_cursor_data; 
WHILE evidence_cursor%FOUND LOOP
if(evidence_code = evidence_cursor_data.evidence_code) then
checkouts := evidence_cursor_data.checkouts;
end if;
FETCH evidence_cursor INTO evidence_cursor_data;
END LOOP; 
CLOSE evidence_cursor;
RETURN checkouts;
END times_checked_out;

--3 triggers one before and after--

-- Before checking out a piece of evidence, warn user if it has already been checked out--
CREATE OR REPLACE TRIGGER check_out_already
BEFORE INSERT ON CHECK_OUT
FOR EACH ROW
DECLARE CURSOR checkout_cursor IS select * from check_out where DATE_AND_TIME_RETURNED IS NULL;
checkout_cursor_data checkout_cursor %ROWTYPE; 
checked_out_error EXCEPTION;
BEGIN
OPEN checkout_cursor;
fetch checkout_cursor into checkout_cursor_data; 
WHILE checkout_cursor%FOUND LOOP
if(:new.evidence_code = checkout_cursor_data.evidence_code) then
DBMS_OUTPUT.PUT_LINE('Warning, this evidence has already been checked out.');
end if;
FETCH checkout_cursor INTO checkout_cursor_data;
END LOOP; 
CLOSE checkout_cursor;
END;
/
 
-- Classify evidence value if a value is not provided--
CREATE OR REPLACE TRIGGER EVIDENCE_VALUE_CLASS
BEFORE INSERT ON EVIDENCE
FOR EACH ROW
BEGIN
IF(:new.value_class IS NULL )
  THEN
	IF(:new.monetary_value <100) THEN
		:new.value_class := 'D';
	ELSIF(:new.monetary_value <1000) THEN
		:new.value_class := 'C';
	ELSIF(:new.monetary_value <10000) THEN
		:new.value_class := 'B';
	ELSE
		:new.value_class := 'A';
	END IF;
  END IF;
 END;
 /

-- Before re-assigning an office, check to see if it is currently occupied and warn if it is--
CREATE OR REPLACE TRIGGER office_currently_occupied
AFTER UPDATE ON OFFICE
FOR EACH ROW
BEGIN
if(:new.investigator_id IS NOT NULL) then
DBMS_OUTPUT.PUT_LINE('Warning, this office is currently occupied.');
end if;
END;
/

/*
This section contains miscellaneous execution statements used within the Final Project Document

SELECT * FROM COURT_CASE;
SELECT * FROM PERSONS_INVOLVED;
SELECT * FROM ENTITIES_INVOLVED;
SELECT * FROM EVIDENCE;
SELECT * FROM INVESTIGATOR;
SELECT * FROM OFFICE;
SELECT * FROM CHECK_OUT;
SELECT * FROM CASE_GROUP;
SELECT * FROM ENTITY_APPEARANCE;
SELECT * FROM PERSON_APPEARANCE;

set serveroutput on
BEGIN
 Task7.caseId(1);
 Task7.valueBracket(1);
 Task7.investigatorId(1);
 Task7.allColdEvidence;
 Task7.caseTotal;
END;
/

set serveroutput on
DECLARE
num NUMBER;
BEGIN
 num := timespan(1);
 DBMS_OUTPUT.PUT_LINE(num);
END;
/

set serveroutput on
DECLARE
num NUMBER;
BEGIN
 num := times_checked_out(1);
 DBMS_OUTPUT.PUT_LINE(num);
END;
/

INSERT INTO CHECK_OUT (investigator_id, evidence_code, date_and_time_checked_out, date_and_time_returned) VALUES (2, 7, to_date('February 28, 2014, 11:00:00 AM','Month dd, YYYY, HH:MI:SS AM'), null);
INSERT INTO EVIDENCE (evidence_code, description, monetary_value, date_and_time_found, date_and_time_stored) VALUES (9, 'Flag Pole', 2000, to_date('March 02, 2011, 12:00:00 PM','Month dd, YYYY, HH:MI:SS PM'), to_date('March 02, 2011, 12:00:00 PM','Month dd, YYYY, HH:MI:SS PM') );
select * from evidence where evidence_code = 9;

UPDATE office SET investigator_id = 5 where office_code = 4;

*/