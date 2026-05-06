CREATE DATABASE UniversityLibrary;
USE UniversityLibrary;

CREATE TABLE Category (CategoryID INT PRIMARY KEY AUTO_INCREMENT, CategoryName VARCHAR(50));
CREATE TABLE Librarian (LibrarianID INT PRIMARY KEY AUTO_INCREMENT, StaffName VARCHAR(100), Shift VARCHAR(20), Password VARCHAR(255));
CREATE TABLE Member (MemberID INT PRIMARY KEY AUTO_INCREMENT, FullName VARCHAR(100), Email VARCHAR(100) UNIQUE);
CREATE TABLE Book (BookID INT PRIMARY KEY AUTO_INCREMENT, Title VARCHAR(100), Author VARCHAR(100), CategoryID INT, FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID));
CREATE TABLE Loan (LoanID INT PRIMARY KEY AUTO_INCREMENT, BookID INT, MemberID INT, LibrarianID INT, BorrowDate DATE, DueDate DATE, FOREIGN KEY (BookID) REFERENCES Book(BookID), FOREIGN KEY (MemberID) REFERENCES Member(MemberID), FOREIGN KEY (LibrarianID) REFERENCES Librarian(LibrarianID));
CREATE TABLE Fine (FineID INT PRIMARY KEY AUTO_INCREMENT, LoanID INT UNIQUE, Amount DECIMAL(10,2), Status VARCHAR(20) DEFAULT 'Unpaid', FOREIGN KEY (LoanID) REFERENCES Loan(LoanID));

INSERT INTO Category (CategoryName) VALUES ('Computer Science'), ('History');
INSERT INTO Librarian (StaffName, Shift, Password) VALUES ('Admin', 'Morning', 'Pass123');
INSERT INTO Member (FullName, Email) VALUES ('Emelyn Komujuni', 'emelyn@university.ac.ug');
INSERT INTO Book (Title, Author, CategoryID) VALUES ('Database Systems', 'C.J. Date', 1);
INSERT INTO Loan (BookID, MemberID, LibrarianID, BorrowDate, DueDate) VALUES (1, 1, 1, '2026-05-01', '2026-05-15');

-- Test Queries
SELECT * FROM Book;
SELECT Member.FullName, Book.Title, Loan.DueDate FROM Loan JOIN Member ON Loan.MemberID = Member.MemberID JOIN Book ON Loan.BookID = Book.BookID;