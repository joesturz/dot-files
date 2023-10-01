--get websection for an activity

DECLARE @programName nvarchar(255)
DECLARE @activityCode nvarchar(255)

SET @programName ='WCSPC13'
SET @activityCode ='TLHam'

Select w.Title
from tblActivities a, tblWebSections w
where a.ProgramCode = @programName and a.WebSection = w.IDNum and a.ActivityCode = @activityCode