--get activities under a RegID

declare @RegID nvarchar(255)

set @RegID = '627528'

Select r.email, ar.ActivityCode, ar.Misc, ar.Attending
From tblRegistrations r, tblActivityRegistrations ar
Where r.RegID = @RegID and r.RegID = ar.RegID