USE [db_library]
GO

/****** Object:  StoredProcedure [dbo].[db_proc7King]    Script Date: 9/7/2019 8:31:25 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[db_proc7King]
AS
SELECT Title, Number_Of_Copies AS 'Copies'
FROM (((Books 
INNER JOIN Book_Authors ON Books.BookID = Book_Authors.BookID)
INNER JOIN Book_Copies ON Books.BookID = Book_Copies.BookID) 
INNER JOIN Library_Branch ON Book_Copies.BranchID = Library_Branch.BranchID)
WHERE Book_Authors.AuthorName = 'Stephen King' AND Library_Branch.BranchName = 'Central';
GO

