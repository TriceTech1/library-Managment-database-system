-- Library Management System Database
-- Purpose: Manages books, members, loans, and authors for a public library

-- Create Authors table
CREATE TABLE Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    birth_date DATE,
    nationality VARCHAR(50),
    UNIQUE (first_name, last_name, birth_date)
) COMMENT 'Stores author information';

-- Create Books table
CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    isbn VARCHAR(13) NOT NULL UNIQUE,
    title VARCHAR(255) NOT NULL,
    publication_year INT,
    publisher VARCHAR(100),
    total_copies INT NOT NULL DEFAULT 1,
    available_copies INT NOT NULL DEFAULT 1,
    CHECK (available_copies <= total_copies),
    CHECK (available_copies >= 0)
) COMMENT 'Stores book information';

-- Create Book_Authors (M-M relationship between Books and Authors)
CREATE TABLE Book_Authors (
    book_id INT,
    author_id INT,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id) ON DELETE CASCADE,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id) ON DELETE CASCADE
) COMMENT 'Junction table for book-author relationships';

-- Create Members table
CREATE TABLE Members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    join_date DATE NOT NULL DEFAULT CURRENT_DATE,
    address VARCHAR(255)
) COMMENT 'Stores library member information';

-- Create Loans table (1-M relationship: one book can have many loans)
CREATE TABLE Loans (
    loan_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT NOT NULL,
    member_id INT NOT NULL,
    loan_date DATE NOT NULL DEFAULT CURRENT_DATE,
    due_date DATE NOT NULL,
    return_date DATE,
    fine_amount DECIMAL(10,2) DEFAULT 0.00,
    FOREIGN KEY (book_id) REFERENCES Books(book_id) ON DELETE RESTRICT,
    FOREIGN KEY (member_id) REFERENCES Members(member_id) ON DELETE RESTRICT,
    CHECK (due_date > loan_date),
    CHECK (fine_amount >= 0)
) COMMENT 'Tracks book loans and returns';

-- Create Indexes for better query performance
CREATE INDEX idx_loans_book_id ON Loans(book_id);
CREATE INDEX idx_loans_member_id ON Loans(member_id);
CREATE INDEX idx_books_isbn ON Books(isbn);
