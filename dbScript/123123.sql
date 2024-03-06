USE [master]
GO
/****** Object:  Database [dbHospital]    Script Date: 27.02.2024 12:30:43 ******/
CREATE DATABASE [dbHospital]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbHospital', FILENAME = N'D:\servermssqla\MSSQL16.MSSQLSERVER\MSSQL\DATA\dbHospital.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dbHospital_log', FILENAME = N'D:\servermssqla\MSSQL16.MSSQLSERVER\MSSQL\DATA\dbHospital_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [dbHospital] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbHospital].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbHospital] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbHospital] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbHospital] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbHospital] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbHospital] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbHospital] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dbHospital] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbHospital] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbHospital] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbHospital] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbHospital] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbHospital] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbHospital] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbHospital] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbHospital] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dbHospital] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbHospital] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbHospital] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbHospital] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbHospital] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbHospital] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbHospital] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbHospital] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [dbHospital] SET  MULTI_USER 
GO
ALTER DATABASE [dbHospital] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbHospital] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbHospital] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbHospital] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dbHospital] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [dbHospital] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [dbHospital] SET QUERY_STORE = ON
GO
ALTER DATABASE [dbHospital] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [dbHospital]
GO
/****** Object:  Table [dbo].[CodeHospitalization]    Script Date: 27.02.2024 12:30:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CodeHospitalization](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[PurposeHospitalization] [nvarchar](50) NOT NULL,
	[DepartmentHospitalization] [nvarchar](50) NOT NULL,
	[IDTypeHospitalization] [int] NOT NULL,
	[TermHospitalization] [int] NOT NULL,
	[AdditionalInformation] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_CodeHospitalization] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DiseaseHistory]    Script Date: 27.02.2024 12:30:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiseaseHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NameDisease] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](150) NOT NULL,
	[DateOfDisease] [date] NOT NULL,
 CONSTRAINT [PK_DiseaseHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doctor]    Script Date: 27.02.2024 12:30:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctor](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Patronymic] [nvarchar](50) NULL,
	[IDGender] [int] NOT NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[IDSpeciality] [int] NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[IDRole] [int] NULL,
 CONSTRAINT [PK_Doctor] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Event]    Script Date: 27.02.2024 12:30:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Event](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[TimeStart] [time](7) NOT NULL,
	[Duration] [time](7) NOT NULL,
	[CountOfPatient] [int] NOT NULL,
 CONSTRAINT [PK_Event] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 27.02.2024 12:30:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hospitalization]    Script Date: 27.02.2024 12:30:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hospitalization](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDPatient] [int] NOT NULL,
	[IDCodeHospitalization] [int] NULL,
	[DateOfHospitalization] [date] NOT NULL,
	[TimeOfHospitalization] [time](7) NOT NULL,
	[StatusHospitalization] [bit] NULL,
	[ReasonRejection] [nvarchar](150) NULL,
 CONSTRAINT [PK_Hospitalization] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InsuranseCompany]    Script Date: 27.02.2024 12:30:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InsuranseCompany](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_InsuranseCompany] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InsuransePolicy]    Script Date: 27.02.2024 12:30:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InsuransePolicy](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Number] [nvarchar](25) NOT NULL,
	[DateOfExpiration] [date] NOT NULL,
 CONSTRAINT [PK_InsuransePolicy] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedicalCard]    Script Date: 27.02.2024 12:30:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicalCard](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Number] [nvarchar](25) NOT NULL,
	[DateOfIssue] [date] NULL,
	[DateOfLastApeal] [date] NULL,
	[DateOfNextApeal] [date] NULL,
	[IdentificationCode] [nvarchar](50) NOT NULL,
	[PathQRCode] [nvarchar](50) NULL,
	[Photo] [nvarchar](max) NULL,
 CONSTRAINT [PK_MedicalCard] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Passport]    Script Date: 27.02.2024 12:30:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Passport](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SeriesPassport] [nvarchar](50) NOT NULL,
	[NumberPassport] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Passport] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patient]    Script Date: 27.02.2024 12:30:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patient](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Photo] [nvarchar](max) NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Patronymic] [nvarchar](50) NULL,
	[IDPassport] [int] NOT NULL,
	[DateOfBirth] [date] NULL,
	[IDGender] [int] NULL,
	[Adress] [nvarchar](max) NULL,
	[Phone] [nvarchar](20) NULL,
	[Email] [nvarchar](50) NULL,
	[IDMedicalCard] [int] NOT NULL,
	[IDInsuransePolicy] [int] NOT NULL,
	[Diagnos] [nvarchar](50) NULL,
	[IDDiseaseHistory] [int] NULL,
	[IDInsuranseCompany] [int] NOT NULL,
	[WorkPlace] [nvarchar](50) NOT NULL,
	[PathContract] [nvarchar](max) NULL,
	[PathPersonalData] [nvarchar](max) NULL,
 CONSTRAINT [PK_Patient] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prescription]    Script Date: 27.02.2024 12:30:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prescription](
	[ID] [int] NOT NULL,
	[IDMedicalCard] [int] NOT NULL,
	[Medicine] [nvarchar](50) NOT NULL,
	[Dosage] [nvarchar](20) NOT NULL,
	[Administration] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Prescription] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Referrals]    Script Date: 27.02.2024 12:30:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Referrals](
	[ID] [int] NOT NULL,
	[IDMedicalCard] [int] NOT NULL,
	[IDDoctor] [int] NOT NULL,
	[CreationDate] [date] NOT NULL,
	[Anamnesis] [nvarchar](max) NOT NULL,
	[Symptoms] [nvarchar](max) NOT NULL,
	[Diagnosis] [nvarchar](max) NOT NULL,
	[Recommendations] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Referrals] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ResultEvent]    Script Date: 27.02.2024 12:30:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResultEvent](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ValueAnalyses] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](150) NOT NULL,
	[PrescribedMedications] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ResultEvent] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 27.02.2024 12:30:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[ID] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 27.02.2024 12:30:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[IDRoomStatus] [int] NOT NULL,
	[Capacity] [int] NOT NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomStatus]    Script Date: 27.02.2024 12:30:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomStatus](
	[ID] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_RoomStatus] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Schedule]    Script Date: 27.02.2024 12:30:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedule](
	[ID] [int] NOT NULL,
	[IDRoom] [int] NOT NULL,
	[IDDoctor] [int] NOT NULL,
	[ReceptionTime] [time](7) NOT NULL,
	[BreakTime] [time](7) NOT NULL,
	[IDWorkDayType] [int] NOT NULL,
	[IDTypicalDay] [int] NOT NULL,
	[IDEvent] [int] NOT NULL,
 CONSTRAINT [PK_Schedule] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Speciality]    Script Date: 27.02.2024 12:30:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Speciality](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Speciality] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TherapeuticDiagnosticMeasures]    Script Date: 27.02.2024 12:30:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TherapeuticDiagnosticMeasures](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDPatient] [int] NOT NULL,
	[IDDoctor] [int] NOT NULL,
	[IDTypeEvent] [int] NOT NULL,
	[NameEvent] [nvarchar](50) NOT NULL,
	[IDResultEvent] [int] NOT NULL,
	[Recomendation] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_TherapeuticDiagnosticMeasures] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeEvent]    Script Date: 27.02.2024 12:30:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeEvent](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TypeEvent] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeHospitalization]    Script Date: 27.02.2024 12:30:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeHospitalization](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TypeHospitalization] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypicalDay]    Script Date: 27.02.2024 12:30:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypicalDay](
	[ID] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TypicalDay] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 27.02.2024 12:30:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [int] NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[Patronymic] [nvarchar](50) NOT NULL,
	[Phone] [nchar](10) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[IDRole] [int] NOT NULL,
	[IDSpeciality] [int] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkDayType]    Script Date: 27.02.2024 12:30:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkDayType](
	[ID] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_WorkDayType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Doctor] ON 

INSERT [dbo].[Doctor] ([ID], [FirstName], [LastName], [Patronymic], [IDGender], [Phone], [Email], [IDSpeciality], [Login], [Password], [IDRole]) VALUES (1, N'Иван', N'Иванов', N'Иванович', 4, N'+79831311', N'ivan@gmail.com', 1, N'root', N'123123', NULL)
SET IDENTITY_INSERT [dbo].[Doctor] OFF
GO
SET IDENTITY_INSERT [dbo].[Gender] ON 

INSERT [dbo].[Gender] ([ID], [Title]) VALUES (3, N'Женский')
INSERT [dbo].[Gender] ([ID], [Title]) VALUES (4, N'Мужской')
SET IDENTITY_INSERT [dbo].[Gender] OFF
GO
SET IDENTITY_INSERT [dbo].[Hospitalization] ON 

INSERT [dbo].[Hospitalization] ([ID], [IDPatient], [IDCodeHospitalization], [DateOfHospitalization], [TimeOfHospitalization], [StatusHospitalization], [ReasonRejection]) VALUES (1, 4, NULL, CAST(N'2024-02-20' AS Date), CAST(N'21:33:00' AS Time), NULL, NULL)
INSERT [dbo].[Hospitalization] ([ID], [IDPatient], [IDCodeHospitalization], [DateOfHospitalization], [TimeOfHospitalization], [StatusHospitalization], [ReasonRejection]) VALUES (2, 31, NULL, CAST(N'2024-02-15' AS Date), CAST(N'14:02:00' AS Time), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Hospitalization] OFF
GO
SET IDENTITY_INSERT [dbo].[InsuranseCompany] ON 

INSERT [dbo].[InsuranseCompany] ([ID], [Title]) VALUES (11, N'O''Conner - Greenholt')
INSERT [dbo].[InsuranseCompany] ([ID], [Title]) VALUES (12, N'Dicki - Zieme')
INSERT [dbo].[InsuranseCompany] ([ID], [Title]) VALUES (13, N'Block, Klocko and Koelpin')
INSERT [dbo].[InsuranseCompany] ([ID], [Title]) VALUES (14, N'Abbott, Klocko and Durgan')
INSERT [dbo].[InsuranseCompany] ([ID], [Title]) VALUES (15, N'Yundt, Cormier and Skiles')
INSERT [dbo].[InsuranseCompany] ([ID], [Title]) VALUES (16, N'Herman LLC')
INSERT [dbo].[InsuranseCompany] ([ID], [Title]) VALUES (17, N'Greenholt - Wilkinson')
INSERT [dbo].[InsuranseCompany] ([ID], [Title]) VALUES (18, N'MacGyver, Kunde and Muller')
INSERT [dbo].[InsuranseCompany] ([ID], [Title]) VALUES (19, N'Oberbrunner, Ward and Toy')
INSERT [dbo].[InsuranseCompany] ([ID], [Title]) VALUES (20, N'Buckridge Inc')
INSERT [dbo].[InsuranseCompany] ([ID], [Title]) VALUES (21, N'234234')
INSERT [dbo].[InsuranseCompany] ([ID], [Title]) VALUES (22, N'123')
SET IDENTITY_INSERT [dbo].[InsuranseCompany] OFF
GO
SET IDENTITY_INSERT [dbo].[InsuransePolicy] ON 

INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (11, N'IP-0x64c04dbb', CAST(N'2025-02-16' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (12, N'IP-0x984aa24e', CAST(N'2024-12-28' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (13, N'IP-0xb6243a32', CAST(N'2024-07-06' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (14, N'IP-0x547b999e', CAST(N'2024-10-01' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (15, N'IP-0x3bbde43e', CAST(N'2024-05-28' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (16, N'IP-0x110c0c2b', CAST(N'2025-02-07' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (17, N'IP-0x8202d176', CAST(N'2024-08-06' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (18, N'IP-0x8deb1c90', CAST(N'2024-05-10' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (19, N'IP-0x1e7d0562', CAST(N'2024-03-18' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (20, N'IP-0x583b8ea1', CAST(N'2024-11-24' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (21, N'IP-0x81ea58db', CAST(N'2024-03-03' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (22, N'IP-0x55043f81', CAST(N'2024-12-19' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (23, N'IP-0x7a1bca02', CAST(N'2025-01-26' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (24, N'IP-0x3c501f00', CAST(N'2025-02-16' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (25, N'IP-0x478ff451', CAST(N'2024-12-15' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (26, N'IP-0x00442712', CAST(N'2024-07-30' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (27, N'IP-0x9c53939a', CAST(N'2025-01-30' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (28, N'IP-0xb43042f3', CAST(N'2024-10-15' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (29, N'IP-0x47bd6ae0', CAST(N'2024-04-01' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (30, N'IP-0xaeadee86', CAST(N'2024-05-24' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (31, N'IP-0xa1d46459', CAST(N'2024-12-09' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (32, N'IP-0x8fc14edc', CAST(N'2024-11-04' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (33, N'IP-0xbc6a591f', CAST(N'2024-11-25' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (34, N'IP-0x4d557ee5', CAST(N'2024-04-20' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (35, N'IP-0xcf167ce5', CAST(N'2024-03-09' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (36, N'IP-0x489bf13d', CAST(N'2024-10-03' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (37, N'IP-0xdfc32691', CAST(N'2024-11-25' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (38, N'IP-0x637e3fc0', CAST(N'2024-12-22' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (39, N'IP-0x9549c08c', CAST(N'2024-08-08' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (40, N'IP-0x28e41a41', CAST(N'2024-07-13' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (41, N'IP-0x68cad607', CAST(N'2024-04-04' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (42, N'IP-0x865aff4a', CAST(N'2024-08-25' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (43, N'IP-0x433ca6f6', CAST(N'2024-09-09' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (44, N'IP-0xd22ca196', CAST(N'2024-08-24' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (45, N'IP-0x0f8e84e0', CAST(N'2024-07-26' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (46, N'IP-0x279ef72f', CAST(N'2025-01-01' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (47, N'IP-0x29d6a6d2', CAST(N'2024-06-22' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (48, N'IP-0xfbc31974', CAST(N'2024-11-03' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (49, N'IP-0xf5bedafd', CAST(N'2025-02-12' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (50, N'IP-0xfe3aaa46', CAST(N'2024-12-04' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (51, N'IP-0x994105fe', CAST(N'2024-06-04' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (52, N'IP-0xae607bc3', CAST(N'2024-10-12' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (53, N'IP-0x24c37c6e', CAST(N'2024-05-29' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (54, N'IP-0x2412facd', CAST(N'2024-11-03' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (55, N'IP-0x6d45ef65', CAST(N'2025-02-11' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (56, N'IP-0x9e78e701', CAST(N'2024-04-06' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (57, N'IP-0x0627a21d', CAST(N'2024-10-20' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (58, N'IP-0x28fb3a05', CAST(N'2024-06-21' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (59, N'IP-0x5d6dc2dd', CAST(N'2025-02-17' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (60, N'IP-0xca5a2d9c', CAST(N'2024-07-25' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (61, N'IP-0x8e323043', CAST(N'2024-12-22' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (62, N'IP-0x0dbc782b', CAST(N'2024-06-08' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (63, N'IP-0xb39fad24', CAST(N'2024-05-18' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (64, N'IP-0x48512637', CAST(N'2024-08-20' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (65, N'IP-0x1295885d', CAST(N'2025-02-23' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (66, N'IP-0x402d879d', CAST(N'2024-09-27' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (67, N'IP-0xc935fed0', CAST(N'2024-11-16' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (68, N'IP-0x7eb48010', CAST(N'2024-09-05' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (69, N'IP-0xa6a1adde', CAST(N'2024-06-06' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (70, N'IP-0x17fe74d7', CAST(N'2025-01-07' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (71, N'IP-0x3b3a78de', CAST(N'2025-01-15' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (72, N'IP-0x3f71c8ee', CAST(N'2024-08-02' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (73, N'IP-0xebe680ab', CAST(N'2024-09-12' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (74, N'IP-0xb877713d', CAST(N'2024-06-01' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (75, N'IP-0x50e23cf9', CAST(N'2025-02-12' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (76, N'IP-0xc0b709df', CAST(N'2024-11-24' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (77, N'IP-0xed320bf1', CAST(N'2024-07-05' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (78, N'IP-0x7c86ef49', CAST(N'2025-01-14' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (79, N'IP-0x8b726f1d', CAST(N'2024-11-18' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (80, N'IP-0xd48d9854', CAST(N'2025-02-12' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (81, N'IP-0x03f23168', CAST(N'2024-12-10' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (82, N'IP-0x752c36b5', CAST(N'2024-05-07' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (83, N'IP-0x4c630202', CAST(N'2025-01-05' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (84, N'IP-0xd9201af3', CAST(N'2024-07-15' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (85, N'IP-0xe585be2a', CAST(N'2024-08-24' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (86, N'IP-0x91011451', CAST(N'2024-08-17' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (87, N'IP-0x8d2d2049', CAST(N'2025-01-21' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (88, N'IP-0x9747c00d', CAST(N'2024-03-08' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (89, N'IP-0xae0806a6', CAST(N'2024-03-22' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (90, N'IP-0xdc7eb027', CAST(N'2024-07-08' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (91, N'IP-0x30281209', CAST(N'2024-05-11' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (92, N'IP-0x314f043a', CAST(N'2024-05-07' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (93, N'IP-0x60cc2bf6', CAST(N'2024-12-24' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (94, N'IP-0x6bc455ad', CAST(N'2024-12-04' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (95, N'IP-0xe2ce7737', CAST(N'2024-06-23' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (96, N'IP-0xcdb3a0cb', CAST(N'2024-07-27' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (97, N'IP-0x97e68a59', CAST(N'2025-01-16' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (98, N'IP-0x7ece4385', CAST(N'2024-09-15' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (99, N'IP-0x68848b63', CAST(N'2024-09-25' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (100, N'IP-0x130b79e1', CAST(N'2024-07-04' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (101, N'IP-0xe7919e9b', CAST(N'2024-09-10' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (102, N'IP-0x9d87b576', CAST(N'2024-05-13' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (103, N'IP-0xe4e2f513', CAST(N'2024-07-26' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (104, N'IP-0xeb72f3da', CAST(N'2025-01-10' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (105, N'IP-0xf4fabd2d', CAST(N'2024-06-26' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (106, N'IP-0x098a4160', CAST(N'2024-12-12' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (107, N'IP-0x7b84057b', CAST(N'2024-03-11' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (108, N'IP-0x16d59078', CAST(N'2024-03-30' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (109, N'IP-0x339101f0', CAST(N'2024-10-01' AS Date))
GO
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (110, N'IP-0xe365cf66', CAST(N'2025-02-03' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (111, N'24234', CAST(N'2024-01-31' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (112, N'123', CAST(N'2024-02-08' AS Date))
SET IDENTITY_INSERT [dbo].[InsuransePolicy] OFF
GO
SET IDENTITY_INSERT [dbo].[MedicalCard] ON 

INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (1, N'MC-0x7c9c10a5', CAST(N'2023-10-24' AS Date), CAST(N'2023-10-18' AS Date), CAST(N'2010-08-26' AS Date), N'735799', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (2, N'MC-0xe545994c', CAST(N'2014-04-26' AS Date), CAST(N'2023-09-01' AS Date), CAST(N'2010-09-01' AS Date), N'695948', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (3, N'MC-0xd21e5fa3', CAST(N'2015-08-07' AS Date), CAST(N'2023-07-26' AS Date), CAST(N'2019-06-03' AS Date), N'930776', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (4, N'MC-0xd7f4ea94', CAST(N'2024-01-04' AS Date), CAST(N'2023-03-18' AS Date), CAST(N'2014-01-20' AS Date), N'883752', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (5, N'MC-0x57cfaca3', CAST(N'2020-08-14' AS Date), CAST(N'2022-04-03' AS Date), CAST(N'1996-11-15' AS Date), N'899633', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (6, N'MC-0xec0183d9', CAST(N'2022-03-18' AS Date), CAST(N'2023-06-05' AS Date), CAST(N'2010-06-14' AS Date), N'224340', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (7, N'MC-0x90e5a2a5', CAST(N'2015-08-28' AS Date), CAST(N'2023-09-15' AS Date), CAST(N'2007-01-13' AS Date), N'880032', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (8, N'MC-0x3a90ae9e', CAST(N'2018-10-04' AS Date), CAST(N'2023-12-20' AS Date), CAST(N'2012-11-16' AS Date), N'213329', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (9, N'MC-0x98bc9caf', CAST(N'2014-03-09' AS Date), CAST(N'2022-11-28' AS Date), CAST(N'2013-01-18' AS Date), N'655597', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (10, N'MC-0xe492480a', CAST(N'2022-01-31' AS Date), CAST(N'2023-10-31' AS Date), CAST(N'1998-03-11' AS Date), N'867496', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (11, N'MC-0xacf4c898', CAST(N'2017-10-11' AS Date), CAST(N'2022-08-18' AS Date), CAST(N'2001-11-12' AS Date), N'210917', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (12, N'MC-0x7db189d9', CAST(N'2021-01-17' AS Date), CAST(N'2022-03-17' AS Date), CAST(N'2020-06-01' AS Date), N'400444', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (13, N'MC-0x56900be7', CAST(N'2017-07-21' AS Date), CAST(N'2022-05-21' AS Date), CAST(N'2019-08-28' AS Date), N'834956', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (14, N'MC-0xd6270df2', CAST(N'2018-07-12' AS Date), CAST(N'2023-03-20' AS Date), CAST(N'2002-02-20' AS Date), N'498216', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (15, N'MC-0xcf29448a', CAST(N'2017-05-08' AS Date), CAST(N'2022-12-10' AS Date), CAST(N'1995-06-29' AS Date), N'460906', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (16, N'MC-0xe97fd478', CAST(N'2017-01-16' AS Date), CAST(N'2022-04-16' AS Date), CAST(N'2015-09-30' AS Date), N'235396', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (17, N'MC-0x7687ffcd', CAST(N'2017-07-20' AS Date), CAST(N'2023-10-26' AS Date), CAST(N'2017-10-19' AS Date), N'200277', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (18, N'MC-0x95265723', CAST(N'2019-09-25' AS Date), CAST(N'2022-08-20' AS Date), CAST(N'2008-06-21' AS Date), N'484427', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (19, N'MC-0x605402bd', CAST(N'2017-07-08' AS Date), CAST(N'2022-03-12' AS Date), CAST(N'2019-12-15' AS Date), N'889003', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (20, N'MC-0xb1abd1bc', CAST(N'2020-04-19' AS Date), CAST(N'2023-06-28' AS Date), CAST(N'2012-10-25' AS Date), N'566373', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (21, N'MC-0x2133c1bb', CAST(N'2015-03-27' AS Date), CAST(N'2023-11-24' AS Date), CAST(N'2023-08-29' AS Date), N'960834', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (22, N'MC-0xa8d76579', CAST(N'2022-04-17' AS Date), CAST(N'2023-08-08' AS Date), CAST(N'2004-09-16' AS Date), N'317396', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (23, N'MC-0xd6550c01', CAST(N'2017-07-22' AS Date), CAST(N'2022-07-26' AS Date), CAST(N'2020-07-05' AS Date), N'927780', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (24, N'MC-0xf80947f9', CAST(N'2023-04-24' AS Date), CAST(N'2022-09-25' AS Date), CAST(N'2022-05-08' AS Date), N'397615', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (25, N'MC-0x4450ec5d', CAST(N'2019-10-08' AS Date), CAST(N'2022-03-18' AS Date), CAST(N'2012-01-06' AS Date), N'436217', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (26, N'MC-0xb5a21e4d', CAST(N'2020-04-23' AS Date), CAST(N'2022-04-20' AS Date), CAST(N'2008-07-23' AS Date), N'936403', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (27, N'MC-0x4d4b4021', CAST(N'2020-07-12' AS Date), CAST(N'2024-01-29' AS Date), CAST(N'2021-08-06' AS Date), N'786136', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (28, N'MC-0x603d747f', CAST(N'2023-02-15' AS Date), CAST(N'2022-10-13' AS Date), CAST(N'1997-08-01' AS Date), N'915134', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (29, N'MC-0xcd8263f5', CAST(N'2016-10-12' AS Date), CAST(N'2023-05-12' AS Date), CAST(N'2002-01-30' AS Date), N'125514', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (30, N'MC-0x7996d40a', CAST(N'2021-05-01' AS Date), CAST(N'2022-05-02' AS Date), CAST(N'2003-02-24' AS Date), N'168874', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (31, N'MC-0xb66278d9', CAST(N'2014-06-09' AS Date), CAST(N'2023-05-08' AS Date), CAST(N'1995-03-20' AS Date), N'496835', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (32, N'MC-0x8fb21c00', CAST(N'2021-05-26' AS Date), CAST(N'2023-10-20' AS Date), CAST(N'2012-10-23' AS Date), N'882991', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (33, N'MC-0xa12ca39d', CAST(N'2022-08-22' AS Date), CAST(N'2023-04-15' AS Date), CAST(N'2011-01-07' AS Date), N'984761', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (34, N'MC-0xcde39201', CAST(N'2017-11-14' AS Date), CAST(N'2023-11-21' AS Date), CAST(N'1998-09-06' AS Date), N'835291', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (35, N'MC-0x9d98eac8', CAST(N'2023-08-13' AS Date), CAST(N'2023-02-08' AS Date), CAST(N'2010-09-10' AS Date), N'418362', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (36, N'MC-0x50ecc141', CAST(N'2018-07-20' AS Date), CAST(N'2022-09-27' AS Date), CAST(N'2013-07-24' AS Date), N'348655', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (37, N'MC-0xdd721438', CAST(N'2021-09-21' AS Date), CAST(N'2023-06-09' AS Date), CAST(N'2018-02-23' AS Date), N'842787', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (38, N'MC-0xa1f7aee4', CAST(N'2020-06-23' AS Date), CAST(N'2023-02-05' AS Date), CAST(N'1998-07-06' AS Date), N'595036', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (39, N'MC-0x3448db4e', CAST(N'2019-03-08' AS Date), CAST(N'2023-07-25' AS Date), CAST(N'2004-08-22' AS Date), N'162246', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (40, N'MC-0x3a6c4e1f', CAST(N'2015-12-13' AS Date), CAST(N'2023-12-10' AS Date), CAST(N'2021-01-25' AS Date), N'714014', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (41, N'MC-0x1c7ac1e5', CAST(N'2014-07-16' AS Date), CAST(N'2022-04-30' AS Date), CAST(N'1995-08-13' AS Date), N'833518', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (42, N'MC-0xfbb71455', CAST(N'2019-09-06' AS Date), CAST(N'2022-05-04' AS Date), CAST(N'2015-07-28' AS Date), N'981415', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (43, N'MC-0x72f76db1', CAST(N'2022-02-18' AS Date), CAST(N'2022-11-30' AS Date), CAST(N'2012-01-15' AS Date), N'136563', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (44, N'MC-0x49166414', CAST(N'2017-02-18' AS Date), CAST(N'2022-12-08' AS Date), CAST(N'2001-03-01' AS Date), N'612352', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (45, N'MC-0x39e8cc33', CAST(N'2018-12-27' AS Date), CAST(N'2023-03-03' AS Date), CAST(N'2018-03-25' AS Date), N'648742', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (46, N'MC-0x17e12d95', CAST(N'2021-01-19' AS Date), CAST(N'2022-10-30' AS Date), CAST(N'2017-04-13' AS Date), N'561018', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (47, N'MC-0x3ef2c04d', CAST(N'2020-02-12' AS Date), CAST(N'2023-04-18' AS Date), CAST(N'2016-01-19' AS Date), N'826146', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (48, N'MC-0xf347638c', CAST(N'2020-03-26' AS Date), CAST(N'2023-02-21' AS Date), CAST(N'2013-07-03' AS Date), N'951335', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (49, N'MC-0x601df648', CAST(N'2020-05-02' AS Date), CAST(N'2023-05-24' AS Date), CAST(N'2014-04-13' AS Date), N'889642', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (50, N'MC-0xc168353a', CAST(N'2022-06-10' AS Date), CAST(N'2023-11-29' AS Date), CAST(N'2020-02-02' AS Date), N'974973', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (51, N'MC-0x82f1271a', CAST(N'2018-09-10' AS Date), CAST(N'2024-02-12' AS Date), CAST(N'2001-02-08' AS Date), N'816306', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (52, N'MC-0xe6d02b69', CAST(N'2015-04-27' AS Date), CAST(N'2023-04-16' AS Date), CAST(N'2004-02-28' AS Date), N'365015', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (53, N'MC-0xc0804bc4', CAST(N'2015-06-17' AS Date), CAST(N'2023-11-24' AS Date), CAST(N'2015-06-22' AS Date), N'851906', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (54, N'MC-0x626e4a5c', CAST(N'2020-12-04' AS Date), CAST(N'2022-12-02' AS Date), CAST(N'2005-08-17' AS Date), N'801471', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (55, N'MC-0x7376b811', CAST(N'2019-03-18' AS Date), CAST(N'2022-10-09' AS Date), CAST(N'2013-10-12' AS Date), N'219435', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (56, N'MC-0xe16d38ec', CAST(N'2022-09-06' AS Date), CAST(N'2024-02-06' AS Date), CAST(N'2006-02-11' AS Date), N'129539', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (57, N'MC-0x57531ef2', CAST(N'2020-04-05' AS Date), CAST(N'2022-08-05' AS Date), CAST(N'2006-09-23' AS Date), N'194074', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (58, N'MC-0x3585025b', CAST(N'2016-03-26' AS Date), CAST(N'2023-08-20' AS Date), CAST(N'2022-12-29' AS Date), N'275856', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (59, N'MC-0x478cbda7', CAST(N'2018-03-16' AS Date), CAST(N'2023-04-12' AS Date), CAST(N'2021-06-10' AS Date), N'281703', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (60, N'MC-0x3d09b3b1', CAST(N'2019-04-24' AS Date), CAST(N'2023-08-09' AS Date), CAST(N'2006-06-04' AS Date), N'913825', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (61, N'MC-0xf9bfae31', CAST(N'2019-08-05' AS Date), CAST(N'2023-11-24' AS Date), CAST(N'1995-02-18' AS Date), N'643866', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (62, N'MC-0x6278228c', CAST(N'2021-08-28' AS Date), CAST(N'2023-06-12' AS Date), CAST(N'2021-04-24' AS Date), N'268609', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (63, N'MC-0x2bf98ebf', CAST(N'2015-02-01' AS Date), CAST(N'2022-12-02' AS Date), CAST(N'1998-09-01' AS Date), N'176807', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (64, N'MC-0x1acb30b1', CAST(N'2015-04-20' AS Date), CAST(N'2023-05-02' AS Date), CAST(N'2017-09-07' AS Date), N'601261', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (65, N'MC-0xb3f5cca9', CAST(N'2019-01-15' AS Date), CAST(N'2023-01-26' AS Date), CAST(N'1999-08-10' AS Date), N'946391', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (66, N'MC-0xea986fbc', CAST(N'2021-01-06' AS Date), CAST(N'2023-05-24' AS Date), CAST(N'2011-06-01' AS Date), N'543591', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (67, N'MC-0x6c939f4b', CAST(N'2018-11-04' AS Date), CAST(N'2023-04-12' AS Date), CAST(N'1997-09-14' AS Date), N'384643', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (68, N'MC-0xf531f399', CAST(N'2015-10-10' AS Date), CAST(N'2022-07-09' AS Date), CAST(N'1999-07-08' AS Date), N'604707', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (69, N'MC-0x73aeb735', CAST(N'2016-05-23' AS Date), CAST(N'2023-03-22' AS Date), CAST(N'1994-12-27' AS Date), N'969893', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (70, N'MC-0x26f83167', CAST(N'2016-08-08' AS Date), CAST(N'2023-08-28' AS Date), CAST(N'2007-05-22' AS Date), N'151232', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (71, N'MC-0xb9c1cda8', CAST(N'2014-05-17' AS Date), CAST(N'2024-01-24' AS Date), CAST(N'2000-02-14' AS Date), N'451778', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (72, N'MC-0x56013888', CAST(N'2020-04-05' AS Date), CAST(N'2023-08-20' AS Date), CAST(N'1996-01-03' AS Date), N'596039', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (73, N'MC-0x405c65c3', CAST(N'2017-07-25' AS Date), CAST(N'2022-11-30' AS Date), CAST(N'2019-04-15' AS Date), N'222216', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (74, N'MC-0xa28ed6f2', CAST(N'2018-01-18' AS Date), CAST(N'2022-12-12' AS Date), CAST(N'2018-06-06' AS Date), N'864733', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (75, N'MC-0x0543b0a7', CAST(N'2017-10-05' AS Date), CAST(N'2023-08-30' AS Date), CAST(N'1999-08-21' AS Date), N'771171', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (76, N'MC-0x8e2939bb', CAST(N'2021-11-13' AS Date), CAST(N'2022-05-12' AS Date), CAST(N'2011-07-21' AS Date), N'118607', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (77, N'MC-0x09bf4cfa', CAST(N'2015-06-15' AS Date), CAST(N'2023-03-10' AS Date), CAST(N'2002-05-04' AS Date), N'168347', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (78, N'MC-0x1979fa76', CAST(N'2020-07-29' AS Date), CAST(N'2022-07-30' AS Date), CAST(N'2011-10-31' AS Date), N'931970', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (79, N'MC-0x46e0d792', CAST(N'2015-01-11' AS Date), CAST(N'2023-09-09' AS Date), CAST(N'2017-11-14' AS Date), N'186794', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (80, N'MC-0x5b3d42e0', CAST(N'2022-07-18' AS Date), CAST(N'2024-01-03' AS Date), CAST(N'2009-07-03' AS Date), N'683991', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (81, N'MC-0x22b860a3', CAST(N'2022-02-17' AS Date), CAST(N'2022-08-18' AS Date), CAST(N'2002-10-05' AS Date), N'900608', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (82, N'MC-0xefc6d92e', CAST(N'2020-05-05' AS Date), CAST(N'2023-05-21' AS Date), CAST(N'2017-03-17' AS Date), N'334996', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (83, N'MC-0x7a12e6c3', CAST(N'2015-03-21' AS Date), CAST(N'2023-08-29' AS Date), CAST(N'1997-12-08' AS Date), N'767799', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (84, N'MC-0xb1be9fe9', CAST(N'2014-05-16' AS Date), CAST(N'2023-07-02' AS Date), CAST(N'1996-03-22' AS Date), N'430552', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (85, N'MC-0x6729e94b', CAST(N'2015-03-02' AS Date), CAST(N'2023-03-07' AS Date), CAST(N'2021-03-23' AS Date), N'767036', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (86, N'MC-0xe74d08fa', CAST(N'2023-07-03' AS Date), CAST(N'2024-02-03' AS Date), CAST(N'2004-12-09' AS Date), N'817598', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (87, N'MC-0xd4567a42', CAST(N'2016-11-14' AS Date), CAST(N'2022-09-07' AS Date), CAST(N'2000-06-04' AS Date), N'477109', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (88, N'MC-0x3244f2d4', CAST(N'2014-06-22' AS Date), CAST(N'2024-02-26' AS Date), CAST(N'1994-04-27' AS Date), N'185473', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (89, N'MC-0xb1975445', CAST(N'2015-08-13' AS Date), CAST(N'2023-06-01' AS Date), CAST(N'2002-03-17' AS Date), N'684725', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (90, N'MC-0x4e443f02', CAST(N'2017-04-24' AS Date), CAST(N'2022-05-22' AS Date), CAST(N'2005-10-21' AS Date), N'831784', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (91, N'MC-0x3bae36dd', CAST(N'2021-06-27' AS Date), CAST(N'2023-09-19' AS Date), CAST(N'2003-03-14' AS Date), N'478692', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (92, N'MC-0x0dc7669d', CAST(N'2019-08-06' AS Date), CAST(N'2022-11-25' AS Date), CAST(N'2024-02-05' AS Date), N'190595', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (93, N'MC-0xe900fd6c', CAST(N'2019-07-25' AS Date), CAST(N'2022-07-28' AS Date), CAST(N'2017-12-18' AS Date), N'663282', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (94, N'MC-0x95278e61', CAST(N'2022-05-07' AS Date), CAST(N'2022-07-01' AS Date), CAST(N'2016-07-22' AS Date), N'438419', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (95, N'MC-0x28b45c59', CAST(N'2017-02-13' AS Date), CAST(N'2022-12-31' AS Date), CAST(N'2022-08-21' AS Date), N'657474', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (96, N'MC-0x5dd7cef3', CAST(N'2017-12-05' AS Date), CAST(N'2023-10-23' AS Date), CAST(N'1998-04-27' AS Date), N'158066', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (97, N'MC-0x41493ee0', CAST(N'2020-12-28' AS Date), CAST(N'2022-10-24' AS Date), CAST(N'1999-03-20' AS Date), N'487095', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (98, N'MC-0x127b69e0', CAST(N'2020-12-20' AS Date), CAST(N'2023-01-17' AS Date), CAST(N'2020-05-14' AS Date), N'742029', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (99, N'MC-0x0f44d0cf', CAST(N'2017-03-13' AS Date), CAST(N'2022-10-23' AS Date), CAST(N'2023-12-25' AS Date), N'298216', NULL, NULL)
GO
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (100, N'MC-0x7c5caf4a', CAST(N'2014-03-09' AS Date), CAST(N'2023-04-21' AS Date), CAST(N'2013-05-21' AS Date), N'690505', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (101, N'авыаыв', NULL, NULL, NULL, N'588745', NULL, NULL)
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode], [PathQRCode], [Photo]) VALUES (102, N'123', NULL, NULL, NULL, N'466835', NULL, NULL)
SET IDENTITY_INSERT [dbo].[MedicalCard] OFF
GO
SET IDENTITY_INSERT [dbo].[Passport] ON 

INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (111, N'4802', N'591775')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (112, N'4604', N'434573')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (113, N'4604', N'152722')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (114, N'4506', N'599548')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (115, N'4506', N'217143')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (116, N'4703', N'666251')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (117, N'4703', N'539719')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (118, N'4506', N'583960')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (119, N'4703', N'600526')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (120, N'4506', N'163007')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (121, N'4703', N'948071')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (122, N'4802', N'988970')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (123, N'4802', N'133405')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (124, N'4604', N'488898')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (125, N'4604', N'790482')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (126, N'4802', N'944150')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (127, N'4604', N'309069')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (128, N'4802', N'850782')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (129, N'4703', N'482870')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (130, N'4604', N'720745')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (131, N'4703', N'541049')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (132, N'4604', N'233271')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (133, N'4604', N'611270')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (134, N'4506', N'903056')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (135, N'4506', N'364865')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (136, N'4506', N'890731')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (137, N'4703', N'668078')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (138, N'4506', N'950057')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (139, N'4703', N'339770')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (140, N'4604', N'371943')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (141, N'4802', N'781232')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (142, N'4506', N'345761')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (143, N'4604', N'736869')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (144, N'4604', N'556721')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (145, N'4703', N'292062')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (146, N'4802', N'233485')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (147, N'4506', N'485047')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (148, N'4604', N'137551')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (149, N'4703', N'796627')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (150, N'4703', N'376640')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (151, N'4802', N'435166')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (152, N'4506', N'160878')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (153, N'4703', N'910720')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (154, N'4604', N'707617')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (155, N'4506', N'101699')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (156, N'4506', N'478790')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (157, N'4802', N'225401')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (158, N'4802', N'871033')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (159, N'4604', N'208295')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (160, N'4802', N'758167')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (161, N'4506', N'633619')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (162, N'4604', N'999723')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (163, N'4604', N'118518')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (164, N'4802', N'250065')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (165, N'4506', N'199733')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (166, N'4604', N'865248')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (167, N'4703', N'270022')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (168, N'4604', N'479332')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (169, N'4703', N'212925')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (170, N'4703', N'504970')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (171, N'4604', N'682938')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (172, N'4604', N'586263')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (173, N'4506', N'486609')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (174, N'4506', N'977780')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (175, N'4703', N'639708')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (176, N'4703', N'485719')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (177, N'4802', N'835765')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (178, N'4506', N'409444')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (179, N'4506', N'297389')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (180, N'4703', N'619959')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (181, N'4506', N'258971')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (182, N'4703', N'972051')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (183, N'4703', N'423658')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (184, N'4703', N'766184')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (185, N'4802', N'526913')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (186, N'4604', N'254319')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (187, N'4604', N'412609')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (188, N'4604', N'637776')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (189, N'4506', N'828831')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (190, N'4802', N'112855')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (191, N'4802', N'809769')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (192, N'4703', N'617628')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (193, N'4604', N'970323')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (194, N'4802', N'910071')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (195, N'4506', N'119433')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (196, N'4604', N'386729')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (197, N'4703', N'187323')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (198, N'4604', N'268861')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (199, N'4506', N'512884')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (200, N'4802', N'679497')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (201, N'4703', N'531093')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (202, N'4506', N'151888')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (203, N'4604', N'615987')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (204, N'4802', N'666438')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (205, N'4604', N'518148')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (206, N'4506', N'291240')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (207, N'4506', N'648557')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (208, N'4802', N'413402')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (209, N'4703', N'932652')
GO
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (210, N'4703', N'675332')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (211, N'4602', N'3424')
INSERT [dbo].[Passport] ([ID], [SeriesPassport], [NumberPassport]) VALUES (212, N'123', N'123')
SET IDENTITY_INSERT [dbo].[Passport] OFF
GO
SET IDENTITY_INSERT [dbo].[Patient] ON 

INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (1, NULL, N'Елена', N'Ефремов', N'Максимовна', 111, CAST(N'1997-07-18' AS Date), 3, N'улица Коммунальная, 386, Казань, Камбоджа', N'(976)053-96-53', N'Raisa90@yahoo.com', 1, 11, N'Аллергия', NULL, 17, N'ИП Иванов', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (2, NULL, N'Олег', N'Ковалева', N'Александрова', 112, CAST(N'1965-06-25' AS Date), 4, N'Кооперативная ул., 580, Киров, Бельгия', N'(977)761-14-93', N'Antonida.Anisimov@hotmail.com', 2, 12, N'ОРВИ', NULL, 18, N'ОАО СтройГаз', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (3, NULL, N'Дарья', N'Зиновьева', N'Максимовна', 113, CAST(N'1935-04-04' AS Date), 3, N'Островского ул., 052, Ставрополь, Македония', N'(950)107-71-64', N'Georgii.Doronina88@yandex.ru', 3, 13, N'COVID19', NULL, 11, N'ИП Иванов', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (4, NULL, N'Виталий', N'Никонов', N'Дмитриевна', 114, CAST(N'1965-06-21' AS Date), 4, N'Цветочная пл., 150, Иркутск, Япония', N'(931)693-43-80', N'Elena.Isaeva72@yahoo.com', 4, 14, N'Ангина', NULL, 20, N'ИП Иванов', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (5, NULL, N'Лаврентий', N'Прохоров', N'Александрова', 115, CAST(N'1985-04-27' AS Date), 3, N'Трактовая площадь, 636, Томск, Либерия', N'(956)990-60-07', N'Alina.Sitnikov23@mail.ru', 5, 15, N'ОРВИ', NULL, 20, N'ОАО СтройГаз', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (6, NULL, N'Михаил', N'Симонова', N'Александрова', 116, CAST(N'1929-12-20' AS Date), 3, N'площадь Школьный, 616, Брянск, Бенин', N'(949)918-89-63', N'Zoya.Shukin@mail.ru', 6, 16, N'Аллергия', NULL, 13, N'ОАО СтройГаз', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (7, NULL, N'Варвара', N'Шаров', N'Максимовна', 117, CAST(N'1983-08-21' AS Date), 4, N'Нагорная пл., 746, Саратов, Фиджи', N'(946)804-33-98', N'Makar51@ya.ru', 7, 17, N'COVID19', NULL, 17, N'ИП Иванов', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (8, NULL, N'Антонида', N'Никонова', N'Дмитриевна', 118, CAST(N'1936-01-20' AS Date), 3, N'улица Пролетарская, 406, Красноярск, Япония', N'(939)825-72-38', N'Makar97@ya.ru', 8, 18, N'COVID19', NULL, 15, N'ИП Иванов', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (9, NULL, N'Лидия', N'Белякова', N'Дмитриевна', 119, CAST(N'1955-02-06' AS Date), 3, N'Пионерская ул., 780, Омск, Великобритания', N'(986)002-10-89', N'Valeriya22@mail.ru', 9, 19, N'Аллергия', NULL, 15, N'ОАО СтройГаз', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (10, NULL, N'Вера', N'Воробьев', N'Дмитриевна', 120, CAST(N'1943-05-19' AS Date), 4, N'Майская площадь, 969, Саратов, Того', N'(950)506-61-20', N'Konstantin.Nekrasova@ya.ru', 10, 20, N'ОРВИ', NULL, 17, N'ОАО СтройГаз', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (11, NULL, N'Екатерина', N'Красильников', N'Максимовна', 121, CAST(N'1955-01-15' AS Date), 3, N'пр. Чапаева, 899, Белгород, Соломоновы Острова', N'(930)917-51-29', N'Valentina.Orlov@yahoo.com', 11, 21, N'COVID19', NULL, 19, N'ОАО СтройГаз', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (12, NULL, N'Зинаида', N'Потапов', N'Дмитриевна', 122, CAST(N'1927-07-19' AS Date), 3, N'пл. Клубная, 733, Иркутск, Испания', N'(935)093-84-94', N'Denis_Tretyakova19@gmail.com', 12, 22, N'ОРВИ', NULL, 16, N'ЗАО НаноТех', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (13, NULL, N'Анатолий', N'Герасимова', N'Александрова', 123, CAST(N'1956-06-19' AS Date), 3, N'Южная пл., 750, Санкт-Петербург, Гвиана (не признана)', N'(990)384-28-01', N'Kseniya_Kabanova@hotmail.com', 13, 23, N'Аллергия', NULL, 16, N'ЗАО НаноТех', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (14, NULL, N'Игорь', N'Воронова', N'Максимовна', 124, CAST(N'1966-03-26' AS Date), 4, N'Железнодорожная площадь, 081, Астрахань, Конго', N'(946)359-40-27', N'Artyom_Stepanov84@yandex.ru', 14, 24, N'ОРВИ', NULL, 16, N'ИП Иванов', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (15, NULL, N'Максим', N'Яковлев', N'Максимовна', 125, CAST(N'1974-01-21' AS Date), 4, N'пл. Северная, 906, Ижевск, Тунис', N'(997)453-02-09', N'Elena_Zykov81@yahoo.com', 15, 25, N'Аллергия', NULL, 18, N'ОАО СтройГаз', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (16, NULL, N'Владимир', N'Александров', N'Максимовна', 126, CAST(N'2004-11-12' AS Date), 3, N'Западная пл., 525, Магнитогорск, Джибути', N'(943)184-29-91', N'Alevtina.Orekhova@mail.ru', 16, 26, N'Аллергия', NULL, 13, N'ЗАО НаноТех', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (17, NULL, N'Николай', N'Пахомова', N'Петровна', 127, CAST(N'1982-11-08' AS Date), 4, N'пр. Московская, 950, Оренбург, Румыния', N'(974)853-12-45', N'Klavdiya_Lazareva@gmail.com', 17, 27, N'Ангина', NULL, 11, N'ЗАО НаноТех', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (18, NULL, N'Анжела', N'Исакова', N'Максимовна', 128, CAST(N'1956-06-07' AS Date), 3, N'Садовый проспект, 465, Нижний Новгород, Науру', N'(939)373-12-10', N'Nikolai.Pestov26@ya.ru', 18, 28, N'ОРВИ', NULL, 13, N'ЗАО НаноТех', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (19, NULL, N'Алексей', N'Рыбакова', N'Александрова', 129, CAST(N'1929-10-14' AS Date), 4, N'Сосновая улица, 012, Омск, Восточный Тимор', N'(984)617-65-09', N'Svetlana_Ermakov55@yandex.ru', 19, 29, N'Аллергия', NULL, 19, N'ИП Иванов', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (20, NULL, N'Герман', N'Савельев', N'Дмитриевна', 130, CAST(N'1939-11-15' AS Date), 4, N'ул. Дачная, 410, Ульяновск, Чад', N'(955)297-85-12', N'Roman.Dementev67@gmail.com', 20, 30, N'COVID19', NULL, 15, N'ЗАО НаноТех', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (21, NULL, N'Тамара', N'Горшков', N'Петровна', 131, CAST(N'2000-08-30' AS Date), 3, N'проспект Восточная, 903, Томск, Италия', N'(960)864-11-64', N'Daniil73@yandex.ru', 21, 31, N'Ангина', NULL, 16, N'ЗАО НаноТех', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (22, NULL, N'Ксения', N'Хохлова', N'Александрова', 132, CAST(N'1974-01-23' AS Date), 4, N'Почтовая пр., 703, Томск, Сент-Киттс и Невис', N'(943)203-89-27', N'Vasilisa_Voronov93@ya.ru', 22, 32, N'Аллергия', NULL, 18, N'ЗАО НаноТех', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (23, NULL, N'Валентин', N'Голубев', N'Петровна', 133, CAST(N'1954-05-28' AS Date), 3, N'Центральная площадь, 744, Нижний Новгород, Нидерланды', N'(913)557-95-49', N'Anzhela4@hotmail.com', 23, 33, N'Ангина', NULL, 16, N'ОАО СтройГаз', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (24, NULL, N'Варвара', N'Гуляева', N'Александрова', 134, CAST(N'1980-02-20' AS Date), 4, N'Первомайская проспект, 355, Махачкала, Кирибати', N'(911)334-00-48', N'Lavrentii.Rodionov@ya.ru', 24, 34, N'Аллергия', NULL, 15, N'ЗАО НаноТех', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (25, NULL, N'Максим', N'Михеева', N'Александрова', 135, CAST(N'1997-12-17' AS Date), 3, N'Труда пр., 783, Тольятти, Тувалу', N'(939)772-53-99', N'Tamara_Arkhipova81@yandex.ru', 25, 35, N'COVID19', NULL, 14, N'ОАО СтройГаз', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (26, NULL, N'Аркадий', N'Киселева', N'Александрова', 136, CAST(N'1955-10-05' AS Date), 4, N'проспект 8 Марта, 330, Ростов-на-Дону, Эфиопия', N'(936)403-68-35', N'Konstantin68@yahoo.com', 26, 36, N'ОРВИ', NULL, 18, N'ИП Иванов', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (27, NULL, N'Антонида', N'Некрасов', N'Дмитриевна', 137, CAST(N'1979-04-02' AS Date), 3, N'проспект Красноармейская, 611, Курск, Центральноафриканская Республика', N'(955)455-85-31', N'Leonid.Shiryaeva@gmail.com', 27, 37, N'Ангина', NULL, 18, N'ЗАО НаноТех', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (28, NULL, N'Вероника', N'Тетерин', N'Дмитриевна', 138, CAST(N'2004-11-03' AS Date), 4, N'проспект Свердлова, 899, Рязань, Токелау (не признана)', N'(920)880-02-60', N'Vadim53@hotmail.com', 28, 38, N'Ангина', NULL, 19, N'ИП Иванов', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (29, NULL, N'Вадим', N'Самойлов', N'Александрова', 139, CAST(N'2004-06-02' AS Date), 4, N'пл. Горького, 233, Томск, Германия', N'(906)187-05-94', N'Luka27@yahoo.com', 29, 39, N'ОРВИ', NULL, 11, N'ИП Иванов', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (30, NULL, N'Евгений', N'Николаева', N'Дмитриевна', 140, CAST(N'1943-10-14' AS Date), 3, N'площадь Коммунальная, 865, Владимир, Демократическая Республика', N'(989)638-11-32', N'Kira83@yandex.ru', 30, 40, N'Ангина', NULL, 19, N'ИП Иванов', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (31, NULL, N'Жанна', N'Фадеев', N'Александрова', 141, CAST(N'1994-07-10' AS Date), 4, N'ул. Дачная, 717, Нижний Новгород, Аргентина', N'(927)396-97-74', N'Vitalii_Kuzmin60@gmail.com', 31, 41, N'COVID19', NULL, 11, N'ИП Иванов', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (32, NULL, N'Ульяна', N'Панфилов', N'Максимовна', 142, CAST(N'1965-05-05' AS Date), 3, N'Восточная проспект, 131, Саратов, Мальта', N'(992)941-03-61', N'Roman45@yandex.ru', 32, 42, N'Аллергия', NULL, 18, N'ОАО СтройГаз', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (33, NULL, N'Андрей', N'Ковалева', N'Максимовна', 143, CAST(N'1941-01-23' AS Date), 4, N'Матросова пл., 525, Красноярск, Словакия', N'(968)347-39-66', N'Luka.Terentev70@hotmail.com', 33, 43, N'Ангина', NULL, 17, N'ЗАО НаноТех', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (34, NULL, N'Мария', N'Новикова', N'Петровна', 144, CAST(N'2000-03-11' AS Date), 4, N'Полевая проспект, 959, Саратов, Хорватия', N'(967)800-12-66', N'Svetlana88@yandex.ru', 34, 44, N'ОРВИ', NULL, 13, N'ИП Иванов', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (35, NULL, N'Константин', N'Евдокимов', N'Александрова', 145, CAST(N'1981-12-30' AS Date), 3, N'пл. Центральная, 118, Красноярск, Мали', N'(920)024-93-79', N'Lavrentii.Afanaseva@mail.ru', 35, 45, N'Ангина', NULL, 18, N'ЗАО НаноТех', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (36, NULL, N'Игорь', N'Брагина', N'Александрова', 146, CAST(N'1944-02-27' AS Date), 4, N'Пролетарская проспект, 485, Краснодар, Гватемала', N'(906)608-17-67', N'Egor.Konstantinova85@yahoo.com', 36, 46, N'ОРВИ', NULL, 13, N'ОАО СтройГаз', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (37, NULL, N'Татьяна', N'Николаева', N'Александрова', 147, CAST(N'1958-04-09' AS Date), 3, N'площадь Дружбы, 031, Липецк, Португалия', N'(996)845-00-61', N'Olga_Evseeva@yahoo.com', 37, 47, N'Ангина', NULL, 15, N'ОАО СтройГаз', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (38, NULL, N'Василий', N'Гущина', N'Петровна', 148, CAST(N'1950-12-12' AS Date), 3, N'пр. Южная, 326, Брянск, Бразилия', N'(923)567-53-56', N'Natalya9@hotmail.com', 38, 48, N'ОРВИ', NULL, 15, N'ОАО СтройГаз', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (39, NULL, N'Римма', N'Федотова', N'Александрова', 149, CAST(N'1989-12-20' AS Date), 4, N'пл. Заводская, 438, Ярославль, Джибути', N'(958)106-61-73', N'Tatyana_Timofeeva@mail.ru', 39, 49, N'Ангина', NULL, 14, N'ИП Иванов', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (40, NULL, N'Станислав', N'Волкова', N'Александрова', 150, CAST(N'1939-12-13' AS Date), 3, N'Рабочая ул., 479, Самара, Мозамбик', N'(901)072-81-20', N'Sofiya_Ermakova@yandex.ru', 40, 50, N'ОРВИ', NULL, 17, N'ЗАО НаноТех', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (41, NULL, N'Макар', N'Щукина', N'Александрова', 151, CAST(N'1973-12-23' AS Date), 3, N'ул. Горького, 215, Красноярск, Иордания', N'(906)323-92-58', N'Ilya.Volkova@ya.ru', 41, 51, N'Ангина', NULL, 12, N'ИП Иванов', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (42, NULL, N'Арсений', N'Юдин', N'Дмитриевна', 152, CAST(N'2001-04-30' AS Date), 4, N'Березовая ул., 601, Тюмень, Польша', N'(991)576-09-92', N'Arkadii.Potapova@mail.ru', 42, 52, N'Ангина', NULL, 16, N'ИП Иванов', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (43, NULL, N'Владислав', N'Стрелков', N'Александрова', 153, CAST(N'1973-04-27' AS Date), 3, N'проспект Парковая, 354, Хабаровск, Непал', N'(941)309-33-24', N'Elena0@yahoo.com', 43, 53, N'COVID19', NULL, 16, N'ИП Иванов', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (44, NULL, N'Лаврентий', N'Захарова', N'Александрова', 154, CAST(N'1974-01-28' AS Date), 3, N'Трактовая пл., 756, Казань, Тамил-Илам (не признана)', N'(978)122-17-75', N'Mariya_Mishin65@yandex.ru', 44, 54, N'COVID19', NULL, 13, N'ОАО СтройГаз', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (45, NULL, N'Антонина', N'Зиновьев', N'Максимовна', 155, CAST(N'2003-05-07' AS Date), 4, N'Железнодорожная ул., 687, Брянск, Великобритания', N'(937)039-58-42', N'Denis50@ya.ru', 45, 55, N'Аллергия', NULL, 13, N'ОАО СтройГаз', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (46, NULL, N'Константин', N'Котов', N'Александрова', 156, CAST(N'1999-02-18' AS Date), 4, N'Солнечная ул., 369, Самара, Вьетнам', N'(933)383-57-00', N'Andrei78@yandex.ru', 46, 56, N'COVID19', NULL, 18, N'ЗАО НаноТех', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (47, NULL, N'Герман', N'Ефремова', N'Александрова', 157, CAST(N'1955-08-19' AS Date), 3, N'Совхозная ул., 367, Новосибирск, Германия', N'(925)819-81-02', N'Rimma.Gerasimov0@ya.ru', 47, 57, N'ОРВИ', NULL, 17, N'ОАО СтройГаз', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (48, NULL, N'Степан', N'Абрамов', N'Дмитриевна', 158, CAST(N'1928-10-10' AS Date), 4, N'ул. Горная, 033, Ростов-на-Дону, Финляндия', N'(951)998-25-09', N'Luka26@ya.ru', 48, 58, N'ОРВИ', NULL, 18, N'ОАО СтройГаз', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (49, NULL, N'Алексей', N'Сергеева', N'Максимовна', 159, CAST(N'1961-01-03' AS Date), 3, N'Дачная улица, 336, Липецк, Гана', N'(975)225-93-72', N'Andrei13@yandex.ru', 49, 59, N'Ангина', NULL, 18, N'ОАО СтройГаз', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (50, NULL, N'Макар', N'Филиппов', N'Максимовна', 160, CAST(N'1980-02-06' AS Date), 4, N'пр. Весенняя, 725, Белгород, Кот-д''Ивуар', N'(943)569-30-25', N'Oleg_Grigorev18@mail.ru', 50, 60, N'ОРВИ', NULL, 14, N'ЗАО НаноТех', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (51, NULL, N'Тамара', N'Устинов', N'Александрова', 161, CAST(N'1952-12-28' AS Date), 4, N'проспект Советская, 617, Иркутск, Доминика', N'(915)675-08-85', N'Marina.Filatov75@mail.ru', 51, 61, N'ОРВИ', NULL, 11, N'ИП Иванов', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (52, NULL, N'Марина', N'Тимофеев', N'Дмитриевна', 162, CAST(N'1961-08-30' AS Date), 3, N'Цветочная пл., 428, Ростов-на-Дону, Габон', N'(906)828-33-97', N'Fyodor23@gmail.com', 52, 62, N'Ангина', NULL, 20, N'ЗАО НаноТех', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (53, NULL, N'Антонина', N'Беляева', N'Александрова', 163, CAST(N'1974-09-15' AS Date), 4, N'ул. Московская, 188, Иваново, Антильские Острова (не признана)', N'(951)360-01-45', N'Grigorii.Evseev@yandex.ru', 53, 63, N'COVID19', NULL, 18, N'ИП Иванов', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (54, NULL, N'Раиса', N'Одинцов', N'Дмитриевна', 164, CAST(N'1992-05-03' AS Date), 4, N'пр. Березовая, 903, Оренбург, Кирибати', N'(984)868-81-50', N'Varvara.Seliverstov17@mail.ru', 54, 64, N'COVID19', NULL, 11, N'ИП Иванов', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (55, NULL, N'Регина', N'Уварова', N'Петровна', 165, CAST(N'1933-12-16' AS Date), 4, N'пр. Юбилейная, 657, Брянск, Кот-д''Ивуар', N'(973)012-13-10', N'Anzhela57@gmail.com', 55, 65, N'COVID19', NULL, 20, N'ИП Иванов', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (56, NULL, N'Виктор', N'Казакова', N'Петровна', 166, CAST(N'1969-12-02' AS Date), 4, N'Калинина улица, 775, Новокузнецк, Турция', N'(992)230-45-08', N'Fyodor.Kolobov@ya.ru', 56, 66, N'COVID19', NULL, 14, N'ОАО СтройГаз', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (57, NULL, N'Анастасия', N'Фомичев', N'Максимовна', 167, CAST(N'1950-12-27' AS Date), 4, N'Коммунистическая проспект, 527, Нижний Новгород, Ирак', N'(923)752-24-90', N'Evgeniya.Frolova96@ya.ru', 57, 67, N'Аллергия', NULL, 15, N'ЗАО НаноТех', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (58, NULL, N'Валерия', N'Мартынов', N'Александрова', 168, CAST(N'1949-09-25' AS Date), 4, N'площадь Полевая, 105, Магнитогорск, Иордания', N'(956)871-92-28', N'Nina39@gmail.com', 58, 68, N'Аллергия', NULL, 15, N'ЗАО НаноТех', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (59, NULL, N'Василий', N'Дроздова', N'Дмитриевна', 169, CAST(N'1975-12-11' AS Date), 3, N'Южная ул., 665, Томск, Ботсвана', N'(998)042-14-76', N'Artyom.Seliverstova@ya.ru', 59, 69, N'Ангина', NULL, 18, N'ЗАО НаноТех', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (60, NULL, N'Алёна', N'Козлов', N'Дмитриевна', 170, CAST(N'1985-12-25' AS Date), 3, N'пр. Победы, 016, Оренбург, Замбия', N'(941)165-49-56', N'Matvei_Arkhipova@ya.ru', 60, 70, N'COVID19', NULL, 11, N'ЗАО НаноТех', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (61, NULL, N'Вадим', N'Новиков', N'Дмитриевна', 171, CAST(N'1987-08-08' AS Date), 3, N'Мичурина ул., 163, Чебоксары, Мали', N'(901)144-07-45', N'Konstantin.Bogdanov@hotmail.com', 61, 71, N'Ангина', NULL, 16, N'ОАО СтройГаз', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (62, NULL, N'Константин', N'Смирнов', N'Петровна', 172, CAST(N'1998-08-27' AS Date), 4, N'Клубная проспект, 583, Чебоксары, Боливия', N'(958)171-93-90', N'Ulyana.Sharov92@yandex.ru', 62, 72, N'COVID19', NULL, 15, N'ИП Иванов', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (63, NULL, N'Евгений', N'Кабанова', N'Александрова', 173, CAST(N'2004-07-16' AS Date), 3, N'Ломоносова улица, 311, Чебоксары, Нидерланды', N'(958)465-13-34', N'Kseniya34@yahoo.com', 63, 73, N'COVID19', NULL, 13, N'ЗАО НаноТех', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (64, NULL, N'Степан', N'Попов', N'Александрова', 174, CAST(N'1956-12-10' AS Date), 4, N'Железнодорожная пр., 566, Брянск, Азербайджан', N'(964)756-43-17', N'Boris.Belozerov20@yahoo.com', 64, 74, N'ОРВИ', NULL, 15, N'ЗАО НаноТех', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (65, NULL, N'Наталья', N'Устинов', N'Александрова', 175, CAST(N'1997-12-25' AS Date), 4, N'площадь 8 Марта, 685, Сочи, Палау', N'(976)848-22-98', N'Vladimir63@hotmail.com', 65, 75, N'ОРВИ', NULL, 13, N'ЗАО НаноТех', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (66, NULL, N'Антон', N'Лыткин', N'Максимовна', 176, CAST(N'1988-04-12' AS Date), 3, N'Строителей проспект, 526, Челябинск, Корея (Северная)', N'(966)095-41-10', N'Oleg.Vlasova@yahoo.com', 66, 76, N'ОРВИ', NULL, 18, N'ИП Иванов', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (67, NULL, N'Евгения', N'Соболева', N'Петровна', 177, CAST(N'1929-11-12' AS Date), 3, N'улица Кооперативная, 039, Владимир, Румыния', N'(918)859-12-51', N'Alina55@gmail.com', 67, 77, N'Аллергия', NULL, 20, N'ИП Иванов', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (68, NULL, N'Вера', N'Гордеев', N'Дмитриевна', 178, CAST(N'1933-11-25' AS Date), 3, N'Механизаторов проспект, 578, Уфа, Никарагуа', N'(942)621-70-70', N'Alla99@mail.ru', 68, 78, N'ОРВИ', NULL, 18, N'ЗАО НаноТех', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (69, NULL, N'Любовь', N'Силин', N'Максимовна', 179, CAST(N'1972-06-29' AS Date), 4, N'Больничная ул., 151, Хабаровск, Исландия', N'(912)266-30-56', N'Valeriya38@hotmail.com', 69, 79, N'ОРВИ', NULL, 19, N'ЗАО НаноТех', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (70, NULL, N'Игнатий', N'Моисеева', N'Максимовна', 180, CAST(N'1987-03-13' AS Date), 4, N'Первомайская пр., 006, Тула, Кука острова', N'(940)794-09-20', N'Anfisa47@yahoo.com', 70, 80, N'ОРВИ', NULL, 13, N'ОАО СтройГаз', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (71, NULL, N'Анжела', N'Суворова', N'Александрова', 181, CAST(N'1932-12-23' AS Date), 4, N'Садовая пр., 516, Иваново, Тамил-Илам (не признана)', N'(900)335-34-53', N'Dmitrii_Kuznecova5@yahoo.com', 71, 81, N'COVID19', NULL, 16, N'ОАО СтройГаз', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (72, NULL, N'Тамара', N'Сорокин', N'Дмитриевна', 182, CAST(N'1963-06-21' AS Date), 4, N'Дружбы пр., 648, Самара, Уругвай', N'(991)114-40-28', N'Konstantin_Ignatov@hotmail.com', 72, 82, N'Аллергия', NULL, 11, N'ОАО СтройГаз', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (73, NULL, N'Евгений', N'Куликова', N'Петровна', 183, CAST(N'1939-08-13' AS Date), 3, N'Рабочая ул., 617, Ульяновск, Гвиана (не признана)', N'(938)585-54-81', N'Vadim.Tarasova21@yahoo.com', 73, 83, N'COVID19', NULL, 19, N'ЗАО НаноТех', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (74, NULL, N'Антонина', N'Алексеева', N'Петровна', 184, CAST(N'1949-11-09' AS Date), 4, N'Некрасова ул., 749, Ижевск, Экваториальная Гвинея', N'(962)769-89-55', N'Alina.Chernova45@yahoo.com', 74, 84, N'COVID19', NULL, 18, N'ИП Иванов', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (75, NULL, N'Алина', N'Куликов', N'Петровна', 185, CAST(N'1938-06-09' AS Date), 4, N'Пушкина пр., 254, Рязань, Чехия', N'(957)159-09-85', N'Sofiya25@yandex.ru', 75, 85, N'Аллергия', NULL, 19, N'ОАО СтройГаз', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (76, NULL, N'Илья', N'Петров', N'Дмитриевна', 186, CAST(N'1963-10-11' AS Date), 3, N'площадь Свободы, 083, Томск, Уганда', N'(934)114-98-30', N'Anzhela87@yandex.ru', 76, 86, N'ОРВИ', NULL, 12, N'ЗАО НаноТех', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (77, NULL, N'Мария', N'Зуев', N'Дмитриевна', 187, CAST(N'1955-03-04' AS Date), 4, N'Крупской проспект, 184, Липецк, Исландия', N'(941)380-97-89', N'Gennadii11@yandex.ru', 77, 87, N'Ангина', NULL, 13, N'ИП Иванов', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (78, NULL, N'Арина', N'Денисова', N'Максимовна', 188, CAST(N'1987-02-16' AS Date), 4, N'пл. Горная, 566, Хабаровск, Черногория', N'(948)892-17-84', N'Evgenii95@ya.ru', 78, 88, N'Аллергия', NULL, 13, N'ОАО СтройГаз', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (79, NULL, N'Светлана', N'Баранова', N'Дмитриевна', 189, CAST(N'1972-11-20' AS Date), 3, N'улица Заводская, 255, Магнитогорск, Монако', N'(921)883-97-88', N'Ignatii73@gmail.com', 79, 89, N'COVID19', NULL, 18, N'ОАО СтройГаз', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (80, NULL, N'Зоя', N'Карпова', N'Петровна', 190, CAST(N'1936-08-19' AS Date), 4, N'Победы пл., 324, Тюмень, Никарагуа', N'(978)707-45-75', N'Egor87@hotmail.com', 80, 90, N'Аллергия', NULL, 12, N'ОАО СтройГаз', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (81, NULL, N'Сергей', N'Романова', N'Петровна', 191, CAST(N'1939-07-01' AS Date), 3, N'Восточная площадь, 863, Самара, Мальта', N'(904)108-80-64', N'Varvara_Bobylev31@mail.ru', 81, 91, N'Ангина', NULL, 14, N'ОАО СтройГаз', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (82, NULL, N'Аркадий', N'Кабанова', N'Максимовна', 192, CAST(N'1989-04-03' AS Date), 3, N'40 лет Победы площадь, 611, Белгород, Норвегия', N'(928)165-04-93', N'Viktoriya78@mail.ru', 82, 92, N'Ангина', NULL, 20, N'ОАО СтройГаз', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (83, NULL, N'Антон', N'Зуева', N'Максимовна', 193, CAST(N'1991-08-30' AS Date), 3, N'Весенняя площадь, 392, Ярославль, Бразилия', N'(907)504-14-25', N'Nina.Martynov95@yahoo.com', 83, 93, N'COVID19', NULL, 17, N'ЗАО НаноТех', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (84, NULL, N'Алевтина', N'Дементьева', N'Александрова', 194, CAST(N'1954-04-26' AS Date), 3, N'ул. Весенняя, 737, Оренбург, Соломоновы Острова', N'(947)026-70-65', N'Leonid92@mail.ru', 84, 94, N'COVID19', NULL, 17, N'ОАО СтройГаз', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (85, NULL, N'Василиса', N'Щербаков', N'Максимовна', 195, CAST(N'1926-04-25' AS Date), 4, N'улица Заводская, 972, Омск, Венесуэла', N'(924)512-75-76', N'Natalya77@gmail.com', 85, 95, N'Ангина', NULL, 16, N'ЗАО НаноТех', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (86, NULL, N'Фёдор', N'Овчинникова', N'Дмитриевна', 196, CAST(N'1960-02-27' AS Date), 4, N'Колхозная улица, 598, Хабаровск, Шри-Ланка', N'(904)804-04-02', N'Oksana23@yandex.ru', 86, 96, N'COVID19', NULL, 19, N'ИП Иванов', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (87, NULL, N'Антонина', N'Зимина', N'Дмитриевна', 197, CAST(N'2005-03-29' AS Date), 3, N'пл. Луговая, 124, Ростов-на-Дону, Кука острова', N'(914)191-90-83', N'Maksim_Gavrilov@gmail.com', 87, 97, N'COVID19', NULL, 17, N'ИП Иванов', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (88, NULL, N'Анфиса', N'Громова', N'Максимовна', 198, CAST(N'1977-04-09' AS Date), 3, N'площадь Озерная, 445, Уфа, Словения', N'(998)754-42-52', N'Anton_Golubeva2@yandex.ru', 88, 98, N'ОРВИ', NULL, 19, N'ИП Иванов', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (89, NULL, N'Артём', N'Никитина', N'Петровна', 199, CAST(N'1966-07-27' AS Date), 3, N'пл. Луговая, 131, Казань, Филиппины', N'(927)270-91-27', N'Gennadii73@yahoo.com', 89, 99, N'ОРВИ', NULL, 17, N'ИП Иванов', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (90, NULL, N'Зоя', N'Силина', N'Максимовна', 200, CAST(N'1977-12-23' AS Date), 4, N'ул. Подгорная, 041, Белгород, Саудовская Аравия', N'(971)440-98-86', N'Yurii_Maksimova22@mail.ru', 90, 100, N'ОРВИ', NULL, 13, N'ИП Иванов', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (91, NULL, N'Андрей', N'Макарова', N'Максимовна', 201, CAST(N'1953-02-05' AS Date), 3, N'ул. Набережная, 537, Волгоград, Вьетнам', N'(943)296-42-85', N'Leonid96@ya.ru', 91, 101, N'Аллергия', NULL, 16, N'ИП Иванов', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (92, NULL, N'Игнатий', N'Устинов', N'Александрова', 202, CAST(N'1932-02-12' AS Date), 4, N'Мичурина площадь, 294, Омск, Панама', N'(997)870-88-15', N'Andrei80@yahoo.com', 92, 102, N'Ангина', NULL, 18, N'ИП Иванов', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (93, NULL, N'Алевтина', N'Кулагин', N'Максимовна', 203, CAST(N'1988-11-29' AS Date), 3, N'Строительная пл., 219, Екатеринбург, Сенегал', N'(982)162-83-37', N'Egor65@yandex.ru', 93, 103, N'Аллергия', NULL, 17, N'ОАО СтройГаз', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (94, NULL, N'Клавдия', N'Архипов', N'Петровна', 204, CAST(N'1976-12-22' AS Date), 4, N'ул. Заречная, 013, Москва, Кука острова', N'(965)788-18-35', N'Makar13@yandex.ru', 94, 104, N'Ангина', NULL, 14, N'ЗАО НаноТех', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (95, NULL, N'Виктор', N'Мартынов', N'Максимовна', 205, CAST(N'1959-11-18' AS Date), 3, N'проспект Фрунзе, 683, Краснодар, Монголия', N'(985)726-40-37', N'Aleksei73@mail.ru', 95, 105, N'Аллергия', NULL, 19, N'ИП Иванов', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (96, NULL, N'Кира', N'Сазонов', N'Максимовна', 206, CAST(N'1964-06-14' AS Date), 4, N'Озерная проспект, 860, Астрахань, Андорра', N'(991)677-76-69', N'Olga_Ryabova@yahoo.com', 96, 106, N'Ангина', NULL, 20, N'ОАО СтройГаз', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (97, NULL, N'Анфиса', N'Корнилов', N'Дмитриевна', 207, CAST(N'1981-03-09' AS Date), 4, N'Дорожная ул., 698, Хабаровск, Испания', N'(951)769-77-75', N'Viktor53@gmail.com', 97, 107, N'Ангина', NULL, 13, N'ЗАО НаноТех', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (98, NULL, N'Егор', N'Никонов', N'Петровна', 208, CAST(N'1991-06-05' AS Date), 4, N'пл. Дружбы, 406, Челябинск, Фиджи', N'(929)952-57-13', N'Aleksei_Sharov32@yahoo.com', 98, 108, N'ОРВИ', NULL, 17, N'ИП Иванов', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (99, NULL, N'Юрий', N'Орехов', N'Дмитриевна', 209, CAST(N'1942-11-18' AS Date), 4, N'улица Новая, 082, Астрахань, Коморские Острова', N'(934)045-94-64', N'Matvei_Ignatov@hotmail.com', 99, 109, N'COVID19', NULL, 16, N'ИП Иванов', NULL, NULL)
GO
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (100, NULL, N'Зоя', N'Крюков', N'Максимовна', 210, CAST(N'1951-08-08' AS Date), 4, N'Комарова проспект, 553, Омск, Дания', N'(927)239-01-12', N'Egor9@gmail.com', 100, 110, N'Ангина', NULL, 18, N'ЗАО НаноТех', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (101, NULL, N'тест', N'Тестов', N'Тестович', 211, NULL, NULL, NULL, NULL, NULL, 101, 111, NULL, NULL, 21, N'Кизлря', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [Patronymic], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (102, NULL, N'123', N'123', N'123', 212, NULL, NULL, NULL, NULL, NULL, 102, 112, NULL, NULL, 22, N'123', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Patient] OFF
GO
SET IDENTITY_INSERT [dbo].[Speciality] ON 

INSERT [dbo].[Speciality] ([ID], [Title]) VALUES (1, N'Хирург')
INSERT [dbo].[Speciality] ([ID], [Title]) VALUES (2, N'Врач')
SET IDENTITY_INSERT [dbo].[Speciality] OFF
GO
SET IDENTITY_INSERT [dbo].[TypeHospitalization] ON 

INSERT [dbo].[TypeHospitalization] ([ID], [Title]) VALUES (1, N'Бюджет')
INSERT [dbo].[TypeHospitalization] ([ID], [Title]) VALUES (2, N'Платно')
SET IDENTITY_INSERT [dbo].[TypeHospitalization] OFF
GO
ALTER TABLE [dbo].[CodeHospitalization]  WITH CHECK ADD  CONSTRAINT [FK_CodeHospitalization_TypeHospitalization] FOREIGN KEY([IDTypeHospitalization])
REFERENCES [dbo].[TypeHospitalization] ([ID])
GO
ALTER TABLE [dbo].[CodeHospitalization] CHECK CONSTRAINT [FK_CodeHospitalization_TypeHospitalization]
GO
ALTER TABLE [dbo].[Doctor]  WITH CHECK ADD  CONSTRAINT [FK_Doctor_Gender] FOREIGN KEY([IDGender])
REFERENCES [dbo].[Gender] ([ID])
GO
ALTER TABLE [dbo].[Doctor] CHECK CONSTRAINT [FK_Doctor_Gender]
GO
ALTER TABLE [dbo].[Doctor]  WITH CHECK ADD  CONSTRAINT [FK_Doctor_Role] FOREIGN KEY([IDRole])
REFERENCES [dbo].[Role] ([ID])
GO
ALTER TABLE [dbo].[Doctor] CHECK CONSTRAINT [FK_Doctor_Role]
GO
ALTER TABLE [dbo].[Doctor]  WITH CHECK ADD  CONSTRAINT [FK_Doctor_Speciality] FOREIGN KEY([IDSpeciality])
REFERENCES [dbo].[Speciality] ([ID])
GO
ALTER TABLE [dbo].[Doctor] CHECK CONSTRAINT [FK_Doctor_Speciality]
GO
ALTER TABLE [dbo].[Hospitalization]  WITH CHECK ADD  CONSTRAINT [FK_Hospitalization_CodeHospitalization] FOREIGN KEY([IDCodeHospitalization])
REFERENCES [dbo].[CodeHospitalization] ([ID])
GO
ALTER TABLE [dbo].[Hospitalization] CHECK CONSTRAINT [FK_Hospitalization_CodeHospitalization]
GO
ALTER TABLE [dbo].[Hospitalization]  WITH CHECK ADD  CONSTRAINT [FK_Hospitalization_Patient] FOREIGN KEY([IDPatient])
REFERENCES [dbo].[Patient] ([ID])
GO
ALTER TABLE [dbo].[Hospitalization] CHECK CONSTRAINT [FK_Hospitalization_Patient]
GO
ALTER TABLE [dbo].[Patient]  WITH CHECK ADD  CONSTRAINT [FK_Patient_DiseaseHistory] FOREIGN KEY([IDDiseaseHistory])
REFERENCES [dbo].[DiseaseHistory] ([ID])
GO
ALTER TABLE [dbo].[Patient] CHECK CONSTRAINT [FK_Patient_DiseaseHistory]
GO
ALTER TABLE [dbo].[Patient]  WITH CHECK ADD  CONSTRAINT [FK_Patient_Gender] FOREIGN KEY([IDGender])
REFERENCES [dbo].[Gender] ([ID])
GO
ALTER TABLE [dbo].[Patient] CHECK CONSTRAINT [FK_Patient_Gender]
GO
ALTER TABLE [dbo].[Patient]  WITH CHECK ADD  CONSTRAINT [FK_Patient_InsuranseCompany] FOREIGN KEY([IDInsuranseCompany])
REFERENCES [dbo].[InsuranseCompany] ([ID])
GO
ALTER TABLE [dbo].[Patient] CHECK CONSTRAINT [FK_Patient_InsuranseCompany]
GO
ALTER TABLE [dbo].[Patient]  WITH CHECK ADD  CONSTRAINT [FK_Patient_InsuransePolicy] FOREIGN KEY([IDInsuransePolicy])
REFERENCES [dbo].[InsuransePolicy] ([ID])
GO
ALTER TABLE [dbo].[Patient] CHECK CONSTRAINT [FK_Patient_InsuransePolicy]
GO
ALTER TABLE [dbo].[Patient]  WITH CHECK ADD  CONSTRAINT [FK_Patient_MedicalCard] FOREIGN KEY([IDMedicalCard])
REFERENCES [dbo].[MedicalCard] ([ID])
GO
ALTER TABLE [dbo].[Patient] CHECK CONSTRAINT [FK_Patient_MedicalCard]
GO
ALTER TABLE [dbo].[Patient]  WITH CHECK ADD  CONSTRAINT [FK_Patient_Passport] FOREIGN KEY([IDPassport])
REFERENCES [dbo].[Passport] ([ID])
GO
ALTER TABLE [dbo].[Patient] CHECK CONSTRAINT [FK_Patient_Passport]
GO
ALTER TABLE [dbo].[Prescription]  WITH CHECK ADD  CONSTRAINT [FK_Prescription_MedicalCard] FOREIGN KEY([IDMedicalCard])
REFERENCES [dbo].[MedicalCard] ([ID])
GO
ALTER TABLE [dbo].[Prescription] CHECK CONSTRAINT [FK_Prescription_MedicalCard]
GO
ALTER TABLE [dbo].[Referrals]  WITH CHECK ADD  CONSTRAINT [FK_Referrals_Doctor] FOREIGN KEY([IDDoctor])
REFERENCES [dbo].[Doctor] ([ID])
GO
ALTER TABLE [dbo].[Referrals] CHECK CONSTRAINT [FK_Referrals_Doctor]
GO
ALTER TABLE [dbo].[Referrals]  WITH CHECK ADD  CONSTRAINT [FK_Referrals_MedicalCard] FOREIGN KEY([IDMedicalCard])
REFERENCES [dbo].[MedicalCard] ([ID])
GO
ALTER TABLE [dbo].[Referrals] CHECK CONSTRAINT [FK_Referrals_MedicalCard]
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD  CONSTRAINT [FK_Room_RoomStatus] FOREIGN KEY([IDRoomStatus])
REFERENCES [dbo].[RoomStatus] ([ID])
GO
ALTER TABLE [dbo].[Room] CHECK CONSTRAINT [FK_Room_RoomStatus]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_Doctor] FOREIGN KEY([IDDoctor])
REFERENCES [dbo].[Doctor] ([ID])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_Schedule_Doctor]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_Event] FOREIGN KEY([IDEvent])
REFERENCES [dbo].[Event] ([ID])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_Schedule_Event]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_Room] FOREIGN KEY([IDRoom])
REFERENCES [dbo].[Room] ([ID])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_Schedule_Room]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_TypicalDay] FOREIGN KEY([IDTypicalDay])
REFERENCES [dbo].[TypicalDay] ([ID])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_Schedule_TypicalDay]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_WorkDayType] FOREIGN KEY([IDWorkDayType])
REFERENCES [dbo].[WorkDayType] ([ID])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_Schedule_WorkDayType]
GO
ALTER TABLE [dbo].[TherapeuticDiagnosticMeasures]  WITH CHECK ADD  CONSTRAINT [FK_TherapeuticDiagnosticMeasures_Doctor] FOREIGN KEY([IDDoctor])
REFERENCES [dbo].[Doctor] ([ID])
GO
ALTER TABLE [dbo].[TherapeuticDiagnosticMeasures] CHECK CONSTRAINT [FK_TherapeuticDiagnosticMeasures_Doctor]
GO
ALTER TABLE [dbo].[TherapeuticDiagnosticMeasures]  WITH CHECK ADD  CONSTRAINT [FK_TherapeuticDiagnosticMeasures_Patient] FOREIGN KEY([IDPatient])
REFERENCES [dbo].[Patient] ([ID])
GO
ALTER TABLE [dbo].[TherapeuticDiagnosticMeasures] CHECK CONSTRAINT [FK_TherapeuticDiagnosticMeasures_Patient]
GO
ALTER TABLE [dbo].[TherapeuticDiagnosticMeasures]  WITH CHECK ADD  CONSTRAINT [FK_TherapeuticDiagnosticMeasures_ResultEvent] FOREIGN KEY([IDResultEvent])
REFERENCES [dbo].[ResultEvent] ([ID])
GO
ALTER TABLE [dbo].[TherapeuticDiagnosticMeasures] CHECK CONSTRAINT [FK_TherapeuticDiagnosticMeasures_ResultEvent]
GO
ALTER TABLE [dbo].[TherapeuticDiagnosticMeasures]  WITH CHECK ADD  CONSTRAINT [FK_TherapeuticDiagnosticMeasures_TypeEvent] FOREIGN KEY([IDTypeEvent])
REFERENCES [dbo].[TypeEvent] ([ID])
GO
ALTER TABLE [dbo].[TherapeuticDiagnosticMeasures] CHECK CONSTRAINT [FK_TherapeuticDiagnosticMeasures_TypeEvent]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([IDRole])
REFERENCES [dbo].[Role] ([ID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Speciality] FOREIGN KEY([IDSpeciality])
REFERENCES [dbo].[Speciality] ([ID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Speciality]
GO
USE [master]
GO
ALTER DATABASE [dbHospital] SET  READ_WRITE 
GO
