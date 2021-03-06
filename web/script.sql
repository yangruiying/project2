USE [master]
GO
/****** Object:  Database [XXQ]    Script Date: 09/06/2019 14:30:24 ******/
CREATE DATABASE [XXQ] ON  PRIMARY 
( NAME = N'XXQ', FILENAME = N'd:\sql2008\sql1\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\XXQ.mdf' , SIZE = 7168KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'XXQ_log', FILENAME = N'd:\sql2008\sql1\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\XXQ_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [XXQ] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [XXQ].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [XXQ] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [XXQ] SET ANSI_NULLS OFF
GO
ALTER DATABASE [XXQ] SET ANSI_PADDING OFF
GO
ALTER DATABASE [XXQ] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [XXQ] SET ARITHABORT OFF
GO
ALTER DATABASE [XXQ] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [XXQ] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [XXQ] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [XXQ] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [XXQ] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [XXQ] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [XXQ] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [XXQ] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [XXQ] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [XXQ] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [XXQ] SET  DISABLE_BROKER
GO
ALTER DATABASE [XXQ] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [XXQ] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [XXQ] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [XXQ] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [XXQ] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [XXQ] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [XXQ] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [XXQ] SET  READ_WRITE
GO
ALTER DATABASE [XXQ] SET RECOVERY SIMPLE
GO
ALTER DATABASE [XXQ] SET  MULTI_USER
GO
ALTER DATABASE [XXQ] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [XXQ] SET DB_CHAINING OFF
GO
USE [XXQ]
GO
/****** Object:  Table [dbo].[专业]    Script Date: 09/06/2019 14:30:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[专业](
	[专业] [nchar](10) NULL,
	[num] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[账号]    Script Date: 09/06/2019 14:30:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[账号](
	[账号] [nchar](10) NULL,
	[密码] [nchar](10) NULL,
	[权限] [nchar](10) NULL,
	[num] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[院系]    Script Date: 09/06/2019 14:30:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[院系](
	[院系] [nchar](10) NULL,
	[num] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[申请课程]    Script Date: 09/06/2019 14:30:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[申请课程](
	[任课老师] [nchar](10) NULL,
	[年级] [nchar](10) NULL,
	[课程] [nchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[申请]    Script Date: 09/06/2019 14:30:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[申请](
	[课程名称] [nchar](10) NULL,
	[任课老师] [nchar](10) NULL,
	[num] [int] IDENTITY(1,1) NOT NULL,
	[状态] [nchar](10) NULL,
	[课程代码] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[任课老师]    Script Date: 09/06/2019 14:30:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[任课老师](
	[任课老师] [nchar](10) NULL,
	[num] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[课程分配]    Script Date: 09/06/2019 14:30:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[课程分配](
	[院系] [nchar](10) NULL,
	[专业] [nchar](10) NULL,
	[课程名称] [nchar](10) NULL,
	[任课老师] [nchar](10) NULL,
	[班级] [nchar](10) NULL,
	[教材名称] [nchar](10) NULL,
	[num] [int] IDENTITY(1,1) NOT NULL,
	[年级] [nchar](20) NULL,
	[年份] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[课程安排]    Script Date: 09/06/2019 14:30:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[课程安排](
	[院系] [nchar](10) NULL,
	[专业] [nchar](10) NULL,
	[班级] [nchar](10) NULL,
	[课程] [nchar](10) NULL,
	[上课时间] [nchar](10) NULL,
	[上课地点] [nchar](10) NULL,
	[num] [int] IDENTITY(1,1) NOT NULL,
	[节次] [nchar](20) NULL,
	[年级] [nchar](20) NULL,
	[学期] [nchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[课程]    Script Date: 09/06/2019 14:30:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[课程](
	[课程] [nchar](10) NULL,
	[num] [int] IDENTITY(1,1) NOT NULL,
	[课程代码] [int] NULL,
	[班级数量] [nchar](10) NULL,
	[班级人数] [nchar](10) NULL,
	[学时] [int] NULL,
	[班级] [nchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[开设课程]    Script Date: 09/06/2019 14:30:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[开设课程](
	[院系] [nchar](10) NULL,
	[专业] [nchar](10) NULL,
	[课程名称] [nchar](10) NULL,
	[班级] [char](10) NULL,
	[num] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[教师]    Script Date: 09/06/2019 14:30:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[教师](
	[教师名称] [nchar](10) NULL,
	[课程名称] [nchar](10) NULL,
	[num] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[教材选填]    Script Date: 09/06/2019 14:30:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[教材选填](
	[课程名称] [nchar](10) NULL,
	[教材名称] [nchar](10) NULL,
	[专业] [char](10) NULL,
	[num] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[教材]    Script Date: 09/06/2019 14:30:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[教材](
	[教材名称] [nchar](10) NULL,
	[num] [int] IDENTITY(1,1) NOT NULL,
	[id] [nchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[班级]    Script Date: 09/06/2019 14:30:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[班级](
	[专业] [nchar](10) NULL,
	[班级] [nchar](10) NULL,
	[人数] [int] NULL,
	[num] [int] IDENTITY(1,1) NOT NULL,
	[年级] [nchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Data3]    Script Date: 09/06/2019 14:30:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Data3](
	[Country Name] [nvarchar](255) NULL,
	[Country Code] [nvarchar](255) NULL,
	[Indicator Name] [nvarchar](255) NULL,
	[Indicator Code] [nvarchar](255) NULL,
	[1960] [float] NULL,
	[1961] [float] NULL,
	[1962] [float] NULL,
	[1963] [float] NULL,
	[1964] [float] NULL,
	[1965] [float] NULL,
	[1966] [float] NULL,
	[1967] [float] NULL,
	[1968] [float] NULL,
	[1969] [float] NULL,
	[1970] [float] NULL,
	[1971] [float] NULL,
	[1972] [float] NULL,
	[1973] [float] NULL,
	[1974] [float] NULL,
	[1975] [float] NULL,
	[1976] [float] NULL,
	[1977] [float] NULL,
	[1978] [float] NULL,
	[1979] [float] NULL,
	[1980] [float] NULL,
	[1981] [float] NULL,
	[1982] [float] NULL,
	[1983] [float] NULL,
	[1984] [float] NULL,
	[1985] [float] NULL,
	[1986] [float] NULL,
	[1987] [float] NULL,
	[1988] [float] NULL,
	[1989] [float] NULL,
	[1990] [float] NULL,
	[1991] [float] NULL,
	[1992] [float] NULL,
	[1993] [float] NULL,
	[1994] [float] NULL,
	[1995] [float] NULL,
	[1996] [float] NULL,
	[1997] [float] NULL,
	[1998] [float] NULL,
	[1999] [float] NULL,
	[2000] [float] NULL,
	[2001] [float] NULL,
	[2002] [float] NULL,
	[2003] [float] NULL,
	[2004] [float] NULL,
	[2005] [float] NULL,
	[2006] [float] NULL,
	[2007] [float] NULL,
	[2008] [float] NULL,
	[2009] [float] NULL,
	[2010] [float] NULL,
	[2011] [float] NULL,
	[2012] [float] NULL,
	[2013] [float] NULL,
	[2014] [float] NULL,
	[2015] [nvarchar](255) NULL,
	[2016] [nvarchar](255) NULL,
	[2017] [nvarchar](255) NULL,
	[2018] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Data2]    Script Date: 09/06/2019 14:30:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Data2](
	[Country Name] [nvarchar](255) NULL,
	[Country Code] [nvarchar](255) NULL,
	[Indicator Name] [nvarchar](255) NULL,
	[Indicator Code] [nvarchar](255) NULL,
	[1960] [float] NULL,
	[1961] [float] NULL,
	[1962] [float] NULL,
	[1963] [float] NULL,
	[1964] [float] NULL,
	[1965] [float] NULL,
	[1966] [float] NULL,
	[1967] [float] NULL,
	[1968] [float] NULL,
	[1969] [float] NULL,
	[1970] [float] NULL,
	[1971] [float] NULL,
	[1972] [float] NULL,
	[1973] [float] NULL,
	[1974] [float] NULL,
	[1975] [float] NULL,
	[1976] [float] NULL,
	[1977] [float] NULL,
	[1978] [float] NULL,
	[1979] [float] NULL,
	[1980] [float] NULL,
	[1981] [float] NULL,
	[1982] [float] NULL,
	[1983] [float] NULL,
	[1984] [float] NULL,
	[1985] [float] NULL,
	[1986] [float] NULL,
	[1987] [float] NULL,
	[1988] [float] NULL,
	[1989] [float] NULL,
	[1990] [float] NULL,
	[1991] [float] NULL,
	[1992] [float] NULL,
	[1993] [float] NULL,
	[1994] [float] NULL,
	[1995] [float] NULL,
	[1996] [float] NULL,
	[1997] [float] NULL,
	[1998] [float] NULL,
	[1999] [float] NULL,
	[2000] [float] NULL,
	[2001] [float] NULL,
	[2002] [float] NULL,
	[2003] [float] NULL,
	[2004] [float] NULL,
	[2005] [float] NULL,
	[2006] [float] NULL,
	[2007] [float] NULL,
	[2008] [float] NULL,
	[2009] [float] NULL,
	[2010] [float] NULL,
	[2011] [float] NULL,
	[2012] [float] NULL,
	[2013] [float] NULL,
	[2014] [float] NULL,
	[2015] [float] NULL,
	[2016] [float] NULL,
	[2017] [float] NULL,
	[2018] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Data]    Script Date: 09/06/2019 14:30:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Data](
	[Country Name] [nvarchar](255) NULL,
	[Country Code] [nvarchar](255) NULL,
	[Indicator Name] [nvarchar](255) NULL,
	[Indicator Code] [nvarchar](255) NULL,
	[1960] [float] NULL,
	[1961] [float] NULL,
	[1962] [float] NULL,
	[1963] [float] NULL,
	[1964] [float] NULL,
	[1965] [float] NULL,
	[1966] [float] NULL,
	[1967] [float] NULL,
	[1968] [float] NULL,
	[1969] [float] NULL,
	[1970] [float] NULL,
	[1971] [float] NULL,
	[1972] [float] NULL,
	[1973] [float] NULL,
	[1974] [float] NULL,
	[1975] [float] NULL,
	[1976] [float] NULL,
	[1977] [float] NULL,
	[1978] [float] NULL,
	[1979] [float] NULL,
	[1980] [float] NULL,
	[1981] [float] NULL,
	[1982] [float] NULL,
	[1983] [float] NULL,
	[1984] [float] NULL,
	[1985] [float] NULL,
	[1986] [float] NULL,
	[1987] [float] NULL,
	[1988] [float] NULL,
	[1989] [float] NULL,
	[1990] [float] NULL,
	[1991] [float] NULL,
	[1992] [float] NULL,
	[1993] [float] NULL,
	[1994] [float] NULL,
	[1995] [float] NULL,
	[1996] [float] NULL,
	[1997] [float] NULL,
	[1998] [float] NULL,
	[1999] [float] NULL,
	[2000] [float] NULL,
	[2001] [float] NULL,
	[2002] [float] NULL,
	[2003] [float] NULL,
	[2004] [float] NULL,
	[2005] [float] NULL,
	[2006] [float] NULL,
	[2007] [float] NULL,
	[2008] [float] NULL,
	[2009] [float] NULL,
	[2010] [float] NULL,
	[2011] [float] NULL,
	[2012] [float] NULL,
	[2013] [float] NULL,
	[2014] [float] NULL,
	[2015] [float] NULL,
	[2016] [float] NULL,
	[2017] [float] NULL,
	[2018] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Default [DF__申请__状态__15502E78]    Script Date: 09/06/2019 14:30:26 ******/
ALTER TABLE [dbo].[申请] ADD  DEFAULT ('申请中') FOR [状态]
GO
