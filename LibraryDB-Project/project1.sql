create database LibraryDB;

show databases;

use LibraryDB;
select database();

CREATE TABLE tbl_books(
-- create the attriutes(colums/feilds names)
-- ColumnName, datatype, constraints
BookID int not null auto_increment primary key,
Title varchar(60) not null, 
Author varchar(40) not null,
Genre varchar(30) not null,
PublishedYear date not null
);
SELECT * FROM tbl_books;
CREATE TABLE tbl_borrowers(

BorrowerID int not null auto_increment primary key,
Name varchar(60) not null, 
Email varchar(40) not null,
PhoneNumber varchar(30) not null
);
SELECT * FROM tbl_borrowers;
CREATE TABLE tbl_borrowedBooks(
BorrowedID int auto_increment primary key,
BorrowDate date,
ReturnDate date,
BookID int,
BorrowerID int,
constraint BorrowerID
foreign key (BorrowerID)
references tbl_borrowers(BorrowerID),
constraint BookID
foreign key (BookID)
references tbl_books(BookID)
);

insert into tbl_borrowedBooks(BorrowerID, BookID, BorrowDate, ReturnDate)
values(7, 10, '2016-07-23', '2016-08-05');
insert into tbl_borrowedBooks(BorrowerID, BookID, BorrowDate, ReturnDate)
values(17, 13, '2016-08-13', '2016-08-25');
insert into tbl_borrowedBooks(BorrowerID, BookID, BorrowDate, ReturnDate)
values(29, 27, '2016-09-23', '2016-10-30');
insert into tbl_borrowedBooks(BorrowerID, BookID, BorrowDate)
values(29, 5, '2016-09-23');
insert into tbl_borrowedBooks(BorrowerID, BookID, BorrowDate)
values(9, 11, '2016-09-25');

-- Queries that list all books, all borrowers, and all borrowed books. 
SELECT * FROM tbl_books;
SELECT * FROM tbl_borrowers;
SELECT * FROM tbl_borrowedBooks;


-- Updates the return date when a book is returned.
update tbl_borrowedBooks set ReturnDate = '2016-11-15' where BorrowedID = 5;

update tbl_borrowedBooks set ReturnDate = '2016-11-25' where BorrowedID = 6;

-- Deletes a borrowers record when they no longer have any borrowed books. 
delete from tbl_borrowedBooks where BorrowerID = 29;

SELECT * FROM tbl_borrowedBooks;

show tables;