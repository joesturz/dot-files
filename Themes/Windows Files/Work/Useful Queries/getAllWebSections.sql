--get all WebSections from a Program
Declare @programCode nvarchar(255)

Set @programCode = 'MVAKC13'

Select ws.Title,Count(ws.Title) NumOfActivities
From tblActivities a, tblWebSections ws
Where a.ProgramCode = @programCode and a.WebSection = ws.IDNum
group by ws.Title