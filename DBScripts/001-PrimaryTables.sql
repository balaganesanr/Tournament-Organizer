CREATE TABLE [dbo].[UserState](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](10) NOT NULL,
 CONSTRAINT [PK_UserStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Role](
	[Id] [tinyint] NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Gender]
(
	[ID] TINYINT NOT NULL,
	[Name] VARCHAR(50) NOT NULL
 CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[User]
(
	[Id] [UNIQUEIDENTIFIER] NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Password] [nvarchar](128) NOT NULL,
	[Firstname] [nvarchar](100) NOT NULL,
	[Lastname] [nvarchar](100) NOT NULL,
	[Avatar] [VARCHAR](500) NOT NULL,
	[GenderId] [tinyint] NOT NULL,
	[RoleId] [tinyint] NOT NULL,
	[StatusId] [tinyint] NOT NULL,
	[IsDeleted] [BIT] NOT NULL,
	[LastLoginDate] [datetime] NULL,
	[LastPasswordChangedDate] [datetime] NULL,
	[ForgotPasswordToken] [VARCHAR](500) NULL,
	[ForgotPasswordTokenSentOn] [DATETIME] NULL,
	[CreatedBy] [UNIQUEIDENTIFIER] NULL,
	[CreatedOn] [DATETIME] NULL,
	[ModifiedBy] [UNIQUEIDENTIFIER] NULL,
	[ModifiedOn] [DATETIME] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_CreatedOn]  DEFAULT ((GETDATE())) FOR [CreatedOn]
GO

ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_UserState] FOREIGN KEY([StatusId]) REFERENCES [dbo].[UserState] ([Id])
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([RoleId]) REFERENCES [dbo].[Role] ([Id])
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Gender] FOREIGN KEY([GenderId]) REFERENCES [dbo].[Gender] ([Id])
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_CreatedBy] FOREIGN KEY([CreatedBy]) REFERENCES [dbo].[User] ([Id])
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_ModifiedBy] FOREIGN KEY([ModifiedBy]) REFERENCES [dbo].[User] ([Id])
GO

CREATE TABLE [dbo].[Game](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Game] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Tournament](
	[Id] [INT] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[GameId] [tinyint] NOT NULL,
 CONSTRAINT [PK_Tournament] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Tournament]  WITH CHECK ADD  CONSTRAINT [FK_Tournament_GameId] FOREIGN KEY([GameId]) REFERENCES [dbo].[Game] ([Id])
GO

CREATE TABLE [dbo].[Subdivision](
	[Id] [INT] IDENTITY(1,1) NOT NULL,
	[Name] [VARCHAR](100) NOT NULL,
	[TournamentId] [INT] NOT NULL,
 CONSTRAINT [PK_Subdivision] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Subdivision]  WITH CHECK ADD  CONSTRAINT [FK_Subdivision_TournamentId] FOREIGN KEY([TournamentId]) REFERENCES [dbo].[Tournament] ([Id])
GO

CREATE TABLE [dbo].[Team](
	[Id] [BIGINT] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[SubdivisionId] [INT] NOT NULL,
 CONSTRAINT [PK_Team] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Team]  WITH CHECK ADD  CONSTRAINT [FK_Team_SubdivisionId] FOREIGN KEY([SubdivisionId]) REFERENCES [dbo].[Subdivision] ([Id])
GO

CREATE TABLE [dbo].[Participant](
	[Id] [BIGINT] IDENTITY(1,1) NOT NULL,
	[UserId] [UNIQUEIDENTIFIER] NOT NULL,
	[SubdivisionId] [INT] NOT NULL,
 CONSTRAINT [PK_Participant] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Participant]  WITH CHECK ADD  CONSTRAINT [FK_Participant_User] FOREIGN KEY([UserId]) REFERENCES [dbo].[User] ([Id])
ALTER TABLE [dbo].[Participant]  WITH CHECK ADD  CONSTRAINT [FK_Participant_Subdivision] FOREIGN KEY([SubdivisionId]) REFERENCES [dbo].[Subdivision] ([Id])
GO

