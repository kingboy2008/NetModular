USE [master]
GO
/****** Object:  Database [Nm_Quartz]    Script Date: 2019/9/29 11:59:08 ******/
CREATE DATABASE [Nm_Quartz]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Nm_Quartz', FILENAME = N'D:\Database\SqlServer\Nm_Quartz.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Nm_Quartz_log', FILENAME = N'D:\Database\SqlServer\Nm_Quartz_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Nm_Quartz] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Nm_Quartz].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Nm_Quartz] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Nm_Quartz] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Nm_Quartz] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Nm_Quartz] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Nm_Quartz] SET ARITHABORT OFF 
GO
ALTER DATABASE [Nm_Quartz] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Nm_Quartz] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Nm_Quartz] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Nm_Quartz] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Nm_Quartz] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Nm_Quartz] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Nm_Quartz] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Nm_Quartz] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Nm_Quartz] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Nm_Quartz] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Nm_Quartz] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Nm_Quartz] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Nm_Quartz] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Nm_Quartz] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Nm_Quartz] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Nm_Quartz] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Nm_Quartz] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Nm_Quartz] SET RECOVERY FULL 
GO
ALTER DATABASE [Nm_Quartz] SET  MULTI_USER 
GO
ALTER DATABASE [Nm_Quartz] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Nm_Quartz] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Nm_Quartz] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Nm_Quartz] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Nm_Quartz] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Nm_Quartz', N'ON'
GO
ALTER DATABASE [Nm_Quartz] SET QUERY_STORE = OFF
GO
USE [Nm_Quartz]
GO
/****** Object:  Table [dbo].[Group]    Script Date: 2019/9/29 11:59:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Code] [nvarchar](100) NOT NULL,
	[CreatedTime] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[ModifiedTime] [datetime] NOT NULL,
	[ModifiedBy] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Job]    Script Date: 2019/9/29 11:59:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Job](
	[Id] [uniqueidentifier] NOT NULL,
	[ModuleCode] [nvarchar](50) NOT NULL,
	[JobKey] [nvarchar](100) NOT NULL,
	[Group] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Code] [nvarchar](100) NOT NULL,
	[JobClass] [nvarchar](300) NOT NULL,
	[TriggerType] [smallint] NOT NULL,
	[Interval] [int] NOT NULL,
	[RepeatCount] [int] NOT NULL,
	[Cron] [nvarchar](50) NOT NULL,
	[BeginDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[Status] [smallint] NOT NULL,
	[CreatedTime] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[ModifiedTime] [datetime] NOT NULL,
	[ModifiedBy] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Job_Log]    Script Date: 2019/9/29 11:59:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Job_Log](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[JobId] [uniqueidentifier] NOT NULL,
	[Type] [smallint] NOT NULL,
	[Msg] [nvarchar](max) NOT NULL,
	[CreatedTime] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QRTZ_BLOB_TRIGGERS]    Script Date: 2019/9/29 11:59:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QRTZ_BLOB_TRIGGERS](
	[SCHED_NAME] [nvarchar](120) NOT NULL,
	[TRIGGER_NAME] [nvarchar](150) NOT NULL,
	[TRIGGER_GROUP] [nvarchar](150) NOT NULL,
	[BLOB_DATA] [varbinary](max) NULL,
 CONSTRAINT [PK_QRTZ_BLOB_TRIGGERS] PRIMARY KEY CLUSTERED 
(
	[SCHED_NAME] ASC,
	[TRIGGER_NAME] ASC,
	[TRIGGER_GROUP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QRTZ_CALENDARS]    Script Date: 2019/9/29 11:59:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QRTZ_CALENDARS](
	[SCHED_NAME] [nvarchar](120) NOT NULL,
	[CALENDAR_NAME] [nvarchar](200) NOT NULL,
	[CALENDAR] [varbinary](max) NOT NULL,
 CONSTRAINT [PK_QRTZ_CALENDARS] PRIMARY KEY CLUSTERED 
(
	[SCHED_NAME] ASC,
	[CALENDAR_NAME] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QRTZ_CRON_TRIGGERS]    Script Date: 2019/9/29 11:59:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QRTZ_CRON_TRIGGERS](
	[SCHED_NAME] [nvarchar](120) NOT NULL,
	[TRIGGER_NAME] [nvarchar](150) NOT NULL,
	[TRIGGER_GROUP] [nvarchar](150) NOT NULL,
	[CRON_EXPRESSION] [nvarchar](120) NOT NULL,
	[TIME_ZONE_ID] [nvarchar](80) NULL,
 CONSTRAINT [PK_QRTZ_CRON_TRIGGERS] PRIMARY KEY CLUSTERED 
(
	[SCHED_NAME] ASC,
	[TRIGGER_NAME] ASC,
	[TRIGGER_GROUP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QRTZ_FIRED_TRIGGERS]    Script Date: 2019/9/29 11:59:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QRTZ_FIRED_TRIGGERS](
	[SCHED_NAME] [nvarchar](120) NOT NULL,
	[ENTRY_ID] [nvarchar](140) NOT NULL,
	[TRIGGER_NAME] [nvarchar](150) NOT NULL,
	[TRIGGER_GROUP] [nvarchar](150) NOT NULL,
	[INSTANCE_NAME] [nvarchar](200) NOT NULL,
	[FIRED_TIME] [bigint] NOT NULL,
	[SCHED_TIME] [bigint] NOT NULL,
	[PRIORITY] [int] NOT NULL,
	[STATE] [nvarchar](16) NOT NULL,
	[JOB_NAME] [nvarchar](150) NULL,
	[JOB_GROUP] [nvarchar](150) NULL,
	[IS_NONCONCURRENT] [bit] NULL,
	[REQUESTS_RECOVERY] [bit] NULL,
 CONSTRAINT [PK_QRTZ_FIRED_TRIGGERS] PRIMARY KEY CLUSTERED 
(
	[SCHED_NAME] ASC,
	[ENTRY_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QRTZ_JOB_DETAILS]    Script Date: 2019/9/29 11:59:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QRTZ_JOB_DETAILS](
	[SCHED_NAME] [nvarchar](120) NOT NULL,
	[JOB_NAME] [nvarchar](150) NOT NULL,
	[JOB_GROUP] [nvarchar](150) NOT NULL,
	[DESCRIPTION] [nvarchar](250) NULL,
	[JOB_CLASS_NAME] [nvarchar](250) NOT NULL,
	[IS_DURABLE] [bit] NOT NULL,
	[IS_NONCONCURRENT] [bit] NOT NULL,
	[IS_UPDATE_DATA] [bit] NOT NULL,
	[REQUESTS_RECOVERY] [bit] NOT NULL,
	[JOB_DATA] [varbinary](max) NULL,
 CONSTRAINT [PK_QRTZ_JOB_DETAILS] PRIMARY KEY CLUSTERED 
(
	[SCHED_NAME] ASC,
	[JOB_NAME] ASC,
	[JOB_GROUP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QRTZ_LOCKS]    Script Date: 2019/9/29 11:59:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QRTZ_LOCKS](
	[SCHED_NAME] [nvarchar](120) NOT NULL,
	[LOCK_NAME] [nvarchar](40) NOT NULL,
 CONSTRAINT [PK_QRTZ_LOCKS] PRIMARY KEY CLUSTERED 
(
	[SCHED_NAME] ASC,
	[LOCK_NAME] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QRTZ_PAUSED_TRIGGER_GRPS]    Script Date: 2019/9/29 11:59:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QRTZ_PAUSED_TRIGGER_GRPS](
	[SCHED_NAME] [nvarchar](120) NOT NULL,
	[TRIGGER_GROUP] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_QRTZ_PAUSED_TRIGGER_GRPS] PRIMARY KEY CLUSTERED 
(
	[SCHED_NAME] ASC,
	[TRIGGER_GROUP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QRTZ_SCHEDULER_STATE]    Script Date: 2019/9/29 11:59:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QRTZ_SCHEDULER_STATE](
	[SCHED_NAME] [nvarchar](120) NOT NULL,
	[INSTANCE_NAME] [nvarchar](200) NOT NULL,
	[LAST_CHECKIN_TIME] [bigint] NOT NULL,
	[CHECKIN_INTERVAL] [bigint] NOT NULL,
 CONSTRAINT [PK_QRTZ_SCHEDULER_STATE] PRIMARY KEY CLUSTERED 
(
	[SCHED_NAME] ASC,
	[INSTANCE_NAME] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QRTZ_SIMPLE_TRIGGERS]    Script Date: 2019/9/29 11:59:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QRTZ_SIMPLE_TRIGGERS](
	[SCHED_NAME] [nvarchar](120) NOT NULL,
	[TRIGGER_NAME] [nvarchar](150) NOT NULL,
	[TRIGGER_GROUP] [nvarchar](150) NOT NULL,
	[REPEAT_COUNT] [int] NOT NULL,
	[REPEAT_INTERVAL] [bigint] NOT NULL,
	[TIMES_TRIGGERED] [int] NOT NULL,
 CONSTRAINT [PK_QRTZ_SIMPLE_TRIGGERS] PRIMARY KEY CLUSTERED 
(
	[SCHED_NAME] ASC,
	[TRIGGER_NAME] ASC,
	[TRIGGER_GROUP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QRTZ_SIMPROP_TRIGGERS]    Script Date: 2019/9/29 11:59:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QRTZ_SIMPROP_TRIGGERS](
	[SCHED_NAME] [nvarchar](120) NOT NULL,
	[TRIGGER_NAME] [nvarchar](150) NOT NULL,
	[TRIGGER_GROUP] [nvarchar](150) NOT NULL,
	[STR_PROP_1] [nvarchar](512) NULL,
	[STR_PROP_2] [nvarchar](512) NULL,
	[STR_PROP_3] [nvarchar](512) NULL,
	[INT_PROP_1] [int] NULL,
	[INT_PROP_2] [int] NULL,
	[LONG_PROP_1] [bigint] NULL,
	[LONG_PROP_2] [bigint] NULL,
	[DEC_PROP_1] [numeric](13, 4) NULL,
	[DEC_PROP_2] [numeric](13, 4) NULL,
	[BOOL_PROP_1] [bit] NULL,
	[BOOL_PROP_2] [bit] NULL,
	[TIME_ZONE_ID] [nvarchar](80) NULL,
 CONSTRAINT [PK_QRTZ_SIMPROP_TRIGGERS] PRIMARY KEY CLUSTERED 
(
	[SCHED_NAME] ASC,
	[TRIGGER_NAME] ASC,
	[TRIGGER_GROUP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QRTZ_TRIGGERS]    Script Date: 2019/9/29 11:59:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QRTZ_TRIGGERS](
	[SCHED_NAME] [nvarchar](120) NOT NULL,
	[TRIGGER_NAME] [nvarchar](150) NOT NULL,
	[TRIGGER_GROUP] [nvarchar](150) NOT NULL,
	[JOB_NAME] [nvarchar](150) NOT NULL,
	[JOB_GROUP] [nvarchar](150) NOT NULL,
	[DESCRIPTION] [nvarchar](250) NULL,
	[NEXT_FIRE_TIME] [bigint] NULL,
	[PREV_FIRE_TIME] [bigint] NULL,
	[PRIORITY] [int] NULL,
	[TRIGGER_STATE] [nvarchar](16) NOT NULL,
	[TRIGGER_TYPE] [nvarchar](8) NOT NULL,
	[START_TIME] [bigint] NOT NULL,
	[END_TIME] [bigint] NULL,
	[CALENDAR_NAME] [nvarchar](200) NULL,
	[MISFIRE_INSTR] [int] NULL,
	[JOB_DATA] [varbinary](max) NULL,
 CONSTRAINT [PK_QRTZ_TRIGGERS] PRIMARY KEY CLUSTERED 
(
	[SCHED_NAME] ASC,
	[TRIGGER_NAME] ASC,
	[TRIGGER_GROUP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_QRTZ_FT_INST_JOB_REQ_RCVRY]    Script Date: 2019/9/29 11:59:08 ******/
