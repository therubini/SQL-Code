USE [db_library]
GO

/****** Object:  StoredProcedure [dbo].[db_proc4dueDate]    Script Date: 9/7/2019 8:29:44 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[db_proc4dueDate]
AS
SELECT Title, Name, Address
FROM ((Books
INNER JOIN Book_Loans ON Books.BookID = Book_Loans.BookID)
INNER JOIN Borrower ON Book_Loans.CardNo = Borrower.CardNo)
WHERE Book_Loans.DateDue = CONVERT(date, GETDATE());
GO

