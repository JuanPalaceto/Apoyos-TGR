USE [master]
GO
/****** Object:  Database [SistemaApoyosTGR]    Script Date: 18/07/2022 01:26:03 a. m. ******/
CREATE DATABASE [SistemaApoyosTGR]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SistemaApoyosTGR', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\SistemaApoyosTGR.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SistemaApoyosTGR_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\SistemaApoyosTGR_log.ldf' , SIZE = 13632KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SistemaApoyosTGR] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SistemaApoyosTGR].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SistemaApoyosTGR] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SistemaApoyosTGR] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SistemaApoyosTGR] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SistemaApoyosTGR] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SistemaApoyosTGR] SET ARITHABORT OFF 
GO
ALTER DATABASE [SistemaApoyosTGR] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SistemaApoyosTGR] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SistemaApoyosTGR] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SistemaApoyosTGR] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SistemaApoyosTGR] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SistemaApoyosTGR] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SistemaApoyosTGR] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SistemaApoyosTGR] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SistemaApoyosTGR] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SistemaApoyosTGR] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SistemaApoyosTGR] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SistemaApoyosTGR] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SistemaApoyosTGR] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SistemaApoyosTGR] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SistemaApoyosTGR] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SistemaApoyosTGR] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SistemaApoyosTGR] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SistemaApoyosTGR] SET RECOVERY FULL 
GO
ALTER DATABASE [SistemaApoyosTGR] SET  MULTI_USER 
GO
ALTER DATABASE [SistemaApoyosTGR] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SistemaApoyosTGR] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SistemaApoyosTGR] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SistemaApoyosTGR] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [SistemaApoyosTGR] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'SistemaApoyosTGR', N'ON'
GO
USE [SistemaApoyosTGR]
GO
/****** Object:  Table [dbo].[Agenda]    Script Date: 18/07/2022 01:26:03 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Agenda](
	[id_Contacto] [int] IDENTITY(1,1) NOT NULL,
	[ApellidoPaterno] [nvarchar](50) NULL,
	[ApellidoMaterno] [nvarchar](50) NULL,
	[Nombre] [nvarchar](50) NULL,
	[Cumpleanos] [date] NULL,
	[Direccion] [nvarchar](50) NULL,
	[Telefono] [nchar](10) NULL,
	[Sector] [nvarchar](50) NULL,
	[Seccion] [nvarchar](50) NULL,
	[Asociacion] [nvarchar](50) NULL,
 CONSTRAINT [PK_Agenda] PRIMARY KEY CLUSTERED 
(
	[id_Contacto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Personas]    Script Date: 18/07/2022 01:26:03 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Personas](
	[id_Persona] [int] IDENTITY(1,1) NOT NULL,
	[ApellidoPaterno] [nvarchar](50) NULL,
	[ApellidoMaterno] [nvarchar](50) NULL,
	[Nombre] [nvarchar](50) NULL,
	[Cumpleanos] [date] NULL,
	[CURP] [char](18) NULL,
	[ClaveEl] [char](18) NULL,
	[Seccion] [nvarchar](50) NULL,
	[Direccion] [nvarchar](50) NULL,
	[CP] [nchar](5) NULL,
	[Estatus] [bit] NULL,
 CONSTRAINT [PK_Personas] PRIMARY KEY CLUSTERED 
(
	[id_Persona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Solicitudes]    Script Date: 18/07/2022 01:26:03 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Solicitudes](
	[id_Solicitud] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [date] NULL,
	[NumPersonas] [int] NULL,
	[TipoApoyo] [nvarchar](50) NULL,
	[Gestion] [nvarchar](50) NULL,
	[MontoSolicitado] [decimal](18, 2) NULL,
	[MontoProporcionado] [decimal](18, 2) NULL,
	[Estatus] [bit] NULL,
	[Observaciones] [nvarchar](500) NULL,
	[id_Solicitante] [int] NULL,
	[id_Beneficiario] [int] NULL,
 CONSTRAINT [PK_Solicitudes] PRIMARY KEY CLUSTERED 
(
	[id_Solicitud] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 18/07/2022 01:26:03 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuarios](
	[id_Usuario] [int] IDENTITY(1,1) NOT NULL,
	[Usuario] [nvarchar](50) NULL,
	[Nombre] [nvarchar](50) NULL,
	[Contrasena] [binary](64) NULL,
	[salt] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[id_Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Agenda] ON 

INSERT [dbo].[Agenda] ([id_Contacto], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [Direccion], [Telefono], [Sector], [Seccion], [Asociacion]) VALUES (1, N'Palaceto', N'Palaceto', N'Juan Paablo', CAST(N'1999-02-23' AS Date), N'Leopoldo Bello López 158', N'8342467065', N'Sector 1', N'Calle 14', N'Ninguna')
INSERT [dbo].[Agenda] ([id_Contacto], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [Direccion], [Telefono], [Sector], [Seccion], [Asociacion]) VALUES (2, N'Rivera', N'Diaz', N'Eduardo', CAST(N'1999-01-01' AS Date), N'Calle 1', N'8340111000', N'Sector 1', N'Calle 14', N'Fútbol')
SET IDENTITY_INSERT [dbo].[Agenda] OFF
SET IDENTITY_INSERT [dbo].[Personas] ON 

INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (12, N'Palaceto', N'Céspedes', N'Juan', CAST(N'1999-12-23' AS Date), N'PACJ990223HTSLSN03', N'PACJ990223HTSLSN03', N'Calle 14', N'Leopoldo Bello López', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (13, N'Palaceto', N'Céspedes', N'Juan', CAST(N'1999-02-23' AS Date), N'PACJ990223HTSLSN03', N'PACJ990223HTSLSN03', N'Calle 14', N'Leopoldo Bello López 158', N'87078', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (15, N'Palaceto', N'Céspedes', N'Juan', CAST(N'1999-02-23' AS Date), N'PACJ990223HTSLSN03', N'PACJ990223HTSLSN03', N'Calle 14', N'Leopoldo Bello López 158', N'87078', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (17, N'Palaceto', N'Céspedes', N'Juan', CAST(N'1999-02-23' AS Date), N'PACJ990223HTSLSN03', N'PACJ990223HTSLSN03', N'Calle 14', N'Leopoldo Bello López 158', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (18, N'Palaceto', N'Céspedes', N'Juan', CAST(N'2251-02-23' AS Date), N'PACJ990223HTSLSN03', N'PACJ990223HTSLSN03', N'Calle 14', N'Leopoldo Bello López', N'87078', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (19, N'Palaceto', N'Céspedes', N'Juan', CAST(N'2251-02-23' AS Date), N'PACJ990223HTSLSN03', N'PACJ990223HTSLSN03', N'Calle 14', N'Leopoldo Bello López', N'87078', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (24, N'Palaceto', N'Céspedes', N'Juan', CAST(N'2000-02-01' AS Date), N'PACJ990223HTSLSN01', N'PACJ990223HTSLSN01', N'1', N'1', N'80000', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (26, N'Palaceto', N'Céspedes', N'Juan', CAST(N'2000-02-01' AS Date), N'PACJ990223HTSLSN01', N'PACJ990223HTSLSN01', N'1', N'1', N'80000', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (27, N'Perez', N'Martinez', N'Omar', CAST(N'2000-08-14' AS Date), N'OMERERWQRRRRRRRRRR', N'OMERERWQRRRRRRRRRR', N'Calle 14', N'Calle 2', N'87078', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (32, N'Perez', N'Martinez', N'Omar', CAST(N'2000-08-14' AS Date), N'OMERERWQRRRRRRRRRR', N'OMERERWQRRRRRRRRRR', N'Calle 14', N'Calle 2', N'     ', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (33, N'PEDRAZAZ', N'MARTINEZ', N'FLOR', CAST(N'9999-11-02' AS Date), N'PACJ990223HTSLSN03', N'PACJ990223HTSLSN03', N'2', N'2', N'87078', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (35, N'PEDRAZAZ', N'MARTINEZ', N'FLOR', CAST(N'9999-11-02' AS Date), N'PACJ990223HTSLSN03', N'PACJ990223HTSLSN03', N'2', N'2', N'87078', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (36, N'Palaceto', N'Céspedes', N'Juan', CAST(N'3223-02-02' AS Date), N'PACJ990223HTSLSN03', N'PACJ990223HTSLSN03', N'1', N'Leopoldo Bello López', N'87078', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (37, N'Palaceto', N'Céspedes', N'Juan', CAST(N'3223-02-02' AS Date), N'PACJ990223HTSLSN03', N'PACJ990223HTSLSN03', N'1', N'Leopoldo Bello López', N'87078', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (39, N'Palaceto', N'Cespedes', N'Ana', CAST(N'2004-01-24' AS Date), N'PACA12222222222222', N'PACA12222222222222', N'4', N'3', N'80100', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (41, N'Perezz', N'Martinez', N'Aldahoir', CAST(N'2008-06-15' AS Date), N'PEMO12222222222222', N'PEMO12222222222222', N'65', N'6', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (42, N'Palaceto', N'Palaceto', N'Juan Paablo', CAST(N'1999-02-23' AS Date), N'PACJ990223HTSLSN03', N'PACJ990223HTSLSN03', N'7', N'Leopoldo Bello López 158', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (43, N'Palaceto', N'Céspedes', N'Juan', CAST(N'1999-02-23' AS Date), N'PACJ990223HTSLSN03', N'PACJ990223HTSLSN03', N'1523', N'Leopoldo Bello López', N'87078', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (45, N'Palaceto', N'Palaceto', N'Juan Paablo', CAST(N'1321-03-21' AS Date), N'PACJ990223HTSLSN03', N'223HTSLSN03223HTSL', N'325213', N'Leopoldo Bello López 158', N'15514', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (46, N'Palaceto', N'Palaceto', N'Juan Paablo', CAST(N'1321-03-21' AS Date), N'PACJ990223HTSLSN03', N'223HTSLSN03223HTSL', N'325213', N'Leopoldo Bello López 158', N'15514', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (47, N'Palaceto', N'Palaceto', N'Juan Paablo', CAST(N'0001-01-01' AS Date), N'3|12e3e13         ', N'3|12e3e13         ', N'436146', N'Leopoldo Bello López 158', N'87078', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (49, N'Palaceto', N'Palaceto', N'Juan Paablo', CAST(N'0001-01-01' AS Date), N'3|12e3e13         ', N'3|12e3e13         ', N'436146', N'Leopoldo Bello López 158', N'87078', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (50, N'Palaceto', N'Palaceto', N'Juan Paablo', CAST(N'0001-01-01' AS Date), N'3|12e3e13         ', N'3|12e3e13         ', N'436146', N'Leopoldo Bello López 158', N'87078', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (52, N'Palaceto', N'Palaceto', N'Juan Paablo', CAST(N'2022-07-15' AS Date), N'3|12e3e13         ', N'3|12e3e13         ', N'436146', N'Leopoldo Bello López 158', N'87078', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (54, N'Palaceto', N'Palaceto', N'Juan Paablo', CAST(N'2022-07-15' AS Date), N'3|12e3e13         ', N'3|12e3e13         ', N'436146', N'Leopoldo Bello López 158', N'87078', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (56, N'Palaceto', N'Palaceto', N'Juan Paablo', CAST(N'2022-07-15' AS Date), N'3|12e3e13         ', N'3|12e3e13         ', N'436146', N'Leopoldo Bello López 158', N'87078', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (57, N'Palaceto', N'Palaceto', N'Juan Paablo', CAST(N'2022-07-15' AS Date), N'3|12e3e13         ', N'3|12e3e13         ', N'436146', N'Leopoldo Bello López 158', N'87078', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (58, N'Palaceto', N'Palaceto', N'Juan Paablo', CAST(N'2022-07-15' AS Date), N'3|12E3E133|12E3E13', N'3|12e3e133        ', N'436146', N'Leopoldo Bello López 158', N'87078', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (59, N'Palaceto', N'Palaceto', N'Juan Paablo', CAST(N'2022-07-15' AS Date), N'3|12E3E133|12E3E13', N'3|12e3e1333|12E3E1', N'436146', N'Leopoldo Bello López 158', N'87078', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (60, N'Palaceto', N'Palaceto', N'Juan Paablo', CAST(N'2022-07-15' AS Date), N'3|12E3E133|12E3E13', N'3|12e3e1333|12E3E1', N'436146', N'Leopoldo Bello López 158', N'87078', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (61, N'Palaceto', N'Palaceto', N'Juan Paablo', CAST(N'2022-07-15' AS Date), N'3|12E3E133|12E3E13', N'3|12e3e1333|12E3E1', N'436146', N'Leopoldo Bello López 158', N'87078', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (62, N'Palaceto', N'Palaceto', N'Juan Paablo', CAST(N'2022-06-29' AS Date), N'PACJ990223HTSLSN03', N'PACJ990223HTSLSN03', N'3151251', N'Leopoldo Bello López 158', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (63, N'Palaceto', N'Palaceto', N'Juan Paablo', CAST(N'2022-06-29' AS Date), N'PACJ990223HTSLSN03', N'PACJ990223HTSLSN03', N'3151251', N'Leopoldo Bello López 158', N'87078', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (64, N'Palaceto', N'Céspedes', N'Juan', CAST(N'2005-06-08' AS Date), N'PACJ990223HTSLSN03', N'PACJ990223HTSLSN03', N'143636136', N'Leopoldo Bello López', N'87078', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (65, N'Palaceto', N'Céspedes', N'Juan111', CAST(N'4541-05-23' AS Date), N'PACJ990223HTSLSN03', N'PACJ990223HTSLSN03', N'Calle 14', N'Leopoldo Bello López', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (66, N'Palaceto', N'Céspedes', N'Juan111', CAST(N'4541-05-23' AS Date), N'PACJ990223HTSLSN03', N'PACJ990223HTSLSN03', N'Calle 14', N'Leopoldo Bello López', N'87078', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (67, N'Pimpam', N'Perez', N'Martinez', CAST(N'1810-05-23' AS Date), N'PACA98132842748912', N'PACA98132842748912', N'54', N'Calle 13', N'5000 ', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (68, N'Palaceto', N'Céspedes', N'Juan111', CAST(N'4541-05-23' AS Date), N'PACJ990223HTSLSN03', N'PACJ990223HTSLSN03', N'Calle 14', N'Leopoldo Bello López', N'87078', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (69, N'Palaceto', N'Palaceto', N'Juan Paablo', CAST(N'9999-12-23' AS Date), N'PACJ990223HTSLSN03', N'PACJ990223HTSLSN03', N'124123', N'Leopoldo Bello López 158', N'87078', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (70, N'Palaceto', N'Palaceto', N'Juan Paablo', CAST(N'9999-12-23' AS Date), N'PACJ990223HTSLSN03', N'PACJ990223HTSLSN03', N'124123', N'Leopoldo Bello López 158', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (71, N'Palaceto', N'Céspedes', N'Juan', CAST(N'2022-07-15' AS Date), N'PACJ990223HTSLSN03', N'PACJ990223HTSLSN03', N'124124', N'Leopoldo Bello López', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (72, N'Palaceto', N'Cespedes', N'Juan Pablo', CAST(N'1999-02-23' AS Date), N'PACJ990223HTSLSN03', N'PACJ990223HTSLSN03', N'1', N'Leopoldo Bello López 158', N'87078', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (73, N'Palaceto', N'Céspedes', N'Juan', CAST(N'1999-02-23' AS Date), N'PACJ990223HTSLSN03', N'PACJ990223HTSLSN03', N'12352', N'Leopoldo Bello López', N'87078', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (74, N'Palaceto', N'Céspedes', N'Juan', CAST(N'1999-02-23' AS Date), N'PACJ990223HTSLSN03', N'PACJ990223HTSLSN03', N'hehreh', N'Leopoldo Bello López', N'87078', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (75, N'Pepito', N'ML', N'Pepe', CAST(N'1661-05-23' AS Date), N'o2333333f23f23f32f', N'f23f23f23f23f23f23', N'f23f23f23', N'35', N'87000', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (76, N'Palaceto', N'Céspedes', N'Juan', CAST(N'1999-02-23' AS Date), N'PACJ990223HTSLSN03', N'PACJ990223HTSLSN03', N'hehreh', N'Leopoldo Bello López', N'87078', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (77, N'Pepito', N'ML', N'Pepe', CAST(N'1661-05-23' AS Date), N'o2333333f23f23f32f', N'f23f23f23f23f23f23', N'f23f23f23', N'35', N'87000', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (78, N'Palaceto', N'Céspedes', N'Juan', CAST(N'1999-02-23' AS Date), N'PACJ990223HTSLSN03', N'PACJ990223HTSLSN03', N'hehreh', N'Leopoldo Bello López', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (79, N'Perez', N'Palaceto', N'Alejadnra', CAST(N'1980-07-05' AS Date), N'pPPPPPPPPP32FR23R3', N'PPPPPPPPPP32FR23R3', N'15.25', N'cALLE 13', N'12341', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (80, N'Palaceto', N'Cespedes', N'Juan Pablo', CAST(N'1999-02-23' AS Date), N'PACJ990223HTSLSN03', N'PACJ10384104812341', N'12', N'Leopoldo Bello Lopez q59', N'88341', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (81, N'Palaceto', N'Céspedes', N'jUAN pAABLO', CAST(N'1999-02-23' AS Date), N'PACJ990223HTSLSN03', N'PACJ990223HTSLSN03', N'1234', N'Leopoldo Bello López 158', N'87078', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (82, N'Rodriguez', N'sEGOVIA', N'Yohan', CAST(N'2000-11-25' AS Date), N'yorehrwihreihrihwe', N'rosahrihoir2hihr3o', N'25', N'Calle mainero', N'35421', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (83, N'Palaceto', N'Céspedes', N'Juan', CAST(N'1999-02-23' AS Date), N'PACJ990223HTSLSN03', N'PACJ990223HTSLSN03', N'PACJ990223HTSLSN03', N'Leopoldo Bello López', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (84, N'Palaceto', N'Céspedes', N'Juan', CAST(N'6111-02-05' AS Date), N'PACJ990223HTSLSN03', N'PACJ990223HTSLSN03', N'353214', N'Leopoldo Bello López', N'87078', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (85, N'Palaceto', N'Céspedes', N'Juan', CAST(N'2005-02-23' AS Date), N'PACJ990223HTSLSN03', N'PACJ990223HTSLSN03', N'r2ef2', N'Leopoldo Bello López', N'87078', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (86, N'Palaceto', N'Céspedes', N'Juan', CAST(N'1999-02-23' AS Date), N'PACJ990223HTSLSN03', N'PACJ990223HTSLSN12', N'1', N'Leopoldo Bello López', N'87078', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (87, N'Palaceto', N'Céspedes', N'Juan', CAST(N'1999-02-23' AS Date), N'PACJ990223H2345243', N'PACJ990223H2345243', N'fwefwe', N'Leopoldo Bello López', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (88, N'Palaceto', N'ESTE LO TENGO QUE RECONOCER', N'Juan', CAST(N'1999-02-23' AS Date), N'PACJ990223HTSLSN03', N'PACJ990223HTSLSN03', N'234243', N'24234', N'23423', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (89, N'Palaceto', N'Palaceto', N'Juan Paablo', CAST(N'1999-02-23' AS Date), N'PACJ990223HTSLSN03', N'PACJ990223HTSLSN03', N'325325', N'Leopoldo Bello López 158', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (90, N'Palaceto', N'Céspedes', N'Juan', CAST(N'1999-02-23' AS Date), N'PACJ990223HTSLSN03', N'PACJ990223HTSLSN03', N'512515', N'Leopoldo Bello López', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (91, N'Palaceto', N'Céspedes', N'Juan', CAST(N'1999-02-23' AS Date), N'PACJ990223HTSLSN03', N'PACJ990223HTSLSN03', N'512515', N'Leopoldo Bello López', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (92, N'Palaceto', N'Céspedes', N'Juan', CAST(N'1999-02-23' AS Date), N'PACJ990223HTSLSN03', N'PACJ990223HTSLSN03', N'512515', N'Leopoldo Bello López', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (93, N'Palaceto', N'Céspedes', N'Juan', CAST(N'1999-02-23' AS Date), N'PACJ990223HTSLSN03', N'PACJ990223HTSLSN03', N'512515', N'Leopoldo Bello López', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (94, N'Palaceto', N'Céspedes', N'Juan', CAST(N'1999-02-23' AS Date), N'PACJ990223HTSLSN03', N'PACJ990223HTSLSN03', N'512515', N'Leopoldo Bello López', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (95, N'Palaceto', N'Céspedes', N'Juan', CAST(N'1999-02-23' AS Date), N'PACJ990223HTSLSN03', N'PACJ990223HTSLSN03', N'512515', N'Leopoldo Bello López', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (96, N'Palaceto', N'Céspedes', N'Juan', CAST(N'1999-02-23' AS Date), N'PACJ990223HTSLSN03', N'PACJ990223HTSLSN03', N'512515', N'Leopoldo Bello López', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (97, N'Segovia', N'Rodríguez', N'Yohan', CAST(N'1998-11-25' AS Date), N'ROSA89162347896297', N'ROSA89162347896292', N'Seccino 5', N'Calle Mainero', N'80001', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (98, N'Segovia', N'Rodríguez', N'Yohan', CAST(N'1998-11-25' AS Date), N'ROSA89162347896297', N'ROSA89162347896292', N'Seccino 5', N'Calle Mainero', N'80001', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (99, N'Pala', N'Ces', N'Juan P', CAST(N'1999-02-23' AS Date), N'PACJ990223HTSLN012', N'PACJ990223HTSLN012', N'Secc5', N'Leopoldo Bello Lopez 158', N'87078', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (100, N'Segovia', N'Rodríguez', N'Yohan', CAST(N'1998-11-25' AS Date), N'ROSA89162347896297', N'ROSA89162347896292', N'Seccino 5', N'Calle Mainero', N'80001', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (101, N'Pala', N'Ces', N'Juan P', CAST(N'1999-02-23' AS Date), N'PACJ990223HTSLN012', N'PACJ990223HTSLN012', N'Secc5', N'Leopoldo Bello Lopez 158', N'87078', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (102, N'Segovia', N'Rodríguez', N'Yohan', CAST(N'1998-11-25' AS Date), N'ROSA89162347896297', N'ROSA89162347896292', N'Seccino 5', N'Calle Mainero', N'80001', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (103, N'Pala', N'Ces', N'Juan P', CAST(N'1999-02-23' AS Date), N'PACJ990223HTSLN012', N'PACJ990223HTSLN012', N'Secc5', N'Leopoldo Bello Lopez 158', N'87078', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (104, N'Segovia', N'Rodríguez', N'Yohan', CAST(N'1998-11-25' AS Date), N'ROSA89162347896297', N'ROSA89162347896292', N'Seccino 5', N'Calle Mainero', N'80001', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (105, N'Pala', N'Ces', N'Juan P', CAST(N'1999-02-23' AS Date), N'PACJ990223HTSLN012', N'PACJ990223HTSLN012', N'Secc5', N'Leopoldo Bello Lopez 158', N'87078', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (106, N'Segovia', N'Rodríguez', N'Yohan', CAST(N'1998-11-25' AS Date), N'ROSA89162347896297', N'ROSA89162347896292', N'Seccino 5', N'Calle Mainero', N'80001', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (107, N'Pala', N'Ces', N'Juan P', CAST(N'1999-02-23' AS Date), N'PACJ990223HTSLN012', N'PACJ990223HTSLN012', N'Secc5', N'Leopoldo Bello Lopez 158', N'87078', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (108, N'Segovia', N'Rodríguez', N'Yohan', CAST(N'1998-11-25' AS Date), N'ROSA89162347896297', N'ROSA89162347896292', N'Seccino 5', N'Calle Mainero', N'80001', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (109, N'Pala', N'Ces', N'Juan P', CAST(N'1999-02-23' AS Date), N'PACJ990223HTSLN012', N'PACJ990223HTSLN012', N'Secc5', N'Leopoldo Bello Lopez 158', N'87078', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (110, N'Segovia', N'Rodríguez', N'Yohan', CAST(N'1998-11-25' AS Date), N'ROSA89162347896297', N'ROSA89162347896292', N'Seccino 5', N'Calle Mainero', N'80001', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (111, N'Pala', N'Ces', N'Juan P', CAST(N'1999-02-23' AS Date), N'PACJ990223HTSLN012', N'PACJ990223HTSLN012', N'Secc5', N'Leopoldo Bello Lopez 158', N'87078', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (112, N'Segovia', N'Rodríguez', N'Yohan', CAST(N'1998-11-25' AS Date), N'ROSA89162347896297', N'ROSA89162347896292', N'Seccino 5', N'Calle Mainero', N'80001', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (113, N'Pala', N'Ces', N'Juan P', CAST(N'1999-02-23' AS Date), N'PACJ990223HTSLN012', N'PACJ990223HTSLN012', N'Secc5', N'Leopoldo Bello Lopez 158', N'87078', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (114, N'Segovia', N'Rodríguez', N'Yohan', CAST(N'1998-11-25' AS Date), N'ROSA89162347896297', N'ROSA89162347896292', N'Seccino 5', N'Calle Mainero', N'80001', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (115, N'Pala', N'Ces', N'Juan P', CAST(N'1999-02-23' AS Date), N'PACJ990223HTSLN012', N'PACJ990223HTSLN012', N'Secc5', N'Leopoldo Bello Lopez 158', N'87078', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (116, N'Segovia', N'Rodríguez', N'Yohan', CAST(N'1998-11-25' AS Date), N'ROSA89162347896297', N'ROSA89162347896292', N'Seccino 5', N'Calle Mainero', N'80001', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (117, N'Pala', N'Ces', N'Juan P', CAST(N'1999-02-23' AS Date), N'PACJ990223HTSLN012', N'PACJ990223HTSLN012', N'Secc5', N'Leopoldo Bello Lopez 158', N'87078', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (118, N'Segovia', N'Rodríguez', N'Yohan', CAST(N'1998-11-25' AS Date), N'ROSA89162347896297', N'ROSA89162347896292', N'Seccino 5', N'Calle Mainero', N'80001', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (119, N'Pala', N'Ces', N'Juan P', CAST(N'1999-02-23' AS Date), N'PACJ990223HTSLN012', N'PACJ990223HTSLN012', N'Secc5', N'Leopoldo Bello Lopez 158', N'87078', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (120, N'Segovia', N'Rodríguez', N'Yohan', CAST(N'1998-11-25' AS Date), N'ROSA89162347896297', N'ROSA89162347896292', N'Seccino 5', N'Calle Mainero', N'80001', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (121, N'Pala', N'Ces', N'Juan P', CAST(N'1999-02-23' AS Date), N'PACJ990223HTSLN012', N'PACJ990223HTSLN012', N'Secc5', N'Leopoldo Bello Lopez 158', N'87078', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (122, N'Segovia', N'Rodríguez', N'Yohan', CAST(N'1998-11-25' AS Date), N'ROSA89162347896297', N'ROSA89162347896292', N'Seccino 5', N'Calle Mainero', N'80001', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (123, N'Pala', N'Ces', N'Juan P', CAST(N'1999-02-23' AS Date), N'PACJ990223HTSLN012', N'PACJ990223HTSLN012', N'Secc5', N'Leopoldo Bello Lopez 158', N'87078', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (124, N'Segovia', N'Rodríguez', N'Yohan', CAST(N'1998-11-25' AS Date), N'ROSA89162347896297', N'ROSA89162347896292', N'Seccino 5', N'Calle Mainero', N'80001', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (125, N'Pala', N'Ces', N'Juan P', CAST(N'1999-02-23' AS Date), N'PACJ990223HTSLN012', N'PACJ990223HTSLN012', N'Secc5', N'Leopoldo Bello Lopez 158', N'87078', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (126, N'Segovia', N'Rodríguez', N'Yohan', CAST(N'1998-11-25' AS Date), N'ROSA89162347896297', N'ROSA89162347896292', N'Seccino 5', N'Calle Mainero', N'80001', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (127, N'Pala', N'Ces', N'Juan P', CAST(N'1999-02-23' AS Date), N'PACJ990223HTSLN012', N'PACJ990223HTSLN012', N'Secc5', N'Leopoldo Bello Lopez 158', N'87078', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (128, N'Segovia', N'Rodríguez', N'Yohan', CAST(N'1998-11-25' AS Date), N'ROSA89162347896297', N'ROSA89162347896292', N'Seccino 5', N'Calle Mainero', N'80001', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (129, N'Pala', N'Ces', N'Juan P', CAST(N'1999-02-23' AS Date), N'PACJ990223HTSLN012', N'PACJ990223HTSLN012', N'Secc5', N'Leopoldo Bello Lopez 158', N'87078', 0)
GO
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (130, N'Segovia', N'Rodríguez', N'Yohan', CAST(N'1998-11-25' AS Date), N'ROSA89162347896297', N'ROSA89162347896292', N'Seccino 5', N'Calle Mainero', N'80001', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (131, N'Pala', N'Ces', N'Juan P', CAST(N'1999-02-23' AS Date), N'PACJ990223HTSLN012', N'PACJ990223HTSLN012', N'Secc5', N'Leopoldo Bello Lopez 158', N'87078', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (132, N'Segovia', N'Rodríguez', N'Yohan', CAST(N'1998-11-25' AS Date), N'ROSA89162347896297', N'ROSA89162347896292', N'Seccino 5', N'Calle Mainero', N'80001', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (133, N'Pala', N'Ces', N'Juan P', CAST(N'1999-02-23' AS Date), N'PACJ990223HTSLN012', N'PACJ990223HTSLN012', N'Secc5', N'Leopoldo Bello Lopez 158', N'87078', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (134, N'Segovia', N'Rodríguez', N'Yohan', CAST(N'1998-11-25' AS Date), N'ROSA89162347896297', N'ROSA89162347896292', N'Seccino 5', N'Calle Mainero', N'80001', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (135, N'Pala', N'Ces', N'Juan P', CAST(N'1999-02-23' AS Date), N'PACJ990223HTSLN012', N'PACJ990223HTSLN012', N'Secc5', N'Leopoldo Bello Lopez 158', N'87078', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (136, N'Segovia', N'Rodríguez', N'Yohan', CAST(N'1998-11-25' AS Date), N'ROSA89162347896297', N'ROSA89162347896292', N'Seccino 5', N'Calle Mainero', N'80001', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (137, N'Pala', N'Ces', N'Juan P', CAST(N'1999-02-23' AS Date), N'PACJ990223HTSLN012', N'PACJ990223HTSLN012', N'Secc5', N'Leopoldo Bello Lopez 158', N'87078', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (138, N'Segovia', N'Rodríguez', N'Yohan', CAST(N'1998-11-25' AS Date), N'ROSA89162347896297', N'ROSA89162347896292', N'Seccino 5', N'Calle Mainero', N'80001', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (139, N'Pala', N'Ces', N'Juan P', CAST(N'1999-02-23' AS Date), N'PACJ990223HTSLN012', N'PACJ990223HTSLN012', N'Secc5', N'Leopoldo Bello Lopez 158', N'87078', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (140, N'Segovia', N'Rodríguez', N'Yohan', CAST(N'1998-11-25' AS Date), N'ROSA89162347896297', N'ROSA89162347896292', N'Seccino 5', N'Calle Mainero', N'80001', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (141, N'Pala', N'Ces', N'Juan P', CAST(N'1999-02-23' AS Date), N'PACJ990223HTSLN012', N'PACJ990223HTSLN012', N'Secc5', N'Leopoldo Bello Lopez 158', N'87078', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (142, N'Segovia', N'Rodríguez', N'Yohan', CAST(N'1998-11-25' AS Date), N'ROSA89162347896297', N'ROSA89162347896292', N'Seccino 5', N'Calle Mainero', N'80001', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (143, N'Pala', N'Ces', N'Juan P', CAST(N'1999-02-23' AS Date), N'PACJ990223HTSLN012', N'PACJ990223HTSLN012', N'Secc5', N'Leopoldo Bello Lopez 158', N'87078', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (144, N'Segovia', N'Rodríguez', N'Yohan', CAST(N'1998-11-25' AS Date), N'ROSA89162347896297', N'ROSA89162347896292', N'Seccino 5', N'Calle Mainero', N'80001', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (145, N'Pala', N'Ces', N'Juan P', CAST(N'1999-02-23' AS Date), N'PACJ990223HTSLN012', N'PACJ990223HTSLN012', N'Secc5', N'Leopoldo Bello Lopez 158', N'87078', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (146, N'Pala', N'Ces', N'Juan P', CAST(N'1999-02-23' AS Date), N'PACJ990223HTSLN012', N'PACJ990223HTSLN012', N'Secc5', N'Leopoldo Bello Lopez 158', N'87078', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (147, N'Palaceto', N'Palaceto', N'Juan Paablo', CAST(N'1998-02-23' AS Date), N'PACJ990223HTS52435', N'PACJ990223HTS52435', N'32', N'Leopoldo Bello López 158', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (148, N'Palaceto', N'Palaceto', N'Juan Paablo', CAST(N'1998-02-23' AS Date), N'PACJ990223HTS52435', N'PACJ990223HTS52435', N'32', N'Leopoldo Bello López 158', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (149, N'Palaceto', N'Palaceto', N'Juan Paablo', CAST(N'1998-02-23' AS Date), N'PACJ990223HTS52435', N'PACJ990223HTS52435', N'32', N'Leopoldo Bello López 158', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (150, N'Palaceto', N'Palaceto', N'Juan Paablo', CAST(N'1998-02-23' AS Date), N'PACJ990223HTS52435', N'PACJ990223HTS52435', N'32', N'Leopoldo Bello López 158', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (151, N'Palaceto', N'Palaceto', N'Juan Paablo', CAST(N'1998-02-23' AS Date), N'PACJ990223HTS52435', N'PACJ990223HTS52435', N'32', N'Leopoldo Bello López 158', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (152, N'Palaceto', N'Palaceto', N'Juan Paablo', CAST(N'1998-02-23' AS Date), N'PACJ990223HTS52435', N'PACJ990223HTS52435', N'32', N'Leopoldo Bello López 158', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (153, N'Palaceto', N'Palaceto', N'Juan Paablo', CAST(N'1998-02-23' AS Date), N'PACJ990223HTS52435', N'PACJ990223HTS52435', N'32', N'Leopoldo Bello López 158', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (154, N'Palaceto', N'Palaceto', N'Juan Paablo', CAST(N'1998-02-23' AS Date), N'PACJ990223HTS52435', N'PACJ990223HTS52435', N'32', N'Leopoldo Bello López 158', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (155, N'Palaceto', N'Palaceto', N'Juan Paablo', CAST(N'1998-02-23' AS Date), N'PACJ990223HTS52435', N'PACJ990223HTS52435', N'32', N'Leopoldo Bello López 158', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (156, N'Palaceto', N'Palaceto', N'Juan Paablo', CAST(N'1998-02-23' AS Date), N'PACJ990223HTS52435', N'PACJ990223HTS52435', N'32', N'Leopoldo Bello López 158', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (157, N'Palaceto', N'Palaceto', N'Juan Paablo', CAST(N'1998-02-23' AS Date), N'PACJ990223HTS52435', N'PACJ990223HTS52435', N'32', N'Leopoldo Bello López 158', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (158, N'Palaceto', N'Palaceto', N'Juan Paablo', CAST(N'1998-02-23' AS Date), N'PACJ990223HTS52435', N'PACJ990223HTS52435', N'32', N'Leopoldo Bello López 158', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (159, N'Palaceto', N'Palaceto', N'Juan Paablo', CAST(N'1998-02-23' AS Date), N'PACJ990223HTS52435', N'PACJ990223HTS52435', N'32', N'Leopoldo Bello López 158', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (160, N'Palaceto', N'Palaceto', N'Juan Paablo', CAST(N'1998-02-23' AS Date), N'PACJ990223HTS52435', N'PACJ990223HTS52435', N'32', N'Leopoldo Bello López 158', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (161, N'Palaceto', N'Palaceto', N'Juan Paablo', CAST(N'1998-02-23' AS Date), N'PACJ990223HTS52435', N'PACJ990223HTS52435', N'32', N'Leopoldo Bello López 158', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (162, N'Palaceto', N'Palaceto', N'Juan Paablo', CAST(N'1998-02-23' AS Date), N'PACJ990223HTS52435', N'PACJ990223HTS52435', N'32', N'Leopoldo Bello López 158', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (163, N'Palaceto', N'Palaceto', N'Juan Paablo', CAST(N'1998-02-23' AS Date), N'PACJ990223HTS52435', N'PACJ990223HTS52435', N'32', N'Leopoldo Bello López 158', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (164, N'Palaceto', N'Palaceto', N'Juan Paablo', CAST(N'1998-02-23' AS Date), N'PACJ990223HTS52435', N'PACJ990223HTS52435', N'32', N'Leopoldo Bello López 158', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (165, N'Palaceto', N'Palaceto', N'Juan Paablo', CAST(N'1998-02-23' AS Date), N'PACJ990223HTS52435', N'PACJ990223HTS52435', N'32', N'Leopoldo Bello López 158', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (166, N'Palaceto', N'Palaceto', N'Juan Paablo', CAST(N'1998-02-23' AS Date), N'PACJ990223HTS52435', N'PACJ990223HTS52435', N'32', N'Leopoldo Bello López 158', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (167, N'Palaceto', N'Palaceto', N'Juan Paablo', CAST(N'1998-02-23' AS Date), N'PACJ990223HTS52435', N'PACJ990223HTS52435', N'32', N'Leopoldo Bello López 158', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (168, N'Palaceto', N'Palaceto', N'Juan Paablo', CAST(N'1998-02-23' AS Date), N'PACJ990223HTS52435', N'PACJ990223HTS52435', N'32', N'Leopoldo Bello López 158', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (169, N'Palaceto', N'Palaceto', N'Juan Paablo', CAST(N'1998-02-23' AS Date), N'PACJ990223HTS52435', N'PACJ990223HTS52435', N'32', N'Leopoldo Bello López 158', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (170, N'Palaceto', N'Palaceto', N'Juan Paablo', CAST(N'1998-02-23' AS Date), N'PACJ990223HTS52435', N'PACJ990223HTS52435', N'32', N'Leopoldo Bello López 158', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (171, N'Palaceto', N'Palaceto', N'Juan Paablo', CAST(N'1998-02-23' AS Date), N'PACJ990223HTS52435', N'PACJ990223HTS52435', N'32', N'Leopoldo Bello López 158', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (172, N'Palaceto', N'Palaceto', N'Juan Paablo', CAST(N'1998-02-23' AS Date), N'PACJ990223HTS52435', N'PACJ990223HTS52435', N'32', N'Leopoldo Bello López 158', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (173, N'Palaceto', N'Palaceto', N'Juan Paablo', CAST(N'1998-02-23' AS Date), N'PACJ990223HTS52435', N'PACJ990223HTS52435', N'32', N'Leopoldo Bello López 158', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (174, N'Palaceto', N'Palaceto', N'Juan Paablo', CAST(N'1999-02-23' AS Date), N'12f1f43f43f1341fef', N'12F1F43F43F1341FEF', N'341234', N'Leopoldo Bello López 158', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (175, N'Palaceto', N'Palaceto', N'Juan Paablo', CAST(N'1999-02-23' AS Date), N'12f1f43f43f1341fef', N'12F1F43F43F1341FEF', N'341234', N'Leopoldo Bello López 158', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (176, N'Palaceto', N'Palaceto', N'Juan Paablo', CAST(N'1999-02-23' AS Date), N'12f1f43f43f1341fef', N'12F1F43F43F1341FEF', N'341234', N'Leopoldo Bello López 158', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (177, N'Palaceto', N'Palaceto', N'Juan Paablo', CAST(N'2000-05-23' AS Date), N'PA52345643HTSLSN03', N'PA52345643HTSLSN03', N'5431f43', N'Leopoldo Bello López 158', N'87078', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (178, N'Palaceto', N'Palaceto', N'Juan Paablo', CAST(N'2000-05-23' AS Date), N'PA52345643HTSLSN03', N'PA52345643HTSLSN03', N'5431f43', N'Leopoldo Bello López 158', N'87078', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (179, N'Palaceto', N'Céspedes', N'Juan', CAST(N'2022-06-28' AS Date), N'gewrgewrgwegererwg', N'GEWRGEWRGWEGERERWG', N'23r245', N'Leopoldo Bello López', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (180, N'Palaceto', N'Céspedes', N'Juan', CAST(N'2022-06-28' AS Date), N'gewrgewrgwegererwg', N'GEWRGEWRGWEGERERWG', N'23r245', N'Leopoldo Bello López', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (181, N'Palaceto', N'Céspedes', N'Juan', CAST(N'2022-06-28' AS Date), N'gewrgewrgwegererwg', N'GEWRGEWRGWEGERERWG', N'23r245', N'Leopoldo Bello López', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (182, N'Palaceto', N'Céspedes', N'Juan', CAST(N'2019-06-13' AS Date), N'gqrgqegqegqegqergq', N'gqrgqegqegqegqergq', N'31g43g', N'Leopoldo Bello López', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (183, N'Palaceto', N'Céspedes', N'Juan', CAST(N'2019-06-13' AS Date), N'gqrgqegqegqegqergq', N'gqrgqegqegqegqergq', N'31g43g', N'Leopoldo Bello López', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (184, N'Palaceto', N'Palaceto', N'Juan Paablo', CAST(N'2022-07-25' AS Date), N'fweff342t46t245234', N'FWEFF342T46T245234', N'32gfegw', N'Leopoldo Bello López 158', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (185, N'Palaceto', N'Palaceto', N'Juan Paablo', CAST(N'2022-07-25' AS Date), N'fweff342t46t245234', N'FWEFF342T46T245234', N'32gfegw', N'Leopoldo Bello López 158', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (186, N'Palaceto', N'Palaceto', N'Juan Paablo', CAST(N'2022-07-25' AS Date), N'fweff342t46t245234', N'FWEFF342T46T245234', N'32gfegw', N'Leopoldo Bello López 158', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (187, N'Palaceto', N'Palaceto', N'Juan Paablo', CAST(N'2022-07-25' AS Date), N'fweff342t46t245234', N'FWEFF342T46T245234', N'32gfegw', N'Leopoldo Bello López 158', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (188, N'Palaceto', N'Céspedes', N'Juan', CAST(N'1999-02-23' AS Date), N'PACJ990223432623gt', N'PACJ990223432623GT', N'32f2', N'Leopoldo Bello López', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (189, N'Palaceto', N'Céspedes', N'Juan', CAST(N'1999-02-23' AS Date), N'PACJ990223432623gt', N'PACJ990223432623GT', N'32f2', N'Leopoldo Bello López', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (190, N'Palaceto', N'Céspedes', N'Juan', CAST(N'1999-02-23' AS Date), N'PACJ990223432623gt', N'PACJ990223432623GT', N'32f2', N'Leopoldo Bello López', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (191, N'Palaceto', N'Céspedes', N'Juan', CAST(N'1999-02-23' AS Date), N'PACJ990223432623gt', N'PACJ990223432623GT', N'32f2', N'Leopoldo Bello López', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (192, N'Palaceto', N'Céspedes', N'Juan', CAST(N'1999-02-23' AS Date), N'PACJ990223432623gt', N'PACJ990223432623GT', N'32f2', N'Leopoldo Bello López', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (193, N'Palaceto', N'fwefqw', N'fqwefwqef', CAST(N'2000-02-23' AS Date), N'PACJ990223HTSLSN03', N'PACJ990223HTSLSN03', N'PACJ990223HTSLSN03', N'PACJ990223HTSLSN03', N'54156', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (194, N'ppep', N'dfjewhfnmkwe', N'hmfjkwhfjw', CAST(N'1995-02-20' AS Date), N'ofjeiwufyn7834yc87', N'PACJ990223HTSLSN03', N'iowjemfoiwf', N'fimwjqoifmwjeq', N'93854', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (195, N'Palaceto', N'fwefqw', N'fqwefwqef', CAST(N'2000-02-23' AS Date), N'PACJ990223HTSLSN03', N'PACJ990223HTSLSN03', N'PACJ990223HTSLSN03', N'PACJ990223HTSLSN03', N'54156', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (196, N'ppep', N'dfjewhfnmkwe', N'hmfjkwhfjw', CAST(N'1995-02-20' AS Date), N'ofjeiwufyn7834yc87', N'PACJ990223HTSLSN03', N'iowjemfoiwf', N'fimwjqoifmwjeq', N'93854', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (197, N'Palaceto', N'Céspedes', N'Juan', CAST(N'1999-02-23' AS Date), N'PAIFOEFUWFKEWIOFUK', N'PAIFOEFUWFKEWIOFUK', N'FEWFWE', N'Leopoldo Bello López', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (198, N'Palaceto', N'Céspedes', N'Juan', CAST(N'1999-02-23' AS Date), N'PAIFOEFUWFKEWIOFUK', N'PAIFOEFUWFKEWIOFUK', N'FEWFWE', N'Leopoldo Bello López', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (199, N'Palaceto', N'Palaceto', N'Juan Paablo', CAST(N'1899-01-03' AS Date), N'fwqfwqfeqwewqfweqf', N'FWEFF342T46T245234', N't342tg', N'Leopoldo Bello López 158', N'87078', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (200, N'fwe', N'f', N'wf', CAST(N'2022-07-14' AS Date), N'fgqwgqwgqwg4qw3t31', N'tg423g34g32g324g32', N'g342grg', N'234gregwer', N'34252', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (201, N'Palaceto', N'Palaceto', N'Juan Paablo', CAST(N'1899-01-03' AS Date), N'fwqfwqfeqwewqfweqf', N'FWEFF342T46T245234', N't342tg', N'Leopoldo Bello López 158', N'87078', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (202, N'fwe', N'f', N'wf', CAST(N'2022-07-14' AS Date), N'fgqwgqwgqwg4qw3t31', N'tg423g34g32g324g32', N'g342grg', N'234gregwer', N'34252', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (203, N'Palaceto', N'Palaceto', N'Juan Paablo', CAST(N'1899-01-03' AS Date), N'fwqfwqfeqwewqfweqf', N'FWEFF342T46T245234', N't342tg', N'Leopoldo Bello López 158', N'87078', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (204, N'fwe', N'f', N'wf', CAST(N'2022-07-14' AS Date), N'fgqwgqwgqwg4qw3t31', N'tg423g34g32g324g32', N'g342grg', N'234gregwer', N'34252', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (205, N'Palaceto', N'Palaceto', N'Juan Paablo', CAST(N'1899-01-03' AS Date), N'fwqfwqfeqwewqfweqf', N'FWEFF342T46T245234', N't342tg', N'Leopoldo Bello López 158', N'87078', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (206, N'fwe', N'f', N'wf', CAST(N'2022-07-14' AS Date), N'fgqwgqwgqwg4qw3t31', N'tg423g34g32g324g32', N'g342grg', N'234gregwer', N'34252', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (207, N'Palaceto', N'qwef', N'fweqfew', CAST(N'2022-06-26' AS Date), N'Ffefw3qeef24v2v513', N'FFEFW3QEEF24V2V513', N'vFFEFW3QEEF24V2V513', N'tweqgqw', N'35145', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (208, N'Pala', N'f12r3f', N'1ffewqf', CAST(N'2022-06-27' AS Date), N'134124531253251235', N'r23cefqfqwefqwfcw2', N'|32r3|', N'f1rfewfeqwf', N'13451', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (209, N'Palaceto', N'qwef', N'fweqfew', CAST(N'2022-06-26' AS Date), N'Ffefw3qeef24v2v513', N'FFEFW3QEEF24V2V513', N'vFFEFW3QEEF24V2V513', N'tweqgqw', N'35145', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (210, N'Pala', N'f12r3f', N'1ffewqf', CAST(N'2022-06-27' AS Date), N'134124531253251235', N'r23cefqfqwefqwfcw2', N'|32r3|', N'f1rfewfeqwf', N'13451', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (211, N'Palaceto', N'qwef', N'fweqfew', CAST(N'2022-06-26' AS Date), N'Ffefw3qeef24v2v513', N'FFEFW3QEEF24V2V513', N'vFFEFW3QEEF24V2V513', N'tweqgqw', N'35145', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (212, N'Pala', N'f12r3f', N'1ffewqf', CAST(N'2022-06-27' AS Date), N'134124531253251235', N'r23cefqfqwefqwfcw2', N'|32r3|', N'f1rfewfeqwf', N'13451', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (213, N'Palaceto', N'qwef', N'fweqfew', CAST(N'2022-06-26' AS Date), N'Ffefw3qeef24v2v513', N'FFEFW3QEEF24V2V513', N'vFFEFW3QEEF24V2V513', N'tweqgqw', N'35145', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (214, N'Pala', N'f12r3f', N'1ffewqf', CAST(N'2022-06-27' AS Date), N'134124531253251235', N'r23cefqfqwefqwfcw2', N'|32r3|', N'f1rfewfeqwf', N'13451', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (215, N'Palaceto', N'qwef', N'fweqfew', CAST(N'2022-06-26' AS Date), N'Ffefw3qeef24v2v513', N'FFEFW3QEEF24V2V513', N'vFFEFW3QEEF24V2V513', N'tweqgqw', N'35145', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (216, N'Pala', N'f12r3f', N'1ffewqf', CAST(N'2022-06-27' AS Date), N'134124531253251235', N'r23cefqfqwefqwfcw2', N'|32r3|', N'f1rfewfeqwf', N'13451', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (217, N'Palaceto', N'qwef', N'fweqfew', CAST(N'2022-06-26' AS Date), N'Ffefw3qeef24v2v513', N'FFEFW3QEEF24V2V513', N'vFFEFW3QEEF24V2V513', N'tweqgqw', N'35145', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (218, N'Pala', N'f12r3f', N'1ffewqf', CAST(N'2022-06-27' AS Date), N'134124531253251235', N'r23cefqfqwefqwfcw2', N'|32r3|', N'f1rfewfeqwf', N'13451', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (219, N'Palaceto', N'qwef', N'fweqfew', CAST(N'2022-06-26' AS Date), N'Ffefw3qeef24v2v513', N'FFEFW3QEEF24V2V513', N'vFFEFW3QEEF24V2V513', N'tweqgqw', N'35145', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (220, N'Pala', N'f12r3f', N'1ffewqf', CAST(N'2022-06-27' AS Date), N'134124531253251235', N'r23cefqfqwefqwfcw2', N'|32r3|', N'f1rfewfeqwf', N'13451', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (221, N'Palaceto', N'Céspedes', N'Juan', CAST(N'1999-02-23' AS Date), N'PACJ990223HTSLSN03', N'PACJ990223HTSLSN03', N'1234', N'Leopoldo Bello López', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (222, N'Palaceto', N'Céspedes', N'Juan', CAST(N'1999-02-23' AS Date), N'PACJ990223HTSLSN03', N'PACJ990223HTSLSN03', N'1242134', N'Leopoldo Bello López', N'87078', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (223, N'pEREZ', N'LUCHO', N'98FHJOWEH', CAST(N'1998-05-02' AS Date), N'PACJ9902R1234LSN03', N'PACJ9902R1234LSN03', N'15.25', N'FE2134521', N'47457', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (224, N'Palaceto', N'Céspedes', N'Juan', CAST(N'1999-02-23' AS Date), N'PACJ990223HTSLSN03', N'PACJ990223HTSLSN03', N'1242134', N'Leopoldo Bello López', N'87078', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (225, N'pEREZ', N'LUCHO', N'98FHJOWEH', CAST(N'1998-05-02' AS Date), N'PACJ9902R1234LSN03', N'PACJ9902R1234LSN03', N'15.25', N'FE2134521', N'47457', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (226, N'Palaceto', N'Céspedes', N'Juan', CAST(N'1999-02-23' AS Date), N'PACJ990223HTSLSN03', N'PACJ990223HTSLSN03', N'1242134', N'Leopoldo Bello López', N'87078', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (227, N'pEREZ', N'LUCHO', N'98FHJOWEH', CAST(N'1998-05-02' AS Date), N'PACJ9902R1234LSN03', N'PACJ9902R1234LSN03', N'15.25', N'FE2134521', N'47457', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (228, N'Palaceto', N'Céspedes', N'Juan', CAST(N'1999-02-23' AS Date), N'PACJ990223HTSLSN03', N'PACJ990223HTSLSN03', N'1242134', N'Leopoldo Bello López', N'87078', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (229, N'pEREZ', N'LUCHO', N'98FHJOWEH', CAST(N'1998-05-02' AS Date), N'PACJ9902R1234LSN03', N'PACJ9902R1234LSN03', N'15.25', N'FE2134521', N'47457', 1)
GO
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (230, N'Palaceto', N'Céspedes', N'Juan', CAST(N'1999-02-23' AS Date), N'CEMO701003MTSSRL02', N'PACJ9902R1234LSN03', N'Calle 14', N'Leopoldo Bello López', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (231, N'Palaceto', N'Céspedes', N'Juan', CAST(N'1999-02-23' AS Date), N'CEMO701003MTSSRL02', N'PACJ9902R1234LSN03', N'Calle 14', N'Leopoldo Bello López', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (232, N'Palaceto', N'Céspedes', N'Juan', CAST(N'1999-02-23' AS Date), N'CEMO701003MTSSRL02', N'PACJ9902R1234LSN03', N'Calle 14', N'Leopoldo Bello López', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (233, N'Palaceto', N'Céspedes', N'Juan', CAST(N'1999-02-23' AS Date), N'CEMO701003MTSSRL02', N'PACJ9902R1234LSN03', N'Calle 14', N'Leopoldo Bello López', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (234, N'Palaceto', N'Céspedes', N'Juan', CAST(N'1999-02-23' AS Date), N'CEMO701003MTSSRL02', N'PACJ9902R1234LSN03', N'Calle 14', N'Leopoldo Bello López', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (235, N'Palaceto', N'Céspedes', N'Juan', CAST(N'1999-02-23' AS Date), N'CEMO701003MTSSRL02', N'PACJ9902R1234LSN03', N'Calle 14', N'Leopoldo Bello López', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (236, N'Palaceto', N'Céspedes', N'Juan', CAST(N'1999-02-23' AS Date), N'CEMO701003MTSSRL02', N'PACJ9902R1234LSN03', N'Calle 14', N'Leopoldo Bello López', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (237, N'Palaceto', N'Céspedes', N'Juan', CAST(N'1999-02-23' AS Date), N'CEMO701003MTSSRL02', N'PACJ9902R1234LSN03', N'Calle 14', N'Leopoldo Bello López', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (238, N'Palaceto', N'Céspedes', N'Juan', CAST(N'1999-02-23' AS Date), N'CEMO701003MTSSRL02', N'PACJ9902R1234LSN03', N'Calle 14', N'Leopoldo Bello López', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (239, N'Palaceto', N'Céspedes', N'Juan', CAST(N'1999-02-23' AS Date), N'CEMO701003MTSSRL02', N'PACJ9902R1234LSN03', N'Calle 14', N'Leopoldo Bello López', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (240, N'Palaceto', N'Céspedes', N'Juan', CAST(N'1999-02-23' AS Date), N'CEMO701003MTSSRL02', N'PACJ9902R1234LSN03', N'Calle 14', N'Leopoldo Bello López', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (241, N'Palaceto', N'Céspedes', N'Juan', CAST(N'1999-02-23' AS Date), N'CEMO701003MTSSRL02', N'PACJ9902R1234LSN03', N'Calle 14', N'Leopoldo Bello López', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (242, N'Palaceto', N'GERWGERG', N'5GWERGW', CAST(N'1999-02-23' AS Date), N'PACJ990223HTSLSN03', N'PACJ990223HTSLSN03', N'2545', N'Leopoldo Bello López 158', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (243, N'Palaceto', N'GERWGERG', N'5GWERGW', CAST(N'1999-02-23' AS Date), N'PACJ990223HTSLSN03', N'PACJ990223HTSLSN03', N'2545', N'Leopoldo Bello López 158', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (244, N'Palaceto', N'GERWGERG', N'5GWERGW', CAST(N'1999-02-23' AS Date), N'PACJ990223HTSLSN03', N'PACJ990223HTSLSN03', N'2545', N'Leopoldo Bello López 158', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (245, N'Palaceto', N'GERWGERG', N'5GWERGW', CAST(N'1999-02-23' AS Date), N'PACJ990223HTSLSN03', N'PACJ990223HTSLSN03', N'2545', N'Leopoldo Bello López 158', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (246, N'Palaceto', N'GERWGERG', N'5GWERGW', CAST(N'1999-02-23' AS Date), N'PACJ990223HTSLSN03', N'PACJ990223HTSLSN03', N'2545', N'Leopoldo Bello López 158', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (247, N'Palaceto', N'GERWGERG', N'5GWERGW', CAST(N'1999-02-23' AS Date), N'PACJ990223HTSLSN03', N'PACJ990223HTSLSN03', N'2545', N'Leopoldo Bello López 158', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (248, N'Palaceto', N'GERWGERG', N'5GWERGW', CAST(N'1999-02-23' AS Date), N'PACJ990223HTSLSN03', N'PACJ990223HTSLSN03', N'2545', N'Leopoldo Bello López 158', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (249, N'Palaceto', N'GERWGERG', N'5GWERGW', CAST(N'1999-02-23' AS Date), N'PACJ990223HTSLSN03', N'PACJ990223HTSLSN03', N'2545', N'Leopoldo Bello López 158', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (250, N'Palaceto', N'GERWGERG', N'5GWERGW', CAST(N'1999-02-23' AS Date), N'PACJ990223HTSLSN03', N'PACJ990223HTSLSN03', N'2545', N'Leopoldo Bello López 158', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (251, N'Palaceto', N'GERWGERG', N'5GWERGW', CAST(N'1999-02-23' AS Date), N'PACJ990223HTSLSN03', N'PACJ990223HTSLSN03', N'2545', N'Leopoldo Bello López 158', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (252, N'Palaceto', N'GERWGERG', N'5GWERGW', CAST(N'1999-02-23' AS Date), N'PACJ990223HTSLSN03', N'PACJ990223HTSLSN03', N'2545', N'Leopoldo Bello López 158', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (253, N'Palaceto', N'GERWGERG', N'5GWERGW', CAST(N'1999-02-23' AS Date), N'PACJ990223HTSLSN03', N'PACJ990223HTSLSN03', N'2545', N'Leopoldo Bello López 158', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (254, N'Palaceto', N'GERWGERG', N'5GWERGW', CAST(N'1999-02-23' AS Date), N'PACJ990223HTSLSN03', N'PACJ990223HTSLSN03', N'2545', N'Leopoldo Bello López 158', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (255, N'Palaceto', N'fewfwq', N'fwf', CAST(N'1999-02-23' AS Date), N'PACJ990223HTSLSN03', N'PACJ990223HTSLSN03', N'ewfwf', N'Leopoldo Bello López 158', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (256, N'Palaceto', N'Céspedes', N'Juan', CAST(N'1990-12-20' AS Date), N'PACJ990223HTSLSN03', N'PACJ990223HTSLSN03', N'23f2f', N'Leopoldo Bello López', N'87078', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (257, N'Pala', N'qwfeqwf', N'gqwegewgq', CAST(N'2022-07-05' AS Date), N'PACJ99022234534523', N'PACJ99022234534523', N'vgewrg', N'gerwgwegr', N'54486', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (258, N'Palaceto', N'Céspedes', N'Juan', CAST(N'1990-12-20' AS Date), N'PACJ990223HTSLSN03', N'PACJ990223HTSLSN03', N'23f2f', N'Leopoldo Bello López', N'87078', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (259, N'Pala', N'qwfeqwf', N'gqwegewgq', CAST(N'2022-07-05' AS Date), N'PACJ99022234534523', N'PACJ99022234534523', N'vgewrg', N'gerwgwegr', N'54486', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (260, N'Palaceto', N'Céspedes', N'Juan', CAST(N'1999-02-23' AS Date), N'PACJ990223HTSLSN03', N'373567356757373657', N'fwefwe', N'Leopoldo Bello López', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (261, N'Palaceto', N'Céspedes', N'Juan', CAST(N'1999-02-23' AS Date), N'PACJ990223HTSLSN03', N'373567356757373657', N'fwefwe', N'Leopoldo Bello López', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (262, N'Palaceto', N'Céspedes', N'Juan', CAST(N'1999-02-23' AS Date), N'PACJ990223HTSLSN03', N'373567356757373657', N'fwefwe', N'Leopoldo Bello López', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (263, N'Palaceto', N'Céspedes', N'Juan', CAST(N'1999-02-23' AS Date), N'PACJ990223HTSLSN03', N'373567356757373657', N'fwefwe', N'Leopoldo Bello López', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (264, N'Palaceto', N'Céspedes', N'Juan', CAST(N'1899-01-10' AS Date), N'CEMO701003MTSSRL02', N'CEMO701003MTSSRL02', N'2eff', N'Leopoldo Bello López', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (265, N'Palaceto', N'Céspedes', N'Juan', CAST(N'1899-01-10' AS Date), N'CEMO701003MTSSRL02', N'CEMO701003MTSSRL02', N'2eff', N'Leopoldo Bello López', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (266, N'Palaceto', N'Céspedes', N'Juan', CAST(N'1899-01-10' AS Date), N'CEMO701003MTSSRL02', N'CEMO701003MTSSRL02', N'2eff', N'Leopoldo Bello López', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (267, N'Palaceto', N'Céspedes', N'Juan', CAST(N'1899-01-10' AS Date), N'CEMO701003MTSSRL02', N'CEMO701003MTSSRL02', N'2eff', N'Leopoldo Bello López', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (268, N'Palaceto', N'Céspedes', N'Juan', CAST(N'1899-01-10' AS Date), N'CEMO701003MTSSRL02', N'CEMO701003MTSSRL02', N'2eff', N'Leopoldo Bello López', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (269, N'Palaceto', N'f143f134f', N'f14fqwef', CAST(N'1995-02-23' AS Date), N'PACJ990223HTSLSN03', N'PACJ990223HTSLSN03', N'f23ef21', N'f21f123', N'12345', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (270, N'Palaceto', N'f143f134f', N'f14fqwef', CAST(N'1995-02-23' AS Date), N'PACJ990223HTSLSN03', N'PACJ990223HTSLSN03', N'f23ef21', N'f21f123', N'12345', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (271, N'Palaceto', N'f143f134f', N'f14fqwef', CAST(N'1995-02-23' AS Date), N'PACJ990223HTSLSN03', N'PACJ990223HTSLSN03', N'f23ef21', N'f21f123', N'12345', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (272, N'Palaceto', N'f143f134f', N'f14fqwef', CAST(N'1995-02-23' AS Date), N'PACJ990223HTSLSN03', N'PACJ990223HTSLSN03', N'f23ef21', N'f21f123', N'12345', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (273, N'Palaceto', N'f143f134f', N'f14fqwef', CAST(N'1995-02-23' AS Date), N'PACJ990223HTSLSN03', N'PACJ990223HTSLSN03', N'f23ef21', N'f21f123', N'12345', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (274, N'Palaceto', N'f143f134f', N'f14fqwef', CAST(N'1995-02-23' AS Date), N'PACJ990223HTSLSN03', N'PACJ990223HTSLSN03', N'f23ef21', N'f21f123', N'12345', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (275, N'Palaceto', N'f143f134f', N'f14fqwef', CAST(N'1995-02-23' AS Date), N'PACJ990223HTSLSN03', N'PACJ990223HTSLSN03', N'f23ef21', N'f21f123', N'12345', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (276, N'Palaceto', N'f143f134f', N'f14fqwef', CAST(N'1995-02-23' AS Date), N'PACJ990223HTSLSN03', N'PACJ990223HTSLSN03', N'f23ef21', N'f21f123', N'12345', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (277, N'Palaceto', N'f143f134f', N'f14fqwef', CAST(N'1995-02-23' AS Date), N'PACJ990223HTSLSN03', N'PACJ990223HTSLSN03', N'f23ef21', N'f21f123', N'12345', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (278, N'Palaceto', N'f143f134f', N'f14fqwef', CAST(N'1995-02-23' AS Date), N'PACJ990223HTSLSN03', N'PACJ990223HTSLSN03', N'f23ef21', N'f21f123', N'12345', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (279, N'Palaceto', N'Palaceto', N'Juan Paablo', CAST(N'2022-06-29' AS Date), N'PACJ990223HTSLSN03', N'PACJ990223HTSLSN03', N'2344', N'Leopoldo Bello López 158', N'87078', 1)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (280, N'Palaceto', N'Palaceto', N'Juan Paablo', CAST(N'1999-02-23' AS Date), N'PACJ990223HTSLSN03', N'PACJ990223HTSLSN03', N'15F1E3F', N'Leopoldo Bello López 158', N'87078', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (281, N'Palaceto', N'Céspedes', N'Juan', CAST(N'1999-02-23' AS Date), N'PACJ990223HTSLSN03', N'PACJ990223HTSLSN03', N'Calle 14', N'Leopoldo Bello López', N'87078', 0)
INSERT [dbo].[Personas] ([id_Persona], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Cumpleanos], [CURP], [ClaveEl], [Seccion], [Direccion], [CP], [Estatus]) VALUES (282, N'Rodriguez', N'sEGOVIA', N'Yohan', CAST(N'1998-11-25' AS Date), N'ROASIUHDNIUUI1321R', N'ROASIUHDNIUUI1321R', N'1541', N'FSAFSE', N'13451', 1)
SET IDENTITY_INSERT [dbo].[Personas] OFF
SET IDENTITY_INSERT [dbo].[Solicitudes] ON 

INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (1, CAST(N'2022-07-16' AS Date), 1, N'Ayuda', N'Ninguna', CAST(3500.00 AS Decimal(18, 2)), CAST(500.00 AS Decimal(18, 2)), 0, N'No hay fondos', 97, 99)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (2, CAST(N'2022-07-16' AS Date), 1, N'Ayuda', N'Ninguna', CAST(3500.00 AS Decimal(18, 2)), CAST(500.00 AS Decimal(18, 2)), 0, N'No hay fondos', 97, 99)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (3, CAST(N'2022-07-16' AS Date), 1, N'Ayuda', N'Ninguna', CAST(3500.00 AS Decimal(18, 2)), CAST(500.00 AS Decimal(18, 2)), 0, N'No hay fondos', 97, 99)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (4, CAST(N'2022-07-16' AS Date), 1, N'Ayuda', N'Ninguna', CAST(3500.00 AS Decimal(18, 2)), CAST(500.00 AS Decimal(18, 2)), 0, N'No hay fondos', 97, 99)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (5, CAST(N'2022-07-16' AS Date), 1, N'Ayuda', N'Ninguna', CAST(3500.00 AS Decimal(18, 2)), CAST(500.00 AS Decimal(18, 2)), 0, N'No hay fondos', 97, 99)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (6, CAST(N'2022-07-16' AS Date), 1, N'Ayuda', N'Ninguna', CAST(3500.00 AS Decimal(18, 2)), CAST(500.00 AS Decimal(18, 2)), 0, N'No hay fondos', 97, 99)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (7, CAST(N'2022-07-16' AS Date), 1, N'Ayuda', N'Ninguna', CAST(3500.00 AS Decimal(18, 2)), CAST(500.00 AS Decimal(18, 2)), 0, N'No hay fondos', 97, 99)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (8, CAST(N'2022-07-16' AS Date), 1, N'Ayuda', N'Ninguna', CAST(3500.00 AS Decimal(18, 2)), CAST(500.00 AS Decimal(18, 2)), 0, N'No hay fondos', 97, 99)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (9, CAST(N'2022-07-16' AS Date), 1, N'Ayuda', N'Ninguna', CAST(3500.00 AS Decimal(18, 2)), CAST(500.00 AS Decimal(18, 2)), 0, N'No hay fondos', 97, 99)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (10, CAST(N'2022-07-16' AS Date), 1, N'Ayuda', N'Ninguna', CAST(3500.00 AS Decimal(18, 2)), CAST(500.00 AS Decimal(18, 2)), 0, N'No hay fondos', 97, 99)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (11, CAST(N'2022-07-16' AS Date), 1, N'Ayuda', N'Ninguna', CAST(3500.00 AS Decimal(18, 2)), CAST(500.00 AS Decimal(18, 2)), 0, N'No hay fondos', 97, 99)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (12, CAST(N'2022-07-16' AS Date), 1, N'Ayuda', N'Ninguna', CAST(3500.00 AS Decimal(18, 2)), CAST(500.00 AS Decimal(18, 2)), 0, N'No hay fondos', 97, 99)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (13, CAST(N'2022-07-16' AS Date), 1, N'Ayuda', N'Ninguna', CAST(3500.00 AS Decimal(18, 2)), CAST(500.00 AS Decimal(18, 2)), 0, N'No hay fondos', 97, 99)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (14, CAST(N'2022-07-16' AS Date), 1, N'Ayuda', N'Ninguna', CAST(3500.00 AS Decimal(18, 2)), CAST(500.00 AS Decimal(18, 2)), 0, N'No hay fondos', 97, 99)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (15, CAST(N'2022-07-16' AS Date), 1, N'Ayuda', N'Ninguna', CAST(3500.00 AS Decimal(18, 2)), CAST(500.00 AS Decimal(18, 2)), 0, N'No hay fondos', 97, 99)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (16, CAST(N'2022-07-16' AS Date), 1, N'Ayuda', N'Ninguna', CAST(3500.00 AS Decimal(18, 2)), CAST(500.00 AS Decimal(18, 2)), 0, N'No hay fondos', 97, 99)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (17, CAST(N'2022-07-16' AS Date), 1, N'Ayuda', N'Ninguna', CAST(3500.00 AS Decimal(18, 2)), CAST(500.00 AS Decimal(18, 2)), 0, N'No hay fondos', 97, 99)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (18, CAST(N'2022-07-16' AS Date), 1, N'Ayuda', N'Ninguna', CAST(3500.00 AS Decimal(18, 2)), CAST(500.00 AS Decimal(18, 2)), 0, N'No hay fondos', 97, 99)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (19, CAST(N'2022-07-16' AS Date), 1, N'Ayuda', N'Ninguna', CAST(3500.00 AS Decimal(18, 2)), CAST(500.00 AS Decimal(18, 2)), 0, N'No hay fondos', 97, 99)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (20, CAST(N'2022-07-16' AS Date), 1, N'Ayuda', N'Ninguna', CAST(3500.00 AS Decimal(18, 2)), CAST(500.00 AS Decimal(18, 2)), 0, N'No hay fondos', 97, 99)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (21, CAST(N'2022-07-16' AS Date), 1, N'Ayuda', N'Ninguna', CAST(3500.00 AS Decimal(18, 2)), CAST(500.00 AS Decimal(18, 2)), 0, N'No hay fondos', 97, 99)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (22, CAST(N'2022-07-16' AS Date), 1, N'Ayuda', N'Ninguna', CAST(3500.00 AS Decimal(18, 2)), CAST(500.00 AS Decimal(18, 2)), 0, N'No hay fondos', 97, 99)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (23, CAST(N'2022-07-16' AS Date), 1, N'Ayuda', N'Ninguna', CAST(3500.00 AS Decimal(18, 2)), CAST(500.00 AS Decimal(18, 2)), 0, N'No hay fondos', 97, 99)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (24, CAST(N'2022-07-16' AS Date), 1, N'Ayuda', N'Ninguna', CAST(3500.00 AS Decimal(18, 2)), CAST(500.00 AS Decimal(18, 2)), 0, N'No hay fondos', 97, 99)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (25, CAST(N'2022-07-16' AS Date), 1, N'Ayuda', N'Ninguna', CAST(3500.00 AS Decimal(18, 2)), CAST(500.00 AS Decimal(18, 2)), 0, N'No hay fondos', 97, 99)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (26, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(2566.00 AS Decimal(18, 2)), CAST(234.00 AS Decimal(18, 2)), 1, N'', NULL, NULL)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (27, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(2566.00 AS Decimal(18, 2)), CAST(234.00 AS Decimal(18, 2)), 1, N'', NULL, NULL)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (28, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(2566.00 AS Decimal(18, 2)), CAST(234.00 AS Decimal(18, 2)), 1, N'', 147, 147)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (29, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(2566.00 AS Decimal(18, 2)), CAST(234.00 AS Decimal(18, 2)), 1, N'', 147, 147)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (30, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(2566.00 AS Decimal(18, 2)), CAST(234.00 AS Decimal(18, 2)), 1, N'', 147, 147)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (31, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(2566.00 AS Decimal(18, 2)), CAST(234.00 AS Decimal(18, 2)), 1, N'', 147, 147)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (32, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(2566.00 AS Decimal(18, 2)), CAST(234.00 AS Decimal(18, 2)), 1, N'', 147, 147)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (33, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(2566.00 AS Decimal(18, 2)), CAST(234.00 AS Decimal(18, 2)), 1, N'', 147, 147)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (34, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(2566.00 AS Decimal(18, 2)), CAST(234.00 AS Decimal(18, 2)), 1, N'', 147, 147)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (35, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(2566.00 AS Decimal(18, 2)), CAST(234.00 AS Decimal(18, 2)), 1, N'', 147, 147)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (36, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(2566.00 AS Decimal(18, 2)), CAST(234.00 AS Decimal(18, 2)), 1, N'', 147, 147)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (37, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(2566.00 AS Decimal(18, 2)), CAST(234.00 AS Decimal(18, 2)), 1, N'', 147, 147)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (38, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(2566.00 AS Decimal(18, 2)), CAST(234.00 AS Decimal(18, 2)), 1, N'', 147, 147)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (39, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(2566.00 AS Decimal(18, 2)), CAST(234.00 AS Decimal(18, 2)), 1, N'', 147, 147)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (40, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(2566.00 AS Decimal(18, 2)), CAST(234.00 AS Decimal(18, 2)), 1, N'', 147, 147)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (41, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(2566.00 AS Decimal(18, 2)), CAST(234.00 AS Decimal(18, 2)), 1, N'', 147, 147)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (42, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(2566.00 AS Decimal(18, 2)), CAST(234.00 AS Decimal(18, 2)), 1, N'', 147, 147)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (43, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(2566.00 AS Decimal(18, 2)), CAST(234.00 AS Decimal(18, 2)), 1, N'', 147, 147)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (44, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(2566.00 AS Decimal(18, 2)), CAST(234.00 AS Decimal(18, 2)), 1, N'', 147, 147)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (45, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(2566.00 AS Decimal(18, 2)), CAST(234.00 AS Decimal(18, 2)), 1, N'', 147, 147)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (46, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(2566.00 AS Decimal(18, 2)), CAST(234.00 AS Decimal(18, 2)), 1, N'', 147, 147)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (47, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(2566.00 AS Decimal(18, 2)), CAST(234.00 AS Decimal(18, 2)), 1, N'', 147, 147)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (48, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(2566.00 AS Decimal(18, 2)), CAST(234.00 AS Decimal(18, 2)), 1, N'', 147, 147)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (49, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(2566.00 AS Decimal(18, 2)), CAST(234.00 AS Decimal(18, 2)), 1, N'', 147, 147)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (50, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(2566.00 AS Decimal(18, 2)), CAST(234.00 AS Decimal(18, 2)), 1, N'', 147, 147)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (51, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(2566.00 AS Decimal(18, 2)), CAST(234.00 AS Decimal(18, 2)), 1, N'', 147, 147)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (52, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(2566.00 AS Decimal(18, 2)), CAST(234.00 AS Decimal(18, 2)), 1, N'', 147, 147)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (53, CAST(N'2022-07-16' AS Date), 1, N'Alimentación', N'frgeg', CAST(134234.00 AS Decimal(18, 2)), CAST(1344.00 AS Decimal(18, 2)), 1, N'', 174, 174)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (54, CAST(N'2022-07-16' AS Date), 1, N'Alimentación', N'frgeg', CAST(134234.00 AS Decimal(18, 2)), CAST(1344.00 AS Decimal(18, 2)), 1, N'', 174, 174)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (55, CAST(N'2022-07-16' AS Date), 1, N'Alimentación', N'frgeg', CAST(134234.00 AS Decimal(18, 2)), CAST(1344.00 AS Decimal(18, 2)), 1, N'', 174, 174)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (56, CAST(N'2022-07-16' AS Date), 1, N'g43g34g', N'g34g34', CAST(52513.00 AS Decimal(18, 2)), CAST(532152.00 AS Decimal(18, 2)), 0, N'gregeg', 177, 177)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (57, CAST(N'2022-07-16' AS Date), 1, N'g43g34g', N'g34g34', CAST(52513.00 AS Decimal(18, 2)), CAST(532152.00 AS Decimal(18, 2)), 0, N'gregeg', 177, 177)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (58, CAST(N'2022-07-16' AS Date), 1, N'Alimentación', N'523513v1', CAST(3252135.00 AS Decimal(18, 2)), CAST(1235325.00 AS Decimal(18, 2)), 1, N'', 179, 179)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (59, CAST(N'2022-07-16' AS Date), 1, N'Alimentación', N'523513v1', CAST(3252135.00 AS Decimal(18, 2)), CAST(1235325.00 AS Decimal(18, 2)), 1, N'', 179, 179)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (60, CAST(N'2022-07-16' AS Date), 1, N'Alimentación', N'523513v1', CAST(3252135.00 AS Decimal(18, 2)), CAST(1235325.00 AS Decimal(18, 2)), 1, N'', 179, 179)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (61, CAST(N'2022-07-16' AS Date), 1, N'Alimentación', N'grqegeg', CAST(161436.00 AS Decimal(18, 2)), CAST(1435154.00 AS Decimal(18, 2)), 1, N'', 182, 182)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (62, CAST(N'2022-07-16' AS Date), 1, N'Alimentación', N'grqegeg', CAST(161436.00 AS Decimal(18, 2)), CAST(1435154.00 AS Decimal(18, 2)), 1, N'', 182, 182)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (63, CAST(N'2022-07-16' AS Date), 1, N'Salud', N'rewgergwerg', CAST(12455.00 AS Decimal(18, 2)), CAST(31531254.00 AS Decimal(18, 2)), 1, N'', 184, 184)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (64, CAST(N'2022-07-16' AS Date), 1, N'Salud', N'rewgergwerg', CAST(12455.00 AS Decimal(18, 2)), CAST(31531254.00 AS Decimal(18, 2)), 1, N'', 184, 184)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (65, CAST(N'2022-07-16' AS Date), 1, N'Salud', N'rewgergwerg', CAST(12455.00 AS Decimal(18, 2)), CAST(31531254.00 AS Decimal(18, 2)), 1, N'', 184, 184)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (66, CAST(N'2022-07-16' AS Date), 1, N'Salud', N'rewgergwerg', CAST(12455.00 AS Decimal(18, 2)), CAST(31531254.00 AS Decimal(18, 2)), 1, N'', 184, 184)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (67, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (68, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (69, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (70, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (71, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (72, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (73, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (74, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (75, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (76, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (77, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (78, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (79, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (80, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (81, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (82, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (83, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (84, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (85, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (86, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (87, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (88, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (89, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (90, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (91, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (92, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (93, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (94, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (95, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (96, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (97, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (98, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (99, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
GO
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (100, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (101, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (102, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (103, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (104, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (105, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (106, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (107, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (108, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (109, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (110, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (111, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (112, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (113, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (114, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (115, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (116, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (117, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (118, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (119, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (120, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (121, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (122, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (123, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (124, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (125, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (126, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (127, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (128, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (129, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (130, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (131, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (132, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (133, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (134, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (135, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (136, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (137, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (138, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (139, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (140, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (141, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (142, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (143, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (144, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (145, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (146, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (147, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (148, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (149, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (150, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (151, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (152, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (153, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (154, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (155, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (156, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (157, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (158, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (159, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (160, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (161, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (162, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (163, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (164, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (165, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (166, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (167, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (168, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (169, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (170, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (171, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (172, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (173, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (174, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (175, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (176, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (177, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (178, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (179, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (180, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (181, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (182, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (183, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (184, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (185, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (186, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (187, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (188, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (189, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (190, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (191, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (192, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (193, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (194, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (195, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (196, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (197, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (198, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (199, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
GO
INSERT [dbo].[Solicitudes] ([id_Solicitud], [Fecha], [NumPersonas], [TipoApoyo], [Gestion], [MontoSolicitado], [MontoProporcionado], [Estatus], [Observaciones], [id_Solicitante], [id_Beneficiario]) VALUES (200, CAST(N'2022-07-16' AS Date), 1, N'Educación', N'Estatal', CAST(155.00 AS Decimal(18, 2)), CAST(213512.00 AS Decimal(18, 2)), 1, N'', 188, 188)
SET IDENTITY_INSERT [dbo].[Solicitudes] OFF
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([id_Usuario], [Usuario], [Nombre], [Contrasena], [salt]) VALUES (1, N'Juan', N'Juan Palaceto', 0x03006442A51F047061B15BE608240B58C5F1E34672EF08BE308E109CFE4E79E16C7FB21CC23E5BD2BF239B0777D5AE18F49E812D33FC4F0077DA66E2644111D1, N'6ea46603-b6d2-493f-82a7-5df2724867e5')
INSERT [dbo].[Usuarios] ([id_Usuario], [Usuario], [Nombre], [Contrasena], [salt]) VALUES (2, N'Admin', N'Juan Palaceto', 0x592099C3C65B307AA9489912A216CD8A6C5EC2B9950B509DACB1F5BCF86297718BFCB6021C2930EA23F5375532C6E1B43712C5184EC2515DEB8CD241E150F03D, N'330d82b7-424b-414c-b25a-6a276d04cfb3')
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ_Usuarios_Usuario]    Script Date: 18/07/2022 01:26:03 a. m. ******/
ALTER TABLE [dbo].[Usuarios] ADD  CONSTRAINT [UQ_Usuarios_Usuario] UNIQUE NONCLUSTERED 
(
	[Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[AgregarUsuario]    Script Date: 18/07/2022 01:26:03 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[AgregarUsuario]
@usuario nvarchar(50),
@nombre nvarchar(50),
@pass nvarchar(50)
 
as
begin
DECLARE @salt UNIQUEIDENTIFIER=NEWID() 
    insert into Usuarios (Usuario, Nombre, Contrasena, salt)
    values (@usuario,  @nombre, HASHBYTES('SHA2_512', @pass+CAST(@salt AS NVARCHAR(36))), @salt)
end
GO
/****** Object:  StoredProcedure [dbo].[GrabarContacto]    Script Date: 18/07/2022 01:26:03 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GrabarContacto]
@apellidoPaterno nvarchar(50),
@apellidoMaterno nvarchar(50),
@nombre nvarchar(50),
@cumpleanos date,
@direccion nvarchar(50),
@telefono nchar (10),
@sector nvarchar(50),
@seccion nvarchar(50),
@asociacion nvarchar(50),
@Exitoso int = 0 output
AS
BEGIN
	INSERT INTO Agenda (ApellidoPaterno, ApellidoMaterno, Nombre, Cumpleanos, Direccion, Telefono, Sector, Seccion, Asociacion) 
	VALUES (@apellidoPaterno, @apellidoMaterno, @nombre,  @cumpleanos, @direccion, @telefono, @sector, @seccion, @asociacion)		
	if	(@@ROWCOUNT > 0)
		SET @Exitoso = 1		
	ELSE
		SET @Exitoso = 2

END
GO
/****** Object:  StoredProcedure [dbo].[GrabarPersona]    Script Date: 18/07/2022 01:26:03 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GrabarPersona]
@apellidoPaterno nvarchar(50),
@apellidoMaterno nvarchar(50),
@nombre nvarchar(50),
@cumpleanos date,
@curp char(18),
@claveEl char(18),
@seccion nvarchar(50),
@direccion nvarchar(50),
@cp nchar(5),
@status bit,
@Exitoso int = 0 output
AS
BEGIN
	INSERT INTO Personas (ApellidoPaterno, ApellidoMaterno, Nombre, Cumpleanos, CURP, ClaveEl, Seccion, Direccion, CP, Estatus) 
	VALUES (@apellidoPaterno, @apellidoMaterno, @nombre,  @cumpleanos, @curp, @claveEl, @seccion, @direccion, @cp, @status)		
	if	(@@ROWCOUNT > 0)
		SET @Exitoso = 1		
	ELSE
		SET @Exitoso = 2

END
GO
/****** Object:  StoredProcedure [dbo].[GrabarSolicitud]    Script Date: 18/07/2022 01:26:03 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GrabarSolicitud]
@fecha date,
@numPersonas int,
@tipoApoyo nvarchar(50),
@gestion nvarchar(50),
@montoSolicitado decimal,
@montoProporcionado decimal,
@status bit,
@observaciones nvarchar(500),
@curpp char(18),
@curppBen char(18),
@Exitoso int = 0 output
AS
BEGIN
	

	INSERT INTO Solicitudes (Fecha, NumPersonas, TipoApoyo, Gestion, MontoSolicitado, MontoProporcionado, Estatus, Observaciones, id_Solicitante, id_Beneficiario) 
	VALUES (@fecha, @numPersonas, @tipoApoyo, @gestion, @montoSolicitado, @montoProporcionado, @status, @observaciones, 
	(SELECT TOP 1 id_Persona from Personas where CURP = @curpp), (SELECT TOP 1 id_Persona from Personas where CURP = @curppBen))		
	if	(@@ROWCOUNT > 0)
		SET @Exitoso = 1		
	ELSE
		SET @Exitoso = 2

END
GO
/****** Object:  StoredProcedure [dbo].[GrabaSolicitud]    Script Date: 18/07/2022 01:26:03 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GrabaSolicitud]
@apellidoPaterno nvarchar(50),
@apellidoMaterno nvarchar(50),
@nombre nvarchar(50),
@cumpleanos date,
@curp char(18),
@claveEl char(18),
@seccion nvarchar(50),
@direccion nvarchar(50),
@cp nchar(5),
@status bit,

@apellidoPaternoBen nvarchar(50),
@apellidoMaternoBen nvarchar(50),
@nombreBen nvarchar(50),
@cumpleanosBen date,
@curpBen char(18),
@claveElBen char(18),
@seccionBen nvarchar(50),
@direccionBen nvarchar(50),
@cpBen nchar(5),
@statusBen bit,

@fecha date,
@numPersonas int,
@tipoApoyo nvarchar(50),
@gestion nvarchar(50),
@montoSolicitado decimal,
@montoProporcionado decimal,
@estado bit,
@observaciones nvarchar(500),

@Exitoso int = 0 output
AS
BEGIN
	DECLARE @id int = 0, @idBen int = 0
	BEGIN
		INSERT INTO Personas (ApellidoPaterno, ApellidoMaterno, Nombre, Cumpleanos, CURP, ClaveEl, Seccion, Direccion, CP, Estatus) 
		VALUES (@apellidoPaterno, @apellidoMaterno, @nombre,  @cumpleanos, @curp, @claveEl, @seccion, @direccion, @cp, @status)		
		SET @id = SCOPE_IDENTITY()
			
		IF (@curp != @curpBen)
		begin
			INSERT INTO Personas (ApellidoPaterno, ApellidoMaterno, Nombre, Cumpleanos, CURP, ClaveEl, Seccion, Direccion, CP, Estatus) 
			VALUES (@apellidoPaternoBen, @apellidoMaternoBen, @nombreBen,  @cumpleanosBen, @curpBen, @claveElBen, @seccionBen, @direccionBen, @cpBen, @statusBen)		
			SET @idBen = SCOPE_IDENTITY()	

			INSERT INTO Solicitudes (Fecha, NumPersonas, TipoApoyo, Gestion, MontoSolicitado, MontoProporcionado, Estatus, Observaciones, id_Solicitante, id_Beneficiario) 
			VALUES (@fecha, @numPersonas, @tipoApoyo, @gestion, @montoSolicitado, @montoProporcionado, @status, @observaciones, @id, @idBen)
		end	
		ELSE
		begin
			INSERT INTO Solicitudes (Fecha, NumPersonas, TipoApoyo, Gestion, MontoSolicitado, MontoProporcionado, Estatus, Observaciones, id_Solicitante, id_Beneficiario) 
			VALUES (@fecha, @numPersonas, @tipoApoyo, @gestion, @montoSolicitado, @montoProporcionado, @status, @observaciones, @id, @id)
		end
	END
	IF	(@@ROWCOUNT > 0)
	begin
		SET @Exitoso = 1		
	end
	ELSE
	begin
		SET @Exitoso = 2	
	end
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerDatosUsuario]    Script Date: 18/07/2022 01:26:03 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ObtenerDatosUsuario]
@idusuario int = 0 output
as
begin
	select Nombre from Usuarios where id_Usuario = @idusuario
end
GO
/****** Object:  StoredProcedure [dbo].[PorcentajeSolicitudes]    Script Date: 18/07/2022 01:26:03 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PorcentajeSolicitudes]

@Atendidas int = 0 output,
@NoAtendidas int = 0 output
AS
BEGIN
	SET @NoAtendidas = (Select COUNT(*) as NoAtentidas from Solicitudes WHERE Estatus = 0)		
	SET @Atendidas = (Select COUNT(*) as NoAtentidas from Solicitudes WHERE Estatus = 1)		
END
GO
/****** Object:  StoredProcedure [dbo].[SelBenefs]    Script Date: 18/07/2022 01:26:03 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SelBenefs]
as

SELECT ApellidoPaterno, ApellidoMaterno, Nombre, Cumpleanos, CURP, ClaveEl, Seccion, Direccion, CP
FROM Personas
WHERE Estatus = 'true'
ORDER BY ApellidoPaterno
GO
/****** Object:  StoredProcedure [dbo].[SelContactos]    Script Date: 18/07/2022 01:26:03 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SelContactos]
as

SELECT ApellidoPaterno, ApellidoMaterno, Nombre, Cumpleanos, Direccion, Telefono, Sector, Seccion, Asociacion
FROM Agenda
ORDER BY ApellidoPaterno
GO
/****** Object:  StoredProcedure [dbo].[SelCumpleanos]    Script Date: 18/07/2022 01:26:03 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SelCumpleanos]
as
IF ((select MONTH(GETDATE())) = 12)
begin
	(SELECT ApellidoPaterno, ApellidoMaterno, Nombre, Cumpleanos, CURP, ClaveEl, Seccion, Direccion, CP,  Estatus
	FROM Personas
	WHERE (
		MONTH(Cumpleanos) = MONTH(GETDATE())
		AND DAY(Cumpleanos) >= DAY(GETDATE())
	) OR (
		MONTH(Cumpleanos) = 1
	))
	order by MONTH(Cumpleanos)
end
ELSE
begin
	(SELECT ApellidoPaterno, ApellidoMaterno, Nombre, Cumpleanos, CURP, ClaveEl, Seccion, Direccion, CP,  Estatus
	FROM Personas
	WHERE (
		MONTH(Cumpleanos) = MONTH(GETDATE())
		AND DAY(Cumpleanos) >= DAY(GETDATE())
	) OR (
		MONTH(Cumpleanos) = MONTH(GETDATE())+1
	))
	order by MONTH(Cumpleanos)
end

GO
/****** Object:  StoredProcedure [dbo].[ValidarUsuario]    Script Date: 18/07/2022 01:26:03 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ValidarUsuario]
@usuario nvarchar(50),
@pass nvarchar(50),
@nombre nvarchar(50) = '' output,
@idusuario int = 0 output
as
begin
	select * from Usuarios where Usuario = @usuario and Contrasena = HASHBYTES('SHA2_512', @pass+CAST(salt AS NVARCHAR(36)))
	set @idusuario = (select id_Usuario from Usuarios where Usuario = @usuario and Contrasena = HASHBYTES('SHA2_512', @pass+CAST(salt AS NVARCHAR(36))))
	set @nombre = (select Usuario from Usuarios where @idusuario = id_Usuario)
end
GO
USE [master]
GO
ALTER DATABASE [SistemaApoyosTGR] SET  READ_WRITE 
GO
