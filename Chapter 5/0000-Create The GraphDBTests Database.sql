--Requires SQLCMD Mode

PRINT 'You may get a message about RegQueryValueEx returning error 2 - this is okay'

--DOES NOT SUPPORT DB NAME WITH EMBEDDED [ or ]
:setvar Databasename GraphDBTests

--useServer or specify
:SETVAR Collation UseServer

:setvar PrimaryFileGroupSize 10GB
:setvar PrimaryFileGroupMaxSize 20GB
:setvar PrimaryFileGroupFileGrowth 2GB
:setvar PrimaryFileGroupDirectoryOverride "NONE"


:setvar LogFileSize 10GB
:setvar LogFileMaxSize 20GB
:setvar LogFileGrowth 2GB
:setvar LogDirectoryOverride "NONE"

:setvar dropIfExists ON


:SETVAR ReadCommittedSnapship ON
:SETVAR AllowSnapshotIsolation OFF
:SETVAR QueryStore ON
:SETVAR AcceleratedDatabaseRecovery ON

:SETVAR RecoveryModel SIMPLE

--SIMPLE or FORCED
:SETVAR Parameterization SIMPLE


:SETVAR DelayedDurability FORCED

:SETVAR FullTextIfInstalled disable

--NONE 
--NONE is the default anyhow
:SETVAR Containment NONE


--use value NONE uppercase when you want to go with the default or no choice


