/*This file containts my sql statements for question 3.18*/
DROP TABLE if EXISTS Artists CASCADE;
DROP TABLE if EXISTS Artwork CASCADE;
DROP TABLE if EXISTS Customer CASCADE;
DROP TABLE if EXISTS Groups CASCADE;
DROP TABLE if EXISTS Likes1 CASCADE;
DROP TABLE if EXISTS Likes2 CASCADE;
DROP TABLE if EXISTS Classified_as CASCADE;

CREATE TABLE Artists (
             name_a CHAR(30) NOT NULL,
             birthplace CHAR(30),
             age INTEGER,
             style CHAR(30),
             PRIMARY KEY(name_a));

CREATE TABLE Artwork (
             title CHAR(30) NOT NULL,
             price INTEGER,
             type CHAR(30),
             year DATE,
             artist CHAR(30),
             created_by CHAR(30),
             PRIMARY KEY(title),
             FOREIGN KEY(created_by) REFERENCES Artists(name_a));

CREATE TABLE Customer (
             name_c CHAR(30) NOT NULL,
             address CHAR(30),
             money_spent INTEGER,
             PRIMARY KEY(name_c));

CREATE TABLE Groups (
             name_g CHAR(30) NOT NULL,
             PRIMARY KEY(name_g));

CREATE TABLE Likes1 (
             name_a CHAR(30) NOT NULL,
             name_c CHAR(30) NOT NULL,
             PRIMARY KEY(name_a, name_c),
             FOREIGN KEY(name_a) REFERENCES Artists(name_a),
             FOREIGN KEY(name_c) REFERENCES Customer(name_c));

CREATE TABLE Likes2 (
             name_c CHAR(30) NOT NULL,
             name_g CHAR(30) NOT NULL,
             PRIMARY KEY(name_c, name_g),
             FOREIGN KEY(name_c) REFERENCES Customer(name_c),
             FOREIGN KEY(name_g) REFERENCES Groups(name_g));

 CREATE TABLE Classified_as (
             title CHAR(30) NOT NULL,
             name_g CHAR(30) NOT NULL,
             PRIMARY KEY(title, name_g),
             FOREIGN KEY(title) REFERENCES Artwork(title),
             FOREIGN KEY(name_g) REFERENCES Groups(name_g));
