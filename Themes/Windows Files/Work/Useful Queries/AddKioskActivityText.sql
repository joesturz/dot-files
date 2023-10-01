--replace YLEO12 with ProgramCode, replace 31 with languageID --
insert into tblKioskActivityText (KioskLanguageId, Text, KioskActivityId)
select 31, a.Description, b.Id from tblActivities a 
join tblKioskActivities b
on a.ActivityCode = b.ActivityCode
where a.ProgramCode='YLEO12' and a.Ticketed=1 and b.ProgramCode='YLEO12'