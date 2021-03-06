USE [master]
GO
/****** Object:  Database [OnlineDoctorAppointment]    Script Date: 17-03-2020 20:55:52 ******/
CREATE DATABASE [OnlineDoctorAppointment]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OnlineDoctorAppointment', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQL2017\MSSQL\DATA\OnlineDoctorAppointment.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'OnlineDoctorAppointment_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQL2017\MSSQL\DATA\OnlineDoctorAppointment_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [OnlineDoctorAppointment] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OnlineDoctorAppointment].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OnlineDoctorAppointment] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OnlineDoctorAppointment] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OnlineDoctorAppointment] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OnlineDoctorAppointment] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OnlineDoctorAppointment] SET ARITHABORT OFF 
GO
ALTER DATABASE [OnlineDoctorAppointment] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OnlineDoctorAppointment] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OnlineDoctorAppointment] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OnlineDoctorAppointment] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OnlineDoctorAppointment] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OnlineDoctorAppointment] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OnlineDoctorAppointment] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OnlineDoctorAppointment] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OnlineDoctorAppointment] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OnlineDoctorAppointment] SET  DISABLE_BROKER 
GO
ALTER DATABASE [OnlineDoctorAppointment] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OnlineDoctorAppointment] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OnlineDoctorAppointment] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OnlineDoctorAppointment] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OnlineDoctorAppointment] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OnlineDoctorAppointment] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OnlineDoctorAppointment] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OnlineDoctorAppointment] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [OnlineDoctorAppointment] SET  MULTI_USER 
GO
ALTER DATABASE [OnlineDoctorAppointment] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OnlineDoctorAppointment] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OnlineDoctorAppointment] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OnlineDoctorAppointment] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [OnlineDoctorAppointment] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [OnlineDoctorAppointment] SET QUERY_STORE = OFF
GO
USE [OnlineDoctorAppointment]
GO
/****** Object:  Table [dbo].[Doctors]    Script Date: 17-03-2020 20:55:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctors](
	[DoctorId] [int] IDENTITY(1,1) NOT NULL,
	[DoctorName] [varchar](50) NOT NULL,
	[Degree] [varchar](50) NOT NULL,
	[Experience] [varchar](50) NOT NULL,
	[SpecialistAO] [int] NOT NULL,
	[Fees] [int] NOT NULL,
	[Timming] [varchar](50) NOT NULL,
	[AvailabelStatusAO] [int] NOT NULL,
 CONSTRAINT [PK_Doctors] PRIMARY KEY CLUSTERED 
(
	[DoctorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patients]    Script Date: 17-03-2020 20:55:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patients](
	[PatientId] [int] IDENTITY(1,1) NOT NULL,
	[PatientName] [varchar](50) NOT NULL,
	[MobileNo] [bigint] NOT NULL,
	[City] [varchar](50) NOT NULL,
	[GenderAO] [int] NOT NULL,
	[Password] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Patients] PRIMARY KEY CLUSTERED 
(
	[PatientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppointmentBook]    Script Date: 17-03-2020 20:55:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppointmentBook](
	[AppointmentId] [int] IDENTITY(1,1) NOT NULL,
	[PatientId] [int] NOT NULL,
	[DoctorId] [int] NOT NULL,
	[AppointmentStatus] [bit] NOT NULL,
	[DoctorDetailId] [int] NULL,
 CONSTRAINT [PK_AppointmentBook] PRIMARY KEY CLUSTERED 
(
	[AppointmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DoctorDetails]    Script Date: 17-03-2020 20:55:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DoctorDetails](
	[DoctorDetailId] [int] IDENTITY(1,1) NOT NULL,
	[DoctorId] [int] NOT NULL,
	[TimingDetail] [varchar](50) NULL,
 CONSTRAINT [PK_DoctorDetails] PRIMARY KEY CLUSTERED 
(
	[DoctorDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vAppointmentBook]    Script Date: 17-03-2020 20:55:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vAppointmentBook]
AS
SELECT        dbo.Patients.PatientName, dbo.Patients.MobileNo, dbo.Doctors.DoctorName, dbo.Doctors.SpecialistAO, dbo.Doctors.Fees, dbo.DoctorDetails.TimingDetail, innner.AppointmentStatus
FROM            dbo.AppointmentBook AS innner INNER JOIN
                         dbo.Patients ON innner.PatientId = dbo.Patients.PatientId INNER JOIN
                         dbo.Doctors ON innner.DoctorId = dbo.Doctors.DoctorId INNER JOIN
                         dbo.DoctorDetails ON dbo.DoctorDetails.DoctorId = innner.DoctorId
GO
/****** Object:  Table [dbo].[ApplicationObject]    Script Date: 17-03-2020 20:55:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationObject](
	[ApplicationObjectId] [int] IDENTITY(1,1) NOT NULL,
	[ApplicationObjectTypeId] [int] NOT NULL,
	[ApplicationObjectName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ApplicationObject] PRIMARY KEY CLUSTERED 
(
	[ApplicationObjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApplicationObjectType]    Script Date: 17-03-2020 20:55:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationObjectType](
	[ApplicationObjectTypeId] [int] IDENTITY(1,1) NOT NULL,
	[ApplicationObjectTypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ApplicationObjectType] PRIMARY KEY CLUSTERED 
(
	[ApplicationObjectTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Receptionist]    Script Date: 17-03-2020 20:55:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Receptionist](
	[ReceptionistId] [int] IDENTITY(1,1) NOT NULL,
	[AppointmentId] [int] NOT NULL,
	[FeesStatus] [bit] NOT NULL,
 CONSTRAINT [PK_Receptionist] PRIMARY KEY CLUSTERED 
(
	[ReceptionistId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AppointmentBook] ADD  CONSTRAINT [DF_AppointmentBook_AppointmentStatus]  DEFAULT ((1)) FOR [AppointmentStatus]
GO
ALTER TABLE [dbo].[Doctors] ADD  CONSTRAINT [DF_Doctors_AvailabelStatusAO]  DEFAULT ((1)) FOR [AvailabelStatusAO]
GO
ALTER TABLE [dbo].[Receptionist] ADD  CONSTRAINT [DF_Receptionist_FeesStatus]  DEFAULT ((1)) FOR [FeesStatus]
GO
ALTER TABLE [dbo].[ApplicationObject]  WITH CHECK ADD  CONSTRAINT [FK_ApplicationObject_ApplicationObject] FOREIGN KEY([ApplicationObjectTypeId])
REFERENCES [dbo].[ApplicationObjectType] ([ApplicationObjectTypeId])
GO
ALTER TABLE [dbo].[ApplicationObject] CHECK CONSTRAINT [FK_ApplicationObject_ApplicationObject]
GO
ALTER TABLE [dbo].[AppointmentBook]  WITH CHECK ADD  CONSTRAINT [FK_AppointmentBook_DoctorDetails] FOREIGN KEY([DoctorDetailId])
REFERENCES [dbo].[DoctorDetails] ([DoctorDetailId])
GO
ALTER TABLE [dbo].[AppointmentBook] CHECK CONSTRAINT [FK_AppointmentBook_DoctorDetails]
GO
ALTER TABLE [dbo].[AppointmentBook]  WITH CHECK ADD  CONSTRAINT [FK_AppointmentBook_Doctors] FOREIGN KEY([DoctorId])
REFERENCES [dbo].[Doctors] ([DoctorId])
GO
ALTER TABLE [dbo].[AppointmentBook] CHECK CONSTRAINT [FK_AppointmentBook_Doctors]
GO
ALTER TABLE [dbo].[AppointmentBook]  WITH CHECK ADD  CONSTRAINT [FK_AppointmentBook_Patients] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patients] ([PatientId])
GO
ALTER TABLE [dbo].[AppointmentBook] CHECK CONSTRAINT [FK_AppointmentBook_Patients]
GO
ALTER TABLE [dbo].[DoctorDetails]  WITH CHECK ADD  CONSTRAINT [FK_DoctorDetails_Doctors] FOREIGN KEY([DoctorId])
REFERENCES [dbo].[Doctors] ([DoctorId])
GO
ALTER TABLE [dbo].[DoctorDetails] CHECK CONSTRAINT [FK_DoctorDetails_Doctors]
GO
ALTER TABLE [dbo].[Doctors]  WITH CHECK ADD  CONSTRAINT [FK_Doctors_ApplicationObject] FOREIGN KEY([SpecialistAO])
REFERENCES [dbo].[ApplicationObject] ([ApplicationObjectId])
GO
ALTER TABLE [dbo].[Doctors] CHECK CONSTRAINT [FK_Doctors_ApplicationObject]
GO
/****** Object:  StoredProcedure [dbo].[spAppointmentBook]    Script Date: 17-03-2020 20:55:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spAppointmentBook]
@PatientId int ,@DoctorId int,@DoctorDetailId int

as
begin
declare @Patient int, @Doctor int,@AppointmentBookId int
select @Patient=PatientId FROM Patients WHERE PatientId=@PatientId
SELECT @Doctor=DoctorId from Doctors where DoctorId=@DoctorId
insert into AppointmentBook values (@Patient,@Doctor,1,@DoctorDetailId)
select @AppointmentBookId= AppointmentId From AppointmentBook where PatientId=@PatientId
insert into Receptionist values (@AppointmentBookId,1)

end
GO
/****** Object:  StoredProcedure [dbo].[spFeesUpdate]    Script Date: 17-03-2020 20:55:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spFeesUpdate]
@AppoinmentId int
as
begin
update Receptionist set FeesStatus=0 where AppointmentId=@AppoinmentId

end
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "innner"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 230
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Patients"
            Begin Extent = 
               Top = 6
               Left = 268
               Bottom = 136
               Right = 438
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "Doctors"
            Begin Extent = 
               Top = 6
               Left = 476
               Bottom = 136
               Right = 662
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "DoctorDetails"
            Begin Extent = 
               Top = 6
               Left = 700
               Bottom = 119
               Right = 870
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vAppointmentBook'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vAppointmentBook'
GO
USE [master]
GO
ALTER DATABASE [OnlineDoctorAppointment] SET  READ_WRITE 
GO
