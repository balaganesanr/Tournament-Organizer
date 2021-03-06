--USE [TournamentOrganizer]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_User_UserState]') AND parent_object_id = OBJECT_ID(N'[dbo].[User]'))
ALTER TABLE [dbo].[User] DROP CONSTRAINT [FK_User_UserState]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_User_Role]') AND parent_object_id = OBJECT_ID(N'[dbo].[User]'))
ALTER TABLE [dbo].[User] DROP CONSTRAINT [FK_User_Role]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_User_ModifiedBy]') AND parent_object_id = OBJECT_ID(N'[dbo].[User]'))
ALTER TABLE [dbo].[User] DROP CONSTRAINT [FK_User_ModifiedBy]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_User_Gender]') AND parent_object_id = OBJECT_ID(N'[dbo].[User]'))
ALTER TABLE [dbo].[User] DROP CONSTRAINT [FK_User_Gender]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_User_CreatedBy]') AND parent_object_id = OBJECT_ID(N'[dbo].[User]'))
ALTER TABLE [dbo].[User] DROP CONSTRAINT [FK_User_CreatedBy]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Tournament_GameId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Tournament]'))
ALTER TABLE [dbo].[Tournament] DROP CONSTRAINT [FK_Tournament_GameId]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TeamParticipant_Team]') AND parent_object_id = OBJECT_ID(N'[dbo].[TeamParticipant]'))
ALTER TABLE [dbo].[TeamParticipant] DROP CONSTRAINT [FK_TeamParticipant_Team]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TeamParticipant_Participant]') AND parent_object_id = OBJECT_ID(N'[dbo].[TeamParticipant]'))
ALTER TABLE [dbo].[TeamParticipant] DROP CONSTRAINT [FK_TeamParticipant_Participant]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Team_SubdivisionId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Team]'))
ALTER TABLE [dbo].[Team] DROP CONSTRAINT [FK_Team_SubdivisionId]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Subdivision_TournamentId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Subdivision]'))
ALTER TABLE [dbo].[Subdivision] DROP CONSTRAINT [FK_Subdivision_TournamentId]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Stage_Subdivision]') AND parent_object_id = OBJECT_ID(N'[dbo].[Stage]'))
ALTER TABLE [dbo].[Stage] DROP CONSTRAINT [FK_Stage_Subdivision]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Score_Team]') AND parent_object_id = OBJECT_ID(N'[dbo].[Score]'))
ALTER TABLE [dbo].[Score] DROP CONSTRAINT [FK_Score_Team]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Participant_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[Participant]'))
ALTER TABLE [dbo].[Participant] DROP CONSTRAINT [FK_Participant_User]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Participant_Subdivision]') AND parent_object_id = OBJECT_ID(N'[dbo].[Participant]'))
ALTER TABLE [dbo].[Participant] DROP CONSTRAINT [FK_Participant_Subdivision]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Match_Team2]') AND parent_object_id = OBJECT_ID(N'[dbo].[Match]'))
ALTER TABLE [dbo].[Match] DROP CONSTRAINT [FK_Match_Team2]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Match_Team1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Match]'))
ALTER TABLE [dbo].[Match] DROP CONSTRAINT [FK_Match_Team1]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Match_Team]') AND parent_object_id = OBJECT_ID(N'[dbo].[Match]'))
ALTER TABLE [dbo].[Match] DROP CONSTRAINT [FK_Match_Team]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Match_Stage]') AND parent_object_id = OBJECT_ID(N'[dbo].[Match]'))
ALTER TABLE [dbo].[Match] DROP CONSTRAINT [FK_Match_Stage]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_User_CreatedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User] DROP CONSTRAINT [DF_User_CreatedOn]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_User_IsDeleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User] DROP CONSTRAINT [DF_User_IsDeleted]
END

