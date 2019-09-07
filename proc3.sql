USE [db_library]
GO

/****** Object:  StoredProcedure [dbo].[db_proc3books]    Script Date: 9/7/2019 8:29:05 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[db_proc3books]
AS
SELECT Name, Address
FROM Borrower
LEFT JOIN Book_Loans ON Borrower.CardNo = Book_Loans.CardNo
WHERE Book_Loans.CardNo IS NULL;
GO

