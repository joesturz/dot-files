Select *
  FROM [OrchidCVB].[dbo].[tblDesignPrintedDate]
  Where 
  RegID in (Select RegID from [OrchidCVB].[dbo].[tblRegistrations] where ProgramCode = 'doTERRA12')