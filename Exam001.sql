USE [master]
GO
/****** Object:  Database [Supermarket]    Script Date: 2020/5/18 18:25:21 ******/
CREATE DATABASE [Supermarket] ON  PRIMARY 
( NAME = N'Supermarket', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\Supermarket.ndf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Supermarket_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\Supermarket_log.ldf' , SIZE = 768KB , MAXSIZE = 2048GB , FILEGROWTH = 10240KB )
GO
ALTER DATABASE [Supermarket] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Supermarket].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Supermarket] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Supermarket] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Supermarket] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Supermarket] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Supermarket] SET ARITHABORT OFF 
GO
ALTER DATABASE [Supermarket] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Supermarket] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Supermarket] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Supermarket] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Supermarket] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Supermarket] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Supermarket] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Supermarket] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Supermarket] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Supermarket] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Supermarket] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Supermarket] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Supermarket] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Supermarket] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Supermarket] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Supermarket] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Supermarket] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Supermarket] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Supermarket] SET  MULTI_USER 
GO
ALTER DATABASE [Supermarket] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Supermarket] SET DB_CHAINING OFF 
GO
USE [Supermarket]
GO
/****** Object:  Table [dbo].[goods]    Script Date: 2020/5/18 18:25:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[goods](
	[货物代码] [varchar](10) NOT NULL,
	[货物名称] [varchar](20) NULL,
	[入库单号] [varchar](15) NULL,
	[入库日期] [date] NULL,
	[单位] [varchar](5) NULL,
	[库存量] [varchar](10) NULL,
	[售价] [smallmoney] NULL,
	[类型] [int] NULL,
	[供应商] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[货物代码] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = OFF, ALLOW_PAGE_LOCKS = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[supplier]    Script Date: 2020/5/18 18:25:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[supplier](
	[id] [int] NOT NULL,
	[name] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = OFF, ALLOW_PAGE_LOCKS = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[types]    Script Date: 2020/5/18 18:25:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[types](
	[gid] [int] NOT NULL,
	[name] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[gid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = OFF, ALLOW_PAGE_LOCKS = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user]    Script Date: 2020/5/18 18:25:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user](
	[uid] [int] NOT NULL,
	[name] [varchar](50) NULL,
	[password] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[uid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = OFF, ALLOW_PAGE_LOCKS = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[goods] ([货物代码], [货物名称], [入库单号], [入库日期], [单位], [库存量], [售价], [类型], [供应商]) VALUES (N'A0290', N'洗洁精', N'A123213', CAST(N'2020-05-13' AS Date), N'瓶', N'133', 16.5000, 1, 2)
INSERT [dbo].[goods] ([货物代码], [货物名称], [入库单号], [入库日期], [单位], [库存量], [售价], [类型], [供应商]) VALUES (N'A0390', N'洗衣粉', N'A803920', CAST(N'2020-05-12' AS Date), N'袋', N'109', 39.0000, 1, 3)
INSERT [dbo].[goods] ([货物代码], [货物名称], [入库单号], [入库日期], [单位], [库存量], [售价], [类型], [供应商]) VALUES (N'B0389', N'面巾纸', N'B209345', CAST(N'2020-05-17' AS Date), N'提', N'285', 69.0000, 1, 2)
INSERT [dbo].[goods] ([货物代码], [货物名称], [入库单号], [入库日期], [单位], [库存量], [售价], [类型], [供应商]) VALUES (N'C0938', N'栗子', N'C809203', CAST(N'2020-05-18' AS Date), N'斤', N'983', 4.0000, 3, 1)
INSERT [dbo].[goods] ([货物代码], [货物名称], [入库单号], [入库日期], [单位], [库存量], [售价], [类型], [供应商]) VALUES (N'C2097', N'苹果', N'C908912', CAST(N'2020-05-13' AS Date), N'箱', N'300', 59.0000, 2, 1)
INSERT [dbo].[goods] ([货物代码], [货物名称], [入库单号], [入库日期], [单位], [库存量], [售价], [类型], [供应商]) VALUES (N'C9032', N'巧克力', N'C325890', CAST(N'2020-05-16' AS Date), N'袋', N'235', 10.0000, 2, 3)
INSERT [dbo].[goods] ([货物代码], [货物名称], [入库单号], [入库日期], [单位], [库存量], [售价], [类型], [供应商]) VALUES (N'C9800', N'口香糖', N'C345800', CAST(N'2020-05-16' AS Date), N'袋', N'499', 5.0000, 2, 2)
INSERT [dbo].[goods] ([货物代码], [货物名称], [入库单号], [入库日期], [单位], [库存量], [售价], [类型], [供应商]) VALUES (N'D3908', N'大米', N'D123407', CAST(N'2020-05-18' AS Date), N'袋', N'29', 49.0000, 3, 1)
INSERT [dbo].[goods] ([货物代码], [货物名称], [入库单号], [入库日期], [单位], [库存量], [售价], [类型], [供应商]) VALUES (N'D9032', N'面条', N'D234098', CAST(N'2020-05-18' AS Date), N'袋', N'800', 6.5000, 3, 1)
INSERT [dbo].[supplier] ([id], [name]) VALUES (1, N'东台市绿农蔬菜专业合作社')
INSERT [dbo].[supplier] ([id], [name]) VALUES (2, N'南京进可生活用品有限责任公司')
INSERT [dbo].[supplier] ([id], [name]) VALUES (3, N'淮安卧尔康家居用品有限公司')
INSERT [dbo].[types] ([gid], [name]) VALUES (1, N'家庭清洁')
INSERT [dbo].[types] ([gid], [name]) VALUES (2, N'食品饮料')
INSERT [dbo].[types] ([gid], [name]) VALUES (3, N'粮油副食')
INSERT [dbo].[user] ([uid], [name], [password]) VALUES (1, N'daixiang', N'123456')
ALTER TABLE [dbo].[goods]  WITH CHECK ADD  CONSTRAINT [gidFor] FOREIGN KEY([类型])
REFERENCES [dbo].[types] ([gid])
GO
ALTER TABLE [dbo].[goods] CHECK CONSTRAINT [gidFor]
GO
ALTER TABLE [dbo].[goods]  WITH CHECK ADD  CONSTRAINT [gysFor] FOREIGN KEY([供应商])
REFERENCES [dbo].[supplier] ([id])
GO
ALTER TABLE [dbo].[goods] CHECK CONSTRAINT [gysFor]
GO
/****** Object:  StoredProcedure [dbo].[prcValiddateUser]    Script Date: 2020/5/18 18:25:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[prcValiddateUser]
@UserName varchar(20),
@Password varchar(10),
@result int output
as
begin try
	if exists(select * from [user] where name =@UserName and password=@Password)
		set @result = 1
	else
		set @result = 0
end try
begin catch
	set @result = -1
end catch
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'user', @level2type=N'COLUMN',@level2name=N'uid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'user', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'user', @level2type=N'COLUMN',@level2name=N'password'
GO
USE [master]
GO
ALTER DATABASE [Supermarket] SET  READ_WRITE 
GO
