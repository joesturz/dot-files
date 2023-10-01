declare @programCode nvarchar(100) = '4Life13'

        select 
                'RC_' + rc.RegCode as '@name', 
                'preserve' as '@xml:space', 
                rc.Description as 'value'
        from tblRegCodes rc
        where rc.ProgramCode = @programCode
union
        select
                'PT_' + cast(pt.IDNum as nvarchar(20)) as '@name',
                'preserve' as '@xml:space',
                pt.Title as 'value'
        from tblPeopleTypes pt
        where pt.ProgramCode = @programCode
union
        select
                'ACT_' + REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(act.ActivityCode, ' ', ''), '.', ''), ',', ''), '''', ''), ':', '')  + '_Description' as '@name',
                'preserve' as '@xml:space',
                act.Description as 'value'
        from tblActivities act
        where act.ProgramCode = @programCode
union
        select
                'ACT_' + REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(act.ActivityCode, ' ', ''), '.', ''), ',', ''), '''', ''), ':', '')  + '_LongDescription' as '@name',
                'preserve' as 'data/@xml:space',
                cast(act.LongDescription as nvarchar(max)) as 'data/value'
        from tblActivities act
        where act.ProgramCode = @programCode
union
        select
                'ACT_' + REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(act.ActivityCode, ' ', ''), '.', ''), ',', ''), '''', ''), ':', '')  + '_OptionalText' as '@name',
                'preserve' as '@xml:space',
                CAST(act.OptionalText as nvarchar(max)) as 'value'
        from tblActivities act
        where act.ProgramCode = @programCode
for xml path ('data'), type