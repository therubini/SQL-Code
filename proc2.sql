USE [db_library]
GO

/****** Object:  StoredProcedure [dbo].[db_tribeCopiesBranch]    Script Date: 9/7/2019 8:28:18 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[db_tribeCopiesBranch]
AS 
SELECT BranchName, Number_Of_Copies AS 'Copies'  
FROM ((Book_Copies 
INNER JOIN Library_Branch ON Book_Copies.BranchID = Library_Branch.BranchID)
INNER JOIN Books ON Books.BookID = Book_Copies.BookID) 
WHERE Books.Title = 'The Lost Tribe';
GO

