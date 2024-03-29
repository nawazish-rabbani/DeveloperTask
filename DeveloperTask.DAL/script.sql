USE [master]
GO
/****** Object:  Database [DeveloperTaskDB]    Script Date: 08/11/2021 5:44:53 pm ******/
CREATE DATABASE [DeveloperTaskDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DeveloperTaskDB', FILENAME = N'C:\Users\HP\DeveloperTaskDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DeveloperTaskDB_log', FILENAME = N'C:\Users\HP\DeveloperTaskDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [DeveloperTaskDB] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DeveloperTaskDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DeveloperTaskDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DeveloperTaskDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DeveloperTaskDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DeveloperTaskDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DeveloperTaskDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [DeveloperTaskDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DeveloperTaskDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DeveloperTaskDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DeveloperTaskDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DeveloperTaskDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DeveloperTaskDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DeveloperTaskDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DeveloperTaskDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DeveloperTaskDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DeveloperTaskDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DeveloperTaskDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DeveloperTaskDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DeveloperTaskDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DeveloperTaskDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DeveloperTaskDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DeveloperTaskDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DeveloperTaskDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DeveloperTaskDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DeveloperTaskDB] SET  MULTI_USER 
GO
ALTER DATABASE [DeveloperTaskDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DeveloperTaskDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DeveloperTaskDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DeveloperTaskDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DeveloperTaskDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DeveloperTaskDB] SET QUERY_STORE = OFF
GO
USE [DeveloperTaskDB]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [DeveloperTaskDB]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 08/11/2021 5:44:53 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[Disabled] [bit] NOT NULL,
	[UpdatedBy] [bigint] NULL,
	[UpdatedAt] [datetime] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reminder]    Script Date: 08/11/2021 5:44:54 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reminder](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Date] [date] NOT NULL,
	[CategoryId] [bigint] NOT NULL,
	[SubCategoryId] [bigint] NULL,
	[CreatedBy] [bigint] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Disabled] [bit] NOT NULL,
	[UpdatedAt] [datetime] NULL,
	[UpdatedBy] [bigint] NULL,
 CONSTRAINT [PK_Reminder] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubCategory]    Script Date: 08/11/2021 5:44:54 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubCategory](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[CatergoryId] [bigint] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Disabled] [bit] NOT NULL,
	[UpdatedAt] [datetime] NULL,
	[UpdatedBy] [bigint] NULL,
 CONSTRAINT [PK_SubCategory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 08/11/2021 5:44:54 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Disabled] [bit] NOT NULL,
	[UpdatedAt] [datetime] NULL,
	[UpdatedBy] [bigint] NULL,
 CONSTRAINT [PK_User_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [Name], [CreateDate], [CreatedBy], [Disabled], [UpdatedBy], [UpdatedAt]) VALUES (2, N'WARDROBE', CAST(N'2021-11-07T10:37:37.693' AS DateTime), 1, 0, 1, CAST(N'2021-11-07T10:37:41.110' AS DateTime))
INSERT [dbo].[Category] ([Id], [Name], [CreateDate], [CreatedBy], [Disabled], [UpdatedBy], [UpdatedAt]) VALUES (3, N'KITCHEN', CAST(N'2021-11-07T11:26:15.827' AS DateTime), 1, 1, 1, CAST(N'2021-11-07T12:26:44.383' AS DateTime))
INSERT [dbo].[Category] ([Id], [Name], [CreateDate], [CreatedBy], [Disabled], [UpdatedBy], [UpdatedAt]) VALUES (4, N'BATHROOM', CAST(N'2021-11-07T11:26:22.353' AS DateTime), 1, 0, NULL, NULL)
INSERT [dbo].[Category] ([Id], [Name], [CreateDate], [CreatedBy], [Disabled], [UpdatedBy], [UpdatedAt]) VALUES (5, N'LOUGNE', CAST(N'2021-11-07T12:08:28.187' AS DateTime), 1, 0, NULL, NULL)
INSERT [dbo].[Category] ([Id], [Name], [CreateDate], [CreatedBy], [Disabled], [UpdatedBy], [UpdatedAt]) VALUES (6, N'TAB CATEGORY', CAST(N'2021-11-08T12:32:34.703' AS DateTime), 3, 0, NULL, NULL)
INSERT [dbo].[Category] ([Id], [Name], [CreateDate], [CreatedBy], [Disabled], [UpdatedBy], [UpdatedAt]) VALUES (7, N'TAB NEW', CAST(N'2021-11-08T12:35:29.293' AS DateTime), 3, 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Reminder] ON 

