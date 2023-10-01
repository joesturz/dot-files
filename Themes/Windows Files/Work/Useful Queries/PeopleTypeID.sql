/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 [IDNum]
      ,[Title]
      ,[ProgramCode]
      ,[Priority]
  FROM [OrchidCVB].[dbo].[tblPeopleTypes]
  where Title in ('Child over 12','Deputy','Exhibitor','Guest','Other','Sheriff','Spouse') and ProgramCode='NSA2012'