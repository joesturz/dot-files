Declare @programCode nvarchar(255)
Declare @webSection nvarchar(255)

Set @programCode = 'MVAKC13'
set @webSection = 'Shirt Size'

Select a.ActivityCode
From tblActivities a, tblWebSections ws
Where a.ProgramCode = @programCode and a.WebSection = ws.IDNum and ws.Title = @webSection
