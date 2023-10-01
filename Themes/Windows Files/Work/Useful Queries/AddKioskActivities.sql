--replace YLEO12 with ProgramCode, replace 1 with quantity, replace 34 with catagoryID, replace 17 with settingID --
insert into tblkioskactivities (programcode, ActivityCode, DisplayQuantity, ActivityCategoryId,  KioskSettingsId)
select 'YLEO12', activitycode,1 , 34,17 from tblActivities 
where programcode='YLEO12' and Ticketed=1