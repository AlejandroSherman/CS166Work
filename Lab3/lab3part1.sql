DROP TABLE if EXISTS Professor CASCADE;
DROP TABLE if EXISTS Project CASCADE;
DROP TABLE if EXISTS Dept CASCADE;
DROP TABLE if EXISTS Graduate CASCADE;
DROP TABLE if EXISTS Work_in CASCADE;
DROP TABLE if EXISTS Work_dept CASCADE;
DROP TABLE if EXISTS Work_proj CASCADE;

CREATE TABLE Professor (
             ssn CHAR(11) NOT NULL,
             name CHAR(30),
             age INTEGER,
             rank CHAR(30),
             speciality CHAR(30),
             PRIMARY KEY(ssn));

CREATE TABLE Project (
             pno CHAR(11) NOT NULL,
             sponsor CHAR(30),
             start_date DATE,
             end_date DATE,
             budget INTEGER,
             manage CHAR(11),
             PRIMARY KEY(pno),
             FOREIGN KEY(manage) REFERENCES Professor(ssn));

CREATE TABLE Dept (
             dno CHAR(11) NOT NULL,
             dname CHAR(30),
             office CHAR(30),
             runs CHAR(11),
             PRIMARY KEY(dno),
             FOREIGN KEY(runs) REFERENCES Professor(ssn));

CREATE TABLE Graduate (
             ssn CHAR(11) NOT NULL,
             name CHAR(30),
             age INTEGER,
             deg_pg CHAR(30),
             major CHAR(11),
             advise CHAR(11),
             PRIMARY KEY(ssn),
             FOREIGN KEY(major) REFERENCES Dept(dno),
             FOREIGN KEY(advise) REFERENCES Graduate(ssn));

CREATE TABLE Work_in (
             ssn CHAR(11) NOT NULL,
             pno CHAR(11) NOT NULL,
             PRIMARY KEY(ssn, pno),
             FOREIGN KEY(ssn) REFERENCES Professor(ssn),
             FOREIGN KEY(pno) REFERENCES Project(pno));

CREATE TABLE Work_dept (
             ssn CHAR(11) NOT NULL,
             dno CHAR(11) NOT NULL,
             time_pc INTEGER,
             PRIMARY KEY(ssn, dno),
             FOREIGN KEY(ssn) REFERENCES Professor(ssn),
             FOREIGN KEY(dno) REFERENCES Dept(dno));

CREATE TABLE Work_proj (
             pno CHAR(11) NOT NULL,
             ssn CHAR(11) NOT NULL,
             since DATE,
             supervise CHAR(11),
             PRIMARY KEY(pno, ssn),
             FOREIGN KEY(pno) REFERENCES Project(pno),
             FOREIGN KEY(ssn) REFERENCES Graduate(ssn),
             FOREIGN KEY(supervise) REFERENCES Professor(ssn));
