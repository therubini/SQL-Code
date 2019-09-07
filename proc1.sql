USE [db_library]
GO

/****** Object:  StoredProcedure [dbo].[db_tribe]    Script Date: 9/7/2019 8:27:14 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[db_tribe]
AS 
SELECT Number_Of_Copies
FROM ((Book_Copies 
INNER JOIN Library_Branch ON Book_Copies.BranchID = Library_Branch.BranchID)
INNER JOIN Books ON Books.BookID = Book_Copies.BookID) 
WHERE Books.Title = 'The Lost Tribe' AND Library_Branch.BranchName = 'Sharpstown'; 
GO

