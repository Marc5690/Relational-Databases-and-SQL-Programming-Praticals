CREATE TABLE Supplier (
  supplierNum CHAR(2) PRIMARY KEY,
  name CHAR(10) NOT NULL,
  status NUMBER(4) NOT NULL,
  city VARCHAR(10) NOT NULL
);

INSERT INTO Supplier VALUES ('S1','Smith',20,'London');
INSERT INTO Supplier VALUES ('S2','Jones',10,'Paris');
INSERT INTO Supplier VALUES ('S3','Blake',20,'Paris');
INSERT INTO Supplier VALUES ('S4','Clark',20,'London');
INSERT INTO Supplier VALUES ('S5','Adams',30,'Athens');

CREATE TABLE Parts (
  partNum CHAR(2) PRIMARY KEY,
  name CHAR(10) NOT NULL,
  colour CHAR(8) NOT NULL,
  weight NUMBER(3,1) NOT NULL,
  city VARCHAR(10) NOT NULL
);

INSERT INTO Parts VALUES ('P1','Nut','Red','12.0','London');
INSERT INTO Parts VALUES ('P2','Bolt','Green','17.0','Paris');
INSERT INTO Parts VALUES ('P3','Screw','Blue','17.0','Oslo');
INSERT INTO Parts VALUES ('P4','Screw','Red','14.0','London');
INSERT INTO Parts VALUES ('P5','Cam','Blue','12.0','Paris');
INSERT INTO Parts VALUES ('P6','Cog','Red','19.0','London');

CREATE TABLE Supplies (
  supplierNum CHAR(2) NOT NULL,
  partNum CHAR(2) NOT NULL,
  quantity NUMBER(6) NOT NULL,
  PRIMARY KEY (supplierNum, partNum)
);

INSERT INTO Supplies VALUES ('S1','P1',300);
INSERT INTO Supplies VALUES ('S1','P2',200);
INSERT INTO Supplies VALUES ('S1','P3',400);
INSERT INTO Supplies VALUES ('S1','P4',200);
INSERT INTO Supplies VALUES ('S1','P5',100);
INSERT INTO Supplies VALUES ('S1','P6',100);
INSERT INTO Supplies VALUES ('S2','P1',300);
INSERT INTO Supplies VALUES ('S2','P2',400);
INSERT INTO Supplies VALUES ('S3','P2',200);
INSERT INTO Supplies VALUES ('S4','P2',200);
INSERT INTO Supplies VALUES ('S4','P4',300);
INSERT INTO Supplies VALUES ('S4','P5',400);

COMMIT;