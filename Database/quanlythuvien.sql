USE [master]
GO
/****** Object:  Database [Quanlythuvien]    Script Date: 01/31/2019 21:59:10 ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'Quanlythuvien')
BEGIN
CREATE DATABASE [Quanlythuvien] ON  PRIMARY 
( NAME = N'Quanlythuvien', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\Quanlythuvien.mdf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Quanlythuvien_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\Quanlythuvien_log.LDF' , SIZE = 768KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
END
GO
ALTER DATABASE [Quanlythuvien] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Quanlythuvien].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Quanlythuvien] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [Quanlythuvien] SET ANSI_NULLS OFF
GO
ALTER DATABASE [Quanlythuvien] SET ANSI_PADDING OFF
GO
ALTER DATABASE [Quanlythuvien] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [Quanlythuvien] SET ARITHABORT OFF
GO
ALTER DATABASE [Quanlythuvien] SET AUTO_CLOSE ON
GO
ALTER DATABASE [Quanlythuvien] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [Quanlythuvien] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [Quanlythuvien] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [Quanlythuvien] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [Quanlythuvien] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [Quanlythuvien] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [Quanlythuvien] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [Quanlythuvien] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [Quanlythuvien] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [Quanlythuvien] SET  ENABLE_BROKER
GO
ALTER DATABASE [Quanlythuvien] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [Quanlythuvien] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [Quanlythuvien] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [Quanlythuvien] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [Quanlythuvien] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [Quanlythuvien] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [Quanlythuvien] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [Quanlythuvien] SET  READ_WRITE
GO
ALTER DATABASE [Quanlythuvien] SET RECOVERY SIMPLE
GO
ALTER DATABASE [Quanlythuvien] SET  MULTI_USER
GO
ALTER DATABASE [Quanlythuvien] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [Quanlythuvien] SET DB_CHAINING OFF
GO
USE [Quanlythuvien]
GO
/****** Object:  Table [dbo].[Nhaxuatban]    Script Date: 01/31/2019 21:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Nhaxuatban]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Nhaxuatban](
	[ma_nhaxuatban] [nvarchar](50) NOT NULL,
	[ten_nhaxuatban] [nvarchar](50) NOT NULL,
	[diachi] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NULL,
	[nguoidaidien] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ma_nhaxuatban] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Thethuvien]    Script Date: 01/31/2019 21:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Thethuvien]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Thethuvien](
	[sothe] [nvarchar](50) NOT NULL,
	[ngaybd] [date] NOT NULL,
	[ngaykt] [date] NOT NULL,
	[ngaybd_hienthi] [nvarchar](50) NULL,
	[ngaykt_hienthi] [nvarchar](50) NULL,
	[ghichu] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[sothe] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Theloai]    Script Date: 01/31/2019 21:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Theloai]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Theloai](
	[ma_theloai] [nvarchar](50) NOT NULL,
	[ten_theloai] [nvarchar](50) NOT NULL,
	[ghichu] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[ma_theloai] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Sach]    Script Date: 01/31/2019 21:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sach]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Sach](
	[ma_sach] [nvarchar](50) NOT NULL,
	[ten_sach] [nvarchar](50) NOT NULL,
	[ma_theloai] [nvarchar](50) NULL,
	[ma_nhaxuatban] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ma_sach] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Docgia]    Script Date: 01/31/2019 21:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Docgia]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Docgia](
	[ma_docgia] [int] NOT NULL,
	[ten_docgia] [nvarchar](50) NOT NULL,
	[diachi] [nvarchar](50) NOT NULL,
	[sothe] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ma_docgia] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Muontra]    Script Date: 01/31/2019 21:59:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Muontra]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Muontra](
	[ma_muontra] [nvarchar](255) NOT NULL,
	[ma_docgia] [int] NULL,
	[ma_sach] [nvarchar](50) NULL,
	[ngaymuon] [date] NOT NULL,
	[ngaytra] [date] NULL,
	[datra] [bit] NOT NULL,
	[ghichu] [text] NULL,
	[ngaymuon_hienthi] [nvarchar](50) NULL,
	[ngaytra_hienthi] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ma_muontra] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  ForeignKey [fk_Sach_ma_nxb]    Script Date: 01/31/2019 21:59:11 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_Sach_ma_nxb]') AND parent_object_id = OBJECT_ID(N'[dbo].[Sach]'))
ALTER TABLE [dbo].[Sach]  WITH CHECK ADD  CONSTRAINT [fk_Sach_ma_nxb] FOREIGN KEY([ma_nhaxuatban])
REFERENCES [dbo].[Nhaxuatban] ([ma_nhaxuatban])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_Sach_ma_nxb]') AND parent_object_id = OBJECT_ID(N'[dbo].[Sach]'))
ALTER TABLE [dbo].[Sach] CHECK CONSTRAINT [fk_Sach_ma_nxb]
GO
/****** Object:  ForeignKey [fk_Sach_ma_theloai]    Script Date: 01/31/2019 21:59:11 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_Sach_ma_theloai]') AND parent_object_id = OBJECT_ID(N'[dbo].[Sach]'))
ALTER TABLE [dbo].[Sach]  WITH CHECK ADD  CONSTRAINT [fk_Sach_ma_theloai] FOREIGN KEY([ma_theloai])
REFERENCES [dbo].[Theloai] ([ma_theloai])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_Sach_ma_theloai]') AND parent_object_id = OBJECT_ID(N'[dbo].[Sach]'))
ALTER TABLE [dbo].[Sach] CHECK CONSTRAINT [fk_Sach_ma_theloai]
GO
/****** Object:  ForeignKey [fk_Docgia_sothe]    Script Date: 01/31/2019 21:59:11 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_Docgia_sothe]') AND parent_object_id = OBJECT_ID(N'[dbo].[Docgia]'))
ALTER TABLE [dbo].[Docgia]  WITH CHECK ADD  CONSTRAINT [fk_Docgia_sothe] FOREIGN KEY([sothe])
REFERENCES [dbo].[Thethuvien] ([sothe])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_Docgia_sothe]') AND parent_object_id = OBJECT_ID(N'[dbo].[Docgia]'))
ALTER TABLE [dbo].[Docgia] CHECK CONSTRAINT [fk_Docgia_sothe]
GO
/****** Object:  ForeignKey [fk_Muontra_ma_docgia]    Script Date: 01/31/2019 21:59:12 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_Muontra_ma_docgia]') AND parent_object_id = OBJECT_ID(N'[dbo].[Muontra]'))
ALTER TABLE [dbo].[Muontra]  WITH CHECK ADD  CONSTRAINT [fk_Muontra_ma_docgia] FOREIGN KEY([ma_docgia])
REFERENCES [dbo].[Docgia] ([ma_docgia])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_Muontra_ma_docgia]') AND parent_object_id = OBJECT_ID(N'[dbo].[Muontra]'))
ALTER TABLE [dbo].[Muontra] CHECK CONSTRAINT [fk_Muontra_ma_docgia]
GO
/****** Object:  ForeignKey [fk_Muontra_ma_sach]    Script Date: 01/31/2019 21:59:12 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_Muontra_ma_sach]') AND parent_object_id = OBJECT_ID(N'[dbo].[Muontra]'))
ALTER TABLE [dbo].[Muontra]  WITH CHECK ADD  CONSTRAINT [fk_Muontra_ma_sach] FOREIGN KEY([ma_sach])
REFERENCES [dbo].[Sach] ([ma_sach])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_Muontra_ma_sach]') AND parent_object_id = OBJECT_ID(N'[dbo].[Muontra]'))
ALTER TABLE [dbo].[Muontra] CHECK CONSTRAINT [fk_Muontra_ma_sach]
GO
