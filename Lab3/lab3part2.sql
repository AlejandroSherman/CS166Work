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
