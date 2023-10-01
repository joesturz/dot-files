--update start date and End date for a program
declare @programCode nvarchar(255)
declare @startDate datetime
declare @endDate datetime

Set @programCode = ''
Set @startDate = 'YYYY-MM-DD 00:00:00'
Set @endDate = 'YYYY-MM-DD 00:00:00'

Update OrchidCVBReview.dbo.tblPrograms
Set StartDate = @startDate, EndDate = @endDate
Where ProgramCode = @programCode

Select ProgramCode, StartDate, EndDate
From OrchidCVBReview.dbo.tblPrograms
Where ProgramCode = @programCode