USE [cms]
GO
/****** Object:  Table [dbo].[Analytics]    Script Date: 5/24/2023 1:35:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Analytics](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](256) NOT NULL,
	[version] [nvarchar](256) NOT NULL,
	[versionNumber] [nvarchar](256) NOT NULL,
	[mobile] [bit] NOT NULL,
	[os] [nvarchar](256) NOT NULL,
	[clientIp] [nvarchar](256) NOT NULL,
	[clientIpRoutable] [bit] NOT NULL,
	[url] [nvarchar](1000) NOT NULL,
	[userId] [int] NULL,
	[createdBy] [nvarchar](256) NOT NULL,
	[createdAt] [datetimeoffset](7) NOT NULL,
	[updatedAt] [datetimeoffset](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Batches]    Script Date: 5/24/2023 1:35:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Batches](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[startTime] [nvarchar](10) NOT NULL,
	[endTime] [nvarchar](10) NOT NULL,
	[name] [nvarchar](256) NOT NULL,
	[sessionId] [int] NOT NULL,
	[isActive] [bit] NOT NULL,
	[createdBy] [nvarchar](256) NOT NULL,
	[updatedBy] [nvarchar](256) NULL,
	[organisationId] [int] NOT NULL,
	[createdAt] [datetimeoffset](7) NOT NULL,
	[updatedAt] [datetimeoffset](7) NOT NULL,
	[class] [nvarchar](20) NULL,
	[feeAmount] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DailyReports]    Script Date: 5/24/2023 1:35:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DailyReports](
	[Id] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Images]    Script Date: 5/24/2023 1:35:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Images](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fieldName] [nvarchar](500) NOT NULL,
	[originalName] [nvarchar](500) NOT NULL,
	[encoding] [nvarchar](256) NOT NULL,
	[mimeType] [nvarchar](256) NOT NULL,
	[size] [int] NULL,
	[destination] [nvarchar](500) NULL,
	[fileName] [nvarchar](500) NULL,
	[path] [nvarchar](1000) NULL,
	[imageURL] [nvarchar](1000) NULL,
	[isActive] [bit] NOT NULL,
	[userId] [int] NOT NULL,
	[createdAt] [datetimeoffset](7) NOT NULL,
	[updatedAt] [datetimeoffset](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menus]    Script Date: 5/24/2023 1:35:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menus](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](256) NOT NULL,
	[menuId] [nvarchar](256) NOT NULL,
	[type] [nvarchar](256) NULL,
	[icon] [nvarchar](256) NULL,
	[url] [nvarchar](1000) NULL,
	[isActive] [bit] NOT NULL,
	[createdBy] [nvarchar](256) NOT NULL,
	[updatedBy] [nvarchar](256) NULL,
	[parentId] [int] NULL,
	[displayOrder] [int] NULL,
	[createdAt] [datetimeoffset](7) NOT NULL,
	[updatedAt] [datetimeoffset](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MenusPermissions]    Script Date: 5/24/2023 1:35:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenusPermissions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[menuId] [int] NOT NULL,
	[roleId] [int] NOT NULL,
	[canView] [bit] NOT NULL,
	[canAdd] [bit] NOT NULL,
	[canEdit] [bit] NOT NULL,
	[canDelete] [bit] NOT NULL,
	[isActive] [bit] NOT NULL,
	[organisationId] [int] NULL,
	[createdBy] [nvarchar](256) NOT NULL,
	[updatedBy] [nvarchar](256) NULL,
	[createdAt] [datetimeoffset](7) NOT NULL,
	[updatedAt] [datetimeoffset](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Months]    Script Date: 5/24/2023 1:35:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Months](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Months] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Organisations]    Script Date: 5/24/2023 1:35:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Organisations](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](256) NOT NULL,
	[descriptions] [nvarchar](500) NOT NULL,
	[isActive] [bit] NOT NULL,
	[details] [nvarchar](1000) NULL,
	[createdBy] [nvarchar](256) NOT NULL,
	[updatedBy] [nvarchar](256) NULL,
	[createdAt] [datetimeoffset](7) NOT NULL,
	[updatedAt] [datetimeoffset](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrganisationsUsers]    Script Date: 5/24/2023 1:35:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrganisationsUsers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NOT NULL,
	[organisationId] [int] NOT NULL,
	[isActive] [bit] NOT NULL,
	[createdBy] [nvarchar](256) NOT NULL,
	[updatedBy] [nvarchar](256) NULL,
	[createdAt] [datetimeoffset](7) NOT NULL,
	[updatedAt] [datetimeoffset](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 5/24/2023 1:35:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](256) NOT NULL,
	[descriptions] [nvarchar](500) NOT NULL,
	[isActive] [bit] NOT NULL,
	[createdBy] [nvarchar](256) NOT NULL,
	[updatedBy] [nvarchar](256) NULL,
	[createdAt] [datetimeoffset](7) NOT NULL,
	[updatedAt] [datetimeoffset](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sessions]    Script Date: 5/24/2023 1:35:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sessions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[startDate] [datetimeoffset](7) NOT NULL,
	[endDate] [datetimeoffset](7) NULL,
	[name] [nvarchar](256) NOT NULL,
	[isActive] [bit] NOT NULL,
	[createdBy] [nvarchar](256) NOT NULL,
	[updatedBy] [nvarchar](256) NULL,
	[organisationId] [int] NOT NULL,
	[createdAt] [datetimeoffset](7) NOT NULL,
	[updatedAt] [datetimeoffset](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentFees]    Script Date: 5/24/2023 1:35:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentFees](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[paymentExpireDate] [datetimeoffset](7) NULL,
	[feeAmount] [float] NOT NULL,
	[discountAmount] [float] NOT NULL,
	[paymentAmount] [float] NOT NULL,
	[paymentDate] [datetimeoffset](7) NOT NULL,
	[notes] [nvarchar](256) NULL,
	[receiptNo] [nvarchar](20) NOT NULL,
	[paymentMode] [nvarchar](20) NOT NULL,
	[paymentMonth] [nvarchar](20) NOT NULL,
	[sessionId] [int] NOT NULL,
	[studentId] [int] NOT NULL,
	[batchId] [int] NOT NULL,
	[isActive] [bit] NOT NULL,
	[createdBy] [nvarchar](256) NOT NULL,
	[updatedBy] [nvarchar](256) NULL,
	[organisationId] [int] NOT NULL,
	[createdAt] [datetimeoffset](7) NOT NULL,
	[updatedAt] [datetimeoffset](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 5/24/2023 1:35:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[rollNumber] [nvarchar](20) NOT NULL,
	[firstName] [nvarchar](256) NOT NULL,
	[lastName] [nvarchar](256) NULL,
	[middleName] [nvarchar](256) NULL,
	[fatherName] [nvarchar](256) NULL,
	[motherName] [nvarchar](256) NULL,
	[phone] [nvarchar](15) NULL,
	[parentPhone] [nvarchar](256) NULL,
	[address] [nvarchar](256) NULL,
	[city] [nvarchar](256) NULL,
	[pinCode] [nvarchar](6) NULL,
	[joiningDate] [datetimeoffset](7) NOT NULL,
	[sessionId] [int] NOT NULL,
	[batchId] [int] NOT NULL,
	[isActive] [bit] NOT NULL,
	[createdBy] [nvarchar](256) NOT NULL,
	[updatedBy] [nvarchar](256) NULL,
	[organisationId] [int] NOT NULL,
	[createdAt] [datetimeoffset](7) NOT NULL,
	[updatedAt] [datetimeoffset](7) NOT NULL,
	[board] [nvarchar](50) NULL,
	[gender] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SupportQueries]    Script Date: 5/24/2023 1:35:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SupportQueries](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](256) NOT NULL,
	[email] [nvarchar](256) NOT NULL,
	[phone] [nvarchar](15) NULL,
	[city] [nvarchar](256) NULL,
	[message] [nvarchar](1000) NULL,
	[parantMessageId] [int] NULL,
	[userId] [int] NULL,
	[status] [varchar](255) NULL,
	[organisationId] [int] NULL,
	[isActive] [bit] NOT NULL,
	[createdAt] [datetimeoffset](7) NOT NULL,
	[updatedAt] [datetimeoffset](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SystemSettings]    Script Date: 5/24/2023 1:35:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemSettings](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[sessionId] [int] NOT NULL,
	[email] [nvarchar](256) NOT NULL,
	[isActive] [bit] NOT NULL,
	[createdBy] [nvarchar](256) NOT NULL,
	[updatedBy] [nvarchar](256) NULL,
	[organisationId] [int] NOT NULL,
	[createdAt] [datetimeoffset](7) NOT NULL,
	[updatedAt] [datetimeoffset](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 5/24/2023 1:35:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[firstName] [nvarchar](256) NOT NULL,
	[lastName] [nvarchar](256) NOT NULL,
	[email] [nvarchar](256) NOT NULL,
	[password] [nvarchar](100) NOT NULL,
	[phone] [nvarchar](15) NULL,
	[age] [int] NULL,
	[gender] [varchar](255) NULL,
	[isActive] [bit] NOT NULL,
	[roleId] [int] NULL,
	[details] [nvarchar](1000) NULL,
	[activationCode] [nvarchar](100) NOT NULL,
	[createdAt] [datetimeoffset](7) NOT NULL,
	[updatedAt] [datetimeoffset](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Batches] ON 

INSERT [dbo].[Batches] ([id], [startTime], [endTime], [name], [sessionId], [isActive], [createdBy], [updatedBy], [organisationId], [createdAt], [updatedAt], [class], [feeAmount]) VALUES (1, N'6:00 AM', N'7:00 AM', N'06 AM - 07 AM', 1, 1, N'Shailendra Tiwari (test@gmail.com)', N'Shailendra Tiwari (test@gmail.com)', 1, CAST(N'2023-05-15T03:37:40.3880000+00:00' AS DateTimeOffset), CAST(N'2023-05-15T14:34:33.0200000+00:00' AS DateTimeOffset), N'11', 500)
INSERT [dbo].[Batches] ([id], [startTime], [endTime], [name], [sessionId], [isActive], [createdBy], [updatedBy], [organisationId], [createdAt], [updatedAt], [class], [feeAmount]) VALUES (2, N'7:00 AM', N'8:00 AM', N'07 AM - 08 AM', 1, 1, N'Shailendra Tiwari (test@gmail.com)', N'Shailendra Tiwari (test@gmail.com)', 1, CAST(N'2023-05-15T03:41:29.9690000+00:00' AS DateTimeOffset), CAST(N'2023-05-15T14:34:44.8730000+00:00' AS DateTimeOffset), N'12', 700)
SET IDENTITY_INSERT [dbo].[Batches] OFF
GO
INSERT [dbo].[DailyReports] ([Id], [name]) VALUES (0, N'ToDay')
INSERT [dbo].[DailyReports] ([Id], [name]) VALUES (1, N'Yesterday')
INSERT [dbo].[DailyReports] ([Id], [name]) VALUES (2, N'Date')
INSERT [dbo].[DailyReports] ([Id], [name]) VALUES (3, N'Date')
INSERT [dbo].[DailyReports] ([Id], [name]) VALUES (4, N'Date')
INSERT [dbo].[DailyReports] ([Id], [name]) VALUES (5, N'Date')
INSERT [dbo].[DailyReports] ([Id], [name]) VALUES (6, N'Date')
GO
SET IDENTITY_INSERT [dbo].[Menus] ON 

INSERT [dbo].[Menus] ([id], [title], [menuId], [type], [icon], [url], [isActive], [createdBy], [updatedBy], [parentId], [displayOrder], [createdAt], [updatedAt]) VALUES (1, N'Admin', N'admin', N'collapse', N'add_box', NULL, 0, N'Shailendra Tiwari (test@gmail.com)', N'Paras Tripathi (test@gmail.com)', NULL, 1, CAST(N'2018-07-13T22:25:13.4100000+00:00' AS DateTimeOffset), CAST(N'2018-09-03T07:45:50.0690000+00:00' AS DateTimeOffset))
INSERT [dbo].[Menus] ([id], [title], [menuId], [type], [icon], [url], [isActive], [createdBy], [updatedBy], [parentId], [displayOrder], [createdAt], [updatedAt]) VALUES (2, N'Menus', N'menus', N'item', N'apps', N'/pages/menus', 0, N'Shailendra Tiwari (test@gmail.com)', N'Shailendra Tiwari (test@gmail.com)', 1, 1, CAST(N'2018-07-13T22:26:21.1000000+00:00' AS DateTimeOffset), CAST(N'2019-04-21T18:07:29.6820000+00:00' AS DateTimeOffset))
INSERT [dbo].[Menus] ([id], [title], [menuId], [type], [icon], [url], [isActive], [createdBy], [updatedBy], [parentId], [displayOrder], [createdAt], [updatedAt]) VALUES (3, N'Roles', N'roles', N'item', N'grid_on', N'/pages/roles', 0, N'Shailendra Tiwari (test@gmail.com)', N'Shailendra Tiwari (test@gmail.com)', 1, 1, CAST(N'2018-07-13T22:58:33.9300000+00:00' AS DateTimeOffset), CAST(N'2019-04-21T18:07:37.3540000+00:00' AS DateTimeOffset))
INSERT [dbo].[Menus] ([id], [title], [menuId], [type], [icon], [url], [isActive], [createdBy], [updatedBy], [parentId], [displayOrder], [createdAt], [updatedAt]) VALUES (4, N'Users', N'users', N'item', N'account_box', N'/pages/users', 0, N'Shailendra Tiwari (test@gmail.com)', N'Shailendra Tiwari (test@gmail.com)', NULL, 3, CAST(N'2018-07-13T23:01:04.0680000+00:00' AS DateTimeOffset), CAST(N'2019-04-21T18:06:49.8970000+00:00' AS DateTimeOffset))
INSERT [dbo].[Menus] ([id], [title], [menuId], [type], [icon], [url], [isActive], [createdBy], [updatedBy], [parentId], [displayOrder], [createdAt], [updatedAt]) VALUES (5, N'Organisations', N'organisations', N'item', N'account_balance_wallet', N'/pages/organisations', 0, N'Shailendra Tiwari (test@gmail.com)', N'Shailendra Tiwari (test@gmail.com)', NULL, 6, CAST(N'2018-07-13T23:03:07.5090000+00:00' AS DateTimeOffset), CAST(N'2019-04-21T18:06:41.1140000+00:00' AS DateTimeOffset))
INSERT [dbo].[Menus] ([id], [title], [menuId], [type], [icon], [url], [isActive], [createdBy], [updatedBy], [parentId], [displayOrder], [createdAt], [updatedAt]) VALUES (6, N'Profile', N'profile', N'item', N'account_circle', N'/pages/profile', 0, N'Shailendra Tiwari (test@gmail.com)', N'Paras Tripathi (test@gmail.com)', NULL, 100, CAST(N'2018-07-13T23:04:35.7410000+00:00' AS DateTimeOffset), CAST(N'2018-09-03T07:46:12.4740000+00:00' AS DateTimeOffset))
INSERT [dbo].[Menus] ([id], [title], [menuId], [type], [icon], [url], [isActive], [createdBy], [updatedBy], [parentId], [displayOrder], [createdAt], [updatedAt]) VALUES (7, N'Batchs', N'batchs', N'item', N'batchs', N'/batchs', 1, N'Shailendra Tiwari', N'Shailendra Tiwari', NULL, 6, CAST(N'2018-07-13T00:00:00.0000000+05:30' AS DateTimeOffset), CAST(N'2018-07-13T00:00:00.0000000+05:30' AS DateTimeOffset))
INSERT [dbo].[Menus] ([id], [title], [menuId], [type], [icon], [url], [isActive], [createdBy], [updatedBy], [parentId], [displayOrder], [createdAt], [updatedAt]) VALUES (8, N'Sessions', N'sessions', N'item', N'sessions', N'/sessions', 1, N'Shailendra Tiwari', N'Shailendra Tiwari', NULL, 7, CAST(N'2018-07-13T00:00:00.0000000+05:30' AS DateTimeOffset), CAST(N'2018-07-13T00:00:00.0000000+05:30' AS DateTimeOffset))
INSERT [dbo].[Menus] ([id], [title], [menuId], [type], [icon], [url], [isActive], [createdBy], [updatedBy], [parentId], [displayOrder], [createdAt], [updatedAt]) VALUES (9, N'Students', N'students', N'item', N'students', N'/students', 1, N'Shailendra Tiwari', N'Shailendra Tiwari', NULL, 8, CAST(N'2018-07-13T00:00:00.0000000+05:30' AS DateTimeOffset), CAST(N'2018-07-13T00:00:00.0000000+05:30' AS DateTimeOffset))
INSERT [dbo].[Menus] ([id], [title], [menuId], [type], [icon], [url], [isActive], [createdBy], [updatedBy], [parentId], [displayOrder], [createdAt], [updatedAt]) VALUES (10, N'Fee Collection', N'fee', N'item', N'payment', N'/fee-collections', 1, N'Shailendra Tiwari ', N'Shailendra Tiwari ', NULL, 9, CAST(N'2018-07-13T00:00:00.0000000+05:30' AS DateTimeOffset), CAST(N'2018-07-13T00:00:00.0000000+05:30' AS DateTimeOffset))
INSERT [dbo].[Menus] ([id], [title], [menuId], [type], [icon], [url], [isActive], [createdBy], [updatedBy], [parentId], [displayOrder], [createdAt], [updatedAt]) VALUES (11, N'Fee Due', N'feedue', N'item', N'fee', N'/fee-collections/due', 1, N'Shailendra Tiwari', N'Shailendra ', NULL, 10, CAST(N'2018-07-13T00:00:00.0000000+05:30' AS DateTimeOffset), CAST(N'2018-07-13T00:00:00.0000000+05:30' AS DateTimeOffset))
INSERT [dbo].[Menus] ([id], [title], [menuId], [type], [icon], [url], [isActive], [createdBy], [updatedBy], [parentId], [displayOrder], [createdAt], [updatedAt]) VALUES (12, N'Payments', N'payment', N'item', N'payment', N'/fee-collections/payment', 1, N'Shailendra Tiwari', N'Shailendra Tiwari', NULL, 11, CAST(N'2018-07-13T00:00:00.0000000+05:30' AS DateTimeOffset), CAST(N'2018-07-13T00:00:00.0000000+05:30' AS DateTimeOffset))
SET IDENTITY_INSERT [dbo].[Menus] OFF
GO
SET IDENTITY_INSERT [dbo].[Months] ON 

INSERT [dbo].[Months] ([Id], [name]) VALUES (1, N'January')
INSERT [dbo].[Months] ([Id], [name]) VALUES (2, N'February')
INSERT [dbo].[Months] ([Id], [name]) VALUES (3, N'March')
INSERT [dbo].[Months] ([Id], [name]) VALUES (4, N'April')
INSERT [dbo].[Months] ([Id], [name]) VALUES (5, N'May')
INSERT [dbo].[Months] ([Id], [name]) VALUES (6, N'June')
INSERT [dbo].[Months] ([Id], [name]) VALUES (7, N'July')
INSERT [dbo].[Months] ([Id], [name]) VALUES (8, N'August')
INSERT [dbo].[Months] ([Id], [name]) VALUES (9, N'September')
INSERT [dbo].[Months] ([Id], [name]) VALUES (10, N'October')
INSERT [dbo].[Months] ([Id], [name]) VALUES (11, N'November')
INSERT [dbo].[Months] ([Id], [name]) VALUES (12, N'December')
SET IDENTITY_INSERT [dbo].[Months] OFF
GO
SET IDENTITY_INSERT [dbo].[Organisations] ON 

INSERT [dbo].[Organisations] ([id], [name], [descriptions], [isActive], [details], [createdBy], [updatedBy], [createdAt], [updatedAt]) VALUES (1, N'Test Organisation', N'Test Organisation', 1, N'{
    address1: ''Test'',
    address2: ''Test''
  }', N'Shailendra Tiwari', N'Shailendra Tiwari', CAST(N'2023-05-14T15:47:44.1290000+00:00' AS DateTimeOffset), CAST(N'2023-05-14T15:47:44.1290000+00:00' AS DateTimeOffset))
SET IDENTITY_INSERT [dbo].[Organisations] OFF
GO
SET IDENTITY_INSERT [dbo].[OrganisationsUsers] ON 

INSERT [dbo].[OrganisationsUsers] ([id], [userId], [organisationId], [isActive], [createdBy], [updatedBy], [createdAt], [updatedAt]) VALUES (1, 1, 1, 1, N'Shailendra Tiwari', N'Shailendra Tiwari', CAST(N'2023-05-14T15:47:44.1720000+00:00' AS DateTimeOffset), CAST(N'2023-05-14T15:47:44.1720000+00:00' AS DateTimeOffset))
SET IDENTITY_INSERT [dbo].[OrganisationsUsers] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([id], [name], [descriptions], [isActive], [createdBy], [updatedBy], [createdAt], [updatedAt]) VALUES (1, N'DBA', N'DBA User Roles', 1, N'Shailendra Tiwari', N'Shailendra Tiwari', CAST(N'2023-05-14T15:47:43.9580000+00:00' AS DateTimeOffset), CAST(N'2023-05-14T15:47:43.9580000+00:00' AS DateTimeOffset))
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Sessions] ON 

INSERT [dbo].[Sessions] ([id], [startDate], [endDate], [name], [isActive], [createdBy], [updatedBy], [organisationId], [createdAt], [updatedAt]) VALUES (1, CAST(N'2023-03-31T18:30:00.0000000+00:00' AS DateTimeOffset), CAST(N'2024-02-27T18:30:00.0000000+00:00' AS DateTimeOffset), N'2023-2024', 1, N'Shailendra Tiwari (test@gmail.com)', N'Shailendra Tiwari (test@gmail.com)', 1, CAST(N'2023-05-14T18:49:49.8840000+00:00' AS DateTimeOffset), CAST(N'2023-05-15T03:44:21.4340000+00:00' AS DateTimeOffset))
INSERT [dbo].[Sessions] ([id], [startDate], [endDate], [name], [isActive], [createdBy], [updatedBy], [organisationId], [createdAt], [updatedAt]) VALUES (2, CAST(N'2024-03-31T18:30:00.0000000+00:00' AS DateTimeOffset), CAST(N'2025-02-27T18:30:00.0000000+00:00' AS DateTimeOffset), N'2024-2025', 1, N'Shailendra Tiwari (test@gmail.com)', N'Shailendra Tiwari (test@gmail.com)', 1, CAST(N'2023-05-15T12:13:50.2390000+00:00' AS DateTimeOffset), CAST(N'2023-05-15T12:16:05.4920000+00:00' AS DateTimeOffset))
SET IDENTITY_INSERT [dbo].[Sessions] OFF
GO
SET IDENTITY_INSERT [dbo].[StudentFees] ON 

INSERT [dbo].[StudentFees] ([id], [paymentExpireDate], [feeAmount], [discountAmount], [paymentAmount], [paymentDate], [notes], [receiptNo], [paymentMode], [paymentMonth], [sessionId], [studentId], [batchId], [isActive], [createdBy], [updatedBy], [organisationId], [createdAt], [updatedAt]) VALUES (1, NULL, 500, 100, 400, CAST(N'2023-05-16T05:14:24.1280000+00:00' AS DateTimeOffset), N'Test', N'10003', N'Offline', N'April', 1, 1, 1, 1, N'Shailendra Tiwari (test@gmail.com)', NULL, 1, CAST(N'2023-05-16T05:14:39.7170000+00:00' AS DateTimeOffset), CAST(N'2023-05-16T05:14:39.7170000+00:00' AS DateTimeOffset))
INSERT [dbo].[StudentFees] ([id], [paymentExpireDate], [feeAmount], [discountAmount], [paymentAmount], [paymentDate], [notes], [receiptNo], [paymentMode], [paymentMonth], [sessionId], [studentId], [batchId], [isActive], [createdBy], [updatedBy], [organisationId], [createdAt], [updatedAt]) VALUES (2, NULL, 700, 0, 700, CAST(N'2023-05-16T05:15:00.4550000+00:00' AS DateTimeOffset), N'Test Notes', N'1002', N'Offline', N'June', 1, 3, 2, 1, N'Shailendra Tiwari (test@gmail.com)', NULL, 1, CAST(N'2023-05-16T05:15:16.7070000+00:00' AS DateTimeOffset), CAST(N'2023-05-16T05:15:16.7070000+00:00' AS DateTimeOffset))
INSERT [dbo].[StudentFees] ([id], [paymentExpireDate], [feeAmount], [discountAmount], [paymentAmount], [paymentDate], [notes], [receiptNo], [paymentMode], [paymentMonth], [sessionId], [studentId], [batchId], [isActive], [createdBy], [updatedBy], [organisationId], [createdAt], [updatedAt]) VALUES (3, NULL, 500, 0, 500, CAST(N'2023-05-16T05:15:21.6780000+00:00' AS DateTimeOffset), N'Test Notes', N'1002', N'Offline', N'May', 1, 2, 1, 1, N'Shailendra Tiwari (test@gmail.com)', NULL, 1, CAST(N'2023-05-16T05:15:35.8370000+00:00' AS DateTimeOffset), CAST(N'2023-05-16T05:15:35.8370000+00:00' AS DateTimeOffset))
INSERT [dbo].[StudentFees] ([id], [paymentExpireDate], [feeAmount], [discountAmount], [paymentAmount], [paymentDate], [notes], [receiptNo], [paymentMode], [paymentMonth], [sessionId], [studentId], [batchId], [isActive], [createdBy], [updatedBy], [organisationId], [createdAt], [updatedAt]) VALUES (4, NULL, 500, 0, 500, CAST(N'2023-05-16T05:20:28.7860000+00:00' AS DateTimeOffset), N'Test Notes', N'10020', N'Offline', N'June', 1, 2, 1, 1, N'Shailendra Tiwari (test@gmail.com)', NULL, 1, CAST(N'2023-05-16T05:20:43.2200000+00:00' AS DateTimeOffset), CAST(N'2023-05-16T05:20:43.2200000+00:00' AS DateTimeOffset))
INSERT [dbo].[StudentFees] ([id], [paymentExpireDate], [feeAmount], [discountAmount], [paymentAmount], [paymentDate], [notes], [receiptNo], [paymentMode], [paymentMonth], [sessionId], [studentId], [batchId], [isActive], [createdBy], [updatedBy], [organisationId], [createdAt], [updatedAt]) VALUES (5, NULL, 500, 50, 450, CAST(N'2023-05-16T05:23:40.3530000+00:00' AS DateTimeOffset), N'Test Notes', N'12290', N'Offline', N'April', 1, 2, 1, 1, N'Shailendra Tiwari (test@gmail.com)', NULL, 1, CAST(N'2023-05-16T05:24:05.1510000+00:00' AS DateTimeOffset), CAST(N'2023-05-16T05:24:05.1510000+00:00' AS DateTimeOffset))
INSERT [dbo].[StudentFees] ([id], [paymentExpireDate], [feeAmount], [discountAmount], [paymentAmount], [paymentDate], [notes], [receiptNo], [paymentMode], [paymentMonth], [sessionId], [studentId], [batchId], [isActive], [createdBy], [updatedBy], [organisationId], [createdAt], [updatedAt]) VALUES (6, NULL, 700, 0, 700, CAST(N'2023-05-16T05:42:27.5560000+00:00' AS DateTimeOffset), N'Test Notes', N'100029', N'Offline', N'May', 1, 3, 2, 1, N'Shailendra Tiwari (test@gmail.com)', NULL, 1, CAST(N'2023-05-16T05:42:42.1410000+00:00' AS DateTimeOffset), CAST(N'2023-05-16T05:42:42.1410000+00:00' AS DateTimeOffset))
INSERT [dbo].[StudentFees] ([id], [paymentExpireDate], [feeAmount], [discountAmount], [paymentAmount], [paymentDate], [notes], [receiptNo], [paymentMode], [paymentMonth], [sessionId], [studentId], [batchId], [isActive], [createdBy], [updatedBy], [organisationId], [createdAt], [updatedAt]) VALUES (7, NULL, 700, 0, 700, CAST(N'2023-05-16T05:45:32.7020000+00:00' AS DateTimeOffset), NULL, N'1001', N'Offline', N'April', 1, 3, 2, 1, N'Shailendra Tiwari (test@gmail.com)', NULL, 1, CAST(N'2023-05-16T05:45:44.1050000+00:00' AS DateTimeOffset), CAST(N'2023-05-16T05:45:44.1050000+00:00' AS DateTimeOffset))
INSERT [dbo].[StudentFees] ([id], [paymentExpireDate], [feeAmount], [discountAmount], [paymentAmount], [paymentDate], [notes], [receiptNo], [paymentMode], [paymentMonth], [sessionId], [studentId], [batchId], [isActive], [createdBy], [updatedBy], [organisationId], [createdAt], [updatedAt]) VALUES (8, NULL, 500, 0, 500, CAST(N'2023-05-16T12:43:53.7040000+00:00' AS DateTimeOffset), NULL, N'1001', N'Offline', N'March', 1, 1, 1, 1, N'Shailendra Tiwari (test@gmail.com)', NULL, 1, CAST(N'2023-05-16T12:44:06.4960000+00:00' AS DateTimeOffset), CAST(N'2023-05-16T12:44:06.4960000+00:00' AS DateTimeOffset))
INSERT [dbo].[StudentFees] ([id], [paymentExpireDate], [feeAmount], [discountAmount], [paymentAmount], [paymentDate], [notes], [receiptNo], [paymentMode], [paymentMonth], [sessionId], [studentId], [batchId], [isActive], [createdBy], [updatedBy], [organisationId], [createdAt], [updatedAt]) VALUES (9, NULL, 500, 0, 500, CAST(N'2023-05-16T12:44:10.9050000+00:00' AS DateTimeOffset), NULL, N'10001', N'Offline', N'May', 1, 1, 1, 1, N'Shailendra Tiwari (test@gmail.com)', NULL, 1, CAST(N'2023-05-16T12:44:21.6590000+00:00' AS DateTimeOffset), CAST(N'2023-05-16T12:44:21.6590000+00:00' AS DateTimeOffset))
INSERT [dbo].[StudentFees] ([id], [paymentExpireDate], [feeAmount], [discountAmount], [paymentAmount], [paymentDate], [notes], [receiptNo], [paymentMode], [paymentMonth], [sessionId], [studentId], [batchId], [isActive], [createdBy], [updatedBy], [organisationId], [createdAt], [updatedAt]) VALUES (10, NULL, 700, 100, 600, CAST(N'2023-05-16T12:45:34.7750000+00:00' AS DateTimeOffset), NULL, N'1202', N'Offline', N'March', 1, 3, 2, 1, N'Shailendra Tiwari (test@gmail.com)', NULL, 1, CAST(N'2023-05-16T12:45:46.6810000+00:00' AS DateTimeOffset), CAST(N'2023-05-16T12:45:46.6810000+00:00' AS DateTimeOffset))
INSERT [dbo].[StudentFees] ([id], [paymentExpireDate], [feeAmount], [discountAmount], [paymentAmount], [paymentDate], [notes], [receiptNo], [paymentMode], [paymentMonth], [sessionId], [studentId], [batchId], [isActive], [createdBy], [updatedBy], [organisationId], [createdAt], [updatedAt]) VALUES (11, NULL, 700, 100, 600, CAST(N'2023-05-17T17:01:13.1170000+00:00' AS DateTimeOffset), NULL, N'1009', N'Offline', N'May', 1, 4, 2, 1, N'Shailendra Tiwari (test@gmail.com)', NULL, 1, CAST(N'2023-05-17T17:01:24.7730000+00:00' AS DateTimeOffset), CAST(N'2023-05-17T17:01:24.7730000+00:00' AS DateTimeOffset))
INSERT [dbo].[StudentFees] ([id], [paymentExpireDate], [feeAmount], [discountAmount], [paymentAmount], [paymentDate], [notes], [receiptNo], [paymentMode], [paymentMonth], [sessionId], [studentId], [batchId], [isActive], [createdBy], [updatedBy], [organisationId], [createdAt], [updatedAt]) VALUES (12, NULL, 500, 50, 450, CAST(N'2023-05-20T15:23:47.9720000+00:00' AS DateTimeOffset), N'note', N'10098', N'Online', N'March', 1, 2, 1, 1, N'Shailendra Tiwari (test@gmail.com)', NULL, 1, CAST(N'2023-05-20T15:24:06.1310000+00:00' AS DateTimeOffset), CAST(N'2023-05-20T15:24:06.1310000+00:00' AS DateTimeOffset))
INSERT [dbo].[StudentFees] ([id], [paymentExpireDate], [feeAmount], [discountAmount], [paymentAmount], [paymentDate], [notes], [receiptNo], [paymentMode], [paymentMonth], [sessionId], [studentId], [batchId], [isActive], [createdBy], [updatedBy], [organisationId], [createdAt], [updatedAt]) VALUES (1002, NULL, 700, 0, 700, CAST(N'2023-05-24T06:44:36.6460000+00:00' AS DateTimeOffset), NULL, N'1234', N'Offline', N'April', 1, 5, 2, 1, N'Shailendra Tiwari (test@gmail.com)', NULL, 1, CAST(N'2023-05-24T06:44:45.7160000+00:00' AS DateTimeOffset), CAST(N'2023-05-24T06:44:45.7160000+00:00' AS DateTimeOffset))
INSERT [dbo].[StudentFees] ([id], [paymentExpireDate], [feeAmount], [discountAmount], [paymentAmount], [paymentDate], [notes], [receiptNo], [paymentMode], [paymentMonth], [sessionId], [studentId], [batchId], [isActive], [createdBy], [updatedBy], [organisationId], [createdAt], [updatedAt]) VALUES (1003, NULL, 700, 0, 700, CAST(N'2023-05-24T06:44:48.0940000+00:00' AS DateTimeOffset), NULL, N'1234', N'Offline', N'May', 1, 5, 2, 1, N'Shailendra Tiwari (test@gmail.com)', NULL, 1, CAST(N'2023-05-24T06:44:54.5580000+00:00' AS DateTimeOffset), CAST(N'2023-05-24T06:44:54.5580000+00:00' AS DateTimeOffset))
SET IDENTITY_INSERT [dbo].[StudentFees] OFF
GO
SET IDENTITY_INSERT [dbo].[Students] ON 

INSERT [dbo].[Students] ([id], [rollNumber], [firstName], [lastName], [middleName], [fatherName], [motherName], [phone], [parentPhone], [address], [city], [pinCode], [joiningDate], [sessionId], [batchId], [isActive], [createdBy], [updatedBy], [organisationId], [createdAt], [updatedAt], [board], [gender]) VALUES (1, N'01', N'Shailendra', N'Tiwari', N'Kumar', N'Ram Kumar Tiwari', N'Pushpa', N'9718623229', N'9817432654', N'464/3 Shiv Parivar Colony', N'Jhansi', N'284002', CAST(N'2023-03-01T18:30:00.0000000+00:00' AS DateTimeOffset), 1, 1, 1, N'Shailendra Tiwari (test@gmail.com)', N'Shailendra Tiwari (test@gmail.com)', 1, CAST(N'2023-05-15T07:02:30.2550000+00:00' AS DateTimeOffset), CAST(N'2023-05-16T09:12:16.6080000+00:00' AS DateTimeOffset), N'UP', N'Male')
INSERT [dbo].[Students] ([id], [rollNumber], [firstName], [lastName], [middleName], [fatherName], [motherName], [phone], [parentPhone], [address], [city], [pinCode], [joiningDate], [sessionId], [batchId], [isActive], [createdBy], [updatedBy], [organisationId], [createdAt], [updatedAt], [board], [gender]) VALUES (2, N'02', N'Bhoopendra ', N'Tiwari', N'Kumar', N'Ram kumar Tiwari', N'Pushpa', N'9827227272', N'9876232312', N'464/3 Shiv Parivar Colony', N'Jhansi', N'284002', CAST(N'2023-03-01T18:30:00.0000000+00:00' AS DateTimeOffset), 1, 1, 1, N'Shailendra Tiwari (test@gmail.com)', N'Shailendra Tiwari (test@gmail.com)', 1, CAST(N'2023-05-15T07:12:00.1290000+00:00' AS DateTimeOffset), CAST(N'2023-05-16T09:12:27.6060000+00:00' AS DateTimeOffset), N'CBSC', N'Male')
INSERT [dbo].[Students] ([id], [rollNumber], [firstName], [lastName], [middleName], [fatherName], [motherName], [phone], [parentPhone], [address], [city], [pinCode], [joiningDate], [sessionId], [batchId], [isActive], [createdBy], [updatedBy], [organisationId], [createdAt], [updatedAt], [board], [gender]) VALUES (3, N'03', N'Vinay', N'Mishra', N'Kumar', NULL, NULL, N'9827262626', NULL, NULL, NULL, NULL, CAST(N'2023-03-01T18:30:00.0000000+00:00' AS DateTimeOffset), 1, 2, 1, N'Shailendra Tiwari (test@gmail.com)', N'Shailendra Tiwari (test@gmail.com)', 1, CAST(N'2023-05-15T08:16:04.1150000+00:00' AS DateTimeOffset), CAST(N'2023-05-16T09:12:38.9880000+00:00' AS DateTimeOffset), N'UP', N'Male')
INSERT [dbo].[Students] ([id], [rollNumber], [firstName], [lastName], [middleName], [fatherName], [motherName], [phone], [parentPhone], [address], [city], [pinCode], [joiningDate], [sessionId], [batchId], [isActive], [createdBy], [updatedBy], [organisationId], [createdAt], [updatedAt], [board], [gender]) VALUES (4, N'04', N'Krishna', N'Dubey', N'Kumar', NULL, NULL, N'900892393', NULL, NULL, NULL, NULL, CAST(N'2023-05-16T05:59:55.8020000+00:00' AS DateTimeOffset), 1, 2, 1, N'Shailendra Tiwari (test@gmail.com)', NULL, 1, CAST(N'2023-05-16T06:00:46.5540000+00:00' AS DateTimeOffset), CAST(N'2023-05-16T06:00:46.5540000+00:00' AS DateTimeOffset), N'UP', N'Male')
INSERT [dbo].[Students] ([id], [rollNumber], [firstName], [lastName], [middleName], [fatherName], [motherName], [phone], [parentPhone], [address], [city], [pinCode], [joiningDate], [sessionId], [batchId], [isActive], [createdBy], [updatedBy], [organisationId], [createdAt], [updatedAt], [board], [gender]) VALUES (5, N'05', N'Ishan', N'Tiwari', NULL, NULL, NULL, N'9878776545', NULL, NULL, NULL, NULL, CAST(N'2023-04-01T18:30:00.0000000+00:00' AS DateTimeOffset), 1, 2, 1, N'Shailendra Tiwari (test@gmail.com)', N'Shailendra Tiwari (test@gmail.com)', 1, CAST(N'2023-05-16T14:10:01.4230000+00:00' AS DateTimeOffset), CAST(N'2023-05-18T15:15:38.6630000+00:00' AS DateTimeOffset), N'UP', N'Male')
INSERT [dbo].[Students] ([id], [rollNumber], [firstName], [lastName], [middleName], [fatherName], [motherName], [phone], [parentPhone], [address], [city], [pinCode], [joiningDate], [sessionId], [batchId], [isActive], [createdBy], [updatedBy], [organisationId], [createdAt], [updatedAt], [board], [gender]) VALUES (1004, N'06', N'Vinay', N'Sharma', N'Kumar', NULL, NULL, N'9878778856', NULL, NULL, NULL, NULL, CAST(N'2023-03-01T18:30:00.0000000+00:00' AS DateTimeOffset), 1, 2, 1, N'Shailendra Tiwari (test@gmail.com)', NULL, 1, CAST(N'2023-05-24T07:43:49.5070000+00:00' AS DateTimeOffset), CAST(N'2023-05-24T07:43:49.5070000+00:00' AS DateTimeOffset), N'UP', N'Male')
SET IDENTITY_INSERT [dbo].[Students] OFF
GO
SET IDENTITY_INSERT [dbo].[SystemSettings] ON 

INSERT [dbo].[SystemSettings] ([id], [sessionId], [email], [isActive], [createdBy], [updatedBy], [organisationId], [createdAt], [updatedAt]) VALUES (2, 1, N'sheelu.imsg@gmail.com', 1, N'Shailendra Tiwari (test@gmail.com)', N'Shailendra Tiwari (test@gmail.com)', 1, CAST(N'2023-05-15T05:05:08.4600000+00:00' AS DateTimeOffset), CAST(N'2023-05-21T10:45:35.2630000+00:00' AS DateTimeOffset))
SET IDENTITY_INSERT [dbo].[SystemSettings] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([id], [firstName], [lastName], [email], [password], [phone], [age], [gender], [isActive], [roleId], [details], [activationCode], [createdAt], [updatedAt]) VALUES (1, N'Shailendra', N'Tiwari', N'test@gmail.com', N'$2a$08$nJ7ry.KjScjv9iDxjk.5AemHNArh33QFr4jy2XuKG3p23tIeGVpye', N'97186999999', NULL, N'Male', 1, 1, N'{
      address1: ''Test'',
      address2: ''Test''
    }', N'test2', CAST(N'2023-05-14T15:47:44.0100000+00:00' AS DateTimeOffset), CAST(N'2023-05-14T15:47:44.0100000+00:00' AS DateTimeOffset))
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Organisa__72E12F1B6270AC27]    Script Date: 5/24/2023 1:35:28 PM ******/
ALTER TABLE [dbo].[Organisations] ADD UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__AB6E6164768B61D3]    Script Date: 5/24/2023 1:35:28 PM ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Analytics] ADD  DEFAULT ((0)) FOR [mobile]
GO
ALTER TABLE [dbo].[Analytics] ADD  DEFAULT ((0)) FOR [clientIpRoutable]
GO
ALTER TABLE [dbo].[Batches] ADD  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[Images] ADD  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[Menus] ADD  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[MenusPermissions] ADD  DEFAULT ((0)) FOR [canView]
GO
ALTER TABLE [dbo].[MenusPermissions] ADD  DEFAULT ((0)) FOR [canAdd]
GO
ALTER TABLE [dbo].[MenusPermissions] ADD  DEFAULT ((0)) FOR [canEdit]
GO
ALTER TABLE [dbo].[MenusPermissions] ADD  DEFAULT ((0)) FOR [canDelete]
GO
ALTER TABLE [dbo].[MenusPermissions] ADD  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[Organisations] ADD  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[OrganisationsUsers] ADD  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[Roles] ADD  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[Sessions] ADD  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[StudentFees] ADD  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[Students] ADD  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[SupportQueries] ADD  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[SystemSettings] ADD  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[Analytics]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Batches]  WITH CHECK ADD FOREIGN KEY([organisationId])
REFERENCES [dbo].[Organisations] ([id])
GO
ALTER TABLE [dbo].[Images]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[MenusPermissions]  WITH CHECK ADD FOREIGN KEY([menuId])
REFERENCES [dbo].[Menus] ([id])
GO
ALTER TABLE [dbo].[MenusPermissions]  WITH CHECK ADD FOREIGN KEY([organisationId])
REFERENCES [dbo].[Organisations] ([id])
GO
ALTER TABLE [dbo].[MenusPermissions]  WITH CHECK ADD FOREIGN KEY([roleId])
REFERENCES [dbo].[Roles] ([id])
GO
ALTER TABLE [dbo].[OrganisationsUsers]  WITH CHECK ADD FOREIGN KEY([organisationId])
REFERENCES [dbo].[Organisations] ([id])
GO
ALTER TABLE [dbo].[OrganisationsUsers]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Sessions]  WITH CHECK ADD FOREIGN KEY([organisationId])
REFERENCES [dbo].[Organisations] ([id])
GO
ALTER TABLE [dbo].[StudentFees]  WITH CHECK ADD FOREIGN KEY([organisationId])
REFERENCES [dbo].[Organisations] ([id])
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD FOREIGN KEY([organisationId])
REFERENCES [dbo].[Organisations] ([id])
GO
ALTER TABLE [dbo].[SupportQueries]  WITH CHECK ADD FOREIGN KEY([organisationId])
REFERENCES [dbo].[Organisations] ([id])
GO
ALTER TABLE [dbo].[SupportQueries]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[SystemSettings]  WITH CHECK ADD FOREIGN KEY([organisationId])
REFERENCES [dbo].[Organisations] ([id])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([roleId])
REFERENCES [dbo].[Roles] ([id])
GO
ALTER TABLE [dbo].[SupportQueries]  WITH CHECK ADD CHECK  (([status]=N'Closed' OR [status]=N'Rosolved' OR [status]=N'Pending' OR [status]=N'InProgress' OR [status]=N'Assigned' OR [status]=N'Open' OR [status]=N'Requested'))
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD CHECK  (([gender]=N'Others' OR [gender]=N'Female' OR [gender]=N'Male'))
GO
/****** Object:  StoredProcedure [dbo].[GetStudent]    Script Date: 5/24/2023 1:35:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetStudent]
	@OrgId INT,
	@SessionId INT
AS

SELECT s.id , s.rollNumber, CONCAT(s.firstName, ' ', s.middleName, ' ', s.lastName) name, s.fatherName, s.motherName, s.phone,
	  CONCAT(s.address, ' ', s.city, ' ', s.pinCode) address, s.joiningDate, b.name batch, b.class, s.board,
	  b.feeAmount, s.batchId, s.sessionId from Students s
	  LEFT JOIN Batches b ON s.batchId = b.id
	  WHERE @OrgId = s.OrganisationId AND s.sessionId= @SessionId




GO
/****** Object:  StoredProcedure [dbo].[GetStudentDailyFeeDashboard]    Script Date: 5/24/2023 1:35:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetStudentDailyFeeDashboard]
	@OrgId INT,
	@SessionId INT
AS
SET NOCOUNT ON
SELECT id, Date, SUM(paymentAmount) Total FROM 
		(SELECT dr.id, CASE WHEN dr.name = 'Date' THEN convert(varchar(10), DATEADD(D, -dr.id, GETDATE()), 103) ELSE dr.name END Date,
		ISNULL(sf.paymentAmount,0) paymentAmount FROM DailyReports dr
		LEFT JOIN StudentFees sf ON convert(varchar(10), sf.paymentDate, 103) = convert(varchar(10), DATEADD(D, -dr.id, GETDATE()), 103)
		WHERE (sf.sessionId IS NULL OR sf.sessionId = @SessionId) and (sf.organisationId IS NULL OR sf.organisationId = @OrgId)
		) temp
		GROUP BY id, Date
		ORDER BY id;
SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[GetStudentDueFees]    Script Date: 5/24/2023 1:35:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetStudentDueFees]
	@OrgId INT,
	@SessionId INT,
	@Date DATE 
AS
SET NOCOUNT ON
SELECT sm.id, sm.name,sm.joiningDate, sm.paymentExpireDate, sm.monthName,sm.batchId,sm.sessionId,sm.feeAmount, sf.paymentAmount, sf.paymentDate
	FROM 
	(SELECT s.id , CONCAT(s.firstName, ' ', s.middleName, ' ', s.lastName, ' (' , s.phone, ')') name,
	   s.joiningDate, DATEADD(M,m.id-1, s.joiningDate) paymentExpireDate, DATENAME(month,DATEADD(M,m.id-1, s.joiningDate)) monthName,
	   s.batchId, s.sessionId, b.feeAmount
	   from Students s
	   LEFT JOIN Batches b ON s.batchId = b.id
	   CROSS JOIN Months m
	   WHERE @OrgId = s.OrganisationId AND s.sessionId= @SessionId AND s.isActive =1
	   ) sm 
	   LEFT JOIN StudentFees sf ON sm.id = sf.StudentId AND sf.paymentMonth = sm.monthName
	   WHERE
	   sm.paymentExpireDate <= @Date  
	 --  (
		--sm.monthId BETWEEN DATEPART(M,DATEADD(D, 1, sm.joiningDate)) AND DATEPART(M,@Date)
	 --  -- OR 
		---- DATEADD(M, DATEPART(M,@Date) - DATEPART(M,sm.joiningDate), sm.joiningDate) >= @Date
	 --  ) 
	    AND sf.paymentAmount IS NULL
	   
	   ORDER BY sm.id ASC
SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[GetStudentFeeRanges]    Script Date: 5/24/2023 1:35:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetStudentFeeRanges]
	@OrgId INT,
	@SessionId INT,
	@FromDate DATE,
	@ToDate DATE 
AS
SET NOCOUNT ON

SELECT s.id , CONCAT(s.firstName, ' ', s.middleName, ' ', s.lastName, ' (' , s.phone, ')') name,
	   s.joiningDate, s.batchId, s.sessionId, b.name batch, b.feeAmount, sf.paymentAmount, sf.paymentDate, sf.id studentFeeId, sf.paymentMonth monthName
	   from Students s
	   LEFT JOIN Batches b ON s.batchId = b.id
	   LEFT JOIN StudentFees sf ON s.id = sf.StudentId
	   WHERE @OrgId = s.OrganisationId AND s.sessionId= @SessionId AND s.isActive =1
	   AND convert(varchar(10), sf.paymentDate, 102)  BETWEEN convert(varchar(10), @FromDate, 102)  AND convert(varchar(10), @ToDate, 102) 
	   ORDER BY sf.paymentDate DESC

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[GetStudentFeeReceipt]    Script Date: 5/24/2023 1:35:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetStudentFeeReceipt]
	@OrgId INT,
	@SessionId INT,
	@Month NVARCHAR(20),
	@studentId INT,
	@FeeReceiptId INT NULL 
AS
SET NOCOUNT ON

SELECT s.id , CONCAT(s.firstName, ' ', s.middleName, ' ', s.lastName, ' (' , s.phone, ')') name,
	   s.joiningDate, s.batchId, s.sessionId, b.name batch, b.class, b.feeAmount, sf.paymentAmount, sf.discountAmount, sf.paymentDate, sf.id studentFeeId
	   , sf.receiptNo, sf.paymentMode, sf.paymentMonth  from Students s
	   LEFT JOIN Batches b ON s.batchId = b.id
	   LEFT JOIN StudentFees sf ON s.id = sf.StudentId
	   WHERE @OrgId = s.OrganisationId AND s.sessionId= @SessionId AND s.isActive =1
	   AND sf.paymentMonth =@Month AND s.id = @studentId AND (@FeeReceiptId IS NULL OR @FeeReceiptId = sf.id)
	   ORDER BY sf.paymentDate DESC

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[GetStudentFees]    Script Date: 5/24/2023 1:35:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetStudentFees]
	@OrgId INT,
	@SessionId INT
AS
SET NOCOUNT ON
SELECT *, ISNULL(piv.January,0) + ISNULL(piv.February,0) + ISNULL(piv.March,0) + ISNULL(piv.April,0) + ISNULL(piv.May,0) + ISNULL(piv.June,0)
		+ ISNULL(piv.July,0) + ISNULL(piv.August,0) + ISNULL(piv.September,0) + ISNULL(piv.October,0) + ISNULL(piv.November,0) + ISNULL(piv.December,0) totalAmont FROM 
(SELECT sm.id, sm.name, sm.joiningDate, sm.monthName,sm.batchId, sm.sessionId, sf.paymentAmount paymentAmount, b.feeAmount
	   FROM  
	   (SELECT s.id , CONCAT(s.firstName, ' ', s.middleName, ' ', s.lastName, ' (' , s.phone, ')') name,
	   s.joiningDate, m.name monthName, m.Id monthId, s.batchId, s.sessionId
	   from Students s CROSS JOIN Months m
	   WHERE @OrgId = s.OrganisationId AND s.sessionId= @SessionId AND s.isActive =1) sm
	   LEFT JOIN StudentFees sf ON sf.studentId=sm.id AND sf.paymentMonth = sm.monthName
	   LEFT JOIN Batches b ON sm.batchId = b.id) smo
	   pivot
	   (
		Sum(smo.paymentAmount)
		for monthName in (January,February,March,April,May,June,July,August,September,October,November,December)
	   ) piv
SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[GetStudentMonthlyFeeDashboard]    Script Date: 5/24/2023 1:35:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetStudentMonthlyFeeDashboard]
	@OrgId INT,
	@SessionId INT
AS
SET NOCOUNT ON

SELECT m.id, m.name paymentMonth, ISNULL(Sum(sf.paymentAmount),0) Total FROM Months m
		LEFT JOIN StudentFees sf ON  m.name=sf.paymentMonth and sf.sessionId = @SessionId and sf.organisationId = @OrgId
		GROUP BY m.name, m.id
		ORDER BY m.id
SET NOCOUNT OFF
GO