INSERT [dbo].[Reminder] ([Id], [Title], [Date], [CategoryId], [SubCategoryId], [CreatedBy], [CreateDate], [Disabled], [UpdatedAt], [UpdatedBy]) VALUES (1, N'REMINDER  2', CAST(N'2022-12-07' AS Date), 2, 4, 1, CAST(N'2021-11-07T14:55:46.000' AS DateTime), 1, CAST(N'2021-11-07T15:04:14.857' AS DateTime), 1)
INSERT [dbo].[Reminder] ([Id], [Title], [Date], [CategoryId], [SubCategoryId], [CreatedBy], [CreateDate], [Disabled], [UpdatedAt], [UpdatedBy]) VALUES (2, N'REMINDER ', CAST(N'2023-11-07' AS Date), 2, 4, 1, CAST(N'2021-11-07T15:18:45.880' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[Reminder] ([Id], [Title], [Date], [CategoryId], [SubCategoryId], [CreatedBy], [CreateDate], [Disabled], [UpdatedAt], [UpdatedBy]) VALUES (3, N'TAB REMINDER', CAST(N'2021-11-07' AS Date), 6, NULL, 3, CAST(N'2021-11-08T12:33:36.823' AS DateTime), 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Reminder] OFF
GO
SET IDENTITY_INSERT [dbo].[SubCategory] ON 

INSERT [dbo].[SubCategory] ([Id], [Name], [CatergoryId], [CreatedBy], [CreateDate], [Disabled], [UpdatedAt], [UpdatedBy]) VALUES (1, N'SUB KITCHEN', 3, 1, CAST(N'2021-11-07T11:33:03.207' AS DateTime), 1, CAST(N'2021-11-07T12:26:44.390' AS DateTime), 1)
INSERT [dbo].[SubCategory] ([Id], [Name], [CatergoryId], [CreatedBy], [CreateDate], [Disabled], [UpdatedAt], [UpdatedBy]) VALUES (2, N'sub lounge', 5, 1, CAST(N'2021-11-07T12:09:00.000' AS DateTime), 1, CAST(N'2021-11-07T12:19:43.770' AS DateTime), 1)
INSERT [dbo].[SubCategory] ([Id], [Name], [CatergoryId], [CreatedBy], [CreateDate], [Disabled], [UpdatedAt], [UpdatedBy]) VALUES (3, N'SUB KTICHEC 2', 3, 1, CAST(N'2021-11-07T12:22:10.020' AS DateTime), 1, CAST(N'2021-11-07T12:26:44.390' AS DateTime), 1)
INSERT [dbo].[SubCategory] ([Id], [Name], [CatergoryId], [CreatedBy], [CreateDate], [Disabled], [UpdatedAt], [UpdatedBy]) VALUES (4, N'SUB WARDROBE', 2, 1, CAST(N'2021-11-07T14:55:03.613' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[SubCategory] ([Id], [Name], [CatergoryId], [CreatedBy], [CreateDate], [Disabled], [UpdatedAt], [UpdatedBy]) VALUES (5, N'SUB TAB ', 6, 3, CAST(N'2021-11-08T12:32:45.183' AS DateTime), 1, CAST(N'2021-11-08T12:33:18.173' AS DateTime), 3)
INSERT [dbo].[SubCategory] ([Id], [Name], [CatergoryId], [CreatedBy], [CreateDate], [Disabled], [UpdatedAt], [UpdatedBy]) VALUES (6, N'SUB TAB 2', 6, 3, CAST(N'2021-11-08T12:35:19.320' AS DateTime), 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[SubCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [Username], [Password], [Email], [CreateDate], [Disabled], [UpdatedAt], [UpdatedBy]) VALUES (1, N'nawazish', N'P@ssword', N'nawazish@gmail.com', CAST(N'2021-11-07T05:58:56.000' AS DateTime), 0, CAST(N'2021-11-07T06:15:22.900' AS DateTime), NULL)
INSERT [dbo].[User] ([Id], [Username], [Password], [Email], [CreateDate], [Disabled], [UpdatedAt], [UpdatedBy]) VALUES (2, N'tabish2', N'asdasdsad', N'asd@gmai.com', CAST(N'2021-11-07T06:02:33.000' AS DateTime), 1, CAST(N'2021-11-07T06:18:29.600' AS DateTime), NULL)
INSERT [dbo].[User] ([Id], [Username], [Password], [Email], [CreateDate], [Disabled], [UpdatedAt], [UpdatedBy]) VALUES (3, N'tabish', N'asd', N'asd12', CAST(N'2021-11-07T06:18:36.953' AS DateTime), 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__User__536C85E4F242FBF2]    Script Date: 08/11/2021 5:44:54 pm ******/
ALTER TABLE [dbo].[User] ADD UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__User__A9D1053473CDE957]    Script Date: 08/11/2021 5:44:54 pm ******/
ALTER TABLE [dbo].[User] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_Disabled]  DEFAULT ((0)) FOR [Disabled]
GO
ALTER TABLE [dbo].[Reminder] ADD  CONSTRAINT [DF_Reminder_Disabled]  DEFAULT ((0)) FOR [Disabled]
GO
ALTER TABLE [dbo].[SubCategory] ADD  CONSTRAINT [DF_SubCategory_Disabled]  DEFAULT ((0)) FOR [Disabled]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_Disabled]  DEFAULT ((0)) FOR [Disabled]
GO
ALTER TABLE [dbo].[Category]  WITH CHECK ADD  CONSTRAINT [FK_Category_User] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Category] CHECK CONSTRAINT [FK_Category_User]
GO
ALTER TABLE [dbo].[Category]  WITH CHECK ADD  CONSTRAINT [FK_Category_User1] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Category] CHECK CONSTRAINT [FK_Category_User1]
GO
ALTER TABLE [dbo].[Reminder]  WITH CHECK ADD  CONSTRAINT [FK_Reminder_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Reminder] CHECK CONSTRAINT [FK_Reminder_Category]
GO
ALTER TABLE [dbo].[Reminder]  WITH CHECK ADD  CONSTRAINT [FK_Reminder_SubCategory] FOREIGN KEY([SubCategoryId])
REFERENCES [dbo].[SubCategory] ([Id])
GO
ALTER TABLE [dbo].[Reminder] CHECK CONSTRAINT [FK_Reminder_SubCategory]
GO
ALTER TABLE [dbo].[Reminder]  WITH CHECK ADD  CONSTRAINT [FK_Reminder_User] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Reminder] CHECK CONSTRAINT [FK_Reminder_User]
GO
ALTER TABLE [dbo].[Reminder]  WITH CHECK ADD  CONSTRAINT [FK_Reminder_User1] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Reminder] CHECK CONSTRAINT [FK_Reminder_User1]
GO
ALTER TABLE [dbo].[SubCategory]  WITH CHECK ADD  CONSTRAINT [FK_SubCategory_Category] FOREIGN KEY([CatergoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[SubCategory] CHECK CONSTRAINT [FK_SubCategory_Category]
GO
ALTER TABLE [dbo].[SubCategory]  WITH CHECK ADD  CONSTRAINT [FK_SubCategory_User] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[SubCategory] CHECK CONSTRAINT [FK_SubCategory_User]
GO
ALTER TABLE [dbo].[SubCategory]  WITH CHECK ADD  CONSTRAINT [FK_SubCategory_User1] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[SubCategory] CHECK CONSTRAINT [FK_SubCategory_User1]
GO
USE [master]
GO
ALTER DATABASE [DeveloperTaskDB] SET  READ_WRITE 
GO
