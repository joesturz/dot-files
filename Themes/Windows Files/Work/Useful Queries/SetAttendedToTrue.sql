--update [OrchidCVB].[dbo].[tblRegistrations] 
--set attended=1 
--where programcode='mvorlando13' and (regcode='STAFF' or regcode='VIP' or regcode='MORE' or regcode='EXEC')

--select RegCode,Attended, RegID
--from [OrchidCVBReview].[dbo].[tblRegistrations]
--where  programcode='mvorlando13' and (regcode='STAFF' or regcode='VIP' or regcode='MORE' or regcode='EXEC')
--order by tblRegistrations.Attended