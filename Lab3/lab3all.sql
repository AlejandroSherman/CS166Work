/*problem 1*/
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

/*problem 2*/
DROP TABLE if EXISTS Musicians CASCADE;
DROP TABLE if EXISTS Album CASCADE;
DROP TABLE if EXISTS Instrument CASCADE;
DROP TABLE if EXISTS Songs CASCADE;
DROP TABLE if EXISTS Place CASCADE;
DROP TABLE if EXISTS Telephone CASCADE;
DROP TABLE if EXISTS Plays CASCADE;
DROP TABLE if EXISTS Perform CASCADE;
DROP TABLE if EXISTS Lives CASCADE;

CREATE TABLE Musicians (
             ssn CHAR(11) NOT NULL,
             name CHAR(30),
             PRIMARY KEY(ssn));

CREATE TABLE Album (
             albumID CHAR(11) NOT NULL,
             copyright_date DATE,
             speed INTEGER,
             title CHAR(30),
             producer CHAR(11),
             PRIMARY KEY(albumID),
             FOREIGN KEY(producer) REFERENCES Musicians(ssn));

CREATE TABLE Instrument (
             instrID CHAR(11) NOT NULL,
             dname CHAR(30),
             key CHAR(30),
             PRIMARY KEY(instrID));

CREATE TABLE Songs (
             songID CHAR(11) NOT NULL,
             title CHAR(30),
             author CHAR(30),
             appears CHAR(11),
             PRIMARY KEY(songID),
             FOREIGN KEY(appears) REFERENCES Album(albumID));

CREATE TABLE Place (
             address CHAR(30) NOT NULL,
             PRIMARY KEY(address));

CREATE TABLE Telephone (
             phone_no INTEGER,
             home CHAR(30),
             PRIMARY KEY(phone_no),
             FOREIGN KEY(home) REFERENCES Place(address));

CREATE TABLE Plays (
             ssn CHAR(11) NOT NULL,
             instrID CHAR(11) NOT NULL,
             PRIMARY KEY(ssn, instrID),
             FOREIGN KEY(ssn) REFERENCES Musicians(ssn),
             FOREIGN KEY(instrID) REFERENCES Instrument(instrID));

CREATE TABLE Perform (
             ssn CHAR(11) NOT NULL,
             songID CHAR(11) NOT NULL,
             PRIMARY KEY(ssn, songID),
             FOREIGN KEY(ssn) REFERENCES Musicians(ssn),
             FOREIGN KEY(songID) REFERENCES Songs(songID));

CREATE TABLE Lives (
             ssn CHAR(11) NOT NULL,
             address CHAR(30) NOT NULL,
             PRIMARY KEY(ssn, address),
             FOREIGN KEY(ssn) REFERENCES Musicians(ssn),
             FOREIGN KEY(address) REFERENCES Place(address));
