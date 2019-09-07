USE [db_library]
GO

/****** Object:  StoredProcedure [dbo].[db_proc5loan]    Script Date: 9/7/2019 8:30:21 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[db_proc5loan]
AS
SELECT BranchName, COUNT(BookID) AS 'Number of Books Loaned Out'
FROM Library_Branch
INNER JOIN Book_Loans ON Library_Branch.BranchID = Book_Loans.BranchID GROUP BY Library_Branch.BranchName;
GO

