create db_library

use db_library
go

CREATE TABLE Library_Branch(
	BranchID INT PRIMARY KEY NOT NULL IDENTITY(100,1),
	BranchName VARCHAR(50) NOT NULL,
	Address VARCHAR(50) NOT NULL,
);

select * from Library_Branch;

CREATE TABLE Publisher(
	PublisherName VARCHAR(50) NOT NULL PRIMARY KEY,
	Address VARCHAR(50) NOT NULL,
	Phone VARCHAR(50) NOT NULL,
);

select * from Publisher;

CREATE TABLE Books(
	BookID INT PRIMARY KEY NOT NULL IDENTITY(100,1),
	Title VARCHAR(50) NOT NULL,
	PublisherName VARCHAR(50) NOT NULL CONSTRAINT fk_PublisherName FOREIGN KEY REFERENCES Publisher(PublisherName) ON UPDATE CASCADE ON DELETE CASCADE,
);

select * from Books;

CREATE TABLE Book_Authors(
	BookID INT NOT NULL CONSTRAINT fk_BookID FOREIGN KEY REFERENCES Books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	AuthorName VARCHAR(50) NOT NULL,
);

select * from Book_Authors;


CREATE TABLE Book_Copies( 
	BookID INT NOT NULL CONSTRAINT fk_BookID2 FOREIGN KEY REFERENCES Books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT NOT NULL CONSTRAINT fk_Library_Branch FOREIGN KEY REFERENCES Library_Branch(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	Number_Of_Copies INT NOT NULL,
);

select * from Book_Copies;

CREATE TABLE Borrower(
	CardNo INT PRIMARY KEY IDENTITY(100,1) NOT NULL,
	Name VARCHAR(50) NOT NULL,
	Address VARCHAR(50) NOT NULL,
	Phone VARCHAR(50) NOT NULL,
);

select * from Borrower;

CREATE TABLE Book_Loans(
	BookID INT NOT NULL CONSTRAINT fk_BookID3 FOREIGN KEY REFERENCES Books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT NOT NULL CONSTRAINT fk_BranchID FOREIGN KEY REFERENCES Library_Branch(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	CardNo INT NOT NULL CONSTRAINT fk_CardNo FOREIGN KEY REFERENCES Borrower(CardNo) ON UPDATE CASCADE ON DELETE CASCADE,
	DateOut DATE NOT NULL,
	DateDue DATE NOT NULL,
);

select * from Book_Loans;

INSERT INTO Library_Branch
	(BranchName, Address) 
	VALUES
	('Sharpstown', '555 ok St'),
	('Central', '333 Heavens Gate'),
	('Orlando', '1 Valhalla Court'),
	('Salt Lake City', '321 N. 1200 E.')
;
select * from Library_Branch;

INSERT INTO Publisher
	(PublisherName, Address, Phone)
	VALUES
	('A Company Publisher', '456 Ocean St', '555-123-7894'),
	('ACME', '123 Turtle Dr', '123-456-7890')
;

select * from Publisher;

INSERT INTO Books
	(Title, PublisherName)  
	VALUES
	('Hustle', 'A Company Publisher'),
	('IT', 'ACME'),
	('Templar Knight''s', 'ACME'),
	('The King', 'A Company Publisher'),
	('King Kong', 'A Company Publisher'),
	('Godzilla', 'ACME'),
	('How to be Great', 'ACME'),
	('KnightsFall', 'A Company Publisher'),
	('Lift', 'ACME'),
	('The Dark Crystal', 'A Company Publisher'),
	('Halloween', 'ACME'),
	('300', 'ACME'),
	('Gladiator', 'A Company Publisher'),
	('Conan the Destroyer', 'ACME'),
	('Fight Club', 'A Company Publisher'),
	('Jeepers Creeper', 'A Company Publisher'),
	('Pet Cemetary', 'A Company Publisher'),
	('The Mist', 'ACME'),
	('DeadPool', 'A Company Publisher'),
	('The Lost Tribe', 'ACME')
;
select * from Books;

	INSERT INTO Book_Authors
		(BookID, AuthorName)
		VALUES
		(100, 'Tom Clancy'),
		(101, 'Ammon Rubini'),
		(102, 'Ammon Rubini'),
		(103, 'Tom Clancy'),
		(104, 'Tom Clancy'),
		(105, 'Frank Miller'),
		(106, 'Frank Miller'),
		(107, 'Stephen King'),
		(108, 'Ammon Rubini'),
		(109, 'Ammon Rubini'),
		(110, 'Tom Clancy'),
		(111, 'Frank Miller'),
		(112, 'Frank Miller'),
		(113, 'Tom Clancy'),
		(114, 'Tom Clancy'),
		(115, 'Ammon Rubini'),
		(116, 'Ammon Rubini'),
		(117, 'Stephen King'),
		(118, 'Stephen King'),
		(119, 'Frank Miller')
;
select * from Book_Authors;

INSERT INTO Book_Copies
	(BookID, BranchID, Number_Of_Copies)
	VALUES
--Sharpstown
	(100, 100, 4),
	(101, 100, 3),
	(102, 100, 5),
	(103, 100, 4),
	(104, 100, 3),
	(105, 100, 2),
	(106, 100, 6),
	(107, 100, 8),
	(108, 100, 9),
	(119, 100, 7),-- 119
--Central
	(110, 101, 2),
	(111, 101, 3),
	(112, 101, 4),
	(113, 101, 5),
	(114, 101, 6),
	(115, 101, 7),
	(116, 101, 8),
	(117, 101, 9),
	(118, 101, 2),
	(119, 101, 5),
--Orlando
	(100, 102, 2),
	(101, 102, 6),
	(102, 102, 4),
	(103, 102, 8),
	(104, 102, 3),
	(105, 102, 5),
	(106, 102, 2),
	(107, 102, 8),
	(108, 102, 7),
	(109, 102, 7),
--Salt Lake City
	(110, 103, 4),
	(111, 103, 7),
	(112, 103, 9),
	(113, 103, 8),
	(114, 103, 3),
	(115, 103, 2),
	(116, 103, 5),
	(117, 103, 8),
	(118, 103, 5),
	(119, 103, 9)
;
select * from Book_Copies;

INSERT INTO Borrower
	(Name, Address, Phone)
	VALUES
	('Mickey Mouse', 'DisneyLand', '999-999-9999'),
	('Luke Skywalker', 'Polis Massa', '123-456-7890'),
	('Darth Vader', 'Mustafar', '354-859-6596'),
	('Big Foot', 'The Forest', '000-000-0000'),
	('King Kong', 'Skull Island','333-333-3331'),
	('Alexander the Great', 'The World', '111-111-1111'),
	('leonidas', 'The Hot Gates', '999-555-0000'),
	('Conan', 'Krum', '958-959-9696'),
	('Tai Lopez', 'Anywhere I want!', '555-555-5555')
;
select * from Borrower;

INSERT INTO Book_Loans
	(BookID, BranchID, CardNo, DateOut, DateDue)
	VALUES
	(117, 100, 100, '02/27/2018', '10/31/2018'),
	(107, 100, 100, '02/27/2018', '10/31/2018'),
	(111, 100, 100, '02/27/2018', '10/31/2018'),
	(114, 100, 100, '02/27/2018', '10/31/2018'),
		(100, 101, 101, '10/31/2018', '02/10/2019'),
	(103, 101, 101, '10/31/2018', '02/10/2019'),
	(114, 101, 101, '10/31/2018', '02/10/2019'),
	(105, 101, 101, '10/31/2018', '02/10/2019'),
	(117, 101, 101, '10/31/2018', '02/10/2019'),
	(101, 101, 101, '10/31/2018', '02/10/2019'),
		(119, 102, 102, '09/01/2019', '09/30/2019'),
	(106, 102, 102, '09/01/2019', '09/30/2019'),
	(108, 102, 102, '09/01/2019', '09/30/2019'),
	(112, 102, 102, '09/01/2019', '09/30/2019'),
	(114, 102, 102, '09/01/2019', '09/30/2019'),
		(105, 103, 103, '08/20/2019', '09/15/2019'),
	(101, 103, 103, '08/20/2019', '09/15/2019'),
	(108, 103, 103, '08/20/2019', '09/15/2019'),
	(112, 103, 103, '08/20/2019', '09/15/2019'),
	(114, 103, 103, '08/20/2019', '09/15/2019'),
	(100, 103, 103, '08/20/2019', '09/15/2019'),
	(105, 103, 103, '08/20/2019', '09/15/2019'),
		(101, 101, 104, '08/15/2019', '09/30/2019'),
	(107, 101, 104, '08/15/2019', '09/30/2019'),
	(114, 101, 104, '08/15/2019', '09/30/2019'),
	(105, 101, 104, '08/15/2019', '09/30/2019'),
	(114, 101, 104, '08/15/2019', '09/30/2019'),
		(113, 102, 105, '07/25/2019', '08/30/2019'),
	(116, 102, 105, '07/25/2019', '08/30/2019'),
	(117, 102, 105, '07/25/2019', '08/30/2019'),
	(102, 102, 105, '07/25/2019', '08/30/2019'),
	(100, 102, 105, '07/25/2019', '08/30/2019'),
		(117, 100, 106, '04/25/2018', '2019-09-08'),
	(115, 100, 106, '04/25/2018', '2019-09-08'),
	(103, 100, 106, '04/25/2018', '2019-09-08'),
	(102, 100, 106, '04/25/2018', '2019-09-08'),
	(106, 100, 106, '04/25/2018', '2019-09-08'),
	(100, 100, 106, '04/25/2018', '2019-09-08'),
	(105, 100, 106, '04/25/2018', '2019-09-08'),
	(111, 100, 106, '04/25/2018', '2019-09-08'),
	(104, 100, 106, '04/25/2018', '2019-09-08'),
	(119, 100, 106, '04/25/2018', '2019-09-08'),
		(113, 103, 107, '10/13/2016', '2019-09-07'),
	(109, 103, 107, '10/13/2016', '2019-09-07'),
	(112, 103, 107, '10/13/2016', '2019-09-07'),
	(118, 103, 107, '10/13/2016', '2019-09-07'),
	(103, 103, 107, '10/13/2016', '2019-09-07'),
	(102, 103, 107, '10/13/2016', '2019-09-07'),
	(104, 103, 107, '10/13/2016', '2019-09-07'),
	(108, 103, 107, '10/13/2016', '2019-09-07'),
	(101, 103, 107, '10/13/2016', '2019-09-07'),
	(114, 103, 107, '10/13/2016', '2019-09-07')
;
select * from Book_Loans;




