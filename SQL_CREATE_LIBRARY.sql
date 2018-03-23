CREATE DATABASE db_library;
USE db_library;
CREATE TABLE tbl_Book (
	Book_ID INT PRIMARY KEY,
	Title VARCHAR(200) NOT NULL,
	PublisherName VARCHAR(100) NOT NULL,
);

CREATE TABLE tbl_Book_Authors (
	Book_ID INT NOT NULL CONSTRAINT fk_Authors_book_id FOREIGN KEY REFERENCES
	tbl_book(book_id),
	AuthorName VARCHAR(100) NOT NULL
);

CREATE TABLE tbl_Publisher (
	PublisherName VARCHAR(100) NOT NULL,
	[Address] VARCHAR(200) NULL,
	Phone VARCHAR(50) NULL
);



CREATE TABLE tbl_Book_Loans (
	Book_ID INT NOT NULL CONSTRAINT fk_loans_book_id FOREIGN KEY REFERENCES
	tbl_book(book_id),
	Branch_ID INT NOT NULL CONSTRAINT fk_loans_branch_id FOREIGN KEY REFERENCES
	tbl_Library_Branch(Branch_ID),
	CardNO VARCHAR(30) NOT NULL CONSTRAINT fk_loans_cardno_id FOREIGN KEY REFERENCES
	tbl_borrower(CardNO),
	DateOut VARCHAR(50) NOT NULL,
	DueDate VARCHAR(50) NOT NULL
);

CREATE TABLE tbl_Book_Copies (
	BookID INT NOT NULL CONSTRAINT fk_copies_book_id FOREIGN KEY REFERENCES
	tbl_book(book_ID),
	BranchID INT NOT NULL CONSTRAINT fk_copies_branch_id FOREIGN KEY REFERENCES
	tbl_Library_Branch(Branch_ID),
	NO_OF_COPIES INT NOT NULL 
);


CREATE TABLE tbl_Borrower (
	CardNO VARCHAR(30) PRIMARY KEY NOT NULL,
	Name VARCHAR(100) NOT NULL,
	[Address] VARCHAR(200) NOT NULL,
	Phone VARCHAR(50) NOT NULL,
);


CREATE TABLE tbl_Library_Branch (
	Branch_ID INT PRIMARY KEY,
	BranchName VARCHAR(200) NOT NULL,
	[Address] VARCHAR (200) NOT NULL
);




