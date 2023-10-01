-- modify passkey hotel link in both live and review
-- given an EventID
-- given an EventCode(Attendee Access Code)
Declare @ProgramCode nvarchar(50)
Declare @E_ID nvarchar(50)
Declare @E_Code nvarchar(50)

Set @ProgramCode = ''
Set @E_ID = ''
Set @E_Code = ''

Update OrchidCVBReview.dbo.tblPrograms
Set EventID = @E_ID, EventCode = @E_Code
where ProgramCode = @ProgramCode

Update OrchidCVB.dbo.tblPrograms
Set EventID = @E_ID, EventCode = @E_Code
where ProgramCode = @ProgramCode

Select ProgramCode, EventID, EventCode
From OrchidCVB.dbo.tblPrograms
Where ProgramCode = @ProgramCode