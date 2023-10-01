declare @oldProgramCode nvarchar(12)
declare @newProgramCode nvarchar(12)
declare @newDescription nvarchar(50)
declare @newDestination nvarchar(50)
declare @newAddress1 nvarchar(50)
declare @newAddress2 nvarchar(50)
declare @newCity nvarchar(50)
declare @newState nvarchar(2)
declare @newZip nvarchar (20)
declare @newCountry int
declare @newStartDate datetime
declare @newStartTime datetime
declare @newEndDate datetime
declare @newEndTime datetime

--- things to edit
set @oldProgramCode = 'GYC10'
set @newProgramCode = 'GYCEurope'
set @newDescription = 'Description Here'
set @newDestination = ''
set @newAddress1 = ''
set @newAddress2 = ''
set @newCity = ''
set @newState = ''
set @newZip = ''
set @newCountry = 175
set @newStartDate = '11/23/2008'
set @newStartTime = null
set @newEndDate = '11/23/2008'
set @newEndTime = null

--- don't modify below unless you know what you're doing!
begin transaction
insert into tblPrograms
(   ProgramCode, ClientID, Status, Description, Destination, Address1, Address2, City, State, Zip, Country, StartDate,         EndDate,     StartTime,     EndTime, NumberAttending, ApplyHousingCosts, Comments, ProgramManager, AirManager, SalesPerson, WebsiteURL, DateEntered, EnteredBy, DateUpdated, UpdatedBy, CCDescription, Misc1Title, Misc2Title, Misc3Title, PartnerID, EventID, EventCode, MerchantID, PaymentGatewayAccountID)
select
@newProgramCode, ClientID, 0,  @newDescription, @newDestination, @newAddress1, @newAddress2, @newCity, @newState, @newZip, @newCountry, @newStartDate, @newEndDate, @newStartTime, @newEndTime, NumberAttending, ApplyHousingCosts, Comments, ProgramManager, AirManager, SalesPerson, WebsiteURL, GETDATE(),   SYSTEM_USER,      null,      null, CCDescription, Misc1Title, Misc2Title, Misc3Title, PartnerID, EventID, EventCode, MerchantID, PaymentGatewayAccountID
from tblPrograms
where ProgramCode = @oldProgramCode

insert into tblProgramLanguages
        (LanguageID, ProgramCode)
select 
        LanguageID, @newProgramCode
from tblProgramLanguages
where ProgramCode = @oldProgramCode

insert into tblMiscFields
(ProgramCode, FieldName)
select @newProgramCode, FieldName
from tblMiscFields
where ProgramCode = @oldProgramCode

insert into tblRegCodes
(ProgramCode, RegCode, Description, DefaultCode, ExpectedCount, BudgetCode, DateEntered, EnteredBy, DateUpdated, UpdatedBy)
select
@newProgramCode, RegCode, Description, DefaultCode, ExpectedCount, BudgetCode, getdate(), SYSTEM_USER, null, null
from tblRegCodes
where ProgramCode = @oldProgramCode

insert into tblRegCodeFees
(ProgramCode, RegCode, StartDate, EndDate, AttendeeCost, ClientCost, Description)
select
@newProgramCode, RegCode, StartDate, EndDate, AttendeeCost, ClientCost, Description
from tblRegCodeFees
where ProgramCode = @oldProgramCode

insert into tblWebSections
(Title, ProgramCode)
select
Title, @NewProgramCode
from tblWebSections
where ProgramCode = @oldProgramCode

insert into tblActivities
(ProgramCode, ActivityCode, Description, LongDescription, OptionalText, Location, Room, ActivityDate, StartTime, EndTime, Fee, Limit, Unlimited, 
        Registered, CEU, BudgetCode, Guaranteed, Ticketed, SetupNotes, PersonResponsible, SetupTime, Comments, WebSection, IncludeInLetters, 
        HideInOnlineReport, ShowInAgenda, DateEntered, EnteredBy , DateUpdated, UpdatedBy)
select
@newProgramCode, a.ActivityCode, a.Description, a.LongDescription, a.OptionalText, a.Location, a.Room, @newStartDate, @newStartTime, @newEndTime, a.Fee, a.Limit, a.Unlimited,
        0, a.CEU, a.BudgetCode, a.Guaranteed, a.Ticketed, a.SetupNotes, a.PersonResponsible, a.SetupTime, a.Comments, NewWebSection.IdNum, a.IncludeInLetters, 
        a.HideInOnlineReport, a.ShowInAgenda, a.DateEntered, SYSTEM_USER, a.DateUpdated, a.UpdatedBy
from tblActivities a
join tblWebSections oldWebSection on a.WebSection = oldWebSection.IDNum
join tblWebSections newWebSection on oldWebSection.Title = newWebSection.Title and newWebSection.ProgramCode = @newProgramCode 
where a.programcode = @oldProgramCode 

insert into tblActivityLanguages
        (ProgramCode, ActivityCode, LanguageID)
select 
        @newProgramCode, ActivityCode, LanguageID
from tblActivityLanguages
where ProgramCode = @oldProgramCode

insert into tblActivityTranslations
        (ProgramCode, ActivityCode, CultureCode, Description, OptionalText, LongDescription)
select
        @newProgramCode, ActivityCode, CultureCode, Description, OptionalText, LongDescription
from tblActivityTranslations
where ProgramCode = @oldProgramCode

insert into tblActivityAutoAssigns
        (ProgramCode, RegCode, ActivityCode, Quantity)
select
        @newProgramCode, RegCode, ActivityCode, Quantity
from tblActivityAutoAssigns
where ProgramCode = @oldProgramCode

insert into tblPeopleTypes 
        (Title, ProgramCode)
select 
        Title, @newProgramCode
from tblPeopleTypes
where programcode = @oldProgramCode