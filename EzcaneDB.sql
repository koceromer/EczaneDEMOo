USE [master]
GO
/****** Object:  Database [Eczane1DB]    Script Date: 15.05.2024 09:10:35 ******/
CREATE DATABASE [Eczane1DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Eczane1DB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Eczane1DB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Eczane1DB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Eczane1DB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Eczane1DB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Eczane1DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Eczane1DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Eczane1DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Eczane1DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Eczane1DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Eczane1DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [Eczane1DB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Eczane1DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Eczane1DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Eczane1DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Eczane1DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Eczane1DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Eczane1DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Eczane1DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Eczane1DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Eczane1DB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Eczane1DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Eczane1DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Eczane1DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Eczane1DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Eczane1DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Eczane1DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Eczane1DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Eczane1DB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Eczane1DB] SET  MULTI_USER 
GO
ALTER DATABASE [Eczane1DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Eczane1DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Eczane1DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Eczane1DB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Eczane1DB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Eczane1DB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Eczane1DB] SET QUERY_STORE = ON
GO
ALTER DATABASE [Eczane1DB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Eczane1DB]
GO
/****** Object:  Table [dbo].[Doktor]    Script Date: 15.05.2024 09:10:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doktor](
	[doktorID] [int] IDENTITY(1,1) NOT NULL,
	[ad] [nvarchar](100) NULL,
	[soyad] [nvarchar](100) NULL,
	[unvanID] [int] NULL,
 CONSTRAINT [PK__Doktorla__77AFB9414E207B8B] PRIMARY KEY CLUSTERED 
(
	[doktorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DoktorUnvan]    Script Date: 15.05.2024 09:10:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DoktorUnvan](
	[unvanID] [int] IDENTITY(1,1) NOT NULL,
	[ad] [nvarchar](50) NULL,
 CONSTRAINT [PK_DoktorUnvan] PRIMARY KEY CLUSTERED 
(
	[unvanID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ilac]    Script Date: 15.05.2024 09:10:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ilac](
	[ilacID] [int] IDENTITY(1,1) NOT NULL,
	[ad] [nvarchar](100) NULL,
	[aciklama] [nvarchar](255) NULL,
	[fiyat] [money] NULL,
	[stokMiktar] [int] NULL,
	[silindiMi] [bit] NULL,
 CONSTRAINT [PK__Ilaclar__22000D1750581FA8] PRIMARY KEY CLUSTERED 
(
	[ilacID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kullanici]    Script Date: 15.05.2024 09:10:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kullanici](
	[kullaniciID] [int] IDENTITY(1,1) NOT NULL,
	[rolID] [int] NULL,
	[ad] [nvarchar](50) NULL,
	[soyad] [nvarchar](50) NULL,
	[kullaniciAd] [nvarchar](50) NULL,
	[sifre] [nvarchar](50) NULL,
	[telefon] [nvarchar](50) NULL,
	[ePosta] [nvarchar](50) NULL,
	[silindiMi] [bit] NULL,
 CONSTRAINT [PK__Kullanic__E011F09B97AE2DB7] PRIMARY KEY CLUSTERED 
(
	[kullaniciID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KullaniciRol]    Script Date: 15.05.2024 09:10:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KullaniciRol](
	[kullaniciRolID] [int] IDENTITY(1,1) NOT NULL,
	[ad] [nvarchar](50) NULL,
 CONSTRAINT [PK__Kullanic__F316AD49C2F778BC] PRIMARY KEY CLUSTERED 
(
	[kullaniciRolID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Musteri]    Script Date: 15.05.2024 09:10:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Musteri](
	[musteriID] [int] IDENTITY(1,1) NOT NULL,
	[adSoyad] [nvarchar](100) NOT NULL,
	[identityNumber] [nvarchar](11) NOT NULL,
	[telefon] [nvarchar](20) NOT NULL,
	[adres] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK__Musteril__72624471C5321AB7] PRIMARY KEY CLUSTERED 
(
	[musteriID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recete]    Script Date: 15.05.2024 09:10:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recete](
	[receteID] [int] IDENTITY(1,1) NOT NULL,
	[doktorID] [int] NULL,
	[musteriID] [int] NULL,
	[ilacID] [int] NULL,
	[miktar] [int] NULL,
	[tarih] [smalldatetime] NULL,
 CONSTRAINT [PK__Recetele__02D0477B08500445] PRIMARY KEY CLUSTERED 
(
	[receteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Satis]    Script Date: 15.05.2024 09:10:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Satis](
	[satisID] [int] IDENTITY(1,1) NOT NULL,
	[ilacID] [int] NULL,
	[musteriID] [int] NULL,
	[calisanID] [int] NULL,
	[satisTarih] [smalldatetime] NULL,
	[miktar] [int] NULL,
	[fiyat] [money] NULL,
 CONSTRAINT [PK__Satislar__80CB4CFF989A32E9] PRIMARY KEY CLUSTERED 
(
	[satisID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Doktor] ON 

INSERT [dbo].[Doktor] ([doktorID], [ad], [soyad], [unvanID]) VALUES (1, N'Ahmet', N'Yılmaz', 2)
INSERT [dbo].[Doktor] ([doktorID], [ad], [soyad], [unvanID]) VALUES (2, N'Ayşe', N'Kaya', 3)
INSERT [dbo].[Doktor] ([doktorID], [ad], [soyad], [unvanID]) VALUES (3, N'Mehmet', N'Demir', 4)
INSERT [dbo].[Doktor] ([doktorID], [ad], [soyad], [unvanID]) VALUES (4, N'Fatma', N'Öztürk', 1)
INSERT [dbo].[Doktor] ([doktorID], [ad], [soyad], [unvanID]) VALUES (5, N'Mustafa', N'Aksoy', 5)
SET IDENTITY_INSERT [dbo].[Doktor] OFF
GO
SET IDENTITY_INSERT [dbo].[DoktorUnvan] ON 

INSERT [dbo].[DoktorUnvan] ([unvanID], [ad]) VALUES (1, N'Pratisyen Doktor')
INSERT [dbo].[DoktorUnvan] ([unvanID], [ad]) VALUES (2, N'Uzman Doktor')
INSERT [dbo].[DoktorUnvan] ([unvanID], [ad]) VALUES (3, N'Başhekim')
INSERT [dbo].[DoktorUnvan] ([unvanID], [ad]) VALUES (4, N'Profesör Doktor')
INSERT [dbo].[DoktorUnvan] ([unvanID], [ad]) VALUES (5, N'Doçent Doktor')
SET IDENTITY_INSERT [dbo].[DoktorUnvan] OFF
GO
SET IDENTITY_INSERT [dbo].[Ilac] ON 

INSERT [dbo].[Ilac] ([ilacID], [ad], [aciklama], [fiyat], [stokMiktar], [silindiMi]) VALUES (1, N'Parol', N'Baş ağrısı için kullanılır', 105.0000, 100, 0)
INSERT [dbo].[Ilac] ([ilacID], [ad], [aciklama], [fiyat], [stokMiktar], [silindiMi]) VALUES (2, N'Apranax', N'Ağrı ve iltihap için kullanılır', 155.0000, 50, 0)
INSERT [dbo].[Ilac] ([ilacID], [ad], [aciklama], [fiyat], [stokMiktar], [silindiMi]) VALUES (3, N'Nebilox', N'Yüksek tansiyon için kullanılır', 200.0000, 75, 0)
INSERT [dbo].[Ilac] ([ilacID], [ad], [aciklama], [fiyat], [stokMiktar], [silindiMi]) VALUES (4, N'Migrenex', N'Migren tedavisinde kullanılır', 120.0000, 60, 0)
INSERT [dbo].[Ilac] ([ilacID], [ad], [aciklama], [fiyat], [stokMiktar], [silindiMi]) VALUES (5, N'Dekolgen', N'Grip ve soğuk algınlığı için kullanılır', 85.0000, 120, 0)
INSERT [dbo].[Ilac] ([ilacID], [ad], [aciklama], [fiyat], [stokMiktar], [silindiMi]) VALUES (6, N'No-Spa', N'Kas ağrıları için kullanılır', 90.0000, 80, 0)
INSERT [dbo].[Ilac] ([ilacID], [ad], [aciklama], [fiyat], [stokMiktar], [silindiMi]) VALUES (7, N'Akineton', N'Parkinson hastalığı için kullanılır', 185.0000, 40, 0)
INSERT [dbo].[Ilac] ([ilacID], [ad], [aciklama], [fiyat], [stokMiktar], [silindiMi]) VALUES (8, N'Ventolin', N'Astım tedavisinde kullanılır', 225.0000, 55, 0)
INSERT [dbo].[Ilac] ([ilacID], [ad], [aciklama], [fiyat], [stokMiktar], [silindiMi]) VALUES (9, N'Cipralex', N'Depresyon tedavisinde kullanılır', 300.0000, 30, 0)
INSERT [dbo].[Ilac] ([ilacID], [ad], [aciklama], [fiyat], [stokMiktar], [silindiMi]) VALUES (10, N'Lustral', N'Obsesif kompulsif bozukluk için kullanılır', 25.0000, 25, 0)
INSERT [dbo].[Ilac] ([ilacID], [ad], [aciklama], [fiyat], [stokMiktar], [silindiMi]) VALUES (11, N'Panadol', N'Ağrı kesici ve ateş düşürücüdür', 70.0000, 90, 0)
INSERT [dbo].[Ilac] ([ilacID], [ad], [aciklama], [fiyat], [stokMiktar], [silindiMi]) VALUES (12, N'Biofenac', N'Ağrı ve iltihap için kullanılır', 125.0000, 70, 0)
INSERT [dbo].[Ilac] ([ilacID], [ad], [aciklama], [fiyat], [stokMiktar], [silindiMi]) VALUES (13, N'Aspirin', N'Ağrı kesici ve ateş düşürücüdür', 55.0000, 110, 0)
INSERT [dbo].[Ilac] ([ilacID], [ad], [aciklama], [fiyat], [stokMiktar], [silindiMi]) VALUES (14, N'Daleron', N'Baş ağrısı ve ateş için kullanılır', 65.0000, 85, 0)
INSERT [dbo].[Ilac] ([ilacID], [ad], [aciklama], [fiyat], [stokMiktar], [silindiMi]) VALUES (15, N'Prozac', N'Depresyon tedavisinde kullanılır', 30.0000, 35, 0)
INSERT [dbo].[Ilac] ([ilacID], [ad], [aciklama], [fiyat], [stokMiktar], [silindiMi]) VALUES (16, N'Voltaren', N'Ağrı ve iltihap için kullanılır', 65.0000, 65, 0)
INSERT [dbo].[Ilac] ([ilacID], [ad], [aciklama], [fiyat], [stokMiktar], [silindiMi]) VALUES (17, N'Trental', N'Dolaşım bozuklukları için kullanılır', 110.0000, 45, 0)
INSERT [dbo].[Ilac] ([ilacID], [ad], [aciklama], [fiyat], [stokMiktar], [silindiMi]) VALUES (18, N'Zyrtec', N'Alerji tedavisinde kullanılır', 25.0000, 50, 0)
INSERT [dbo].[Ilac] ([ilacID], [ad], [aciklama], [fiyat], [stokMiktar], [silindiMi]) VALUES (19, N'Crestor', N'Kolesterol düşürücüdür', 275.0000, 40, 0)
INSERT [dbo].[Ilac] ([ilacID], [ad], [aciklama], [fiyat], [stokMiktar], [silindiMi]) VALUES (20, N'Lyrica', N'Nöropatik ağrı tedavisinde kullanılır', 325.0000, 20, 1)
SET IDENTITY_INSERT [dbo].[Ilac] OFF
GO
SET IDENTITY_INSERT [dbo].[Kullanici] ON 

INSERT [dbo].[Kullanici] ([kullaniciID], [rolID], [ad], [soyad], [kullaniciAd], [sifre], [telefon], [ePosta], [silindiMi]) VALUES (1, 2, N'Ali', N'Yılmaz', N'ali.yilmaz', N'123456', N'5551234567', N'ali.yilmaz@example.com', 0)
INSERT [dbo].[Kullanici] ([kullaniciID], [rolID], [ad], [soyad], [kullaniciAd], [sifre], [telefon], [ePosta], [silindiMi]) VALUES (2, 2, N'Ayşe', N'Kaya', N'ayse.kaya', N'654321', N'5552345678', N'ayse.kaya@example.com', 0)
INSERT [dbo].[Kullanici] ([kullaniciID], [rolID], [ad], [soyad], [kullaniciAd], [sifre], [telefon], [ePosta], [silindiMi]) VALUES (3, 1, N'Mehmet', N'Demir', N'mehmet.demir', N'abcdef', N'5553456789', N'mehmet.demir@example.com', 0)
INSERT [dbo].[Kullanici] ([kullaniciID], [rolID], [ad], [soyad], [kullaniciAd], [sifre], [telefon], [ePosta], [silindiMi]) VALUES (4, 2, N'Fatma', N'Öztürk', N'fatma.ozturk', N'fedcba', N'5554567890', N'fatma.ozturk@example.com', 1)
INSERT [dbo].[Kullanici] ([kullaniciID], [rolID], [ad], [soyad], [kullaniciAd], [sifre], [telefon], [ePosta], [silindiMi]) VALUES (5, 2, N'Ömer', N'Köçer', N'omer.kocer', N'123456', N'5555678901', N'omer.kocer@example.com', 0)
INSERT [dbo].[Kullanici] ([kullaniciID], [rolID], [ad], [soyad], [kullaniciAd], [sifre], [telefon], [ePosta], [silindiMi]) VALUES (6, 2, N'sadasd', N'asdasd', N'asdasdasd', N'asdasd', N'051558858', N'aliak7974@fksamdmasd', 1)
INSERT [dbo].[Kullanici] ([kullaniciID], [rolID], [ad], [soyad], [kullaniciAd], [sifre], [telefon], [ePosta], [silindiMi]) VALUES (7, 2, N'Muhammed Ali ', N'AK', N'aliak22233', N'admin123', N'05453696791', N'aliak7974@gmail.com', 0)
INSERT [dbo].[Kullanici] ([kullaniciID], [rolID], [ad], [soyad], [kullaniciAd], [sifre], [telefon], [ePosta], [silindiMi]) VALUES (8, 2, NULL, NULL, N'aliak22233', N'admin123', NULL, NULL, 0)
INSERT [dbo].[Kullanici] ([kullaniciID], [rolID], [ad], [soyad], [kullaniciAd], [sifre], [telefon], [ePosta], [silindiMi]) VALUES (9, 2, NULL, NULL, N'aliak22233', N'admin123', NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[Kullanici] OFF
GO
SET IDENTITY_INSERT [dbo].[KullaniciRol] ON 

INSERT [dbo].[KullaniciRol] ([kullaniciRolID], [ad]) VALUES (1, N'Yönetici')
INSERT [dbo].[KullaniciRol] ([kullaniciRolID], [ad]) VALUES (2, N'Personel')
SET IDENTITY_INSERT [dbo].[KullaniciRol] OFF
GO
SET IDENTITY_INSERT [dbo].[Musteri] ON 

INSERT [dbo].[Musteri] ([musteriID], [adSoyad], [identityNumber], [telefon], [adres]) VALUES (1, N'Ali Yılmaz', N'12345678901', N'5551234567', N'İstanbul')
INSERT [dbo].[Musteri] ([musteriID], [adSoyad], [identityNumber], [telefon], [adres]) VALUES (2, N'Ayşe Kaya', N'23456789012', N'5552345678', N'Ankara')
INSERT [dbo].[Musteri] ([musteriID], [adSoyad], [identityNumber], [telefon], [adres]) VALUES (3, N'Fatma Demir', N'34567890123', N'5553456789', N'İzmir')
INSERT [dbo].[Musteri] ([musteriID], [adSoyad], [identityNumber], [telefon], [adres]) VALUES (4, N'Ahmet Yıldırım', N'45678901234', N'5554567890', N'Bursa')
INSERT [dbo].[Musteri] ([musteriID], [adSoyad], [identityNumber], [telefon], [adres]) VALUES (5, N'Mehmet Aksoy', N'56789012345', N'5555678901', N'Antalya')
INSERT [dbo].[Musteri] ([musteriID], [adSoyad], [identityNumber], [telefon], [adres]) VALUES (6, N'Aylin Yılmaz', N'67890123456', N'5556789012', N'Adana')
INSERT [dbo].[Musteri] ([musteriID], [adSoyad], [identityNumber], [telefon], [adres]) VALUES (7, N'Kemal Kaya', N'78901234567', N'5557890123', N'Mersin')
INSERT [dbo].[Musteri] ([musteriID], [adSoyad], [identityNumber], [telefon], [adres]) VALUES (8, N'Elif Demir', N'89012345678', N'5558901234', N'Trabzon')
INSERT [dbo].[Musteri] ([musteriID], [adSoyad], [identityNumber], [telefon], [adres]) VALUES (9, N'Zeynep Yıldız', N'90123456789', N'5559012345', N'Gaziantep')
INSERT [dbo].[Musteri] ([musteriID], [adSoyad], [identityNumber], [telefon], [adres]) VALUES (10, N'Hasan Öztürk', N'01234567890', N'5550123456', N'Diyarbakır')
INSERT [dbo].[Musteri] ([musteriID], [adSoyad], [identityNumber], [telefon], [adres]) VALUES (11, N'Şeyma Yılmaz', N'12345678901', N'5551234567', N'Eskişehir')
INSERT [dbo].[Musteri] ([musteriID], [adSoyad], [identityNumber], [telefon], [adres]) VALUES (12, N'Deniz Kaya', N'23456789012', N'5552345678', N'Malatya')
INSERT [dbo].[Musteri] ([musteriID], [adSoyad], [identityNumber], [telefon], [adres]) VALUES (13, N'Gizem Demir', N'34567890123', N'5553456789', N'Konya')
INSERT [dbo].[Musteri] ([musteriID], [adSoyad], [identityNumber], [telefon], [adres]) VALUES (14, N'Serdar Yıldırım', N'45678901234', N'5554567890', N'Samsun')
INSERT [dbo].[Musteri] ([musteriID], [adSoyad], [identityNumber], [telefon], [adres]) VALUES (15, N'Cem Aksoy', N'56789012345', N'5555678901', N'Balıkesir')
INSERT [dbo].[Musteri] ([musteriID], [adSoyad], [identityNumber], [telefon], [adres]) VALUES (16, N'Esra Yılmaz', N'67890123456', N'5556789012', N'Tekirdağ')
INSERT [dbo].[Musteri] ([musteriID], [adSoyad], [identityNumber], [telefon], [adres]) VALUES (17, N'Burak Kaya', N'78901234567', N'5557890123', N'Çanakkale')
INSERT [dbo].[Musteri] ([musteriID], [adSoyad], [identityNumber], [telefon], [adres]) VALUES (18, N'İrem Demir', N'89012345678', N'5558901234', N'Kütahya')
INSERT [dbo].[Musteri] ([musteriID], [adSoyad], [identityNumber], [telefon], [adres]) VALUES (19, N'Emre Yıldız', N'90123456789', N'5559012345', N'Van')
INSERT [dbo].[Musteri] ([musteriID], [adSoyad], [identityNumber], [telefon], [adres]) VALUES (20, N'Melike Öztürk', N'01234567890', N'5550123456', N'Şanlıurfa')
INSERT [dbo].[Musteri] ([musteriID], [adSoyad], [identityNumber], [telefon], [adres]) VALUES (21, N'Durdu Baltacı', N'01234567890', N'5550123456', N'Kahramanmaraş')
SET IDENTITY_INSERT [dbo].[Musteri] OFF
GO
SET IDENTITY_INSERT [dbo].[Recete] ON 

INSERT [dbo].[Recete] ([receteID], [doktorID], [musteriID], [ilacID], [miktar], [tarih]) VALUES (1, 1, 13, 8, 5, CAST(N'2024-05-15T10:00:00' AS SmallDateTime))
INSERT [dbo].[Recete] ([receteID], [doktorID], [musteriID], [ilacID], [miktar], [tarih]) VALUES (2, 1, 4, 17, 7, CAST(N'2024-05-15T11:00:00' AS SmallDateTime))
INSERT [dbo].[Recete] ([receteID], [doktorID], [musteriID], [ilacID], [miktar], [tarih]) VALUES (3, 5, 9, 12, 3, CAST(N'2024-05-15T12:00:00' AS SmallDateTime))
INSERT [dbo].[Recete] ([receteID], [doktorID], [musteriID], [ilacID], [miktar], [tarih]) VALUES (4, 1, 20, 4, 2, CAST(N'2024-05-15T13:00:00' AS SmallDateTime))
INSERT [dbo].[Recete] ([receteID], [doktorID], [musteriID], [ilacID], [miktar], [tarih]) VALUES (5, 5, 2, 7, 4, CAST(N'2024-05-15T14:00:00' AS SmallDateTime))
INSERT [dbo].[Recete] ([receteID], [doktorID], [musteriID], [ilacID], [miktar], [tarih]) VALUES (6, 5, 12, 1, 6, CAST(N'2024-05-15T15:00:00' AS SmallDateTime))
INSERT [dbo].[Recete] ([receteID], [doktorID], [musteriID], [ilacID], [miktar], [tarih]) VALUES (7, 1, 15, 11, 1, CAST(N'2024-05-15T16:00:00' AS SmallDateTime))
INSERT [dbo].[Recete] ([receteID], [doktorID], [musteriID], [ilacID], [miktar], [tarih]) VALUES (8, 1, 5, 19, 8, CAST(N'2024-05-15T17:00:00' AS SmallDateTime))
INSERT [dbo].[Recete] ([receteID], [doktorID], [musteriID], [ilacID], [miktar], [tarih]) VALUES (9, 5, 3, 3, 3, CAST(N'2024-05-15T18:00:00' AS SmallDateTime))
INSERT [dbo].[Recete] ([receteID], [doktorID], [musteriID], [ilacID], [miktar], [tarih]) VALUES (10, 5, 8, 16, 5, CAST(N'2024-05-15T19:00:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[Recete] OFF
GO
SET IDENTITY_INSERT [dbo].[Satis] ON 

INSERT [dbo].[Satis] ([satisID], [ilacID], [musteriID], [calisanID], [satisTarih], [miktar], [fiyat]) VALUES (1, 1, 1, 1, CAST(N'2024-05-15T00:00:00' AS SmallDateTime), 3, 30.0000)
INSERT [dbo].[Satis] ([satisID], [ilacID], [musteriID], [calisanID], [satisTarih], [miktar], [fiyat]) VALUES (2, 2, 2, 2, CAST(N'2024-05-15T00:00:00' AS SmallDateTime), 2, 25.0000)
INSERT [dbo].[Satis] ([satisID], [ilacID], [musteriID], [calisanID], [satisTarih], [miktar], [fiyat]) VALUES (3, 3, 3, 3, CAST(N'2024-05-16T00:00:00' AS SmallDateTime), 1, 15.0000)
INSERT [dbo].[Satis] ([satisID], [ilacID], [musteriID], [calisanID], [satisTarih], [miktar], [fiyat]) VALUES (4, 4, 4, 4, CAST(N'2024-05-16T00:00:00' AS SmallDateTime), 4, 40.0000)
INSERT [dbo].[Satis] ([satisID], [ilacID], [musteriID], [calisanID], [satisTarih], [miktar], [fiyat]) VALUES (5, 5, 5, 5, CAST(N'2024-05-17T00:00:00' AS SmallDateTime), 2, 20.0000)
INSERT [dbo].[Satis] ([satisID], [ilacID], [musteriID], [calisanID], [satisTarih], [miktar], [fiyat]) VALUES (6, 6, 6, 1, CAST(N'2024-05-17T00:00:00' AS SmallDateTime), 1, 10.0000)
INSERT [dbo].[Satis] ([satisID], [ilacID], [musteriID], [calisanID], [satisTarih], [miktar], [fiyat]) VALUES (7, 7, 7, 2, CAST(N'2024-05-18T00:00:00' AS SmallDateTime), 3, 30.0000)
INSERT [dbo].[Satis] ([satisID], [ilacID], [musteriID], [calisanID], [satisTarih], [miktar], [fiyat]) VALUES (8, 8, 8, 3, CAST(N'2024-05-18T00:00:00' AS SmallDateTime), 2, 20.0000)
INSERT [dbo].[Satis] ([satisID], [ilacID], [musteriID], [calisanID], [satisTarih], [miktar], [fiyat]) VALUES (9, 9, 9, 4, CAST(N'2024-05-19T00:00:00' AS SmallDateTime), 1, 15.0000)
INSERT [dbo].[Satis] ([satisID], [ilacID], [musteriID], [calisanID], [satisTarih], [miktar], [fiyat]) VALUES (10, 10, 10, 5, CAST(N'2024-05-19T00:00:00' AS SmallDateTime), 4, 40.0000)
INSERT [dbo].[Satis] ([satisID], [ilacID], [musteriID], [calisanID], [satisTarih], [miktar], [fiyat]) VALUES (11, 11, 11, 1, CAST(N'2024-05-20T00:00:00' AS SmallDateTime), 2, 20.0000)
INSERT [dbo].[Satis] ([satisID], [ilacID], [musteriID], [calisanID], [satisTarih], [miktar], [fiyat]) VALUES (12, 12, 12, 2, CAST(N'2024-05-20T00:00:00' AS SmallDateTime), 1, 10.0000)
INSERT [dbo].[Satis] ([satisID], [ilacID], [musteriID], [calisanID], [satisTarih], [miktar], [fiyat]) VALUES (13, 13, 13, 3, CAST(N'2024-05-21T00:00:00' AS SmallDateTime), 3, 30.0000)
INSERT [dbo].[Satis] ([satisID], [ilacID], [musteriID], [calisanID], [satisTarih], [miktar], [fiyat]) VALUES (14, 14, 14, 4, CAST(N'2024-05-21T00:00:00' AS SmallDateTime), 2, 20.0000)
INSERT [dbo].[Satis] ([satisID], [ilacID], [musteriID], [calisanID], [satisTarih], [miktar], [fiyat]) VALUES (15, 15, 15, 5, CAST(N'2024-05-22T00:00:00' AS SmallDateTime), 1, 15.0000)
INSERT [dbo].[Satis] ([satisID], [ilacID], [musteriID], [calisanID], [satisTarih], [miktar], [fiyat]) VALUES (16, 16, 16, 1, CAST(N'2024-05-22T00:00:00' AS SmallDateTime), 4, 40.0000)
INSERT [dbo].[Satis] ([satisID], [ilacID], [musteriID], [calisanID], [satisTarih], [miktar], [fiyat]) VALUES (17, 17, 17, 2, CAST(N'2024-05-23T00:00:00' AS SmallDateTime), 2, 20.0000)
INSERT [dbo].[Satis] ([satisID], [ilacID], [musteriID], [calisanID], [satisTarih], [miktar], [fiyat]) VALUES (18, 18, 18, 3, CAST(N'2024-05-23T00:00:00' AS SmallDateTime), 1, 10.0000)
INSERT [dbo].[Satis] ([satisID], [ilacID], [musteriID], [calisanID], [satisTarih], [miktar], [fiyat]) VALUES (19, 19, 19, 4, CAST(N'2024-05-24T00:00:00' AS SmallDateTime), 3, 30.0000)
INSERT [dbo].[Satis] ([satisID], [ilacID], [musteriID], [calisanID], [satisTarih], [miktar], [fiyat]) VALUES (20, 20, 20, 5, CAST(N'2024-05-24T00:00:00' AS SmallDateTime), 2, 20.0000)
INSERT [dbo].[Satis] ([satisID], [ilacID], [musteriID], [calisanID], [satisTarih], [miktar], [fiyat]) VALUES (21, 1, 1, 1, CAST(N'2024-05-25T00:00:00' AS SmallDateTime), 1, 10.0000)
INSERT [dbo].[Satis] ([satisID], [ilacID], [musteriID], [calisanID], [satisTarih], [miktar], [fiyat]) VALUES (22, 2, 2, 2, CAST(N'2024-05-25T00:00:00' AS SmallDateTime), 4, 40.0000)
INSERT [dbo].[Satis] ([satisID], [ilacID], [musteriID], [calisanID], [satisTarih], [miktar], [fiyat]) VALUES (23, 3, 3, 3, CAST(N'2024-05-26T00:00:00' AS SmallDateTime), 2, 20.0000)
INSERT [dbo].[Satis] ([satisID], [ilacID], [musteriID], [calisanID], [satisTarih], [miktar], [fiyat]) VALUES (24, 4, 4, 4, CAST(N'2024-05-26T00:00:00' AS SmallDateTime), 1, 10.0000)
INSERT [dbo].[Satis] ([satisID], [ilacID], [musteriID], [calisanID], [satisTarih], [miktar], [fiyat]) VALUES (25, 5, 5, 5, CAST(N'2024-05-27T00:00:00' AS SmallDateTime), 3, 30.0000)
INSERT [dbo].[Satis] ([satisID], [ilacID], [musteriID], [calisanID], [satisTarih], [miktar], [fiyat]) VALUES (26, 6, 6, 1, CAST(N'2024-05-27T00:00:00' AS SmallDateTime), 2, 20.0000)
INSERT [dbo].[Satis] ([satisID], [ilacID], [musteriID], [calisanID], [satisTarih], [miktar], [fiyat]) VALUES (27, 7, 7, 2, CAST(N'2024-05-28T00:00:00' AS SmallDateTime), 1, 15.0000)
INSERT [dbo].[Satis] ([satisID], [ilacID], [musteriID], [calisanID], [satisTarih], [miktar], [fiyat]) VALUES (28, 8, 8, 3, CAST(N'2024-05-28T00:00:00' AS SmallDateTime), 4, 40.0000)
INSERT [dbo].[Satis] ([satisID], [ilacID], [musteriID], [calisanID], [satisTarih], [miktar], [fiyat]) VALUES (29, 9, 9, 4, CAST(N'2024-05-29T00:00:00' AS SmallDateTime), 2, 20.0000)
INSERT [dbo].[Satis] ([satisID], [ilacID], [musteriID], [calisanID], [satisTarih], [miktar], [fiyat]) VALUES (30, 10, 10, 5, CAST(N'2024-05-29T00:00:00' AS SmallDateTime), 1, 10.0000)
SET IDENTITY_INSERT [dbo].[Satis] OFF
GO
ALTER TABLE [dbo].[Doktor] ADD  CONSTRAINT [DF_Doktor_unvanID]  DEFAULT ((1)) FOR [unvanID]
GO
ALTER TABLE [dbo].[Kullanici] ADD  CONSTRAINT [DF_Kullanici_rolID]  DEFAULT ((1)) FOR [rolID]
GO
ALTER TABLE [dbo].[Recete] ADD  CONSTRAINT [DF_Recete_miktar]  DEFAULT ((1)) FOR [miktar]
GO
ALTER TABLE [dbo].[Recete] ADD  CONSTRAINT [DF_Recete_tarih]  DEFAULT (getdate()) FOR [tarih]
GO
ALTER TABLE [dbo].[Satis] ADD  CONSTRAINT [DF_Sastis_satisTarih]  DEFAULT (getdate()) FOR [satisTarih]
GO
ALTER TABLE [dbo].[Satis] ADD  CONSTRAINT [DF_Sastis_miktar]  DEFAULT ((1)) FOR [miktar]
GO
ALTER TABLE [dbo].[Doktor]  WITH CHECK ADD  CONSTRAINT [FK_Doktor_DoktorUnvan] FOREIGN KEY([unvanID])
REFERENCES [dbo].[DoktorUnvan] ([unvanID])
GO
ALTER TABLE [dbo].[Doktor] CHECK CONSTRAINT [FK_Doktor_DoktorUnvan]
GO
ALTER TABLE [dbo].[Kullanici]  WITH CHECK ADD  CONSTRAINT [FK_Kullanici_KullaniciRol] FOREIGN KEY([rolID])
REFERENCES [dbo].[KullaniciRol] ([kullaniciRolID])
GO
ALTER TABLE [dbo].[Kullanici] CHECK CONSTRAINT [FK_Kullanici_KullaniciRol]
GO
ALTER TABLE [dbo].[Recete]  WITH CHECK ADD  CONSTRAINT [FK_Recete_Doktor] FOREIGN KEY([doktorID])
REFERENCES [dbo].[Doktor] ([doktorID])
GO
ALTER TABLE [dbo].[Recete] CHECK CONSTRAINT [FK_Recete_Doktor]
GO
ALTER TABLE [dbo].[Recete]  WITH CHECK ADD  CONSTRAINT [FK_Recete_Ilac] FOREIGN KEY([ilacID])
REFERENCES [dbo].[Ilac] ([ilacID])
GO
ALTER TABLE [dbo].[Recete] CHECK CONSTRAINT [FK_Recete_Ilac]
GO
ALTER TABLE [dbo].[Recete]  WITH CHECK ADD  CONSTRAINT [FK_Recete_Musteri] FOREIGN KEY([musteriID])
REFERENCES [dbo].[Musteri] ([musteriID])
GO
ALTER TABLE [dbo].[Recete] CHECK CONSTRAINT [FK_Recete_Musteri]
GO
ALTER TABLE [dbo].[Satis]  WITH CHECK ADD  CONSTRAINT [FK_Sastis_Ilac] FOREIGN KEY([ilacID])
REFERENCES [dbo].[Ilac] ([ilacID])
GO
ALTER TABLE [dbo].[Satis] CHECK CONSTRAINT [FK_Sastis_Ilac]
GO
ALTER TABLE [dbo].[Satis]  WITH CHECK ADD  CONSTRAINT [FK_Sastis_Kullanici] FOREIGN KEY([calisanID])
REFERENCES [dbo].[Kullanici] ([kullaniciID])
GO
ALTER TABLE [dbo].[Satis] CHECK CONSTRAINT [FK_Sastis_Kullanici]
GO
ALTER TABLE [dbo].[Satis]  WITH CHECK ADD  CONSTRAINT [FK_Sastis_Musteri] FOREIGN KEY([musteriID])
REFERENCES [dbo].[Musteri] ([musteriID])
GO
ALTER TABLE [dbo].[Satis] CHECK CONSTRAINT [FK_Sastis_Musteri]
GO
USE [master]
GO
ALTER DATABASE [Eczane1DB] SET  READ_WRITE 
GO