CREATE TABLE [dbo].[TeamParticipant](
	[Id] [BIGINT] IDENTITY(1,1) NOT NULL,
	[TeamId] [BIGINT] NOT NULL,
	[ParticipantId] [BIGINT] NOT NULL,
 CONSTRAINT [PK_TeamParticipant] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[TeamParticipant]  WITH CHECK ADD  CONSTRAINT [FK_TeamParticipant_Team] FOREIGN KEY([TeamId]) REFERENCES [dbo].[Team] ([Id])
ALTER TABLE [dbo].[TeamParticipant]  WITH CHECK ADD  CONSTRAINT [FK_TeamParticipant_Participant] FOREIGN KEY([ParticipantId]) REFERENCES [dbo].[Participant] ([Id])
GO

CREATE TABLE [dbo].[Stage](
	[Id] [BIGINT] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[SubdivisionId] [INT] NOT NULL,
 CONSTRAINT [PK_Stage] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Stage]  WITH CHECK ADD  CONSTRAINT [FK_Stage_Subdivision] FOREIGN KEY([SubdivisionId]) REFERENCES [dbo].[Subdivision] ([Id])
GO

CREATE TABLE [dbo].[Match](
	[Id] [BIGINT] IDENTITY(1,1) NOT NULL,
	[StageId] [BIGINT] NOT NULL,
	[Team1Id] [BIGINT] NOT NULL,
	[Team2Id] [BIGINT] NOT NULL,
	[ScheduledDate] [DATETIME] NOT NULL,
	[WinnerTeamId] [BIGINT] NULL,
 CONSTRAINT [PK_Match] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Match]  WITH CHECK ADD  CONSTRAINT [FK_Match_Stage] FOREIGN KEY([StageId]) REFERENCES [dbo].[Stage] ([Id])
ALTER TABLE [dbo].[Match]  WITH CHECK ADD  CONSTRAINT [FK_Match_Team] FOREIGN KEY([Team1Id]) REFERENCES [dbo].[Team] ([Id])
ALTER TABLE [dbo].[Match]  WITH CHECK ADD  CONSTRAINT [FK_Match_Team1] FOREIGN KEY([Team2Id]) REFERENCES [dbo].[Team] ([Id])
ALTER TABLE [dbo].[Match]  WITH CHECK ADD  CONSTRAINT [FK_Match_Team2] FOREIGN KEY([WinnerTeamId]) REFERENCES [dbo].[Team] ([Id])
GO

CREATE TABLE [dbo].[Score](
	[Id] [BIGINT] IDENTITY(1,1) NOT NULL,
	[Team1SetScore] [TINYINT] NOT NULL,
	[Team2SetScore] [TINYINT] NOT NULL,
	[WinnerTeamId] [BIGINT] NULL,
 CONSTRAINT [PK_Score] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Score]  WITH CHECK ADD  CONSTRAINT [FK_Score_Team] FOREIGN KEY([WinnerTeamId]) REFERENCES [dbo].[Team] ([Id])
GO

-- DATA START

SET IDENTITY_INSERT [dbo].[UserState] ON
INSERT [dbo].[UserState] ([Id], [Name]) VALUES (1, N'Inactive')
INSERT [dbo].[UserState] ([Id], [Name]) VALUES (2, N'Active')
INSERT [dbo].[UserState] ([Id], [Name]) VALUES (3, N'Deactive')
INSERT [dbo].[UserState] ([Id], [Name]) VALUES (4, N'Rejected')
SET IDENTITY_INSERT [dbo].[UserState] OFF
GO

INSERT [dbo].[Role] ([Id], [Name]) VALUES (1, N'Administrator')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (2, N'User')
GO

INSERT [dbo].[Gender] ([Id], [Name]) VALUES (1, N'Male')
INSERT [dbo].[Gender] ([Id], [Name]) VALUES (2, N'Female')
GO

INSERT INTO [dbo].[User]([Id],[Email],[Password],[Firstname],[Lastname],[Avatar],[GenderId],[RoleId],[StatusId],[IsDeleted],[LastLoginDate],[LastPasswordChangedDate],[ForgotPasswordToken],[ForgotPasswordTokenSentOn],[CreatedBy],[CreatedOn],[ModifiedBy],[ModifiedOn]) VALUES('27347386-FC67-493E-A60C-B105C0300417','','Gislen5*','Akila','','',1,2,2,1,NULL,NULL,NULL,NULL,NULL,GETDATE(),NULL,NULL)
INSERT INTO [dbo].[User]([Id],[Email],[Password],[Firstname],[Lastname],[Avatar],[GenderId],[RoleId],[StatusId],[IsDeleted],[LastLoginDate],[LastPasswordChangedDate],[ForgotPasswordToken],[ForgotPasswordTokenSentOn],[CreatedBy],[CreatedOn],[ModifiedBy],[ModifiedOn]) VALUES('D54F07EC-C692-4E15-825E-F70A4EDB3EF0','','Gislen5*','Arthy','','',1,2,2,1,NULL,NULL,NULL,NULL,NULL,GETDATE(),NULL,NULL)
INSERT INTO [dbo].[User]([Id],[Email],[Password],[Firstname],[Lastname],[Avatar],[GenderId],[RoleId],[StatusId],[IsDeleted],[LastLoginDate],[LastPasswordChangedDate],[ForgotPasswordToken],[ForgotPasswordTokenSentOn],[CreatedBy],[CreatedOn],[ModifiedBy],[ModifiedOn]) VALUES('AE6B1F7B-8A92-416F-9AD5-B1DF43225225','','Gislen5*','Bala','','',1,2,2,1,NULL,NULL,NULL,NULL,NULL,GETDATE(),NULL,NULL)
INSERT INTO [dbo].[User]([Id],[Email],[Password],[Firstname],[Lastname],[Avatar],[GenderId],[RoleId],[StatusId],[IsDeleted],[LastLoginDate],[LastPasswordChangedDate],[ForgotPasswordToken],[ForgotPasswordTokenSentOn],[CreatedBy],[CreatedOn],[ModifiedBy],[ModifiedOn]) VALUES('AA1C20D5-30C4-4836-AA7B-03C4DC71335F','','Gislen5*','Balaji.V','','',1,2,2,1,NULL,NULL,NULL,NULL,NULL,GETDATE(),NULL,NULL)
INSERT INTO [dbo].[User]([Id],[Email],[Password],[Firstname],[Lastname],[Avatar],[GenderId],[RoleId],[StatusId],[IsDeleted],[LastLoginDate],[LastPasswordChangedDate],[ForgotPasswordToken],[ForgotPasswordTokenSentOn],[CreatedBy],[CreatedOn],[ModifiedBy],[ModifiedOn]) VALUES('0D13EC49-AC89-4396-8F37-30AE339368A3','','Gislen5*','Bhanu','','',1,2,2,1,NULL,NULL,NULL,NULL,NULL,GETDATE(),NULL,NULL)
INSERT INTO [dbo].[User]([Id],[Email],[Password],[Firstname],[Lastname],[Avatar],[GenderId],[RoleId],[StatusId],[IsDeleted],[LastLoginDate],[LastPasswordChangedDate],[ForgotPasswordToken],[ForgotPasswordTokenSentOn],[CreatedBy],[CreatedOn],[ModifiedBy],[ModifiedOn]) VALUES('E2C3721E-D581-4F40-8D30-7D6C9F100F83','','Gislen5*','Christy','','',1,2,2,1,NULL,NULL,NULL,NULL,NULL,GETDATE(),NULL,NULL)
INSERT INTO [dbo].[User]([Id],[Email],[Password],[Firstname],[Lastname],[Avatar],[GenderId],[RoleId],[StatusId],[IsDeleted],[LastLoginDate],[LastPasswordChangedDate],[ForgotPasswordToken],[ForgotPasswordTokenSentOn],[CreatedBy],[CreatedOn],[ModifiedBy],[ModifiedOn]) VALUES('85C24750-7F5D-4B6B-9A14-121EFCD0487C','','Gislen5*','Dhilip','','',1,2,2,1,NULL,NULL,NULL,NULL,NULL,GETDATE(),NULL,NULL)
INSERT INTO [dbo].[User]([Id],[Email],[Password],[Firstname],[Lastname],[Avatar],[GenderId],[RoleId],[StatusId],[IsDeleted],[LastLoginDate],[LastPasswordChangedDate],[ForgotPasswordToken],[ForgotPasswordTokenSentOn],[CreatedBy],[CreatedOn],[ModifiedBy],[ModifiedOn]) VALUES('D91F77CE-0B1C-4AA9-BFFD-B83053C85345','','Gislen5*','Ebe (Jr)','','',1,2,2,1,NULL,NULL,NULL,NULL,NULL,GETDATE(),NULL,NULL)
INSERT INTO [dbo].[User]([Id],[Email],[Password],[Firstname],[Lastname],[Avatar],[GenderId],[RoleId],[StatusId],[IsDeleted],[LastLoginDate],[LastPasswordChangedDate],[ForgotPasswordToken],[ForgotPasswordTokenSentOn],[CreatedBy],[CreatedOn],[ModifiedBy],[ModifiedOn]) VALUES('74BD7224-9E3A-434E-8C87-F13D054C623A','','Gislen5*','Ebe Senior','','',1,2,2,1,NULL,NULL,NULL,NULL,NULL,GETDATE(),NULL,NULL)
INSERT INTO [dbo].[User]([Id],[Email],[Password],[Firstname],[Lastname],[Avatar],[GenderId],[RoleId],[StatusId],[IsDeleted],[LastLoginDate],[LastPasswordChangedDate],[ForgotPasswordToken],[ForgotPasswordTokenSentOn],[CreatedBy],[CreatedOn],[ModifiedBy],[ModifiedOn]) VALUES('23ADB5D6-7127-4AFD-9E8F-3A2282E57AA8','','Gislen5*','Jagadeesh','','',1,2,2,1,NULL,NULL,NULL,NULL,NULL,GETDATE(),NULL,NULL)
INSERT INTO [dbo].[User]([Id],[Email],[Password],[Firstname],[Lastname],[Avatar],[GenderId],[RoleId],[StatusId],[IsDeleted],[LastLoginDate],[LastPasswordChangedDate],[ForgotPasswordToken],[ForgotPasswordTokenSentOn],[CreatedBy],[CreatedOn],[ModifiedBy],[ModifiedOn]) VALUES('56294978-AF45-4EB2-AD54-85707A319082','','Gislen5*','Jayashree','','',1,2,2,1,NULL,NULL,NULL,NULL,NULL,GETDATE(),NULL,NULL)
INSERT INTO [dbo].[User]([Id],[Email],[Password],[Firstname],[Lastname],[Avatar],[GenderId],[RoleId],[StatusId],[IsDeleted],[LastLoginDate],[LastPasswordChangedDate],[ForgotPasswordToken],[ForgotPasswordTokenSentOn],[CreatedBy],[CreatedOn],[ModifiedBy],[ModifiedOn]) VALUES('768C644C-CCA8-4D0F-B2D2-A0A67715328C','','Gislen5*','Jeeva','','',1,2,2,1,NULL,NULL,NULL,NULL,NULL,GETDATE(),NULL,NULL)
INSERT INTO [dbo].[User]([Id],[Email],[Password],[Firstname],[Lastname],[Avatar],[GenderId],[RoleId],[StatusId],[IsDeleted],[LastLoginDate],[LastPasswordChangedDate],[ForgotPasswordToken],[ForgotPasswordTokenSentOn],[CreatedBy],[CreatedOn],[ModifiedBy],[ModifiedOn]) VALUES('9D8B07E2-DFAA-4115-81D7-B0E10B468E85','','Gislen5*','JP','','',1,2,2,1,NULL,NULL,NULL,NULL,NULL,GETDATE(),NULL,NULL)
INSERT INTO [dbo].[User]([Id],[Email],[Password],[Firstname],[Lastname],[Avatar],[GenderId],[RoleId],[StatusId],[IsDeleted],[LastLoginDate],[LastPasswordChangedDate],[ForgotPasswordToken],[ForgotPasswordTokenSentOn],[CreatedBy],[CreatedOn],[ModifiedBy],[ModifiedOn]) VALUES('A0DBAF23-58E7-45B9-A392-72CD5E8074EC','','Gislen5*','Kavimaran','','',1,2,2,1,NULL,NULL,NULL,NULL,NULL,GETDATE(),NULL,NULL)
INSERT INTO [dbo].[User]([Id],[Email],[Password],[Firstname],[Lastname],[Avatar],[GenderId],[RoleId],[StatusId],[IsDeleted],[LastLoginDate],[LastPasswordChangedDate],[ForgotPasswordToken],[ForgotPasswordTokenSentOn],[CreatedBy],[CreatedOn],[ModifiedBy],[ModifiedOn]) VALUES('26E06E78-43C0-4CD6-B209-51784AB18875','','Gislen5*','Madan','','',1,2,2,1,NULL,NULL,NULL,NULL,NULL,GETDATE(),NULL,NULL)
INSERT INTO [dbo].[User]([Id],[Email],[Password],[Firstname],[Lastname],[Avatar],[GenderId],[RoleId],[StatusId],[IsDeleted],[LastLoginDate],[LastPasswordChangedDate],[ForgotPasswordToken],[ForgotPasswordTokenSentOn],[CreatedBy],[CreatedOn],[ModifiedBy],[ModifiedOn]) VALUES('8BC52080-A8A6-4CE7-814E-EE1B2B1AADA7','','Gislen5*','Martin','','',1,2,2,1,NULL,NULL,NULL,NULL,NULL,GETDATE(),NULL,NULL)
INSERT INTO [dbo].[User]([Id],[Email],[Password],[Firstname],[Lastname],[Avatar],[GenderId],[RoleId],[StatusId],[IsDeleted],[LastLoginDate],[LastPasswordChangedDate],[ForgotPasswordToken],[ForgotPasswordTokenSentOn],[CreatedBy],[CreatedOn],[ModifiedBy],[ModifiedOn]) VALUES('B00605E4-9C80-46BF-A555-E856B2E5EE4C','','Gislen5*','Philip','','',1,2,2,1,NULL,NULL,NULL,NULL,NULL,GETDATE(),NULL,NULL)
INSERT INTO [dbo].[User]([Id],[Email],[Password],[Firstname],[Lastname],[Avatar],[GenderId],[RoleId],[StatusId],[IsDeleted],[LastLoginDate],[LastPasswordChangedDate],[ForgotPasswordToken],[ForgotPasswordTokenSentOn],[CreatedBy],[CreatedOn],[ModifiedBy],[ModifiedOn]) VALUES('46155471-152C-4636-A3B9-E1D188AEDB24','','Gislen5*','Raghu','','',1,2,2,1,NULL,NULL,NULL,NULL,NULL,GETDATE(),NULL,NULL)
INSERT INTO [dbo].[User]([Id],[Email],[Password],[Firstname],[Lastname],[Avatar],[GenderId],[RoleId],[StatusId],[IsDeleted],[LastLoginDate],[LastPasswordChangedDate],[ForgotPasswordToken],[ForgotPasswordTokenSentOn],[CreatedBy],[CreatedOn],[ModifiedBy],[ModifiedOn]) VALUES('5AEF6B70-C846-4226-900E-C3375BDD65A1','','Gislen5*','Sarath','','',1,2,2,1,NULL,NULL,NULL,NULL,NULL,GETDATE(),NULL,NULL)
INSERT INTO [dbo].[User]([Id],[Email],[Password],[Firstname],[Lastname],[Avatar],[GenderId],[RoleId],[StatusId],[IsDeleted],[LastLoginDate],[LastPasswordChangedDate],[ForgotPasswordToken],[ForgotPasswordTokenSentOn],[CreatedBy],[CreatedOn],[ModifiedBy],[ModifiedOn]) VALUES('667F6EBC-1766-4723-A9DA-C4CA007686B0','','Gislen5*','Shaj','','',1,2,2,1,NULL,NULL,NULL,NULL,NULL,GETDATE(),NULL,NULL)
INSERT INTO [dbo].[User]([Id],[Email],[Password],[Firstname],[Lastname],[Avatar],[GenderId],[RoleId],[StatusId],[IsDeleted],[LastLoginDate],[LastPasswordChangedDate],[ForgotPasswordToken],[ForgotPasswordTokenSentOn],[CreatedBy],[CreatedOn],[ModifiedBy],[ModifiedOn]) VALUES('A19FE7D8-7FD7-48DE-A6A4-E2C42205AA44','','Gislen5*','Suresh','','',1,2,2,1,NULL,NULL,NULL,NULL,NULL,GETDATE(),NULL,NULL)
INSERT INTO [dbo].[User]([Id],[Email],[Password],[Firstname],[Lastname],[Avatar],[GenderId],[RoleId],[StatusId],[IsDeleted],[LastLoginDate],[LastPasswordChangedDate],[ForgotPasswordToken],[ForgotPasswordTokenSentOn],[CreatedBy],[CreatedOn],[ModifiedBy],[ModifiedOn]) VALUES('1C1D0B43-4A5D-443C-B9CD-7207BE71A7D7','','Gislen5*','Susan','','',1,2,2,1,NULL,NULL,NULL,NULL,NULL,GETDATE(),NULL,NULL)
INSERT INTO [dbo].[User]([Id],[Email],[Password],[Firstname],[Lastname],[Avatar],[GenderId],[RoleId],[StatusId],[IsDeleted],[LastLoginDate],[LastPasswordChangedDate],[ForgotPasswordToken],[ForgotPasswordTokenSentOn],[CreatedBy],[CreatedOn],[ModifiedBy],[ModifiedOn]) VALUES('CA4867A1-5C1E-4737-9238-7818FD8864BF','','Gislen5*','Vanitha','','',1,2,2,1,NULL,NULL,NULL,NULL,NULL,GETDATE(),NULL,NULL)
INSERT INTO [dbo].[User]([Id],[Email],[Password],[Firstname],[Lastname],[Avatar],[GenderId],[RoleId],[StatusId],[IsDeleted],[LastLoginDate],[LastPasswordChangedDate],[ForgotPasswordToken],[ForgotPasswordTokenSentOn],[CreatedBy],[CreatedOn],[ModifiedBy],[ModifiedOn]) VALUES('4D875BB7-560E-4647-9B50-ED142601AD93','','Gislen5*','Vinoth','','',1,2,2,1,NULL,NULL,NULL,NULL,NULL,GETDATE(),NULL,NULL)
INSERT INTO [dbo].[User]([Id],[Email],[Password],[Firstname],[Lastname],[Avatar],[GenderId],[RoleId],[StatusId],[IsDeleted],[LastLoginDate],[LastPasswordChangedDate],[ForgotPasswordToken],[ForgotPasswordTokenSentOn],[CreatedBy],[CreatedOn],[ModifiedBy],[ModifiedOn]) VALUES('914C5D32-06A5-463B-910C-CB4D1B5E6A60','','Gislen5*','Vishnu','','',1,2,2,1,NULL,NULL,NULL,NULL,NULL,GETDATE(),NULL,NULL)
INSERT INTO [dbo].[User]([Id],[Email],[Password],[Firstname],[Lastname],[Avatar],[GenderId],[RoleId],[StatusId],[IsDeleted],[LastLoginDate],[LastPasswordChangedDate],[ForgotPasswordToken],[ForgotPasswordTokenSentOn],[CreatedBy],[CreatedOn],[ModifiedBy],[ModifiedOn]) VALUES('3A9E363A-38A4-4B75-A806-B43383D4C8C3','','Gislen5*','Viswa','','',1,2,2,1,NULL,NULL,NULL,NULL,NULL,GETDATE(),NULL,NULL)
INSERT INTO [dbo].[User]([Id],[Email],[Password],[Firstname],[Lastname],[Avatar],[GenderId],[RoleId],[StatusId],[IsDeleted],[LastLoginDate],[LastPasswordChangedDate],[ForgotPasswordToken],[ForgotPasswordTokenSentOn],[CreatedBy],[CreatedOn],[ModifiedBy],[ModifiedOn]) VALUES('DCCD573A-1A66-419E-A88D-8CFAA1BD2E59','','Gislen5*','Yoga','','',1,2,2,1,NULL,NULL,NULL,NULL,NULL,GETDATE(),NULL,NULL)
GO

SET IDENTITY_INSERT [dbo].[Game] ON
INSERT INTO [dbo].[Game]([Id],[Name])VALUES(1,'Table Tennis')
SET IDENTITY_INSERT [dbo].[Game] OFF
GO

SET IDENTITY_INSERT [dbo].[Tournament] ON
INSERT INTO [dbo].[Tournament]([Id],[Name],[GameId])VALUES(1,'Gislent TT Tournament 2017',1)
SET IDENTITY_INSERT [dbo].[Tournament] OFF
GO

SET IDENTITY_INSERT [dbo].[Subdivision] ON
INSERT INTO [dbo].[Subdivision]([Id],[Name],[TournamentId])VALUES(1,'Male Singles',1)
INSERT INTO [dbo].[Subdivision]([Id],[Name],[TournamentId])VALUES(2,'Male Doubles',1)
INSERT INTO [dbo].[Subdivision]([Id],[Name],[TournamentId])VALUES(3,'Women Doubles',1)
SET IDENTITY_INSERT [dbo].[Subdivision] OFF
GO

SET IDENTITY_INSERT [dbo].[Team] ON
INSERT INTO [dbo].[Team]([Id],[Name],[SubdivisionId])VALUES(1,'Akila',3)
INSERT INTO [dbo].[Team]([Id],[Name],[SubdivisionId])VALUES(2,'Arthy',3)
INSERT INTO [dbo].[Team]([Id],[Name],[SubdivisionId])VALUES(3,'Bala',1)
INSERT INTO [dbo].[Team]([Id],[Name],[SubdivisionId])VALUES(4,'Balaji.V',1)
INSERT INTO [dbo].[Team]([Id],[Name],[SubdivisionId])VALUES(5,'Bhanu',1)
INSERT INTO [dbo].[Team]([Id],[Name],[SubdivisionId])VALUES(6,'Christy',3)
INSERT INTO [dbo].[Team]([Id],[Name],[SubdivisionId])VALUES(7,'Dhilip',1)
INSERT INTO [dbo].[Team]([Id],[Name],[SubdivisionId])VALUES(8,'Ebe (Jr)',1)
INSERT INTO [dbo].[Team]([Id],[Name],[SubdivisionId])VALUES(9,'Ebe Senior',1)
INSERT INTO [dbo].[Team]([Id],[Name],[SubdivisionId])VALUES(10,'Jagadeesh',1)
INSERT INTO [dbo].[Team]([Id],[Name],[SubdivisionId])VALUES(11,'Jayashree',1)
INSERT INTO [dbo].[Team]([Id],[Name],[SubdivisionId])VALUES(12,'Jeeva',1)
INSERT INTO [dbo].[Team]([Id],[Name],[SubdivisionId])VALUES(13,'JP',1)
INSERT INTO [dbo].[Team]([Id],[Name],[SubdivisionId])VALUES(14,'Kavimaran',1)
INSERT INTO [dbo].[Team]([Id],[Name],[SubdivisionId])VALUES(15,'Madan',1)
INSERT INTO [dbo].[Team]([Id],[Name],[SubdivisionId])VALUES(16,'Martin',1)
INSERT INTO [dbo].[Team]([Id],[Name],[SubdivisionId])VALUES(17,'Philip',1)
INSERT INTO [dbo].[Team]([Id],[Name],[SubdivisionId])VALUES(18,'Raghu',1)
INSERT INTO [dbo].[Team]([Id],[Name],[SubdivisionId])VALUES(19,'Sarath',1)
INSERT INTO [dbo].[Team]([Id],[Name],[SubdivisionId])VALUES(20,'Shaj',1)
INSERT INTO [dbo].[Team]([Id],[Name],[SubdivisionId])VALUES(21,'Suresh',1)
INSERT INTO [dbo].[Team]([Id],[Name],[SubdivisionId])VALUES(22,'Susan',3)
INSERT INTO [dbo].[Team]([Id],[Name],[SubdivisionId])VALUES(23,'Vanitha',3)
INSERT INTO [dbo].[Team]([Id],[Name],[SubdivisionId])VALUES(24,'Vinoth',3)
INSERT INTO [dbo].[Team]([Id],[Name],[SubdivisionId])VALUES(25,'Vishnu',1)
INSERT INTO [dbo].[Team]([Id],[Name],[SubdivisionId])VALUES(26,'Viswa',1)
INSERT INTO [dbo].[Team]([Id],[Name],[SubdivisionId])VALUES(27,'Yoga',3)
SET IDENTITY_INSERT [dbo].[Team] OFF
GO

-- DATA END