GO
/****** Object:  Table [dbo].[UserState]    Script Date: 28-05-2017 13:17:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserState]') AND type in (N'U'))
DROP TABLE [dbo].[UserState]
GO
/****** Object:  Table [dbo].[User]    Script Date: 28-05-2017 13:17:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[User]') AND type in (N'U'))
DROP TABLE [dbo].[User]
GO
/****** Object:  Table [dbo].[Tournament]    Script Date: 28-05-2017 13:17:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tournament]') AND type in (N'U'))
DROP TABLE [dbo].[Tournament]
GO
/****** Object:  Table [dbo].[TeamParticipant]    Script Date: 28-05-2017 13:17:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TeamParticipant]') AND type in (N'U'))
DROP TABLE [dbo].[TeamParticipant]
GO
/****** Object:  Table [dbo].[Team]    Script Date: 28-05-2017 13:17:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Team]') AND type in (N'U'))
DROP TABLE [dbo].[Team]
GO
/****** Object:  Table [dbo].[Subdivision]    Script Date: 28-05-2017 13:17:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Subdivision]') AND type in (N'U'))
DROP TABLE [dbo].[Subdivision]
GO
/****** Object:  Table [dbo].[Stage]    Script Date: 28-05-2017 13:17:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Stage]') AND type in (N'U'))
DROP TABLE [dbo].[Stage]
GO
/****** Object:  Table [dbo].[Score]    Script Date: 28-05-2017 13:17:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Score]') AND type in (N'U'))
DROP TABLE [dbo].[Score]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 28-05-2017 13:17:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Role]') AND type in (N'U'))
DROP TABLE [dbo].[Role]
GO
/****** Object:  Table [dbo].[RefreshTokens]    Script Date: 28-05-2017 13:17:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RefreshTokens]') AND type in (N'U'))
DROP TABLE [dbo].[RefreshTokens]
GO
/****** Object:  Table [dbo].[Participant]    Script Date: 28-05-2017 13:17:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Participant]') AND type in (N'U'))
DROP TABLE [dbo].[Participant]
GO
/****** Object:  Table [dbo].[Match]    Script Date: 28-05-2017 13:17:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Match]') AND type in (N'U'))
DROP TABLE [dbo].[Match]
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 28-05-2017 13:17:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Gender]') AND type in (N'U'))
DROP TABLE [dbo].[Gender]
GO
/****** Object:  Table [dbo].[Game]    Script Date: 28-05-2017 13:17:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Game]') AND type in (N'U'))
DROP TABLE [dbo].[Game]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 28-05-2017 13:17:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Clients]') AND type in (N'U'))
DROP TABLE [dbo].[Clients]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 28-05-2017 13:17:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Clients]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Clients](
	[Id] [nvarchar](128) NOT NULL,
	[Secret] [nvarchar](max) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[ApplicationType] [int] NOT NULL,
	[Active] [bit] NOT NULL,
	[RefreshTokenLifeTime] [int] NOT NULL,
	[AllowedOrigin] [nvarchar](100) NULL,
 CONSTRAINT [PK_dbo.Clients] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Game]    Script Date: 28-05-2017 13:17:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Game]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Game](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Game] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 28-05-2017 13:17:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Gender]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Gender](
	[ID] [tinyint] NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Match]    Script Date: 28-05-2017 13:17:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Match]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Match](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[StageId] [bigint] NOT NULL,
	[Team1Id] [bigint] NOT NULL,
	[Team2Id] [bigint] NOT NULL,
	[ScheduledDate] [datetime] NOT NULL,
	[WinnerTeamId] [bigint] NULL,
 CONSTRAINT [PK_Match] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Participant]    Script Date: 28-05-2017 13:17:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Participant]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Participant](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[SubdivisionId] [int] NOT NULL,
 CONSTRAINT [PK_Participant] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[RefreshTokens]    Script Date: 28-05-2017 13:17:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RefreshTokens]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[RefreshTokens](
	[Id] [nvarchar](128) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[ClientId] [nvarchar](50) NOT NULL,
	[IssuedUtc] [datetime] NOT NULL,
	[ExpiresUtc] [datetime] NOT NULL,
	[ProtectedTicket] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_dbo.RefreshTokens] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Role]    Script Date: 28-05-2017 13:17:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Role]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Role](
	[Id] [tinyint] NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Score]    Script Date: 28-05-2017 13:17:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Score]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Score](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Team1SetScore] [tinyint] NOT NULL,
	[Team2SetScore] [tinyint] NOT NULL,
	[WinnerTeamId] [bigint] NULL,
 CONSTRAINT [PK_Score] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Stage]    Script Date: 28-05-2017 13:17:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Stage]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Stage](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[SubdivisionId] [int] NOT NULL,
 CONSTRAINT [PK_Stage] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Subdivision]    Script Date: 28-05-2017 13:17:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Subdivision]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Subdivision](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[TournamentId] [int] NOT NULL,
 CONSTRAINT [PK_Subdivision] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Team]    Script Date: 28-05-2017 13:17:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Team]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Team](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[SubdivisionId] [int] NOT NULL,
 CONSTRAINT [PK_Team] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TeamParticipant]    Script Date: 28-05-2017 13:17:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TeamParticipant]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TeamParticipant](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TeamId] [bigint] NOT NULL,
	[ParticipantId] [bigint] NOT NULL,
 CONSTRAINT [PK_TeamParticipant] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Tournament]    Script Date: 28-05-2017 13:17:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tournament]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Tournament](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[GameId] [tinyint] NOT NULL,
 CONSTRAINT [PK_Tournament] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User]    Script Date: 28-05-2017 13:17:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[User]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[User](
	[Id] [uniqueidentifier] NOT NULL,
	[Username] [nvarchar](256) NULL,
	[Password] [nvarchar](max) NULL,
	[Name] [nvarchar](200) NULL,
	[Avatar] [varchar](500) NOT NULL,
	[GenderId] [tinyint] NOT NULL,
	[RoleId] [tinyint] NOT NULL,
	[StatusId] [tinyint] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[LastLoginDate] [datetime] NULL,
	[LastPasswordChangedDate] [datetime] NULL,
	[ForgotPasswordToken] [varchar](500) NULL,
	[ForgotPasswordTokenSentOn] [datetime] NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedOn] [datetime] NULL,
	[SecurityStamp] [nvarchar](200) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserState]    Script Date: 28-05-2017 13:17:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserState]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserState](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](10) NOT NULL,
 CONSTRAINT [PK_UserStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Clients] ([Id], [Secret], [Name], [ApplicationType], [Active], [RefreshTokenLifeTime], [AllowedOrigin]) VALUES (N'tournamentOrganiser', N'ABvsmgLhB8tVemwUwoRfNOXi7UKB/CoB7Orti0Y2oRiEUlnK2Hejly2EDkX7mnxt7HOhrROkR8R0yPZtdlgPVDI=', N'AngularJS front-end Application', 0, 1, 7200, N'http://localhost:9524')
GO
SET IDENTITY_INSERT [dbo].[Game] ON 

GO
INSERT [dbo].[Game] ([Id], [Name]) VALUES (1, N'Table Tennis')
GO
SET IDENTITY_INSERT [dbo].[Game] OFF
GO
INSERT [dbo].[Gender] ([ID], [Name]) VALUES (1, N'Male')
GO
INSERT [dbo].[Gender] ([ID], [Name]) VALUES (2, N'Female')
GO
INSERT [dbo].[RefreshTokens] ([Id], [Username], [ClientId], [IssuedUtc], [ExpiresUtc], [ProtectedTicket]) VALUES (N'AATEeElB2q28sFaWIBUrywkkWwfYws25iabsMy49BpHSIyENby3irglpZyNLfye4X8qyelmtTOOmOj+VB4yD+EU=', N'jeevanandanj@gislen.com', N'tournamentOrganiser', CAST(N'2017-05-28 01:55:49.597' AS DateTime), CAST(N'2017-06-02 01:55:49.597' AS DateTime), N'Af9Q6PMCPqchF_1tWVkmvjtab6sD26bZQEhMSXW1HQzk1xGjx9NpXDj9pCYqnbNczsOvso5Ubs9xjTAhWvk1e3ldncJn_InUnBTMWfR9ec3Dvw0VVg4tb1OB3KfkcfGefVt1TU1Psn4i8Y7f-DX9rKUZx34kAK7G7othlYfh9_3eTc_aXutJ7VAn9s493pgZGg7DcGc3XmESOzhSQKWkPtoC7oWVYI5CaQ_erJnFQd1qcRCd05jOu4oUT-tXE0nuCgnTZdXg0ea8VTsU1EN8v3vGvxo9nD7ZfyJnkoRlQQIjBBxpemB1OCmpHuxTfXCG3JHh_US6iNLpN3laReAxX58uqyySFuI6t-16AZ8CA4QVDxWP0HqmN9FyOHStsNsrgzQEpg5jAsg53bVgz7-5_qnGDd-YEHacnmFlfU8XLNjXohBd6_Z_f1aXtwgBWKDqS4O5scstqXHQ3UdlsoSCWopUVI8gjwRbeoYYJ7bQ7RhiDq_BflX-Nit5xonH7JM2suOWxEEiVTIkj0gQuAbcTJ2uT4uKlull_IXUyIO0Sw2qHSsVUucID0tTKzHzcnZs')
GO
INSERT [dbo].[RefreshTokens] ([Id], [Username], [ClientId], [IssuedUtc], [ExpiresUtc], [ProtectedTicket]) VALUES (N'AB8QtfyGqJBPFGJjjR7D5MxJuTxu7U2IHwbA0JW6LzowuwoMh1NMuVCeHP/Ee6+FIiNCcsWi0HIvYR8XhQM/2zQ=', N'jeevanandanj@gislen.com', N'tournamentOrganiser', CAST(N'2017-05-28 02:01:42.147' AS DateTime), CAST(N'2017-06-02 02:01:42.147' AS DateTime), N'Ini16JjJG6fPqDRZbKEVbO3hhOkh7GUZHZuKd66Wz5o7jAtVPuOibxtGMoVARoyMFDQMLdEVGUZLmRshY0eQBARTkWDQM4Q_SizbxpYaW9LNuQFQ2m9sXfiYwvolroB8vpRZDERwNxyBiMCmeMI1jdY1aZK8kEnQg3valskK5KUQeV88qJfP1gMUqrFxh1-yz8j_Y38POofEKIOCh9Fzkq3TPXine3pd2ictHSdc10Iz1c3LeXGcbIZazdRd2zV8jyGciq7nIhAkwoZqVV0wgSz41okoZmgYYPOl1PqFU6Wu1h0MPh8Yuauq9_r1VcbvDvV18h9mepiSOWxNGY2mtLsqXcfQiyw0MU0LUKFun3xQWACVdRfu1u4JeJZHPIdBaYjHZL6FLfe_O3CrPjEOnFyyMxydjLH_v88CU2VuJfTbs_hrG5plsBs9iLpbjWirWufUEa0gpeb6YLK0ScLsr1230kOv9tKb4SOXuavJc4VJ1dI5bgZRt3JRsh7NCeSFrtzbtWqXbMVU5hYkm9JWp8H3MGyxrIb2Gav0_CKBVcvMouLvM6KwUGhUSUINivKx')
GO
INSERT [dbo].[RefreshTokens] ([Id], [Username], [ClientId], [IssuedUtc], [ExpiresUtc], [ProtectedTicket]) VALUES (N'ABdZN2JIAKiNRzBbW8gEEVArjh6x3N3fUCIywK9LY46d9LORAYaTGhD9YXkgfkXhkGzLq8rsAihZNfslJB7Ju9E=', N'jeevanandanj@gislen.com', N'tournamentOrganiser', CAST(N'2017-05-28 01:52:06.997' AS DateTime), CAST(N'2017-06-02 01:52:06.997' AS DateTime), N'pSuLLsgnkpMRrWk-1AnI8nwwB8AOOASMBZt9K5yzHWCTR3WlkS1vzYeEjJ2GYnP8fcb91zXXYVRzCmqd3G83rbK_mb7nVnSWu_XF2zdzSqQOArGmuWvjj6JNM5dCbCrF1zPYm3lwJtLJRkOJwM3nixYVxsVsCBEAEg2zuDcFpn00rPtqajmm_wsiJzlkwxPe4aCOu9wUw3euvkDNp4fj8fHwOO7aGlro6AUa3jQMOSX5DO_172NlmwAK47_n3w4DfFddQXrFxLk0QLARE3F2inZGhngsMfpX5zz9TPGcIvrEB5Qrt0E2ATsbo6K8PUlF51bdpBAB2mfk8cEqKzvxXv4PDUhtueITWeNvLM4xcooJjmgeAYQzkQpoy69OJIFNGfJoHGzBMJeGFgXu6cNahCius_5OSr1i2_tlKAjEqvYXm7jNdsXMBT2enxfrMYEPZGBqumm3h81WVEJvZfWkbqUZyzRxPIYmBtfym6Wg2kBYvyIVPRWfXkWuvqkb5-2hNXvXZlDZJF-gpIcMPEc44Se4dkJ1c9LRmdCKq1w-Tcs3qeQ7Dd9oApsE37C79Pwg')
GO
INSERT [dbo].[RefreshTokens] ([Id], [Username], [ClientId], [IssuedUtc], [ExpiresUtc], [ProtectedTicket]) VALUES (N'ABShp8wtunKefSMvKyqwraVAikYc833a24Mft+HJohUsZGqByeantevGgbefOLzL97THJXjXQXRC6ey36gwZ1KE=', N'jeevanandanj@gislen.com', N'tournamentOrganiser', CAST(N'2017-05-28 03:03:59.373' AS DateTime), CAST(N'2017-06-02 03:03:59.373' AS DateTime), N'UG1PAm7g6FxRE1rT_kV51XnY-hjNIdwGUEMpJxfqwwGCHHuOwGV1fiOeGxfsFh7JpmJtdFH5-bfJh1hI1cvfzaGJCtB46iRVj5s9lUi84vHbdNIDoffJ87sxQrcDHZeI3X9Vemto0o8ac7j1GS_toIcKFTp3NE694J6sFAGW9uIXrtUXNbeWKKNLH5w0zfoocx9xeD-2MSksLIU2J44n6Z0KL8o4i_5xbuHrq3i85ah_zNmKV_XcDUN_9d5803iE529gamFuKfLx5rsf4f5HUlI-1b-XWG1v6WQfYQmdd71jgOBHw8VavKtID200UXTKZzi2WQlpfCuSJPc5Ffai1JOFjNfaA4uwwLvlDMA2HLozU6bFc4A3v_giPN0cknIBxePf-qEnmpfsqll6Fn9Ioo5Toe_EVcHcjArA3Fs7e8a7-Y3GTW71FLBIBhBAWDVmJGphat_u4iY71zjtWfk6WQpJyX5tus8ldHeQj6S_PSvw9UVfZ0nrJdbEiUsuVy_s6QFEZUic_JchGkxkC7-cFsPqXTe7wV_IGJgBgRHQV7jcn1rEKJ_2lSqDMKiK5z9-')
GO
INSERT [dbo].[RefreshTokens] ([Id], [Username], [ClientId], [IssuedUtc], [ExpiresUtc], [ProtectedTicket]) VALUES (N'ADiw3sYmby39M9ql87B1EcayjItnNX0hwKNBy1zloKautG9T9Ly+pYy9zruiWUG85CLN9bRezREBVyX4/OKtlzU=', N'jeevanandanj@gislen.com', N'tournamentOrganiser', CAST(N'2017-05-28 06:52:45.020' AS DateTime), CAST(N'2017-06-02 06:52:45.020' AS DateTime), N'Wlgici33C1FihUCsZIgJbh9be9B3PwWfXKTvpNZGKYQ-Z83eey7DzJOOQxruCoLHTj63F7zaluWqy2kWH48NpircDp25jE3m6GFmhg06bxu7CSUmstyQu5RsDKCmVPh9jDiyqyRDOumn7CdcEGwPSE75sheRrXUAxLsQRUSGkgJ95tHFSmjDJE2-w98rwjLhGFLmeDn1gNfPL1ebkteqV21qZMotraa7_Z5kCT4wcZ0XNZYpJsL62rzKaW7_9f1HwTz_ThpIvY616yMrGbiXmucCmoko7mwNc9yyHRPw34ZvMaoNnX9UT37lwG7w3OZJnCoVNdmaoswB8eoXXNnEc1B-h_YNtoswWIyzvY3zdL9hK3X3DeotJUnNpemg3fYr8t1GK3_jtebmSP_8_Vk4sJGHoNJpCC0g_Qo3dEL-SmYHa1LxX3OzFPsDV23F-7H62dzz5qYSjK5Ii6yJ0a5M6VXvVCH5c1G7XsWQ10-M1jrfzAYGi58ghWB0GEVT0swzW29HL4HkLmR_6iDeDFTESExhiuDpZtl_9GL-Kbk4ro3swkUvV4vKHcd6UIRleE89')
GO
INSERT [dbo].[RefreshTokens] ([Id], [Username], [ClientId], [IssuedUtc], [ExpiresUtc], [ProtectedTicket]) VALUES (N'AE5yWjgeQ75NFOzpH6rk+3TBnbqHTXbGBUgAX7jgUkZ5iV7NlInbnWhzz9M0O91i+qPPO7KADnT/DJ+ncLHjl7Q=', N'jeevanandanj@gislen.com', N'tournamentOrganiser', CAST(N'2017-05-28 01:55:07.550' AS DateTime), CAST(N'2017-06-02 01:55:07.550' AS DateTime), N'u-91MFCFQ16RmCvrDB0Xu0_1jQ2nN5h4TCsfuWZW0b4ycKyvWBARhWQIjYGwCvXuateFjnmWsVAVgyo_2fo79LxhTzu_OirnZNkmFYWWQIoGl1JYkLbLrRBrRC8ro-R1MCClGIzb2-xCDHbpsWt3hStZhOEEXit07TiH5CRm2nfIhlP4SW91x6lHSH8aw78GDHLLr5TJqQjYgE_KM0_651VwLYcocqqCz5I7l74u3lIgAs7I4s1P4crpPD6gxZhvfpzfGbxsG-XODZyqpBocOJ4zew0_zzui15uVWd4T2-HAeFXSpn_rjvu8qq8Ztr0SztoawkkhEUT7K5iJPVuKYSrccr6bfzpu-YHuXmyhjaMyghTkfIzF2a5s5vhpTwyc0ataGmorI2_U0JP7RFS5F-fnLIVqNuwhub499R7tGVlK9IEshHyahIMGQZOh9mjQeLJKV6vUrV465fgbtLrC-GJA-6aoJ5YULGmC9qlsU3yipspdTL-Ack97TSvQJByvAF1PL8CzSQBzvUBisCuyKnVdNfT9YxDtQMM0jOmC5jQvJse3qEaR3f4V1F8b8wa1')
GO
INSERT [dbo].[RefreshTokens] ([Id], [Username], [ClientId], [IssuedUtc], [ExpiresUtc], [ProtectedTicket]) VALUES (N'AG74+867+1DGb5ifMe5/JMkLXag+NMxQjluOUayED0rhRKkYZJmNTPkxaUx+CFeO3WrHihtEM3bzhjxd6utzX/I=', N'jeevanandanj@gislen.com', N'tournamentOrganiser', CAST(N'2017-05-28 01:35:56.420' AS DateTime), CAST(N'2017-06-02 01:35:56.420' AS DateTime), N'VHRGzmXz0o8SQOqrP9IJaWFgC82SOKcxmREtWRBlKXgQFJzb27fEj7epszUzyGG-W2IvnyevPPSxaoa9NyipeeQujcyQPOwMlDTutkhEEEfZxA3afUQjOMwjfh-54xaVABHAzKf20p7is_1ZMLb9DzXWdlgweOdoLisrdgFc2bvC4U4Ae_ADviLqOEAhYtdZOj_wxorhrluNwhlNyEJrpTheOcbpAG4deQJRO4BlkaqTR997DNkDXNZkij9q-XZp9a9OsqvAeNBYONKSvqkyLMCbD6lTmNxEwLr7q9c5CKE4BURSCT-3axc7R00qt4210uIW4jouoDT4e83i0rfDNA2iYv_5IeoZ3OMvFXQZRWjItOLKwWIy3rVdOagkGJY_9V2AokbyTo2_U8X6nY-SLWE_VqjxsVyHsSRDkoYsWzCDJHGsPSocswaT-xBGrETiQkWBl94CCM7C9N_-ptMxE_SZiT2Wg0Pi2Do2cNyrl5kTVDEjBTzBh80CcfoWWUKOnBtpjjikSQ_JiROjCi3y7eCzG3FN2Z8iJWn4h4cmsqjs4jDIznJjFUucsgCJDVAY')
GO
INSERT [dbo].[RefreshTokens] ([Id], [Username], [ClientId], [IssuedUtc], [ExpiresUtc], [ProtectedTicket]) VALUES (N'AGg9CSm5DTO8Nkc2de5AFqqUZ8yl5DjAImAmUtqtoiCKACk7J/t/X7jfXWFXmofTrwVJMEHI3ruP3Tj3AVGdg/k=', N'jeevanandanj@gislen.com', N'tournamentOrganiser', CAST(N'2017-05-28 03:50:23.043' AS DateTime), CAST(N'2017-06-02 03:50:23.043' AS DateTime), N'fR9P2QgbzmAWGmlGdNF401D1YWPEoEWy887ocQs_u2pMgG6oOvn5acqVJ4Oqu4bP5MnZNC5BtA6-9jY-OMNdYsub9nGvy_zv1mJ9oej8ON5j6AqT2Jr6TumIeBCcHXsg0WfaC4SsavYv_VkN-6ivDFVim8Kxqr0TBlaZCxbkhQJJToNrZQ8NiHkmVX4JWmHiKfxOi67M481dRiOlZvwQ_ZEZbDJAxhnRjVD3WAiTHPIVvEbh37pPAJRv4kadYvQUZyxJuD00_kx2jwIQN9v2MjpINVAWQCQ7-4mc3Z6UIXLVrrPAvQ1AGiiYHZ0DdVvkUFkNnWtHyb-EQ0HAZE0Ad6sQHSrjzULESixju3KMAuD-_eOVqXqIPr_redcMYV7Zq43_iJdmLCU69jgKxJAZE1gfIBcW6Src7Fy8wmxZ6mEXuTyomT6rs9GGE2JqDiFIqkNL5vToQX7bYiV-cE0OYCow8Yvye9GqnbcwfYK1mYZrfzFDprNr3BFoGAw9PxRDDiFmbqfFJ55HHM5RpKvept9yla6lOjiSD6a6olC6rEI5ZMqmQMCpb_0WXhZccvDa')
GO
INSERT [dbo].[RefreshTokens] ([Id], [Username], [ClientId], [IssuedUtc], [ExpiresUtc], [ProtectedTicket]) VALUES (N'AGjJ07d789zpR0oqHLxNompr5HFrCklUzH/Azj1zd8RkDypxVlfxAGBJt09/Ql3yUw2nV2P+45GQV/6Lodpmft8=', N'jeevanandanj@gislen.com', N'tournamentOrganiser', CAST(N'2017-05-28 02:06:34.857' AS DateTime), CAST(N'2017-06-02 02:06:34.857' AS DateTime), N'NQBe4EI6ViL-MemB2NHoe6zvPlRXEFDz_iqpz3BV6pHT59r9qy6a5W3rEw0CaZ8u-s5Qii6ILdauoQ0i72isCig_iQOt5JtYCGBGvtxnFQME5b8JIsYRO5bNdMmBxX39QyzlPtEbXkLiTD7tNe0DFNiX0W7kShslaDhXJFx7Z2-XUDts0iEDCVStpO2Hke1DJZX2Qn_8MHCvhmMMj7NJKIavsc2WPRZVOln2NZXfZJPNvt-6sD02xmzlfDJZkxOMIOCVSiKYkqnBrf5OOKCcFX_C0a0lx3gKSiVwrAxs7tYFfv6fKiN8yi0d_Vmm3yqWeCS-ywKaRLJysFOMkg7uBNNoYpyqk6ynMc4N78dfcMfbs-NbfFdXrprDxGs8lqNNRhtoFmMzkTm-Qtm9QPe-qPqIeo5kgVY_nVqfszlP4eS1ASs1gMeLaKDO-hcS5BuDmtjsQv1e3_qB2W9PcFLFEe7-frRrPRJSZm7KEH2ggUoBUTrf-pfqBDUbNg90IKJmr0X33hWm6BMdeWpLJ0dDdOUGv9e73Pg-6e7kfLD6gJXNJeBI5f-es5iibtOJYN4w')
GO
INSERT [dbo].[RefreshTokens] ([Id], [Username], [ClientId], [IssuedUtc], [ExpiresUtc], [ProtectedTicket]) VALUES (N'AGsWT6lDfuWxhvTa645v3bXZYU4ShjVgw2ObpItna+Kg0ZN2kGa+mFCEFevTldaIRHIo5Img7e+Lo6Zc/Jgod+s=', N'jeevanandanj@gislen.com', N'tournamentOrganiser', CAST(N'2017-05-28 03:11:08.477' AS DateTime), CAST(N'2017-06-02 03:11:08.477' AS DateTime), N'owqka50fSB0Q_0cY1m6Ap-S3fjjN-vfo_8FAx_CdhBqUr4FRijyj4XYV3YN9mcHMemWmHmU1knp3sBQS_PNFKSkBJFunUi7zIKzmo0wmW_JcdmziC4AiHG88280GTjtKRxx0LuYLW-h0WfFpWrtLXcqKayUWd6H3rJQo6K2gbnCNshd8cl_SR5OBIG5Op2d2wspDr-mXwb0LICpUUeQ_Yw1XqrQqC9F9OLMi-Yab86DHTauvQczaGZUHHoV84d3zYsBc_NtDj-Ka2Oqf9-tITto_tB_wg0s7k63Y3H8kBpYtMrHmGF4x7Id5bKofddc-frRkKAU-JTMsLWQXP5V4MTtEz6N7QIiktTGEN_GIjnwsYERku4pZlp5y6vFUiC-BCpoAFtL3W9Ok_umz2_yBJdQcE1JE5dsLbmNWirkxbYP1SnVDOrrRZfTEcR5XQga-M8TYbR1_2rCTvxsCd2UNyCfC8qbJ8zYfbQYJ9y2qx2CbIAe44dFFCa9Mbs_m_vtc9qEozkxP4pERc8B3PpVjaXmxdymg3P-dMrOq0ldCcA-8zySBrF7CxB2r-npe_YKS')
GO
INSERT [dbo].[RefreshTokens] ([Id], [Username], [ClientId], [IssuedUtc], [ExpiresUtc], [ProtectedTicket]) VALUES (N'AHJrwxaSMVFzpYzPTIlRfMbDI0DOIdgGQ7a8Kgt/cQSc4SNq2ftA+8vnjcPC06sqar+QZsHSuruh7oJ3Awc9Q6M=', N'jeevanandanj@gislen.com', N'tournamentOrganiser', CAST(N'2017-05-28 01:49:40.203' AS DateTime), CAST(N'2017-06-02 01:49:40.203' AS DateTime), N'MyV0ObfhSVyuPowBO606Uda-THvKZ6ITDInzUwFXTCPUdArv7xDXg0rD-RHsy7hbOTK4e3SzRgIdgC1Ru_nyyhd04AJcHC7mAsMhlLQHY-dA_qOeLGvgkopqAhQ8_9rR_9H5pN5yQmeMP_qPLeESHrSfEVYN1PfHmwkqBDYQhcsUykGcPbreF1m8KSe0DdQdWDgWr8gDERX6POFU2JEwfg9Cm7ksaa24IRRuxaFrveKxXW-HNXl3KTz9ygXbsqDbT4sUrPWgTPDR_uZbgyeExwfUeosb97CucV091-2kSmWbG97zeKHjzw-kA7kbt0wvO4us6F0mtuGsdyjqVqEK9y-8R3IzWvCZj7NTYLoCUDRU0i8dryVYLKwpoMv3A-4TV7ge6a891VUHJagih9mlHkIXHGprMLs5KpYVS1yHDdiNDM0sTWej4WYRCrGFNLUcldyh2lz9vvte_awb98NzUjuAZl80lroY3OyBtlyeVKE5AYaHZ98sQJcTObkOvHxfAcPXY1LcCEtr-CAGx9Lxrc0kGo5Yq4n1Lk2ZjDszvRLgN5oiqjsgYd86f_18QzUs')
GO
INSERT [dbo].[RefreshTokens] ([Id], [Username], [ClientId], [IssuedUtc], [ExpiresUtc], [ProtectedTicket]) VALUES (N'AHOa4s0hkcr1S33p6wgu7whlDkxr88m/lIP2DZBKSAV4IDlb7y0fN4BHFvfiqHPTUYAjyP/y6Y66f1dVWzACNng=', N'jeevanandanj@gislen.com', N'tournamentOrganiser', CAST(N'2017-05-28 06:43:14.807' AS DateTime), CAST(N'2017-06-02 06:43:14.807' AS DateTime), N'9CXIQEaZDndc9A_2j5PmFId0EULzVP3xWLk6SQQdNNX0QzoFuh70DKHjQbaoK2F6mYn1NQIyQn5eyQ94fTuTihM4KarG8xDfWwYaI0Akni7ATSt2got2c6PnY6Ds-MHHWfKIofQI8gH99PR71qtPOITgVy5VfhuTMVwp6TbDNpVRVR7Ja-RUF5UipYzpC-pEMgrWlIb7f9uOQ2OdOmdHj3-4Qo56J277gsjOXZxNc_byreA1n481C-BdN2GgMK34PvIAqlh5QNZscVQnFxVaIae3qDZow8f8pGolEL_V32Q8Jw0GgO9qSffGL6cdB1jD5xZWVgf2sZdHwXvsdkQAq71g2ZtKpzvdTHp-LD6W-apGG8YFn-6XRPHVBzQfDGxodhC3HylCaucE7xAC4iaQp2NVAqTkJnl8aBFY60bHOLTPA9AFbkV4x0KMXHosORpfjS7k9WAZPm02SCj0qEWuxiFT9IKp6OLx13sC6BHxwZm45yS4YKq37BoNblslpAugjwueILW6fF_z__cu00N0kLqT3r3g7LmQNObaWy5GMa8Kd5fvnATsuxlQc_OY48tz')
GO
INSERT [dbo].[RefreshTokens] ([Id], [Username], [ClientId], [IssuedUtc], [ExpiresUtc], [ProtectedTicket]) VALUES (N'AIjOm0Ox6FWNXqfQwDVsJg+GRANDEOG40k/EvF6CHfJRApGcOeTLLyAKfLh/oTPbwLacM0pj4qNYDDO8lmCCaeI=', N'jeevanandanj@gislen.com', N'tournamentOrganiser', CAST(N'2017-05-26 16:28:40.260' AS DateTime), CAST(N'2017-05-31 16:28:40.263' AS DateTime), N'jDq1yTfM4l3hMkGg9VDZOYfR40RLBvgY4IwMkZw7SNFhO3iCqaRXQcDtRVow1zrPKmI1e1gIObQp9Y5mdUNr6nGoskouKK_nOCRCfehratsUPQSzL4ODGM8GfqO8KIup29f55ZepqGsKayCHGeo6FSw-QPHukGym0itMrnw0kNsJWRl7tFeoTj04SzpOjH3ugOLP0FlFBM5zTT3_6GlNAXBc8AumG9H_dYLRASSmoA0P1zpv8-3yVSOsH1vvyRT5S2DoSGkOVeFUiBbOsjncWh9nuWlRgSAuQM8l3aQ2T810xykrMH0c4tR-w4g0VZb84eEVhydv8me9qNN293voO9XO2JTu9IYaTeSOyTlz6TplXZcVq4-zPWWdT0Hwcr7sTVc9HRzR3XgOImVIhJKvOGUliTcmh6O0XkMnK59hWtwwPR77I3h4hkW6YtsU6uzCLVnP_V6XX9jdTI3h4bgi5hSwYgu8HxhhCxyKQ_DCKFMOsSONx3FYZTYbQ_X8LEsemcIxS1tDlbSH7vLhtZgriYXr4cE8MAQOPvR_z-Uc8-tAH8f2janGoRmhA0Ye9wzY')
GO
INSERT [dbo].[RefreshTokens] ([Id], [Username], [ClientId], [IssuedUtc], [ExpiresUtc], [ProtectedTicket]) VALUES (N'AImfWLnDHU6f4BbJfPFFkV9qGcjO8GKKzzUpK91T9wLRvFIJdkThDAva5N6m+nNArgX2ZJ7dn0hn2ftKpTNGbz8=', N'jeevanandanj@gislen.com', N'tournamentOrganiser', CAST(N'2017-05-28 01:48:35.493' AS DateTime), CAST(N'2017-06-02 01:48:35.493' AS DateTime), N'EW0b9Cps-3vM5e4lTCJEII3xeAodeX0MbMs8SIyVVM-EqjaDxxzYoQbVeKKxi9E7BueZGoK07D0MDTZ77Xcx95dk8cDy-QyQd9lnHSPSE3S_UnufaOrLWRpFf9oXiJHJBITYmT0GgJrCaA4MJjWliWdPHjcwGQMJy3t6fQfTbSzr9XgtsaNEdjGzfegF_uEF1sr7rehNbFr-sGuHaRvxekkUfDnunRwGpDXcIn-0wtbzIsZREKOdUqpP835MG3_jRDjZ78ncbKtKI15J1CQlyuhXxiArrNcGgsvUhUSIIxbNljKpD_S_XAIQF1FULzwQCkcqiTwEQodDx_tGMpjiYoGIrTd8V7zJg_ezGO8JbkBQizWxR6i7gpwI1ukpwhHeoPc-rA4xY9pqtUjkLyUk0ccYWiDhRIYoHIWSGsG6n3Gqq-Umsj8wwkeSSUkRyRRTtAWCBv1YXMAcHFjsbl-bkh0yuhMoL2aarN9BSj60WO0CMwYUuUIPrTgp-_VQGVrs1tM_5BD6FILNdlhuzBXIkq5OMODqILSRX0xoPscGY0t_J8adHNX0rX0Uv30azSq9')
GO
INSERT [dbo].[RefreshTokens] ([Id], [Username], [ClientId], [IssuedUtc], [ExpiresUtc], [ProtectedTicket]) VALUES (N'AJ3yPUNIo6BEVg1YGF5ugD1hNQFExvmfp/V6iYJy/Vze/22xS9ME5mI1L9DM0nSsGJob2cPKkweOv7eEI7oK3fg=', N'jeevanandanj@gislen.com', N'tournamentOrganiser', CAST(N'2017-05-28 02:19:24.763' AS DateTime), CAST(N'2017-06-02 02:19:24.763' AS DateTime), N'7o9Qx6s7CIrRkUpMWqgqoU-M15yJcr7Uf1f38jYo6k5XhHyLv4TyCObhx8B43bP5KuI4zyVbyLTnKy9KUFPgnhiKGgVyicWh8tJGOKnQmhsE1WO85joz3RUA0o7cBEm0V46kSIzzvxLlZ4KV8UhobgT5DLlyfrUs_B87vcWfyoh4pfqpXfgpqMCIoZjef-7xMmPLAE0AO4oKMJe9O0FyygPa14MO-p4HTtVENkOAZ-OkS2xMx0MyWmLsMOdF_ocrtMnxEpgH7sJGlKMM1b3xDhcsyO642-gXa359le0RwUGiBwpf95TXfHZ1rDEQ0nMDyelLZwaKeI3nSRVlK1CnSbdmAtoBjCfbBX3dHk6FA9qnCH6_Fr5YlgGe84RE26r34y3Y-WkCr64thv1IBRUoHlQmuYvK0SAP68eyQDGrknrfPxR0lSIwFmCJ6Ar-ZgWjk_HNHbyh0vpvDeZVORi6vQreqz4xA3OUXmzcPwaF82KoN7idA2-x3BflzTsWBP4NiVdZSkU1hZkpAzd0nTvZJWtNjQI_r2utHVPekyc4ubG4qw808MEBT4YeYN5yWNv0')
GO
INSERT [dbo].[RefreshTokens] ([Id], [Username], [ClientId], [IssuedUtc], [ExpiresUtc], [ProtectedTicket]) VALUES (N'AJuIlYiOFKlDqgZfVGePvYjGNRYYDRgh6gB2sAlXzMaQtdQHiZ0KnDJsy68loE/eH74GS0MmDDvl8xN6/IpeAvE=', N'jeevanandanj@gislen.com', N'tournamentOrganiser', CAST(N'2017-05-28 04:39:35.167' AS DateTime), CAST(N'2017-06-02 04:39:35.167' AS DateTime), N'jzmluAXApKILpA3UPS7s32sXsNatxqKLfSescuu8dHF9zcqkSOYHorPV5zQs7zRpA8kUIDjujxjcgQTLIe-nTEPXHpxxAc617l5bCXToKqB1JB6Z9Ga0pwYd2RHKPPdqm8lQpkUc7zwMW78WzRy2WIdAzvJJEDGLllj7yQ70-Hk0rwVJo03xR6uOqzIF4e8JvRHfPkYeDMwlNALU8irOGNYVfGeGCvJH6kbRxrsJVJOOH_RsJ5BHc6X1XpWJ9obNy9XbSbHIa-93d0HNnf8PCeQGLHF5ifcZAjt_APx1kfbuK4TZjcN4Ku5YB1UopP80X_FYu-SxWjiAgVzHbWHlYc8-NhZeuDhCqjV0DXRyD7nQpYopXD2bxn_W-94Sf1aU3dXqvI1wmxmORQ6ygJRxB7Gw5kIs2EJrTaghAUnsnj9HDyR-uYX7PUeEakNw0bP4YdNIDxSd_rBGCOwcQxJAGIzxZERBnhcDSQqaIVQmO10cylKi4BiSK4zY3YoxQw6EG08Ma7d3oqM6ZrzGgTtvEYm7Qhn2KySpnkvt9fugeevF0ElM-M1duK9NrBIOeeDt')
GO
INSERT [dbo].[RefreshTokens] ([Id], [Username], [ClientId], [IssuedUtc], [ExpiresUtc], [ProtectedTicket]) VALUES (N'AMJOvUrzy1VzQokpedINOAJv2+de8gd0hlFfufDRPP2K3a8sZ4VETltfMiUeH72OXg71zVmiuVsEnNYM+ExcGmE=', N'jeevanandanj@gislen.com', N'tournamentOrganiser', CAST(N'2017-05-28 03:12:13.867' AS DateTime), CAST(N'2017-06-02 03:12:13.867' AS DateTime), N'-2QL9BnVP33zcpX9XQ0fuuMfAAi5MfSJp_DRwyPRzGOIMord-StZ0vDFgy-oNJ-4PgBtTnbWGPQgW1-qZC6BEJyiBhQta-GCzOUw_OxTLOkZPv4isw4YP5EAmuPJdBDRIp7hBLQCfEjOw2EinfW8n0RaHYNWGQKAaBwvdExYNAGl8jLiuZ0yRu0YDR6ZTkDffRi5DlBIvfEuvm2wE5ktmITEnYYMLPWBx6E8esUlQCkDopfUIf76ygZs9-ha_yieEBVzjPBXHhL7830KXVUKY84i3yu8yh1Kng4nyUJwEiGSNlYDDYpjitlbygyf6hkPWket6jlxAnJvk6aPwdn30HSqa6SGYS7x-s1h9FSQQ6_b9i_1hcRFjike7kjENhLTpPEALXuqpUoUPaZlDJ5pvDUiQyumAITj_IW4bofWlNcNP4VCoVj5PkiWFAstyn8AM29NB0F20hREP_AQ0O406CIqH4GN-YGH3UYsJUdchBkHhNkEF1R4n5-pWTJoNITTrKlCs5YLabB1nvoBAjGOkUe4l7cL6louK-c_6_gTJ5kut9rfFxTAYn1DMPpTyy5f')
GO
INSERT [dbo].[RefreshTokens] ([Id], [Username], [ClientId], [IssuedUtc], [ExpiresUtc], [ProtectedTicket]) VALUES (N'AMTiIu8hsKHMiL7JmJ97/Gksq9vKjJmHhedG+Aa28juYG/iyMCusVPdHpsHUyu7uy65oa4Mnfv3MogwVQnXlzN0=', N'jeevanandanj@gislen.com', N'tournamentOrganiser', CAST(N'2017-05-28 06:44:20.027' AS DateTime), CAST(N'2017-06-02 06:44:20.027' AS DateTime), N'6NWM9t-l49NGM49TWsU_a4TR-fK42GqKhXywQbDaEwRRiCMU2ctvByleAr11diuseGmgsQXX7bx7eXnMvrB8cbfAs6hrESzBSEmvD1uJtsUrtQEbAE5Q3fGgGBdITcknF2aIMcQ5cHAZ8d3wuaRkLhOrGDzIaZUG9OxauJ0DvXBUCXceF9mcLWRzbWTTNOkGD5Z376DM7Ret5LHmEiZ_9o-hUpaYJmKKvTTDnGkelvThTRUfXxNd4SwjfZI_oTpsf2cTkXxqVV_jFv7gl1NXYg2zFxn_oX0Xr_efuMVeeQRYoSlCwwT84hfURXuKVUWpll359ixyO8lAPO1qlrO7BLK1zzLewtMHspud3h7_q8X2pRDe0EpTKIjb-iYXkMpy3KoyJBmZKWx7xdB-P4V4spFEv7xRkdflKkU5M2EI-nAUXR1XRdq3b0Y45SGsMHkjmm97dhQAeFTCV32otZbBlBSxXI1pAWRmUnwP8hqWwa4xzQBJHqwNrvGNiwMetWgWUaEx4N6h_OgpozuDMZzOqhsAJu-VkJRkpTlLmXcYuNXwV9mZN_rr-cHfutq9Cr4u')
GO
INSERT [dbo].[RefreshTokens] ([Id], [Username], [ClientId], [IssuedUtc], [ExpiresUtc], [ProtectedTicket]) VALUES (N'ANXKZPQsGe4tsTbHfUuINfl//OhIS2ZW+0PyxpKiHJn2lqajFvPXqf4/qLpsm5PImRZuXRKjcDBoz+r3rbpSZX4=', N'jeevanandanj@gislen.com', N'tournamentOrganiser', CAST(N'2017-05-28 07:14:23.490' AS DateTime), CAST(N'2017-06-02 07:14:23.490' AS DateTime), N'KteDgLJW51xEbzowUlUZMlrJlPVbFFPb9NE_V7tE0y37yv7RpjQIDziYgB_ZSrDmf2k_lgP47BYH2Hw91e4OKZOhbIA0yz72vST30IToZWY7dj8G9wTXsfaPZwSq6QqSlvh_HC4QJASGrIMielRpbZXY2pE7iVMd3UBcziIK-MZVkZb-FI8tGHkUSc0cIPc8yHW9UV9gZLY4g2Zz5sGd-U0CeElsm4jf2zJd_MWjdNWS7HuA_VsAcp3kBR1GxtNegN_velGLcI69WDUwCMhuKDwsHOiUO1tSc_Ys-1_O9jwu-XA9VDCh63RtZiiwqUqayRPYWaeM64ruuttGQRo9IyHEDCDBqxiIZjoid2PLAW6C3gtIZA4myw9GEQcsi9gLgeBunNshO4j3uxtQjrmjCB-rm5hroaHX5PGuYufGxSfm2o2BF7PVi0jZQIVX6gQdQz3GMg7J-RvsLa5yTnxr6E4lm-K7Sq8mAnSIOLQwc4_IHLxuyaDt7FRKwfPFxIGkDNYZajO6xJusYlURwaDcWNiCA9Hu_eG-KBjcC4QREXYB6YTWQ1SMEwp3UObMIwRQ')
GO
INSERT [dbo].[RefreshTokens] ([Id], [Username], [ClientId], [IssuedUtc], [ExpiresUtc], [ProtectedTicket]) VALUES (N'AOgaG8BzfvVgs+7NIfw3fhUXMGlHgGPQQ49EYHyQlFV5JhhPP0Kyc0hs3ZnZheazMrngVe83sjeaP4O3E4WhCbA=', N'jeevanandanj@gislen.com', N'tournamentOrganiser', CAST(N'2017-05-28 01:57:44.950' AS DateTime), CAST(N'2017-06-02 01:57:44.950' AS DateTime), N'jSRMFF2Fx2XQu2yTSACCAjQiSwLTx_NL0AMn11G4y_VVgg8Z1DgY8dq-KuqicV9jjUffRdI_U9n4hZqWHcLSX5IoBrD4Ye3zkHjmdgw8UACoEN_tzcMkRUOXwIQqH-QRo9bV4mjVNs6GWKZInXr_GdfKiFIzLFg3JfWw42zYO4EhR6gW-8qnZW6lLizk3t4xBcjyOdxb4wtthNWC_i_Rzx3fXWGf8I096pxtVTlOe92iJY-pzr3kAqaFiI5Kq1jNR2ehR4NRgq6jLKav5jVS_APoZNDhPsNcwtkXjxWcbfP0FemTwzdKD8yvFGbzI0ijHD7Q_hr0iwLTrQogImYWJ1LzKbT2YxNcVjcsLd1hzW17McrxSNNo0z0id6oRavsdtmMHUx_Cz12-f8lWJE50HaXzfytpjXtzWcVpaos_SbTvo73mxmDBh7pxrw-1LAXb50KQonXCJ4lMqT7LLxC0ahRXRw1jjD4pkC0okmYguGm_H-UJFG0BNy49TKX9FwYN4ehRZulFY5K9J4iQBWPLcmWGCx4vpXAEI7UKzxgPE_L0bVyNr_lRZcq9w8tkZ08n')
GO
INSERT [dbo].[RefreshTokens] ([Id], [Username], [ClientId], [IssuedUtc], [ExpiresUtc], [ProtectedTicket]) VALUES (N'APq1dLzQO6dWu/me0rtkC7cJp72z2Wr7IUY/l8nLp8CrrpmXeF99O1zpnlSJRSq8B38uK/3PaxDyFQncCpfJLLk=', N'jeevanandanj@gislen.com', N'tournamentOrganiser', CAST(N'2017-05-28 02:02:43.500' AS DateTime), CAST(N'2017-06-02 02:02:43.500' AS DateTime), N'xMg_xh03F1XFJaAF93H-5qSA3sepYVTTrTvZXsbXdynvt7I-6FKm_YHie6FmFhpM3fMBxGzjvv59sfITj1V_16er1TMgannjxfG63r55N3NsAvjpBXsn2W5PsvjlzI1eJyluGWXnW3rb3tHsdGun3xArjntuYEwfO4QqTlx8biJiwE4J6ocrusqDQ5pkcqNyPyGYakw_MoXCzhykbbC0r8Mx40QLAPDZWgCMxzG2IfMAM9hOBi0ygTa9yUGT8jEN2Flr_HxMQI00ne6IgsAuebtcuYGzoDln2rnlYn2q1i77BOARxiPfo56-BQGeCFruM3dmDLUtEnDh0BiQqr2IgytkrbmdT6fNQPlZi9RMY37cOkC6rJ3HeLIt1qjsJw1bLjwU1Nm5yO4gXfpcVBOAGXPUFhnxqKCiiVonSOepGPmhP4VDzOhLhinZ4CNjJsRzQ_1cDa174plwaTIrAkILCJKZMDzLjJTJJNNw3saL9VjFApLK92QKDEaX39iRDJNB5eQB3FRfr0DacuuG2bbEO4V25rpJlOHtmNmbhKpZDTCBSqJiGd8uo7cXkiioKPE5')
GO
INSERT [dbo].[Role] ([Id], [Name]) VALUES (1, N'Administrator')
GO
INSERT [dbo].[Role] ([Id], [Name]) VALUES (2, N'User')
GO
SET IDENTITY_INSERT [dbo].[Subdivision] ON 

GO
INSERT [dbo].[Subdivision] ([Id], [Name], [TournamentId]) VALUES (1, N'Male Singles', 1)
GO
INSERT [dbo].[Subdivision] ([Id], [Name], [TournamentId]) VALUES (2, N'Male Doubles', 1)
GO
INSERT [dbo].[Subdivision] ([Id], [Name], [TournamentId]) VALUES (3, N'Women Doubles', 1)
GO
SET IDENTITY_INSERT [dbo].[Subdivision] OFF
GO
SET IDENTITY_INSERT [dbo].[Team] ON 

GO
INSERT [dbo].[Team] ([Id], [Name], [SubdivisionId]) VALUES (1, N'Akila', 3)
GO
INSERT [dbo].[Team] ([Id], [Name], [SubdivisionId]) VALUES (2, N'Arthy', 3)
GO
INSERT [dbo].[Team] ([Id], [Name], [SubdivisionId]) VALUES (3, N'Bala', 1)
GO
INSERT [dbo].[Team] ([Id], [Name], [SubdivisionId]) VALUES (4, N'Balaji.V', 1)
GO
INSERT [dbo].[Team] ([Id], [Name], [SubdivisionId]) VALUES (5, N'Bhanu', 1)
GO
INSERT [dbo].[Team] ([Id], [Name], [SubdivisionId]) VALUES (6, N'Christy', 3)
GO
INSERT [dbo].[Team] ([Id], [Name], [SubdivisionId]) VALUES (7, N'Dhilip', 1)
GO
INSERT [dbo].[Team] ([Id], [Name], [SubdivisionId]) VALUES (8, N'Ebe (Jr)', 1)
GO
INSERT [dbo].[Team] ([Id], [Name], [SubdivisionId]) VALUES (9, N'Ebe Senior', 1)
GO
INSERT [dbo].[Team] ([Id], [Name], [SubdivisionId]) VALUES (10, N'Jagadeesh', 1)
GO
INSERT [dbo].[Team] ([Id], [Name], [SubdivisionId]) VALUES (11, N'Jayashree', 1)
GO
INSERT [dbo].[Team] ([Id], [Name], [SubdivisionId]) VALUES (12, N'Jeeva', 1)
GO
INSERT [dbo].[Team] ([Id], [Name], [SubdivisionId]) VALUES (13, N'JP', 1)
GO
INSERT [dbo].[Team] ([Id], [Name], [SubdivisionId]) VALUES (14, N'Kavimaran', 1)
GO
INSERT [dbo].[Team] ([Id], [Name], [SubdivisionId]) VALUES (15, N'Madan', 1)
GO
INSERT [dbo].[Team] ([Id], [Name], [SubdivisionId]) VALUES (16, N'Martin', 1)
GO
INSERT [dbo].[Team] ([Id], [Name], [SubdivisionId]) VALUES (17, N'Philip', 1)
GO
INSERT [dbo].[Team] ([Id], [Name], [SubdivisionId]) VALUES (18, N'Raghu', 1)
GO
INSERT [dbo].[Team] ([Id], [Name], [SubdivisionId]) VALUES (19, N'Sarath', 1)
GO
INSERT [dbo].[Team] ([Id], [Name], [SubdivisionId]) VALUES (20, N'Shaj', 1)
GO
INSERT [dbo].[Team] ([Id], [Name], [SubdivisionId]) VALUES (21, N'Suresh', 1)
GO
INSERT [dbo].[Team] ([Id], [Name], [SubdivisionId]) VALUES (22, N'Susan', 3)
GO
INSERT [dbo].[Team] ([Id], [Name], [SubdivisionId]) VALUES (23, N'Vanitha', 3)
GO
INSERT [dbo].[Team] ([Id], [Name], [SubdivisionId]) VALUES (24, N'Vinoth', 3)
GO
INSERT [dbo].[Team] ([Id], [Name], [SubdivisionId]) VALUES (25, N'Vishnu', 1)
GO
INSERT [dbo].[Team] ([Id], [Name], [SubdivisionId]) VALUES (26, N'Viswa', 1)
GO
INSERT [dbo].[Team] ([Id], [Name], [SubdivisionId]) VALUES (27, N'Yoga', 3)
GO
SET IDENTITY_INSERT [dbo].[Team] OFF
GO
SET IDENTITY_INSERT [dbo].[Tournament] ON 

GO
INSERT [dbo].[Tournament] ([Id], [Name], [GameId]) VALUES (1, N'Gislent TT Tournament 2017', 1)
GO
SET IDENTITY_INSERT [dbo].[Tournament] OFF
GO
INSERT [dbo].[User] ([Id], [Username], [Password], [Name], [Avatar], [GenderId], [RoleId], [StatusId], [IsDeleted], [LastLoginDate], [LastPasswordChangedDate], [ForgotPasswordToken], [ForgotPasswordTokenSentOn], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [SecurityStamp]) VALUES (N'aa1c20d5-30c4-4836-aa7b-03c4dc71335f', N'', N'Gislen5*', N'Balaji.V', N'', 1, 2, 2, 1, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-05-23 22:57:23.103' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[User] ([Id], [Username], [Password], [Name], [Avatar], [GenderId], [RoleId], [StatusId], [IsDeleted], [LastLoginDate], [LastPasswordChangedDate], [ForgotPasswordToken], [ForgotPasswordTokenSentOn], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [SecurityStamp]) VALUES (N'85c24750-7f5d-4b6b-9a14-121efcd0487c', N'', N'Gislen5*', N'Dhilip', N'', 1, 2, 2, 1, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-05-23 22:57:23.103' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[User] ([Id], [Username], [Password], [Name], [Avatar], [GenderId], [RoleId], [StatusId], [IsDeleted], [LastLoginDate], [LastPasswordChangedDate], [ForgotPasswordToken], [ForgotPasswordTokenSentOn], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [SecurityStamp]) VALUES (N'0d13ec49-ac89-4396-8f37-30ae339368a3', N'', N'Gislen5*', N'Bhanu', N'', 1, 2, 2, 1, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-05-23 22:57:23.103' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[User] ([Id], [Username], [Password], [Name], [Avatar], [GenderId], [RoleId], [StatusId], [IsDeleted], [LastLoginDate], [LastPasswordChangedDate], [ForgotPasswordToken], [ForgotPasswordTokenSentOn], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [SecurityStamp]) VALUES (N'23adb5d6-7127-4afd-9e8f-3a2282e57aa8', N'', N'Gislen5*', N'Jagadeesh', N'', 1, 2, 2, 1, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-05-23 22:57:23.103' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[User] ([Id], [Username], [Password], [Name], [Avatar], [GenderId], [RoleId], [StatusId], [IsDeleted], [LastLoginDate], [LastPasswordChangedDate], [ForgotPasswordToken], [ForgotPasswordTokenSentOn], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [SecurityStamp]) VALUES (N'26e06e78-43c0-4cd6-b209-51784ab18875', N'', N'Gislen5*', N'Madan', N'', 1, 2, 2, 1, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-05-23 22:57:23.103' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[User] ([Id], [Username], [Password], [Name], [Avatar], [GenderId], [RoleId], [StatusId], [IsDeleted], [LastLoginDate], [LastPasswordChangedDate], [ForgotPasswordToken], [ForgotPasswordTokenSentOn], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [SecurityStamp]) VALUES (N'1c1d0b43-4a5d-443c-b9cd-7207be71a7d7', N'', N'Gislen5*', N'Susan', N'', 1, 2, 2, 1, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-05-23 22:57:23.103' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[User] ([Id], [Username], [Password], [Name], [Avatar], [GenderId], [RoleId], [StatusId], [IsDeleted], [LastLoginDate], [LastPasswordChangedDate], [ForgotPasswordToken], [ForgotPasswordTokenSentOn], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [SecurityStamp]) VALUES (N'a0dbaf23-58e7-45b9-a392-72cd5e8074ec', N'', N'Gislen5*', N'Kavimaran', N'', 1, 2, 2, 1, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-05-23 22:57:23.103' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[User] ([Id], [Username], [Password], [Name], [Avatar], [GenderId], [RoleId], [StatusId], [IsDeleted], [LastLoginDate], [LastPasswordChangedDate], [ForgotPasswordToken], [ForgotPasswordTokenSentOn], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [SecurityStamp]) VALUES (N'ca4867a1-5c1e-4737-9238-7818fd8864bf', N'', N'Gislen5*', N'Vanitha', N'', 1, 2, 2, 1, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-05-23 22:57:23.103' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[User] ([Id], [Username], [Password], [Name], [Avatar], [GenderId], [RoleId], [StatusId], [IsDeleted], [LastLoginDate], [LastPasswordChangedDate], [ForgotPasswordToken], [ForgotPasswordTokenSentOn], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [SecurityStamp]) VALUES (N'e2c3721e-d581-4f40-8d30-7d6c9f100f83', N'', N'Gislen5*', N'Christy', N'', 1, 2, 2, 1, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-05-23 22:57:23.103' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[User] ([Id], [Username], [Password], [Name], [Avatar], [GenderId], [RoleId], [StatusId], [IsDeleted], [LastLoginDate], [LastPasswordChangedDate], [ForgotPasswordToken], [ForgotPasswordTokenSentOn], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [SecurityStamp]) VALUES (N'56294978-af45-4eb2-ad54-85707a319082', N'', N'Gislen5*', N'Jayashree', N'', 1, 2, 2, 1, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-05-23 22:57:23.103' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[User] ([Id], [Username], [Password], [Name], [Avatar], [GenderId], [RoleId], [StatusId], [IsDeleted], [LastLoginDate], [LastPasswordChangedDate], [ForgotPasswordToken], [ForgotPasswordTokenSentOn], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [SecurityStamp]) VALUES (N'dccd573a-1a66-419e-a88d-8cfaa1bd2e59', N'', N'Gislen5*', N'Yoga', N'', 1, 2, 2, 1, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-05-23 22:57:23.103' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[User] ([Id], [Username], [Password], [Name], [Avatar], [GenderId], [RoleId], [StatusId], [IsDeleted], [LastLoginDate], [LastPasswordChangedDate], [ForgotPasswordToken], [ForgotPasswordTokenSentOn], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [SecurityStamp]) VALUES (N'768c644c-cca8-4d0f-b2d2-a0a67715328c', N'jeevanandanj@gislen.com', N'AMWzQBhnL0xEWXe+QlIl0aG8gGGhN08s1HfrDwUWynb9EBjC6Zu8o59WFaXf3nPfRB3+dYcIn1W3xYYkGQIP+3Y=', N'Jeeva', N'', 1, 2, 2, 1, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-05-23 22:57:23.103' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[User] ([Id], [Username], [Password], [Name], [Avatar], [GenderId], [RoleId], [StatusId], [IsDeleted], [LastLoginDate], [LastPasswordChangedDate], [ForgotPasswordToken], [ForgotPasswordTokenSentOn], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [SecurityStamp]) VALUES (N'9d8b07e2-dfaa-4115-81d7-b0e10b468e85', N'', N'Gislen5*', N'JP', N'', 1, 2, 2, 1, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-05-23 22:57:23.103' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[User] ([Id], [Username], [Password], [Name], [Avatar], [GenderId], [RoleId], [StatusId], [IsDeleted], [LastLoginDate], [LastPasswordChangedDate], [ForgotPasswordToken], [ForgotPasswordTokenSentOn], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [SecurityStamp]) VALUES (N'27347386-fc67-493e-a60c-b105c0300417', N'', N'Gislen5*', N'Akila', N'', 1, 2, 2, 1, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-05-23 22:57:23.103' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[User] ([Id], [Username], [Password], [Name], [Avatar], [GenderId], [RoleId], [StatusId], [IsDeleted], [LastLoginDate], [LastPasswordChangedDate], [ForgotPasswordToken], [ForgotPasswordTokenSentOn], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [SecurityStamp]) VALUES (N'ae6b1f7b-8a92-416f-9ad5-b1df43225225', N'', N'Gislen5*', N'Bala', N'', 1, 2, 2, 1, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-05-23 22:57:23.103' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[User] ([Id], [Username], [Password], [Name], [Avatar], [GenderId], [RoleId], [StatusId], [IsDeleted], [LastLoginDate], [LastPasswordChangedDate], [ForgotPasswordToken], [ForgotPasswordTokenSentOn], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [SecurityStamp]) VALUES (N'3a9e363a-38a4-4b75-a806-b43383d4c8c3', N'', N'Gislen5*', N'Viswa', N'', 1, 2, 2, 1, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-05-23 22:57:23.103' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[User] ([Id], [Username], [Password], [Name], [Avatar], [GenderId], [RoleId], [StatusId], [IsDeleted], [LastLoginDate], [LastPasswordChangedDate], [ForgotPasswordToken], [ForgotPasswordTokenSentOn], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [SecurityStamp]) VALUES (N'd91f77ce-0b1c-4aa9-bffd-b83053c85345', N'', N'Gislen5*', N'Ebe (Jr)', N'', 1, 2, 2, 1, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-05-23 22:57:23.103' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[User] ([Id], [Username], [Password], [Name], [Avatar], [GenderId], [RoleId], [StatusId], [IsDeleted], [LastLoginDate], [LastPasswordChangedDate], [ForgotPasswordToken], [ForgotPasswordTokenSentOn], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [SecurityStamp]) VALUES (N'5aef6b70-c846-4226-900e-c3375bdd65a1', N'', N'Gislen5*', N'Sarath', N'', 1, 2, 2, 1, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-05-23 22:57:23.103' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[User] ([Id], [Username], [Password], [Name], [Avatar], [GenderId], [RoleId], [StatusId], [IsDeleted], [LastLoginDate], [LastPasswordChangedDate], [ForgotPasswordToken], [ForgotPasswordTokenSentOn], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [SecurityStamp]) VALUES (N'667f6ebc-1766-4723-a9da-c4ca007686b0', N'', N'Gislen5*', N'Shaj', N'', 1, 2, 2, 1, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-05-23 22:57:23.103' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[User] ([Id], [Username], [Password], [Name], [Avatar], [GenderId], [RoleId], [StatusId], [IsDeleted], [LastLoginDate], [LastPasswordChangedDate], [ForgotPasswordToken], [ForgotPasswordTokenSentOn], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [SecurityStamp]) VALUES (N'914c5d32-06a5-463b-910c-cb4d1b5e6a60', N'', N'Gislen5*', N'Vishnu', N'', 1, 2, 2, 1, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-05-23 22:57:23.103' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[User] ([Id], [Username], [Password], [Name], [Avatar], [GenderId], [RoleId], [StatusId], [IsDeleted], [LastLoginDate], [LastPasswordChangedDate], [ForgotPasswordToken], [ForgotPasswordTokenSentOn], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [SecurityStamp]) VALUES (N'46155471-152c-4636-a3b9-e1d188aedb24', N'', N'Gislen5*', N'Raghu', N'', 1, 2, 2, 1, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-05-23 22:57:23.103' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[User] ([Id], [Username], [Password], [Name], [Avatar], [GenderId], [RoleId], [StatusId], [IsDeleted], [LastLoginDate], [LastPasswordChangedDate], [ForgotPasswordToken], [ForgotPasswordTokenSentOn], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [SecurityStamp]) VALUES (N'a19fe7d8-7fd7-48de-a6a4-e2c42205aa44', N'', N'Gislen5*', N'Suresh', N'', 1, 2, 2, 1, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-05-23 22:57:23.103' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[User] ([Id], [Username], [Password], [Name], [Avatar], [GenderId], [RoleId], [StatusId], [IsDeleted], [LastLoginDate], [LastPasswordChangedDate], [ForgotPasswordToken], [ForgotPasswordTokenSentOn], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [SecurityStamp]) VALUES (N'b00605e4-9c80-46bf-a555-e856b2e5ee4c', N'', N'Gislen5*', N'Philip', N'', 1, 2, 2, 1, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-05-23 22:57:23.103' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[User] ([Id], [Username], [Password], [Name], [Avatar], [GenderId], [RoleId], [StatusId], [IsDeleted], [LastLoginDate], [LastPasswordChangedDate], [ForgotPasswordToken], [ForgotPasswordTokenSentOn], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [SecurityStamp]) VALUES (N'4d875bb7-560e-4647-9b50-ed142601ad93', N'', N'Gislen5*', N'Vinoth', N'', 1, 2, 2, 1, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-05-23 22:57:23.103' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[User] ([Id], [Username], [Password], [Name], [Avatar], [GenderId], [RoleId], [StatusId], [IsDeleted], [LastLoginDate], [LastPasswordChangedDate], [ForgotPasswordToken], [ForgotPasswordTokenSentOn], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [SecurityStamp]) VALUES (N'8bc52080-a8a6-4ce7-814e-ee1b2b1aada7', N'', N'Gislen5*', N'Martin', N'', 1, 2, 2, 1, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-05-23 22:57:23.103' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[User] ([Id], [Username], [Password], [Name], [Avatar], [GenderId], [RoleId], [StatusId], [IsDeleted], [LastLoginDate], [LastPasswordChangedDate], [ForgotPasswordToken], [ForgotPasswordTokenSentOn], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [SecurityStamp]) VALUES (N'74bd7224-9e3a-434e-8c87-f13d054c623a', N'', N'Gislen5*', N'Ebe Senior', N'', 1, 2, 2, 1, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-05-23 22:57:23.103' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[User] ([Id], [Username], [Password], [Name], [Avatar], [GenderId], [RoleId], [StatusId], [IsDeleted], [LastLoginDate], [LastPasswordChangedDate], [ForgotPasswordToken], [ForgotPasswordTokenSentOn], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [SecurityStamp]) VALUES (N'd54f07ec-c692-4e15-825e-f70a4edb3ef0', N'', N'Gislen5*', N'Arthy', N'', 1, 2, 2, 1, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-05-23 22:57:23.103' AS DateTime), NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[UserState] ON 

GO
INSERT [dbo].[UserState] ([Id], [Name]) VALUES (1, N'Inactive')
GO
INSERT [dbo].[UserState] ([Id], [Name]) VALUES (2, N'Active')
GO
INSERT [dbo].[UserState] ([Id], [Name]) VALUES (3, N'Deactive')
GO
INSERT [dbo].[UserState] ([Id], [Name]) VALUES (4, N'Rejected')
GO
SET IDENTITY_INSERT [dbo].[UserState] OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_User_IsDeleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_User_CreatedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
END

GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Match_Stage]') AND parent_object_id = OBJECT_ID(N'[dbo].[Match]'))
ALTER TABLE [dbo].[Match]  WITH CHECK ADD  CONSTRAINT [FK_Match_Stage] FOREIGN KEY([StageId])
REFERENCES [dbo].[Stage] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Match_Stage]') AND parent_object_id = OBJECT_ID(N'[dbo].[Match]'))
ALTER TABLE [dbo].[Match] CHECK CONSTRAINT [FK_Match_Stage]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Match_Team]') AND parent_object_id = OBJECT_ID(N'[dbo].[Match]'))
ALTER TABLE [dbo].[Match]  WITH CHECK ADD  CONSTRAINT [FK_Match_Team] FOREIGN KEY([Team1Id])
REFERENCES [dbo].[Team] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Match_Team]') AND parent_object_id = OBJECT_ID(N'[dbo].[Match]'))
ALTER TABLE [dbo].[Match] CHECK CONSTRAINT [FK_Match_Team]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Match_Team1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Match]'))
ALTER TABLE [dbo].[Match]  WITH CHECK ADD  CONSTRAINT [FK_Match_Team1] FOREIGN KEY([Team2Id])
REFERENCES [dbo].[Team] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Match_Team1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Match]'))
ALTER TABLE [dbo].[Match] CHECK CONSTRAINT [FK_Match_Team1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Match_Team2]') AND parent_object_id = OBJECT_ID(N'[dbo].[Match]'))
ALTER TABLE [dbo].[Match]  WITH CHECK ADD  CONSTRAINT [FK_Match_Team2] FOREIGN KEY([WinnerTeamId])
REFERENCES [dbo].[Team] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Match_Team2]') AND parent_object_id = OBJECT_ID(N'[dbo].[Match]'))
ALTER TABLE [dbo].[Match] CHECK CONSTRAINT [FK_Match_Team2]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Participant_Subdivision]') AND parent_object_id = OBJECT_ID(N'[dbo].[Participant]'))
ALTER TABLE [dbo].[Participant]  WITH CHECK ADD  CONSTRAINT [FK_Participant_Subdivision] FOREIGN KEY([SubdivisionId])
REFERENCES [dbo].[Subdivision] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Participant_Subdivision]') AND parent_object_id = OBJECT_ID(N'[dbo].[Participant]'))
ALTER TABLE [dbo].[Participant] CHECK CONSTRAINT [FK_Participant_Subdivision]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Participant_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[Participant]'))
ALTER TABLE [dbo].[Participant]  WITH CHECK ADD  CONSTRAINT [FK_Participant_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Participant_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[Participant]'))
ALTER TABLE [dbo].[Participant] CHECK CONSTRAINT [FK_Participant_User]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Score_Team]') AND parent_object_id = OBJECT_ID(N'[dbo].[Score]'))
ALTER TABLE [dbo].[Score]  WITH CHECK ADD  CONSTRAINT [FK_Score_Team] FOREIGN KEY([WinnerTeamId])
REFERENCES [dbo].[Team] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Score_Team]') AND parent_object_id = OBJECT_ID(N'[dbo].[Score]'))
ALTER TABLE [dbo].[Score] CHECK CONSTRAINT [FK_Score_Team]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Stage_Subdivision]') AND parent_object_id = OBJECT_ID(N'[dbo].[Stage]'))
ALTER TABLE [dbo].[Stage]  WITH CHECK ADD  CONSTRAINT [FK_Stage_Subdivision] FOREIGN KEY([SubdivisionId])
REFERENCES [dbo].[Subdivision] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Stage_Subdivision]') AND parent_object_id = OBJECT_ID(N'[dbo].[Stage]'))
ALTER TABLE [dbo].[Stage] CHECK CONSTRAINT [FK_Stage_Subdivision]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Subdivision_TournamentId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Subdivision]'))
ALTER TABLE [dbo].[Subdivision]  WITH CHECK ADD  CONSTRAINT [FK_Subdivision_TournamentId] FOREIGN KEY([TournamentId])
REFERENCES [dbo].[Tournament] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Subdivision_TournamentId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Subdivision]'))
ALTER TABLE [dbo].[Subdivision] CHECK CONSTRAINT [FK_Subdivision_TournamentId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Team_SubdivisionId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Team]'))
ALTER TABLE [dbo].[Team]  WITH CHECK ADD  CONSTRAINT [FK_Team_SubdivisionId] FOREIGN KEY([SubdivisionId])
REFERENCES [dbo].[Subdivision] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Team_SubdivisionId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Team]'))
ALTER TABLE [dbo].[Team] CHECK CONSTRAINT [FK_Team_SubdivisionId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TeamParticipant_Participant]') AND parent_object_id = OBJECT_ID(N'[dbo].[TeamParticipant]'))
ALTER TABLE [dbo].[TeamParticipant]  WITH CHECK ADD  CONSTRAINT [FK_TeamParticipant_Participant] FOREIGN KEY([ParticipantId])
REFERENCES [dbo].[Participant] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TeamParticipant_Participant]') AND parent_object_id = OBJECT_ID(N'[dbo].[TeamParticipant]'))
ALTER TABLE [dbo].[TeamParticipant] CHECK CONSTRAINT [FK_TeamParticipant_Participant]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TeamParticipant_Team]') AND parent_object_id = OBJECT_ID(N'[dbo].[TeamParticipant]'))
ALTER TABLE [dbo].[TeamParticipant]  WITH CHECK ADD  CONSTRAINT [FK_TeamParticipant_Team] FOREIGN KEY([TeamId])
REFERENCES [dbo].[Team] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TeamParticipant_Team]') AND parent_object_id = OBJECT_ID(N'[dbo].[TeamParticipant]'))
ALTER TABLE [dbo].[TeamParticipant] CHECK CONSTRAINT [FK_TeamParticipant_Team]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Tournament_GameId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Tournament]'))
ALTER TABLE [dbo].[Tournament]  WITH CHECK ADD  CONSTRAINT [FK_Tournament_GameId] FOREIGN KEY([GameId])
REFERENCES [dbo].[Game] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Tournament_GameId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Tournament]'))
ALTER TABLE [dbo].[Tournament] CHECK CONSTRAINT [FK_Tournament_GameId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_User_CreatedBy]') AND parent_object_id = OBJECT_ID(N'[dbo].[User]'))
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[User] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_User_CreatedBy]') AND parent_object_id = OBJECT_ID(N'[dbo].[User]'))
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_CreatedBy]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_User_Gender]') AND parent_object_id = OBJECT_ID(N'[dbo].[User]'))
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Gender] FOREIGN KEY([GenderId])
REFERENCES [dbo].[Gender] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_User_Gender]') AND parent_object_id = OBJECT_ID(N'[dbo].[User]'))
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Gender]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_User_ModifiedBy]') AND parent_object_id = OBJECT_ID(N'[dbo].[User]'))
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_ModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[User] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_User_ModifiedBy]') AND parent_object_id = OBJECT_ID(N'[dbo].[User]'))
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_ModifiedBy]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_User_Role]') AND parent_object_id = OBJECT_ID(N'[dbo].[User]'))
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_User_Role]') AND parent_object_id = OBJECT_ID(N'[dbo].[User]'))
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_User_UserState]') AND parent_object_id = OBJECT_ID(N'[dbo].[User]'))
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_UserState] FOREIGN KEY([StatusId])
REFERENCES [dbo].[UserState] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_User_UserState]') AND parent_object_id = OBJECT_ID(N'[dbo].[User]'))
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_UserState]
GO
