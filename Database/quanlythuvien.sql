USE [master]
GO
/****** Object:  Database [Quanlythuvien]    Script Date: 02/17/2019 19:58:27 ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'Quanlythuvien')
BEGIN
CREATE DATABASE [Quanlythuvien] 
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
/****** Object:  UserDefinedFunction [dbo].[UF_ChkHan]    Script Date: 02/17/2019 19:58:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UF_ChkHan]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE function [dbo].[UF_ChkHan](@sothe nvarchar(50))
returns nvarchar(50) 
begin
	declare @ketthuc date
	select @ketthuc=ngaykt from dbo.Thethuvien where sothe=@sothe
   if(@ketthuc<getdate())
      begin
			return @sothe
      end
      
  return ''F''
end
' 
END
GO
/****** Object:  Table [dbo].[Thethuvien]    Script Date: 02/17/2019 19:58:29 ******/
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
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Thethuvien]') AND name = N'IndexThethuvien')
CREATE NONCLUSTERED INDEX [IndexThethuvien] ON [dbo].[Thethuvien] 
(
	[sothe] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
INSERT [dbo].[Thethuvien] ([sothe], [ngaybd], [ngaykt], [ngaybd_hienthi], [ngaykt_hienthi], [ghichu]) VALUES (N'MATTV1', CAST(0x423F0B00 AS Date), CAST(0x5D3F0B00 AS Date), N'2/1/2019', N'2/28/2019', NULL)
INSERT [dbo].[Thethuvien] ([sothe], [ngaybd], [ngaykt], [ngaybd_hienthi], [ngaykt_hienthi], [ghichu]) VALUES (N'MATTV10', CAST(0x423F0B00 AS Date), CAST(0x5D3F0B00 AS Date), N'2/1/2019', N'2/28/2019', NULL)
INSERT [dbo].[Thethuvien] ([sothe], [ngaybd], [ngaykt], [ngaybd_hienthi], [ngaykt_hienthi], [ghichu]) VALUES (N'MATTV11', CAST(0x233F0B00 AS Date), CAST(0x413F0B00 AS Date), N'1/1/2019', N'1/31/2019', N'Het han')
INSERT [dbo].[Thethuvien] ([sothe], [ngaybd], [ngaykt], [ngaybd_hienthi], [ngaykt_hienthi], [ghichu]) VALUES (N'MATTV12', CAST(0x233F0B00 AS Date), CAST(0x413F0B00 AS Date), N'1/1/2019', N'1/31/2019', N'Het han')
INSERT [dbo].[Thethuvien] ([sothe], [ngaybd], [ngaykt], [ngaybd_hienthi], [ngaykt_hienthi], [ghichu]) VALUES (N'MATTV2', CAST(0x423F0B00 AS Date), CAST(0x5D3F0B00 AS Date), N'2/1/2019', N'2/28/2019', NULL)
INSERT [dbo].[Thethuvien] ([sothe], [ngaybd], [ngaykt], [ngaybd_hienthi], [ngaykt_hienthi], [ghichu]) VALUES (N'MATTV3', CAST(0x423F0B00 AS Date), CAST(0x5D3F0B00 AS Date), N'2/1/2019', N'2/28/2019', NULL)
INSERT [dbo].[Thethuvien] ([sothe], [ngaybd], [ngaykt], [ngaybd_hienthi], [ngaykt_hienthi], [ghichu]) VALUES (N'MATTV4', CAST(0x423F0B00 AS Date), CAST(0x5D3F0B00 AS Date), N'2/1/2019', N'2/28/2019', NULL)
INSERT [dbo].[Thethuvien] ([sothe], [ngaybd], [ngaykt], [ngaybd_hienthi], [ngaykt_hienthi], [ghichu]) VALUES (N'MATTV5', CAST(0x423F0B00 AS Date), CAST(0x5D3F0B00 AS Date), N'2/1/2019', N'2/28/2019', NULL)
INSERT [dbo].[Thethuvien] ([sothe], [ngaybd], [ngaykt], [ngaybd_hienthi], [ngaykt_hienthi], [ghichu]) VALUES (N'MATTV6', CAST(0x423F0B00 AS Date), CAST(0x5D3F0B00 AS Date), N'2/1/2019', N'2/28/2019', NULL)
INSERT [dbo].[Thethuvien] ([sothe], [ngaybd], [ngaykt], [ngaybd_hienthi], [ngaykt_hienthi], [ghichu]) VALUES (N'MATTV7', CAST(0x423F0B00 AS Date), CAST(0x5D3F0B00 AS Date), N'2/1/2019', N'2/28/2019', NULL)
INSERT [dbo].[Thethuvien] ([sothe], [ngaybd], [ngaykt], [ngaybd_hienthi], [ngaykt_hienthi], [ghichu]) VALUES (N'MATTV8', CAST(0x423F0B00 AS Date), CAST(0x5D3F0B00 AS Date), N'2/1/2019', N'2/28/2019', NULL)
INSERT [dbo].[Thethuvien] ([sothe], [ngaybd], [ngaykt], [ngaybd_hienthi], [ngaykt_hienthi], [ghichu]) VALUES (N'MATTV9', CAST(0x423F0B00 AS Date), CAST(0x5D3F0B00 AS Date), N'2/1/2019', N'2/28/2019', NULL)
/****** Object:  Trigger [UTr_Hanthe]    Script Date: 02/17/2019 19:58:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[UTr_Hanthe]'))
EXEC dbo.sp_executesql @statement = N'CREATE trigger [dbo].[UTr_Hanthe]
on [dbo].[Thethuvien]
after Insert,Update,Delete
as 
  begin 
	   Select *
			Into   #Temp
			From   dbo.Thethuvien

			Declare @sothe nvarchar(50)

			While ((Select Count(*) From #Temp) > 0)
			begin

			 Select Top 1 @sothe = sothe From #Temp

				declare @check nvarchar(50)
				select @check=dbo.UF_ChkHan(@sothe)
				if(@check!=''F'')
					begin
						update dbo.Thethuvien set ghichu=''Het han'' where sothe=@check
					end
			
			Delete #Temp Where @sothe = sothe
			end
  end
'
GO
/****** Object:  Table [dbo].[Docgia]    Script Date: 02/17/2019 19:58:29 ******/
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
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Docgia]') AND name = N'IndexDocgia')
CREATE NONCLUSTERED INDEX [IndexDocgia] ON [dbo].[Docgia] 
(
	[ma_docgia] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
INSERT [dbo].[Docgia] ([ma_docgia], [ten_docgia], [diachi], [sothe]) VALUES (118, N'Nguyễn Oánh', N'Hà Nội', N'MATTV1')
INSERT [dbo].[Docgia] ([ma_docgia], [ten_docgia], [diachi], [sothe]) VALUES (128, N'Lao Văn Động', N'Hà Nội', N'MATTV4')
INSERT [dbo].[Docgia] ([ma_docgia], [ten_docgia], [diachi], [sothe]) VALUES (233, N'Trần Lê Quang', N'Hà Nội', N'MATTV9')
INSERT [dbo].[Docgia] ([ma_docgia], [ten_docgia], [diachi], [sothe]) VALUES (354, N'Phạm Chí Thành', N'Hà Nội', N'MATTV10')
INSERT [dbo].[Docgia] ([ma_docgia], [ten_docgia], [diachi], [sothe]) VALUES (383, N'Đỗ Thị Thu Trang', N'Hà Nội', N'MATTV2')
INSERT [dbo].[Docgia] ([ma_docgia], [ten_docgia], [diachi], [sothe]) VALUES (387, N'Lê Văn Bách', N'Hà Nội', N'MATTV5')
INSERT [dbo].[Docgia] ([ma_docgia], [ten_docgia], [diachi], [sothe]) VALUES (417, N'Giáp Minh Hoàng', N'Hà Nội', N'MATTV7')
INSERT [dbo].[Docgia] ([ma_docgia], [ten_docgia], [diachi], [sothe]) VALUES (611, N'Nguyễn Văn Thiều', N'Hà Nội', N'MATTV8')
INSERT [dbo].[Docgia] ([ma_docgia], [ten_docgia], [diachi], [sothe]) VALUES (756, N'Bùi Việt Bắc', N'Hà Nội', N'MATTV3')
INSERT [dbo].[Docgia] ([ma_docgia], [ten_docgia], [diachi], [sothe]) VALUES (858, N'Nguyễn Văn Nhật', N'Hà Nội', N'MATTV6')
/****** Object:  Table [dbo].[Nhaxuatban]    Script Date: 02/17/2019 19:58:29 ******/
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
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Nhaxuatban]') AND name = N'IndexNXB')
CREATE NONCLUSTERED INDEX [IndexNXB] ON [dbo].[Nhaxuatban] 
(
	[ma_nhaxuatban] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
INSERT [dbo].[Nhaxuatban] ([ma_nhaxuatban], [ten_nhaxuatban], [diachi], [email], [nguoidaidien]) VALUES (N'NXB1', N'Nhà xuất bản Chính trị Quốc gia', N'Hà Nội', N'NChinhtriQocgia@gmail.com', N'Phạm Chí Thành')
INSERT [dbo].[Nhaxuatban] ([ma_nhaxuatban], [ten_nhaxuatban], [diachi], [email], [nguoidaidien]) VALUES (N'NXB10', N'Nhà xuất bản Y học', N'Hà Nội', N'NxbYhoc@gmail.com', N'Đỗ Thị Thu Trang')
INSERT [dbo].[Nhaxuatban] ([ma_nhaxuatban], [ten_nhaxuatban], [diachi], [email], [nguoidaidien]) VALUES (N'NXB2', N'Nhà xuất bản Thanh niên', N'Hà Nội', N'nxbthanhnien@gmail.com', N'Nguyễn Trường')
INSERT [dbo].[Nhaxuatban] ([ma_nhaxuatban], [ten_nhaxuatban], [diachi], [email], [nguoidaidien]) VALUES (N'NXB3', N'Nhà xuất bản Lao động', N'Hà Nội', N'nxblaodong@yahoo.com', N'Lao Văn Động')
INSERT [dbo].[Nhaxuatban] ([ma_nhaxuatban], [ten_nhaxuatban], [diachi], [email], [nguoidaidien]) VALUES (N'NXB4', N'Nhà xuất bản Hồng Đức', N'Hà Nội', N'nxbHogduc@gmail.com', N'Bùi Việt Bắc')
INSERT [dbo].[Nhaxuatban] ([ma_nhaxuatban], [ten_nhaxuatban], [diachi], [email], [nguoidaidien]) VALUES (N'NXB5', N'Nhà xuất bản Tôn giáo', N'Hà Nội', N'Nhaxuatbantongiao@gmail.com ', N'Nguyễn Công Oánh')
INSERT [dbo].[Nhaxuatban] ([ma_nhaxuatban], [ten_nhaxuatban], [diachi], [email], [nguoidaidien]) VALUES (N'NXB6', N'Nhà xuất bản Kim Đồng', N'Hà Nội', N'nxbKimdong@gmail.com', N'Phạm Quang Vinh')
INSERT [dbo].[Nhaxuatban] ([ma_nhaxuatban], [ten_nhaxuatban], [diachi], [email], [nguoidaidien]) VALUES (N'NXB7', N'Nhà xuất bản Trẻ', N'Hà Nội', N'tretrau@gmail.com', N'Nguyễn Minh Nhật')
INSERT [dbo].[Nhaxuatban] ([ma_nhaxuatban], [ten_nhaxuatban], [diachi], [email], [nguoidaidien]) VALUES (N'NXB8', N'Nhà xuất bản Hội nhà văn', N'Hà Nội', N'nxbhoinhavan@gmail.com', N'Nguyễn Quang Thiều')
INSERT [dbo].[Nhaxuatban] ([ma_nhaxuatban], [ten_nhaxuatban], [diachi], [email], [nguoidaidien]) VALUES (N'NXB9', N'Nhà xuất bản Giáo dục', N'Hà Nội', N'nxbgd@moet.edu.vn', N'Hoàng Lê Bách')
/****** Object:  Table [dbo].[Theloai]    Script Date: 02/17/2019 19:58:29 ******/
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
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Theloai]') AND name = N'IndexTheloai')
CREATE NONCLUSTERED INDEX [IndexTheloai] ON [dbo].[Theloai] 
(
	[ma_theloai] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
INSERT [dbo].[Theloai] ([ma_theloai], [ten_theloai], [ghichu]) VALUES (N'TL1', N'Ngoại ngữ', N'')
INSERT [dbo].[Theloai] ([ma_theloai], [ten_theloai], [ghichu]) VALUES (N'TL10', N'Chính trị', N'')
INSERT [dbo].[Theloai] ([ma_theloai], [ten_theloai], [ghichu]) VALUES (N'TL2', N'Văn học', N'')
INSERT [dbo].[Theloai] ([ma_theloai], [ten_theloai], [ghichu]) VALUES (N'TL3', N'Khoa học-Kỹ thuật', N'')
INSERT [dbo].[Theloai] ([ma_theloai], [ten_theloai], [ghichu]) VALUES (N'TL4', N'Kinh tế', N'')
INSERT [dbo].[Theloai] ([ma_theloai], [ten_theloai], [ghichu]) VALUES (N'TL5', N'Thiếu nhi', N'')
INSERT [dbo].[Theloai] ([ma_theloai], [ten_theloai], [ghichu]) VALUES (N'TL6', N'Công nghệ thông tin', N'')
INSERT [dbo].[Theloai] ([ma_theloai], [ten_theloai], [ghichu]) VALUES (N'TL7', N'Kiến trúc-Xây dựng', N'')
INSERT [dbo].[Theloai] ([ma_theloai], [ten_theloai], [ghichu]) VALUES (N'TL8', N'Y học', NULL)
INSERT [dbo].[Theloai] ([ma_theloai], [ten_theloai], [ghichu]) VALUES (N'TL9', N'Văn hóa-Tôn giáo', NULL)
/****** Object:  Table [dbo].[Sach]    Script Date: 02/17/2019 19:58:29 ******/
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
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Sach]') AND name = N'IndexSach')
CREATE NONCLUSTERED INDEX [IndexSach] ON [dbo].[Sach] 
(
	[ma_sach] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
INSERT [dbo].[Sach] ([ma_sach], [ten_sach], [ma_theloai], [ma_nhaxuatban]) VALUES (N'TL10NXB131', N'Tư tưởng Hồ Chí Minh', N'TL10', N'NXB1')
INSERT [dbo].[Sach] ([ma_sach], [ten_sach], [ma_theloai], [ma_nhaxuatban]) VALUES (N'TL10NXB132', N'Đường lối Cách mạng Việt Nam', N'TL10', N'NXB1')
INSERT [dbo].[Sach] ([ma_sach], [ten_sach], [ma_theloai], [ma_nhaxuatban]) VALUES (N'TL1NXB426', N'Ngữ pháp Tiếng Anh Cơ bản', N'TL1', N'NXB9')
INSERT [dbo].[Sach] ([ma_sach], [ten_sach], [ma_theloai], [ma_nhaxuatban]) VALUES (N'TL1NXB724', N'English Grammar in Use part 1', N'TL1', N'NXB7')
INSERT [dbo].[Sach] ([ma_sach], [ten_sach], [ma_theloai], [ma_nhaxuatban]) VALUES (N'TL1NXB725', N'English Grammar in Use part 2', N'TL1', N'NXB7')
INSERT [dbo].[Sach] ([ma_sach], [ten_sach], [ma_theloai], [ma_nhaxuatban]) VALUES (N'TL1NXB923', N'Giáo trình Tiếng Anh', N'TL1', N'NXB9')
INSERT [dbo].[Sach] ([ma_sach], [ten_sach], [ma_theloai], [ma_nhaxuatban]) VALUES (N'TL2NXB248', N'Nhà giả kim', N'TL2', N'NXB2')
INSERT [dbo].[Sach] ([ma_sach], [ten_sach], [ma_theloai], [ma_nhaxuatban]) VALUES (N'TL2NXB449', N'Bố già', N'TL2', N'NXB4')
INSERT [dbo].[Sach] ([ma_sach], [ten_sach], [ma_theloai], [ma_nhaxuatban]) VALUES (N'TL2NXB61', N'Dế mèn phiêu lưu ký', N'TL2', N'NXB6')
INSERT [dbo].[Sach] ([ma_sach], [ten_sach], [ma_theloai], [ma_nhaxuatban]) VALUES (N'TL2NXB638', N'Đảo giấu vàng', N'TL2', N'NXB6')
INSERT [dbo].[Sach] ([ma_sach], [ten_sach], [ma_theloai], [ma_nhaxuatban]) VALUES (N'TL2NXB65', N'Nói khác để sống khác', N'TL2', N'NXB6')
INSERT [dbo].[Sach] ([ma_sach], [ten_sach], [ma_theloai], [ma_nhaxuatban]) VALUES (N'TL2NXB73', N'Dưới tán rừng Trăm Mẫu', N'TL2', N'NXB7')
INSERT [dbo].[Sach] ([ma_sach], [ten_sach], [ma_theloai], [ma_nhaxuatban]) VALUES (N'TL2NXB74', N'Cây vĩ cầm của Ave Maria ', N'TL2', N'NXB7')
INSERT [dbo].[Sach] ([ma_sach], [ten_sach], [ma_theloai], [ma_nhaxuatban]) VALUES (N'TL2NXB846', N'Không gia đình', N'TL2', N'NXB8')
INSERT [dbo].[Sach] ([ma_sach], [ten_sach], [ma_theloai], [ma_nhaxuatban]) VALUES (N'TL2NXB850', N'Từ điển văn học Việt Nam', N'TL2', N'NXB8')
INSERT [dbo].[Sach] ([ma_sach], [ten_sach], [ma_theloai], [ma_nhaxuatban]) VALUES (N'TL2NXB86', N'Đồi gai', N'TL2', N'NXB8')
INSERT [dbo].[Sach] ([ma_sach], [ten_sach], [ma_theloai], [ma_nhaxuatban]) VALUES (N'TL3NXB233', N'Từ điển khoa học và kỹ thuật', N'TL3', N'NXB2')
INSERT [dbo].[Sach] ([ma_sach], [ten_sach], [ma_theloai], [ma_nhaxuatban]) VALUES (N'TL3NXB320', N'Lược sử thời gian', N'TL3', N'NXB3')
INSERT [dbo].[Sach] ([ma_sach], [ten_sach], [ma_theloai], [ma_nhaxuatban]) VALUES (N'TL3NXB421', N'Kỹ thuật phản ứng', N'TL3', N'NXB4')
INSERT [dbo].[Sach] ([ma_sach], [ten_sach], [ma_theloai], [ma_nhaxuatban]) VALUES (N'TL3NXB621', N'Ngôi nhà khoa học', N'TL3', N'NXB6')
INSERT [dbo].[Sach] ([ma_sach], [ten_sach], [ma_theloai], [ma_nhaxuatban]) VALUES (N'TL3NXB622', N'Những câu hỏi khoa học lý thú', N'TL3', N'NXB6')
INSERT [dbo].[Sach] ([ma_sach], [ten_sach], [ma_theloai], [ma_nhaxuatban]) VALUES (N'TL4NXB245', N'Nghệ thuật đàm phán', N'TL4', N'NXB2')
INSERT [dbo].[Sach] ([ma_sach], [ten_sach], [ma_theloai], [ma_nhaxuatban]) VALUES (N'TL4NXB342', N'Kinh tế học', N'TL4', N'NXB3')
INSERT [dbo].[Sach] ([ma_sach], [ten_sach], [ma_theloai], [ma_nhaxuatban]) VALUES (N'TL4NXB343', N'Chiến lược cạnh tranh', N'TL4', N'NXB3')
INSERT [dbo].[Sach] ([ma_sach], [ten_sach], [ma_theloai], [ma_nhaxuatban]) VALUES (N'TL4NXB441', N'Thế giới phẳng', N'TL4', N'NXB4')
INSERT [dbo].[Sach] ([ma_sach], [ten_sach], [ma_theloai], [ma_nhaxuatban]) VALUES (N'TL4NXB444', N'Mô hình kinh doanh nhóm ', N'TL4', N'NXB4')
INSERT [dbo].[Sach] ([ma_sach], [ten_sach], [ma_theloai], [ma_nhaxuatban]) VALUES (N'TL4NXB747', N'Cẩm nang Kinh tế học', N'TL4', N'NXB7')
INSERT [dbo].[Sach] ([ma_sach], [ten_sach], [ma_theloai], [ma_nhaxuatban]) VALUES (N'TL5NXB639', N'Truyện cổ Andersen', N'TL5', N'NXB6')
INSERT [dbo].[Sach] ([ma_sach], [ten_sach], [ma_theloai], [ma_nhaxuatban]) VALUES (N'TL5NXB640', N'Cổ tích Việt Nam chọn lọc', N'TL5', N'NXB6')
INSERT [dbo].[Sach] ([ma_sach], [ten_sach], [ma_theloai], [ma_nhaxuatban]) VALUES (N'TL5NXB737', N'Bách khoa tri thức thiếu nhi', N'TL5', N'NXB7')
INSERT [dbo].[Sach] ([ma_sach], [ten_sach], [ma_theloai], [ma_nhaxuatban]) VALUES (N'TL6NXB213', N'Hacker lược sử', N'TL6', N'NXB2')
INSERT [dbo].[Sach] ([ma_sach], [ten_sach], [ma_theloai], [ma_nhaxuatban]) VALUES (N'TL6NXB216', N'Chiến lược dữ liệu', N'TL6', N'NXB2')
INSERT [dbo].[Sach] ([ma_sach], [ten_sach], [ma_theloai], [ma_nhaxuatban]) VALUES (N'TL6NXB219', N'Tin học văn phòng', N'TL6', N'NXB2')
INSERT [dbo].[Sach] ([ma_sach], [ten_sach], [ma_theloai], [ma_nhaxuatban]) VALUES (N'TL6NXB417', N'Tạo Website bằng hướng Database bằng PHP và MySQL', N'TL6', N'NXB4')
INSERT [dbo].[Sach] ([ma_sach], [ten_sach], [ma_theloai], [ma_nhaxuatban]) VALUES (N'TL6NXB714', N'Nghệ thuật ẩn mình', N'TL6', N'NXB7')
INSERT [dbo].[Sach] ([ma_sach], [ten_sach], [ma_theloai], [ma_nhaxuatban]) VALUES (N'TL6NXB715', N'Gián điệp mạng', N'TL6', N'NXB7')
INSERT [dbo].[Sach] ([ma_sach], [ten_sach], [ma_theloai], [ma_nhaxuatban]) VALUES (N'TL6NXB718', N'Giáo trình kĩ thuật lập trình C cơ bản và nâng cao', N'TL6', N'NXB7')
INSERT [dbo].[Sach] ([ma_sach], [ten_sach], [ma_theloai], [ma_nhaxuatban]) VALUES (N'TL7NXB211', N'Thiết kế kiến trúc', N'TL7', N'NXB2')
INSERT [dbo].[Sach] ([ma_sach], [ten_sach], [ma_theloai], [ma_nhaxuatban]) VALUES (N'TL7NXB312', N'Những thành phố đã mất hấp dẫn', N'TL7', N'NXB3')
INSERT [dbo].[Sach] ([ma_sach], [ten_sach], [ma_theloai], [ma_nhaxuatban]) VALUES (N'TL7NXB37', N'Thiết kế chi tiết nhà ở', N'TL7', N'NXB3')
INSERT [dbo].[Sach] ([ma_sach], [ten_sach], [ma_theloai], [ma_nhaxuatban]) VALUES (N'TL7NXB38', N'Thiết kế phòng khách', N'TL7', N'NXB3')
INSERT [dbo].[Sach] ([ma_sach], [ten_sach], [ma_theloai], [ma_nhaxuatban]) VALUES (N'TL7NXB39', N'Những tòa lâu đài huy hoàng', N'TL7', N'NXB3')
INSERT [dbo].[Sach] ([ma_sach], [ten_sach], [ma_theloai], [ma_nhaxuatban]) VALUES (N'TL7NXB410', N'Thiết kế cầu thang thư phòng', N'TL7', N'NXB4')
INSERT [dbo].[Sach] ([ma_sach], [ten_sach], [ma_theloai], [ma_nhaxuatban]) VALUES (N'TL8NXB1034', N'Y học cổ truyền trên thế giới', N'TL8', N'NXB10')
INSERT [dbo].[Sach] ([ma_sach], [ten_sach], [ma_theloai], [ma_nhaxuatban]) VALUES (N'TL8NXB1035', N'Dược thư Quốc gia Việt Nam', N'TL8', N'NXB10')
INSERT [dbo].[Sach] ([ma_sach], [ten_sach], [ma_theloai], [ma_nhaxuatban]) VALUES (N'TL8NXB436', N'Những bài thuốc dân gian chữa bệnh hiệu quả', N'TL8', N'NXB4')
INSERT [dbo].[Sach] ([ma_sach], [ten_sach], [ma_theloai], [ma_nhaxuatban]) VALUES (N'TL9NXB527', N'Bí thuật Đạo giáo', N'TL9', N'NXB5')
INSERT [dbo].[Sach] ([ma_sach], [ten_sach], [ma_theloai], [ma_nhaxuatban]) VALUES (N'TL9NXB528', N'10 điều Không của người xuất gia', N'TL9', N'NXB5')
INSERT [dbo].[Sach] ([ma_sach], [ten_sach], [ma_theloai], [ma_nhaxuatban]) VALUES (N'TL9NXB529', N'Sức mạnh của lòng bao dung', N'TL9', N'NXB5')
INSERT [dbo].[Sach] ([ma_sach], [ten_sach], [ma_theloai], [ma_nhaxuatban]) VALUES (N'TL9NXB530', N'Tôn giáo phương Đông', N'TL9', N'NXB5')
/****** Object:  Table [dbo].[Muontra]    Script Date: 02/17/2019 19:58:29 ******/
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
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Muontra]') AND name = N'IndexMuontra')
CREATE NONCLUSTERED INDEX [IndexMuontra] ON [dbo].[Muontra] 
(
	[ma_muontra] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
INSERT [dbo].[Muontra] ([ma_muontra], [ma_docgia], [ma_sach], [ngaymuon], [ngaytra], [datra], [ghichu], [ngaymuon_hienthi], [ngaytra_hienthi]) VALUES (N'06300b58-38d5-4a25-bc8a-2d9096e1c844', 611, N'TL2NXB846', CAST(0x423F0B00 AS Date), CAST(0x523F0B00 AS Date), 1, N'da tra sach', N'2/1/2019', N'2/17/2019')
INSERT [dbo].[Muontra] ([ma_muontra], [ma_docgia], [ma_sach], [ngaymuon], [ngaytra], [datra], [ghichu], [ngaymuon_hienthi], [ngaytra_hienthi]) VALUES (N'53565988-2517-406a-95f2-9516c99a2dd2', 858, N'TL3NXB320', CAST(0x493F0B00 AS Date), NULL, 0, N'', N'2/8/2019', N'')
INSERT [dbo].[Muontra] ([ma_muontra], [ma_docgia], [ma_sach], [ngaymuon], [ngaytra], [datra], [ghichu], [ngaymuon_hienthi], [ngaytra_hienthi]) VALUES (N'6f7d0eb9-fd97-48c5-b2e9-f31e8f588c01', 611, N'TL8NXB1034', CAST(0x433F0B00 AS Date), NULL, 0, N'', N'2/2/2019', N'')
INSERT [dbo].[Muontra] ([ma_muontra], [ma_docgia], [ma_sach], [ngaymuon], [ngaytra], [datra], [ghichu], [ngaymuon_hienthi], [ngaytra_hienthi]) VALUES (N'86b47899-a929-4723-a501-828ec1c37c7b', 417, N'TL2NXB850', CAST(0x423F0B00 AS Date), NULL, 0, N'', N'2/1/2019', N'')
INSERT [dbo].[Muontra] ([ma_muontra], [ma_docgia], [ma_sach], [ngaymuon], [ngaytra], [datra], [ghichu], [ngaymuon_hienthi], [ngaytra_hienthi]) VALUES (N'ae9cfa1f-327a-4e55-80b2-ca0ef6934267', 118, N'TL10NXB131', CAST(0x433F0B00 AS Date), NULL, 0, N'', N'2/2/2019', N'')
INSERT [dbo].[Muontra] ([ma_muontra], [ma_docgia], [ma_sach], [ngaymuon], [ngaytra], [datra], [ghichu], [ngaymuon_hienthi], [ngaytra_hienthi]) VALUES (N'bc815d9d-1795-4bfd-a05e-6706d55f9416', 858, N'TL8NXB1035', CAST(0x433F0B00 AS Date), NULL, 0, N'', N'2/2/2019', N'')
INSERT [dbo].[Muontra] ([ma_muontra], [ma_docgia], [ma_sach], [ngaymuon], [ngaytra], [datra], [ghichu], [ngaymuon_hienthi], [ngaytra_hienthi]) VALUES (N'c0b7676e-0e4f-4e90-9b40-6a1987573e3d', 118, N'TL10NXB132', CAST(0x433F0B00 AS Date), NULL, 0, N'', N'2/2/2019', N'')
INSERT [dbo].[Muontra] ([ma_muontra], [ma_docgia], [ma_sach], [ngaymuon], [ngaytra], [datra], [ghichu], [ngaymuon_hienthi], [ngaytra_hienthi]) VALUES (N'ca1c8f5f-be96-47d2-a321-e0d735e6dd18', 233, N'TL2NXB73', CAST(0x463F0B00 AS Date), NULL, 0, N'', N'2/5/2019', N'')
INSERT [dbo].[Muontra] ([ma_muontra], [ma_docgia], [ma_sach], [ngaymuon], [ngaytra], [datra], [ghichu], [ngaymuon_hienthi], [ngaytra_hienthi]) VALUES (N'cbae6906-f2a0-4dc1-a919-e09b625db36c', 354, N'TL2NXB74', CAST(0x4A3F0B00 AS Date), NULL, 0, N'', N'2/9/2019', N'')
INSERT [dbo].[Muontra] ([ma_muontra], [ma_docgia], [ma_sach], [ngaymuon], [ngaytra], [datra], [ghichu], [ngaymuon_hienthi], [ngaytra_hienthi]) VALUES (N'd528d164-4703-4bd1-b6ce-2b37a2bed4f3', 417, N'TL2NXB86', CAST(0x443F0B00 AS Date), NULL, 0, N'', N'2/3/2019', N'')
/****** Object:  ForeignKey [fk_Docgia_sothe]    Script Date: 02/17/2019 19:58:29 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_Docgia_sothe]') AND parent_object_id = OBJECT_ID(N'[dbo].[Docgia]'))
ALTER TABLE [dbo].[Docgia]  WITH CHECK ADD  CONSTRAINT [fk_Docgia_sothe] FOREIGN KEY([sothe])
REFERENCES [dbo].[Thethuvien] ([sothe])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_Docgia_sothe]') AND parent_object_id = OBJECT_ID(N'[dbo].[Docgia]'))
ALTER TABLE [dbo].[Docgia] CHECK CONSTRAINT [fk_Docgia_sothe]
GO
/****** Object:  ForeignKey [fk_Muontra_ma_docgia]    Script Date: 02/17/2019 19:58:29 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_Muontra_ma_docgia]') AND parent_object_id = OBJECT_ID(N'[dbo].[Muontra]'))
ALTER TABLE [dbo].[Muontra]  WITH CHECK ADD  CONSTRAINT [fk_Muontra_ma_docgia] FOREIGN KEY([ma_docgia])
REFERENCES [dbo].[Docgia] ([ma_docgia])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_Muontra_ma_docgia]') AND parent_object_id = OBJECT_ID(N'[dbo].[Muontra]'))
ALTER TABLE [dbo].[Muontra] CHECK CONSTRAINT [fk_Muontra_ma_docgia]
GO
/****** Object:  ForeignKey [fk_Muontra_ma_sach]    Script Date: 02/17/2019 19:58:29 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_Muontra_ma_sach]') AND parent_object_id = OBJECT_ID(N'[dbo].[Muontra]'))
ALTER TABLE [dbo].[Muontra]  WITH CHECK ADD  CONSTRAINT [fk_Muontra_ma_sach] FOREIGN KEY([ma_sach])
REFERENCES [dbo].[Sach] ([ma_sach])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_Muontra_ma_sach]') AND parent_object_id = OBJECT_ID(N'[dbo].[Muontra]'))
ALTER TABLE [dbo].[Muontra] CHECK CONSTRAINT [fk_Muontra_ma_sach]
GO
/****** Object:  ForeignKey [fk_Sach_ma_nxb]    Script Date: 02/17/2019 19:58:29 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_Sach_ma_nxb]') AND parent_object_id = OBJECT_ID(N'[dbo].[Sach]'))
ALTER TABLE [dbo].[Sach]  WITH CHECK ADD  CONSTRAINT [fk_Sach_ma_nxb] FOREIGN KEY([ma_nhaxuatban])
REFERENCES [dbo].[Nhaxuatban] ([ma_nhaxuatban])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_Sach_ma_nxb]') AND parent_object_id = OBJECT_ID(N'[dbo].[Sach]'))
ALTER TABLE [dbo].[Sach] CHECK CONSTRAINT [fk_Sach_ma_nxb]
GO
/****** Object:  ForeignKey [fk_Sach_ma_theloai]    Script Date: 02/17/2019 19:58:29 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_Sach_ma_theloai]') AND parent_object_id = OBJECT_ID(N'[dbo].[Sach]'))
ALTER TABLE [dbo].[Sach]  WITH CHECK ADD  CONSTRAINT [fk_Sach_ma_theloai] FOREIGN KEY([ma_theloai])
REFERENCES [dbo].[Theloai] ([ma_theloai])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_Sach_ma_theloai]') AND parent_object_id = OBJECT_ID(N'[dbo].[Sach]'))
ALTER TABLE [dbo].[Sach] CHECK CONSTRAINT [fk_Sach_ma_theloai]
GO
