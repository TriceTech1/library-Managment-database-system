**Library Management System Database**
**Description**
This project implements a MySQL database for a Library Management System. It manages:

Books and their authors (many-to-many relationship)
Library members
Book loans and returns
Book inventory tracking

The database includes proper constraints (PK, FK, NOT NULL, UNIQUE, CHECK) and indexes for performance.
Setup and Installation

Install MySQL if not already installed
Create a new database:

CREATE DATABASE library_management;


Use the database:

USE library_management;


Import the SQL file:

SOURCE library_management.sql;


Verify the tables:

SHOW TABLES;

ERD
[Note: Create an ERD using tools like MySQL Workbench or draw.io and save as erd_diagram.png]
Repository Structure

library_management.sql: Main database schema file
erd_diagram.png: Entity Relationship Diagram
README.md: Project documentation

