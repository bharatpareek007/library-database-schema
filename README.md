#  Library Management System – Database Schema

This repository contains the database schema and ER diagram for a *Library Management System*.  
It was created as part of my *SQL Developer Internship – Task 1 (Database Setup and Schema Design)*.

The main goal of this task was to design a properly structured database, understand relationships between tables, and practice writing SQL DDL commands in MySQL Workbench.


#   Project Summary

This database is designed to help manage a library efficiently,  
It includes tables for:

- Books  
- Authors  
- Publishers  
- Members  
- Loans  
- Book–Author relationships (Many-to-Many)

The database is normalized to avoid duplication and ensure data integrity.


#  Tools & Technologies

- *MySQL Workbench 8.0*
- *MySQL Server*
- *EER Diagram Tool*
- SQL (DDL)


#  Database Tables

1. AUTHORS  
Stores basic information about book authors.

2. PUBLISHERS  
Contains publisher details.

3. MEMBERS  
Stores library member information.

4. BOOKS  
Contains details about each book.

5. BOOK_AUTHORS  
Junction table to handle the many-to-many relationship between books and authors.

6. LOANS  
Keeps track of which member has borrowed which book and for how long.


#  Concepts Implemented

- Primary & Foreign Keys  
- Composite Keys  
- One-to-Many relationships  
- Many-to-Many relationships  
- AUTO_INCREMENT  
- Normalization  
- Referential integrity using **ON UPDATE** / **ON DELETE** rules  


#  SQL Script

All SQL commands for creating the database and tables are in:

👉 *`library_schema.sql`*

To run it inside MySQL Workbench, use:

```sql
SOURCE library_schema.sql;

⭐ AUTHOR
   BHARAT PAREEK
