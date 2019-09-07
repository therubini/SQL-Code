USE [db_library]
GO

/****** Object:  StoredProcedure [dbo].[db_proc6Fiveloan]    Script Date: 9/7/2019 8:30:57 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[db_proc6Fiveloan]
AS
SELECT Name, Address, COUNT(BookID) AS 'Books Checked Out' 
FROM Borrower
INNER JOIN Book_Loans ON Borrower.CardNo = Book_Loans.CardNo 
GROUP BY Borrower.Name, Borrower.Address
HAVING COUNT(BookID) > 5;
GO

