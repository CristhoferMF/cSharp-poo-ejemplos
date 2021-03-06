USE [master]
GO
/****** Object:  Database [BDFE401]    Script Date: 19/06/2018 08:03:13 ******/
CREATE DATABASE [BDFE401]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BDFE401', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MS_SQL\MSSQL\DATA\BDFE401.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BDFE401_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MS_SQL\MSSQL\DATA\BDFE401_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [BDFE401] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BDFE401].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BDFE401] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BDFE401] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BDFE401] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BDFE401] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BDFE401] SET ARITHABORT OFF 
GO
ALTER DATABASE [BDFE401] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BDFE401] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BDFE401] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BDFE401] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BDFE401] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BDFE401] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BDFE401] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BDFE401] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BDFE401] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BDFE401] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BDFE401] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BDFE401] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BDFE401] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BDFE401] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BDFE401] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BDFE401] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BDFE401] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BDFE401] SET RECOVERY FULL 
GO
ALTER DATABASE [BDFE401] SET  MULTI_USER 
GO
ALTER DATABASE [BDFE401] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BDFE401] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BDFE401] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BDFE401] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BDFE401] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'BDFE401', N'ON'
GO
ALTER DATABASE [BDFE401] SET QUERY_STORE = OFF
GO
USE [BDFE401]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [BDFE401]
GO
/****** Object:  Table [dbo].[cliente]    Script Date: 19/06/2018 08:03:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cliente](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NULL,
	[numruc] [varchar](11) NULL,
	[direccion] [varchar](100) NULL,
	[telefono] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detalle]    Script Date: 19/06/2018 08:03:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalle](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idVenta] [int] NULL,
	[idProducto] [int] NULL,
	[cantidad] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[producto]    Script Date: 19/06/2018 08:03:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[producto](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](100) NULL,
	[categoria] [varchar](100) NULL,
	[precio] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[venta]    Script Date: 19/06/2018 08:03:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[venta](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fecventa] [datetime] NULL,
	[idCliente] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[cliente] ON 

INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (1, N'ACS INDUSTRIA METAL MECANICA E.I.R.L.', N'20458127400', N'LIMA', N'999888101')
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (2, N'AQUILES MARCELINO AGUILAR ZACARÍAS', N'10161204396', N'LIMA', N'999888102')
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (3, N'ATLAS MOTOS E.I.R.LTDA.', N'20406502377', N'PUNO', N'999888103')
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (4, N'CARROCERIAS INTEGRADAS S.A. - CAISA', N'20331634281', N'LIMA', N'999888104')
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (5, N'CARROCERIAS SAN LUIS E.I.R.L.', N'20102259735', N'LIMA', N'999888105')
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (6, N'CESAR AUGUSTO GARCIA SALAZAR', N'10165286371', N'LIMA', N'999888106')
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (7, N'COMPANY BUSINESSES S.A.C.', N'20516333694', N'CALLAO', N'999888107')
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (8, N'COMPAÑIA INDUSTRIAL DE CARROCERIAS S.A.C.', N'20538154564', N'LIMA', N'999888108')
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (9, N'COMPAÑIA PERUANA DE REMOLQUES S.A.', N'20135468941', N'CALLAO', N'999888109')
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (10, N'CONSERMET S.A.C.', N'20481405999', N'LA LIBERTAD', N'999888110')
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (11, N'CORPORACION CAYMAN S.A.C.', N'20493190611', N'LORETO', N'999888111')
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (12, N'CORPORACIÓN METÁLICA DEL ACERO S.A.C.', N'20513855941', N'CALLAO', N'999888112')
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (13, N'CORPORACION WRT S.A.C. - WRT S.A.C.', N'20536160206', N'LIMA', N'999888113')
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (14, N'DC EXPREES S.A.C.', N'20600465377', N'LA LIBERTAD', N'999888114')
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (15, N'DECO HOGAR E.I.R.L.', N'20527721173', N'MADRE DE DIOS', N'999888115')
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (16, N'ECOENERGY S.A.C.', N'20393530244', N'UCAYALI', N'999888116')
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (17, N'EHF S.A.C.', N'20600040562', N'LIMA', N'999888117')
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (18, N'ESTRUCTURAS METALICAS OLMEDO E.I.R.L.', N'20261624916', N'LIMA', N'999888118')
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (19, N'SEMIREMOLQUES Y MAQUINARIAS E.I.R.L.', N'20600220668', N'LIMA', N'999888119')
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (20, N'FABRICACION Y SERVICIOS MULTIPLES UCEDA S.A.C.', N'20481952965', N'LA LIBERTAD', N'999888120')
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (21, N'MARQUEZ MACHADO E.I.R.L. - FAB. Y SERV. R.M. Y M. E.I.R.L.', N'20454151713', N'AREQUIPA', N'999888121')
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (22, N'FABRICACIONES ALCANTARA E.I.R.L.', N'20458841714', N'LIMA', N'999888122')
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (23, N'FABRICACIONES BRA S.A.C.', N'20477313214', N'LA LIBERTAD', N'999888123')
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (24, N'FABRICACIONES METÁLICAS ARNOLD S.A.C.', N'20477664513', N'LA LIBERTAD', N'999888124')
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (25, N'FABRICACIONES METALICAS CARRANZA S.A.C. FAMECA S.A.C.', N'20132108294', N'LA LIBERTAD', N'999888125')
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (26, N'FABRICACIONES METALICAS LUJAN S.A.C', N'20481066680', N'LA LIBERTAD', N'999888126')
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (27, N'FABRICACIONES METALICAS Y SERVICIOS DIESEL S.A.C - FAMEDI S.A.C.', N'20505769148', N'LIMA', N'999888127')
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (28, N'FABRICACIONES MONTOYA S.R.L.', N'20531544090', N'SAN MARTIN', N'999888128')
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (29, N'FABRIMETAL S.A.C.', N'20101633820', N'LIMA', N'999888129')
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (30, N'FACAMESUR E.I.R.L.', N'20218677640', N'AREQUIPA', N'999888130')
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (31, N'FACTORIA ANTONIO PINTO S.A.', N'20100070465', N'LIMA', N'999888131')
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (32, N'FACTORIA BARBOZA S.R.L.', N'20486029839', N'JUNIN', N'999888132')
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (33, N'FACTORIA FACJOCA S.A.C.', N'20454650043', N'AREQUIPA', N'999888133')
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (34, N'FACTORIA FELISUR E.I.R.L.', N'20454773986', N'AREQUIPA', N'999888134')
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (35, N'FACTORIA J.C. E.I.R.L.', N'20453910513', N'AREQUIPA', N'999888135')
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (36, N'FACTORIA METAL CHOQUE E.I.R.L.', N'20498433210', N'AREQUIPA', N'999888136')
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (37, N'FACTORIA PETER BILL INTEX S.R.L.', N'20454114354', N'AREQUIPA', N'999888137')
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (38, N'FACTORIA TALLERES ORION E.I.R.L.', N'20454289154', N'AREQUIPA', N'999888138')
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (39, N'FACTORIA Y DISTRIBUCIONES SAN JORGE E.I.R.L.', N'20455782598', N'AREQUIPA', N'999888139')
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (40, N'MECANICA E INDUSTRIA S.R.L. - FACSEMIN', N'20453947352', N'AREQUIPA', N'999888140')
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (41, N'FACTORY MULTISERVICIOS MAG S.R.L.', N'20601745641', N'PUNO', N'999888141')
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (42, N'FAMA ANDINA S.A.C.', N'20524006945', N'LA LIBERTAD', N'999888142')
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (43, N'FASEPA FACTORIA SEÑOR DE PAMPACUCHO E.I.R.L.', N'20498631011', N'AREQUIPA', N'999888143')
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (44, N'GRUPO C & R VELOZ S.A.C.', N'20551034021', N'LIMA', N'999888144')
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (45, N'GRUPO SERMET S.A.C.', N'20549685316', N'CALLAO', N'999888145')
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (46, N'HALCON S.A.', N'20354180911', N'LA LIBERTAD', N'999888146')
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (47, N'HONDA SELVA DEL PERU S.A', N'20493508645', N'LORETO', N'999888147')
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (48, N'IBIMCO PERU S.A.C.', N'20522599591', N'LIMA', N'999888148')
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (49, N'INDUSTRIA CARROCERA DEL PERU S.A.C. - INCAPER', N'20519105676', N'LIMA', N'999888149')
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (50, N'INDUSTRIA METALICA BULLON S.A.C.', N'20514745031', N'LIMA', N'999888150')
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (51, N'INDUSTRIA METALICAS EL RAFA E.I.R.L.', N'20393095301', N'UCAYALI', N'999888151')
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (52, N'INDUSTRIAL UNION S.R.L.', N'20527080445', N'CUSCO', N'999888152')
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (53, N'INDUSTRIAS  RODOS  S.R.L.', N'20302083747', N'LIMA', N'999888153')
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (54, N'INDUSTRIAS ANCALAYO S.A.C.', N'20568135271', N'JUNIN', N'999888154')
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (55, N'INDUSTRIAS FIRME E.I.R.L.', N'20526949065', N'CUSCO', N'999888155')
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (56, N'INDUSTRIAS MECANICAS DEL SUR S.A.C.', N'20519775132', N'TACNA', N'999888156')
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (57, N'INDUSTRIAS METALICAS ALYER S.R.L.', N'20302830828', N'LIMA', N'999888157')
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (58, N'INDUSTRIAS METALICAS AREQUIPA S.A.C.', N'20498196927', N'AREQUIPA', N'999888158')
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (59, N'INDUSTRIAS TRICAR S.A.C.', N'20393063956', N'UCAYALI', N'999888159')
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (60, N'INKA TRAYLERS S.R.L.', N'20473646804', N'LIMA', N'999888160')
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (61, N'J & K INDUBARZA E.I.R.L.', N'20601849519', N'JUNIN', N'999888161')
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (62, N'J & S AUTOMOTRIZ ASOCIADOS E.I.R.L.', N'20601333342', N'MADRE DE DIOS', N'999888162')
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (63, N'J.K.F. MOTOS PERU S.A.C.', N'20447884624', N'PUNO', N'999888163')
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (64, N'JR GROUP INDUSTRIAS S.A.C.', N'20430948076', N'LIMA', N'999888164')
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (65, N'JUAN SALVATIERRA CONDEZO', N'10070728996', N'LIMA', N'999888165')
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (66, N'L & S NASSI S.A.C.', N'20481103399', N'LA LIBERTAD', N'999888166')
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (67, N'LIMA TRAYLERS S.A.C.', N'20504082564', N'LIMA', N'999888167')
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (68, N'LQ TRADING IMPORT EXPORT S.A.C.', N'20468450217', N'LIMA', N'999888168')
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (69, N'MANUEL AUGUSTO ROCHA DIAZ E.I.R.L.', N'20531350309', N'SAN MARTIN', N'999888169')
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (70, N'METALLUM S.A.C.', N'20481782199', N'LA LIBERTAD', N'999888170')
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (71, N'MOTORES DIESEL ANDINOS S.A. - MODASA', N'20417926632', N'LIMA', N'999888171')
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (72, N'MOTORES LATINOAMERICANOS S.A.C.', N'20393292041', N'UCAYALI', N'999888172')
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (73, N'MOTOS STILOS S.A.C.', N'20507099069', N'LIMA', N'999888173')
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (74, N'MOTOSERVICIOS LOS OLIVOS S.R.L.', N'20295008190', N'LIMA', N'999888174')
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (75, N'PLANTA INDUSTRIAL CHEMOTO S.A.C.', N'20529722304', N'LAMBAYEQUE', N'999888175')
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (76, N'PROFESIONALES COSECA S.A.C.', N'20510485557', N'LIMA', N'999888176')
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (77, N'PUMA MOTORS E.I.R.L.', N'20454074115', N'AREQUIPA', N'999888177')
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (78, N'RAJUNSA S.A.C.', N'20522969193', N'CALLAO', N'999888178')
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (79, N'REMOLQUES TRAMONTANA S.A.C.', N'20514038199', N'LIMA', N'999888179')
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (80, N'TANQUES CISTERNAS AFINES E.I.R.L. - RECONCISA', N'20486064235', N'JUNIN', N'999888180')
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (81, N'RISSING MOTORS S.A.C.', N'20544431022', N'LIMA', N'999888181')
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (82, N'RMB SATECI S.A.C.', N'20508596732', N'LIMA', N'999888182')
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (83, N'RONCO MOTORSS S.A.C.', N'20510421583', N'LIMA', N'999888183')
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (84, N'ROSITA INDUSTRIAS METALICAS E.I.R.L.', N'20393056232', N'UCAYALI', N'999888184')
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (85, N'ROYAL PROYECTOS Y SERVICIOS INDUSTRIALES S.A.C.', N'20504044123', N'LIMA', N'999888185')
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (86, N'FABRICACIONES SEÑOR DE HUANCA E.I.R.L. - SEMAFASH E.I.R.L.', N'20453885578', N'AREQUIPA', N'999888186')
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (87, N'SERVICIOS INGENIERIA ELECTROMECANICA S.A.C. - SIELSAC', N'20480028971', N'LAMBAYEQUE', N'999888187')
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (88, N'SGM INGENIEROS E.I.R.L.', N'20498476539', N'AREQUIPA', N'999888188')
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (89, N'SHIMBA SELVA S.A.C.', N'20394031292', N'UCAYALI', N'999888189')
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (90, N'TRACTO CAMIONES USA S.A.C.', N'20293774308', N'LIMA', N'999888190')
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (91, N'TRANS OIL BUNKER S.A.C.', N'20515738461', N'LIMA', N'999888191')
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (92, N'TRANSVISA E.I.R.L.', N'20131173734', N'LIMA PROVINCIAS', N'999888192')
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (93, N'TRICAR TECNOLOGIA S.A.C.', N'20513769351', N'LIMA', N'999888193')
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (94, N'VF MOTOPARTS S.R.LTDA.', N'20341019819', N'LIMA', N'999888194')
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (95, N'VRAMEL CONTRATISTAS E.I.R.L.', N'20329847978', N'CALLAO', N'999888195')
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (96, N'ZEUS PERU S.A.C', N'20545029406', N'LIMA', N'999888196')
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (97, N'ZINSAC DEL PERU S.A.C.', N'20556578746', N'LIMA', N'999888197')
SET IDENTITY_INSERT [dbo].[cliente] OFF
SET IDENTITY_INSERT [dbo].[detalle] ON 

INSERT [dbo].[detalle] ([id], [idVenta], [idProducto], [cantidad]) VALUES (1, 4, 13, 11)
INSERT [dbo].[detalle] ([id], [idVenta], [idProducto], [cantidad]) VALUES (2, 4, 25, 5)
INSERT [dbo].[detalle] ([id], [idVenta], [idProducto], [cantidad]) VALUES (4, 5, 3, 5)
INSERT [dbo].[detalle] ([id], [idVenta], [idProducto], [cantidad]) VALUES (5, 5, 9, 2)
INSERT [dbo].[detalle] ([id], [idVenta], [idProducto], [cantidad]) VALUES (1002, 1002, 3, 3)
INSERT [dbo].[detalle] ([id], [idVenta], [idProducto], [cantidad]) VALUES (1003, 1002, 7, 32)
SET IDENTITY_INSERT [dbo].[detalle] OFF
SET IDENTITY_INSERT [dbo].[producto] ON 

INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (1, N'TE DHARAMSALA', N'BEBIDAS', 18.0000)
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (2, N'CERVEZA TIBETANA BARLEY', N'BEBIDAS', 19.0000)
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (3, N'SIROPE DE REGALIZ', N'CONDIMENTOS', 10.0000)
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (4, N'ESPECIAS CAJUN DEL CHEF ANTON', N'CONDIMENTOS', 22.0000)
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (5, N'MEZCLA GUMBO DEL CHEF ANTON', N'CONDIMENTOS', 21.3500)
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (7, N'PERAS SECAS ORGANICAS DEL TIO BOB', N'FRUTAS/VERDURAS', 30.0000)
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (8, N'SALSA DE ARANDANOS NORTHWOODS', N'CONDIMENTOS MALOS', 40.0000)
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (9, N'BUEY MISHI KOBE', N'CARNES', 97.0000)
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (10, N'PEZ ESPADA', N'PESCADO/MARISCO', 31.0000)
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (11, N'QUESO CABRALES', N'LACTEOS', 21.0000)
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (12, N'QUESO MANCHEGO LA PASTORA', N'LACTEOS', 38.0000)
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (13, N'ALGAS KONBU', N'PESCADO/MARISCO', 6.0000)
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (14, N'CUAJADA DE JUDIAS', N'FRUTAS/VERDURAS', 23.2500)
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (15, N'SALSA DE SOJA BAJA EN SODIO', N'CONDIMENTOS', 15.5000)
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (16, N'POSTRE DE MERENGUE PAVLOVA', N'REPOSTERIA', 17.4500)
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (17, N'CORDERO ALICE SPRINGS', N'CARNES', 39.0000)
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (18, N'LANGOSTINOS TIGRE CARNARVON', N'PESCADO/MARISCO', 62.5000)
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (19, N'PASTAS DE TE DE CHOCOLATE', N'REPOSTERIA', 9.2000)
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (20, N'MERMELADA DE SIR RODNEYS', N'REPOSTERIA', 81.0000)
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (21, N'BOLLOS DE SIR RODNEYS', N'REPOSTERIA', 10.0000)
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (22, N'PAN DE CENTENO CRUJIENTE ESTILO GUSTAFS', N'GRANOS/CEREALES', 21.0000)
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (23, N'PAN FINO', N'GRANOS/CEREALES', 9.0000)
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (24, N'REFRESCO GUARANA FANTASTICA', N'BEBIDAS', 4.5000)
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (25, N'CREMA DE CHOCOLATE Y NUECES NUNUCA', N'REPOSTERIA', 14.0000)
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (26, N'OSITOS DE GOMA GUMBÄR', N'REPOSTERIA', 31.2300)
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (27, N'CHOCOLATE SCHOGGI', N'REPOSTERIA', 43.9000)
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (28, N'COL FERMENTADA RÖSSLE', N'FRUTAS/VERDURAS', 45.6000)
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (29, N'SALCHICHA THÜRINGER', N'CARNES', 123.7900)
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (30, N'ARENQUE BLANCO DEL NOROESTE', N'PESCADO/MARISCO', 25.8900)
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (31, N'QUESO GORGONZOLA TELINO', N'LACTEOS', 12.5000)
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (32, N'QUESO MASCARPONE FABIOLI', N'LACTEOS', 32.0000)
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (33, N'QUESO DE CABRA', N'LACTEOS', 2.5000)
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (34, N'CERVEZA SASQUATCH', N'BEBIDAS', 14.0000)
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (35, N'CERVEZA NEGRA STEELEYE', N'BEBIDAS', 18.0000)
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (36, N'ESCABECHE DE ARENQUE', N'PESCADO/MARISCO', 19.0000)
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (37, N'SALMON AHUMADO GRAVAD', N'PESCADO/MARISCO', 26.0000)
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (38, N'VINO CÔTE DE BLAYE', N'BEBIDAS', 263.5000)
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (39, N'LICOR VERDE CHARTREUSE', N'BEBIDAS', 18.0000)
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (40, N'CARNE DE CANGREJO DE BOSTON', N'PESCADO/MARISCO', 18.4000)
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (41, N'CREMA DE ALMEJAS ESTILO NUEVA INGLATERRA', N'PESCADO/MARISCO', 9.6500)
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (42, N'TALLARINES DE SINGAPUR', N'GRANOS/CEREALES', 14.0000)
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (43, N'CAFE DE MALASIA', N'BEBIDAS', 46.0000)
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (44, N'AZUCAR NEGRA MALACCA', N'CONDIMENTOS', 19.4500)
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (45, N'ARENQUE AHUMADO', N'PESCADO/MARISCO', 9.5000)
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (46, N'ARENQUE SALADO', N'PESCADO/MARISCO', 12.0000)
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (47, N'GALLETAS ZAANSE', N'REPOSTERIA', 9.5000)
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (48, N'CHOCOLATE HOLANDES', N'REPOSTERIA', 12.7500)
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (49, N'REGALIZ', N'REPOSTERIA', 20.0000)
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (50, N'CHOCOLATE BLANCO', N'REPOSTERIA', 16.2500)
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (51, N'MANZANAS SECAS MANJIMUP', N'FRUTAS/VERDURAS', 53.0000)
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (52, N'CEREALES PARA FILO', N'GRANOS/CEREALES', 7.0000)
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (53, N'EMPANADA DE CARNE', N'CARNES', 32.8000)
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (54, N'EMPANADA DE CERDO', N'CARNES', 7.4500)
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (55, N'PATE CHINO', N'CARNES', 24.0000)
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (56, N'GNOCCHI DE LA ABUELA ALICIA', N'GRANOS/CEREALES', 38.0000)
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (57, N'RAVIOLIS ANGELO', N'GRANOS/CEREALES', 19.5000)
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (58, N'CARACOLES DE BORGOÑA', N'PESCADO/MARISCO', 13.2500)
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (59, N'RACLET DE QUESO COURDAVAULT', N'LACTEOS', 55.0000)
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (60, N'CAMEMBERT PIERROT', N'LACTEOS', 34.0000)
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (61, N'SIROPE DE ARCE', N'CONDIMENTOS', 28.5000)
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (62, N'TARTA DE AZUCAR', N'REPOSTERIA', 49.3000)
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (63, N'SANDWICH DE VEGETALES', N'CONDIMENTOS', 43.9000)
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (64, N'BOLLOS DE PAN DE WIMMER', N'GRANOS/CEREALES', 33.2500)
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (65, N'SALSA DE PIMIENTO PICANTE DE LUISIANA', N'CONDIMENTOS', 21.0500)
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (66, N'ESPECIAS PICANTES DE LUISIANA', N'CONDIMENTOS', 17.0000)
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (67, N'CERVEZA LAUGHING LUMBERJACK', N'BEBIDAS', 14.0000)
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (68, N'BARRAS DE PAN DE ESCOCIA', N'REPOSTERIA', 12.5000)
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (69, N'QUESO GUDBRANDSDALS', N'LACTEOS', 36.0000)
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (70, N'CERVEZA OUTBACK', N'BEBIDAS', 15.0000)
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (71, N'CREMA DE QUESO FLTEMYS', N'LACTEOS', 21.5000)
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (72, N'QUESO MOZZARELLA GIOVANNI', N'LACTEOS', 34.8000)
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (73, N'CAVIAR ROJO', N'PESCADO/MARISCO', 15.0000)
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (74, N'QUESO DE SOJA LONGLIFE', N'FRUTAS/VERDURAS', 10.0000)
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (75, N'CERVEZA KLOSTERBIER', N'BEBIDAS', 7.7500)
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (76, N'LICOR CLOUDBERRY', N'BEBIDAS', 18.0000)
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (77, N'SALSA VERDE ORIGINAL FRANKFURTER', N'CONDIMENTOS', 13.0000)
SET IDENTITY_INSERT [dbo].[producto] OFF
SET IDENTITY_INSERT [dbo].[venta] ON 

INSERT [dbo].[venta] ([id], [fecventa], [idCliente]) VALUES (1, CAST(N'2018-06-12T16:45:43.000' AS DateTime), 2)
INSERT [dbo].[venta] ([id], [fecventa], [idCliente]) VALUES (2, CAST(N'2018-06-12T16:49:54.000' AS DateTime), 5)
INSERT [dbo].[venta] ([id], [fecventa], [idCliente]) VALUES (3, CAST(N'2018-06-12T16:52:07.000' AS DateTime), 7)
INSERT [dbo].[venta] ([id], [fecventa], [idCliente]) VALUES (4, CAST(N'2018-06-12T16:55:06.000' AS DateTime), 6)
INSERT [dbo].[venta] ([id], [fecventa], [idCliente]) VALUES (5, CAST(N'2018-06-12T17:02:57.000' AS DateTime), 2)
INSERT [dbo].[venta] ([id], [fecventa], [idCliente]) VALUES (1002, CAST(N'2018-06-19T07:46:25.000' AS DateTime), 2)
SET IDENTITY_INSERT [dbo].[venta] OFF
ALTER TABLE [dbo].[detalle]  WITH CHECK ADD FOREIGN KEY([idProducto])
REFERENCES [dbo].[producto] ([id])
GO
ALTER TABLE [dbo].[detalle]  WITH CHECK ADD FOREIGN KEY([idVenta])
REFERENCES [dbo].[venta] ([id])
GO
ALTER TABLE [dbo].[venta]  WITH CHECK ADD FOREIGN KEY([idCliente])
REFERENCES [dbo].[cliente] ([id])
GO
USE [master]
GO
ALTER DATABASE [BDFE401] SET  READ_WRITE 
GO