--drop db if you are recreating it, dropping all connections to existing database.
IF EXISTS (   SELECT *
              FROM   sys.databases
              WHERE  Name = '$(Databasename)')
		  AND
		  (
		  '$(dropIfExists)' COLLATE Latin1_General_BIN2 <> 'NONE' COLLATE Latin1_General_BIN2 
		  )
			   
    EXEC('
alter database  [$(Databasename)]
 
	set single_user with rollback immediate;

drop database [$(Databasename)]');
GO

USE [master]
GO

----------------------------------------------------------------------------------------------------------
--Fetch the server's default file locations and use if nothing was passed in instead
----------------------------------------------------------------------------------------------------------

declare @ExplicitData nvarchar(512)
exec master.dbo.xp_instance_regread N'HKEY_LOCAL_MACHINE', N'Software\Microsoft\MSSQLServer\MSSQLServer', N'DefaultData', @ExplicitData output

declare @ExplicitLog nvarchar(512)
exec master.dbo.xp_instance_regread N'HKEY_LOCAL_MACHINE', N'Software\Microsoft\MSSQLServer\MSSQLServer', N'DefaultLog', @ExplicitLog output

declare @ExplicitBackup nvarchar(512)
exec master.dbo.xp_instance_regread N'HKEY_LOCAL_MACHINE', N'Software\Microsoft\MSSQLServer\MSSQLServer', N'BackupDirectory', @ExplicitBackup output

declare @MasterData nvarchar(512)
exec master.dbo.xp_instance_regread N'HKEY_LOCAL_MACHINE', N'Software\Microsoft\MSSQLServer\MSSQLServer\Parameters', N'SqlArg0', @MasterData output
select @MasterData=substring(@MasterData, 3, 255)
select @MasterData=substring(@MasterData, 1, len(@MasterData) - charindex('\', reverse(@MasterData)))

declare @MasterLog nvarchar(512)
exec master.dbo.xp_instance_regread N'HKEY_LOCAL_MACHINE', N'Software\Microsoft\MSSQLServer\MSSQLServer\Parameters', N'SqlArg2', @MasterLog output
select @MasterLog=substring(@MasterLog, 3, 255)
select @MasterLog=substring(@MasterLog, 1, len(@MasterLog) - charindex('\', reverse(@MasterLog)))

DECLARE @DefaultDataDirectory NVARCHAR(512) = isnull(@ExplicitData, @MasterData)
DECLARE @DefaultLogDirectory NVARCHAR(512) = isnull(@ExplicitLog, @MasterLog)

DECLARE @dataFile NVARCHAR(512) = 
				CASE WHEN '$(PrimaryFileGroupDirectoryOverride)' COLLATE Latin1_General_BIN2 <> 'NONE' COLLATE Latin1_General_BIN2 
				THEN '$(PrimaryFileGroupDirectoryOverride)'
				ELSE @DefaultDataDirectory END + '\$(Databasename)_PRIMARY87.mdf',
		@LogFile NVARCHAR(512) = 				
				CASE WHEN '$(LogDirectoryOverride)' COLLATE Latin1_General_BIN2 <> 'NONE' COLLATE Latin1_General_BIN2 
				THEN '$(LogDirectoryOverride)'
				ELSE @DefaultLogDirectory END + '\$(Databasename).ldf',
		@MemOptFilegroup NVARCHAR(512) = @DefaultDataDirectory + '\$(Databasename)_MemOptFilegroup'

--SELECT @dataFile, @logFile,@MemOptFilegroup

--dynamic sql to parameterize file locations
DECLARE @CreateDBStatement NVARCHAR(MAX) = 
'CREATE DATABASE $(Databasename) ' + CASE WHEN '$(Collation)' <> 'UseServer' THEN ' COLLATE $(Collation)) ' ELSE '' END + '
CONTAINMENT = $(Containment)
ON PRIMARY(Name = N''$(Databasename)'',
           FILEName = ''' + REPLACE(@dataFile,'''','''''') + ''',
           SIZE = $(PrimaryFileGroupSize),
           MAXSIZE = $(PrimaryFileGroupMaxSize),
           FILEGROWTH = $(PrimaryFileGroupFileGrowth))

/* if you don''t want to do mem optimized , comment out */
 ,FILEGROUP [MemoryOptimizedFG] CONTAINS MEMORY_OPTIMIZED_DATA  DEFAULT
( Name = N''$(Databasename)_inmemFiles'', FILEName = ''' + REPLACE(@MemOptFileGroup,'''','''''') + ''', MAXSIZE = UNLIMITED)

LOG ON(Name = N''$(Databasename)_log'',
       FILEName = ''' + REPLACE(@LogFile,'''','''''') + ''',
       SIZE = $(LogFileSize),
       MAXSIZE = $(LogFileMaxSize),
       FILEGROWTH = $(LogFileGrowth));'

EXEC (@createdbstatement)

GO



IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled')) AND '$(FullTextIfInstalled)' COLLATE Latin1_General_BIN2 <> 'NONE' COLLATE Latin1_General_BIN2 
begin
EXEC [$DatabaseName].[dbo].[sp_fulltext_database] @action = '$(FullTextIfInstalled)'
end



IF '$(RecoveryModel)' COLLATE Latin1_General_BIN2 <> 'NONE' COLLATE Latin1_General_BIN2 
	ALTER DATABASE [$(DatabaseName)] SET RECOVERY $(RecoveryModel)

IF '$(DelayedDurability)' COLLATE Latin1_General_BIN2 <> 'NONE' COLLATE Latin1_General_BIN2 
	ALTER DATABASE [$(DatabaseName)] SET DELAYED_DURABILITY = $(DelayedDurability) 

IF '$(AllowSnapshotIsolation)' COLLATE Latin1_General_BIN2 <> 'NONE' COLLATE Latin1_General_BIN2 
	ALTER DATABASE [$(DatabaseName)] SET ALLOW_SNAPSHOT_ISOLATION $(AllowSnapshotIsolation)

IF '$(Parameterization)' COLLATE Latin1_General_BIN2 <> 'NONE' COLLATE Latin1_General_BIN2 
	ALTER DATABASE [$(DatabaseName)] SET PARAMETERIZATION $(Parameterization) 

IF '$(ReadCommittedSnapship)' COLLATE Latin1_General_BIN2 <> 'NONE' COLLATE Latin1_General_BIN2 
	ALTER DATABASE [$(DatabaseName)] SET READ_COMMITTED_SNAPSHOT $(ReadCommittedSnapship)

IF '$(AcceleratedDatabaseRecovery)' COLLATE Latin1_General_BIN2 <> 'NONE' COLLATE Latin1_General_BIN2 
	ALTER DATABASE [$(DatabaseName)] SET ACCELERATED_DATABASE_RECOVERY = $(AcceleratedDatabaseRecovery)

IF '$(QueryStore)' COLLATE Latin1_General_BIN2 <> 'NONE' COLLATE Latin1_General_BIN2 
	ALTER DATABASE [$(DatabaseName)] SET QUERY_STORE = $(QueryStore)

GO

--Adjust manually rarely

--non-standard values
ALTER DATABASE [$(DatabaseName)] SET CURSOR_DEFAULT LOCAL --not standard
ALTER DATABASE [$(DatabaseName)] SET AUTO_UPDATE_STATISTICS_ASYNC ON 
ALTER DATABASE [$(DatabaseName)] SET DATE_CORRELATION_OPTIMIZATION ON


--TODO Add Filestream
--ALTER DATABASE [$(DatabaseName)] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 

/*
ALTER DATABASE [$(DatabaseName)] SET AUTO_UPDATE_STATISTICS ON 


ALTER DATABASE [$(DatabaseName)] SET ANSI_NULL_DEFAULT OFF 
ALTER DATABASE [$(DatabaseName)] SET ANSI_NULLS OFF 
ALTER DATABASE [$(DatabaseName)] SET ANSI_PADDING OFF 
ALTER DATABASE [$(DatabaseName)] SET ANSI_WARNINGS OFF 
ALTER DATABASE [$(DatabaseName)] SET ARITHABORT OFF 
ALTER DATABASE [$(DatabaseName)] SET AUTO_CLOSE OFF 
ALTER DATABASE [$(DatabaseName)] SET AUTO_SHRINK OFF 
ALTER DATABASE [$(DatabaseName)] SET CURSOR_CLOSE_ON_COMMIT OFF 
ALTER DATABASE [$(DatabaseName)] SET CONCAT_NULL_YIELDS_NULL OFF 
ALTER DATABASE [$(DatabaseName)] SET NUMERIC_ROUNDABORT OFF 
ALTER DATABASE [$(DatabaseName)] SET QUOTED_IDENTIFIER OFF 
ALTER DATABASE [$(DatabaseName)] SET RECURSIVE_TRIGGERS OFF 
ALTER DATABASE [$(DatabaseName)] SET  ENABLE_BROKER 

ALTER DATABASE [$(DatabaseName)] SET DB_CHAINING OFF 

ALTER DATABASE [$(DatabaseName)] SET TRUSTWORTHY OFF 
ALTER DATABASE [$(DatabaseName)] SET HONOR_BROKER_PRIORITY OFF 
ALTER DATABASE [$(DatabaseName)] SET MULTI_USER 
ALTER DATABASE [$(DatabaseName)] SET PAGE_VERIFY CHECKSUM  
ALTER DATABASE [$(DatabaseName)] SET TARGET_RECOVERY_TIME = 60 SECONDS 
ALTER DATABASE [$(DatabaseName)] SET READ_WRITE 
*/
GO

