--copy a single activity from live to review
Declare @programCode nvarchar(255)
Declare @activityCode nvarchar(255)

set @programCode = 'XYN713'
set @activityCode = 'WomenS'

Insert into OrchidCVBReview.dbo.tblActivities
Select *
from OrchidCVB.dbo.tblActivities
where ProgramCode = @programCode and ActivityCode = @activityCode

Select *
from OrchidCVBReview.dbo.tblActivities
where ProgramCode = @programCode and ActivityCode = @activityCode