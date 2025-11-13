-- 1. Create and select the Database
-- Drops the database if it already exists to ensure a clean start
DROP DATABASE IF EXISTS library_schema;
CREATE DATABASE library_schema;
USE library_schema;

---

-- 2. Create AUTHORS Table
-- Stores information about book authors.
CREATE TABLE AUTHORS (
    author_id INT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    nationality VARCHAR(50),
    PRIMARY KEY (author_id)
);

-- 3. Create PUBLISHERS Table
-- Stores information about book publishers.
CREATE TABLE PUBLISHERS (
    publisher_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) UNIQUE NOT NULL, -- Publisher names should be unique
    address VARCHAR(255),
    PRIMARY KEY (publisher_id)
);

-- 4. Create MEMBERS Table
-- Stores information about library members.
CREATE TABLE MEMBERS (
    member_id INT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL, -- Email is a good unique identifier
    phone_number VARCHAR(15),
    join_date DATE NOT NULL,
    PRIMARY KEY (member_id)
);

-- 5. Create BOOKS Table
-- Stores details about individual book titles.
CREATE TABLE BOOKS (
    book_id INT NOT NULL AUTO_INCREMENT,
    isbn CHAR(13) UNIQUE NOT NULL, -- ISBN is the unique identifier for a book
    title VARCHAR(255) NOT NULL,
    publication_year YEAR,
    publisher_id INT NOT NULL, -- Foreign Key to PUBLISHERS table
    PRIMARY KEY (book_id),
    FOREIGN KEY (publisher_id) REFERENCES PUBLISHERS(publisher_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT -- Do not allow deleting a publisher if books still reference it
);

-- 6. Create BOOK_AUTHORS Table (Junction Table)
-- Handles the Many-to-Many relationship between BOOKS and AUTHORS.
CREATE TABLE BOOK_AUTHORS (
    book_id INT NOT NULL,
    author_id INT NOT NULL,
    PRIMARY KEY (book_id, author_id), -- Composite Primary Key
    FOREIGN KEY (book_id) REFERENCES BOOKS(book_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE, -- If a book is deleted, delete its author relationship
    FOREIGN KEY (author_id) REFERENCES AUTHORS(author_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

-- 7. Create LOANS Table
-- Records every time a book is borrowed.
CREATE TABLE LOANS (
    loan_id INT NOT NULL AUTO_INCREMENT,
    book_id INT NOT NULL, -- Foreign Key to BOOKS table
    member_id INT NOT NULL, -- Foreign Key to MEMBERS table
    loan_date DATE NOT NULL,
    due_date DATE NOT NULL,
    return_date DATE, -- NULL until the book is returned
    PRIMARY KEY (loan_id),
    FOREIGN KEY (book_id) REFERENCES BOOKS(book_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    FOREIGN KEY (member_id) REFERENCES MEMBERS(member_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);