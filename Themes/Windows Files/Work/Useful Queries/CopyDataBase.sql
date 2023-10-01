USE master      -- necessary to use sp_detach_db
 
DECLARE @fromDbName nvarchar(255)
DECLARE @destDbName nvarchar(255)

SET @fromDbName = 'OrchidCVB'
 
-------- should not have to change anything below this line -----------

SET @destDbName = @fromDbName + 'Review'
 
DECLARE @backupfilename nvarchar(4000)
SET @backupfilename = 'E:\SQL\Backups\' + @fromDbName + '.bak'

-- backup original database to disk
BACKUP DATABASE @fromDbName 
TO DISK = @backupfilename
WITH INIT -- if the file exists, this will delete it

-- check to see if the database exists
IF EXISTS ( SELECT TOP 1 1 FROM sysdatabases WHERE name = @destDbName)
BEGIN
        DECLARE @dbid int
        DECLARE @spid int

        SET @dbid = db_id(@destDbName)
        
        DECLARE detatch_cursor CURSOR FOR -- create cursor listing processes linked to the attached database
                SELECT spid from master.dbo.sysprocesses WHERE dbid=@dbid

        OPEN detatch_cursor

        FETCH NEXT FROM detatch_cursor
                INTO @spid
        WHILE @@FETCH_STATUS = 0
        BEGIN
          -- kill every process currently attached to the database we are about to restore
          EXEC('kill ' + @spid)
          FETCH NEXT FROM detatch_cursor
          INTO @SPID
        END

        CLOSE detatch_cursor
        DEALLOCATE detatch_cursor

        EXEC('ALTER DATABASE ' + @destDbName + ' SET OFFLINE WITH ROLLBACK IMMEDIATE')
        EXEC sp_detach_db @dbname=@destDbName, @skipchecks='true'
END 

DECLARE @destinationdatafile nvarchar(4000)
DECLARE @destinationlogfile nvarchar(4000)
 
SET @destinationdatafile = 'E:\SQL\Data\' + @destDbName + '.mdf'
SET @destinationlogfile  = 'E:\SQL\Data\' + @destDbName + '.ldf'

-- now create a copy of the database 
RESTORE DATABASE @destDbName 
FROM DISK = @backupfilename
WITH 
        MOVE 'Dev_Data' TO @destinationdatafile, -- 'OrchidNuSkin' for any nuskin databases
        MOVE 'Dev_Log' TO @destinationlogfile, -- 'OrchidNuSkin_Log' for any nuskin databases
        REPLACE


-- change all the email addresses to protect the innocent
DECLARE @query NVARCHAR(500)
SET @query = 'UPDATE ' 
SET @query = @query + @destDbName
SET @query = @query + '..tblRegistrations SET Email = ''test@registerat.com'' WHERE ISNULL(Email, '''') != '''' '
EXEC sp_executesql @query

-- enable database brokering
SET @query = 'ALTER DATABASE ' + @destDbName
SET @query = @query + ' SET NEW_BROKER WITH ROLLBACK IMMEDIATE'

EXEC sp_executesql @query

-- drop user update triggers
SET @query = 'USE ' + @destDbName
SET @query = @query + ' 
DROP TRIGGER TRG_UpdateReviewUsers_U
DROP TRIGGER TRG_UpdateReviewUsers_I'

EXEC sp_executesql @query