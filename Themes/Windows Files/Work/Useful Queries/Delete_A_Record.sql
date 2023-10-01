BEGIN TRANSACTION --COMMIT TRANSACTION
DECLARE @ProgramCode nvarchar(12)
DECLARE @RegIdList varchar(500)
SET @ProgramCode='EMEA12'
SET @RegIdList = '453673'
DECLARE @PeopleToDelete table
(
        RegId int
)
DECLARE @RegId varchar(10), @Pos int

SET @RegIdList = LTRIM(RTRIM(@RegIdList))+ ','
SET @Pos = CHARINDEX(',', @RegIdList, 1)
SET NOCOUNT ON
IF REPLACE(@RegIdList, ',', '') <> ''
BEGIN
        WHILE @Pos > 0
        BEGIN
                SET @RegId = LTRIM(RTRIM(LEFT(@RegIdList, @Pos - 1)))
                IF @RegId <> ''
                BEGIN
                        INSERT INTO @PeopleToDelete (RegId) VALUES (CAST(@RegId AS int)) --Use Appropriate conversion
                END
                SET @RegIdList = RIGHT(@RegIdList, LEN(@RegIdList) - @Pos)
                SET @Pos = CHARINDEX(',', @RegIdList, 1)
        END
END     
SET NOCOUNT OFF

PRINT 'DELETING REFID DATA'
        DELETE FROM tblRefIdData 
                WHERE RegId in (SELECT RegId FROM @PeopleToDelete)
                
PRINT 'DELETING INVOICES'
DELETE FROM tblRegistrationInvoiceLineItems
        WHERE RegistrationInvoiceId in 
                (SELECT Id FROM tblRegistrationInvoice
                        WHERE RegId IN (SELECT RegId FROM @PeopleToDelete))

DELETE FROM tblRegistrationInvoice
        WHERE RegId in 
        (SELECT RegId FROM @PeopleToDelete)
        
PRINT 'DELETING FROM tblHotelReservationNames for Guests'
DELETE FROM tblHotelReservationNames
        WHERE RegId in 
                (SELECT RegID FROM tblRegistrations
                        WHERE MasterRegID in (SELECT RegId FROM @PeopleToDelete))

PRINT 'DELETING FROM tblHotelReservationNames'
DELETE FROM tblHotelReservationNames
        WHERE RegId in 
                (SELECT RegId FROM @PeopleToDelete)

PRINT 'DELETING FROM tblHotelReservations for Guests'
DELETE FROM tblHotelReservations
        WHERE RegId in 
                (SELECT RegID FROM tblRegistrations
                        WHERE MasterRegID in (SELECT RegId FROM @PeopleToDelete))

PRINT 'DELETING FROM tblHotelReservations'
DELETE FROM tblHotelReservations
        WHERE RegId in 
                (SELECT RegId FROM @PeopleToDelete)

PRINT 'DELETING FROM tblPaymentTransactionPending'
DELETE FROM tblPaymentTransactionPending
        WHERE RegId in 
                (SELECT RegId FROM @PeopleToDelete)

PRINT 'DELETING FROM tblActivityRegistrations for Guests'
DELETE FROM tblActivityRegistrations
        WHERE ProgramCode=@ProgramCode
        AND RegId in 
                (SELECT RegID FROM tblRegistrations
                        WHERE MasterRegID in (SELECT RegId FROM @PeopleToDelete))

PRINT 'DELETING FROM tblActivityRegistrations'
DELETE FROM tblActivityRegistrations
        WHERE ProgramCode=@ProgramCode
        AND RegId in 
                (SELECT RegId FROM @PeopleToDelete)

PRINT 'DELETING FROM tblUntranslated for Guests'
DELETE FROM tblUntranslated
        WHERE RegId in 
                (SELECT RegID FROM tblRegistrations
                        WHERE MasterRegID in (SELECT RegId FROM @PeopleToDelete))

PRINT 'DELETING FROM tblUntranslated'
DELETE FROM tblUntranslated
        WHERE RegId in 
                (SELECT RegId FROM @PeopleToDelete)

PRINT 'DELETING FROM tblPaymentTransactionHistory'
DELETE FROM tblPaymentTransactionHistory
        WHERE RegId in 
                (SELECT RegId FROM @PeopleToDelete)

PRINT 'DELETING FROM tblFinancials'
DELETE FROM tblFinancials
        WHERE ProgramCode=@ProgramCode
        AND RegId in 
                (SELECT RegId FROM @PeopleToDelete)

PRINT 'DELETING FROM guest tblFinancials'
DELETE FROM tblFinancials
        WHERE ProgramCode=@ProgramCode
        AND GuestRegId in 
                (SELECT RegId FROM @PeopleToDelete)
                
PRINT 'DELETING FROM tblMiscValues for Guests'
DELETE FROM tblMiscValues
        WHERE RegId in 
                (SELECT RegID FROM tblRegistrations
                        WHERE MasterRegID in (SELECT RegId FROM @PeopleToDelete))

PRINT 'DELETING FROM tblMiscValues'
DELETE FROM tblMiscValues
        WHERE RegId in 
                (SELECT RegId FROM @PeopleToDelete)

PRINT 'DELETING FROM tblQCDates for Guests'
DELETE FROM tblQCDates
        WHERE RegId in
                (SELECT RegID FROM tblRegistrations
                        WHERE MasterRegID in (SELECT RegId FROM @PeopleToDelete))

PRINT 'DELETING FROM tblQCDates'
DELETE FROM tblQCDates
        WHERE RegId in
                (SELECT RegId FROM @PeopleToDelete)

PRINT 'DELETING FROM tblRegistrations for Guests'
DELETE FROM tblRegistrations 
        WHERE ProgramCode=@ProgramCode
        AND RegId in 
                (SELECT RegID FROM tblRegistrations
                        WHERE MasterRegID in (SELECT RegId FROM @PeopleToDelete))

PRINT 'DELETING FROM tblRegistrations'
DELETE FROM tblRegistrations 
        WHERE ProgramCode=@ProgramCode
        AND RegId in 
                (SELECT RegId FROM @PeopleToDelete)

PRINT 'UPDATING tblActivities'
UPDATE tblActivities
SET Registered = (
        SELECT
                CASE 
                        WHEN SUM(actreg.Attending)IS NULL THEN 0
                        ELSE SUM(actReg.Attending)
                END
        FROM tblActivityRegistrations actreg
        WHERE actreg.ProgramCode = tblActivities.Programcode
          AND actreg.ActivityCode = tblActivities.ActivityCode
)
FROM tblActivities
WHERE ProgramCode = @ProgramCode

--ROLLBACK TRANSACTION