CREATE NONCLUSTERED INDEX [IDX_QRTZ_FT_INST_JOB_REQ_RCVRY] ON [dbo].[QRTZ_FIRED_TRIGGERS]
(
	[SCHED_NAME] ASC,
	[INSTANCE_NAME] ASC,
	[REQUESTS_RECOVERY] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_QRTZ_FT_J_G]    Script Date: 2019/9/29 11:59:08 ******/
CREATE NONCLUSTERED INDEX [IDX_QRTZ_FT_J_G] ON [dbo].[QRTZ_FIRED_TRIGGERS]
(
	[SCHED_NAME] ASC,
	[JOB_NAME] ASC,
	[JOB_GROUP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_QRTZ_FT_JG]    Script Date: 2019/9/29 11:59:08 ******/
CREATE NONCLUSTERED INDEX [IDX_QRTZ_FT_JG] ON [dbo].[QRTZ_FIRED_TRIGGERS]
(
	[SCHED_NAME] ASC,
	[JOB_GROUP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_QRTZ_FT_T_G]    Script Date: 2019/9/29 11:59:08 ******/
CREATE NONCLUSTERED INDEX [IDX_QRTZ_FT_T_G] ON [dbo].[QRTZ_FIRED_TRIGGERS]
(
	[SCHED_NAME] ASC,
	[TRIGGER_NAME] ASC,
	[TRIGGER_GROUP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_QRTZ_FT_TG]    Script Date: 2019/9/29 11:59:08 ******/
CREATE NONCLUSTERED INDEX [IDX_QRTZ_FT_TG] ON [dbo].[QRTZ_FIRED_TRIGGERS]
(
	[SCHED_NAME] ASC,
	[TRIGGER_GROUP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_QRTZ_FT_TRIG_INST_NAME]    Script Date: 2019/9/29 11:59:08 ******/
CREATE NONCLUSTERED INDEX [IDX_QRTZ_FT_TRIG_INST_NAME] ON [dbo].[QRTZ_FIRED_TRIGGERS]
(
	[SCHED_NAME] ASC,
	[INSTANCE_NAME] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_QRTZ_T_C]    Script Date: 2019/9/29 11:59:08 ******/
CREATE NONCLUSTERED INDEX [IDX_QRTZ_T_C] ON [dbo].[QRTZ_TRIGGERS]
(
	[SCHED_NAME] ASC,
	[CALENDAR_NAME] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_QRTZ_T_G]    Script Date: 2019/9/29 11:59:08 ******/
CREATE NONCLUSTERED INDEX [IDX_QRTZ_T_G] ON [dbo].[QRTZ_TRIGGERS]
(
	[SCHED_NAME] ASC,
	[TRIGGER_GROUP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_QRTZ_T_J]    Script Date: 2019/9/29 11:59:08 ******/
CREATE NONCLUSTERED INDEX [IDX_QRTZ_T_J] ON [dbo].[QRTZ_TRIGGERS]
(
	[SCHED_NAME] ASC,
	[JOB_NAME] ASC,
	[JOB_GROUP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_QRTZ_T_JG]    Script Date: 2019/9/29 11:59:08 ******/
CREATE NONCLUSTERED INDEX [IDX_QRTZ_T_JG] ON [dbo].[QRTZ_TRIGGERS]
(
	[SCHED_NAME] ASC,
	[JOB_GROUP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_QRTZ_T_N_G_STATE]    Script Date: 2019/9/29 11:59:08 ******/
CREATE NONCLUSTERED INDEX [IDX_QRTZ_T_N_G_STATE] ON [dbo].[QRTZ_TRIGGERS]
(
	[SCHED_NAME] ASC,
	[TRIGGER_GROUP] ASC,
	[TRIGGER_STATE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_QRTZ_T_N_STATE]    Script Date: 2019/9/29 11:59:08 ******/
CREATE NONCLUSTERED INDEX [IDX_QRTZ_T_N_STATE] ON [dbo].[QRTZ_TRIGGERS]
(
	[SCHED_NAME] ASC,
	[TRIGGER_NAME] ASC,
	[TRIGGER_GROUP] ASC,
	[TRIGGER_STATE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_QRTZ_T_NEXT_FIRE_TIME]    Script Date: 2019/9/29 11:59:08 ******/
CREATE NONCLUSTERED INDEX [IDX_QRTZ_T_NEXT_FIRE_TIME] ON [dbo].[QRTZ_TRIGGERS]
(
	[SCHED_NAME] ASC,
	[NEXT_FIRE_TIME] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_QRTZ_T_NFT_MISFIRE]    Script Date: 2019/9/29 11:59:08 ******/
CREATE NONCLUSTERED INDEX [IDX_QRTZ_T_NFT_MISFIRE] ON [dbo].[QRTZ_TRIGGERS]
(
	[SCHED_NAME] ASC,
	[MISFIRE_INSTR] ASC,
	[NEXT_FIRE_TIME] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_QRTZ_T_NFT_ST]    Script Date: 2019/9/29 11:59:08 ******/
CREATE NONCLUSTERED INDEX [IDX_QRTZ_T_NFT_ST] ON [dbo].[QRTZ_TRIGGERS]
(
	[SCHED_NAME] ASC,
	[TRIGGER_STATE] ASC,
	[NEXT_FIRE_TIME] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_QRTZ_T_NFT_ST_MISFIRE]    Script Date: 2019/9/29 11:59:08 ******/
CREATE NONCLUSTERED INDEX [IDX_QRTZ_T_NFT_ST_MISFIRE] ON [dbo].[QRTZ_TRIGGERS]
(
	[SCHED_NAME] ASC,
	[MISFIRE_INSTR] ASC,
	[NEXT_FIRE_TIME] ASC,
	[TRIGGER_STATE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_QRTZ_T_NFT_ST_MISFIRE_GRP]    Script Date: 2019/9/29 11:59:08 ******/
CREATE NONCLUSTERED INDEX [IDX_QRTZ_T_NFT_ST_MISFIRE_GRP] ON [dbo].[QRTZ_TRIGGERS]
(
	[SCHED_NAME] ASC,
	[MISFIRE_INSTR] ASC,
	[NEXT_FIRE_TIME] ASC,
	[TRIGGER_GROUP] ASC,
	[TRIGGER_STATE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_QRTZ_T_STATE]    Script Date: 2019/9/29 11:59:08 ******/
CREATE NONCLUSTERED INDEX [IDX_QRTZ_T_STATE] ON [dbo].[QRTZ_TRIGGERS]
(
	[SCHED_NAME] ASC,
	[TRIGGER_STATE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Group] ADD  DEFAULT (getdate()) FOR [CreatedTime]
GO
ALTER TABLE [dbo].[Group] ADD  DEFAULT (getdate()) FOR [ModifiedTime]
GO
ALTER TABLE [dbo].[Job] ADD  DEFAULT ((0)) FOR [TriggerType]
GO
ALTER TABLE [dbo].[Job] ADD  DEFAULT ((0)) FOR [Interval]
GO
ALTER TABLE [dbo].[Job] ADD  DEFAULT ((0)) FOR [RepeatCount]
GO
ALTER TABLE [dbo].[Job] ADD  DEFAULT (getdate()) FOR [BeginDate]
GO
ALTER TABLE [dbo].[Job] ADD  DEFAULT (getdate()) FOR [EndDate]
GO
ALTER TABLE [dbo].[Job] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Job] ADD  DEFAULT (getdate()) FOR [CreatedTime]
GO
ALTER TABLE [dbo].[Job] ADD  DEFAULT (getdate()) FOR [ModifiedTime]
GO
ALTER TABLE [dbo].[Job_Log] ADD  DEFAULT ((0)) FOR [Type]
GO
ALTER TABLE [dbo].[Job_Log] ADD  DEFAULT (getdate()) FOR [CreatedTime]
GO
ALTER TABLE [dbo].[QRTZ_CRON_TRIGGERS]  WITH CHECK ADD  CONSTRAINT [FK_QRTZ_CRON_TRIGGERS_QRTZ_TRIGGERS] FOREIGN KEY([SCHED_NAME], [TRIGGER_NAME], [TRIGGER_GROUP])
REFERENCES [dbo].[QRTZ_TRIGGERS] ([SCHED_NAME], [TRIGGER_NAME], [TRIGGER_GROUP])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[QRTZ_CRON_TRIGGERS] CHECK CONSTRAINT [FK_QRTZ_CRON_TRIGGERS_QRTZ_TRIGGERS]
GO
ALTER TABLE [dbo].[QRTZ_SIMPLE_TRIGGERS]  WITH CHECK ADD  CONSTRAINT [FK_QRTZ_SIMPLE_TRIGGERS_QRTZ_TRIGGERS] FOREIGN KEY([SCHED_NAME], [TRIGGER_NAME], [TRIGGER_GROUP])
REFERENCES [dbo].[QRTZ_TRIGGERS] ([SCHED_NAME], [TRIGGER_NAME], [TRIGGER_GROUP])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[QRTZ_SIMPLE_TRIGGERS] CHECK CONSTRAINT [FK_QRTZ_SIMPLE_TRIGGERS_QRTZ_TRIGGERS]
GO
ALTER TABLE [dbo].[QRTZ_SIMPROP_TRIGGERS]  WITH CHECK ADD  CONSTRAINT [FK_QRTZ_SIMPROP_TRIGGERS_QRTZ_TRIGGERS] FOREIGN KEY([SCHED_NAME], [TRIGGER_NAME], [TRIGGER_GROUP])
REFERENCES [dbo].[QRTZ_TRIGGERS] ([SCHED_NAME], [TRIGGER_NAME], [TRIGGER_GROUP])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[QRTZ_SIMPROP_TRIGGERS] CHECK CONSTRAINT [FK_QRTZ_SIMPROP_TRIGGERS_QRTZ_TRIGGERS]
GO
ALTER TABLE [dbo].[QRTZ_TRIGGERS]  WITH CHECK ADD  CONSTRAINT [FK_QRTZ_TRIGGERS_QRTZ_JOB_DETAILS] FOREIGN KEY([SCHED_NAME], [JOB_NAME], [JOB_GROUP])
REFERENCES [dbo].[QRTZ_JOB_DETAILS] ([SCHED_NAME], [JOB_NAME], [JOB_GROUP])
GO
ALTER TABLE [dbo].[QRTZ_TRIGGERS] CHECK CONSTRAINT [FK_QRTZ_TRIGGERS_QRTZ_JOB_DETAILS]
GO
USE [master]
GO
ALTER DATABASE [Nm_Quartz] SET  READ_WRITE 
GO
