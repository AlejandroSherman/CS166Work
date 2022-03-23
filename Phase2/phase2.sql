/*
GROUP 16: Phase 2 Submission
Alejandro method as a backup
Names:
	Alejandro Sherman (asher011, SID: 862062898)
	Briana McGhee (bmcgh001, SID: 861295405)
*/
DROP TABLE if EXISTS User_ CASCADE;
DROP TABLE if EXISTS Message CASCADE;
DROP TABLE if EXISTS Work_Experience CASCADE;
DROP TABLE if EXISTS Education_Details CASCADE;
DROP TABLE if EXISTS Connection CASCADE;

CREATE TABLE User_ (
             userid CHAR(10) NOT NULL UNIQUE,
             name CHAR(50),
             password CHAR(10) NOT NULL,
             email CHAR(50) NOT NULL,
             dateofbirth DATE,
             PRIMARY KEY(userid));

CREATE TABLE Message (
             messageid INTEGER NOT NULL UNIQUE,
             contents TEXT NOT NULL,
             sendtime TIMESTAMP NOT NULL,
             status CHAR(30) NOT NULL,
             deletestatus INTEGER,
             senderid CHAR(10) NOT NULL,
             receiverid CHAR(10) NOT NULL,
             PRIMARY KEY(messageid),
             FOREIGN KEY(senderid) REFERENCES User_(userid),
             FOREIGN KEY(receiverid) REFERENCES User_(userid));

CREATE TABLE Work_Experience (
             company CHAR(50) NOT NULL,
             role CHAR(50) NOT NULL,
             location CHAR(50),
             startdate DATE,
             enddate DATE,
             userid CHAR(10) NOT NULL,
             PRIMARY KEY(company, role, startdate, userid),
             FOREIGN KEY(userid) REFERENCES User_(userid));

CREATE TABLE Education_Details (
             institutionname CHAR(50) NOT NULL,
             major CHAR(50) NOT NULL,
             degree CHAR(50) NOT NULL,
             startyear DATE,
             endyear DATE,
             userid CHAR(10) NOT NULL,
             PRIMARY KEY(major, degree, userid),
             FOREIGN KEY(userid) REFERENCES User_(userid));

CREATE TABLE Connection (
             connectionid CHAR(10) NOT NULL,
             status CHAR(30) NOT NULL,
             userid CHAR(10) NOT NULL,
             PRIMARY KEY(connectionid, userid),
             FOREIGN KEY(userid) REFERENCES User_(userid));
