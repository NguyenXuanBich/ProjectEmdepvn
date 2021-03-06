USE [master]
GO
/****** Object:  Database [emdepvn]    Script Date: 6/13/2017 6:55:27 AM ******/
CREATE DATABASE [emdepvn]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'emdepvn', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\emdepvn.mdf' , SIZE = 6336KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'emdepvn_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\emdepvn_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [emdepvn] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [emdepvn].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [emdepvn] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [emdepvn] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [emdepvn] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [emdepvn] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [emdepvn] SET ARITHABORT OFF 
GO
ALTER DATABASE [emdepvn] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [emdepvn] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [emdepvn] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [emdepvn] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [emdepvn] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [emdepvn] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [emdepvn] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [emdepvn] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [emdepvn] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [emdepvn] SET  DISABLE_BROKER 
GO
ALTER DATABASE [emdepvn] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [emdepvn] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [emdepvn] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [emdepvn] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [emdepvn] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [emdepvn] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [emdepvn] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [emdepvn] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [emdepvn] SET  MULTI_USER 
GO
ALTER DATABASE [emdepvn] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [emdepvn] SET DB_CHAINING OFF 
GO
ALTER DATABASE [emdepvn] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [emdepvn] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [emdepvn] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'emdepvn', N'ON'
GO
USE [emdepvn]
GO
/****** Object:  Table [dbo].[db_ChatLieu]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[db_ChatLieu](
	[ChatLieuID] [int] IDENTITY(1,1) NOT NULL,
	[TenChatLieu] [nvarchar](50) NULL,
 CONSTRAINT [PK_db_ChatLieu] PRIMARY KEY CLUSTERED 
(
	[ChatLieuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[db_ChiTietDonDatHang]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[db_ChiTietDonDatHang](
	[MaSP] [int] NOT NULL,
	[MaDonDatHang] [int] NOT NULL,
	[SoLuongDat] [int] NULL,
	[DonGiaDat] [float] NULL,
 CONSTRAINT [PK_db_ChiTietDonDatHang] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC,
	[MaDonDatHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[db_ChiTietDonHang]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[db_ChiTietDonHang](
	[MaHD] [int] NOT NULL,
	[MaSP] [int] NOT NULL,
	[SoLuong] [int] NULL,
	[DonGia] [float] NULL,
 CONSTRAINT [PK_db_ChiTietDonHang_1] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[db_DangKy]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[db_DangKy](
	[TenDangNhap] [varchar](50) NOT NULL,
	[MatKhau] [varchar](50) NULL,
	[EmailDK] [varchar](50) NULL,
	[DiaChiDK] [nvarchar](100) NULL,
	[TenDayDu] [nvarchar](50) NULL,
	[CauHoiBaoMat] [nvarchar](100) NULL,
	[NgaySinh] [date] NULL,
	[GioiTinhDK] [nchar](10) NULL,
	[MaQuyen] [int] NULL,
 CONSTRAINT [PK_db_DangKy] PRIMARY KEY CLUSTERED 
(
	[TenDangNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[db_DanhMuc]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[db_DanhMuc](
	[MaDM] [int] IDENTITY(1,1) NOT NULL,
	[TenDM] [nvarchar](50) NULL,
	[AnhDaiDien] [nvarchar](100) NULL,
	[ThuTu] [int] NULL,
	[MaDMCha] [int] NULL,
 CONSTRAINT [PK_db_DanhMuc] PRIMARY KEY CLUSTERED 
(
	[MaDM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[db_DanhMucTin]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[db_DanhMucTin](
	[MaDM] [int] IDENTITY(1,1) NOT NULL,
	[TenDM] [nvarchar](100) NULL,
	[AnhDaiDien] [nvarchar](100) NULL,
	[ThuTu] [int] NULL,
	[MaDMCha] [int] NOT NULL,
 CONSTRAINT [PK_DanhMucTin] PRIMARY KEY CLUSTERED 
(
	[MaDM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[db_DonDatHang]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[db_DonDatHang](
	[MaDonDatHang] [int] IDENTITY(1,1) NOT NULL,
	[NgayTao] [datetime] NULL,
	[ThanhTienDH] [float] NULL,
	[TinhTrangDonHang] [nvarchar](max) NULL,
	[MaKH] [int] NULL,
	[TenKH] [nvarchar](50) NULL,
	[sdtKH] [varchar](15) NULL,
	[EmailKH] [varchar](50) NULL,
 CONSTRAINT [PK_db_DonDatHang] PRIMARY KEY CLUSTERED 
(
	[MaDonDatHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[db_HoaDon]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[db_HoaDon](
	[MaHD] [int] IDENTITY(1,1) NOT NULL,
	[NgayLap] [datetime] NULL,
	[ThanhTien] [float] NULL,
	[MaNV] [int] NULL,
	[TenNV] [nvarchar](70) NULL,
	[MaKH] [int] NULL,
	[TenKH] [nvarchar](50) NULL,
 CONSTRAINT [PK_db_HoaDon] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[db_KhachHang]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[db_KhachHang](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[TenKh] [nvarchar](50) NULL,
	[DiaChiKH] [nvarchar](100) NULL,
	[sdtKH] [varchar](15) NULL,
	[EmailKH] [varchar](50) NOT NULL,
	[MatKhau] [nvarchar](50) NULL,
 CONSTRAINT [PK_db_KhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[db_Mau]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[db_Mau](
	[MauID] [int] IDENTITY(1,1) NOT NULL,
	[TenMau] [nvarchar](50) NULL,
 CONSTRAINT [PK_db_Mau] PRIMARY KEY CLUSTERED 
(
	[MauID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[db_Menu]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[db_Menu](
	[MaMenu] [int] IDENTITY(1,1) NOT NULL,
	[TenMenu] [nvarchar](50) NULL,
	[LienKet] [varchar](200) NULL,
	[MaMenuCha] [int] NULL,
	[ThuTuMenu] [int] NULL,
 CONSTRAINT [PK_db_Menu] PRIMARY KEY CLUSTERED 
(
	[MaMenu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[db_NhanVien]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[db_NhanVien](
	[MaNV] [int] IDENTITY(1,1) NOT NULL,
	[TenNV] [nvarchar](70) NULL,
	[GioiTinhNV] [nvarchar](10) NULL,
	[DiaChiNV] [nvarchar](100) NULL,
	[sdtNV] [varchar](15) NULL,
	[NgayVaoLam] [datetime] NULL,
 CONSTRAINT [PK_db_NhanVien] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[db_NhomQuangCao]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[db_NhomQuangCao](
	[NhomQuangCaoID] [int] IDENTITY(1,1) NOT NULL,
	[TenNhomQuangCao] [nvarchar](50) NULL,
	[ViTriQC] [nvarchar](30) NULL,
	[ThuTuNhomQC] [int] NULL,
	[AnhDaiDienQC] [nvarchar](100) NULL,
 CONSTRAINT [PK_db_NhomQuangCao] PRIMARY KEY CLUSTERED 
(
	[NhomQuangCaoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[db_NhomSanPham]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[db_NhomSanPham](
	[NhomID] [int] IDENTITY(1,1) NOT NULL,
	[TenNhom] [nvarchar](100) NULL,
	[AnhDaiDien] [nvarchar](100) NULL,
	[ThuTu] [int] NULL,
	[SoSPHienThi] [int] NULL,
 CONSTRAINT [PK_db_NhomSanPham] PRIMARY KEY CLUSTERED 
(
	[NhomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[db_QuangCao]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[db_QuangCao](
	[QuangCaoID] [int] IDENTITY(1,1) NOT NULL,
	[TenQC] [nvarchar](50) NULL,
	[LoaiQC] [nvarchar](20) NULL,
	[AnhQC] [nvarchar](100) NULL,
	[LienKet] [nchar](100) NULL,
	[ThuTuQC] [int] NULL,
	[NhomQuangCaoID] [int] NULL,
 CONSTRAINT [PK_db_QuangCao] PRIMARY KEY CLUSTERED 
(
	[QuangCaoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[db_QuyenDangNhap]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[db_QuyenDangNhap](
	[MaQuyen] [int] IDENTITY(1,1) NOT NULL,
	[TenQuyen] [nvarchar](50) NULL,
 CONSTRAINT [PK_db_QuyenDangNhap] PRIMARY KEY CLUSTERED 
(
	[MaQuyen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[db_SanPham]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[db_SanPham](
	[MaSP] [int] IDENTITY(1,1) NOT NULL,
	[TenSP] [nvarchar](100) NULL,
	[MauID] [int] NULL,
	[SizeID] [int] NULL,
	[ChatLieuID] [int] NULL,
	[AnhSP] [nvarchar](100) NULL,
	[SoLuongSP] [int] NULL,
	[GiaSP] [float] NULL,
	[MotaSP] [nvarchar](max) NULL,
	[NgayTao] [datetime] NULL,
	[NgayHuy] [datetime] NULL,
	[MaDM] [int] NULL,
	[NhomID] [int] NULL,
	[GiaNhapSP] [float] NULL,
 CONSTRAINT [PK_db_SanPham] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[db_Size]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[db_Size](
	[SizeID] [int] IDENTITY(1,1) NOT NULL,
	[TenSize] [varchar](10) NULL,
 CONSTRAINT [PK_db_Size] PRIMARY KEY CLUSTERED 
(
	[SizeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[db_TinTuc]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[db_TinTuc](
	[TinTucID] [int] IDENTITY(1,1) NOT NULL,
	[TieuDe] [nvarchar](200) NULL,
	[AnhDaiDien] [nvarchar](200) NULL,
	[MoTa] [nvarchar](200) NULL,
	[NgayDang] [datetime] NULL,
	[LuotXem] [int] NULL,
	[ChiTiet] [nvarchar](max) NULL,
	[ThuTu] [int] NULL,
	[MaDM] [int] NULL,
 CONSTRAINT [PK_TinTuc] PRIMARY KEY CLUSTERED 
(
	[TinTucID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[db_ChatLieu] ON 

INSERT [dbo].[db_ChatLieu] ([ChatLieuID], [TenChatLieu]) VALUES (1, N'Vải lon bóng')
INSERT [dbo].[db_ChatLieu] ([ChatLieuID], [TenChatLieu]) VALUES (2, N'Thô')
INSERT [dbo].[db_ChatLieu] ([ChatLieuID], [TenChatLieu]) VALUES (3, N'Da cá sấu')
INSERT [dbo].[db_ChatLieu] ([ChatLieuID], [TenChatLieu]) VALUES (7, N'Coton')
INSERT [dbo].[db_ChatLieu] ([ChatLieuID], [TenChatLieu]) VALUES (9, N'Kim loại - vàng')
INSERT [dbo].[db_ChatLieu] ([ChatLieuID], [TenChatLieu]) VALUES (11, N'Kim loại - Bạc')
INSERT [dbo].[db_ChatLieu] ([ChatLieuID], [TenChatLieu]) VALUES (12, N'Da bò')
INSERT [dbo].[db_ChatLieu] ([ChatLieuID], [TenChatLieu]) VALUES (13, N'Da tổng hợp - da nhân tạo')
INSERT [dbo].[db_ChatLieu] ([ChatLieuID], [TenChatLieu]) VALUES (16, N'Vải Lanh')
INSERT [dbo].[db_ChatLieu] ([ChatLieuID], [TenChatLieu]) VALUES (22, N'Thun - co dãn')
INSERT [dbo].[db_ChatLieu] ([ChatLieuID], [TenChatLieu]) VALUES (23, N'Vải Lanh Thô')
SET IDENTITY_INSERT [dbo].[db_ChatLieu] OFF
INSERT [dbo].[db_ChiTietDonDatHang] ([MaSP], [MaDonDatHang], [SoLuongDat], [DonGiaDat]) VALUES (1034, 42, 1, 125000)
INSERT [dbo].[db_ChiTietDonDatHang] ([MaSP], [MaDonDatHang], [SoLuongDat], [DonGiaDat]) VALUES (1034, 47, 2, 125000)
INSERT [dbo].[db_ChiTietDonDatHang] ([MaSP], [MaDonDatHang], [SoLuongDat], [DonGiaDat]) VALUES (1034, 48, 1, 125000)
INSERT [dbo].[db_ChiTietDonDatHang] ([MaSP], [MaDonDatHang], [SoLuongDat], [DonGiaDat]) VALUES (1034, 52, 1, 125000)
INSERT [dbo].[db_ChiTietDonDatHang] ([MaSP], [MaDonDatHang], [SoLuongDat], [DonGiaDat]) VALUES (1035, 39, 1, 120000)
INSERT [dbo].[db_ChiTietDonDatHang] ([MaSP], [MaDonDatHang], [SoLuongDat], [DonGiaDat]) VALUES (1035, 40, 1, 120000)
INSERT [dbo].[db_ChiTietDonDatHang] ([MaSP], [MaDonDatHang], [SoLuongDat], [DonGiaDat]) VALUES (1035, 41, 1, 120000)
INSERT [dbo].[db_ChiTietDonDatHang] ([MaSP], [MaDonDatHang], [SoLuongDat], [DonGiaDat]) VALUES (1035, 46, 1, 120000)
INSERT [dbo].[db_ChiTietDonDatHang] ([MaSP], [MaDonDatHang], [SoLuongDat], [DonGiaDat]) VALUES (1035, 49, 1, 120000)
INSERT [dbo].[db_ChiTietDonDatHang] ([MaSP], [MaDonDatHang], [SoLuongDat], [DonGiaDat]) VALUES (1035, 50, 1, 120000)
INSERT [dbo].[db_ChiTietDonDatHang] ([MaSP], [MaDonDatHang], [SoLuongDat], [DonGiaDat]) VALUES (1035, 51, 1, 120000)
INSERT [dbo].[db_ChiTietDonDatHang] ([MaSP], [MaDonDatHang], [SoLuongDat], [DonGiaDat]) VALUES (1035, 52, 1, 120000)
INSERT [dbo].[db_ChiTietDonDatHang] ([MaSP], [MaDonDatHang], [SoLuongDat], [DonGiaDat]) VALUES (1035, 53, 1, 120000)
INSERT [dbo].[db_ChiTietDonDatHang] ([MaSP], [MaDonDatHang], [SoLuongDat], [DonGiaDat]) VALUES (1035, 54, 2, 120000)
INSERT [dbo].[db_ChiTietDonDatHang] ([MaSP], [MaDonDatHang], [SoLuongDat], [DonGiaDat]) VALUES (1035, 55, 1, 120000)
INSERT [dbo].[db_ChiTietDonDatHang] ([MaSP], [MaDonDatHang], [SoLuongDat], [DonGiaDat]) VALUES (1035, 57, 1, 120000)
INSERT [dbo].[db_ChiTietDonDatHang] ([MaSP], [MaDonDatHang], [SoLuongDat], [DonGiaDat]) VALUES (1035, 58, 2, 120000)
INSERT [dbo].[db_ChiTietDonDatHang] ([MaSP], [MaDonDatHang], [SoLuongDat], [DonGiaDat]) VALUES (1035, 59, 1, 120000)
INSERT [dbo].[db_ChiTietDonDatHang] ([MaSP], [MaDonDatHang], [SoLuongDat], [DonGiaDat]) VALUES (1035, 61, 3, 120000)
INSERT [dbo].[db_ChiTietDonDatHang] ([MaSP], [MaDonDatHang], [SoLuongDat], [DonGiaDat]) VALUES (1035, 62, 19, 120000)
INSERT [dbo].[db_ChiTietDonDatHang] ([MaSP], [MaDonDatHang], [SoLuongDat], [DonGiaDat]) VALUES (1035, 63, 6, 120000)
INSERT [dbo].[db_ChiTietDonDatHang] ([MaSP], [MaDonDatHang], [SoLuongDat], [DonGiaDat]) VALUES (1035, 64, 2, 120000)
INSERT [dbo].[db_ChiTietDonDatHang] ([MaSP], [MaDonDatHang], [SoLuongDat], [DonGiaDat]) VALUES (1035, 65, 1, 120000)
INSERT [dbo].[db_ChiTietDonDatHang] ([MaSP], [MaDonDatHang], [SoLuongDat], [DonGiaDat]) VALUES (1035, 66, 1, 120000)
INSERT [dbo].[db_ChiTietDonDatHang] ([MaSP], [MaDonDatHang], [SoLuongDat], [DonGiaDat]) VALUES (1035, 67, 1, 120000)
INSERT [dbo].[db_ChiTietDonDatHang] ([MaSP], [MaDonDatHang], [SoLuongDat], [DonGiaDat]) VALUES (1035, 68, 1, 120000)
INSERT [dbo].[db_ChiTietDonDatHang] ([MaSP], [MaDonDatHang], [SoLuongDat], [DonGiaDat]) VALUES (1035, 72, 1, 120000)
INSERT [dbo].[db_ChiTietDonDatHang] ([MaSP], [MaDonDatHang], [SoLuongDat], [DonGiaDat]) VALUES (1035, 73, 1, 120000)
INSERT [dbo].[db_ChiTietDonDatHang] ([MaSP], [MaDonDatHang], [SoLuongDat], [DonGiaDat]) VALUES (1035, 77, 1, 120000)
INSERT [dbo].[db_ChiTietDonDatHang] ([MaSP], [MaDonDatHang], [SoLuongDat], [DonGiaDat]) VALUES (1035, 78, 1, 120000)
INSERT [dbo].[db_ChiTietDonDatHang] ([MaSP], [MaDonDatHang], [SoLuongDat], [DonGiaDat]) VALUES (1035, 79, 1, 120000)
INSERT [dbo].[db_ChiTietDonDatHang] ([MaSP], [MaDonDatHang], [SoLuongDat], [DonGiaDat]) VALUES (1035, 80, 1, 120000)
INSERT [dbo].[db_ChiTietDonDatHang] ([MaSP], [MaDonDatHang], [SoLuongDat], [DonGiaDat]) VALUES (1035, 81, 1, 120000)
INSERT [dbo].[db_ChiTietDonDatHang] ([MaSP], [MaDonDatHang], [SoLuongDat], [DonGiaDat]) VALUES (1035, 82, 1, 120000)
INSERT [dbo].[db_ChiTietDonDatHang] ([MaSP], [MaDonDatHang], [SoLuongDat], [DonGiaDat]) VALUES (1035, 83, 1, 120000)
INSERT [dbo].[db_ChiTietDonDatHang] ([MaSP], [MaDonDatHang], [SoLuongDat], [DonGiaDat]) VALUES (1035, 84, 1, 120000)
INSERT [dbo].[db_ChiTietDonDatHang] ([MaSP], [MaDonDatHang], [SoLuongDat], [DonGiaDat]) VALUES (1035, 85, 1, 120000)
INSERT [dbo].[db_ChiTietDonDatHang] ([MaSP], [MaDonDatHang], [SoLuongDat], [DonGiaDat]) VALUES (1035, 86, 2, 120000)
INSERT [dbo].[db_ChiTietDonDatHang] ([MaSP], [MaDonDatHang], [SoLuongDat], [DonGiaDat]) VALUES (1035, 87, 1, 120000)
INSERT [dbo].[db_ChiTietDonDatHang] ([MaSP], [MaDonDatHang], [SoLuongDat], [DonGiaDat]) VALUES (1035, 88, 1, 120000)
INSERT [dbo].[db_ChiTietDonDatHang] ([MaSP], [MaDonDatHang], [SoLuongDat], [DonGiaDat]) VALUES (1035, 89, 5, 120000)
INSERT [dbo].[db_ChiTietDonDatHang] ([MaSP], [MaDonDatHang], [SoLuongDat], [DonGiaDat]) VALUES (1035, 90, 4, 120000)
INSERT [dbo].[db_ChiTietDonDatHang] ([MaSP], [MaDonDatHang], [SoLuongDat], [DonGiaDat]) VALUES (1035, 91, 1, 120000)
INSERT [dbo].[db_ChiTietDonDatHang] ([MaSP], [MaDonDatHang], [SoLuongDat], [DonGiaDat]) VALUES (1035, 92, 1, 120000)
INSERT [dbo].[db_ChiTietDonDatHang] ([MaSP], [MaDonDatHang], [SoLuongDat], [DonGiaDat]) VALUES (1036, 46, 1, 175000)
INSERT [dbo].[db_ChiTietDonDatHang] ([MaSP], [MaDonDatHang], [SoLuongDat], [DonGiaDat]) VALUES (1036, 53, 1, 175000)
INSERT [dbo].[db_ChiTietDonDatHang] ([MaSP], [MaDonDatHang], [SoLuongDat], [DonGiaDat]) VALUES (1036, 67, 1, 175000)
INSERT [dbo].[db_ChiTietDonDatHang] ([MaSP], [MaDonDatHang], [SoLuongDat], [DonGiaDat]) VALUES (1036, 69, 1, 175000)
INSERT [dbo].[db_ChiTietDonDatHang] ([MaSP], [MaDonDatHang], [SoLuongDat], [DonGiaDat]) VALUES (1036, 71, 1, 175000)
INSERT [dbo].[db_ChiTietDonDatHang] ([MaSP], [MaDonDatHang], [SoLuongDat], [DonGiaDat]) VALUES (1037, 56, 1, 190000)
INSERT [dbo].[db_ChiTietDonDatHang] ([MaSP], [MaDonDatHang], [SoLuongDat], [DonGiaDat]) VALUES (1040, 54, 1, 2200000)
INSERT [dbo].[db_ChiTietDonDatHang] ([MaSP], [MaDonDatHang], [SoLuongDat], [DonGiaDat]) VALUES (1048, 59, 1, 128000)
INSERT [dbo].[db_ChiTietDonDatHang] ([MaSP], [MaDonDatHang], [SoLuongDat], [DonGiaDat]) VALUES (1050, 38, 1, 150000)
INSERT [dbo].[db_ChiTietDonDatHang] ([MaSP], [MaDonDatHang], [SoLuongDat], [DonGiaDat]) VALUES (1050, 51, 1, 150000)
INSERT [dbo].[db_ChiTietDonDatHang] ([MaSP], [MaDonDatHang], [SoLuongDat], [DonGiaDat]) VALUES (1050, 55, 1, 150000)
INSERT [dbo].[db_ChiTietDonDatHang] ([MaSP], [MaDonDatHang], [SoLuongDat], [DonGiaDat]) VALUES (1050, 60, 1, 150000)
INSERT [dbo].[db_ChiTietDonDatHang] ([MaSP], [MaDonDatHang], [SoLuongDat], [DonGiaDat]) VALUES (1050, 61, 18, 150000)
INSERT [dbo].[db_ChiTietDonDatHang] ([MaSP], [MaDonDatHang], [SoLuongDat], [DonGiaDat]) VALUES (1050, 70, 1, 150000)
INSERT [dbo].[db_ChiTietDonDatHang] ([MaSP], [MaDonDatHang], [SoLuongDat], [DonGiaDat]) VALUES (1050, 74, 1, 150000)
INSERT [dbo].[db_ChiTietDonDatHang] ([MaSP], [MaDonDatHang], [SoLuongDat], [DonGiaDat]) VALUES (1073, 45, 1, 7)
INSERT [dbo].[db_ChiTietDonDatHang] ([MaSP], [MaDonDatHang], [SoLuongDat], [DonGiaDat]) VALUES (1091, 60, 1, 255000)
INSERT [dbo].[db_ChiTietDonDatHang] ([MaSP], [MaDonDatHang], [SoLuongDat], [DonGiaDat]) VALUES (1092, 56, 1, 750000)
INSERT [dbo].[db_ChiTietDonDatHang] ([MaSP], [MaDonDatHang], [SoLuongDat], [DonGiaDat]) VALUES (1092, 75, 1, 750000)
INSERT [dbo].[db_ChiTietDonDatHang] ([MaSP], [MaDonDatHang], [SoLuongDat], [DonGiaDat]) VALUES (1102, 76, 1, 1975000)
INSERT [dbo].[db_ChiTietDonHang] ([MaHD], [MaSP], [SoLuong], [DonGia]) VALUES (1, 1035, 1, 120000)
INSERT [dbo].[db_ChiTietDonHang] ([MaHD], [MaSP], [SoLuong], [DonGia]) VALUES (3, 1035, 1, 190000)
INSERT [dbo].[db_ChiTietDonHang] ([MaHD], [MaSP], [SoLuong], [DonGia]) VALUES (8, 1035, 1, 120000)
INSERT [dbo].[db_ChiTietDonHang] ([MaHD], [MaSP], [SoLuong], [DonGia]) VALUES (10, 1035, 1, 120000)
INSERT [dbo].[db_ChiTietDonHang] ([MaHD], [MaSP], [SoLuong], [DonGia]) VALUES (10, 1050, 1, 150000)
INSERT [dbo].[db_ChiTietDonHang] ([MaHD], [MaSP], [SoLuong], [DonGia]) VALUES (11, 1050, 1, 150000)
INSERT [dbo].[db_ChiTietDonHang] ([MaHD], [MaSP], [SoLuong], [DonGia]) VALUES (11, 1091, 1, 255000)
INSERT [dbo].[db_ChiTietDonHang] ([MaHD], [MaSP], [SoLuong], [DonGia]) VALUES (12, 1035, 19, 120000)
INSERT [dbo].[db_ChiTietDonHang] ([MaHD], [MaSP], [SoLuong], [DonGia]) VALUES (13, 1035, 6, 120000)
INSERT [dbo].[db_ChiTietDonHang] ([MaHD], [MaSP], [SoLuong], [DonGia]) VALUES (14, 1102, 1, 1975000)
INSERT [dbo].[db_ChiTietDonHang] ([MaHD], [MaSP], [SoLuong], [DonGia]) VALUES (15, 1035, 1, 120000)
INSERT [dbo].[db_ChiTietDonHang] ([MaHD], [MaSP], [SoLuong], [DonGia]) VALUES (16, 1035, 1, 120000)
INSERT [dbo].[db_ChiTietDonHang] ([MaHD], [MaSP], [SoLuong], [DonGia]) VALUES (17, 1035, 2, 120000)
INSERT [dbo].[db_ChiTietDonHang] ([MaHD], [MaSP], [SoLuong], [DonGia]) VALUES (18, 1035, 1, 120000)
INSERT [dbo].[db_ChiTietDonHang] ([MaHD], [MaSP], [SoLuong], [DonGia]) VALUES (19, 1035, 1, 120000)
INSERT [dbo].[db_DangKy] ([TenDangNhap], [MatKhau], [EmailDK], [DiaChiDK], [TenDayDu], [CauHoiBaoMat], [NgaySinh], [GioiTinhDK], [MaQuyen]) VALUES (N'admin', N'827ccb0eea8a706c4c34a16891f84e7b', N'admin@tatthanh.com', N'Nam Định', N'Quản Trị Viên', N'', CAST(N'1994-02-16' AS Date), N'Nam       ', 1)
INSERT [dbo].[db_DangKy] ([TenDangNhap], [MatKhau], [EmailDK], [DiaChiDK], [TenDayDu], [CauHoiBaoMat], [NgaySinh], [GioiTinhDK], [MaQuyen]) VALUES (N'BichBon', N'827ccb0eea8a706c4c34a16891f84e7b', N'bich_kythuat@tatthanh.com', N'Hưng Yên', N'Nguyễn Xuân Bích', N'', CAST(N'2017-05-29' AS Date), N'Nam       ', 1)
INSERT [dbo].[db_DangKy] ([TenDangNhap], [MatKhau], [EmailDK], [DiaChiDK], [TenDayDu], [CauHoiBaoMat], [NgaySinh], [GioiTinhDK], [MaQuyen]) VALUES (N'HaiLe', N'd41d8cd98f00b204e9800998ecf8427e', N'haile@tatthanh.com', N'Hà Nội', N'Lê Hải Lệ', N'', CAST(N'1997-01-08' AS Date), N'Nam       ', 2)
INSERT [dbo].[db_DangKy] ([TenDangNhap], [MatKhau], [EmailDK], [DiaChiDK], [TenDayDu], [CauHoiBaoMat], [NgaySinh], [GioiTinhDK], [MaQuyen]) VALUES (N'NguyenHa', N'827ccb0eea8a706c4c34a16891f84e7b', N'nguyenha@gmail.com', N'Hải Dương', N'Nguyễn Thị Hà', N'', CAST(N'1995-04-07' AS Date), N'Nữ        ', 2)
INSERT [dbo].[db_DangKy] ([TenDangNhap], [MatKhau], [EmailDK], [DiaChiDK], [TenDayDu], [CauHoiBaoMat], [NgaySinh], [GioiTinhDK], [MaQuyen]) VALUES (N'quocanh', N'd41d8cd98f00b204e9800998ecf8427e', N'quocanh1@tatthanh.com', N'Hưng Yên', N'Nguyễn Quốc Anh', N'', CAST(N'2017-05-29' AS Date), N'Nam       ', 2)
INSERT [dbo].[db_DangKy] ([TenDangNhap], [MatKhau], [EmailDK], [DiaChiDK], [TenDayDu], [CauHoiBaoMat], [NgaySinh], [GioiTinhDK], [MaQuyen]) VALUES (N'quyetthang', N'827ccb0eea8a706c4c34a16891f84e7b', N'quyetthang@tatthanh.com', N'Hà Nội', N'Nguyễn Quyết Thắng', N'', CAST(N'1985-01-16' AS Date), N'Nam       ', 1)
INSERT [dbo].[db_DangKy] ([TenDangNhap], [MatKhau], [EmailDK], [DiaChiDK], [TenDayDu], [CauHoiBaoMat], [NgaySinh], [GioiTinhDK], [MaQuyen]) VALUES (N'SimLe', N'827ccb0eea8a706c4c34a16891f84e7b', N'simle@tatthanh.com', N'Hà Nội', N'Lê Thị Sim', N'', CAST(N'2017-05-29' AS Date), N'Nữ        ', 2)
INSERT [dbo].[db_DangKy] ([TenDangNhap], [MatKhau], [EmailDK], [DiaChiDK], [TenDayDu], [CauHoiBaoMat], [NgaySinh], [GioiTinhDK], [MaQuyen]) VALUES (N'TheNguyen', N'827ccb0eea8a706c4c34a16891f84e7b', N'nguyenthe@tatthanh.com', N'Hưng Yên', N'Phạm Hữu Thế', N'', CAST(N'2017-05-29' AS Date), N'Nam       ', 1)
INSERT [dbo].[db_DangKy] ([TenDangNhap], [MatKhau], [EmailDK], [DiaChiDK], [TenDayDu], [CauHoiBaoMat], [NgaySinh], [GioiTinhDK], [MaQuyen]) VALUES (N'VanHoang', N'827ccb0eea8a706c4c34a16891f84e7b', N'vanhoangnguyen@tatthanh.com', N'HBT-Hà Nội', N'Nguyễn Văn Hoàng', N'', CAST(N'1993-01-13' AS Date), N'Nam       ', 2)
SET IDENTITY_INSERT [dbo].[db_DanhMuc] ON 

INSERT [dbo].[db_DanhMuc] ([MaDM], [TenDM], [AnhDaiDien], [ThuTu], [MaDMCha]) VALUES (35, N'áo len', N'1456hinh-nen-cao-nguyen-xanh-bao-la-tuyet-dep.jpg', 1212, 4)
INSERT [dbo].[db_DanhMuc] ([MaDM], [TenDM], [AnhDaiDien], [ThuTu], [MaDMCha]) VALUES (45, N'qưqwxxxxxxx', N'', 2, 44)
INSERT [dbo].[db_DanhMuc] ([MaDM], [TenDM], [AnhDaiDien], [ThuTu], [MaDMCha]) VALUES (47, N'Áo Các loại', N'Áo.png', 1, 0)
INSERT [dbo].[db_DanhMuc] ([MaDM], [TenDM], [AnhDaiDien], [ThuTu], [MaDMCha]) VALUES (50, N'Túi xách', N'túi.jpg', 4, 0)
INSERT [dbo].[db_DanhMuc] ([MaDM], [TenDM], [AnhDaiDien], [ThuTu], [MaDMCha]) VALUES (55, N'Áo sơ mi', N'sơ mi 7.jpg', 1, 47)
INSERT [dbo].[db_DanhMuc] ([MaDM], [TenDM], [AnhDaiDien], [ThuTu], [MaDMCha]) VALUES (57, N'Áo sơ mi nam viettien', N'857621_215974741876608_328520681_o.jpg', 1, 57)
INSERT [dbo].[db_DanhMuc] ([MaDM], [TenDM], [AnhDaiDien], [ThuTu], [MaDMCha]) VALUES (1052, N'Váy các loại', N'váy.jpg', 1, 0)
INSERT [dbo].[db_DanhMuc] ([MaDM], [TenDM], [AnhDaiDien], [ThuTu], [MaDMCha]) VALUES (1053, N'Áo vest NAM', N'tải xuống.jpg', 1, 47)
INSERT [dbo].[db_DanhMuc] ([MaDM], [TenDM], [AnhDaiDien], [ThuTu], [MaDMCha]) VALUES (1055, N'Áo vest Nữ', N'vest nữ.jpg', 1, 47)
INSERT [dbo].[db_DanhMuc] ([MaDM], [TenDM], [AnhDaiDien], [ThuTu], [MaDMCha]) VALUES (1056, N'Áo sơ mi Nữ', N'sơ mi nữa.jpg', 1, 47)
INSERT [dbo].[db_DanhMuc] ([MaDM], [TenDM], [AnhDaiDien], [ThuTu], [MaDMCha]) VALUES (1057, N'Áo len nữ', N'len nữ 1.jpg', 1, 47)
INSERT [dbo].[db_DanhMuc] ([MaDM], [TenDM], [AnhDaiDien], [ThuTu], [MaDMCha]) VALUES (1058, N'Áo phông Nữ', N'phông rộng 1.jpg', 1, 47)
INSERT [dbo].[db_DanhMuc] ([MaDM], [TenDM], [AnhDaiDien], [ThuTu], [MaDMCha]) VALUES (1065, N'Trang Sức - Phụ Kiện', N'trang sức.jpg', 1, 0)
INSERT [dbo].[db_DanhMuc] ([MaDM], [TenDM], [AnhDaiDien], [ThuTu], [MaDMCha]) VALUES (1079, N'Áo sơ mi NAM', N'sơ mi 5.jpg', 1, 55)
INSERT [dbo].[db_DanhMuc] ([MaDM], [TenDM], [AnhDaiDien], [ThuTu], [MaDMCha]) VALUES (1080, N'Quần các loại', N'quần.png', 1, 0)
INSERT [dbo].[db_DanhMuc] ([MaDM], [TenDM], [AnhDaiDien], [ThuTu], [MaDMCha]) VALUES (1081, N'Mũ - Nón', N'mũ.png', 1, 0)
INSERT [dbo].[db_DanhMuc] ([MaDM], [TenDM], [AnhDaiDien], [ThuTu], [MaDMCha]) VALUES (1083, N'Đồng hồ ', N'2017_05_30_18_05_14_215dongho.png', 1, 0)
INSERT [dbo].[db_DanhMuc] ([MaDM], [TenDM], [AnhDaiDien], [ThuTu], [MaDMCha]) VALUES (1084, N'Quần Jeans', N'jeans.png', 1, 1080)
INSERT [dbo].[db_DanhMuc] ([MaDM], [TenDM], [AnhDaiDien], [ThuTu], [MaDMCha]) VALUES (1085, N'Quần Short', N'short jeans.png', 1, 1080)
INSERT [dbo].[db_DanhMuc] ([MaDM], [TenDM], [AnhDaiDien], [ThuTu], [MaDMCha]) VALUES (1086, N'Jeans Nam', N'man.png', 1, 1084)
INSERT [dbo].[db_DanhMuc] ([MaDM], [TenDM], [AnhDaiDien], [ThuTu], [MaDMCha]) VALUES (1087, N'Jeans Nữ', N'ươman.png', 1, 1084)
INSERT [dbo].[db_DanhMuc] ([MaDM], [TenDM], [AnhDaiDien], [ThuTu], [MaDMCha]) VALUES (1093, N'Váy suông', N'2017_06_05_01_01_46_230váy4.jpg', 1, 1052)
SET IDENTITY_INSERT [dbo].[db_DanhMuc] OFF
SET IDENTITY_INSERT [dbo].[db_DanhMucTin] ON 

INSERT [dbo].[db_DanhMucTin] ([MaDM], [TenDM], [AnhDaiDien], [ThuTu], [MaDMCha]) VALUES (1, N'Tin thời trang', N'fashion.png', 1, 0)
INSERT [dbo].[db_DanhMucTin] ([MaDM], [TenDM], [AnhDaiDien], [ThuTu], [MaDMCha]) VALUES (2, N'Làm đẹp', N'beauty.png', 2, 0)
INSERT [dbo].[db_DanhMucTin] ([MaDM], [TenDM], [AnhDaiDien], [ThuTu], [MaDMCha]) VALUES (3, N'Tin về công ty', N'compani.png', 3, 0)
INSERT [dbo].[db_DanhMucTin] ([MaDM], [TenDM], [AnhDaiDien], [ThuTu], [MaDMCha]) VALUES (4, N'Nhịp sống', N'life.png', 4, 0)
INSERT [dbo].[db_DanhMucTin] ([MaDM], [TenDM], [AnhDaiDien], [ThuTu], [MaDMCha]) VALUES (5, N'Thị trường', N'business.png', 5, 0)
INSERT [dbo].[db_DanhMucTin] ([MaDM], [TenDM], [AnhDaiDien], [ThuTu], [MaDMCha]) VALUES (6, N'Giải trí', N'entertaiment.png', 6, 0)
INSERT [dbo].[db_DanhMucTin] ([MaDM], [TenDM], [AnhDaiDien], [ThuTu], [MaDMCha]) VALUES (7, N'Sức khỏe', N'health.png', 7, 0)
INSERT [dbo].[db_DanhMucTin] ([MaDM], [TenDM], [AnhDaiDien], [ThuTu], [MaDMCha]) VALUES (8, N'Ăn ngon', N'eat.png', 8, 0)
INSERT [dbo].[db_DanhMucTin] ([MaDM], [TenDM], [AnhDaiDien], [ThuTu], [MaDMCha]) VALUES (9, N'Chơi', N'play.png', 9, 0)
INSERT [dbo].[db_DanhMucTin] ([MaDM], [TenDM], [AnhDaiDien], [ThuTu], [MaDMCha]) VALUES (10, N'Thời trang trong nước', N'fanoidia.png', 1, 1)
INSERT [dbo].[db_DanhMucTin] ([MaDM], [TenDM], [AnhDaiDien], [ThuTu], [MaDMCha]) VALUES (11, N'Thời trang quốc tế', N'quoctefa.png', 1, 1)
INSERT [dbo].[db_DanhMucTin] ([MaDM], [TenDM], [AnhDaiDien], [ThuTu], [MaDMCha]) VALUES (12, N'Mẹ và bé', N'child àn mon.png', 1, 0)
INSERT [dbo].[db_DanhMucTin] ([MaDM], [TenDM], [AnhDaiDien], [ThuTu], [MaDMCha]) VALUES (16, N'2016', N'2017_06_02_02_48_18_226angela.jpg', 1, 10)
INSERT [dbo].[db_DanhMucTin] ([MaDM], [TenDM], [AnhDaiDien], [ThuTu], [MaDMCha]) VALUES (17, N'Trai đẹp', N'2017_06_12_08_47_58_267sơ mi 2.jpg', 1, 0)
SET IDENTITY_INSERT [dbo].[db_DanhMucTin] OFF
SET IDENTITY_INSERT [dbo].[db_DonDatHang] ON 

INSERT [dbo].[db_DonDatHang] ([MaDonDatHang], [NgayTao], [ThanhTienDH], [TinhTrangDonHang], [MaKH], [TenKH], [sdtKH], [EmailKH]) VALUES (38, CAST(N'2017-05-21 04:11:08.000' AS DateTime), 150000, N'6363093666', 9, N'BichBop', N'01236545698', N'bich94@gmail.com')
INSERT [dbo].[db_DonDatHang] ([MaDonDatHang], [NgayTao], [ThanhTienDH], [TinhTrangDonHang], [MaKH], [TenKH], [sdtKH], [EmailKH]) VALUES (39, CAST(N'2017-05-21 10:53:43.000' AS DateTime), 120000, N'1', 9, N'BichBop', N'01236545698', N'bich94@gmail.com')
INSERT [dbo].[db_DonDatHang] ([MaDonDatHang], [NgayTao], [ThanhTienDH], [TinhTrangDonHang], [MaKH], [TenKH], [sdtKH], [EmailKH]) VALUES (40, CAST(N'2017-05-21 10:57:24.000' AS DateTime), 120000, N'0         ', 9, N'BichBop', N'01236545698', N'bich94@gmail.com')
INSERT [dbo].[db_DonDatHang] ([MaDonDatHang], [NgayTao], [ThanhTienDH], [TinhTrangDonHang], [MaKH], [TenKH], [sdtKH], [EmailKH]) VALUES (41, CAST(N'2017-05-21 10:57:53.000' AS DateTime), 120000, N'0         ', 9, N'BichBop', N'01236545698', N'bich94@gmail.com')
INSERT [dbo].[db_DonDatHang] ([MaDonDatHang], [NgayTao], [ThanhTienDH], [TinhTrangDonHang], [MaKH], [TenKH], [sdtKH], [EmailKH]) VALUES (42, CAST(N'2017-05-21 11:39:57.000' AS DateTime), 125000, N'0         ', 6, N'Bích Nguyễn', N'0123654887', N'bich@gmail.com')
INSERT [dbo].[db_DonDatHang] ([MaDonDatHang], [NgayTao], [ThanhTienDH], [TinhTrangDonHang], [MaKH], [TenKH], [sdtKH], [EmailKH]) VALUES (45, CAST(N'2017-05-21 22:26:22.000' AS DateTime), 7, N'6363100238', 6, N'Bích Nguyễn', N'0123654887', N'bich@gmail.com')
INSERT [dbo].[db_DonDatHang] ([MaDonDatHang], [NgayTao], [ThanhTienDH], [TinhTrangDonHang], [MaKH], [TenKH], [sdtKH], [EmailKH]) VALUES (46, CAST(N'2017-05-31 10:39:22.000' AS DateTime), 295000, N'6363182396', 9, N'BichBop', N'01236545698', N'bich94@gmail.com')
INSERT [dbo].[db_DonDatHang] ([MaDonDatHang], [NgayTao], [ThanhTienDH], [TinhTrangDonHang], [MaKH], [TenKH], [sdtKH], [EmailKH]) VALUES (47, CAST(N'2017-06-02 03:55:19.000' AS DateTime), 250000, N'6363197251', 9, N'BichBop', N'01236545698', N'bich94@gmail.com')
INSERT [dbo].[db_DonDatHang] ([MaDonDatHang], [NgayTao], [ThanhTienDH], [TinhTrangDonHang], [MaKH], [TenKH], [sdtKH], [EmailKH]) VALUES (48, CAST(N'2017-06-02 03:59:41.000' AS DateTime), 125000, N'6363197278', 9, N'BichBop', N'01236545698', N'bich94@gmail.com')
INSERT [dbo].[db_DonDatHang] ([MaDonDatHang], [NgayTao], [ThanhTienDH], [TinhTrangDonHang], [MaKH], [TenKH], [sdtKH], [EmailKH]) VALUES (49, CAST(N'2017-06-02 10:50:05.000' AS DateTime), 120000, N'1         ', 9, N'BichBop', N'01236545698', N'bich94@gmail.com')
INSERT [dbo].[db_DonDatHang] ([MaDonDatHang], [NgayTao], [ThanhTienDH], [TinhTrangDonHang], [MaKH], [TenKH], [sdtKH], [EmailKH]) VALUES (50, CAST(N'2017-06-02 10:55:55.000' AS DateTime), 120000, N'1         ', 9, N'BichBop', N'01236545698', N'bich94@gmail.com')
INSERT [dbo].[db_DonDatHang] ([MaDonDatHang], [NgayTao], [ThanhTienDH], [TinhTrangDonHang], [MaKH], [TenKH], [sdtKH], [EmailKH]) VALUES (51, CAST(N'2017-06-02 11:50:55.000' AS DateTime), 270000, N'1         ', 20, N'Nguyễn Văn An', N'0972409205', N'an123@gmail.com')
INSERT [dbo].[db_DonDatHang] ([MaDonDatHang], [NgayTao], [ThanhTienDH], [TinhTrangDonHang], [MaKH], [TenKH], [sdtKH], [EmailKH]) VALUES (52, CAST(N'2017-06-02 12:00:03.000' AS DateTime), 245000, N'1         ', 9, N'BichBop', N'01236545698', N'bich94@gmail.com')
INSERT [dbo].[db_DonDatHang] ([MaDonDatHang], [NgayTao], [ThanhTienDH], [TinhTrangDonHang], [MaKH], [TenKH], [sdtKH], [EmailKH]) VALUES (53, CAST(N'2017-06-02 12:03:28.000' AS DateTime), 295000, N'1         ', 9, N'BichBop', N'01236545698', N'bich94@gmail.com')
INSERT [dbo].[db_DonDatHang] ([MaDonDatHang], [NgayTao], [ThanhTienDH], [TinhTrangDonHang], [MaKH], [TenKH], [sdtKH], [EmailKH]) VALUES (54, CAST(N'2017-06-02 12:13:51.000' AS DateTime), 2440000, N'1         ', 9, N'BichBop', N'01236545698', N'bich94@gmail.com')
INSERT [dbo].[db_DonDatHang] ([MaDonDatHang], [NgayTao], [ThanhTienDH], [TinhTrangDonHang], [MaKH], [TenKH], [sdtKH], [EmailKH]) VALUES (55, CAST(N'2017-06-02 12:48:09.000' AS DateTime), 270000, N'1         ', 9, N'BichBop', N'01236545698', N'bich94@gmail.com')
INSERT [dbo].[db_DonDatHang] ([MaDonDatHang], [NgayTao], [ThanhTienDH], [TinhTrangDonHang], [MaKH], [TenKH], [sdtKH], [EmailKH]) VALUES (56, CAST(N'2017-06-02 13:05:45.000' AS DateTime), 940000, N'0         ', 9, N'BichBop', N'01236545698', N'bich94@gmail.com')
INSERT [dbo].[db_DonDatHang] ([MaDonDatHang], [NgayTao], [ThanhTienDH], [TinhTrangDonHang], [MaKH], [TenKH], [sdtKH], [EmailKH]) VALUES (57, CAST(N'2017-06-02 15:02:13.000' AS DateTime), 120000, N'6363201253', 22, N'Nguyễn Văn Thử Nghiệm', N'01236547845', N'thunghiem@gmail.com')
INSERT [dbo].[db_DonDatHang] ([MaDonDatHang], [NgayTao], [ThanhTienDH], [TinhTrangDonHang], [MaKH], [TenKH], [sdtKH], [EmailKH]) VALUES (58, CAST(N'2017-06-02 15:07:27.000' AS DateTime), 240000, N'0         ', 23, N'Nguyễn Văn Thử', N'01236598565', N'thu@gmail.com')
INSERT [dbo].[db_DonDatHang] ([MaDonDatHang], [NgayTao], [ThanhTienDH], [TinhTrangDonHang], [MaKH], [TenKH], [sdtKH], [EmailKH]) VALUES (59, CAST(N'2017-06-02 15:21:48.000' AS DateTime), 248000, N'0         ', 9, N'BichBop', N'01236545698', N'bich94@gmail.com')
INSERT [dbo].[db_DonDatHang] ([MaDonDatHang], [NgayTao], [ThanhTienDH], [TinhTrangDonHang], [MaKH], [TenKH], [sdtKH], [EmailKH]) VALUES (60, CAST(N'2017-06-02 15:23:46.000' AS DateTime), 405000, N'1         ', 9, N'BichBop', N'01236545698', N'bich94@gmail.com')
INSERT [dbo].[db_DonDatHang] ([MaDonDatHang], [NgayTao], [ThanhTienDH], [TinhTrangDonHang], [MaKH], [TenKH], [sdtKH], [EmailKH]) VALUES (61, CAST(N'2017-06-02 16:02:21.000' AS DateTime), 3060000, N'0         ', 9, N'BichBop', N'01236545698', N'bich94@gmail.com')
INSERT [dbo].[db_DonDatHang] ([MaDonDatHang], [NgayTao], [ThanhTienDH], [TinhTrangDonHang], [MaKH], [TenKH], [sdtKH], [EmailKH]) VALUES (62, CAST(N'2017-06-02 16:03:41.000' AS DateTime), 2280000, N'1         ', 9, N'BichBop', N'01236545698', N'bich94@gmail.com')
INSERT [dbo].[db_DonDatHang] ([MaDonDatHang], [NgayTao], [ThanhTienDH], [TinhTrangDonHang], [MaKH], [TenKH], [sdtKH], [EmailKH]) VALUES (63, CAST(N'2017-06-02 16:31:10.000' AS DateTime), 720000, N'1         ', 9, N'BichBop', N'01236545698', N'bich94@gmail.com')
INSERT [dbo].[db_DonDatHang] ([MaDonDatHang], [NgayTao], [ThanhTienDH], [TinhTrangDonHang], [MaKH], [TenKH], [sdtKH], [EmailKH]) VALUES (64, CAST(N'2017-06-03 20:18:41.000' AS DateTime), 240000, N'0         ', 9, N'BichBop', N'01236545698', N'bich94@gmail.com')
INSERT [dbo].[db_DonDatHang] ([MaDonDatHang], [NgayTao], [ThanhTienDH], [TinhTrangDonHang], [MaKH], [TenKH], [sdtKH], [EmailKH]) VALUES (65, CAST(N'2017-06-04 08:11:06.000' AS DateTime), 120000, N'6363216066', 9, N'BichBop', N'01236545698', N'bich94@gmail.com')
INSERT [dbo].[db_DonDatHang] ([MaDonDatHang], [NgayTao], [ThanhTienDH], [TinhTrangDonHang], [MaKH], [TenKH], [sdtKH], [EmailKH]) VALUES (66, CAST(N'2017-06-04 08:27:37.000' AS DateTime), 120000, N'6363216165', 9, N'BichBop', N'01236545698', N'bich94@gmail.com')
INSERT [dbo].[db_DonDatHang] ([MaDonDatHang], [NgayTao], [ThanhTienDH], [TinhTrangDonHang], [MaKH], [TenKH], [sdtKH], [EmailKH]) VALUES (67, CAST(N'2017-06-04 08:30:31.000' AS DateTime), 295000, N'6363216183', 9, N'BichBop', N'01236545698', N'bich94@gmail.com')
INSERT [dbo].[db_DonDatHang] ([MaDonDatHang], [NgayTao], [ThanhTienDH], [TinhTrangDonHang], [MaKH], [TenKH], [sdtKH], [EmailKH]) VALUES (68, CAST(N'2017-06-04 08:34:26.000' AS DateTime), 120000, N'6363216206', 9, N'BichBop', N'01236545698', N'bich94@gmail.com')
INSERT [dbo].[db_DonDatHang] ([MaDonDatHang], [NgayTao], [ThanhTienDH], [TinhTrangDonHang], [MaKH], [TenKH], [sdtKH], [EmailKH]) VALUES (69, CAST(N'2017-06-04 08:38:11.000' AS DateTime), 175000, N'6363216229', 9, N'BichBop', N'01236545698', N'bich94@gmail.com')
INSERT [dbo].[db_DonDatHang] ([MaDonDatHang], [NgayTao], [ThanhTienDH], [TinhTrangDonHang], [MaKH], [TenKH], [sdtKH], [EmailKH]) VALUES (70, CAST(N'2017-06-04 08:38:43.000' AS DateTime), 150000, N'6363216232', 9, N'BichBop', N'01236545698', N'bich94@gmail.com')
INSERT [dbo].[db_DonDatHang] ([MaDonDatHang], [NgayTao], [ThanhTienDH], [TinhTrangDonHang], [MaKH], [TenKH], [sdtKH], [EmailKH]) VALUES (71, CAST(N'2017-06-04 12:00:47.000' AS DateTime), 175000, N'0         ', 9, N'BichBop', N'01236545698', N'bich94@gmail.com')
INSERT [dbo].[db_DonDatHang] ([MaDonDatHang], [NgayTao], [ThanhTienDH], [TinhTrangDonHang], [MaKH], [TenKH], [sdtKH], [EmailKH]) VALUES (72, CAST(N'2017-06-09 06:09:28.000' AS DateTime), 120000, N'6363258536', 9, N'BichBop', N'01236545698', N'bich94@gmail.com')
INSERT [dbo].[db_DonDatHang] ([MaDonDatHang], [NgayTao], [ThanhTienDH], [TinhTrangDonHang], [MaKH], [TenKH], [sdtKH], [EmailKH]) VALUES (73, CAST(N'2017-06-09 06:13:29.000' AS DateTime), 120000, N'6363258560', 9, N'BichBop', N'01236545698', N'bich94@gmail.com')
INSERT [dbo].[db_DonDatHang] ([MaDonDatHang], [NgayTao], [ThanhTienDH], [TinhTrangDonHang], [MaKH], [TenKH], [sdtKH], [EmailKH]) VALUES (74, CAST(N'2017-06-09 06:15:58.000' AS DateTime), 150000, N'6363258575', 9, N'BichBop', N'01236545698', N'bich94@gmail.com')
INSERT [dbo].[db_DonDatHang] ([MaDonDatHang], [NgayTao], [ThanhTienDH], [TinhTrangDonHang], [MaKH], [TenKH], [sdtKH], [EmailKH]) VALUES (75, CAST(N'2017-06-09 06:16:27.000' AS DateTime), 750000, N'6363258578', 9, N'BichBop', N'01236545698', N'bich94@gmail.com')
INSERT [dbo].[db_DonDatHang] ([MaDonDatHang], [NgayTao], [ThanhTienDH], [TinhTrangDonHang], [MaKH], [TenKH], [sdtKH], [EmailKH]) VALUES (76, CAST(N'2017-06-09 06:19:21.000' AS DateTime), 1975000, N'1         ', 9, N'BichBop', N'01236545698', N'bich94@gmail.com')
INSERT [dbo].[db_DonDatHang] ([MaDonDatHang], [NgayTao], [ThanhTienDH], [TinhTrangDonHang], [MaKH], [TenKH], [sdtKH], [EmailKH]) VALUES (77, CAST(N'2017-06-09 09:32:38.000' AS DateTime), 120000, N'1         ', 9, N'BichBop', N'01236545698', N'bich94@gmail.com')
INSERT [dbo].[db_DonDatHang] ([MaDonDatHang], [NgayTao], [ThanhTienDH], [TinhTrangDonHang], [MaKH], [TenKH], [sdtKH], [EmailKH]) VALUES (78, CAST(N'2017-06-10 06:39:41.000' AS DateTime), 120000, N'6363267358', 9, N'BichBop', N'01236545698', N'bich94@gmail.com')
INSERT [dbo].[db_DonDatHang] ([MaDonDatHang], [NgayTao], [ThanhTienDH], [TinhTrangDonHang], [MaKH], [TenKH], [sdtKH], [EmailKH]) VALUES (79, CAST(N'2017-06-10 06:47:02.000' AS DateTime), 120000, N'6363267402', 9, N'BichBop', N'01236545698', N'bich94@gmail.com')
INSERT [dbo].[db_DonDatHang] ([MaDonDatHang], [NgayTao], [ThanhTienDH], [TinhTrangDonHang], [MaKH], [TenKH], [sdtKH], [EmailKH]) VALUES (80, CAST(N'2017-06-10 08:45:50.000' AS DateTime), 120000, N'6363268115', 9, N'BichBop', N'01236545698', N'bich94@gmail.com')
INSERT [dbo].[db_DonDatHang] ([MaDonDatHang], [NgayTao], [ThanhTienDH], [TinhTrangDonHang], [MaKH], [TenKH], [sdtKH], [EmailKH]) VALUES (81, CAST(N'2017-06-10 08:52:32.000' AS DateTime), 120000, N'0         ', 9, N'BichBop', N'01236545698', N'bich94@gmail.com')
INSERT [dbo].[db_DonDatHang] ([MaDonDatHang], [NgayTao], [ThanhTienDH], [TinhTrangDonHang], [MaKH], [TenKH], [sdtKH], [EmailKH]) VALUES (82, CAST(N'2017-06-10 09:03:29.000' AS DateTime), 120000, N'0         ', 9, N'BichBop', N'01236545698', N'bich94@gmail.com')
INSERT [dbo].[db_DonDatHang] ([MaDonDatHang], [NgayTao], [ThanhTienDH], [TinhTrangDonHang], [MaKH], [TenKH], [sdtKH], [EmailKH]) VALUES (83, CAST(N'2017-06-10 09:12:24.000' AS DateTime), 120000, N'0         ', 9, N'BichBop', N'01236545698', N'bich94@gmail.com')
INSERT [dbo].[db_DonDatHang] ([MaDonDatHang], [NgayTao], [ThanhTienDH], [TinhTrangDonHang], [MaKH], [TenKH], [sdtKH], [EmailKH]) VALUES (84, CAST(N'2017-06-10 09:15:29.000' AS DateTime), 120000, N'1         ', 9, N'BichBop', N'01236545698', N'bich94@gmail.com')
INSERT [dbo].[db_DonDatHang] ([MaDonDatHang], [NgayTao], [ThanhTienDH], [TinhTrangDonHang], [MaKH], [TenKH], [sdtKH], [EmailKH]) VALUES (85, CAST(N'2017-06-10 09:18:35.000' AS DateTime), 120000, N'0         ', 9, N'BichBop', N'01236545698', N'bich94@gmail.com')
INSERT [dbo].[db_DonDatHang] ([MaDonDatHang], [NgayTao], [ThanhTienDH], [TinhTrangDonHang], [MaKH], [TenKH], [sdtKH], [EmailKH]) VALUES (86, CAST(N'2017-06-10 20:17:22.000' AS DateTime), 240000, N'1         ', 9, N'BichBop', N'01236545698', N'bich94@gmail.com')
INSERT [dbo].[db_DonDatHang] ([MaDonDatHang], [NgayTao], [ThanhTienDH], [TinhTrangDonHang], [MaKH], [TenKH], [sdtKH], [EmailKH]) VALUES (87, CAST(N'2017-06-10 23:47:13.000' AS DateTime), 120000, N'6363273523', 9, N'BichBop', N'01236545698', N'bich94@gmail.com')
INSERT [dbo].[db_DonDatHang] ([MaDonDatHang], [NgayTao], [ThanhTienDH], [TinhTrangDonHang], [MaKH], [TenKH], [sdtKH], [EmailKH]) VALUES (88, CAST(N'2017-06-10 23:50:12.000' AS DateTime), 120000, N'0         ', 9, N'BichBop', N'01236545698', N'bich94@gmail.com')
INSERT [dbo].[db_DonDatHang] ([MaDonDatHang], [NgayTao], [ThanhTienDH], [TinhTrangDonHang], [MaKH], [TenKH], [sdtKH], [EmailKH]) VALUES (89, CAST(N'2017-06-11 00:00:11.000' AS DateTime), 600000, N'6363273601', 9, N'BichBop', N'01236545698', N'bich94@gmail.com')
INSERT [dbo].[db_DonDatHang] ([MaDonDatHang], [NgayTao], [ThanhTienDH], [TinhTrangDonHang], [MaKH], [TenKH], [sdtKH], [EmailKH]) VALUES (90, CAST(N'2017-06-11 00:01:10.000' AS DateTime), 480000, N'0         ', 9, N'BichBop', N'01236545698', N'bich94@gmail.com')
INSERT [dbo].[db_DonDatHang] ([MaDonDatHang], [NgayTao], [ThanhTienDH], [TinhTrangDonHang], [MaKH], [TenKH], [sdtKH], [EmailKH]) VALUES (91, CAST(N'2017-06-12 05:56:25.000' AS DateTime), 120000, N'1         ', 9, N'BichBop', N'01236545698', N'bich94@gmail.com')
INSERT [dbo].[db_DonDatHang] ([MaDonDatHang], [NgayTao], [ThanhTienDH], [TinhTrangDonHang], [MaKH], [TenKH], [sdtKH], [EmailKH]) VALUES (92, CAST(N'2017-06-12 08:59:51.000' AS DateTime), 120000, N'1         ', 9, N'BichBop', N'01236545698', N'bich94@gmail.com')
SET IDENTITY_INSERT [dbo].[db_DonDatHang] OFF
SET IDENTITY_INSERT [dbo].[db_HoaDon] ON 

INSERT [dbo].[db_HoaDon] ([MaHD], [NgayLap], [ThanhTien], [MaNV], [TenNV], [MaKH], [TenKH]) VALUES (1, CAST(N'2017-05-21 10:53:43.000' AS DateTime), 120000, NULL, NULL, 9, N'BichBop')
INSERT [dbo].[db_HoaDon] ([MaHD], [NgayLap], [ThanhTien], [MaNV], [TenNV], [MaKH], [TenKH]) VALUES (3, CAST(N'2017-05-21 10:53:43.000' AS DateTime), 190000, NULL, NULL, 9, N'BichBop')
INSERT [dbo].[db_HoaDon] ([MaHD], [NgayLap], [ThanhTien], [MaNV], [TenNV], [MaKH], [TenKH]) VALUES (5, CAST(N'2017-06-02 00:00:00.000' AS DateTime), 120000, 1, N'System', 9, N'9')
INSERT [dbo].[db_HoaDon] ([MaHD], [NgayLap], [ThanhTien], [MaNV], [TenNV], [MaKH], [TenKH]) VALUES (6, CAST(N'2017-06-02 11:53:18.000' AS DateTime), 270000, 1, N'System', 20, N'Nguyễn Văn An')
INSERT [dbo].[db_HoaDon] ([MaHD], [NgayLap], [ThanhTien], [MaNV], [TenNV], [MaKH], [TenKH]) VALUES (7, CAST(N'2017-06-02 12:01:21.000' AS DateTime), 245000, 1, N'System', 9, N'BichBop')
INSERT [dbo].[db_HoaDon] ([MaHD], [NgayLap], [ThanhTien], [MaNV], [TenNV], [MaKH], [TenKH]) VALUES (8, CAST(N'2017-06-02 12:04:04.000' AS DateTime), 295000, 1, N'System', 9, N'BichBop')
INSERT [dbo].[db_HoaDon] ([MaHD], [NgayLap], [ThanhTien], [MaNV], [TenNV], [MaKH], [TenKH]) VALUES (9, CAST(N'2017-06-02 12:14:41.000' AS DateTime), 2440000, 1, N'System', 9, N'BichBop')
INSERT [dbo].[db_HoaDon] ([MaHD], [NgayLap], [ThanhTien], [MaNV], [TenNV], [MaKH], [TenKH]) VALUES (10, CAST(N'2017-06-02 12:49:01.000' AS DateTime), 270000, 1, N'System', 9, N'BichBop')
INSERT [dbo].[db_HoaDon] ([MaHD], [NgayLap], [ThanhTien], [MaNV], [TenNV], [MaKH], [TenKH]) VALUES (11, CAST(N'2017-06-02 15:24:50.000' AS DateTime), 405000, 1, N'System', 9, N'BichBop')
INSERT [dbo].[db_HoaDon] ([MaHD], [NgayLap], [ThanhTien], [MaNV], [TenNV], [MaKH], [TenKH]) VALUES (12, CAST(N'2017-06-02 16:05:19.000' AS DateTime), 2280000, 1, N'System', 9, N'BichBop')
INSERT [dbo].[db_HoaDon] ([MaHD], [NgayLap], [ThanhTien], [MaNV], [TenNV], [MaKH], [TenKH]) VALUES (13, CAST(N'2017-06-02 16:34:45.000' AS DateTime), 720000, 1, N'System', 9, N'BichBop')
INSERT [dbo].[db_HoaDon] ([MaHD], [NgayLap], [ThanhTien], [MaNV], [TenNV], [MaKH], [TenKH]) VALUES (14, CAST(N'2017-06-09 06:21:25.000' AS DateTime), 1975000, 1, N'System', 9, N'BichBop')
INSERT [dbo].[db_HoaDon] ([MaHD], [NgayLap], [ThanhTien], [MaNV], [TenNV], [MaKH], [TenKH]) VALUES (15, CAST(N'2017-06-09 09:33:52.000' AS DateTime), 120000, 1, N'System', 9, N'BichBop')
INSERT [dbo].[db_HoaDon] ([MaHD], [NgayLap], [ThanhTien], [MaNV], [TenNV], [MaKH], [TenKH]) VALUES (16, CAST(N'2017-06-10 09:18:02.000' AS DateTime), 120000, 1, N'System', 9, N'BichBop')
INSERT [dbo].[db_HoaDon] ([MaHD], [NgayLap], [ThanhTien], [MaNV], [TenNV], [MaKH], [TenKH]) VALUES (17, CAST(N'2017-06-10 20:19:05.000' AS DateTime), 240000, 1, N'System', 9, N'BichBop')
INSERT [dbo].[db_HoaDon] ([MaHD], [NgayLap], [ThanhTien], [MaNV], [TenNV], [MaKH], [TenKH]) VALUES (18, CAST(N'2017-06-12 05:57:28.000' AS DateTime), 120000, 1, N'System', 9, N'BichBop')
INSERT [dbo].[db_HoaDon] ([MaHD], [NgayLap], [ThanhTien], [MaNV], [TenNV], [MaKH], [TenKH]) VALUES (19, CAST(N'2017-06-12 09:00:51.000' AS DateTime), 120000, 1, N'System', 9, N'BichBop')
SET IDENTITY_INSERT [dbo].[db_HoaDon] OFF
SET IDENTITY_INSERT [dbo].[db_KhachHang] ON 

INSERT [dbo].[db_KhachHang] ([MaKH], [TenKh], [DiaChiKH], [sdtKH], [EmailKH], [MatKhau]) VALUES (1, N'Lê  Thị Sim', N'Hà Nam', N'0963290731', N'simxinh@gmail.com', N'd41d8cd98f00b204e9800998ecf8427e')
INSERT [dbo].[db_KhachHang] ([MaKH], [TenKh], [DiaChiKH], [sdtKH], [EmailKH], [MatKhau]) VALUES (2, N'Nguyễn Thị Mai', N'Nghệ An', N'0968541093', N'maidien@gmail.com', N'827ccb0eea8a706c4c34a16891f84e7b')
INSERT [dbo].[db_KhachHang] ([MaKH], [TenKh], [DiaChiKH], [sdtKH], [EmailKH], [MatKhau]) VALUES (4, N'Nguyễn Văn Hòa', N'Hà Nội', N'0987654321', N'kythuat@tatthanh.com.vn', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[db_KhachHang] ([MaKH], [TenKh], [DiaChiKH], [sdtKH], [EmailKH], [MatKhau]) VALUES (5, N'Nguyễn Xuân Bích', N'Hà Nội', N'0972409205', N'canhbuomphieudutk111@gmail.com', N'c20ad4d76fe97759aa27a0c99bff6710')
INSERT [dbo].[db_KhachHang] ([MaKH], [TenKh], [DiaChiKH], [sdtKH], [EmailKH], [MatKhau]) VALUES (6, N'Bích Nguyễn', N'Hưng Yên', N'0123654887', N'bich@gmail.com', N'827ccb0eea8a706c4c34a16891f84e7b')
INSERT [dbo].[db_KhachHang] ([MaKH], [TenKh], [DiaChiKH], [sdtKH], [EmailKH], [MatKhau]) VALUES (7, N'Đức hâm', N'Trung quốc', N'01236523652', N'duc@gmail.com', N'827ccb0eea8a706c4c34a16891f84e7b')
INSERT [dbo].[db_KhachHang] ([MaKH], [TenKh], [DiaChiKH], [sdtKH], [EmailKH], [MatKhau]) VALUES (8, N'Bích', N'không có', N'123456789', N'abc@gmail.com', N'827ccb0eea8a706c4c34a16891f84e7b')
INSERT [dbo].[db_KhachHang] ([MaKH], [TenKh], [DiaChiKH], [sdtKH], [EmailKH], [MatKhau]) VALUES (9, N'BichBop', N'Hưng Yên', N'01236545698', N'bich94@gmail.com', N'827ccb0eea8a706c4c34a16891f84e7b')
INSERT [dbo].[db_KhachHang] ([MaKH], [TenKh], [DiaChiKH], [sdtKH], [EmailKH], [MatKhau]) VALUES (10, N'Bính Nguyễn', N'Hoàng Đạo Thúy Cầu Giấy', N'01236526589', N'binhnguyen123@gmail.com', N'd41d8cd98f00b204e9800998ecf8427e')
INSERT [dbo].[db_KhachHang] ([MaKH], [TenKh], [DiaChiKH], [sdtKH], [EmailKH], [MatKhau]) VALUES (11, N'Hà Nguyễn', N'Hải Dương', N'01236332429', N'nguyenha@gmail.com', N'd41d8cd98f00b204e9800998ecf8427e')
INSERT [dbo].[db_KhachHang] ([MaKH], [TenKh], [DiaChiKH], [sdtKH], [EmailKH], [MatKhau]) VALUES (12, N'Nguyễn Văn Sơn', N'Hải Phòng', N'0985652145', N'nguyenson@tatthanh.com', N'827ccb0eea8a706c4c34a16891f84e7b')
INSERT [dbo].[db_KhachHang] ([MaKH], [TenKh], [DiaChiKH], [sdtKH], [EmailKH], [MatKhau]) VALUES (13, N'Nguyễn Quyết Thắng', N'Hà Nội', N'0123658565', N'quyetthang@gmail.com', N'827ccb0eea8a706c4c34a16891f84e7b')
INSERT [dbo].[db_KhachHang] ([MaKH], [TenKh], [DiaChiKH], [sdtKH], [EmailKH], [MatKhau]) VALUES (17, N'Hà Nguyễn', N'Hải Dương', N'01254541269', N'nguyenha74@gmail.com', N'827ccb0eea8a706c4c34a16891f84e7b')
INSERT [dbo].[db_KhachHang] ([MaKH], [TenKh], [DiaChiKH], [sdtKH], [EmailKH], [MatKhau]) VALUES (20, N'Nguyễn Văn An', N'Số nhà 150 Hoàng Đạo Thúy Cầu Giấy Hà Nội', N'0972409205', N'an123@gmail.com', N'edf7076361631e2ceee3cedf54cf8754')
INSERT [dbo].[db_KhachHang] ([MaKH], [TenKh], [DiaChiKH], [sdtKH], [EmailKH], [MatKhau]) VALUES (21, N'Bính Boong', N'Thôn yên tập nhân hòa mỹ hào hưng yên', N'01236565898', N'binh1223@gmail.com', N'827ccb0eea8a706c4c34a16891f84e7b')
INSERT [dbo].[db_KhachHang] ([MaKH], [TenKh], [DiaChiKH], [sdtKH], [EmailKH], [MatKhau]) VALUES (22, N'Nguyễn Văn Thử Nghiệm', N'số 122 đường thôn yên tập thành phố Mỹ Hào', N'01236547845', N'thunghiem@gmail.com', N'fcf4ce6453884cb9d4206275ad0d7b3c')
INSERT [dbo].[db_KhachHang] ([MaKH], [TenKh], [DiaChiKH], [sdtKH], [EmailKH], [MatKhau]) VALUES (23, N'Nguyễn Văn Thử', N'Thôn Yên Tập - Nhân Hòa - Mỹ Hào - Hưng Yên', N'01236598565', N'thu@gmail.com', N'6e7dd18463544ec48c523fc5feabb5c9')
INSERT [dbo].[db_KhachHang] ([MaKH], [TenKh], [DiaChiKH], [sdtKH], [EmailKH], [MatKhau]) VALUES (24, N'NGuyễn Văn Thử 2', N'Thôn Văn Nhuế, Xã Nhân Hòa, Hưng Yên', N'01236598565', N'thu2@gmail.com', N'827ccb0eea8a706c4c34a16891f84e7b')
SET IDENTITY_INSERT [dbo].[db_KhachHang] OFF
SET IDENTITY_INSERT [dbo].[db_Mau] ON 

INSERT [dbo].[db_Mau] ([MauID], [TenMau]) VALUES (3, N'Xanh')
INSERT [dbo].[db_Mau] ([MauID], [TenMau]) VALUES (4, N'Tím')
INSERT [dbo].[db_Mau] ([MauID], [TenMau]) VALUES (5, N'Hồng')
INSERT [dbo].[db_Mau] ([MauID], [TenMau]) VALUES (6, N'Đỏ')
INSERT [dbo].[db_Mau] ([MauID], [TenMau]) VALUES (7, N'Trắng')
INSERT [dbo].[db_Mau] ([MauID], [TenMau]) VALUES (8, N'Đen')
INSERT [dbo].[db_Mau] ([MauID], [TenMau]) VALUES (13, N'Chàm')
INSERT [dbo].[db_Mau] ([MauID], [TenMau]) VALUES (14, N'Nâu nhạt')
INSERT [dbo].[db_Mau] ([MauID], [TenMau]) VALUES (16, N'Hổ phách')
INSERT [dbo].[db_Mau] ([MauID], [TenMau]) VALUES (17, N'Nâu trầm')
INSERT [dbo].[db_Mau] ([MauID], [TenMau]) VALUES (18, N'Xanh da trời')
INSERT [dbo].[db_Mau] ([MauID], [TenMau]) VALUES (19, N'Màu Xanh Lá Cây - Nhạt')
INSERT [dbo].[db_Mau] ([MauID], [TenMau]) VALUES (20, N'Xám')
INSERT [dbo].[db_Mau] ([MauID], [TenMau]) VALUES (21, N'Vàng')
SET IDENTITY_INSERT [dbo].[db_Mau] OFF
SET IDENTITY_INSERT [dbo].[db_Menu] ON 

INSERT [dbo].[db_Menu] ([MaMenu], [TenMenu], [LienKet], [MaMenuCha], [ThuTuMenu]) VALUES (1, N'Trang chủ', N'UserPage.aspx?', 0, 1)
INSERT [dbo].[db_Menu] ([MaMenu], [TenMenu], [LienKet], [MaMenuCha], [ThuTuMenu]) VALUES (2, N'Mua sắm', N'UserPage.aspx?modul=SanPham', 0, 2)
INSERT [dbo].[db_Menu] ([MaMenu], [TenMenu], [LienKet], [MaMenuCha], [ThuTuMenu]) VALUES (3, N'Tin tức tổng hợp', N'UserPage.aspx?modul=TinTuc', 0, 1)
INSERT [dbo].[db_Menu] ([MaMenu], [TenMenu], [LienKet], [MaMenuCha], [ThuTuMenu]) VALUES (5, N'Tin công ty', N'', 3, 1)
INSERT [dbo].[db_Menu] ([MaMenu], [TenMenu], [LienKet], [MaMenuCha], [ThuTuMenu]) VALUES (6, N'Tin thế giới', N'', 3, 2)
INSERT [dbo].[db_Menu] ([MaMenu], [TenMenu], [LienKet], [MaMenuCha], [ThuTuMenu]) VALUES (7, N'Tin khuyến mại', N'', 3, 3)
INSERT [dbo].[db_Menu] ([MaMenu], [TenMenu], [LienKet], [MaMenuCha], [ThuTuMenu]) VALUES (8, N'Áo', N'', 2, 1)
INSERT [dbo].[db_Menu] ([MaMenu], [TenMenu], [LienKet], [MaMenuCha], [ThuTuMenu]) VALUES (9, N'Quần', N'', 2, 2)
INSERT [dbo].[db_Menu] ([MaMenu], [TenMenu], [LienKet], [MaMenuCha], [ThuTuMenu]) VALUES (10, N'Chân váy', N'', 2, 0)
INSERT [dbo].[db_Menu] ([MaMenu], [TenMenu], [LienKet], [MaMenuCha], [ThuTuMenu]) VALUES (11, N'Váy', N'', 2, 3)
INSERT [dbo].[db_Menu] ([MaMenu], [TenMenu], [LienKet], [MaMenuCha], [ThuTuMenu]) VALUES (14, N'Kinh tế', N'', 6, 1)
INSERT [dbo].[db_Menu] ([MaMenu], [TenMenu], [LienKet], [MaMenuCha], [ThuTuMenu]) VALUES (15, N'Tài chính', N'', 6, 2)
INSERT [dbo].[db_Menu] ([MaMenu], [TenMenu], [LienKet], [MaMenuCha], [ThuTuMenu]) VALUES (16, N'Giới thiệu', N'UserPage.aspx?modul=TinTuc&modulcon=ChiTietTinTuc&id=18', 0, 2)
INSERT [dbo].[db_Menu] ([MaMenu], [TenMenu], [LienKet], [MaMenuCha], [ThuTuMenu]) VALUES (27, N'Chất liệu Thô', N'/', 10, 1)
INSERT [dbo].[db_Menu] ([MaMenu], [TenMenu], [LienKet], [MaMenuCha], [ThuTuMenu]) VALUES (28, N'Chất liệu thô 1', N'#', 27, 1)
INSERT [dbo].[db_Menu] ([MaMenu], [TenMenu], [LienKet], [MaMenuCha], [ThuTuMenu]) VALUES (30, N'Làm đẹp', N'UserPage.aspx?modul=TinTuc&modulcon=DanhSachTinTuc&idmenu=2', 0, 1)
INSERT [dbo].[db_Menu] ([MaMenu], [TenMenu], [LienKet], [MaMenuCha], [ThuTuMenu]) VALUES (31, N'Nhịp sống', N'UserPage.aspx?modul=TinTuc&modulcon=DanhSachTinTuc&idmenu=4', 0, 1)
INSERT [dbo].[db_Menu] ([MaMenu], [TenMenu], [LienKet], [MaMenuCha], [ThuTuMenu]) VALUES (32, N'Sức khỏe', N'UserPage.aspx?modul=TinTuc&modulcon=DanhSachTinTuc&idmenu=7', 0, 1)
INSERT [dbo].[db_Menu] ([MaMenu], [TenMenu], [LienKet], [MaMenuCha], [ThuTuMenu]) VALUES (33, N'Thị trường', N'UserPage.aspx?modul=TinTuc&modulcon=DanhSachTinTuc&idmenu=5', 0, 1)
INSERT [dbo].[db_Menu] ([MaMenu], [TenMenu], [LienKet], [MaMenuCha], [ThuTuMenu]) VALUES (38, N'Trai đẹp', N'UserPage.aspx?modul=TinTuc&idmenu=17', 0, 1)
SET IDENTITY_INSERT [dbo].[db_Menu] OFF
SET IDENTITY_INSERT [dbo].[db_NhanVien] ON 

INSERT [dbo].[db_NhanVien] ([MaNV], [TenNV], [GioiTinhNV], [DiaChiNV], [sdtNV], [NgayVaoLam]) VALUES (1, N'System', N'Nam', N'HoangDaoThuy', N'12345', CAST(N'2011-01-01 00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[db_NhanVien] OFF
SET IDENTITY_INSERT [dbo].[db_NhomQuangCao] ON 

INSERT [dbo].[db_NhomQuangCao] ([NhomQuangCaoID], [TenNhomQuangCao], [ViTriQC], [ThuTuNhomQC], [AnhDaiDienQC]) VALUES (1, N'Logo ', N'logo', 1, N'2017_05_30_21_42_28_96friends.jpg')
INSERT [dbo].[db_NhomQuangCao] ([NhomQuangCaoID], [TenNhomQuangCao], [ViTriQC], [ThuTuNhomQC], [AnhDaiDienQC]) VALUES (2, N'Banner', N'banner', 2, N'2017_05_30_21_42_50_493do dong.jpg')
INSERT [dbo].[db_NhomQuangCao] ([NhomQuangCaoID], [TenNhomQuangCao], [ViTriQC], [ThuTuNhomQC], [AnhDaiDienQC]) VALUES (5, N'Logo top', N'slide', 3, N'2017_05_30_21_43_06_647angela.jpg')
INSERT [dbo].[db_NhomQuangCao] ([NhomQuangCaoID], [TenNhomQuangCao], [ViTriQC], [ThuTuNhomQC], [AnhDaiDienQC]) VALUES (6, N'Quảng cáo rìa trái web', N'phía bên trái trang', 1, N'2017_05_30_21_44_11_8giới trẻ.jpg')
INSERT [dbo].[db_NhomQuangCao] ([NhomQuangCaoID], [TenNhomQuangCao], [ViTriQC], [ThuTuNhomQC], [AnhDaiDienQC]) VALUES (7, N'Quảng cáo đầu trang 810px x 105px', N'Đầu trang cạnh logo', 1, N'2017_05_31_01_25_56_5410516408_278129572370369_1526224476_o.jpg')
INSERT [dbo].[db_NhomQuangCao] ([NhomQuangCaoID], [TenNhomQuangCao], [ViTriQC], [ThuTuNhomQC], [AnhDaiDienQC]) VALUES (13, N'Quảng cáo ngang website', N'dưới muc tin mới', 1, N'2017_05_31_21_00_35_243quangcaongang.jpg')
INSERT [dbo].[db_NhomQuangCao] ([NhomQuangCaoID], [TenNhomQuangCao], [ViTriQC], [ThuTuNhomQC], [AnhDaiDienQC]) VALUES (14, N'quảng cáo top ', N'trên cùng', 1, N'2017_05_31_21_21_13_390nhadat.gif')
SET IDENTITY_INSERT [dbo].[db_NhomQuangCao] OFF
SET IDENTITY_INSERT [dbo].[db_NhomSanPham] ON 

INSERT [dbo].[db_NhomSanPham] ([NhomID], [TenNhom], [AnhDaiDien], [ThuTu], [SoSPHienThi]) VALUES (1, N'Mẫu mới nhất trên thị trường', N'New-512.png', 1, 3)
INSERT [dbo].[db_NhomSanPham] ([NhomID], [TenNhom], [AnhDaiDien], [ThuTu], [SoSPHienThi]) VALUES (3, N'Sản phẩm bán chạy trên thị trường', N'mua nhieu.png', 3, 3)
INSERT [dbo].[db_NhomSanPham] ([NhomID], [TenNhom], [AnhDaiDien], [ThuTu], [SoSPHienThi]) VALUES (4, N'Hàng giảm giá', N'onsale 2.png', 4, 3)
INSERT [dbo].[db_NhomSanPham] ([NhomID], [TenNhom], [AnhDaiDien], [ThuTu], [SoSPHienThi]) VALUES (5, N'Hàng Hot tháng 6', N'june.png', 5, 3)
INSERT [dbo].[db_NhomSanPham] ([NhomID], [TenNhom], [AnhDaiDien], [ThuTu], [SoSPHienThi]) VALUES (6, N'Siêu phẩm hot nhất cho phái đẹp', N'onsale.png', 2, 3)
INSERT [dbo].[db_NhomSanPham] ([NhomID], [TenNhom], [AnhDaiDien], [ThuTu], [SoSPHienThi]) VALUES (8, N'Hàng mới về hè 2017', N'summer.png', 1, 3)
INSERT [dbo].[db_NhomSanPham] ([NhomID], [TenNhom], [AnhDaiDien], [ThuTu], [SoSPHienThi]) VALUES (10, N'Phổ biến nhất', N'most.png', 1, 3)
INSERT [dbo].[db_NhomSanPham] ([NhomID], [TenNhom], [AnhDaiDien], [ThuTu], [SoSPHienThi]) VALUES (11, N'Giá hủy diệt', N'2017_05_30_18_07_07_861destroy.png', 1, 3)
SET IDENTITY_INSERT [dbo].[db_NhomSanPham] OFF
SET IDENTITY_INSERT [dbo].[db_QuangCao] ON 

INSERT [dbo].[db_QuangCao] ([QuangCaoID], [TenQC], [LoaiQC], [AnhQC], [LienKet], [ThuTuQC], [NhomQuangCaoID]) VALUES (7, N'Logo web', N'', N'logoemdep.png', N'/                                                                                                   ', 1, 1)
INSERT [dbo].[db_QuangCao] ([QuangCaoID], [TenQC], [LoaiQC], [AnhQC], [LienKet], [ThuTuQC], [NhomQuangCaoID]) VALUES (8, N'Banner web', N'', N'2017_05_30_17_44_52_145vietnam.jpg', N'                                                                                                    ', 1, 2)
INSERT [dbo].[db_QuangCao] ([QuangCaoID], [TenQC], [LoaiQC], [AnhQC], [LienKet], [ThuTuQC], [NhomQuangCaoID]) VALUES (9, N'Slide 1', N'', N'slide1.jpg', N'                                                                                                    ', 1, 5)
INSERT [dbo].[db_QuangCao] ([QuangCaoID], [TenQC], [LoaiQC], [AnhQC], [LienKet], [ThuTuQC], [NhomQuangCaoID]) VALUES (10, N'Slide 2', N'', N'slide2.jpg', NULL, 2, 5)
INSERT [dbo].[db_QuangCao] ([QuangCaoID], [TenQC], [LoaiQC], [AnhQC], [LienKet], [ThuTuQC], [NhomQuangCaoID]) VALUES (11, N'Slide 3', N'', N'slide3.jpg', NULL, 3, 5)
INSERT [dbo].[db_QuangCao] ([QuangCaoID], [TenQC], [LoaiQC], [AnhQC], [LienKet], [ThuTuQC], [NhomQuangCaoID]) VALUES (24, N'Banner web Top', N'Banner', N'2017_05_31_00_47_36_1955m.jpg', N'                                                                                                    ', 1, 2)
INSERT [dbo].[db_QuangCao] ([QuangCaoID], [TenQC], [LoaiQC], [AnhQC], [LienKet], [ThuTuQC], [NhomQuangCaoID]) VALUES (26, N'300x600', N'quảng cáo gif của go', N'2017_05_31_20_15_38_258quangyt.gif', N'http://quangcaosieutoc.com/                                                                         ', 1, 6)
INSERT [dbo].[db_QuangCao] ([QuangCaoID], [TenQC], [LoaiQC], [AnhQC], [LienKet], [ThuTuQC], [NhomQuangCaoID]) VALUES (27, N'vinaphone', N'ảnh', N'2017_05_31_21_01_27_438quangcaongang.jpg', N'http://www.vinaphone.com.vn/                                                                        ', 1, 13)
INSERT [dbo].[db_QuangCao] ([QuangCaoID], [TenQC], [LoaiQC], [AnhQC], [LienKet], [ThuTuQC], [NhomQuangCaoID]) VALUES (28, N'nha dat vinh hung', N'ảnh', N'2017_05_31_21_22_54_569nhadat.gif', N'http://www.lamfacialplastics.com/                                                                   ', 1, 14)
SET IDENTITY_INSERT [dbo].[db_QuangCao] OFF
SET IDENTITY_INSERT [dbo].[db_QuyenDangNhap] ON 

INSERT [dbo].[db_QuyenDangNhap] ([MaQuyen], [TenQuyen]) VALUES (1, N'QuanTri')
INSERT [dbo].[db_QuyenDangNhap] ([MaQuyen], [TenQuyen]) VALUES (2, N'Moderator')
INSERT [dbo].[db_QuyenDangNhap] ([MaQuyen], [TenQuyen]) VALUES (4, N'Bien Tap Vien')
SET IDENTITY_INSERT [dbo].[db_QuyenDangNhap] OFF
SET IDENTITY_INSERT [dbo].[db_SanPham] ON 

INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1034, N'Áo sơ mi nam(đỏ đậm)', 3, 1, 1, N'2017_05_30_18_03_02_841sơ mi10.jpg', 0, 125000, N'Áo sơ mi nam màu xám, chất liệu coton thoáng mát', CAST(N'2017-01-23 11:57:00.000' AS DateTime), CAST(N'2017-09-23 11:57:00.000' AS DateTime), 47, 1, 100000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1035, N'Áo sơ mi nam(trắng)', 3, 1, 1, N'sơ mi 3.jpg', 60, 120000, N'Áo sơ mi nam màu sắc trắng tươi trẻ, năng động, chất liệu vải lon bóng cao cấp tọa sự thoáng mát thoải mái khi mặc', CAST(N'2017-01-23 11:57:36.000' AS DateTime), CAST(N'2017-01-23 11:57:36.000' AS DateTime), 47, 1, 100000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1036, N'Áo sơ mi trắng cộc tay', 3, 1, 1, N'sơ mi11.jpg', 121, 175000, N'Vải lon bóng cao cấp nhất, thoáng mát, giúp bạn tự tin hơn', CAST(N'2017-01-23 11:57:36.000' AS DateTime), CAST(N'2017-01-23 11:57:36.000' AS DateTime), 47, 6, 150000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1037, N'Áo phông nữ dáng rộng', 3, 1, 1, N'phông rộng 1.jpg', 299, 190000, N'Áo phông nữ dáng rộng của chúng tôi sẽ làm bạn "like a boss"', CAST(N'2017-01-23 11:57:36.000' AS DateTime), CAST(N'2017-01-23 11:57:36.000' AS DateTime), 47, 6, 100000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1038, N'Áo len cổ lọ', 3, 1, 1, N'len nữ lọ.jpg', 12, 325000, N'Áo len cổ lọ của chúng tôi sẽ làm bạn "like a boss"', CAST(N'2017-01-23 11:57:36.000' AS DateTime), CAST(N'2017-01-23 11:57:36.000' AS DateTime), 47, 6, 200000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1039, N'Áo len bó sát', 3, 1, 1, N'len nữ 1.jpg', 12, 125000, N'Áo len bó sát của chúng tôi sẽ làm bạn "like a boss"', CAST(N'2017-01-23 11:57:36.000' AS DateTime), CAST(N'2017-01-23 11:57:36.000' AS DateTime), 47, 5, 100000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1040, N'Áo vest nam', 3, 1, 1, N'vestnam4.jpg', 11, 2200000, N'Áo vest nam của chúng tôi sẽ làm bạn "like a boss"', CAST(N'2017-01-23 11:57:36.000' AS DateTime), CAST(N'2017-01-23 11:57:36.000' AS DateTime), 47, 5, 1700000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1041, N'Áo vest nữ', 3, 1, 1, N'vest nữ6.jpg', 12, 1200000, N'Áo vest nữ của chúng tôi sẽ làm bạn "like a boss"', CAST(N'2017-01-23 11:57:36.000' AS DateTime), CAST(N'2017-01-23 11:57:36.000' AS DateTime), 47, 4, 950000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1042, N'Áo phông nữ dáng rộng màu hồng', 5, 1, 1, N'phông rộng 5.png', 12, 452000, N'Chất liệu co ton co dãn thoải mái', CAST(N'2017-01-23 11:57:36.000' AS DateTime), CAST(N'2017-01-23 11:57:36.000' AS DateTime), 47, 5, 365000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1043, N'Áo phông nữ trắng dài tay cá tính', 7, 1, 1, N'phông rộng 3.jpg', 12, 175000, N'Chất liệu thun, sợi polyeste siêu bền, mát và thoải mái khi mặc', CAST(N'2017-01-23 11:57:36.000' AS DateTime), CAST(N'2017-01-23 11:57:36.000' AS DateTime), 47, 3, 150000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1044, N'Áo len nữ dáng rộng thùng thình', 3, 1, 1, N'len nữ 2.jpg', 125, 125000, N'Áo len chất liệu coton , mặc thoải mái, không bị chùng dãn', CAST(N'2017-01-23 11:57:36.000' AS DateTime), CAST(N'2017-01-23 11:57:36.000' AS DateTime), 47, 3, 100000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1045, N'Áo len nữ xanh cá tính', 3, 1, 1, N'len nữ 3.jpg', 12, 125000, N'Hàng hot đang bán rất chạy', CAST(N'2017-01-23 11:57:36.000' AS DateTime), CAST(N'2017-01-23 11:57:36.000' AS DateTime), 1057, 3, 100000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1046, N'Áo vest nam đen Viettien', 3, 1, 1, N'vestnam1.jpg', 12, 1200000, N'Sang trọng và tinh tế là những điều mà chúng tôi chỉ có thể nói về sản phẩm này, sự lựa chọn tốt nhất cho chàng trai của bạn', CAST(N'2017-01-23 11:57:36.000' AS DateTime), CAST(N'2017-01-23 11:57:36.000' AS DateTime), 47, 4, 1000000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1047, N'Chân Váy hồng ', 5, 1, 1, N'chân váy8.jpg', 125, 125000, N'Sự lựa chọn thông minh cho các bạn nữ dịu dàng', CAST(N'2017-01-23 11:57:36.000' AS DateTime), CAST(N'2017-01-23 11:57:36.000' AS DateTime), 1052, 4, 100000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1048, N'Váy búp bê', 3, 1, 1, N'váy10.jpg', 11, 128000, N'Trông bạn sẽ cực kỳ cá tính và "teen" khi mặc nó', CAST(N'2017-01-23 11:57:36.000' AS DateTime), CAST(N'2017-01-23 11:57:36.000' AS DateTime), 1052, 4, 100000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1050, N'Váy xòe babi', 3, 3, 2, N'váy2.jpg', 100, 150000, N'Váy nữ dáng suông, chất liệu coton cao cấp, kiểu dáng đẹp, chỉ có tại emdep.vn', CAST(N'2017-02-08 14:37:53.000' AS DateTime), CAST(N'2017-02-08 14:37:53.000' AS DateTime), 1052, 1, 145000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1053, N'Vest nữ (đỏ)', 3, 1, 3, N'vest nữ8.jpg', 13, 555000, N'Vest nữ siêu lịch lãm và phong cách đây, nhanh tay đặt hàng để hưởng ưu đãi từ emdep.vn', CAST(N'2017-02-13 14:58:23.000' AS DateTime), CAST(N'2017-02-13 14:58:23.000' AS DateTime), 47, 1, 475000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1073, N'Váy nữ suông trắng', 3, 2, 2, N'váy 1.jpg', 75, 455000, N'Sản phẩm mới nhất hè năm 2017, với chật liệu coton thoáng mát', CAST(N'2017-05-21 22:24:19.000' AS DateTime), CAST(N'2017-05-21 22:24:19.000' AS DateTime), 1052, 1, 395000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1091, N'Áo sơ mi nam mẫu hè 2017', 3, 18, 2, N'sơ mi15.jpg', 199, 255000, N'Áo sơ mi nam mẫu mới hè 2017, chất liệu coton thoáng mát, tạo sự trẻ trung lịch lãm cho chàng trai của bạn
', CAST(N'2017-05-27 14:50:31.000' AS DateTime), CAST(N'2018-05-27 14:50:31.000' AS DateTime), 47, 8, 200000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1092, N'Áo vest nữ sang trọng màu tím', 4, 3, 7, N'vest nữ7.jpg', 13, 750000, N'Chất đẹp, sang trọng, hàng về số lượng rất ít chỉ có 15 chiếc nên các bạn hãy nhanh tay chọn ngay nhé', CAST(N'2017-05-27 14:55:27.000' AS DateTime), CAST(N'2018-05-27 14:55:27.000' AS DateTime), 47, 8, 60000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1102, N'Túi xách da cá sấu bạch tạng', 7, 22, 3, N'2017_06_05_00_02_55_7812a.jpg', 124, 1975000, N'Túi xách giúp bạn tự tin hơn khi đi ra phố, chỉ có 2 chiếc, một chiếc của Ngọc Trinh, chiếc còn lại sẽ là của bạn nếu bạn đặt mua', CAST(N'2017-06-05 00:00:25.000' AS DateTime), CAST(N'2017-06-05 00:00:25.000' AS DateTime), 50, 8, 1755000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1103, N'Túi xách Hermes', 7, 22, 3, N'2017_06_05_00_05_13_91732.jpg', 15, 1752000, N'Với chất liệu da cá sấu cao cấp, được làm thủ công tỉ mỉ, bạn hãy nhanh tay mua ngay đi, hàng chỉ có tại emdep.vn', CAST(N'2017-06-05 00:02:55.000' AS DateTime), CAST(N'2017-06-05 00:02:55.000' AS DateTime), 50, 8, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1104, N'Túi xách nữ màu vàng thời trang', 3, 22, 3, N'2017_06_05_00_06_56_6566444-tui-xach-nu-mau-vang-thoi-trang-TU1542-0.jpg', 155, 1526000, N'Với chất liệu da cá sấu cao cấp, được làm thủ công tỉ mỉ, bạn hãy nhanh tay mua ngay đi, hàng chỉ có tại emdep.vn', CAST(N'2017-06-05 00:05:13.000' AS DateTime), CAST(N'2017-06-05 00:05:13.000' AS DateTime), 47, 8, 1235000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1105, N'Túi thời trang D&G', 13, 22, 3, N'2017_06_05_00_07_43_40926036_1491193429.jpg', 15, 1565000, N'Với chất liệu da cá sấu cao cấp, được làm thủ công tỉ mỉ, bạn hãy nhanh tay mua ngay đi, hàng chỉ có tại emdep.vn', CAST(N'2017-06-05 00:06:56.000' AS DateTime), CAST(N'2017-06-05 00:06:56.000' AS DateTime), 47, 8, 1252000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1106, N'Túi xách đen thời trang', 8, 22, 3, N'2017_06_05_00_08_26_29326677_1492676153.jpg', 12, 1715000, N'Với chất liệu da cá sấu cao cấp, được làm thủ công tỉ mỉ, bạn hãy nhanh tay mua ngay đi, hàng chỉ có tại emdep.vn', CAST(N'2017-06-05 00:07:43.000' AS DateTime), CAST(N'2017-06-05 00:07:43.000' AS DateTime), 50, 8, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1107, N'Túi siêu cá tính', 8, 22, 3, N'2017_06_05_00_09_57_5781385836000_tui-xach-dep-va-re-1.jpg', 15, 1565000, N'Với chất liệu da cá sấu cao cấp, được làm thủ công tỉ mỉ, bạn hãy nhanh tay mua ngay đi, hàng chỉ có tại emdep.vn', CAST(N'2017-06-05 00:08:26.000' AS DateTime), CAST(N'2017-06-05 00:08:26.000' AS DateTime), 50, 8, 1235000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1108, N'Túi siêu cá tính cho bạn gái', 5, 22, 12, N'2017_06_05_00_10_37_6971464771512_170918-0601.jpg', 15, 1715000, N'Với chất liệu da cao cấp, được làm thủ công tỉ mỉ, bạn hãy nhanh tay mua ngay đi, hàng chỉ có tại emdep.vn', CAST(N'2017-06-05 00:09:57.000' AS DateTime), CAST(N'2017-06-05 00:09:57.000' AS DateTime), 50, 8, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1109, N'Túi da bò handmade', 8, 22, 12, N'2017_06_05_00_11_22_388images (1).jpg', 125, 1975000, N'Với chất liệu da cao cấp, được làm thủ công tỉ mỉ, bạn hãy nhanh tay mua ngay đi, hàng chỉ có tại emdep.vn', CAST(N'2017-06-05 00:10:37.000' AS DateTime), CAST(N'2017-06-05 00:10:37.000' AS DateTime), 50, 8, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1110, N'Túi siêu cá tính màu tím', 4, 22, 12, N'2017_06_05_00_11_54_588images (2).jpg', 12, 1975000, N'Với chất liệu da cao cấp, được làm thủ công tỉ mỉ, bạn hãy nhanh tay mua ngay đi, hàng chỉ có tại emdep.vn', CAST(N'2017-06-05 00:11:22.000' AS DateTime), CAST(N'2017-06-05 00:11:22.000' AS DateTime), 50, 8, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1111, N'Túi thời trang D&G đen 2017', 8, 22, 12, N'2017_06_05_00_12_19_428images (3).jpg', 155, 1526000, N'Với chất liệu da cao cấp, được làm thủ công tỉ mỉ, bạn hãy nhanh tay mua ngay đi, hàng chỉ có tại emdep.vn', CAST(N'2017-06-05 00:11:54.000' AS DateTime), CAST(N'2017-06-05 00:11:54.000' AS DateTime), 47, 8, 1235000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1112, N'Túi siêu cá tính cho phái đẹp', 6, 22, 12, N'2017_06_05_00_12_55_444images.jpg', 125, 1565000, N'Với chất liệu da cao cấp, được làm thủ công tỉ mỉ, bạn hãy nhanh tay mua ngay đi, hàng chỉ có tại emdep.vn', CAST(N'2017-06-05 00:12:19.000' AS DateTime), CAST(N'2017-06-05 00:12:19.000' AS DateTime), 50, 8, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1113, N'Bộ 3 túi màu tím mộng mơ', 4, 27, 12, N'2017_06_05_00_13_36_226qbiw3RRv.jpg', 15, 1715000, N'Với chất liệu da cao cấp, được làm thủ công tỉ mỉ, bạn hãy nhanh tay mua ngay đi, hàng chỉ có tại emdep.vn', CAST(N'2017-06-05 00:12:55.000' AS DateTime), CAST(N'2017-06-05 00:12:55.000' AS DateTime), 50, 6, 1235000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1114, N'Túi da bò handmade màu hồng', 5, 27, 3, N'2017_06_05_00_14_07_319R4WVUnsC.jpg', 15, 1715000, N'Với chất liệu da cao cấp, được làm thủ công tỉ mỉ, bạn hãy nhanh tay mua ngay đi, hàng chỉ có tại emdep.vn', CAST(N'2017-06-05 00:13:36.000' AS DateTime), CAST(N'2017-06-05 00:13:36.000' AS DateTime), 50, 6, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1115, N'Túi da cá sấu ', 16, 27, 3, N'2017_06_05_00_23_52_88726036_1491193429.jpg', 12, 1526000, N'Với chất liệu da cao cấp, được làm thủ công tỉ mỉ, bạn hãy nhanh tay mua ngay đi, hàng chỉ có tại emdep.vn', CAST(N'2017-06-05 00:14:07.000' AS DateTime), CAST(N'2017-06-05 00:14:07.000' AS DateTime), 50, 6, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1116, N'Túi da cá sấu handmade VS10363', 5, 20, 12, N'2017_06_05_00_16_19_191tui-xach-da-that-noi-tieng-the-gioi-vs10363-xam-9229(1).jpg', 12, 1752000, N'Với chất liệu da cao cấp, được làm thủ công tỉ mỉ, bạn hãy nhanh tay mua ngay đi, hàng chỉ có tại emdep.vn', CAST(N'2017-06-05 00:15:27.000' AS DateTime), CAST(N'2017-06-05 00:15:27.000' AS DateTime), 47, 6, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1117, N'Túi xách mini nhỏ nhắn', 14, 20, 12, N'2017_06_05_00_17_14_284Tui-xach-hang-hieu-Lemino-LE22102.jpg', 125, 1715000, N'Với chất liệu da cao cấp, được làm thủ công tỉ mỉ, bạn hãy nhanh tay mua ngay đi, hàng chỉ có tại emdep.vn', CAST(N'2017-06-05 00:16:19.000' AS DateTime), CAST(N'2017-06-05 00:16:19.000' AS DateTime), 50, 6, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1118, N'Tuias LeMINO hàng hiệu', 5, 20, 12, N'2017_06_05_00_17_50_907Tui-xach-hang-hieu-LEMINO-LE22337.jpg', 15, 1975000, N'Với chất liệu da cao cấp, được làm thủ công tỉ mỉ, bạn hãy nhanh tay mua ngay đi, hàng chỉ có tại emdep.vn', CAST(N'2017-06-05 00:17:14.000' AS DateTime), CAST(N'2017-06-05 00:17:14.000' AS DateTime), 50, 6, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1119, N'Túi siêu cá tính và sang trọng', 4, 20, 12, N'2017_06_05_00_18_23_683tui-xach-nu-cao-cap-ket-hat-cuom-hoa-sang-trong-TU1504-0-xanhtim.jpg', 125, 1715000, N'Với chất liệu da cao cấp, được làm thủ công tỉ mỉ, bạn hãy nhanh tay mua ngay đi, hàng chỉ có tại emdep.vn', CAST(N'2017-06-05 00:17:51.000' AS DateTime), CAST(N'2017-06-05 00:17:51.000' AS DateTime), 50, 6, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1120, N'Túi Hermes', 4, 20, 12, N'2017_06_05_00_24_21_911385836000_tui-xach-dep-va-re-1.jpg', 125, 1975000, N'Với chất liệu da cao cấp, được làm thủ công tỉ mỉ, bạn hãy nhanh tay mua ngay đi, hàng chỉ có tại emdep.vn', CAST(N'2017-06-05 00:18:23.000' AS DateTime), CAST(N'2017-06-05 00:18:23.000' AS DateTime), 50, 6, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1121, N'Túi cao cấp ELLY', 4, 20, 12, N'2017_06_05_00_19_35_866Tui-xach-nu-thoi-trang-cao-cap-ELLY-EL74-0-600x600.jpg', 125, 1715000, N'Với chất liệu da cao cấp, được làm thủ công tỉ mỉ, bạn hãy nhanh tay mua ngay đi, hàng chỉ có tại emdep.vn', CAST(N'2017-06-05 00:19:02.000' AS DateTime), CAST(N'2017-06-05 00:19:02.000' AS DateTime), 50, 6, 1235000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1122, N'Túi nữ Xilaiyin', 7, 20, 12, N'2017_06_05_00_20_19_109tui-xach-nu-Xilaiyin-hinh1.jpg', 125, 1975000, N'Với chất liệu da cao cấp, được làm thủ công tỉ mỉ, bạn hãy nhanh tay mua ngay đi, hàng chỉ có tại emdep.vn', CAST(N'2017-06-05 00:19:36.000' AS DateTime), CAST(N'2017-06-05 00:19:36.000' AS DateTime), 50, 6, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1123, N'Túi da bò handmade siêu dễ thương', 6, 20, 12, N'2017_06_05_00_25_11_34626677_1492676153.jpg', 125, 1975000, N'Với chất liệu da cao cấp, được làm thủ công tỉ mỉ, bạn hãy nhanh tay mua ngay đi, hàng chỉ có tại emdep.vn', CAST(N'2017-06-05 00:20:19.000' AS DateTime), CAST(N'2017-06-05 00:20:19.000' AS DateTime), 50, 6, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1124, N'Tuias LeMINO hàng hiệu vàng', 3, 20, 12, N'2017_06_05_00_21_33_818txmu00402.png', 125, 1975000, N'Với chất liệu da cao cấp, được làm thủ công tỉ mỉ, bạn hãy nhanh tay mua ngay đi, hàng chỉ có tại emdep.vn', CAST(N'2017-06-05 00:21:02.000' AS DateTime), CAST(N'2017-06-05 00:21:02.000' AS DateTime), 50, 6, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1125, N'Túi vải đẹp cho nàng ', 8, 20, 12, N'2017_06_05_00_22_21_82YBUhj2HV.jpg', 125, 1526000, N'Với chất liệu vải coton cao cấp, được làm thủ công tỉ mỉ, bạn hãy nhanh tay mua ngay đi, hàng chỉ có tại emdep.vn', CAST(N'2017-06-05 00:21:33.000' AS DateTime), CAST(N'2017-06-05 00:21:33.000' AS DateTime), 50, 6, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1126, N'Váy suông trắng', 7, 2, 2, N'2017_06_05_01_06_29_777váy 1.jpg', 125, 1975000, N'Váy chất liệu coton dễ mặc, thoáng mát, kiểu dáng đẹp, rất phù hợp mặc đi chơi', CAST(N'2017-06-05 01:04:37.000' AS DateTime), CAST(N'2017-06-05 01:04:37.000' AS DateTime), 1093, 8, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1127, N'Váy suông cho nàng cá tính', 7, 2, 2, N'2017_06_05_01_07_09_475619c4ff6fba66006e543c12b1144fc23625fc931.jpg', 125, 1715000, N'Váy chất liệu coton dễ mặc, thoáng mát, kiểu dáng đẹp, rất phù hợp mặc đi chơi', CAST(N'2017-06-05 01:06:30.000' AS DateTime), CAST(N'2017-06-05 01:06:30.000' AS DateTime), 1093, 8, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1128, N'Váy xanh da trời hot nhất', 18, 2, 2, N'2017_06_05_01_08_05_4143731c810c055c621c8c13fdf6532a092621bfc8e.jpg', 15, 1715000, N'Váy chất liệu coton dễ mặc, thoáng mát, kiểu dáng đẹp, rất phù hợp mặc đi chơi', CAST(N'2017-06-05 01:07:09.000' AS DateTime), CAST(N'2017-06-05 01:07:09.000' AS DateTime), 1093, 8, 1235000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1129, N'Váy siêu dễ thương', 8, 2, 2, N'2017_06_05_01_08_40_10644304d75fedd104a30d91ea495d997e9758440f5.jpg', 12, 1715000, N'Váy chất liệu coton dễ mặc, thoáng mát, kiểu dáng đẹp, rất phù hợp mặc đi chơi', CAST(N'2017-06-05 01:08:05.000' AS DateTime), CAST(N'2017-06-05 01:08:05.000' AS DateTime), 1093, 8, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1130, N'Váy hồng dạo phố', 5, 2, 2, N'2017_06_05_01_09_05_5901381312677-bay-bong-cung-thiet-ke-cong-so--1-.jpg', 155, 1715000, N'Váy chất liệu coton dễ mặc, thoáng mát, kiểu dáng đẹp, rất phù hợp mặc đi chơi', CAST(N'2017-06-05 01:08:40.000' AS DateTime), CAST(N'2017-06-05 01:08:40.000' AS DateTime), 1093, 8, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1131, N'Váy suông trắng hot nhất', 7, 2, 2, N'2017_06_05_01_09_45_9471446113971-1446108515-1.jpg', 15, 1715000, N'Váy chất liệu coton dễ mặc, thoáng mát, kiểu dáng đẹp, rất phù hợp mặc đi chơi', CAST(N'2017-06-05 01:09:05.000' AS DateTime), CAST(N'2017-06-05 01:09:05.000' AS DateTime), 1093, 8, 1235000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1132, N'Váy suông ED01', 6, 2, 16, N'2017_06_05_01_10_33_732a6241190614301d6ab2db183c4c3fb4b.jpg', 125, 1715000, N'Váy chất liệu coton dễ mặc, thoáng mát, kiểu dáng đẹp, rất phù hợp mặc đi chơi', CAST(N'2017-06-05 01:09:46.000' AS DateTime), CAST(N'2017-06-05 01:09:46.000' AS DateTime), 47, 8, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1133, N'Váy suông ED02', 7, 2, 16, N'2017_06_05_01_10_56_950cac_kieu_vay_suong_hoa_tiet11.jpg', 125, 1715000, N'Váy chất liệu coton dễ mặc, thoáng mát, kiểu dáng đẹp, rất phù hợp mặc đi chơi', CAST(N'2017-06-05 01:10:33.000' AS DateTime), CAST(N'2017-06-05 01:10:33.000' AS DateTime), 1093, 8, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1134, N'Váy suông ED03', 5, 2, 16, N'2017_06_05_01_11_19_333dam_suong_cho_nguoi_beo_bung_5.jpg', 125, 1715000, N'Váy chất liệu coton dễ mặc, thoáng mát, kiểu dáng đẹp, rất phù hợp mặc đi chơi', CAST(N'2017-06-05 01:10:57.000' AS DateTime), CAST(N'2017-06-05 01:10:57.000' AS DateTime), 47, 8, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1135, N'Váy suông ED04', 7, 2, 16, N'2017_06_05_01_11_46_435dam_suong_dinh_no_ho_lung_01.jpg', 125, 1715000, N'Váy chất liệu coton dễ mặc, thoáng mát, kiểu dáng đẹp, rất phù hợp mặc đi chơi', CAST(N'2017-06-05 01:11:19.000' AS DateTime), CAST(N'2017-06-05 01:11:19.000' AS DateTime), 1093, 8, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1136, N'Váy suông ED05', 5, 2, 16, N'2017_06_05_01_12_44_394dam-cong-so-kk39-15.jpg', 125, 1975000, N'Váy chất liệu coton dễ mặc, thoáng mát, kiểu dáng đẹp, rất phù hợp mặc đi chơi', CAST(N'2017-06-05 01:11:46.000' AS DateTime), CAST(N'2017-06-05 01:11:46.000' AS DateTime), 1093, 8, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1137, N'Váy suông ED06', 8, 2, 16, N'2017_06_05_01_13_38_579dam-suong-phoi-luoi-femi.jpg', 125, 1715000, N'Váy chất liệu coton dễ mặc, thoáng mát, kiểu dáng đẹp, rất phù hợp mặc đi chơi', CAST(N'2017-06-05 01:12:44.000' AS DateTime), CAST(N'2017-06-05 01:12:44.000' AS DateTime), 1093, 8, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1138, N'Váy suông ED01 tím', 4, 2, 2, N'2017_06_05_01_14_22_314images.jpg', 15, 1975000, N'Váy chất liệu coton dễ mặc, thoáng mát, kiểu dáng đẹp, rất phù hợp mặc đi chơi', CAST(N'2017-06-05 01:13:45.000' AS DateTime), CAST(N'2017-06-05 01:13:45.000' AS DateTime), 1093, 1, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1139, N'Váy suông cho nàng cá tính ED1', 7, 2, 2, N'2017_06_05_01_15_03_597jer_2301_668x1000.jpg', 125, 1715000, N'Váy chất liệu coton dễ mặc, thoáng mát, kiểu dáng đẹp, rất phù hợp mặc đi chơi', CAST(N'2017-06-05 01:14:22.000' AS DateTime), CAST(N'2017-06-05 01:14:22.000' AS DateTime), 1093, 1, 1235000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1140, N'Váy suông cho nàng cá tính ED1 hồng ', 5, 2, 2, N'2017_06_05_01_16_17_642tải xuống.jpg', 125, 1715000, N'Váy chất liệu coton dễ mặc, thoáng mát, kiểu dáng đẹp, rất phù hợp mặc đi chơi', CAST(N'2017-06-05 01:15:03.000' AS DateTime), CAST(N'2017-06-05 01:15:03.000' AS DateTime), 1093, 1, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1141, N'Váy siêu dễ thương cho nàng ', 7, 2, 2, N'2017_06_05_01_17_02_326v5527-4_large (1).jpg', 125, 1715000, N'Váy chất liệu coton dễ mặc, thoáng mát, kiểu dáng đẹp, rất phù hợp mặc đi chơi', CAST(N'2017-06-05 01:16:17.000' AS DateTime), CAST(N'2017-06-05 01:16:17.000' AS DateTime), 1093, 1, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1142, N'Váy suông cho nàng cá tính ED12', 6, 2, 2, N'2017_06_05_01_17_43_514v5585-4_master.jpg', 125, 1715000, N'Váy chất liệu coton dễ mặc, thoáng mát, kiểu dáng đẹp, rất phù hợp mặc đi chơi', CAST(N'2017-06-05 01:17:02.000' AS DateTime), CAST(N'2017-06-05 01:17:02.000' AS DateTime), 1093, 1, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1143, N'Váy suông cho nàng cá tính ED8', 5, 2, 2, N'2017_06_05_01_18_23_570vay-dep-171.jpg', 125, 1715000, N'Váy chất liệu coton dễ mặc, thoáng mát, kiểu dáng đẹp, rất phù hợp mặc đi chơi', CAST(N'2017-06-05 01:17:43.000' AS DateTime), CAST(N'2017-06-05 01:17:43.000' AS DateTime), 1093, 1, 1235000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1144, N'Váy suông cho nàng cá tính ED19', 18, 2, 2, N'2017_06_05_01_18_52_996vay-suong-204-phunutoday_vn.jpg', 125, 1715000, N'Váy chất liệu coton dễ mặc, thoáng mát, kiểu dáng đẹp, rất phù hợp mặc đi chơi', CAST(N'2017-06-05 01:18:23.000' AS DateTime), CAST(N'2017-06-05 01:18:23.000' AS DateTime), 47, 1, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1145, N'Váy siêu dễ thương màu xám', 8, 2, 2, N'2017_06_05_01_19_32_487vay-suong-cho-co-nang-mum-mim_phunutody_vn-2.jpg', 125, 1715000, N'Váy chất liệu coton dễ mặc, thoáng mát, kiểu dáng đẹp, rất phù hợp mặc đi chơi', CAST(N'2017-06-05 01:18:53.000' AS DateTime), CAST(N'2017-06-05 01:18:53.000' AS DateTime), 1093, 1, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1146, N'Váy xanh cực hot', 19, 2, 2, N'2017_06_05_01_20_02_902vay-suong-don-sac-an-gian-tuoi_phunutoday_vn 5.jpg', 125, 1975000, N'Váy chất liệu coton dễ mặc, thoáng mát, kiểu dáng đẹp, rất phù hợp mặc đi chơi', CAST(N'2017-06-05 01:19:32.000' AS DateTime), CAST(N'2017-06-05 01:19:32.000' AS DateTime), 1093, 1, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1147, N'Túi xách Lemino ED01', 5, 2, 2, N'2017_06_06_01_56_46_7281(12).jpg', 15, 1975000, N'Túi xách Lemino với chất liệu da cao cấp, sang trọng và đẳng cấp, hãy nhanh tay mua ngay', CAST(N'2017-06-06 01:55:09.000' AS DateTime), CAST(N'2017-06-06 01:55:09.000' AS DateTime), 50, 1, 1235000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1148, N'Túi LEMINO hàng hiệu', 14, 2, 2, N'2017_06_06_01_57_30_88134.jpg', 15, 1975000, N'Túi xách Lemino với chất liệu da cao cấp, sang trọng và đẳng cấp, hãy nhanh tay mua ngay', CAST(N'2017-06-06 01:56:46.000' AS DateTime), CAST(N'2017-06-06 01:56:46.000' AS DateTime), 50, 1, 1252000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1149, N'Túi Lemino ED02', 5, 2, 2, N'2017_06_06_01_58_55_692568e55c3878f2_1452168643.jpg', 125, 1715000, N'Túi xách Lemino với chất liệu da cao cấp, sang trọng và đẳng cấp, hãy nhanh tay mua ngay', CAST(N'2017-06-06 01:57:30.000' AS DateTime), CAST(N'2017-06-06 01:57:30.000' AS DateTime), 50, 1, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1150, N'Tuias LeMINO hàng hiệu ED 03', 6, 2, 12, N'2017_06_06_01_59_31_8865646c76367191_1447479139.jpg', 15, 1715000, N'Túi xách Lemino với chất liệu da cao cấp, sang trọng và đẳng cấp, hãy nhanh tay mua ngay', CAST(N'2017-06-06 01:58:55.000' AS DateTime), CAST(N'2017-06-06 01:58:55.000' AS DateTime), 50, 1, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1151, N'Túi Lemino ED05', 6, 2, 12, N'2017_06_06_02_00_11_24556488b1d8d8b6_1447594781.jpg', 15, 1715000, N'Túi xách Lemino với chất liệu da cao cấp, sang trọng và đẳng cấp, hãy nhanh tay mua ngay', CAST(N'2017-06-06 01:59:32.000' AS DateTime), CAST(N'2017-06-06 01:59:32.000' AS DateTime), 50, 1, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1152, N'Túi cao cấp ELLY ED1', 6, 2, 12, N'2017_06_06_02_00_29_9545669174530dbb_1449727813.jpg', 125, 1526000, N'Túi xách Lemino với chất liệu da cao cấp, sang trọng và đẳng cấp, hãy nhanh tay mua ngay', CAST(N'2017-06-06 02:00:11.000' AS DateTime), CAST(N'2017-06-06 02:00:11.000' AS DateTime), 50, 1, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1153, N'Túi cao cấp ELLY ED4', 6, 2, 12, N'2017_06_06_02_00_48_808images (1).jpg', 125, 1715000, N'Túi xách Lemino với chất liệu da cao cấp, sang trọng và đẳng cấp, hãy nhanh tay mua ngay', CAST(N'2017-06-06 02:00:30.000' AS DateTime), CAST(N'2017-06-06 02:00:30.000' AS DateTime), 50, 1, 1235000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1154, N'Túi cao cấp ELLY ED5', 14, 2, 12, N'2017_06_06_02_01_16_917images (2).jpg', 125, 1715000, N'Túi xách Lemino với chất liệu da cao cấp, sang trọng và đẳng cấp, hãy nhanh tay mua ngay', CAST(N'2017-06-06 02:00:49.000' AS DateTime), CAST(N'2017-06-06 02:00:49.000' AS DateTime), 50, 1, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1155, N'Túi cao cấp ELLY ED7', 5, 2, 12, N'2017_06_06_02_01_47_193images (3).jpg', 15, 1975000, N'Túi xách Lemino với chất liệu da cao cấp, sang trọng và đẳng cấp, hãy nhanh tay mua ngay', CAST(N'2017-06-06 02:01:17.000' AS DateTime), CAST(N'2017-06-06 02:01:17.000' AS DateTime), 50, 1, 1235000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1156, N'Túi cao cấp ELLY1', 14, 2, 12, N'2017_06_06_02_02_11_64images (3).jpg', 15, 1975000, N'Túi xách Lemino với chất liệu da cao cấp, sang trọng và đẳng cấp, hãy nhanh tay mua ngay', CAST(N'2017-06-06 02:01:47.000' AS DateTime), CAST(N'2017-06-06 02:01:47.000' AS DateTime), 50, 1, 1235000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1157, N'Túi cao cấp ELLY ED11', 6, 2, 12, N'2017_06_06_02_02_44_811images (4).jpg', 15, 1975000, N'Túi xách Lemino với chất liệu da cao cấp, sang trọng và đẳng cấp, hãy nhanh tay mua ngay', CAST(N'2017-06-06 02:02:11.000' AS DateTime), CAST(N'2017-06-06 02:02:11.000' AS DateTime), 50, 1, 1235000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1158, N'Túi cao cấp ELLY ED13', 5, 2, 12, N'2017_06_06_02_03_19_692tong-hop-cac-shop-dat-hang-tui-xach-tren-taobao-uy-tin8.jpg', 12, 1975000, N'Túi xách Lemino với chất liệu da cao cấp, sang trọng và đẳng cấp, hãy nhanh tay mua ngay', CAST(N'2017-06-06 02:02:45.000' AS DateTime), CAST(N'2017-06-06 02:02:45.000' AS DateTime), 50, 1, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1159, N'Túi cao cấp ELLYED43', 5, 2, 12, N'2017_06_06_02_03_59_810VG209.jpg', 15, 1975000, N'Túi xách Lemino với chất liệu da cao cấp, sang trọng và đẳng cấp, hãy nhanh tay mua ngay', CAST(N'2017-06-06 02:03:19.000' AS DateTime), CAST(N'2017-06-06 02:03:19.000' AS DateTime), 50, 1, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1160, N'Túi da bò handmade siêu dễ thương ED12', 14, 2, 12, N'2017_06_06_02_04_54_432vi-cam-tay-lata-v01-da-bo-nhat-1155-4008151-1-zoom.jpg', 15, 1715000, N'Túi xách Lemino với chất liệu da cao cấp, sang trọng và đẳng cấp, hãy nhanh tay mua ngay', CAST(N'2017-06-06 02:04:00.000' AS DateTime), CAST(N'2017-06-06 02:04:00.000' AS DateTime), 50, 1, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1161, N'Bộ 3 túi leminoED55', 14, 2, 12, N'2017_06_06_02_05_31_4125646c76367191_1447479139.jpg', 15, 1975000, N'Túi xách Lemino với chất liệu da cao cấp, sang trọng và đẳng cấp, hãy nhanh tay mua ngay', CAST(N'2017-06-06 02:04:54.000' AS DateTime), CAST(N'2017-06-06 02:04:54.000' AS DateTime), 50, 1, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1162, N'Túi da bò handmade xanh da trời', 18, 2, 12, N'2017_06_06_02_06_08_675Tui-xach-thoi-trang-LEMINO-LE22335-32-03.JPG', 15, 1715000, N'Túi xách Lemino với chất liệu da cao cấp, sang trọng và đẳng cấp, hãy nhanh tay mua ngay', CAST(N'2017-06-06 02:05:31.000' AS DateTime), CAST(N'2017-06-06 02:05:31.000' AS DateTime), 50, 1, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1163, N'Túi da cá sấuED2', 18, 2, 12, N'2017_06_06_15_17_47_39134.jpg', 125, 1975000, N'Túi xách Lemino với chất liệu da cao cấp, sang trọng và đẳng cấp, hãy nhanh tay mua ngay', CAST(N'2017-06-06 02:06:08.000' AS DateTime), CAST(N'2017-06-06 02:06:08.000' AS DateTime), 50, 1, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1164, N'Balo Lemino ED33', 18, 2, 12, N'2017_06_06_02_07_23_513Tui_xach_nu_Lemino_LE23045.jpg', 125, 1715000, N'Túi xách Lemino với chất liệu da cao cấp, sang trọng và đẳng cấp, hãy nhanh tay mua ngay', CAST(N'2017-06-06 02:06:49.000' AS DateTime), CAST(N'2017-06-06 02:06:49.000' AS DateTime), 50, 1, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1165, N'Túi cao cấp ELLY ED112', 18, 2, 12, N'2017_06_06_02_07_50_637socialfeed.info-co-hoi-dac-biet-so-huu-tui-xach-le-by-lemino-tre.jpg', 125, 1715000, N'Túi xách Lemino với chất liệu da cao cấp, sang trọng và đẳng cấp, hãy nhanh tay mua ngay', CAST(N'2017-06-06 02:07:23.000' AS DateTime), CAST(N'2017-06-06 02:07:23.000' AS DateTime), 50, 1, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1166, N'Túi da cá sấu ED09', 18, 2, 3, N'2017_06_06_02_08_22_26534.jpg', 125, 1975000, N'Túi xách Lemino với chất liệu da cao cấp, sang trọng và đẳng cấp, hãy nhanh tay mua ngay', CAST(N'2017-06-06 02:07:50.000' AS DateTime), CAST(N'2017-06-06 02:07:50.000' AS DateTime), 50, 1, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1167, N'Vòng cổ bạc ED01', 18, 2, 11, N'2017_06_06_02_10_10_5276EtmwDXklarge.jpg', 15, 1715000, N'Túi xách Lemino với chất liệu da cao cấp, sang trọng và đẳng cấp, hãy nhanh tay mua ngay', CAST(N'2017-06-06 02:08:22.000' AS DateTime), CAST(N'2017-06-06 02:08:22.000' AS DateTime), 1065, 1, 1235000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1168, N'Vòng tay ED12', 18, 2, 11, N'2017_06_06_02_11_18_933307_0_dsc_13671b.jpg', 125, 1975000, N'Vòng tay cá tính, sang trọng, chất liệu bạc được gia công tỉ mỉ, đem lại vẻ đẹp sang trọng cho người đeo', CAST(N'2017-06-06 02:10:10.000' AS DateTime), CAST(N'2017-06-06 02:10:10.000' AS DateTime), 1065, 1, 1235000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1169, N'Vòng cổ bạc ED019', 18, 2, 11, N'2017_06_06_02_11_49_48255244791-1249026271-Trang_suc_2824.jpg', 125, 1975000, N'Vòng cá tính, sang trọng, chất liệu bạc được gia công tỉ mỉ, đem lại vẻ đẹp sang trọng cho người đeo', CAST(N'2017-06-06 02:11:18.000' AS DateTime), CAST(N'2017-06-06 02:11:18.000' AS DateTime), 1065, 1, 1235000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1170, N'Trang sức cưới cao cấp LeminoED12', 18, 2, 11, N'2017_06_06_02_15_19_8421352187002_thue-trang-suc-cuoi_3.jpg', 125, 1715000, N'Vòng tay cá tính, sang trọng, chất liệu bạc được gia công tỉ mỉ, đem lại vẻ đẹp sang trọng cho người đeo', CAST(N'2017-06-06 02:11:49.000' AS DateTime), CAST(N'2017-06-06 02:11:49.000' AS DateTime), 1065, 1, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1171, N'Vòng cổ ngọc trai ED13', 18, 21, 11, N'2017_06_06_02_16_07_756bo trang suc ngoc trai 3.jpg', 15, 1715000, N'Vòng tay cá tính, sang trọng, chất liệu bạc được gia công tỉ mỉ, đem lại vẻ đẹp sang trọng cho người đeo', CAST(N'2017-06-06 02:15:19.000' AS DateTime), CAST(N'2017-06-06 02:15:19.000' AS DateTime), 1065, 1, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1172, N'Bộ dây chuyền Hoa sen', 7, 21, 11, N'2017_06_06_02_16_45_830bo-day-chuyen-hoa-sen-btd002.jpg', 12, 1975000, N'Vòng tay cá tính, sang trọng, chất liệu bạc được gia công tỉ mỉ, đem lại vẻ đẹp sang trọng cho người đeo', CAST(N'2017-06-06 02:16:07.000' AS DateTime), CAST(N'2017-06-06 02:16:07.000' AS DateTime), 1065, 1, 1235000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1173, N'Bộ trang sức bạc cao cấp Luxury', 7, 21, 11, N'2017_06_06_02_31_32_208bo-day-chuyen-hoa-sen-btd002.jpg', 15, 1715000, N'Trang sức làm từ chất liệu bạc, sang trọng, chất liệu bạc được gia công tỉ mỉ, đem lại vẻ đẹp sang trọng cho người đeo', CAST(N'2017-06-06 02:16:45.000' AS DateTime), CAST(N'2017-06-06 02:16:45.000' AS DateTime), 1065, 1, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1174, N'Bộ trang sức bạc 4 món Lemino ED110', 7, 21, 11, N'2017_06_06_02_31_19_659bo trang suc ngoc trai 3.jpg', 125, 1975000, N'Trang sức bạc cao cấp, sang trọng, chất liệu bạc được gia công tỉ mỉ, đem lại vẻ đẹp sang trọng cho người đeo', CAST(N'2017-06-06 02:17:52.000' AS DateTime), CAST(N'2017-06-06 02:17:52.000' AS DateTime), 1065, 1, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1175, N'Dây chuyền bạc Lemino', 7, 21, 11, N'2017_06_06_02_19_58_625cach-tu-van-khach-hang-chon-do-trang-suc-phu-hop-nhat.jpg', 15, 1526000, N'Trang sức bạc cao cấp, sang trọng, chất liệu bạc được gia công tỉ mỉ, đem lại vẻ đẹp sang trọng cho người đeo', CAST(N'2017-06-06 02:18:47.000' AS DateTime), CAST(N'2017-06-06 02:18:47.000' AS DateTime), 1065, 1, 1235000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1176, N'Vòng cưới Lemino ED990', 7, 21, 11, N'2017_06_06_02_20_57_836chon-trang-suc-cuoi-tiet-kiem-2.jpg', 12, 1715000, N'Trang sức bạc cao cấp, sang trọng, chất liệu bạc được gia công tỉ mỉ, đem lại vẻ đẹp sang trọng cho người đeo', CAST(N'2017-06-06 02:19:58.000' AS DateTime), CAST(N'2017-06-06 02:19:58.000' AS DateTime), 1065, 1, 1235000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1177, N'Dây chuyền bạc Lemino ED98', 7, 21, 11, N'2017_06_06_02_21_36_798ecce6lbjlarge.jpg', 15, 1526000, N'Trang sức bạc cao cấp, sang trọng, chất liệu bạc được gia công tỉ mỉ, đem lại vẻ đẹp sang trọng cho người đeo', CAST(N'2017-06-06 02:20:57.000' AS DateTime), CAST(N'2017-06-06 02:20:57.000' AS DateTime), 1065, 1, 1252000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1178, N'Vòng vàng cưới Lemino EDV01', 7, 21, 11, N'2017_06_06_02_22_44_191il_fullxfull.187474586.jpg', 125, 1715000, N'Trang sức bạc cao cấp, sang trọng, chất liệu bạc được gia công tỉ mỉ, đem lại vẻ đẹp sang trọng cho người đeo', CAST(N'2017-06-06 02:21:37.000' AS DateTime), CAST(N'2017-06-06 02:21:37.000' AS DateTime), 1065, 1, 1252000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1179, N'Bộ trang sức cao cấp Lemino ED66', 7, 21, 11, N'2017_06_06_02_23_35_592images (1).jpg', 15, 1715000, N'Trang sức bạc cao cấp, sang trọng, chất liệu bạc được gia công tỉ mỉ, đem lại vẻ đẹp sang trọng cho người đeo', CAST(N'2017-06-06 02:22:44.000' AS DateTime), CAST(N'2017-06-06 02:22:44.000' AS DateTime), 1065, 1, 1235000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1180, N'Mặt dây chuyền và bông tai Lemino đính đá quý', 7, 21, 11, N'2017_06_06_02_24_19_631images (2).jpg', 125, 1715000, N'Trang sức bạc cao cấp, sang trọng, chất liệu bạc được gia công tỉ mỉ, đem lại vẻ đẹp sang trọng cho người đeo', CAST(N'2017-06-06 02:23:35.000' AS DateTime), CAST(N'2017-06-06 02:23:35.000' AS DateTime), 1065, 1, 1425000)
GO
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1181, N'Mặt dây chuyền và bông tai Lemino đính đá quý 2', 7, 21, 11, N'2017_06_06_02_24_55_392images (3).jpg', 125, 1715000, N'Trang sức bạc cao cấp, sang trọng, chất liệu bạc được gia công tỉ mỉ, đem lại vẻ đẹp sang trọng cho người đeo', CAST(N'2017-06-06 02:24:19.000' AS DateTime), CAST(N'2017-06-06 02:24:19.000' AS DateTime), 1065, 1, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1182, N'Vòng vàng cưới Lemino EDV011', 7, 21, 11, N'2017_06_06_02_25_24_645images (4).jpg', 15, 1715000, N'Trang sức bạc cao cấp, sang trọng, chất liệu bạc được gia công tỉ mỉ, đem lại vẻ đẹp sang trọng cho người đeo', CAST(N'2017-06-06 02:24:55.000' AS DateTime), CAST(N'2017-06-06 02:24:55.000' AS DateTime), 1065, 1, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1183, N'Bộ trang sức đá quý', 7, 21, 11, N'2017_06_06_02_25_53_951trang-suc-da-quy.jpg', 125, 1975000, N'Trang sức bạc cao cấp, sang trọng, chất liệu bạc được gia công tỉ mỉ, đem lại vẻ đẹp sang trọng cho người đeo', CAST(N'2017-06-06 02:25:24.000' AS DateTime), CAST(N'2017-06-06 02:25:24.000' AS DateTime), 1065, 1, 1235000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1184, N'Nhẫn đá quý Lemino', 7, 21, 11, N'2017_06_06_02_26_28_586stone-rings.jpg', 15, 1715000, N'Trang sức bạc cao cấp, sang trọng, chất liệu bạc được gia công tỉ mỉ, đem lại vẻ đẹp sang trọng cho người đeo', CAST(N'2017-06-06 02:25:53.000' AS DateTime), CAST(N'2017-06-06 02:25:53.000' AS DateTime), 47, 1, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1185, N'Bộ dây chuyền Hoa sen ED34', 7, 21, 11, N'2017_06_06_02_27_30_274tải xuống.jpg', 15, 1975000, N'Trang sức bạc cao cấp, sang trọng, chất liệu bạc được gia công tỉ mỉ, đem lại vẻ đẹp sang trọng cho người đeo', CAST(N'2017-06-06 02:26:28.000' AS DateTime), CAST(N'2017-06-06 02:26:28.000' AS DateTime), 1065, 1, 1235000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1186, N'Dây chuyền bạc Lemino ED555', 7, 21, 11, N'2017_06_06_02_28_33_650yNlMZqX1large.jpg', 125, 1975000, N'Trang sức bạc cao cấp, sang trọng, chất liệu bạc được gia công tỉ mỉ, đem lại vẻ đẹp sang trọng cho người đeo', CAST(N'2017-06-06 02:27:30.000' AS DateTime), CAST(N'2017-06-06 02:27:30.000' AS DateTime), 1065, 1, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1187, N'Vòng vàng cưới Lemino EDV05', 7, 21, 11, N'2017_06_06_02_29_05_868images.jpg', 125, 1975000, N'Trang sức bạc cao cấp, sang trọng, chất liệu bạc được gia công tỉ mỉ, đem lại vẻ đẹp sang trọng cho người đeo', CAST(N'2017-06-06 02:28:33.000' AS DateTime), CAST(N'2017-06-06 02:28:33.000' AS DateTime), 1065, 1, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1188, N'Áo vest Nữ ED01', 7, 18, 2, N'2017_06_06_07_35_14_958vest nữ10.jpg', 15, 1715000, N'Áo vest nữ ED1 với chất liệu làm từ sợi cotton giúp tạo sự thoải mái cho người mặc, kiểu dáng sang trọng và phong cách', CAST(N'2017-06-06 07:32:38.000' AS DateTime), CAST(N'2017-06-06 07:32:38.000' AS DateTime), 47, 3, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1189, N'Áo vest nữ ED02', 7, 18, 2, N'2017_06_06_07_35_51_480vest nữ9.jpg', 15, 1975000, N'Áo vest nữ với chất liệu làm từ sợi cotton giúp tạo sự thoải mái cho người mặc, kiểu dáng sang trọng và phong cách', CAST(N'2017-06-06 07:35:15.000' AS DateTime), CAST(N'2017-06-06 07:35:15.000' AS DateTime), 47, 3, 1235000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1190, N'Áo vesr nữ ED03', 7, 18, 2, N'2017_06_06_07_36_15_321vest nữ8.jpg', 15, 1975000, N'Áo vest nữ với chất liệu làm từ sợi cotton giúp tạo sự thoải mái cho người mặc, kiểu dáng sang trọng và phong cách', CAST(N'2017-06-06 07:35:51.000' AS DateTime), CAST(N'2017-06-06 07:35:51.000' AS DateTime), 47, 3, 1235000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1191, N'ÁO vest Nữ ED04 tím', 4, 18, 2, N'2017_06_06_07_36_45_763vest nữ7.jpg', 15, 1715000, N'Áo vest nữ với chất liệu làm từ sợi cotton giúp tạo sự thoải mái cho người mặc, kiểu dáng sang trọng và phong cách', CAST(N'2017-06-06 07:36:15.000' AS DateTime), CAST(N'2017-06-06 07:36:15.000' AS DateTime), 47, 3, 1235000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1192, N'Áo vest nữ ED05', 8, 18, 2, N'2017_06_06_07_37_12_830vest nữ6.jpg', 15, 1526000, N'Áo vest nữ với chất liệu làm từ sợi cotton giúp tạo sự thoải mái cho người mặc, kiểu dáng sang trọng và phong cách', CAST(N'2017-06-06 07:36:45.000' AS DateTime), CAST(N'2017-06-06 07:36:45.000' AS DateTime), 47, 3, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1193, N'Áo vesr nữ ED04', 7, 27, 2, N'2017_06_06_07_49_22_61vest nữ5.jpg', 12, 1975000, N'Áo vest nữ với chất liệu làm từ sợi cotton giúp tạo sự thoải mái cho người mặc, kiểu dáng sang trọng và phong cách', CAST(N'2017-06-06 07:37:19.000' AS DateTime), CAST(N'2017-06-06 07:37:19.000' AS DateTime), 47, 8, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1194, N'Áo vesr nữ ED05', 8, 27, 2, N'2017_06_06_07_49_53_135vest nữ4.jpg', 125, 1975000, N'Áo vest nữ với chất liệu làm từ sợi cotton giúp tạo sự thoải mái cho người mặc, kiểu dáng sang trọng và phong cách', CAST(N'2017-06-06 07:49:22.000' AS DateTime), CAST(N'2017-06-06 07:49:22.000' AS DateTime), 47, 8, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1195, N'Áo vesr nữ ED055', 8, 27, 2, N'2017_06_06_07_50_31_152vest nữ4.jpg', 125, 1975000, N'Áo vest nữ với chất liệu làm từ sợi cotton giúp tạo sự thoải mái cho người mặc, kiểu dáng sang trọng và phong cách', CAST(N'2017-06-06 07:49:22.000' AS DateTime), CAST(N'2017-06-06 07:49:22.000' AS DateTime), 47, 8, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1196, N'Áo vesr nữ ED043', 8, 27, 2, N'2017_06_06_07_51_06_638vest nữ4.jpg', 15, 1715000, N'Áo vest nữ với chất liệu làm từ sợi cotton giúp tạo sự thoải mái cho người mặc, kiểu dáng sang trọng và phong cách', CAST(N'2017-06-06 07:50:31.000' AS DateTime), CAST(N'2017-06-06 07:50:31.000' AS DateTime), 47, 8, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1197, N'Áo vesr nữ ED045', 8, 26, 1, N'2017_06_06_07_51_51_318vest nữ3.jpg', 15, 1715000, N'Áo vest nữ với chất liệu làm từ sợi cotton giúp tạo sự thoải mái cho người mặc, kiểu dáng sang trọng và phong cách', CAST(N'2017-06-06 07:51:11.000' AS DateTime), CAST(N'2017-06-06 07:51:11.000' AS DateTime), 47, 8, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1198, N'Áo vesr nữ ED035', 8, 26, 1, N'2017_06_06_07_52_13_511vest nữ.jpg', 15, 1715000, N'Áo vest nữ với chất liệu làm từ sợi cotton giúp tạo sự thoải mái cho người mặc, kiểu dáng sang trọng và phong cách', CAST(N'2017-06-06 07:51:51.000' AS DateTime), CAST(N'2017-06-06 07:51:51.000' AS DateTime), 47, 8, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1199, N'Áo vest Nam ED01', 8, 2, 1, N'2017_06_06_07_53_16_478images.jpg', 15, 1715000, N'Áo vest nam với chất liệu làm từ sợi cotton giúp tạo sự thoải mái cho người mặc, kiểu dáng sang trọng và phong cách', CAST(N'2017-06-06 07:52:38.000' AS DateTime), CAST(N'2017-06-06 07:52:38.000' AS DateTime), 47, 8, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1200, N'Áo vest Nam ED02', 8, 2, 1, N'2017_06_06_07_54_04_397tải xuống.jpg', 15, 1715000, N'Áo vest nữ với chất liệu làm từ sợi cotton giúp tạo sự thoải mái cho người mặc, kiểu dáng sang trọng và phong cách', CAST(N'2017-06-06 07:53:16.000' AS DateTime), CAST(N'2017-06-06 07:53:16.000' AS DateTime), 47, 8, 1235000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1201, N'Áo vest Nam ED05', 8, 2, 1, N'2017_06_06_07_54_41_212vestnam1.jpg', 125, 1715000, N'Áo vest nữ với chất liệu làm từ sợi cotton giúp tạo sự thoải mái cho người mặc, kiểu dáng sang trọng và phong cách', CAST(N'2017-06-06 07:54:04.000' AS DateTime), CAST(N'2017-06-06 07:54:04.000' AS DateTime), 47, 8, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1202, N'Áo vest Nam ED06', 8, 2, 1, N'2017_06_06_07_56_07_660vestnam2.jpg', 125, 1715000, N'Áo vest nữ với chất liệu làm từ sợi cotton giúp tạo sự thoải mái cho người mặc, kiểu dáng sang trọng và phong cách', CAST(N'2017-06-06 07:54:41.000' AS DateTime), CAST(N'2017-06-06 07:54:41.000' AS DateTime), 47, 8, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1203, N'Áo vest Nam ED043', 8, 2, 1, N'2017_06_06_07_56_36_433vestnam3.jpg', 125, 1975000, N'Áo vest nữ với chất liệu làm từ sợi cotton giúp tạo sự thoải mái cho người mặc, kiểu dáng sang trọng và phong cách', CAST(N'2017-06-06 07:56:07.000' AS DateTime), CAST(N'2017-06-06 07:56:07.000' AS DateTime), 47, 8, 1235000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1204, N'Áo vest Nam ED053', 8, 2, 1, N'2017_06_06_07_57_04_434vestnam4.jpg', 125, 1975000, N'Áo vest nữ với chất liệu làm từ sợi cotton giúp tạo sự thoải mái cho người mặc, kiểu dáng sang trọng và phong cách', CAST(N'2017-06-06 07:56:36.000' AS DateTime), CAST(N'2017-06-06 07:56:36.000' AS DateTime), 47, 8, 1252000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1205, N'Áo vest Nam ED059', 8, 2, 1, N'2017_06_06_07_57_22_252vestnam5.jpg', 15, 1715000, N'Áo vest nữ với chất liệu làm từ sợi cotton giúp tạo sự thoải mái cho người mặc, kiểu dáng sang trọng và phong cách', CAST(N'2017-06-06 07:57:04.000' AS DateTime), CAST(N'2017-06-06 07:57:04.000' AS DateTime), 47, 8, 1235000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1206, N'Áo vest Nam ED025', 20, 2, 1, N'2017_06_06_07_57_43_785vestnam6.jpg', 15, 1715000, N'Áo vest nữ với chất liệu làm từ sợi cotton giúp tạo sự thoải mái cho người mặc, kiểu dáng sang trọng và phong cách', CAST(N'2017-06-06 07:57:22.000' AS DateTime), CAST(N'2017-06-06 07:57:22.000' AS DateTime), 47, 8, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1207, N'Áo vest Nam ED057', 8, 2, 1, N'2017_06_06_07_58_06_123vestnam7.jpg', 15, 1715000, N'Áo vest nữ với chất liệu làm từ sợi cotton giúp tạo sự thoải mái cho người mặc, kiểu dáng sang trọng và phong cách', CAST(N'2017-06-06 07:57:43.000' AS DateTime), CAST(N'2017-06-06 07:57:43.000' AS DateTime), 47, 8, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1208, N'Áo vest Nam ED0595', 8, 2, 1, N'2017_06_06_07_59_07_389vestnam8.jpg', 15, 1526000, N'Áo vest nam với chất liệu làm từ sợi cotton giúp tạo sự thoải mái cho người mặc, kiểu dáng sang trọng và phong cách', CAST(N'2017-06-06 07:58:06.000' AS DateTime), CAST(N'2017-06-06 07:58:06.000' AS DateTime), 47, 8, 1235000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1209, N'Áo vest Nam ED0566', 8, 2, 1, N'2017_06_06_07_59_27_705vestnam9.jpg', 125, 1715000, N'Áo vest nam với chất liệu làm từ sợi cotton giúp tạo sự thoải mái cho người mặc, kiểu dáng sang trọng và phong cách', CAST(N'2017-06-06 07:59:07.000' AS DateTime), CAST(N'2017-06-06 07:59:07.000' AS DateTime), 47, 8, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1210, N'Áo vest Nam ED015', 8, 2, 1, N'2017_06_06_07_59_59_508vestnam10.jpg', 15, 1975000, N'Áo vest nam với chất liệu làm từ sợi cotton giúp tạo sự thoải mái cho người mặc, kiểu dáng sang trọng và phong cách', CAST(N'2017-06-06 07:59:27.000' AS DateTime), CAST(N'2017-06-06 07:59:27.000' AS DateTime), 47, 8, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1211, N'Áo vest Nam ED0153', 8, 2, 1, N'2017_06_06_08_00_14_194vestnam11.jpg', 125, 1715000, N'Áo vest nam với chất liệu làm từ sợi cotton giúp tạo sự thoải mái cho người mặc, kiểu dáng sang trọng và phong cách', CAST(N'2017-06-06 07:59:59.000' AS DateTime), CAST(N'2017-06-06 07:59:59.000' AS DateTime), 47, 8, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1212, N'Áo vest Nam ED025s', 8, 2, 1, N'2017_06_06_15_17_31_171vestnam4.jpg', 15, 1715000, N'Áo vest nam với chất liệu làm từ sợi cotton giúp tạo sự thoải mái cho người mặc, kiểu dáng sang trọng và phong cách', CAST(N'2017-06-06 08:00:14.000' AS DateTime), CAST(N'2017-06-06 08:00:14.000' AS DateTime), 47, 8, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1213, N'Áo vest Nam ED019', 8, 2, 1, N'2017_06_06_08_01_01_583vestnam13.jpg', 125, 1975000, N'Áo vest nam với chất liệu làm từ sợi cotton giúp tạo sự thoải mái cho người mặc, kiểu dáng sang trọng và phong cách', CAST(N'2017-06-06 08:00:44.000' AS DateTime), CAST(N'2017-06-06 08:00:44.000' AS DateTime), 47, 8, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1214, N'Áo vest Nam ED01122', 20, 2, 1, N'2017_06_06_08_01_50_505vestnam14.jpg', 15, 1715000, N'Áo vest nam với chất liệu làm từ sợi cotton giúp tạo sự thoải mái cho người mặc, kiểu dáng sang trọng và phong cách', CAST(N'2017-06-06 08:01:01.000' AS DateTime), CAST(N'2017-06-06 08:01:01.000' AS DateTime), 47, 8, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1215, N'Áo vest Nam ED01128', 8, 2, 1, N'2017_06_06_08_02_08_125vestnam15.jpg', 15, 1715000, N'Áo vest nam với chất liệu làm từ sợi cotton giúp tạo sự thoải mái cho người mặc, kiểu dáng sang trọng và phong cách', CAST(N'2017-06-06 08:01:50.000' AS DateTime), CAST(N'2017-06-06 08:01:50.000' AS DateTime), 47, 8, 1235000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1216, N'Quần bò nữ siêu cá tính ED01', 8, 2, 1, N'2017_06_06_08_04_21_9861(118).jpg', 15, 171500, N'Mẫu quần bò nữ hot nhất trên thị trường hiện nay, đủ mọi size cho các bạn, giá rẻ nhất thị trường, hãy nhanh tay mua ngay', CAST(N'2017-06-06 08:02:08.000' AS DateTime), CAST(N'2017-06-06 08:02:08.000' AS DateTime), 1080, 8, 142500)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1217, N'Quần bò nữ siêu cá tính ED02', 3, 2, 1, N'2017_06_06_08_04_45_7941-3-1482851305154.jpg', 125, 1715000, N'Mẫu quần bò nữ hot nhất trên thị trường hiện nay, đủ mọi size cho các bạn, giá rẻ nhất thị trường, hãy nhanh tay mua ngay', CAST(N'2017-06-06 08:04:22.000' AS DateTime), CAST(N'2017-06-06 08:04:22.000' AS DateTime), 1080, 8, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1218, N'Quần bò nữ siêu cá tính ED03', 3, 2, 1, N'2017_06_06_08_15_32_1201-3-1482851305154.jpg', 15, 1715000, N'Mẫu quần bò nữ hot nhất trên thị trường hiện nay, đủ mọi size cho các bạn, giá rẻ nhất thị trường, hãy nhanh tay mua ngay', CAST(N'2017-06-06 08:04:45.000' AS DateTime), CAST(N'2017-06-06 08:04:45.000' AS DateTime), 47, 8, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1219, N'Quần bò nữ siêu cá tính ED04', 3, 2, 1, N'2017_06_06_08_05_41_793351586ec5448c721f9d7adc460660615f540905b.jpg', 125, 1975000, N'Mẫu quần bò nữ hot nhất trên thị trường hiện nay, đủ mọi size cho các bạn, giá rẻ nhất thị trường, hãy nhanh tay mua ngay', CAST(N'2017-06-06 08:05:03.000' AS DateTime), CAST(N'2017-06-06 08:05:03.000' AS DateTime), 47, 8, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1220, N'Quần bò nữ siêu cá tính ED06', 3, 2, 1, N'2017_06_06_08_05_56_14320161010_b60cd10739ca7606f5bf13bfd71ccaf0_1476035372.jpg', 15, 1975000, N'Mẫu quần bò nữ hot nhất trên thị trường hiện nay, đủ mọi size cho các bạn, giá rẻ nhất thị trường, hãy nhanh tay mua ngay', CAST(N'2017-06-06 08:05:41.000' AS DateTime), CAST(N'2017-06-06 08:05:41.000' AS DateTime), 47, 8, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1221, N'Quần bò nữ siêu cá tính ED07', 3, 2, 1, N'2017_06_06_08_06_24_24020161010_b60cd10739ca7606f5bf13bfd71ccaf0_1476035372.jpg', 15, 1975000, N'Mẫu quần bò nữ hot nhất trên thị trường hiện nay, đủ mọi size cho các bạn, giá rẻ nhất thị trường, hãy nhanh tay mua ngay', CAST(N'2017-06-06 08:05:56.000' AS DateTime), CAST(N'2017-06-06 08:05:56.000' AS DateTime), 47, 8, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1222, N'Quần bò nữ siêu cá tính ED08', 3, 2, 1, N'2017_06_06_08_06_42_6941454663188-1454412838-4.jpg', 15, 1715000, N'Mẫu quần bò nữ hot nhất trên thị trường hiện nay, đủ mọi size cho các bạn, giá rẻ nhất thị trường, hãy nhanh tay mua ngay', CAST(N'2017-06-06 08:06:24.000' AS DateTime), CAST(N'2017-06-06 08:06:24.000' AS DateTime), 1080, 8, 1235000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1223, N'Quần nữ ED09', 3, 2, 1, N'2017_06_06_08_07_07_95620170123110101_52582.jpg', 125, 1526000, N'Mẫu quần nữ hot nhất trên thị trường hiện nay, đủ mọi size cho các bạn, giá rẻ nhất thị trường, hãy nhanh tay mua ngay', CAST(N'2017-06-06 08:06:42.000' AS DateTime), CAST(N'2017-06-06 08:06:42.000' AS DateTime), 1080, 8, 1235000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1224, N'Quần nữ siêu cá tính ED02', 3, 2, 1, N'2017_06_06_08_07_33_46120170123110147_60605.jpg', 15, 1715000, N'Mẫu quần nữ hot nhất trên thị trường hiện nay, đủ mọi size cho các bạn, giá rẻ nhất thị trường, hãy nhanh tay mua ngay', CAST(N'2017-06-06 08:07:08.000' AS DateTime), CAST(N'2017-06-06 08:07:08.000' AS DateTime), 1080, 8, 1235000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1225, N'Quần nữ siêu cá tính ED013', 3, 2, 1, N'2017_06_06_08_07_54_491images (1).jpg', 125, 1975000, N'Mẫu quần nữ hot nhất trên thị trường hiện nay, đủ mọi size cho các bạn, giá rẻ nhất thị trường, hãy nhanh tay mua ngay', CAST(N'2017-06-06 08:07:33.000' AS DateTime), CAST(N'2017-06-06 08:07:33.000' AS DateTime), 47, 8, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1226, N'Quần nữ siêu cá tính ED015', 3, 2, 1, N'2017_06_06_08_08_29_386images (2).jpg', 125, 1975000, N'Mẫu quần nữ hot nhất trên thị trường hiện nay, đủ mọi size cho các bạn, giá rẻ nhất thị trường, hãy nhanh tay mua ngay', CAST(N'2017-06-06 08:07:54.000' AS DateTime), CAST(N'2017-06-06 08:07:54.000' AS DateTime), 1080, 8, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1227, N'Quần bò nữ siêu cá tính ED02s', 3, 2, 1, N'2017_06_06_08_16_00_677351586ec5448c721f9d7adc460660615f540905b.jpg', 125, 1715000, N'Mẫu quần nữ hot nhất trên thị trường hiện nay, đủ mọi size cho các bạn, giá rẻ nhất thị trường, hãy nhanh tay mua ngay', CAST(N'2017-06-06 08:08:29.000' AS DateTime), CAST(N'2017-06-06 08:08:29.000' AS DateTime), 1080, 8, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1228, N'Quần bò nữ siêu cá tính ED0234', 3, 2, 1, N'2017_06_06_08_09_11_221quan-2c1ae9e4-0e39-4532-b9e0-28f80fe571c4.png', 125, 1975000, N'Mẫu quần nữ hot nhất trên thị trường hiện nay, đủ mọi size cho các bạn, giá rẻ nhất thị trường, hãy nhanh tay mua ngay', CAST(N'2017-06-06 08:08:54.000' AS DateTime), CAST(N'2017-06-06 08:08:54.000' AS DateTime), 47, 8, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1229, N'Quần bò nữ siêu cá tính ED055', 3, 2, 1, N'2017_06_06_08_09_34_511bi-quyet-dien-quan-jeans-nu-dep-cuc-chat-tao-net-ca-tinh-noi-bat-he-2017.jpg', 125, 1975000, N'Mẫu quần nữ hot nhất trên thị trường hiện nay, đủ mọi size cho các bạn, giá rẻ nhất thị trường, hãy nhanh tay mua ngay', CAST(N'2017-06-06 08:09:11.000' AS DateTime), CAST(N'2017-06-06 08:09:11.000' AS DateTime), 1080, 8, 1235000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1230, N'Quần bò nữ siêu cá tính ED0152', 3, 2, 1, N'2017_06_06_08_09_51_346hang-nhap-loai-1-quan-jean-nu-kieu-moi-2017-1m4G3-TdUaPR.jpg', 125, 1715000, N'Mẫu quần nữ hot nhất trên thị trường hiện nay, đủ mọi size cho các bạn, giá rẻ nhất thị trường, hãy nhanh tay mua ngay', CAST(N'2017-06-06 08:09:34.000' AS DateTime), CAST(N'2017-06-06 08:09:34.000' AS DateTime), 1080, 8, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1231, N'Quần bò nữ siêu cá tính ED0277', 3, 2, 1, N'2017_06_06_08_10_08_71nhung-mau-quan-dep-thanh-lich-nhat-2017-cho-nu-cong-so-u40-hinh-3.jpg', 125, 1975000, N'Mẫu quần nữ hot nhất trên thị trường hiện nay, đủ mọi size cho các bạn, giá rẻ nhất thị trường, hãy nhanh tay mua ngay', CAST(N'2017-06-06 08:09:51.000' AS DateTime), CAST(N'2017-06-06 08:09:51.000' AS DateTime), 1080, 8, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1232, N'Quần bò nữ siêu cá tính ED025', 3, 2, 1, N'2017_06_06_08_10_25_311a189ea_simg_b5529c_250x250_maxb.jpg', 15, 1715000, N'Mẫu quần nữ hot nhất trên thị trường hiện nay, đủ mọi size cho các bạn, giá rẻ nhất thị trường, hãy nhanh tay mua ngay', CAST(N'2017-06-06 08:10:08.000' AS DateTime), CAST(N'2017-06-06 08:10:08.000' AS DateTime), 47, 8, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1233, N'Quần bò nữ siêu cá tính ED0212', 20, 2, 1, N'2017_06_06_08_10_50_55PvNOuo_simg_b5529c_250x250_maxb.jpg', 15, 1526000, N'Mẫu quần nữ hot nhất trên thị trường hiện nay, đủ mọi size cho các bạn, giá rẻ nhất thị trường, hãy nhanh tay mua ngay', CAST(N'2017-06-06 08:10:25.000' AS DateTime), CAST(N'2017-06-06 08:10:25.000' AS DateTime), 1080, 8, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1234, N'Quần nữ siêu cá tính ED0245', 8, 2, 1, N'2017_06_06_08_11_14_158images (1).jpg', 125, 1975000, N'Mẫu quần nữ hot nhất trên thị trường hiện nay, đủ mọi size cho các bạn, giá rẻ nhất thị trường, hãy nhanh tay mua ngay', CAST(N'2017-06-06 08:10:50.000' AS DateTime), CAST(N'2017-06-06 08:10:50.000' AS DateTime), 1080, 8, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1235, N'Quần bò nữ siêu cá tính ED01212', 8, 2, 1, N'2017_06_06_08_12_00_772quan-jean-dai-nu-si-5.jpg', 125, 1715000, N'Mẫu quần nữ hot nhất trên thị trường hiện nay, đủ mọi size cho các bạn, giá rẻ nhất thị trường, hãy nhanh tay mua ngay', CAST(N'2017-06-06 08:11:14.000' AS DateTime), CAST(N'2017-06-06 08:11:14.000' AS DateTime), 1080, 8, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1236, N'Quần bò nữ siêu cá tính ED011232', 8, 2, 1, N'2017_06_06_08_12_15_457quan-cong-so-mua-thu-2016-1-690x985.jpg', 15, 1715000, N'Mẫu quần nữ hot nhất trên thị trường hiện nay, đủ mọi size cho các bạn, giá rẻ nhất thị trường, hãy nhanh tay mua ngay', CAST(N'2017-06-06 08:12:00.000' AS DateTime), CAST(N'2017-06-06 08:12:00.000' AS DateTime), 1080, 8, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1237, N'Quần ống rộng ED23', 8, 2, 1, N'2017_06_06_08_12_38_327set-ao-co-tron-quan-ong-rong-js443-1m4G3-96d9b8_simg_d0daf0_800x1200_max.jpg', 15, 1715000, N'Mẫu quần nữ hot nhất trên thị trường hiện nay, đủ mọi size cho các bạn, giá rẻ nhất thị trường, hãy nhanh tay mua ngay', CAST(N'2017-06-06 08:12:15.000' AS DateTime), CAST(N'2017-06-06 08:12:15.000' AS DateTime), 47, 8, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1238, N'Quần bò nữ siêu cá tính ED0223', 8, 2, 1, N'2017_06_06_08_12_54_887quan-ong-con-lung1.jpg', 15, 1975000, N'Mẫu quần nữ hot nhất trên thị trường hiện nay, đủ mọi size cho các bạn, giá rẻ nhất thị trường, hãy nhanh tay mua ngay', CAST(N'2017-06-06 08:12:38.000' AS DateTime), CAST(N'2017-06-06 08:12:38.000' AS DateTime), 1080, 8, 1235000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1239, N'Quần nữ siêu cá tính ED0178', 8, 2, 1, N'2017_06_06_08_13_24_710wgj1494236965.jpg', 15, 1715000, N'Mẫu quần nữ hot nhất trên thị trường hiện nay, đủ mọi size cho các bạn, giá rẻ nhất thị trường, hãy nhanh tay mua ngay', CAST(N'2017-06-06 08:12:55.000' AS DateTime), CAST(N'2017-06-06 08:12:55.000' AS DateTime), 1080, 8, 1235000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1240, N'Quần bò nữ siêu cá tính ED0278', 8, 2, 1, N'2017_06_06_08_13_58_144quan-jean-dai-nu-si-5.jpg', 15, 1715000, N'Mẫu quần nữ hot nhất trên thị trường hiện nay, đủ mọi size cho các bạn, giá rẻ nhất thị trường, hãy nhanh tay mua ngay', CAST(N'2017-06-06 08:13:24.000' AS DateTime), CAST(N'2017-06-06 08:13:24.000' AS DateTime), 47, 8, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1241, N'Quần bò nữ siêu cá tính ED02323', 8, 2, 1, N'2017_06_06_08_14_15_92120170123110101_52582.jpg', 125, 1715000, N'Mẫu quần nữ hot nhất trên thị trường hiện nay, đủ mọi size cho các bạn, giá rẻ nhất thị trường, hãy nhanh tay mua ngay', CAST(N'2017-06-06 08:13:58.000' AS DateTime), CAST(N'2017-06-06 08:13:58.000' AS DateTime), 1080, 8, 1235000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1242, N'Quần bò nữ siêu cá tính ED02343', 8, 2, 1, N'2017_06_06_08_14_37_6781454663188-1454412838-4.jpg', 125, 1715000, N'Mẫu quần nữ hot nhất trên thị trường hiện nay, đủ mọi size cho các bạn, giá rẻ nhất thị trường, hãy nhanh tay mua ngay', CAST(N'2017-06-06 08:14:16.000' AS DateTime), CAST(N'2017-06-06 08:14:16.000' AS DateTime), 1080, 8, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1245, N'Quần bò nữ siêu cá tính ED02444', 4, 19, 2, N'2017_06_06_08_17_38_910quan-jeans-nu-lung-cao-dep-he-2017-cho-nang-chan-thon-quyen-ru-3.jpg', 125, 1975000, N'Mẫu quần nữ hot nhất trên thị trường hiện nay, đủ mọi size cho các bạn, giá rẻ nhất thị trường, hãy nhanh tay mua ngay', CAST(N'2017-06-06 08:17:28.000' AS DateTime), CAST(N'2017-06-06 08:17:28.000' AS DateTime), 1080, 1, 1235000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1246, N'Quần bò nữ siêu cá tính ED0209', 4, 19, 2, N'2017_06_06_08_18_07_144jean skinny cap cao 4.jpg', 125, 1975000, N'Mẫu quần nữ hot nhất trên thị trường hiện nay, đủ mọi size cho các bạn, giá rẻ nhất thị trường, hãy nhanh tay mua ngay', CAST(N'2017-06-06 08:17:38.000' AS DateTime), CAST(N'2017-06-06 08:17:38.000' AS DateTime), 1080, 1, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1248, N'Áo phông nữ ED12', 3, 1, 2, N'2017_06_06_08_22_18_3751454663188-1454412838-4.jpg', 15, 1715000, N'Áo chất liệu coton thoáng mát, kiểu dáng phong cách và cá tính', CAST(N'2017-06-06 08:22:07.000' AS DateTime), CAST(N'2017-06-06 08:22:07.000' AS DateTime), 47, 8, 1235000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1249, N'Mũ nón nữ ED01', 6, 1, 2, N'2017_06_06_08_32_47_689bc2b9dc08f1ad633b8bddfbaadf0144.jpg', 125, 1715000, N'Mũ nữ siêu cá tính , với chất liệu sợi bông cao cấp, luôn thoáng mát khi đội', CAST(N'2017-06-06 08:28:16.000' AS DateTime), CAST(N'2017-06-06 08:28:16.000' AS DateTime), 1081, 1, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1250, N'Mũ nón nữ ED02', 5, 1, 2, N'2017_06_06_15_18_37_3302525124252_1546845176.220x220.jpg', 15, 1715000, N'Mũ nữ siêu cá tính , với chất liệu sợi bông cao cấp, luôn thoáng mát khi đội', CAST(N'2017-06-06 08:32:47.000' AS DateTime), CAST(N'2017-06-06 08:32:47.000' AS DateTime), 1081, 1, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1251, N'Muc len nữ vàng ED03', 19, 1, 2, N'2017_06_06_08_33_38_8052525124252_1546845176.220x220.jpg', 125, 1526000, N'Mũ nữ siêu cá tính , với chất liệu sợi bông cao cấp, luôn thoáng mát khi đội', CAST(N'2017-06-06 08:33:12.000' AS DateTime), CAST(N'2017-06-06 08:33:12.000' AS DateTime), 1081, 1, 1235000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1252, N'Mũ nón nữ ED012', 5, 1, 2, N'2017_06_06_08_33_58_8102775812090_1129403361.220x220.jpg', 15, 1715000, N'Mũ nữ siêu cá tính , với chất liệu sợi bông cao cấp, luôn thoáng mát khi đội', CAST(N'2017-06-06 08:33:38.000' AS DateTime), CAST(N'2017-06-06 08:33:38.000' AS DateTime), 1081, 1, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1253, N'Mũ lưỡi trai nữ ED02', 8, 1, 2, N'2017_06_06_08_34_26_9652951674891_1566740868.220x220.jpg', 15, 1715000, N'Mũ nữ siêu cá tính , với chất liệu sợi bông cao cấp, luôn thoáng mát khi đội', CAST(N'2017-06-06 08:33:58.000' AS DateTime), CAST(N'2017-06-06 08:33:58.000' AS DateTime), 1081, 1, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1254, N'Mũ chống nắng nữ ED03', 5, 1, 2, N'2017_06_06_08_34_55_7243043923137_1358633301.220x220.jpg', 15, 1715000, N'Mũ nữ siêu cá tính , với chất liệu sợi bông cao cấp, luôn thoáng mát khi đội', CAST(N'2017-06-06 08:34:27.000' AS DateTime), CAST(N'2017-06-06 08:34:27.000' AS DateTime), 1081, 1, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1255, N'Mũ nón nữ ED0123', 13, 1, 2, N'2017_06_06_08_35_39_958201206133642_1310814980919765028_574_574.jpg', 125, 1975000, N'Mũ nữ siêu cá tính , với chất liệu sợi bông cao cấp, luôn thoáng mát khi đội', CAST(N'2017-06-06 08:34:55.000' AS DateTime), CAST(N'2017-06-06 08:34:55.000' AS DateTime), 1081, 1, 1235000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1256, N'Mũ nón nữ ED0112', 5, 1, 2, N'2017_06_06_08_36_02_370Fedora-376.jpg', 15, 1715000, N'Mũ nữ siêu cá tính , với chất liệu sợi bông cao cấp, luôn thoáng mát khi đội', CAST(N'2017-06-06 08:35:40.000' AS DateTime), CAST(N'2017-06-06 08:35:40.000' AS DateTime), 1081, 1, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1257, N'Mũ nón nữ ED0112d', 5, 1, 2, N'2017_06_06_16_24_04_626201206133642_1310814980919765028_574_574.jpg', 15, 1715000, N'Mũ nữ siêu cá tính , với chất liệu sợi bông cao cấp, luôn thoáng mát khi đội', CAST(N'2017-06-06 08:35:40.000' AS DateTime), CAST(N'2017-06-06 08:35:40.000' AS DateTime), 1081, 1, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1258, N'Muc len nữ màu hồng', 5, 1, 2, N'2017_06_06_08_36_47_359images (1).jpg', 12, 1975000, N'Mũ nữ siêu cá tính , với chất liệu sợi bông cao cấp, luôn thoáng mát khi đội', CAST(N'2017-06-06 08:36:11.000' AS DateTime), CAST(N'2017-06-06 08:36:11.000' AS DateTime), 1081, 1, 1235000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1259, N'Mũ len nữ Tím', 4, 1, 2, N'2017_06_06_08_37_25_96images (2).jpg', 125, 1526000, N'Mũ nữ siêu cá tính , với chất liệu sợi bông cao cấp, luôn thoáng mát khi đội', CAST(N'2017-06-06 08:36:47.000' AS DateTime), CAST(N'2017-06-06 08:36:47.000' AS DateTime), 1081, 1, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1260, N'Mũ len nữ Hồng nhạt', 5, 1, 2, N'2017_06_06_08_37_48_634images (3).jpg', 125, 1715000, N'Mũ nữ siêu cá tính , với chất liệu sợi bông cao cấp, luôn thoáng mát khi đội', CAST(N'2017-06-06 08:37:25.000' AS DateTime), CAST(N'2017-06-06 08:37:25.000' AS DateTime), 1081, 1, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1261, N'Mũ nón nữ ED123', 7, 1, 1, N'2017_06_06_14_52_34_1602775812090_1129403361.220x220.jpg', 15, 1715000, N'Mũ nón nữ cao cấp, chất liệu đẹp và thoáng mát, Hãy nhanh tay mua ngay', CAST(N'2017-06-06 14:50:15.000' AS DateTime), CAST(N'2017-06-06 14:50:15.000' AS DateTime), 1081, 1, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1262, N'Muc len nữ trắng ED03', 7, 1, 2, N'2017_06_06_14_52_59_890images (4).jpg', 125, 1715000, N'Mũ nón nữ cao cấp, chất liệu đẹp và thoáng mát, Hãy nhanh tay mua ngay', CAST(N'2017-06-06 14:52:34.000' AS DateTime), CAST(N'2017-06-06 14:52:34.000' AS DateTime), 1081, 1, 1235000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1263, N'Mũ nón nữ ED01231', 7, 1, 2, N'2017_06_06_15_15_56_17tải xuống.jpg', 125, 1975000, N'Sản phẩm mới nhất trên thị trường  hiện nay, đang cháy hàng, hãy nhanh tay mua ngay', CAST(N'2017-06-06 14:53:00.000' AS DateTime), CAST(N'2017-06-06 14:53:00.000' AS DateTime), 1081, 1, 1235000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1264, N'Mũ rộng vành nữ Fedora Ed01', 7, 1, 2, N'2017_06_06_16_32_39_3701264.jpg', 125, 1975000, N'Mũ rộng vành tránh tia UV và các tia có hại cho da khác, kiểu dáng mũ sang trọng , hãy nhanh tay đặt mua ngay nhé', CAST(N'2017-06-06 16:31:25.000' AS DateTime), CAST(N'2017-06-06 16:31:25.000' AS DateTime), 1081, 1, 1235000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1265, N'Mũ chống nắng nữ Fedora ED 18', 7, 1, 2, N'2017_06_06_16_33_55_141120816VideoMubelt-40179.jpg', 125, 1715000, N'Mũ có chất liệu cotton cao cấp nhất, chống được tia UV và tia tử ngoại, kiểu dáng rất đẹp, phù hợp với đi chơi, picnic', CAST(N'2017-06-06 16:32:39.000' AS DateTime), CAST(N'2017-06-06 16:32:39.000' AS DateTime), 1081, 1, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1266, N'Mũ rộng vành nữ Fedora Ed05', 13, 1, 2, N'2017_06_06_16_35_38_594non-mu-ni-rong-vanh-fedora-nhap-loai-1-k791508-1m4G3-9de486.JPG', 125, 1715000, N'Mũ có chất liệu cotton cao cấp nhất, chống được tia UV và tia tử ngoại, kiểu dáng rất đẹp, phù hợp với đi chơi, picnic', CAST(N'2017-06-06 16:33:55.000' AS DateTime), CAST(N'2017-06-06 16:33:55.000' AS DateTime), 1081, 1, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1267, N'Mũ rộng vành nữ Fedora ED120', 18, 1, 2, N'2017_06_06_16_41_20_6851264.jpg', 125, 1715000, N'Mũ có chất liệu cotton cao cấp nhất, chống được tia UV và tia tử ngoại, kiểu dáng rất đẹp, phù hợp với đi chơi, picnic', CAST(N'2017-06-06 16:35:38.000' AS DateTime), CAST(N'2017-06-06 16:35:38.000' AS DateTime), 47, 1, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1268, N'Mũ rộng vành nữ Fedora ED125', 18, 1, 2, N'2017_06_06_16_36_56_317tải xuống.jpg', 125, 1715000, N'Mũ rộng vành nữ Fedora', CAST(N'2017-06-06 16:36:06.000' AS DateTime), CAST(N'2017-06-06 16:36:06.000' AS DateTime), 1081, 1, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1269, N'Đồng hồ Casio', 21, 1, 11, N'2017_06_06_16_45_13_462168545882_Dong-ho-casio-MTP-X100D-1AVDF.jpg', 125, 1975000, N'Đồng hồ casio thần thánh với lịch sủ lâu đời và rất sang trọng, lịch sự, bền bỉ với thời gian', CAST(N'2017-06-06 16:43:52.000' AS DateTime), CAST(N'2017-06-06 16:43:52.000' AS DateTime), 1083, 1, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1270, N'Đồng hồ Casio MT21', 21, 1, 11, N'2017_06_06_16_45_34_61475214728_Dong-ho-casio-LTP-1314D-1AVDF.jpg', 15, 1715000, N'Đồng hồ casio thần thánh với lịch sủ lâu đời và rất sang trọng, lịch sự, bền bỉ với thời gian', CAST(N'2017-06-06 16:45:13.000' AS DateTime), CAST(N'2017-06-06 16:45:13.000' AS DateTime), 1083, 1, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1271, N'Đồng hồ Casio MT22', 21, 1, 11, N'2017_06_06_16_45_50_857A158WA-1DF-W300-600x600.png', 15, 1975000, N'Đồng hồ casio thần thánh với lịch sủ lâu đời và rất sang trọng, lịch sự, bền bỉ với thời gian', CAST(N'2017-06-06 16:45:34.000' AS DateTime), CAST(N'2017-06-06 16:45:34.000' AS DateTime), 1083, 1, 1235000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1272, N'Đồng hồ Casio MT25', 21, 1, 11, N'2017_06_06_16_46_05_932A500WGA-9DF-W300.png', 15, 1975000, N'Đồng hồ casio thần thánh với lịch sủ lâu đời và rất sang trọng, lịch sự, bền bỉ với thời gian', CAST(N'2017-06-06 16:45:51.000' AS DateTime), CAST(N'2017-06-06 16:45:51.000' AS DateTime), 1083, 1, 1235000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1273, N'Đồng hồ Casio MT28', 21, 1, 11, N'2017_06_06_16_47_19_362AE-1200WHD-1AVDF.png', 15, 1715000, N'Đồng hồ casio thần thánh với lịch sủ lâu đời và rất sang trọng, lịch sự, bền bỉ với thời gian', CAST(N'2017-06-06 16:46:06.000' AS DateTime), CAST(N'2017-06-06 16:46:06.000' AS DateTime), 1083, 1, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1274, N'Đồng hồ Casio MT29', 21, 1, 11, N'2017_06_06_16_47_36_891AE-1200WHD-1AVDF.png', 15, 1715000, N'Đồng hồ casio thần thánh với lịch sủ lâu đời và rất sang trọng, lịch sự, bền bỉ với thời gian', CAST(N'2017-06-06 16:47:19.000' AS DateTime), CAST(N'2017-06-06 16:47:19.000' AS DateTime), 1083, 1, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1275, N'Đồng hồ Casio MT32', 21, 1, 11, N'2017_06_06_16_48_15_358dong-ho-casio-bga-131-1b2dr.jpg', 125, 1975000, N'Đồng hồ casio thần thánh với lịch sủ lâu đời và rất sang trọng, lịch sự, bền bỉ với thời gian', CAST(N'2017-06-06 16:47:37.000' AS DateTime), CAST(N'2017-06-06 16:47:37.000' AS DateTime), 1083, 1, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1276, N'Đồng hồ Casio MT211', 21, 1, 11, N'2017_06_06_16_48_33_477f91w1_xlarge-vi.jpg', 125, 1975000, N'Đồng hồ casio thần thánh với lịch sủ lâu đời và rất sang trọng, lịch sự, bền bỉ với thời gian', CAST(N'2017-06-06 16:48:15.000' AS DateTime), CAST(N'2017-06-06 16:48:15.000' AS DateTime), 1083, 1, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1277, N'Đồng hồ Casio MT22 Gold', 21, 1, 11, N'2017_06_06_16_49_14_108images (1).jpg', 15, 1965000, N'Đồng hồ casio thần thánh với lịch sủ lâu đời và rất sang trọng, lịch sự, bền bỉ với thời gian', CAST(N'2017-06-06 16:48:33.000' AS DateTime), CAST(N'2017-06-06 16:48:33.000' AS DateTime), 1083, 1, 1755000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1278, N'Đồng hồ Casio MT22 Gold phiên bản limited', 21, 2, 9, N'2017_06_06_16_50_26_448images (2).jpg', 12, 2715000, N'Đồng hồ casio thần thánh với lịch sủ lâu đời và rất sang trọng, lịch sự, bền bỉ với thời gian', CAST(N'2017-06-06 16:49:17.000' AS DateTime), CAST(N'2017-06-06 16:49:17.000' AS DateTime), 1083, 1, 1935000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1279, N'Đồng hồ Casio MT2114', 21, 2, 9, N'2017_06_06_16_51_04_108images.jpg', 125, 1715000, N'Đồng hồ casio thần thánh với lịch sủ lâu đời và rất sang trọng, lịch sự, bền bỉ với thời gian', CAST(N'2017-06-06 16:50:26.000' AS DateTime), CAST(N'2017-06-06 16:50:26.000' AS DateTime), 1083, 1, 1425000)
INSERT [dbo].[db_SanPham] ([MaSP], [TenSP], [MauID], [SizeID], [ChatLieuID], [AnhSP], [SoLuongSP], [GiaSP], [MotaSP], [NgayTao], [NgayHuy], [MaDM], [NhomID], [GiaNhapSP]) VALUES (1280, N'Váy siêu dễ thương ED12', 7, 1, 2, N'2017_06_06_16_52_07_180cac_kieu_vay_suong_hoa_tiet11.jpg', 15, 1715000, N'Váy suông dạo phố cho nàng mùa hè 2017, mẫu mới nhất trên thị trường', CAST(N'2017-06-06 16:51:04.000' AS DateTime), CAST(N'2017-06-06 16:51:04.000' AS DateTime), 1052, 1, 1425000)
SET IDENTITY_INSERT [dbo].[db_SanPham] OFF
SET IDENTITY_INSERT [dbo].[db_Size] ON 

INSERT [dbo].[db_Size] ([SizeID], [TenSize]) VALUES (1, N'MXL')
INSERT [dbo].[db_Size] ([SizeID], [TenSize]) VALUES (2, N'L')
INSERT [dbo].[db_Size] ([SizeID], [TenSize]) VALUES (3, N'XL')
INSERT [dbo].[db_Size] ([SizeID], [TenSize]) VALUES (16, N'SL')
INSERT [dbo].[db_Size] ([SizeID], [TenSize]) VALUES (17, N'LL')
INSERT [dbo].[db_Size] ([SizeID], [TenSize]) VALUES (18, N'Free Size')
INSERT [dbo].[db_Size] ([SizeID], [TenSize]) VALUES (19, N'XXL')
INSERT [dbo].[db_Size] ([SizeID], [TenSize]) VALUES (20, N'MSL')
INSERT [dbo].[db_Size] ([SizeID], [TenSize]) VALUES (21, N'39')
INSERT [dbo].[db_Size] ([SizeID], [TenSize]) VALUES (22, N'40')
INSERT [dbo].[db_Size] ([SizeID], [TenSize]) VALUES (23, N'37')
INSERT [dbo].[db_Size] ([SizeID], [TenSize]) VALUES (24, N'38')
INSERT [dbo].[db_Size] ([SizeID], [TenSize]) VALUES (25, N'41')
INSERT [dbo].[db_Size] ([SizeID], [TenSize]) VALUES (26, N'42')
INSERT [dbo].[db_Size] ([SizeID], [TenSize]) VALUES (27, N'43')
INSERT [dbo].[db_Size] ([SizeID], [TenSize]) VALUES (28, N'44')
INSERT [dbo].[db_Size] ([SizeID], [TenSize]) VALUES (29, N'45')
INSERT [dbo].[db_Size] ([SizeID], [TenSize]) VALUES (30, N'36')
INSERT [dbo].[db_Size] ([SizeID], [TenSize]) VALUES (32, N'SSL')
SET IDENTITY_INSERT [dbo].[db_Size] OFF
SET IDENTITY_INSERT [dbo].[db_TinTuc] ON 

INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (6, N'Giới trẻ thế giới ai cũng "lên đồ" vừa đẹp vừa nổi không chê vào đâu được', N'2017_05_30_18_07_49_789giới trẻ.jpg', N'Thay vì mix chiếc sweatshirt màu vàng nổi bật này theo công thức "giấu quần", cô nàng này lại sơvin cùng với shorts cạp cao vừa gọn gàng lại vừa cá tính. Túi tote, giày sneaker và tất lửng chắc chắn l', CAST(N'2016-10-09 00:00:00.000' AS DateTime), 139, N'<div class="top-content">
	<div class="sapo">
		<h2 class="knd-sapo" data-field="sapo" style="margin: 15px 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-stretch: inherit; font-size: 14px; line-height: 22px; font-family: &quot;Times New Roman&quot;; vertical-align: baseline; color: rgb(51, 51, 51); display: inline-block;">
			Street style của c&aacute;c bạn trẻ thế giới tuần qua kh&ocirc;ng chỉ hay h&ocirc; trong c&aacute;ch phối đồ m&agrave; c&ograve;n nổi bật về m&agrave;u sắc.</h2>
		<div data-check-position="detail_content_start" style="margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-stretch: inherit; font-size: medium; line-height: inherit; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; color: rgb(0, 0, 0);">
			&nbsp;</div>
		<div class="knd-content" data-field="body" style="margin: 0px 0px 20px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-stretch: inherit; font-size: medium; line-height: 22px; font-family: &quot;Times New Roman&quot;; vertical-align: baseline; display: inline-block; width: 642px; color: rgb(0, 0, 0);">
			<div class="VCSortableInPreviewMode active" style="margin: 0px auto 22px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; box-sizing: border-box; text-align: center; width: 642px;" type="Photo">
				<div style="margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; box-sizing: border-box;">
					<img alt="Giới trẻ thế giới tiếp tục thể hiện trình lên đồ vừa đẹp vừa nổi không chê vào đâu được - Ảnh 1." data-original="http://kenh14cdn.com/2016/10-1475822192591.jpg" h="1200" height="" id="img_68794ed0-8c58-11e6-b939-01b8b69b7923" photoid="68794ed0-8c58-11e6-b939-01b8b69b7923" rel="lightbox" src="http://kenh14cdn.com/thumb_w/650/2016/10-1475822192591.jpg" style="margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: bottom; box-sizing: border-box; max-width: 100%; cursor: none;" title="Giới trẻ thế giới tiếp tục thể hiện trình lên đồ vừa đẹp vừa nổi không chê vào đâu được - Ảnh 1." type="photo" w="800" width="" /></div>
				<div class="PhotoCMS_Caption" style="margin: 5px 0px 20px; padding: 0px; border: 0px; font-style: italic; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; box-sizing: border-box;">
					<p data-placeholder="[nhập chú thích]" style="margin: 0px 0px 10px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; box-sizing: border-box;">
						Thay v&igrave; mix chiếc sweatshirt m&agrave;u v&agrave;ng nổi bật n&agrave;y theo c&ocirc;ng thức &quot;giấu quần&quot;, c&ocirc; n&agrave;ng n&agrave;y lại sơvin c&ugrave;ng với shorts cạp cao vừa gọn g&agrave;ng lại vừa c&aacute; t&iacute;nh. T&uacute;i tote, gi&agrave;y sneaker v&agrave; tất lửng chắc chắn l&agrave; combo phụ kiện ho&agrave;n hảo cho set đồ n&agrave;y.</p>
				</div>
			</div>
			<div class="VCSortableInPreviewMode active" style="margin: 0px auto 22px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; box-sizing: border-box; text-align: center; width: 642px;" type="Photo">
				<div style="margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; box-sizing: border-box;">
					<img alt="Giới trẻ thế giới tiếp tục thể hiện trình lên đồ vừa đẹp vừa nổi không chê vào đâu được - Ảnh 2." data-original="http://kenh14cdn.com/2016/11-1475822192592.jpg" h="1200" height="" id="img_69173c80-8c58-11e6-b939-01b8b69b7923" photoid="69173c80-8c58-11e6-b939-01b8b69b7923" rel="lightbox" src="http://kenh14cdn.com/thumb_w/650/2016/11-1475822192592.jpg" style="margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: bottom; box-sizing: border-box; max-width: 100%; cursor: none;" title="Giới trẻ thế giới tiếp tục thể hiện trình lên đồ vừa đẹp vừa nổi không chê vào đâu được - Ảnh 2." type="photo" w="800" width="" /></div>
				<div class="PhotoCMS_Caption" style="margin: 5px 0px 20px; padding: 0px; border: 0px; font-style: italic; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; box-sizing: border-box;">
					<p data-placeholder="[nhập chú thích]" style="margin: 0px 0px 10px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; box-sizing: border-box;">
						Cũng diện sweatshirt theo kiểu sơvin nhưng c&ocirc; n&agrave;ng n&agrave;y lại to&aacute;t l&ecirc;n phong c&aacute;ch &quot;cool ngầu&quot; nhờ chiếc jean shorts r&aacute;ch te tua v&agrave; gi&agrave;y da hầm hố.</p>
				</div>
			</div>
			<div class="VCSortableInPreviewMode active" style="margin: 0px auto 22px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; box-sizing: border-box; text-align: center; width: 642px;" type="Photo">
				<div style="margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; box-sizing: border-box;">
					<img alt="Giới trẻ thế giới tiếp tục thể hiện trình lên đồ vừa đẹp vừa nổi không chê vào đâu được - Ảnh 3." data-original="http://kenh14cdn.com/2016/14-1475822192594.jpg" h="1200" height="" id="img_6ae96470-8c58-11e6-b939-01b8b69b7923" photoid="6ae96470-8c58-11e6-b939-01b8b69b7923" rel="lightbox" src="http://kenh14cdn.com/thumb_w/650/2016/14-1475822192594.jpg" style="margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: bottom; box-sizing: border-box; max-width: 100%; cursor: none;" title="Giới trẻ thế giới tiếp tục thể hiện trình lên đồ vừa đẹp vừa nổi không chê vào đâu được - Ảnh 3." type="photo" w="800" width="" /></div>
				<div class="PhotoCMS_Caption" style="margin: 5px 0px 20px; padding: 0px; border: 0px; font-style: italic; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; box-sizing: border-box;">
					<p data-placeholder="[nhập chú thích]" style="margin: 0px 0px 10px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; box-sizing: border-box;">
						Mặc d&ugrave; diện cả c&acirc;y denim theo đ&uacute;ng xu hướng từng thịnh h&agrave;nh c&aacute;ch đ&acirc;y chục năm nhưng tr&ocirc;ng c&ocirc; n&agrave;ng n&agrave;y chẳng hề lỗi thời ch&uacute;t n&agrave;o, nếu kh&ocirc;ng muốn n&oacute;i l&agrave; cực kỳ c&aacute; t&iacute;nh v&agrave; trendy. C&ocirc;ng kh&ocirc;ng nhỏ thuộc về bộ đ&ocirc;i sandal - tất lửng v&agrave; chiếc t&uacute;i mini cực kỳ nổi bật.</p>
				</div>
			</div>
		</div>
	</div>
</div>
<br />
', 1, 1)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (7, N'Zara, H&M về Việt Nam thì giới trẻ Việt vẫn chuộng order quần áo bởi những thương hiệu "hot" không kém này', N'zara.jpg', N'Nếu như Zara hay Topshop vẫn chưa đủ để thỏa mãn phong cách của bạn thì yên tâm, có đến 12 sự lựa chọn nữa cho những nàng nào thích mua sắm thời trang bình dân online. ', CAST(N'2016-10-09 00:00:00.000' AS DateTime), 85, N'<h2 class="knd-sapo" data-field="sapo">
	&nbsp; Nếu như Zara hay Topshop vẫn chưa đủ để thỏa m&atilde;n phong c&aacute;ch của bạn th&igrave; y&ecirc;n t&acirc;m, c&oacute; đến 12 sự lựa chọn nữa cho những n&agrave;ng n&agrave;o th&iacute;ch mua sắm thời trang b&igrave;nh d&acirc;n online.</h2>
<div data-check-position="detail_content_start">
	&nbsp;</div>
<div class="knd-content" data-field="body">
	<p>
		<b>CPS CHAPS</b></p>
	<p>
		L&agrave; một trong những thương hiệu thời trang b&igrave;nh d&acirc;n d&agrave;nh cho cả nam v&agrave; nữ ra đời năm 1980, CPS CHAPS hướng tới thị phần l&agrave; giới trẻ năng động, đam m&ecirc; thời trang, c&oacute; gu thẩm mỹ v&agrave; c&oacute; phong c&aacute;ch sống hiện đại, ph&oacute;ng kho&aacute;ng. Hơn 30 năm ph&aacute;t triển, h&atilde;ng đ&atilde; vượt ra khỏi bi&ecirc;n giới Th&aacute;i Lan để trở th&agrave;nh một trong những thương hiệu thời trang được y&ecirc;u th&iacute;ch của giới trẻ ch&acirc;u &Aacute; v&agrave; thế giới.</p>
	<p>
		Một trong những d&ograve;ng sản phẩm chủ đạo của CPS l&agrave; quần jeans được mệnh danh l&agrave; &quot;King of Jeans&quot; bởi phong c&aacute;ch thiết kế trẻ trung, mẫu m&atilde; phong ph&uacute;, chất liệu vải cũng như phom d&aacute;ng.</p>
	<p>
		Mức gi&aacute;: Theo kinh nghiệm của những t&iacute;n đồ shopping th&igrave; một chiếc v&aacute;y của CPS CHAPS khoảng 1,2 triệu đồng; jeans th&igrave; khoảng 1,5 triệu đồng.</p>
	<div class="VCSortableInPreviewMode noCaption" type="Photo">
		<div>
			<img alt="Zara, H&amp;M về Việt Nam thì giới trẻ Việt vẫn chuộng order quần áo bởi những thương hiệu hot không kém này - Ảnh 1." data-original="http://kenh14cdn.com/2016/cps-chaps1-1475773280181.jpg" h="1956" height="" id="img_82cb7690-8be6-11e6-b939-01b8b69b7923" photoid="82cb7690-8be6-11e6-b939-01b8b69b7923" rel="lightbox" src="http://kenh14cdn.com/thumb_w/650/2016/cps-chaps1-1475773280181.jpg" style="max-width: 100%; cursor: none;" title="Zara, H&amp;M về Việt Nam thì giới trẻ Việt vẫn chuộng order quần áo bởi những thương hiệu hot không kém này - Ảnh 1." type="photo" w="1470" width="" /></div>
		<div class="PhotoCMS_Caption">
			<p class="NLPlaceholderShow" data-placeholder="[nhập chú thích]">
				&nbsp;</p>
		</div>
	</div>
	<div class="VCSortableInPreviewMode noCaption" type="Photo">
		<div>
			<img alt="Zara, H&amp;M về Việt Nam thì giới trẻ Việt vẫn chuộng order quần áo bởi những thương hiệu hot không kém này - Ảnh 2." data-original="http://kenh14cdn.com/2016/cps-chaps2-1475773280182.jpg" h="750" height="" id="img_8313ca30-8be6-11e6-b939-01b8b69b7923" photoid="8313ca30-8be6-11e6-b939-01b8b69b7923" rel="lightbox" src="http://kenh14cdn.com/thumb_w/650/2016/cps-chaps2-1475773280182.jpg" style="max-width: 100%; cursor: none;" title="Zara, H&amp;M về Việt Nam thì giới trẻ Việt vẫn chuộng order quần áo bởi những thương hiệu hot không kém này - Ảnh 2." type="photo" w="960" width="" /></div>
		<div class="PhotoCMS_Caption">
			<p class="NLPlaceholderShow" data-placeholder="[nhập chú thích]">
				&nbsp;</p>
		</div>
	</div>
	<div class="VCSortableInPreviewMode noCaption" type="Photo">
		<div>
			<img alt="Zara, H&amp;M về Việt Nam thì giới trẻ Việt vẫn chuộng order quần áo bởi những thương hiệu hot không kém này - Ảnh 3." data-original="http://kenh14cdn.com/2016/cps-chaps3-1475773280184.jpg" h="640" height="" id="img_8349f560-8be6-11e6-b939-01b8b69b7923" photoid="8349f560-8be6-11e6-b939-01b8b69b7923" rel="lightbox" src="http://kenh14cdn.com/2016/cps-chaps3-1475773280184.jpg" style="max-width: 100%; cursor: none;" title="Zara, H&amp;M về Việt Nam thì giới trẻ Việt vẫn chuộng order quần áo bởi những thương hiệu hot không kém này - Ảnh 3." type="photo" w="640" width="" /></div>
		<div class="PhotoCMS_Caption">
			<p class="NLPlaceholderShow" data-placeholder="[nhập chú thích]">
				&nbsp;</p>
		</div>
	</div>
	<p>
		<b>Jaspal</b></p>
	<p>
		Cũng như CPS CHAPS, Jaspal l&agrave; thương hiệu thời trang m&agrave; n&agrave;ng n&agrave;o cũng sẽ l&acirc;n la đến ngay khi vừa đặt ch&acirc;n xuống xứ sở ch&ugrave;a v&agrave;ng. Hiện thương hiệu n&agrave;y c&oacute; khoảng 40 cửa hiệu tại Th&aacute;i Lan, 4 cửa hiệu tại Malaysia v&agrave; nhiều nh&agrave; ph&acirc;n phối tr&ecirc;n thế giới. Điểm thu h&uacute;t của Jaspal l&agrave; sử dụng c&aacute;c chất liệu cao cấp để mang đến 1 d&ograve;ng sản phẩm thời trang thời thượng với một mức gi&aacute; b&igrave;nh d&acirc;n, đồng thời kết hợp phong c&aacute;ch thời trang thế giới với gu thẩm mỹ &Aacute; Đ&ocirc;ng.</p>
	<p>
		Mức gi&aacute;: Đồ jeans khoảng 1,9 triệu đồng; v&aacute;y khoảng 1,8 triệu đồng.</p>
</div>
<br />
', 1, 1)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (8, N'Vietnam International Fashion Week rục rịch tuyển mẫu, chuẩn bị tổ chức tại Hà Nội', N'vietnam.jpg', N'Sau buổi casting đầu tiên tại khu vực TP.HCM cách đây hơn một tuần, chiều 7/10, buổi casting thứ hai cho Vietnam International Fashion Week - Tuần lễ thời trang quốc tế Việt Nam mùa Thu/Đông 2016 đã d', CAST(N'2016-10-09 00:00:00.000' AS DateTime), 20, N'<h2 class="knd-sapo" data-field="sapo">
	&nbsp; Buổi casting tại khu vực ph&iacute;a Bắc cho VIFW m&ugrave;a Thu/Đ&ocirc;ng 2016 vừa diễn ra v&agrave;o chiều 7/10.</h2>
<div class="knd-content" data-field="body">
	<p>
		Sau <a class="seo-suggest-link" href="http://kenh14.vn/mau-luong-tinh-mau-chuyen-gioi-noi-bat-tai-buoi-casting-cho-vietnam-international-fashion-week-20160929181739171.chn" target="_blank" title="Mẫu lưỡng tính, mẫu chuyển giới nổi bật tại buổi casting cho Vietnam International Fashion Week ">buổi casting đầu ti&ecirc;n tại khu vực TP.HCM</a> c&aacute;ch đ&acirc;y hơn một tuần, chiều 7/10, buổi casting thứ hai cho Vietnam International Fashion Week - Tuần lễ thời trang quốc tế Việt Nam m&ugrave;a Thu/Đ&ocirc;ng 2016 đ&atilde; diễn ra tại H&agrave; Nội. VIFW vốn l&agrave; tuần lễ thời trang tầm cỡ nhất hiện nay với sự tham gia của rất nhiều NTK t&ecirc;n tuổi cả trong v&agrave; ngo&agrave;i nước, bởi vậy, được sải bước trong khu&ocirc;n khổ sự kiện n&agrave;y l&agrave; ước mơ của rất nhiều người mẫu trẻ.</p>
	<div class="VCSortableInPreviewMode active" type="Photo">
		<div>
			<img alt="Vietnam International Fashion Week rục rịch tuyển mẫu, chuẩn bị tổ chức tại Hà Nội - Ảnh 1." data-original="http://kenh14cdn.com/2016/1-1475835556590.jpg" h="1000" height="" id="img_89ed5c90-8c77-11e6-b939-01b8b69b7923" photoid="89ed5c90-8c77-11e6-b939-01b8b69b7923" rel="lightbox" src="http://kenh14cdn.com/thumb_w/650/2016/1-1475835556590.jpg" style="max-width: 100%; cursor: none;" title="Vietnam International Fashion Week rục rịch tuyển mẫu, chuẩn bị tổ chức tại Hà Nội - Ảnh 1." type="photo" w="1500" width="" /></div>
		<div class="PhotoCMS_Caption">
			<p data-placeholder="[nhập chú thích]">
				Địa điểm diễn ra buổi casting thứ hai cho VIFW Thu/Đ&ocirc;ng 2016 l&agrave; một TTTM lớn tại H&agrave; Nội.</p>
		</div>
	</div>
	<p>
		So với buổi casting tại TP.HCM, buổi casting lần n&agrave;y kh&ocirc;ng n&aacute;o nhiệt bằng v&agrave; cũng kh&ocirc;ng quy tụ những gương mặt quen thuộc. Tuy nhi&ecirc;n, c&aacute;c người mẫu kh&ocirc;ng chuy&ecirc;n vẫn ghi điểm bởi th&aacute;i độ l&agrave;m việc chuy&ecirc;n nghiệp của m&igrave;nh.</p>
	<div class="VCSortableInPreviewMode active" type="Photo">
		<div>
			<img alt="Vietnam International Fashion Week rục rịch tuyển mẫu, chuẩn bị tổ chức tại Hà Nội - Ảnh 2." data-original="http://kenh14cdn.com/2016/2-1475835556593.jpg" h="1000" height="" id="img_8b39d9c0-8c77-11e6-b939-01b8b69b7923" photoid="8b39d9c0-8c77-11e6-b939-01b8b69b7923" rel="lightbox" src="http://kenh14cdn.com/thumb_w/650/2016/2-1475835556593.jpg" style="max-width: 100%; cursor: none;" title="Vietnam International Fashion Week rục rịch tuyển mẫu, chuẩn bị tổ chức tại Hà Nội - Ảnh 2." type="photo" w="1500" width="" /></div>
		<div class="PhotoCMS_Caption">
			<p data-placeholder="[nhập chú thích]">
				C&aacute;c người mẫu tập trung ở sảnh để chuẩn bị cho phần đi catwalk.</p>
		</div>
	</div>
	<div class="VCSortableInPreviewMode active noCaption" type="Photo">
		<div>
			<img alt="Vietnam International Fashion Week rục rịch tuyển mẫu, chuẩn bị tổ chức tại Hà Nội - Ảnh 3." data-original="http://kenh14cdn.com/2016/3-1475835556596.jpg" h="1000" height="" id="img_8bd57d80-8c77-11e6-b939-01b8b69b7923" photoid="8bd57d80-8c77-11e6-b939-01b8b69b7923" rel="lightbox" src="http://kenh14cdn.com/thumb_w/650/2016/3-1475835556596.jpg" style="max-width: 100%; cursor: none;" title="Vietnam International Fashion Week rục rịch tuyển mẫu, chuẩn bị tổ chức tại Hà Nội - Ảnh 3." type="photo" w="1500" width="" /></div>
		<div class="PhotoCMS_Caption">
			<p class="NLPlaceholderShow" data-placeholder="[nhập chú thích]">
				&nbsp;</p>
		</div>
	</div>
	<div class="VCSortableInPreviewMode active" type="Photo">
		<div>
			<img alt="Vietnam International Fashion Week rục rịch tuyển mẫu, chuẩn bị tổ chức tại Hà Nội - Ảnh 4." data-original="http://kenh14cdn.com/2016/4-1475835556599.jpg" h="1493" height="" id="img_8c191630-8c77-11e6-b939-01b8b69b7923" photoid="8c191630-8c77-11e6-b939-01b8b69b7923" rel="lightbox" src="http://kenh14cdn.com/thumb_w/650/2016/4-1475835556599.jpg" style="max-width: 100%; cursor: none;" title="Vietnam International Fashion Week rục rịch tuyển mẫu, chuẩn bị tổ chức tại Hà Nội - Ảnh 4." type="photo" w="1000" width="" /></div>
		<div class="PhotoCMS_Caption">
			<p data-placeholder="[nhập chú thích]">
				Ki&ecirc;n nhẫn nghe ban gi&aacute;m khảo phổ biến v&agrave; chờ đợi đến lượt m&igrave;nh.</p>
		</div>
	</div>
	<div class="VCSortableInPreviewMode active" type="Photo">
		<div>
			<img alt="Vietnam International Fashion Week rục rịch tuyển mẫu, chuẩn bị tổ chức tại Hà Nội - Ảnh 5." data-original="http://kenh14cdn.com/2016/5-1475835556602.jpg" h="1000" height="" id="img_8c32dfc0-8c77-11e6-b939-01b8b69b7923" photoid="8c32dfc0-8c77-11e6-b939-01b8b69b7923" rel="lightbox" src="http://kenh14cdn.com/thumb_w/650/2016/5-1475835556602.jpg" style="max-width: 100%; cursor: none;" title="Vietnam International Fashion Week rục rịch tuyển mẫu, chuẩn bị tổ chức tại Hà Nội - Ảnh 5." type="photo" w="1500" width="" /></div>
		<div class="PhotoCMS_Caption">
			<p data-placeholder="[nhập chú thích]">
				Trước đ&oacute;, c&aacute;c người mẫu tham gia casting đều phải l&agrave;m thủ tục đăng k&yacute;...</p>
		</div>
	</div>
</div>
<br />
', 3, 1)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (9, N'Vũ điệu của những gam màu đơn sắc', N'gam.jpg', N'Tinh tế, quyến rũ và phá cách là những gì nbộ sưu tập thời trang OUR FIRST FALL COLLECTION 2016 mà Kiều Ly mang lại cho khách hàng của mình. ', CAST(N'2016-10-09 00:00:00.000' AS DateTime), 17, N'<h2 class="knd-sapo" data-field="sapo">
	Tinh tế, quyến rũ v&agrave; ph&aacute; c&aacute;ch l&agrave; những g&igrave; nbộ sưu tập thời trang OUR FIRST FALL COLLECTION 2016 m&agrave; Kiều Ly mang lại cho kh&aacute;ch h&agrave;ng của m&igrave;nh.</h2>
<div class="knd-content" data-field="body">
	<p>
		OUR FIRST FALL COLLECTION 2016 l&agrave; bộ sưu tập thời trang đầu ti&ecirc;n của nh&agrave; thiết kế trẻ Phạm Kiều Ly &ndash; chủ nh&acirc;n shop thời trang ME.choose. Tuy chỉ mới gia nhập l&agrave;ng thời trang được hai năm, nhưng Kiều Ly đ&atilde; tự định hướng cho m&igrave;nh một phong c&aacute;ch thời trang cực kỳ c&aacute; t&iacute;nh. Với niềm đam m&ecirc; thiết kế ch&aacute;y bỏng c&ugrave;ng ho&agrave;i b&atilde;o muốn tạo dựng một Brand gi&aacute; rẻ, cập nhật mọi xu hướng, ph&ugrave; hợp với mọi lứa tuổi với mức gi&aacute; b&igrave;nh d&acirc;n, Kiều Ly đ&atilde; cho ra đời bộ thiết kế đầu ti&ecirc;n của m&igrave;nh d&agrave;nh cho m&ugrave;a thu 2016.</p>
	<div class="VCSortableInPreviewMode active noCaption" type="Photo">
		<div>
			<img alt="Vũ điệu của những gam màu đơn sắc - Ảnh 1." data-original="http://channel.mediacdn.vn//prupload/164/2016/10/img20161007155922189.jpg" height="" rel="lightbox" src="http://channel.mediacdn.vn//thumb_w/640/prupload/164/2016/10/img20161007155922189.jpg" style="max-width: 100%;" title="Vũ điệu của những gam màu đơn sắc - Ảnh 1." width="" /></div>
		<div class="PhotoCMS_Caption">
			<p placeholder="[nhập chú thích]">
				&nbsp;</p>
		</div>
	</div>
	<div class="VCSortableInPreviewMode" type="Photo">
		<div>
			<img alt="Vũ điệu của những gam màu đơn sắc - Ảnh 2." data-original="http://channel.mediacdn.vn//prupload/164/2016/10/img20161007155922347.jpg" height="" rel="lightbox" src="http://channel.mediacdn.vn//thumb_w/640/prupload/164/2016/10/img20161007155922347.jpg" style="max-width: 100%;" title="Vũ điệu của những gam màu đơn sắc - Ảnh 2." width="" /></div>
		<div class="PhotoCMS_Caption">
			<p placeholder="[nhập chú thích]">
				Bộ sưu tập d&agrave;nh cho m&ugrave;a thu chủ yếu l&agrave; sự mix match giữa hai chất liệu voan v&agrave; ren</p>
		</div>
	</div>
	<div class="VCSortableInPreviewMode noCaption" type="Photo">
		<div>
			<img alt="Vũ điệu của những gam màu đơn sắc - Ảnh 3." data-original="http://channel.mediacdn.vn//prupload/164/2016/10/img20161007155922510.jpg" height="" rel="lightbox" src="http://channel.mediacdn.vn//thumb_w/640/prupload/164/2016/10/img20161007155922510.jpg" style="max-width: 100%;" title="Vũ điệu của những gam màu đơn sắc - Ảnh 3." width="" /></div>
		<div class="PhotoCMS_Caption">
			<p placeholder="[nhập chú thích]">
				&nbsp;</p>
		</div>
	</div>
	<div class="VCSortableInPreviewMode" type="Photo">
		<div>
			<img alt="Vũ điệu của những gam màu đơn sắc - Ảnh 4." data-original="http://channel.mediacdn.vn//prupload/164/2016/10/img20161007155925693.jpg" height="" rel="lightbox" src="http://channel.mediacdn.vn//thumb_w/640/prupload/164/2016/10/img20161007155925693.jpg" style="max-width: 100%;" title="Vũ điệu của những gam màu đơn sắc - Ảnh 4." width="" /></div>
		<div class="PhotoCMS_Caption">
			<p placeholder="[nhập chú thích]">
				Với hai t&ocirc;ng m&agrave;u chủ đạo l&agrave; đen &ndash; trắng, rất dễ kết hợp v&agrave; ứng dụng v&agrave;o thực tế, từ v&aacute;y c&ocirc;ng sở đến đầm dạ tiệc, hay chỉ đơn giản l&agrave; những bộ trang phục dạo phố</p>
		</div>
	</div>
</div>
<br />
', 4, 1)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (10, N'Angela Phương Trinh ngọt ngào trong thiết kế mới của Amy Store', N'angela.jpg', N'Luôn được nhắc đến bởi sự tài năng, xinh đẹp ngay từ còn bé, Angela Phương Trinh giờ đây đã trưởng thành và là một mỹ nhân đình đám nhất nhì showbiz Việt. ', CAST(N'2016-10-09 00:00:00.000' AS DateTime), 24, N'<h2 class="knd-sapo" data-field="sapo">
	Lu&ocirc;n được nhắc đến bởi sự t&agrave;i năng, xinh đẹp ngay từ c&ograve;n b&eacute;, Angela Phương Trinh giờ đ&acirc;y đ&atilde; trưởng th&agrave;nh v&agrave; l&agrave; một mỹ nh&acirc;n đ&igrave;nh đ&aacute;m nhất nh&igrave; showbiz Việt.</h2>
<div class="knd-content" data-field="body">
	<p>
		Gần đ&acirc;y, c&ocirc; n&agrave;ng lại được biết đến với những bộ c&aacute;nh thời trang đẹp mắt. Kh&ocirc;ng qu&aacute; ch&uacute; trọng về thương hiệu, Angela Phương Trinh vẫn s&agrave;nh điệu d&ugrave; diện l&ecirc;n m&igrave;nh những bộ c&aacute;nh b&igrave;nh d&acirc;n, từ c&aacute;c NTK trong nước. Những h&igrave;nh ảnh quyến rũ v&agrave; thời thượng mới nhất, gấy sốt tr&ecirc;n trang c&aacute; nh&acirc;n của người đẹp sinh năm 1995, l&agrave; minh chứng r&otilde; r&agrave;ng nhất cho sức h&uacute;t thời trang của c&ocirc; đối với c&ocirc;ng ch&uacute;ng.</p>
	<p>
		Trong thiết kế mới nhất của h&atilde;ng thời trang Amy Store, Angela Phương Trinh đ&atilde; khoe trọn được sự tinh tế của bộ trang phục m&agrave; vẫn l&agrave;m nổi bật l&ecirc;n v&oacute;c d&aacute;ng mảnh mai, gợi cảm của m&igrave;nh. Với điểm nhấn l&agrave; họa tiết k&egrave;m ren hay những chiếc nơ x&iacute;nh xắn đ&atilde; tạo n&ecirc;n một Angela Phương Trinh đầy quyến rũ.</p>
	<p>
		Thời gian qua, nữ diễn vi&ecirc;n t&ecirc;n thật L&ecirc; Ngọc Phương Trinh đổi hướng trong việc x&acirc;y dựng h&igrave;nh ảnh. Theo đ&oacute;, c&ocirc; n&agrave;ng quay trở lại c&ocirc;ng việc diễn xuất v&agrave; thường ưu ti&ecirc;n những thiết kế gợi cảm vừa phải nhưng vẫn l&agrave;m t&ocirc;n l&ecirc;n vẻ thời thượng của m&igrave;nh m&agrave; ph&ugrave; hợp với lứa tuổi của c&ocirc;.</p>
	<p>
		Với chất liệu gấm mềm mại tạo n&ecirc;n sự bồng bềnh của trang phục, Angela Phương Trinh ph&ugrave; hợp với m&agrave;u hồng nhạt, l&agrave; &quot;t&ocirc;ng&quot; ch&iacute;nh của h&atilde;ng thời trang Amy Store lần n&agrave;y. Trong bộ ảnh mới ch&iacute;nh l&agrave; BST Thu Đ&ocirc;ng 2016 của h&atilde;ng thời trang Amy Store, Angela Phương Trinh chia sẻ c&ocirc; đ&atilde; kh&ocirc;ng thể bỏ qua m&agrave;u sắc cũng như kiểu d&aacute;ng của những bộ trang phục ấm &aacute;p, nữ t&iacute;nh đang khiến c&aacute;c ph&aacute;i đẹp say sưa, l&agrave; sự lựa chọn cho c&aacute;c t&iacute;n đồ thời trang h&agrave;ng đầu cho m&ugrave;a Thu Đ&ocirc;ng năm nay. Chỉ một ch&uacute;t xanh lục tươi tắn của t&uacute;i x&aacute;ch, cả set đồ đ&ocirc;ng trầm u c&oacute; thể bừng s&aacute;ng bất ngờ. &quot;Những chiếc đầm m&agrave;u hồng phấn hay điểm ch&uacute;t m&agrave;u xanh nhẹ nh&agrave;ng của chiếc nơ tạo n&ecirc;n sự quyến rũ cho trang phục trước khi bước ra đường, to&agrave;n bộ m&agrave;u sắc đ&atilde; quyện lại với nhau tạo n&ecirc;n một bức tranh sống động cho bản th&acirc;n người mặc v&agrave; chất liệu sang trọng bằng gấm sẽ khiến c&aacute;c &quot;c&ocirc; n&agrave;ng&quot; trở n&ecirc;n quyến rũ hơn với những khoảnh khắc ấn tượng đầy mới mẻ với trang phục của Amy Store&quot; - nữ diễn vi&ecirc;n &quot;b&agrave; mẹ nh&iacute;&quot; th&uacute; vị khi so s&aacute;nh.</p>
	<p>
		Li&ecirc;n tục ghi điểm với gu thời trang đẳng cấp, c&agrave;ng ng&agrave;y c&agrave;ng thể hiện sự trưởng th&agrave;nh của &quot;b&agrave; mẹ nh&iacute;&quot; Angela Phương Trinh v&agrave; cũng kh&ocirc;ng n&oacute;i ngoa khi c&ocirc; li&ecirc;n tục được b&igrave;nh bầu v&agrave;o trong top những sao mặc đẹp nhất tuần ở c&aacute;c tạp ch&iacute; thời trang danh tiếng.</p>
	<p>
		C&ugrave;ng ngắm vẻ ngọt ng&agrave;o, quyến rũ của c&ocirc; n&agrave;ng Angela Phương Trinh trong bộ sưu tập Thu Đ&ocirc;ng 2016 của h&atilde;ng thời trang Amy Store:</p>
	<div class="VCSortableInPreviewMode noCaption" type="Photo">
		<div>
			<img alt="Angela Phương Trinh ngọt ngào trong thiết kế mới của Amy Store - Ảnh 1." data-original="http://channel.mediacdn.vn//prupload/603/2016/10/img20161006151239829.jpg" height="" rel="lightbox" src="http://channel.mediacdn.vn//prupload/603/2016/10/img20161006151239829.jpg" style="max-width: 100%;" title="Angela Phương Trinh ngọt ngào trong thiết kế mới của Amy Store - Ảnh 1." width="" /></div>
		<div class="PhotoCMS_Caption">
			<p class="NLPlaceholderShow" data-placeholder="[nhập chú thích]">
				&nbsp;</p>
		</div>
	</div>
	<div class="VCSortableInPreviewMode noCaption" type="Photo">
		<div>
			<img alt="Angela Phương Trinh ngọt ngào trong thiết kế mới của Amy Store - Ảnh 2." data-original="http://channel.mediacdn.vn//prupload/603/2016/10/img20161006151241966.jpg" height="" rel="lightbox" src="http://channel.mediacdn.vn//prupload/603/2016/10/img20161006151241966.jpg" style="max-width: 100%;" title="Angela Phương Trinh ngọt ngào trong thiết kế mới của Amy Store - Ảnh 2." width="" /></div>
		<div class="PhotoCMS_Caption">
			<p class="NLPlaceholderShow" data-placeholder="[nhập chú thích]">
				&nbsp;</p>
		</div>
	</div>
	<div class="VCSortableInPreviewMode noCaption" type="Photo">
		<div>
			<img alt="Angela Phương Trinh ngọt ngào trong thiết kế mới của Amy Store - Ảnh 3." data-original="http://channel.mediacdn.vn//prupload/603/2016/10/img20161006151244193.jpg" height="" rel="lightbox" src="http://channel.mediacdn.vn//prupload/603/2016/10/img20161006151244193.jpg" style="max-width: 100%;" title="Angela Phương Trinh ngọt ngào trong thiết kế mới của Amy Store - Ảnh 3." width="" /></div>
		<div class="PhotoCMS_Caption">
			<p class="NLPlaceholderShow" data-placeholder="[nhập chú thích]">
				&nbsp;</p>
		</div>
	</div>
	<div class="VCSortableInPreviewMode noCaption" type="Photo">
		<div>
			<img alt="Angela Phương Trinh ngọt ngào trong thiết kế mới của Amy Store - Ảnh 4." data-original="http://channel.mediacdn.vn//prupload/603/2016/10/img20161006151245811.jpg" height="" rel="lightbox" src="http://channel.mediacdn.vn//thumb_w/640/prupload/603/2016/10/img20161006151245811.jpg" style="max-width: 100%;" title="Angela Phương Trinh ngọt ngào trong thiết kế mới của Amy Store - Ảnh 4." width="" /></div>
	</div>
</div>
<br />
', 0, 1)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (11, N'Street style thế giới: Khi các bạn trẻ diện toàn món đồ basic mà vẫn "chất" phát hờn', N'báic.jpg', N'Tuần qua, giới trẻ thế giới tiếp tục thể hiện đẳng cấp mặc đẹp mà chẳng cần phải diện những item thật "lồng lộn". ', CAST(N'2016-10-09 00:00:00.000' AS DateTime), 43, N'<h2 class="knd-sapo" data-field="sapo">
	Tuần qua, giới trẻ thế giới tiếp tục thể hiện đẳng cấp mặc đẹp m&agrave; chẳng cần phải diện những item thật &quot;lồng lộn&quot;.</h2>
<div data-check-position="detail_content_start">
	&nbsp;</div>
<div class="knd-content" data-field="body">
	<div class="VCSortableInPreviewMode active" type="Photo">
		<div>
			<img alt="Street style thế giới: Khi các bạn trẻ diện toàn món đồ basic mà vẫn chất phát hờn - Ảnh 1." data-original="http://kenh14cdn.com/2016/12-1475138145275.jpg" h="1200" height="" id="img_bd371270-861f-11e6-b939-01b8b69b7923" photoid="bd371270-861f-11e6-b939-01b8b69b7923" rel="lightbox" src="http://kenh14cdn.com/thumb_w/650/2016/12-1475138145275.jpg" style="max-width: 100%; cursor: none;" title="Street style thế giới: Khi các bạn trẻ diện toàn món đồ basic mà vẫn chất phát hờn - Ảnh 1." type="photo" w="800" width="" /></div>
		<div class="PhotoCMS_Caption">
			<p data-placeholder="[nhập chú thích]">
				Chiếc &aacute;o sơmi kẻ sọc tưởng chừng cứng nhắc, kh&oacute; mặc lại trở n&ecirc;n v&ocirc; c&ugrave;ng trendy khi được c&ocirc; n&agrave;ng n&agrave;y mix c&ugrave;ng quần ống loe v&agrave; gi&agrave;y sneaker. Sự xuất hiện của chiếc mũ lưỡi trai khiến set đồ tổng thể tr&ocirc;ng cool hơn hẳn.</p>
		</div>
	</div>
	<div class="VCSortableInPreviewMode active" type="Photo">
		<div>
			<img alt="Street style thế giới: Khi các bạn trẻ diện toàn món đồ basic mà vẫn chất phát hờn - Ảnh 2." data-original="http://kenh14cdn.com/2016/11-1475138145274.jpg" h="1200" height="" id="img_bd255f30-861f-11e6-b939-01b8b69b7923" photoid="bd255f30-861f-11e6-b939-01b8b69b7923" rel="lightbox" src="http://kenh14cdn.com/thumb_w/650/2016/11-1475138145274.jpg" style="max-width: 100%; cursor: none;" title="Street style thế giới: Khi các bạn trẻ diện toàn món đồ basic mà vẫn chất phát hờn - Ảnh 2." type="photo" w="800" width="" /></div>
		<div class="PhotoCMS_Caption">
			<p data-placeholder="[nhập chú thích]">
				&Aacute;o hoodie d&aacute;ng oversized lu&ocirc;n l&agrave; item chẳng bao giờ hết hot mỗi độ thu về, v&agrave; c&ocirc; n&agrave;ng n&agrave;y đ&atilde; diện n&oacute; theo c&aacute;ch rất nữ t&iacute;nh, đ&aacute;ng y&ecirc;u khi phối c&ugrave;ng ch&acirc;n v&aacute;y xếp pleat v&agrave; gi&agrave;y sneaker k&egrave;m tất lửng.</p>
		</div>
	</div>
	<div class="VCSortableInPreviewMode active" type="Photo">
		<div>
			<img alt="Street style thế giới: Khi các bạn trẻ diện toàn món đồ basic mà vẫn chất phát hờn - Ảnh 3." data-original="http://kenh14cdn.com/2016/10-1475138145272.jpg" h="1200" height="" id="img_bcefa930-861f-11e6-b939-01b8b69b7923" photoid="bcefa930-861f-11e6-b939-01b8b69b7923" rel="lightbox" src="http://kenh14cdn.com/thumb_w/650/2016/10-1475138145272.jpg" style="max-width: 100%; cursor: none;" title="Street style thế giới: Khi các bạn trẻ diện toàn món đồ basic mà vẫn chất phát hờn - Ảnh 3." type="photo" w="800" width="" /></div>
		<div class="PhotoCMS_Caption">
			<p data-placeholder="[nhập chú thích]">
				C&ocirc; n&agrave;ng n&agrave;y lại &quot;thay m&aacute;u&quot; cho set đồ &aacute;o ph&ocirc;ng - quần shorts với item &iacute;t ai ngờ tới nhất, đ&oacute; ch&iacute;nh l&agrave; boyfriend blazer. Chiếc &aacute;o c&aacute; t&iacute;nh n&agrave;y kết hợp với đ&ocirc;i boots buộc d&acirc;y mang đến vẻ ph&aacute; c&aacute;ch, ph&oacute;ng kho&aacute;ng tuyệt đối cho chủ nh&acirc;n. B&ecirc;n cạnh đ&oacute;, c&ocirc; n&agrave;ng c&ograve;n kh&eacute;o l&eacute;o nhấn nh&aacute; th&ecirc;m một chiếc mũ nồi ton-sur-ton với &aacute;o.</p>
		</div>
	</div>
</div>
<br />
', 0, 1)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (12, N'5 món đồ thời trang giúp bạn “chinh phục” ánh nhìn phái mạnh', N'5m.jpg', N'Nếu bạn đang tìm kiếm ý tưởng lên đồ cho đêm hẹn hò lãng mạn hay đơn giản là muốn mình tự tin hơn, 5 gợi ý thời trang dưới đây sẽ khiến bạn phải hài lòng.', CAST(N'2016-10-09 00:00:00.000' AS DateTime), 15, N'<div>
	Người ta thường n&oacute;i &ldquo; Đ&agrave;n &ocirc;ng y&ecirc;u bằng mắt, đ&agrave;n b&agrave; y&ecirc;u bằng tai&rdquo;. Chưa thể đo&aacute;n chắc c&acirc;u n&oacute;i n&agrave;y ch&iacute;nh x&aacute;c đến đ&acirc;u nhưng một người phụ nữ khi ăn vận đẹp chắc chắn sẽ cuốn h&uacute;t v&agrave; quyến rũ hơn khi giấu m&igrave;nh trong những bộ c&aacute;nh xuề x&ograve;a, luộm thuộm. Nếu bạn đang t&igrave;m kiếm &yacute; tưởng l&ecirc;n đồ cho đ&ecirc;m hẹn h&ograve; l&atilde;ng mạn hay đơn giản l&agrave; muốn m&igrave;nh tự tin hơn, 5 gợi &yacute; thời trang dưới đ&acirc;y sẽ khiến bạn phải h&agrave;i l&ograve;ng.</div>
<div>
	&nbsp;</div>
<div>
	<span style="font-weight: bold;">1. Một chiếc v&aacute;y trơn m&agrave;u</span></div>
<div>
	&nbsp;</div>
<div>
	Kh&ocirc;ng cần phải phối đồ cầu kỳ, chỉ một chiếc v&aacute;y liền với kiểu d&aacute;ng đơn giản l&agrave; đủ để bạn c&oacute; diện mạo chỉn chu, ưa nh&igrave;n hơn. V&iacute; dụ cụ thể nhất l&agrave; v&aacute;y midi mềm mại, bay bổng nổi bật n&eacute;t nữ t&iacute;nh duy&ecirc;n d&aacute;ng hay một chiếc v&aacute;y d&agrave;i &ocirc;m d&aacute;ng khoe kh&eacute;o những đường cong ẩn hiện, sẽ kh&ocirc;ng bao giờ khiến bạn phải thất vọng khi muốn g&acirc;y ấn tượng với ph&aacute;i mạnh.</div>
<div>
	&nbsp;</div>
<div style="text-align: center;">
	<div>
		<img alt="váy trơn màu" h="" src="http://afamily1.mediacdn.vn/k:8JtZYBME2SUtEok2WIOUV7c3Os5pvZ/Image/2016/10/1-3-7dfca/vay-tron-mau.jpg" title="váy trơn màu" w="" /></div>
	<br />
	<div>
		&nbsp;</div>
	<br />
	<div>
		&nbsp;</div>
	<br />
	<div>
		&nbsp;</div>
</div>
<div>
	<span style="font-weight: bold;">2. &Aacute;o/ v&aacute;y c&oacute; thắt eo</span></div>
<div>
	&nbsp;</div>
<div>
	K&iacute;n đ&aacute;o nhưng vẫn t&ocirc;n d&aacute;ng l&agrave; điểm cộng đ&aacute;ng ch&uacute; &yacute; của những kiểu v&aacute;y, &aacute;o c&oacute; thắt nơ eo duy&ecirc;n d&aacute;ng. D&ugrave; bạn thuộc tu&yacute;p &ldquo;m&igrave;nh d&acirc;y&rdquo; hay đầy đặn nở nang th&igrave; những kiểu đồ nhấn nh&aacute; v&ograve;ng eo thế n&agrave;y đều gi&uacute;p v&oacute;c d&aacute;ng tr&ocirc;ng c&acirc;n đối, cao r&aacute;o hơn, t&ocirc;n l&ecirc;n những đường cong nữ t&iacute;nh v&agrave; mang lại vẻ ngo&agrave;i quyến rũ kh&oacute; cưỡng.&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	<div style="text-align:center;">
		<img alt="váy áo thắt nơ" h="" src="http://afamily1.mediacdn.vn/k:8JtZYBME2SUtEok2WIOUV7c3Os5pvZ/Image/2016/10/2-5-f74ff/vay-ao-that-no.jpg" title="váy áo thắt nơ" w="" /></div>
	<br />
	<div style="text-align:center;">
		&nbsp;</div>
	<br />
	<div style="text-align:center;">
		<img alt="váy áo thắt nơ" h="530" src="http://afamily1.mediacdn.vn/k:thumb_w/600/8JtZYBME2SUtEok2WIOUV7c3Os5pvZ/Image/2016/10/2-7-f74ff/vay-ao-that-no.jpg" title="váy áo thắt nơ" w="600" /></div>
	<div style="text-align:center;">
		&nbsp;</div>
	<div style="text-align:center;">
		&nbsp;</div>
	<br />
	<div style="text-align:center;">
		&nbsp;</div>
	<div style="text-align:center;">
		&nbsp;</div>
	<div style="text-align:center;">
		&nbsp;</div>
</div>
<div>
	&nbsp;</div>
<div>
	<span style="font-weight: bold;">3. Trang phục, son m&agrave;u đỏ</span></div>
<div>
	&nbsp;</div>
<div>
	Bạn c&oacute; thể cho rằng m&agrave;u đỏ qu&aacute; nổi bật v&agrave; ch&oacute;i mắt nhưng c&aacute;c nh&agrave; khoa học đ&atilde; chứng minh sắc đỏ đậm c&oacute; khả năng gi&uacute;p người mặc th&ecirc;m tự tin v&agrave; gia tăng sự thu h&uacute;t với nam giới. M&ugrave;a thu n&agrave;y, h&atilde;y để t&ocirc;ng đỏ khiến bạn th&ecirc;m phần xinh đẹp v&agrave; n&oacute;ng bỏng với một chiếc ch&acirc;n v&aacute;y da đỏ mận hay đơn giản l&agrave; thoa l&ecirc;n m&ocirc;i m&agrave;u đỏ tươi - sắc son chưa bao giờ lỗi mốt.</div>
<div>
	&nbsp;</div>
<div style="text-align: center;">
	&nbsp;</div>
<div style="text-align: center;">
	&nbsp;</div>
<div style="text-align: center;">
	<div>
		&nbsp;</div>
</div>
<div>
	<div style="text-align:center;">
		&nbsp;</div>
	<div style="text-align:center;">
		&nbsp;</div>
	<div style="text-align:center;">
		<img alt="tông màu đỏ" h="" src="http://afamily1.mediacdn.vn/k:8JtZYBME2SUtEok2WIOUV7c3Os5pvZ/Image/2016/10/3-524d4/tong-mau-do.jpg" title="tông màu đỏ" w="" /><br />
		&nbsp;</div>
</div>
<div>
	<span style="font-weight: bold;">4. &Aacute;o/ v&aacute;y khoe xương quai xanh</span></div>
<div>
	&nbsp;</div>
<div>
	Xương quai xanh ch&iacute;nh l&agrave; một trong những n&eacute;t đẹp quyến rũ nhất nhưng kh&ocirc;ng qu&aacute; khi&ecirc;u kh&iacute;ch của ph&aacute;i đẹp. Mỗi khi bạn cần tr&ocirc;ng thật gợi cảm nhưng vẫn nhẹ nh&agrave;ng, nữ t&iacute;nh, &nbsp;h&atilde;y phối một chiếc &aacute;o hai d&acirc;y hay trễ vai với quần jeans hay ch&acirc;n v&aacute;y d&agrave;i ngang gối. Những khoảng hở đ&uacute;ng chỗ v&agrave; được tiết chế vừa phải sẽ kh&ocirc;ng khiến bạn phải ngượng ng&ugrave;ng trước mắt ch&agrave;ng.</div>
<div>
	&nbsp;</div>
<div style="text-align: center;">
	<div>
		<img alt="áo khoe xương quai xanh" h="" src="http://afamily1.mediacdn.vn/k:8JtZYBME2SUtEok2WIOUV7c3Os5pvZ/Image/2016/10/-4-7f6fa/ao-khoe-xuong-quai-xanh.jpg" title="áo khoe xương quai xanh" w="" /></div>
	<br />
	<div>
		&nbsp;</div>
	<br />
	<div>
		&nbsp;</div>
	<br />
	<div>
		<img alt="áo khoe xương quai xanh" h="" src="http://afamily1.mediacdn.vn/k:8JtZYBME2SUtEok2WIOUV7c3Os5pvZ/Image/2016/10/5-b9c94/ao-khoe-xuong-quai-xanh.jpg" title="áo khoe xương quai xanh" w="" /></div>
</div>
<div>
	<span style="font-weight: bold;">5. Thắt lưng</span></div>
<div>
	&nbsp;</div>
<div>
	M&ugrave;a thu cũng l&agrave; l&uacute;c bạn muốn thử nghiệm những c&aacute;ch kết hợp layer nhiều lớp v&aacute;y, &aacute;o nhưng nếu chưa kh&eacute;o kết hợp, v&oacute;c d&aacute;ng sẽ rất dễ trở n&ecirc;n tr&ograve;n trịa hơn thực tế. L&uacute;c n&agrave;y, một chiếc thắt lưng bản nhỏ sẽ l&agrave; điểm nhấn đắt gi&aacute; v&agrave; trợ thủ đắc lực gi&uacute;p set đồ t&ocirc;n d&aacute;ng v&agrave; gọn g&agrave;ng hơn.&nbsp;</div>
<div>
	&nbsp;</div>
<div style="text-align: center;">
	<div>
		<img alt="thắt lưng" h="" src="http://afamily1.mediacdn.vn/k:8JtZYBME2SUtEok2WIOUV7c3Os5pvZ/Image/2016/10/7-2-fb725/that-lung.jpg" title="thắt lưng" w="" /></div>
	<br />
	<div>
		&nbsp;</div>
</div>
<br />
', 1, 2)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (13, N'10 gam màu bừng sáng cả tủ đồ của bạn trong Thu/Đông tới', N'10.jpg', N'Những gam màu nào được dự đoán sẽ trở thành xu hướng chiếm lĩnh làng thời trang trong mùa Thu/Đông mới này.', CAST(N'2016-10-09 00:00:00.000' AS DateTime), 21, N'<div>
	Cứ mỗi năm, mỗi m&ugrave;a, Viện M&agrave;u sắc Pantone tại Mĩ lại c&ocirc;ng bố những m&agrave;u sắc nổi trội được dự đo&aacute;n trở th&agrave;nh xu hướng của qu&atilde;ng thời gian sau đ&oacute;. Những m&agrave;u sắc n&agrave;y được nghi&ecirc;n cứu, tổng hợp qua những m&ugrave;a thời trang, khảo s&aacute;t người ti&ecirc;u d&ugrave;ng v&agrave; nhiều chỉ ti&ecirc;u kh&aacute;c. Trong m&ugrave;a thu năm nay, những m&agrave;u sắc n&agrave;o sẽ trở th&agrave;nh xu hướng trong l&agrave;ng thời trang? Dưới đ&acirc;y l&agrave; 10 m&agrave;u sắc được dự đo&aacute;n sẽ &ldquo;l&agrave;m n&ecirc;n chuyện&rdquo; trong những th&aacute;ng cuối năm nay dựa theo bảng m&agrave;u Pantone.</div>
<div>
	&nbsp;</div>
<div>
	<span style="font-weight: bold;">1.&nbsp;Đỏ cực quang</span></div>
<div>
	&nbsp;</div>
<div>
	Nếu như bạn nghĩ rằng m&ugrave;a thu l&agrave; m&ugrave;a của những gam m&agrave;u trầm tối th&igrave; bạn đ&atilde; nhầm. Trong năm nay, t&ocirc;ng m&agrave;u đỏ cực quang tươi s&aacute;ng được dự đo&aacute;n sẽ trở th&agrave;nh xu hướng thắp s&aacute;ng tiết trời đ&ocirc;ng ảm đạm. Gọi l&agrave; đỏ cực quang, sở dĩ bởi ch&uacute;ng l&agrave; m&agrave;u đỏ tươi th&ocirc;ng thường, nhưng lại kh&aacute; hắt s&aacute;ng &ndash; một m&agrave;u đỏ đủ để khiến bạn nổi bật trong bất cứ buổi dạo tối cuối thu n&agrave;o.</div>
<div>
	&nbsp;</div>
<div style="text-align: center;">
	<img alt="xu hướng thu đông 2016" h="505" src="http://afamily1.mediacdn.vn/k:thumb_w/600/8JtZYBME2SUtEok2WIOUV7c3Os5pvZ/Image/2016/09/1-2d49c/xu-huong-thu-dong-2016.jpg" title="xu hướng thu đông 2016" w="700" /></div>
<div>
	&nbsp;</div>
<div>
	<span style="font-weight: bold;">2.&nbsp;N&acirc;u đất s&aacute;ng</span></div>
<div>
	&nbsp;</div>
<div>
	Chẳng kh&oacute; để nhận ra những t&ocirc;ng m&agrave;u &ldquo;tự nhi&ecirc;n&rdquo; trong năm nay thường kh&aacute; được ưa chuộng, v&agrave; m&agrave;u n&acirc;u đất s&aacute;ng cũng kh&ocirc;ng phải ngoại lệ. T&ocirc;ng m&agrave;u n&acirc;u n&agrave;y được đ&aacute;nh gi&aacute; l&agrave; kh&aacute; tương tự với m&agrave;u nude, thanh lịch, ấm &aacute;p nhưng v&ocirc; c&ugrave;ng c&aacute; t&iacute;nh. Những ng&ocirc;i sao Hollywood như Kim Kadashian ch&iacute;nh l&agrave; một trong những nh&acirc;n tố &ldquo;lăng x&ecirc;&rdquo; t&ocirc;ng m&agrave;u ấn tượng n&agrave;y đến với đ&ocirc;ng đảo t&iacute;n đồ thời trang.</div>
<div>
	&nbsp;</div>
<div style="text-align: center;">
	<img alt="xu hướng thu đông 2016" h="505" src="http://afamily1.mediacdn.vn/k:thumb_w/600/8JtZYBME2SUtEok2WIOUV7c3Os5pvZ/Image/2016/09/2-2d49c/xu-huong-thu-dong-2016.jpg" title="xu hướng thu đông 2016" w="700" /></div>
<div>
	&nbsp;</div>
<div>
	<span style="font-weight: bold;">3.&nbsp;Xanh lục bảo</span></div>
<div>
	&nbsp;</div>
<div>
	Tuy l&agrave; t&ocirc;ng m&agrave;u lạnh, thế nhưng m&agrave;u xanh lục bảo lại kh&ocirc;ng hề đem tới cảm gi&aacute;c lạnh lẽo m&agrave; thay v&agrave;o đ&oacute; l&agrave; cảm gi&aacute;c thư th&aacute;i, thoải m&aacute;i v&agrave; v&ocirc; c&ugrave;ng thời trang, tựa như vừa bước v&agrave;o một khu vườn nhiệt đới sum su&ecirc; hoa l&aacute;, c&acirc;y cỏ. Trong bảng m&agrave;u thu đ&ocirc;ng với v&ocirc; v&agrave;n những m&agrave;u sắc trầm buồn, xanh lục bảo l&agrave; một gam m&agrave;u mang năng lượng v&agrave; tươi s&aacute;ng, t&iacute;ch cực hiếm hoi.&nbsp;</div>
<div>
	&nbsp;</div>
<div style="text-align: center;">
	<img alt="xu hướng thu đông 2016" h="505" src="http://afamily1.mediacdn.vn/k:thumb_w/600/8JtZYBME2SUtEok2WIOUV7c3Os5pvZ/Image/2016/09/3-2d49c/xu-huong-thu-dong-2016.jpg" title="xu hướng thu đông 2016" w="700" /></div>
<div>
	&nbsp;</div>
', 0, 2)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (14, N'6 sao Việt giảm nhiều cân tới mức "nhận không ra"', N'6.jpg', N'Nhiều sao Việt có ngoại hình thay đổi rõ rệt so với thời mới hoặc trước khi vào nghề.', CAST(N'2016-10-09 00:00:00.000' AS DateTime), 9, N'<div class="div-baiviet">
	<p class="baiviet-sapo" style="font-size: 13px;">
		Nhiều sao Việt c&oacute; ngoại h&igrave;nh thay đổi r&otilde; rệt so với thời mới hoặc trước khi v&agrave;o nghề.</p>
</div>
<center>
	&nbsp;</center>
<div class="text-conent" itemprop="articleBody">
	<p style="text-align: center;">
		=<img alt="6 sao Việt giảm nhiều cân tới mức &amp;#34;nhận không ra&amp;#34; - 1" class="news-image" src="http://image.24h.com.vn/upload/4-2016/images/2016-10-09/1475992071-147599020959025-untitled-40.jpg" /></p>
	<p style="color:#0000FF;font-style:italic;text-align:center;">
		Th&ugrave;y Chi khiến fan bất ngờ với m&agrave;n thay đổi nhan sắc theo thời gian</p>
	<p style="text-align: center;">
		<img alt="6 sao Việt giảm nhiều cân tới mức &amp;#34;nhận không ra&amp;#34; - 2" class="news-image" src="http://image.24h.com.vn/upload/4-2016/images/2016-10-09/1475992072-147599020963388-untitled-40-1.jpg" /></p>
	<p style="color:#0000FF;font-style:italic;text-align:center;">
		Nếu như c&aacute;ch đ&acirc;y v&agrave;i năm, Th&ugrave;y Chi mũm mĩm v&agrave; c&oacute; th&acirc;n h&igrave;nh đầy đặn dễ g&acirc;y thiện cảm&nbsp;th&igrave; hiện tại c&ocirc; c&oacute; nhan sắc nổi bật hơn nhờ giảm c&acirc;n</p>
	<p style="text-align: center;">
		<img alt="6 sao Việt giảm nhiều cân tới mức &amp;#34;nhận không ra&amp;#34; - 3" class="news-image" src="http://image.24h.com.vn/upload/4-2016/images/2016-10-09/1475992075-147599020964190-untitled-40-1-1.jpg" /></p>
	<p style="color:#0000FF;font-style:italic;text-align:center;">
		Th&ugrave;y Chi ng&agrave;y c&agrave;ng xinh đẹp, khả &aacute;i. H&igrave;nh ảnh mới của c&ocirc; nhận được rất nhiều lời khen ngợi</p>
	<p style="text-align: center;">
		<img alt="6 sao Việt giảm nhiều cân tới mức &amp;#34;nhận không ra&amp;#34; - 4" class="news-image" src="http://image.24h.com.vn/upload/4-2016/images/2016-10-09/1475992076-147599020951297-untitled-41-1.jpg" width="500" /></p>
	<p style="color:#0000FF;font-style:italic;text-align:center;">
		Đức Ph&uacute;c Idol vừa tiết lộ giảm 11 c&acirc;n trong 1 th&aacute;ng</p>
	<p style="text-align: center;">
		<img alt="6 sao Việt giảm nhiều cân tới mức &amp;#34;nhận không ra&amp;#34; - 5" class="news-image" src="http://image.24h.com.vn/upload/4-2016/images/2016-10-09/1475992078-147599020972965-untitled-42.jpg" width="500" /></p>
	<p style="color:#0000FF;font-style:italic;text-align:center;">
		Tuy nhi&ecirc;n phương ph&aacute;p uống nước trừ cơm của qu&aacute;n qu&acirc;n Việt Nam Idol đang bị nhiều d&acirc;n trong nghề thể dục thể h&igrave;nh đ&aacute;nh gi&aacute; l&agrave; thiếu thực tế v&agrave; c&oacute; thể g&acirc;y hại cho sức khỏe</p>
	<p style="text-align: center;">
		<img alt="6 sao Việt giảm nhiều cân tới mức &amp;#34;nhận không ra&amp;#34; - 6" class="news-image" src="http://image.24h.com.vn/upload/4-2016/images/2016-10-09/1475992107-14759902095484-untitled-43.jpg" /></p>
	<p style="color:#0000FF;font-style:italic;text-align:center;">
		Văn Mai Phương cũng l&agrave; một nghệ sĩ giảm c&acirc;n th&agrave;nh c&ocirc;ng</p>
	<p style="text-align: center;">
		<img alt="6 sao Việt giảm nhiều cân tới mức &amp;#34;nhận không ra&amp;#34; - 7" class="news-image" src="http://image.24h.com.vn/upload/4-2016/images/2016-10-09/1475992107-14759902093971-untitled-44.jpg" /></p>
	<p style="color:#0000FF;font-style:italic;text-align:center;">
		C&ocirc; tập gym v&agrave; c&oacute; chế độ dinh dưỡng đặc biệt để c&oacute;&nbsp;d&aacute;ng v&oacute;c thon gọn</p>
	<p style="text-align: center;">
		<img alt="6 sao Việt giảm nhiều cân tới mức &amp;#34;nhận không ra&amp;#34; - 8" class="news-image" src="http://image.24h.com.vn/upload/4-2016/images/2016-10-09/1475992108-147599020941964-untitled-44-1.jpg" /></p>
	<p style="color:#0000FF;font-style:italic;text-align:center;">
		Sự thay đổi ngoại h&igrave;nh của Văn Mai Hương khiến nhiều người nghĩ c&ocirc; đ&atilde; phẫu thuật thẩm mỹ nhưng nữ ca sĩ cho biết đ&oacute; chỉ l&agrave; kết quả của việc giảm c&acirc;n</p>
	<p style="text-align: center;">
		<img alt="6 sao Việt giảm nhiều cân tới mức &amp;#34;nhận không ra&amp;#34; - 9" class="news-image" src="http://image.24h.com.vn/upload/4-2016/images/2016-10-09/1475992108-147599020981463-untitled-45.jpg" /></p>
	<p style="color:#0000FF;font-style:italic;text-align:center;">
		Minh Hằng cũng từng c&oacute; một thời mập &uacute;</p>
	<p style="text-align: center;">
		<img alt="6 sao Việt giảm nhiều cân tới mức &amp;#34;nhận không ra&amp;#34; - 10" class="news-image" src="http://image.24h.com.vn/upload/4-2016/images/2016-10-09/1475992110-147599020993214-untitled-46.jpg" width="500" /></p>
	<p style="color:#0000FF;font-style:italic;text-align:center;">
		Nhờ tập luyện v&agrave; thực hiện nguy&ecirc;n tắc kh&ocirc;ng ăn đồ b&eacute;o, nước c&oacute; ga sau 7 giờ tối, Minh Hằng giờ đ&acirc;y c&oacute; được v&oacute;c d&aacute;ng &quot;vạn người m&ecirc;&quot;</p>
	<p style="text-align: center;">
		<img alt="6 sao Việt giảm nhiều cân tới mức &amp;#34;nhận không ra&amp;#34; - 11" class="news-image" src="http://image.24h.com.vn/upload/4-2016/images/2016-10-09/1475992110-147599020915523-untitled-47.jpg" width="500" /></p>
	<p style="color:#0000FF;font-style:italic;text-align:center;">
		Th&aacute;i Trinh giảm được tổng c&ocirc;ng 12 kg so với thời thi The Voice.&nbsp;B&iacute; quyết của c&ocirc; l&agrave;&nbsp;ăn rau xanh v&agrave; uống 5 chai nước suối mỗi ng&agrave;y kết hợp c&ugrave;ng&nbsp;tập luyện để cơ thể được khoẻ mạnh hơn. Mỗi ng&agrave;y c&ocirc;&nbsp;nhảy d&acirc;y 1000 c&aacute;i v&agrave;o buổi s&aacute;ng, chiều chạy li&ecirc;n tục 45 ph&uacute;t, tối tập yoga</p>
	<p style="text-align: center;">
		<img alt="6 sao Việt giảm nhiều cân tới mức &amp;#34;nhận không ra&amp;#34; - 12" class="news-image" src="http://image.24h.com.vn/upload/4-2016/images/2016-10-09/1475992110-147599020972766-untitled-47-1.jpg" width="500" /></p>
	<p style="color:#0000FF;font-style:italic;text-align:center;">
		H&agrave; Anh Tuấn từng nặng hơn 100 kg. Nhờ chế độ luyện tập v&agrave; ăn ki&ecirc;ng khoa học, anh c&oacute; được v&oacute;c d&aacute;ng săn chắc, gọn g&agrave;ng hơn tr&ocirc;ng thấy</p>
</div>
<br />
', 0, 2)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (15, N'Bí quyết làm đẹp của hot girl vạn người mê Helly Tống', N'heli.jpg', N'Khi nhắc đến Helly Tống, không ít người phải xuýt xoa và trầm trồ về cô gái với nét đẹp thuần túy. Không chỉ xinh đẹp, Helly Tống còn rất thành công trong lĩnh vực kinh doanh khi mới 21 tuổi.', CAST(N'2016-10-09 00:00:00.000' AS DateTime), 6, N'<div class="div-baiviet">
	<p class="baiviet-sapo" style="font-size: 13px;">
		Hot girl với vẻ đẹp đặc biệt chia sẻ về những m&oacute;n đồ l&agrave;m đẹp ưa th&iacute;ch của m&igrave;nh.</p>
</div>
<center>
	&nbsp;</center>
<div class="text-conent" itemprop="articleBody">
	<p align="center">
		<img alt="Bí quyết làm đẹp của hot girl vạn người mê Helly Tống - 1" class="news-image" src="http://image.24h.com.vn/upload/4-2016/images/2016-10-06/1475723946-147565303673506-12814806_1155820024430248_1409989156239140250_n.jpg" width="500" /></p>
	<p>
		Khi nhắc đến Helly Tống, kh&ocirc;ng &iacute;t người phải xu&yacute;t xoa v&agrave; trầm trồ về c&ocirc; g&aacute;i với n&eacute;t đẹp thuần t&uacute;y. Kh&ocirc;ng chỉ&nbsp;xinh đẹp, Helly Tống c&ograve;n rất th&agrave;nh c&ocirc;ng trong lĩnh vực kinh doanh khi mới 21 tuổi.</p>
	<p>
		Kh&ocirc;ng giống như những hot girl kh&aacute;c, bản th&acirc;n Helly Tống kh&ocirc;ng muốn được gọi như vậy, c&ocirc; quan niệm về đời kh&aacute;c hẳn số đ&ocirc;ng những bạn trẻ kh&aacute;c.&nbsp;Helly Tống&nbsp;sống trầm lặng v&agrave; y&ecirc;n b&igrave;nh theo lối sống c&oacute; lẽ như của một người trưởng th&agrave;nh v&agrave; hẳn l&agrave; đ&atilde; c&oacute; nhiều thăng trầm trong cuộc sống.</p>
	<p align="center">
		<img alt="Bí quyết làm đẹp của hot girl vạn người mê Helly Tống - 2" class="news-image" src="http://image.24h.com.vn/upload/4-2016/images/2016-10-06/1475723946-147565316311501-12144820_1078635462148705_8308955014274470998_n.jpg" style="text-align: justify;" width="500" /></p>
	<p>
		&nbsp;</p>
	<p>
		N&oacute;i đến l&agrave;m đẹp, Helly c&oacute; những c&aacute;ch rất ri&ecirc;ng.&nbsp;C&ocirc; kh&ocirc;ng chuộng những sản phẩm qu&aacute; đắt tiền, qu&aacute; cao sang.&nbsp;Bản th&acirc;n Helly&nbsp;cũng l&agrave; người khi&ecirc;m nhường, mọi thứ xung quanh c&ocirc;&nbsp;rất đỗi nhẹ nh&agrave;ng, đơn giản, hoặc c&ocirc; khiến mọi thứ trở n&ecirc;n như vậy.</p>
	<p>
		Helly chia sẻ v&igrave;&nbsp;cũng thường xuy&ecirc;n phải đi chụp h&igrave;nh quảng c&aacute;o&nbsp;n&ecirc;n những l&uacute;c rảnh, c&ocirc; chỉ muốn để mọi thứ thật tự nhi&ecirc;n để da được &quot;thở&quot; nhiều hơn. Cũng v&igrave; thế, người&nbsp;ta thường thấy Helly với một vẻ đẹp nhẹ nh&agrave;ng m&agrave; thuần khiết.</p>
	<p>
		Vậy chắc hẳn, c&ocirc; rất quan t&acirc;m đến l&agrave;n da để c&oacute; thể tự tin để mặt mộc như thế. Helly chia sẻ, những sản phẩm kh&ocirc;ng thể thiếu của c&ocirc; h&agrave;ng ng&agrave;y chỉ xoay quanh dưỡng m&ocirc;i, kem BB, một thỏi son v&agrave; mascara.</p>
	<p>
		<strong>Kem dưỡng m&ocirc;i:</strong></p>
	<p>
		Với Helly, kem dưỡng m&ocirc;i&nbsp;dạng s&aacute;p để trong hũ v&ocirc; c&ugrave;ng tiện lợi v&igrave; ngo&agrave;i việc chăm s&oacute;c cho đ&ocirc;i m&ocirc;i kh&ocirc;ng bị kh&ocirc; nẻ, c&ograve;n c&oacute; thể d&ugrave;ng để b&ocirc;i cho c&aacute;c v&ugrave;ng da kh&ocirc; kh&aacute;c. Thậm ch&iacute;, c&ocirc; c&ograve;n trộn kem dưỡng m&ocirc;i&nbsp;với đường n&acirc;u để th&agrave;nh hỗn hợp&nbsp;tẩy da chết cho m&ocirc;i.&nbsp;</p>
	<p>
		<strong>Kem BB:</strong></p>
	<p>
		Đối với kem BB, Helly chọn loại kem với độ che phủ mỏng nhất. C&ocirc;&nbsp;kh&ocirc;ng th&iacute;ch da mặt m&igrave;nh bị t&ocirc; tr&aacute;t qu&aacute; nhiều lớp, chỉ cần&nbsp;đơn giản l&agrave;&nbsp;l&agrave;m đều m&agrave;u da hơn, che những v&ugrave;ng bị th&acirc;m sau mụn v&agrave; tiện chống nắng lu&ocirc;n.</p>
	<p>
		<strong>Son:</strong></p>
	<p>
		M&agrave;u&nbsp;son y&ecirc;u th&iacute;ch của Helly lu&ocirc;n l&agrave;&nbsp;m&agrave;u đỏ, điều đ&oacute; cũng l&iacute; giải tại sao ch&uacute;ng ta thường thấy Helly c&oacute; một đ&ocirc;i m&ocirc;i căng mọng. C&ocirc; chia sẻ khi n&agrave;o &ldquo;l&agrave;m biếng&rdquo; c&ograve;n c&oacute; thể d&ugrave;ng son l&agrave;m m&agrave;u m&aacute; hồng lu&ocirc;n.</p>
	<p>
		<strong>Mascara:</strong></p>
	<p>
		Mỗi&nbsp;c&ocirc; g&aacute;i kh&ocirc;ng thể thiếu mascara&nbsp;n&ecirc;n chắc chắn Helly kh&ocirc;ng&nbsp;bỏ qua sản phẩm l&agrave;m đẹp n&agrave;y. Tuy nhi&ecirc;n, c&ocirc; cho biết chỉ&nbsp;d&ugrave;ng mascara&nbsp;khi đi dự sự kiện.</p>
</div>
<br />
', 0, 2)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (16, N'3 giải pháp tự nhiên giúp làn da luôn mịn màng, rạng rỡ', N'3333.jpg', N'Làn da sẽ trở nên tối màu khi xuất hiện nhiều đốm đen và những vết nám. Nguyên nhân chính là sự tích tụ của các tạp chất và quá trình sản xuất melanin diễn ra mạnh mẽ. Đây là một loại hắc tố đem đến n', CAST(N'2016-10-09 00:00:00.000' AS DateTime), 6, N'<p>
	L&agrave;n da sẽ trở n&ecirc;n tối m&agrave;u khi xuất hiện nhiều đốm đen v&agrave; những vết n&aacute;m. Nguy&ecirc;n nh&acirc;n ch&iacute;nh l&agrave; sự t&iacute;ch tụ của c&aacute;c tạp chất v&agrave; qu&aacute; tr&igrave;nh sản xuất melanin diễn ra mạnh mẽ. Đ&acirc;y l&agrave; một loại hắc tố đem đến những vết đen xấu x&iacute; tr&ecirc;n khu&ocirc;n mặt.&nbsp;Biện ph&aacute;p khắc phục hiện tượng n&agrave;y l&agrave; tăng cường vitamin thiết yếu cho sức khỏe l&agrave;n da v&agrave; loại bỏ c&aacute;c hắc tố đem lại vẻ đẹp mịn m&agrave;ng tự nhi&ecirc;n.</p>
<p>
	<em>H&atilde;y thực hiện theo 3 giải ph&aacute;p dưới đ&acirc;y để c&oacute; được l&agrave;n da mịn m&agrave;ng như &yacute;</em></p>
<p>
	<strong>1. Tăng cường vitamin</strong></p>
<p>
	L&agrave;n da đổi m&agrave;u c&oacute; thể l&agrave; từ nguy&ecirc;n nh&acirc;n thiếu hụt vitamin, v&igrave; vậy h&atilde;y t&igrave;m c&aacute;ch tăng cường vitamin E v&agrave; C cho tế b&agrave;o da để lấy lại vẻ đẹp tự nhi&ecirc;n.&nbsp;</p>
<p>
	Buổi tối trước khi đi ngủ nghiền nhỏ v&agrave;i vi&ecirc;n vitamin C hoặc b&oacute;c một vi&ecirc;n nang mềm viamin E rồi xoa nhẹ l&ecirc;n l&agrave;n da tr&ecirc;n khu&ocirc;n mặt. H&atilde;y để ch&uacute;ng tr&ecirc;n da bạn qua đ&ecirc;m v&agrave; rửa sạch v&agrave;o s&aacute;ng sớm h&ocirc;m sau. Ki&ecirc;n tr&igrave; với biện ph&aacute;p n&agrave;y bạn sẽ nhận thấy sự đổi kh&aacute;c của l&agrave;n da ng&agrave;y c&agrave;ng rạng rỡ. Mặt kh&aacute;c, bạn cũng n&ecirc;n t&iacute;ch cực hơn nữa việc ti&ecirc;u thụ những loại thực phẩm c&oacute; chứa nhiều những loại vitamin n&agrave;y, nhất l&agrave; c&aacute;c loại tr&aacute;i c&acirc;y ti&ecirc;u biểu như cam, qu&yacute;t, d&acirc;u t&acirc;y&hellip;</p>
<p style="text-align: center;">
	<img alt="3 giải pháp tự nhiên giúp làn da luôn mịn màng, rạng rỡ - 2" class="news-image" src="http://image.24h.com.vn/upload/4-2016/images/2016-10-05/1475666606-147555395182549-da-dv2.jpg" /><br />
	<span style="color:#0000FF;"><em>Vitamin E gi&uacute;p l&agrave;n da mịn m&agrave;ng&nbsp;</em></span></p>
<p>
	<strong>2. &Aacute;p dụng một số nguy&ecirc;n liệu tự nhi&ecirc;n</strong></p>
<p>
	Trong cuộc sống, c&oacute; nhiều loại sản phẩm tự nhi&ecirc;n c&oacute; thể gi&uacute;p bạn loại bỏ hắc tố da hiệu quả. Thực hiện theo một số c&aacute;ch l&agrave;m dưới đ&acirc;y bạn sẽ thấy hiệu quả nhanh ch&oacute;ng.</p>
<p style="text-align: center;">
	<img alt="3 giải pháp tự nhiên giúp làn da luôn mịn màng, rạng rỡ - 3" class="news-image" src="http://image.24h.com.vn/upload/4-2016/images/2016-10-05/1475666606-147555395143228-da-dv3.jpg" /><br />
	<span style="color:#0000FF;"><em>Một số nguy&ecirc;n liệu c&oacute; t&iacute;nh năng tẩy trắng da hiệu quả</em></span></p>
<p>
	C&aacute;ch 1: D&ugrave;ng dầu thầu dầu ch&agrave; x&aacute;t nhẹ nh&agrave;ng l&ecirc;n l&agrave;n da hai ng&agrave;y một lần v&agrave; rửa sạch với nước ấm. Thực hiện ki&ecirc;n tr&igrave; theo c&aacute;ch n&agrave;y, bạn sẽ gi&uacute;p l&agrave;n da s&aacute;ng r&otilde; hơn.</p>
<p>
	C&aacute;ch 2: Thường xuy&ecirc;n &aacute;p dụng c&aacute;ch rửa mặt với dầu c&acirc;y tr&agrave; bằng quả &nbsp;b&oacute;ng b&ocirc;ng sẽ gi&uacute;p tế b&agrave;o da ngăn chặn sự hoạt động của c&aacute;c gốc tự do v&agrave; k&iacute;ch th&iacute;ch qu&aacute; tr&igrave;nh ph&aacute;t triển của tế b&agrave;o da mới.</p>
<p>
	C&aacute;ch 3: Sử dụng một quả b&oacute;ng b&ocirc;ng nh&uacute;ng sữa tươi v&agrave; xoa l&ecirc;n những điểm tối tr&ecirc;n da mặt. Để sữa lưu tr&ecirc;n da mặt 10 ph&uacute;t, sau đ&oacute; rửa sạch với nước m&aacute;t v&agrave; vỗ kh&ocirc; với khăn mềm. Thực hiện 2 lần mỗi ng&agrave;y cho đến khi c&oacute; được l&agrave;n da rạng rỡ.</p>
<p>
	C&aacute;ch 4: Xoa nhẹ một ch&uacute;t nước chanh l&ecirc;n khu vực l&agrave;n da tối m&agrave;u trong v&agrave;i ph&uacute;t, sau đ&oacute; rửa sạch với nước m&aacute;t v&agrave; &aacute;p dụng kem dưỡng ẩm. Thực hiện theo c&aacute;ch n&agrave;y, sau một thời gian l&agrave;n da của bạn sẽ sạch sẽ v&agrave; s&aacute;ng r&otilde; hơn.</p>
<p>
	<strong>3. Tự chế mặt nạ l&agrave;m s&aacute;ng da</strong></p>
<p>
	Để tăng cường khả năng l&agrave;m s&aacute;ng da, bạn c&oacute; thể bỏ ra một ch&uacute;t thời gian để chăm s&oacute;c l&agrave;n da với một loại mặt nạ tự nhi&ecirc;n.</p>
<p>
	<em>Th&agrave;nh phần</em></p>
<p>
	- 1 th&igrave;a mật ong</p>
<p>
	- 1 th&igrave;a đường n&acirc;u</p>
<p>
	- Nước lọc vừa đủ</p>
<p style="text-align: center;">
	<img alt="3 giải pháp tự nhiên giúp làn da luôn mịn màng, rạng rỡ - 4" class="news-image" src="http://image.24h.com.vn/upload/4-2016/images/2016-10-05/1475666606-147555395157291-da-dv4.jpg" /><br />
	<span style="color:#0000FF;"><em>Mặt nạ tự nhi&ecirc;n l&agrave;m s&aacute;ng da</em></span></p>
<p>
	<em>Thực hiện</em></p>
<p>
	- Trộn 1 th&igrave;a mật ong v&agrave; 1 th&igrave;a đường n&acirc;u trong b&aacute;t để ch&uacute;ng kết hợp với nhau th&agrave;nh bột nh&atilde;o. Bạn c&oacute; thể th&ecirc;m một ch&uacute;t nước lọc để hỗn hợp c&oacute; được độ nh&atilde;o ph&ugrave; hợp thuận tiện cho việc sử dụng.</p>
<p>
	- Rửa sạch khu&ocirc;n mặt v&agrave; vỗ ẩm với nước ấm, sau đ&oacute; xoa nhẹ nh&agrave;ng hỗn hợp mặt nạ theo h&igrave;nh tr&ograve;n nhỏ l&ecirc;n l&agrave;n da v&agrave; thư gi&atilde;n.</p>
<p>
	- Sau 15 p h&uacute;t rửa sạch mặt nạ với nước ấm v&agrave; vỗ kh&ocirc; với khăn mềm.</p>
', 0, 2)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (17, N'Đây là lý do vì sao Hoàng tử bé lại luôn mặc quần ngắn dù thời tiết có lạnh', N'princ.jpg', N'Từ khi chào đời vào năm 2013 cho đến nay, hoàng tử bé George, con trai đầu lòng của hoàng tử William và công nương Kate Middleton nước Anh luôn nhận được nhiều tình cảm cũng như sự quan tâm đặc biệt c', CAST(N'2016-10-09 00:00:00.000' AS DateTime), 15, N'<h2>
	Nếu để &yacute;, c&oacute; thế thấy lần n&agrave;o xuất hiện Ho&agrave;ng tử b&eacute; cũng mặc quần shorts ngắn, nhưng kh&ocirc;ng phải v&igrave; n&oacute;ng qu&aacute; đ&acirc;u nh&eacute;.</h2>
<div class="detail_content fl mgt15">
	<div>
		Từ khi ch&agrave;o đời v&agrave;o năm 2013 cho đến nay, ho&agrave;ng tử b&eacute; George, con trai đầu l&ograve;ng của ho&agrave;ng tử William v&agrave; c&ocirc;ng nương Kate Middleton nước Anh lu&ocirc;n nhận được nhiều t&igrave;nh cảm cũng như sự quan t&acirc;m đặc biệt của c&ocirc;ng ch&uacute;ng. Kh&ocirc;ng chỉ nổi tiếng với vẻ ngo&agrave;i đ&aacute;ng y&ecirc;u hết mức, <a href="http://afamily.vn/hoang-tu-be/trang-3.htm" target="http://afamily.vn/hoang-tu-be/trang-3.htm" title="hoàng tử bé"><span style="font-weight: bold;">ho&agrave;ng tử b&eacute;</span></a> c&ograve;n được biết đến với khả năng biến mọi thứ m&igrave;nh mặc trở th&agrave;nh &quot;hot items&quot;, thậm ch&iacute; c&oacute; những m&oacute;n đồ được b&aacute;n hết sạch trong 1 đ&ecirc;m. V&agrave; cũng&nbsp;&nbsp;giống như mẹ Kate Middleton, ho&agrave;ng tử nhỏ lu&ocirc;n được giới truyền th&ocirc;ng săn đ&oacute;n v&agrave; lu&ocirc;n xuất hiện với phong c&aacute;ch thời trang đặc trưng.</div>
	<div>
		&nbsp;</div>
	<div>
		Nếu để &yacute; lần xuất hiện n&agrave;o của ho&agrave;ng tử George, th&igrave; cậu b&eacute; lu&ocirc;n lu&ocirc;n mặc quần shorts ngắn v&agrave; l&yacute; do đằng sau sự lựa chọn thời trang n&agrave;y l&agrave; g&igrave;?&nbsp;</div>
	<div>
		&nbsp;</div>
	<div style="text-align: center;">
		<span style="font-style: italic;"><img alt="Hoàng tử bé nước Anh " h="752" src="http://afamily1.mediacdn.vn/k:thumb_w/600/J1mfVMcPYSxDH1erfcccccccccccc5/Image/2016/10/tat-tan-tat-ve-hoang-tu-be-nuoc-anh-cau-be-nho-tuoi-quyen-luc-nhat-the-gioi_a61110a9e7-1dd65/hoang-tu-be-nuoc-anh-.jpg" title="Hoàng tử bé nước Anh " w="600" /></span></div>
	<div style="text-align: center;">
		<span style="font-style: italic;">H&igrave;nh ảnh mới nhất của Ho&agrave;ng tử b&eacute; trong bộ đồ xinh xắn với &aacute;o ph&ocirc;ng c&oacute; cổ v&agrave; quần shorts ngắn.&nbsp;</span></div>
	<div style="text-align: center;">
		&nbsp;</div>
	<div style="text-align: center;">
		<img alt="Hoàng tử bé nước Anh " h="1015" src="http://afamily1.mediacdn.vn/k:thumb_w/600/J1mfVMcPYSxDH1erfcccccccccccc5/Image/2016/10/hoang-tu-be-1dd65/hoang-tu-be-nuoc-anh-.jpg" title="Hoàng tử bé nước Anh " w="600" /></div>
	<div style="text-align: center;">
		<span style="font-style: italic;">Ngay từ l&uacute;c b&eacute; t&iacute;, lần n&agrave;o xuất hiện Ho&agrave;ng tử cũng diện quần ngắn...</span></div>
	<div style="text-align: center;">
		&nbsp;</div>
	<div style="text-align: center;">
		<img alt="Hoàng tử bé nước Anh " h="545" src="http://afamily1.mediacdn.vn/k:thumb_w/600/J1mfVMcPYSxDH1erfcccccccccccc5/Image/2016/10/6-1469511197684-1dd65/hoang-tu-be-nuoc-anh-.jpg" title="Hoàng tử bé nước Anh " w="650" /></div>
	<div style="text-align: center;">
		<span style="font-style: italic;">... ngay cả khi mặc đồ yếm nữa nh&eacute;.</span></div>
	<div style="text-align: center;">
		&nbsp;</div>
	<div style="text-align: center;">
		<img alt="Hoàng tử bé nước Anh " h="661" src="http://afamily1.mediacdn.vn/k:thumb_w/600/J1mfVMcPYSxDH1erfcccccccccccc5/Image/2016/10/tat-tan-tat-ve-hoang-tu-be-nuoc-anh-cau-be-nho-tuoi-quyen-luc-nhat-the-gioi_4ae89c111f-1dd65/hoang-tu-be-nuoc-anh-.jpg" title="Hoàng tử bé nước Anh " w="600" /></div>
	<div style="text-align: center;">
		<span style="font-style: italic;">Trời se lạnh một ch&uacute;t th&igrave; Ho&agrave;ng tử vẫn xuất hiện với chiếc quần ngắn, nhưng kết hợp ấm &aacute;p hơn với tất d&agrave;i v&agrave; &aacute;o len.</span></div>
	<div style="text-align: center;">
		&nbsp;</div>
	<div style="text-align: center;">
		<div>
			<img alt="Hoàng tử bé nước Anh " h="471" src="http://afamily1.mediacdn.vn/k:thumb_w/600/J1mfVMcPYSxDH1erfcccccccccccc5/Image/2016/10/21JanPAYPROD22072016Georgeonabox-1dd65/hoang-tu-be-nuoc-anh-.jpg" title="Hoàng tử bé nước Anh " w="615" /></div>
		<div>
			<span style="font-style: italic;">C&oacute; vẻ nhưng mặc quần ngắn v&agrave; đi tất d&agrave;i l&agrave; phong c&aacute;ch m&agrave; mẹ Kate chọn cho George?</span></div>
		<div>
			&nbsp;</div>
		<div>
			<img alt="Hoàng tử bé nước Anh " h="1132" src="http://afamily1.mediacdn.vn/k:thumb_w/600/J1mfVMcPYSxDH1erfcccccccccccc5/Image/2016/10/5-1469511197709-1dd65/hoang-tu-be-nuoc-anh-.jpg" title="Hoàng tử bé nước Anh " w="650" /></div>
		<div>
			&nbsp;</div>
		<div>
			<img alt="Hoàng tử bé nước Anh " h="433" src="http://afamily1.mediacdn.vn/k:thumb_w/600/J1mfVMcPYSxDH1erfcccccccccccc5/Image/2016/10/3-1469511197677-1dd65/hoang-tu-be-nuoc-anh-.jpg" title="Hoàng tử bé nước Anh " w="650" /></div>
		<br />
		<div>
			<img alt="Hoàng tử bé nước Anh " h="360" src="http://afamily1.mediacdn.vn/k:thumb_w/600/J1mfVMcPYSxDH1erfcccccccccccc5/Image/2016/10/tat-tan-tat-ve-hoang-tu-be-nuoc-anh-cau-be-nho-tuoi-quyen-luc-nhat-the-gioi-tiep_c2bf1f1c8b-1dd65/hoang-tu-be-nuoc-anh-.jpg" title="Hoàng tử bé nước Anh " w="600" /></div>
		<div>
			&nbsp;</div>
		<div style="text-align: left;">
			Mới đ&acirc;y chuy&ecirc;n gia nghi thức William Hanson đ&atilde; tiết lộ về việc v&igrave; sao Ho&agrave;ng tử b&eacute; lại lu&ocirc;n xuất hiện với chiếc quần shorts ngắn n&agrave;y với tạp ch&iacute; &nbsp;Harper Bazaar UK: &quot;Tại Anh, quần d&agrave;i d&agrave;nh cho b&eacute; trai lớn v&agrave; những người đ&agrave;n &ocirc;ng, trong khi quần shorts ngắn d&agrave;nh cho những cậu b&eacute; nhỏ tuổi. Gia đ&igrave;nh Ho&agrave;ng gia vẫn lu&ocirc;n lu&ocirc;n trung th&agrave;nh với truyền thống n&agrave;y, như Ho&agrave;ng tử William hay Harry đ&atilde; mặc quần shorts cho đến khi được coi l&agrave; đủ tuổi để quần d&agrave;i (quần &acirc;u), v&agrave; thường l&agrave; khoảng 8 năm&quot;. Với truyền thống n&agrave;y, th&igrave; đ&acirc;y thực sự l&agrave; c&aacute;ch gi&uacute;p Ho&agrave;ng tử nổi bật trong m&ugrave;a đ&ocirc;ng đấy chứ!.&nbsp;</div>
		<br />
		<div>
			&nbsp;</div>
		<div style="text-align: right;">
			&nbsp;</div>
		<div style="text-align: right;">
			<span style="font-style: italic;">Nguồn: Thezoereport</span></div>
	</div>
</div>
<p>
	<br />
	<br />
	&nbsp;</p>
', 0, 2)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (18, N'Giới thiệu công ty', N'do dong.jpg', N'Được thành lập từ năm 2005, Em đẹp là Công ty thời trang và may mặc chuyên sản xuất, kinh doanh các sản phẩm dệt may, thời trang và thủ công mỹ nghệ… xuất khẩu sang các thị trường khó tính như Nhật Bả', CAST(N'2016-10-09 00:00:00.000' AS DateTime), 39, N'<div>
	Được th&agrave;nh lập từ năm 2017, Em đẹp l&agrave; website chuy&ecirc;n kinh doanh c&aacute;c sản phẩm dệt may, thời trang v&agrave; thủ c&ocirc;ng mỹ nghệ&hellip; xuất khẩu sang c&aacute;c thị trường kh&oacute; t&iacute;nh như Nhật Bản, Mỹ. Được x&acirc;y dựng tr&ecirc;n gi&aacute; trị cốt l&otilde;i l&agrave; C&ocirc;ng bằng &ndash; T&ocirc;n trọng &ndash; S&aacute;ng tạo, Em đẹp ng&agrave;y c&agrave;ng khẳng định được uy t&iacute;n v&agrave; thương hiệu tr&ecirc;n thị trường quốc tế.</div>
<div>
	Emdep.vn l&agrave; một trang th&ocirc;ng tin tin tức giải tr&iacute; cho ph&aacute;i đẹp, th&ocirc;ng tin lu&ocirc;n đa dạng, n&oacute;ng hổi, được cập nhật h&agrave;ng giờ.</div>
<div>
	<img alt="" src="https://scontent.fhan4-1.fna.fbcdn.net/v/t1.0-9/15178035_154031365070810_7128991633863848866_n.jpg?oh=7b0b068a36af319f3b1c682f0503dd5c&amp;oe=59D7275A" style="width: 640px; height: 960px;" /></div>
<div>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; <em>Tổng gi&aacute;m đốc của emdep.vn</em></div>
<div>
	<br />
	&nbsp;</div>
<div>
	Với định hướng ph&aacute;t triển xuất khẩu, đồng h&agrave;nh với việc ph&aacute;t triển thị trường nội địa. Năm 2013, Em đẹp đ&atilde; ph&aacute;t triển c&aacute;c d&ograve;ng sản phẩm khăn truyền thống mang nh&atilde;n hiệu PANSY, được dệt từ sợi b&ocirc;ng tự nhi&ecirc;n (100% cotton, bamboo) c&oacute; bề mặt mịn, độ thấm h&uacute;t cao, an to&agrave;n v&agrave; tạo cảm gi&aacute;c dễ chịu cho người sử dụng. Đến nay, nh&atilde;n hiệu &ldquo;PANSY&rdquo; đ&atilde; sở hữu hơn 15 đầu sản phẩm v&agrave; được b&agrave;y b&aacute;n rộng r&atilde;i tr&ecirc;n khắp cả nước.</div>
<div>
	&nbsp;Giữ vững mục ti&ecirc;u kh&ocirc;ng ngừng đa dạng h&oacute;a c&aacute;c d&ograve;ng sản phẩm để phục vụ nhu cầu ng&agrave;y c&agrave;ng cao của Qu&yacute; kh&aacute;ch h&agrave;ng, năm 2014, Em đẹp đ&atilde; ph&aacute;t triển v&agrave; đưa ra thị trường c&aacute;c sản phẩm thời trang nam nh&atilde;n hiệu &ldquo;W&amp;W&rdquo; như &aacute;o Polo, T-shirt, &aacute;o sơ mi, quần short, quần t&acirc;y, tất, đồ l&oacute;t v.v.. Hiện nay c&aacute;c sản phẩm &ldquo;W&amp;W&rdquo; cũng đ&atilde; được b&agrave;y b&aacute;n phổ biến tại c&aacute;c k&ecirc;nh MT v&agrave; GT trong cả nước.<br />
	&nbsp;</div>
<div>
	Với quy tr&igrave;nh kh&eacute;p t&iacute;n từ thiết kế - sản xuất - ph&acirc;n phối - x&acirc;y dựng thương hiệu, c&aacute;c sản phẩm của Em đẹp lu&ocirc;n đồng h&agrave;nh v&agrave; đặt lợi &iacute;ch của kh&aacute;ch h&agrave;ng l&ecirc;n h&agrave;ng đầu. C&aacute;c sản phẩm của Em đẹp lu&ocirc;n hợp thời trang, mẫu m&atilde; đẹp, gi&aacute; cả hợp l&yacute; v&agrave; đặc biệt c&aacute;c sản phẩm đều được trải qua kh&acirc;u kiểm tra chất lượng khắt khe, nhằm mang lại sự h&agrave;i l&ograve;ng nhất cho kh&aacute;ch h&agrave;ng.</div>
', 1, 3)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (19, N'Hướng dẫn thanh toán, đặt hàng', N'thanht.jpg', N'Quý khách có thể đặt hàng trên website thông qua các bước sau:
1. Tìm kiểm sản phảm
2. Chọn đặt hàng hoặc thêm vào giỏ hàng
3. Kiểm tra thông tin giỏ hàng, điền thông tin liên hệ
4. Gửi yêu cầu đặ', CAST(N'2016-10-09 00:00:00.000' AS DateTime), 27, N'<header class="article-header clearfix">
	<h1>
		<span style="font-size: 12px;">Qu&yacute; kh&aacute;ch c&oacute; thể đặt h&agrave;ng tr&ecirc;n website th&ocirc;ng qua c&aacute;c bước sau:</span></h1>
</header>
<div class="article-body">
	<p>
		<b>1. T&igrave;m kiểm sản phảm</b></p>
	<p>
		Qu&yacute; kh&aacute;ch truy cập website, click c&aacute;c danh mục sản phẩm muốn xem như &Aacute;o, V&aacute;y... v&agrave; xem những sản phẩm m&igrave;nh y&ecirc;u th&iacute;ch</p>
	<p>
		&nbsp;</p>
	<p>
		2. Chọn đặt h&agrave;ng hoặc th&ecirc;m v&agrave;o giỏ h&agrave;ng<br />
		<br />
		3. Kiểm tra th&ocirc;ng tin giỏ h&agrave;ng, điền th&ocirc;ng tin li&ecirc;n hệ<br />
		<br />
		4. Gửi y&ecirc;u cầu đặt h&agrave;ng</p>
</div>
<br />
', 0, 3)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (20, N'Liên hệ với chúng tôi', N'lien-he.jpg', N'Mọi nhu cầu liên hệ của quý khách, vui lòng liên hệ với chúng tôi theo thông tin dưới đây.
Rất hân hạnh được phục vụ quý khách!', CAST(N'2016-10-09 00:00:00.000' AS DateTime), 47, N'<div>
	Mọi nhu cầu li&ecirc;n hệ của qu&yacute; kh&aacute;ch, vui l&ograve;ng li&ecirc;n hệ với ch&uacute;ng t&ocirc;i theo th&ocirc;ng tin dưới đ&acirc;y.<br />
	<br />
	Cửa h&agrave;ng thời trang nữ Em đẹp<br />
	Địa chỉ: Nh&agrave; 18T2 Khu đ&ocirc; thị Trung H&ograve;a - Nh&acirc;n Ch&iacute;nh, Thanh Xu&acirc;n, H&agrave; Nội<br />
	Số điện thoại: 0902 234 481<br />
	Email: emdepfashion@gmail.com<br />
	&nbsp;</div>
<div>
	Rất h&acirc;n hạnh được phục vụ qu&yacute; kh&aacute;ch!</div>
', 0, 3)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (29, N'Mải selfie để ''lấy le'' với bạn gái, nam thanh niên chết oan vì rơi từ thác nước cao 60m', N'2017_05_31_21_56_08_840thac.jpg', N'Chiều thứ 2 (29/5), một nam thanh niên 25 tuổi đến từ Spokane, Washington đã cùng bạn gái đến công viên Palouse để vui chơi.', CAST(N'2017-05-31 00:00:00.000' AS DateTime), 11, N'<p>
	Một nam thanh ni&ecirc;n 25 tuổi đ&atilde; bặt v&ocirc; &acirc;m t&iacute;n sau khi rơi xuống từ v&aacute;ch đ&aacute; tr&ecirc;n th&aacute;c nước cao 60 m&eacute;t khi đang selfie với bạn g&aacute;i.</p>
<div itemprop="articleBody">
	<p>
		Chiều thứ 2 (29/5), một nam thanh ni&ecirc;n 25 tuổi đến từ Spokane, Washington đ&atilde; c&ugrave;ng bạn g&aacute;i đến c&ocirc;ng vi&ecirc;n Palouse để vui chơi.</p>
	<p>
		Cả hai đ&atilde; tr&egrave;o l&ecirc;n những v&aacute;ch đ&aacute; gần th&aacute;c nước. V&agrave; trong khi đang cố chụp những bức ảnh selfie ấn tượng c&ugrave;ng người y&ecirc;u th&igrave; ch&agrave;ng trai đ&atilde; bị trượt ch&acirc;n v&agrave; ng&atilde; từ th&aacute;c nước c&oacute; độ cao 60 m&eacute;t xuống nước.</p>
	<p>
		Một du kh&aacute;ch kh&aacute;c cũng ở c&ocirc;ng vi&ecirc;n ở thời điểm đ&oacute; đ&atilde; n&oacute;i rằng anh đ&atilde; nh&igrave;n thấy một c&ocirc; g&aacute;i tr&egrave;o l&ecirc;n v&aacute;ch đ&aacute; c&ugrave;ng bạn trai m&igrave;nh v&agrave; c&ocirc; ấy đ&atilde; h&eacute;t l&ecirc;n rất lớn khi anh n&agrave;y rơi ra khỏi v&aacute;ch đ&aacute;.</p>
	<p>
		Đội cứu hộ đ&atilde; đến th&aacute;c l&uacute;c 14h30 chiều v&agrave; đ&atilde; mất v&agrave;i giờ để t&igrave;m kiếm nam thanh ni&ecirc;n nhưng kh&ocirc;ng th&agrave;nh c&ocirc;ng.</p>
	<p>
		Theo th&ocirc;ng tin từ CBS News th&igrave; bạn g&aacute;i của ch&agrave;ng trai đ&atilde; n&oacute;i với nh&agrave; chức tr&aacute;ch rằng ch&agrave;ng trai đ&atilde; trượt ch&acirc;n trước khi bị cuốn xuống khu vực hạ lưu - Nước được cho l&agrave; rất lạnh v&agrave; d&acirc;ng cao v&agrave;o thời điểm đ&oacute;.</p>
	<img alt="" src="http://thoidai.com.vn/portals/0/news_images/2017/03/trongsang/ava_cay_de_chet_nguoi_thac_kintampo.jpg" style="width: 300px; height: 200px;" /><br />
	<p>
		V&agrave;o cuối năm 2015, c&aacute;c nh&acirc;n vi&ecirc;n tại c&ocirc;ng vi&ecirc;n n&agrave;y đ&atilde; dựng một h&agrave;ng r&agrave;o tạm thời để ngăn những người đi bộ tiến đến gần th&aacute;c Palouse. Tuy nhi&ecirc;n h&agrave;ng r&agrave;o n&agrave;y đ&atilde; bị dỡ bỏ v&agrave;o năm 2016 v&agrave; thay v&agrave;o đ&oacute; l&agrave; cảnh b&aacute;o nguy hiểm khi đi v&agrave;o con đường m&ograve;n gần th&aacute;c nước n&agrave;y.</p>
	<p>
		Mặc d&ugrave; c&aacute;c nh&acirc;n vi&ecirc;n cứu hộ đ&atilde; trở lại t&igrave;m kiếm nạn nh&acirc;n v&agrave;o ng&agrave;y thứ 3 (30/5) tại C&ocirc;ng vi&ecirc;n Palouse nhưng nam thanh ni&ecirc;n vẫn bặt v&ocirc; &acirc;m t&iacute;n.</p>
	<p>
		Cơ quan chức năng của c&ocirc;ng vi&ecirc;n cho biết sẽ lưu &yacute; hơn đến sự an to&agrave;n của du kh&aacute;ch sau vụ việc đ&aacute;ng tiếc n&agrave;y.</p>
	<p>
		Quỳnh Trang/Theo Dailymai</p>
</div>
<p>
	&nbsp;</p>
', 1, 4)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (30, N'Cách trồng cây bơ trong nhà phố', N'2017_05_31_21_59_51_230bơ.jpg', N'Cách trồng cây bơ trong nhà phố cho quả sai lúc lắc', CAST(N'2017-05-31 00:00:00.000' AS DateTime), 4, N'<h2>
	rồng c&acirc;y bơ nhỏ xinh thủy canh từ hạt bơ v&ocirc; c&ugrave;ng đơn giản. C&aacute;c bạn h&atilde;y thử &aacute;p dụng bằng c&aacute;c bước trồng dưới đ&acirc;y:</h2>
<div>
	<div>
		<div id="content_detail">
			<p>
				M&ugrave;a h&egrave; đến l&agrave; những xe bơ s&aacute;p tr&agrave;n ngập khắp phố phường. Bạn c&oacute; biết rằng trồng bơ tại nh&agrave; kh&ocirc;ng kh&oacute; khi chỉ cần một quả bơ, một &iacute;t nước, v&agrave;i c&acirc;y tăm, bậu cửa sổ đầy nắng c&ugrave;ng ch&uacute;t ki&ecirc;n nhẫn chờ c&acirc;y lớn l&ecirc;n.</p>
			<p>
				Một c&acirc;y bơ trong nh&agrave; gi&uacute;p giải tỏa kh&ocirc;ng kh&iacute; oi bức m&ugrave;a h&egrave; m&agrave; gi&uacute;p bạn chỉ cho b&eacute; đời <a href="http://www.phunutoday.vn/song-thuc-vat-tag14223/" title="sống thực vật">sống thực vật</a> th&uacute; vị quanh ta.</p>
			<p>
				Chuẩn bị dụng cụ:</p>
			<p>
				- 1 quả bơ<br />
				- Tăm<br />
				- B&aacute;t hoặc hộp to hơn hạt quả bơ<br />
				- Chậu c&acirc;y</p>
			<p>
				C&aacute;ch l&agrave;m:</p>
			<p>
				Bước 1:</p>
			<p>
				- Nhẹ nh&agrave;ng bổ đ&ocirc;i quả bơ để lấy hạt ra. Ch&uacute; &yacute; x&aacute;c định phần tr&ecirc;n v&agrave; phần dưới của hạt: phần tr&ecirc;n l&agrave; phần gần với n&uacute;m của quả bơ c&ograve;n phần dưới l&agrave; ở đầu ngược lại.</p>
			<table>
				<tbody>
					<tr>
						<td>
							<img alt="Cách trồng cây bơ từ hạt, làm cảnh cho mát nhà" src="http://media.phunutoday.vn/files/upload_images/2016/05/12/tr%E1%BB%93ng%20b%C6%A1%20l%C3%A0m%20c%E1%BA%A3nh%20t%E1%BA%A1i%20nh%C3%A0%20phunutoday_vn3.jpg" /></td>
					</tr>
					<tr>
						<td>
							&nbsp;</td>
					</tr>
				</tbody>
			</table>
			<p>
				Bước 2:</p>
			<p>
				- L&agrave;m sạch hột bơ. Cạo bỏ v&agrave; rửa sạch bằng nước lạnh cho hết thịt bơ c&ograve;n d&iacute;nh tr&ecirc;n hột. Bạn cần l&agrave;m sạch hết thịt bơ để cốc nước trồng kh&ocirc;ng bị l&ecirc;n nấm mốc sau v&agrave;i tuần tuần trồng bơ thủy canh.</p>
			<p>
				- B&oacute;c bỏ phần vỏ ngo&agrave;i của hạt quả bơ rồi xi&ecirc;n 3 que tăm c&aacute;ch đều nhau v&agrave;o giữa hạt.&nbsp;</p>
			<p>
				Ch&uacute; &yacute; cắm vừa đủ để c&oacute; đủ chiều d&agrave;i l&agrave;m gi&aacute; đỡ tr&ecirc;n miệng cốc. Những c&acirc;y tăm sẽ giống như một chiếc kiềng ba (bốn) ch&acirc;n chống đỡ cho hạt bơ vững v&agrave;ng.</p>
			<table>
				<tbody>
					<tr>
						<td>
							<img alt="Cách trồng cây bơ từ hạt, làm cảnh cho mát nhà" src="http://media.phunutoday.vn/files/upload_images/2016/05/12/tr%E1%BB%93ng%20b%C6%A1%20l%C3%A0m%20c%E1%BA%A3nh%20t%E1%BA%A1i%20nh%C3%A0%20phunutoday_vn4.jpg" /></td>
					</tr>
					<tr>
						<td>
							&nbsp;</td>
					</tr>
				</tbody>
			</table>
			<p>
				Bước 3:</p>
			<p>
				- Ng&acirc;m hạt bơ v&agrave;o b&aacute;t, cốc nước sao cho nước chỉ tiếp x&uacute;c với phần dưới của hạt v&agrave; ngập đến khoảng nửa hạt. Cần giữ cho phần tr&ecirc;n kh&ocirc; r&aacute;o (đầu nhọn quay l&ecirc;n tr&ecirc;n). Th&acirc;n v&agrave; l&aacute; sẽ mọc l&ecirc;n từ ph&iacute;a tr&ecirc;n, c&ograve;n rễ trắng sẽ nảy ra từ đầu ph&igrave;nh ph&iacute;a dưới.</p>
			<table>
				<tbody>
					<tr>
						<td>
							<img alt="Cách trồng cây bơ từ hạt, làm cảnh cho mát nhà" src="http://media.phunutoday.vn/files/upload_images/2016/05/12/tr%E1%BB%93ng%20b%C6%A1%20l%C3%A0m%20c%E1%BA%A3nh%20t%E1%BA%A1i%20nh%C3%A0%20phunutoday_vn.jpg" /></td>
					</tr>
					<tr>
						<td>
							&nbsp;</td>
					</tr>
				</tbody>
			</table>
			<p>
				Bước 4:</p>
			<p>
				- Để hạt bơ ở nơi kh&ocirc; tho&aacute;ng, c&oacute; &aacute;nh s&aacute;ng mặt trời. Sau khoảng 5 ng&agrave;y, cần thay nước cho bơ 1 lần.</p>
			<table>
				<tbody>
					<tr>
						<td>
							<img alt="Cách trồng cây bơ từ hạt, làm cảnh cho mát nhà" src="http://media.phunutoday.vn/files/upload_images/2016/05/12/tr%E1%BB%93ng%20b%C6%A1%20l%C3%A0m%20c%E1%BA%A3nh%20t%E1%BA%A1i%20nh%C3%A0%20phunutoday_vn_jpg2.jpg" /></td>
					</tr>
					<tr>
						<td>
							&nbsp;</td>
					</tr>
				</tbody>
			</table>
			<p>
				Bước 5:</p>
			<p>
				- Trong v&agrave;i tuần đầu ti&ecirc;n, hột bơ của bạn sẽ kh&ocirc;ng thực sự ph&aacute;t triển g&igrave; nhiều. Nh&igrave;n n&oacute; sẽ chỉ giống như ng&agrave;y đầu ti&ecirc;n m&agrave; bạn trồng.</p>
			<p>
				Nếu hạt tốt, mầm sẽ bắt đầu mọc sau khoảng 2 - 4 tuần hoặc kh&ocirc;ng th&igrave; sẽ phải mất 8 tuần. L&uacute;c n&agrave;y, c&aacute;c bạn cần giữ cho rễ c&acirc;y l&uacute;c n&agrave;o cũng ngập trong nước.</p>
			<table>
				<tbody>
					<tr>
						<td>
							<img alt="Cách trồng cây bơ từ hạt, làm cảnh cho mát nhà" src="http://media.phunutoday.vn/files/upload_images/2016/05/12/tr%E1%BB%93ng%20b%C6%A1%20l%C3%A0m%20c%E1%BA%A3nh%20t%E1%BA%A1i%20nh%C3%A0%20phunutoday_vn5.jpg" /></td>
					</tr>
					<tr>
						<td>
							&nbsp;</td>
					</tr>
				</tbody>
			</table>
			<p>
				Bước 6:</p>
			<p>
				- Khi th&acirc;n c&acirc;y đ&atilde; cao được khoảng 15cm th&igrave; c&aacute;c bạn cần cắt ngắn th&acirc;n c&ograve;n khoảng 8cm. Điều n&agrave;y sẽ gi&uacute;p c&acirc;y tăng trưởng tốt hơn.</p>
			<table>
				<tbody>
					<tr>
						<td>
							<img alt="Cách trồng cây bơ từ hạt, làm cảnh cho mát nhà" src="http://media.phunutoday.vn/files/upload_images/2016/05/12/tr%E1%BB%93ng%20b%C6%A1%20l%C3%A0m%20c%E1%BA%A3nh%20t%E1%BA%A1i%20nh%C3%A0%20phunutoday_vn6.jpg" /></td>
					</tr>
					<tr>
						<td>
							&nbsp;</td>
					</tr>
				</tbody>
			</table>
			<p>
				Bước 7:</p>
			<p>
				- Khi c&acirc;y mọc trở lại đến khoảng 15cm th&igrave; ch&uacute;ng m&igrave;nh chuyển c&acirc;y sang trồng v&agrave;o đất.</p>
			<p>
				Đặt c&acirc;y của bạn ở b&ecirc;n cửa sổ đầy nắng. Tưới nước h&agrave;ng ng&agrave;y v&agrave; chờ c&acirc;y ph&aacute;t triển. Tuy nhi&ecirc;n, nếu l&aacute; c&acirc;y bắt đầu chuyển sang m&agrave;u v&agrave;ng, đ&oacute; l&agrave; một dấu hiệu cho thấy chắc chắn bạn đ&atilde; tưới qu&aacute; nhiều nước. Nếu điều n&agrave;y xảy ra, ngừng tưới nước một v&agrave;i ng&agrave;y cho đến khi đất kh&ocirc; một ch&uacute;t.</p>
			<table>
				<tbody>
					<tr>
						<td>
							<img alt="Cách trồng cây bơ từ hạt, làm cảnh cho mát nhà" src="http://media.phunutoday.vn/files/upload_images/2016/05/12/tr%E1%BB%93ng%20b%C6%A1%20l%C3%A0m%20c%E1%BA%A3nh%20t%E1%BA%A1i%20nh%C3%A0%20phunutoday_vn7.jpg" /></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
<p>
	&nbsp;</p>
', 1, 4)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (31, N'Cách lấy lòng mẹ chồng chị em phải biết', N'2017_05_31_22_02_34_523meck.jpg', N'Bí quyết của nàng dâu được lòng mẹ chồng là thể hiện tình cảm với mẹ chồng. Hãy thành thật, khéo léo cảm ơn mẹ chồng vì những gì bà đã làm, giúp đỡ bạn hay cả hai vợ chồng.', CAST(N'2017-05-31 00:00:00.000' AS DateTime), 6, N'<p>
	Tuyệt chi&ecirc;u 1</p>
<p>
	Một trong những tuyệt chi&ecirc;u lấy l&ograve;ng mẹ chồng kh&oacute; t&iacute;nh được c&aacute;c n&agrave;ng d&acirc;u tương lai &aacute;p dụng nhiều nhất ch&iacute;nh l&agrave; &ldquo;đ&aacute;nh từ xa&rdquo;. Ngay từ khi mẹ ch&agrave;ng c&ograve;n chưa biết bạn &ldquo;mồm ngang mũi dọc&rdquo; thế n&agrave;o, bạn đ&atilde; c&oacute; thể g&acirc;y thiện cảm với b&agrave; qua những lời giới thiệu của bạn trai.</p>
<p>
	Nếu như mẹ ch&agrave;ng cảm nhận được sự quan t&acirc;m của bạn d&agrave;nh cho ch&agrave;ng, qua t&acirc;m tư t&igrave;nh cảm, th&aacute;i độ thậm ch&iacute; qua trang phục, gi&agrave;y d&eacute;p của anh ấy v&agrave; thấy anh ấy tốt hơn l&ecirc;n kể từ khi quen bạn, chắc hẳn h&igrave;nh ảnh của bạn trong mắt mẹ ch&agrave;ng cũng dần trở n&ecirc;n &ldquo;long lanh&rdquo; hơn.</p>
<table>
	<tbody>
		<tr>
			<td>
				<img alt="10 tuyet chieu ''chinh phuc'' me chong kho tinh hinh anh 1" src="http://znews-photo-td.zadn.vn/w660/Uploaded/cqxrcajwp/2013_11_01/6cachgiupnangdauchinhphucbomechong.jpg" /></td>
		</tr>
		<tr>
			<td>
				Ảnh minh họa.</td>
		</tr>
	</tbody>
</table>
<p>
	Tuyệt chi&ecirc;u 2</p>
<p>
	Để ghi điểm trong mắt mẹ bạn trai, c&aacute;c c&ocirc; g&aacute;i cần phải đặc biệt lưu &yacute; vấn đề đầu t&oacute;c, trang phục, c&aacute;ch ứng xử trong lần đầu ti&ecirc;n sang nh&agrave; ch&agrave;ng. Bởi ấn tượng đầu ti&ecirc;n về bạn trong mắt mẹ chồng tương lai sẽ v&ocirc; c&ugrave;ng quan trọng.</p>
<p>
	H&atilde;y ăn mặc v&agrave; l&agrave;m t&oacute;c sao cho hợp với con mắt thẩm mỹ v&agrave; quan điểm thời trang của mẹ ch&agrave;ng. Điều n&agrave;y bạn ho&agrave;n to&agrave;n c&oacute; thể nhờ ch&agrave;ng tư vấn hoặc t&igrave;m hiểu qua c&aacute;ch ăn mặc h&agrave;ng ng&agrave;y của mẹ chồng tương lai.</p>
<p>
	Nếu b&agrave; ưa con d&acirc;u ngoan ngo&atilde;n, dịu d&agrave;ng, tuyệt đối kh&ocirc;ng n&ecirc;n mặc &aacute;o hở rốn, quần r&aacute;ch hoặc l&agrave;m t&oacute;c m&igrave; xoăn t&iacute;t&hellip;</p>
<p>
	Tuy nhi&ecirc;n, bạn cũng kh&ocirc;ng cần qu&aacute; gượng &eacute;p bản th&acirc;n v&agrave; thay đổi 180 độ phong c&aacute;ch của m&igrave;nh, tr&aacute;nh trường hợp &ldquo;c&aacute;i kim trong bọc l&acirc;u ng&agrave;y cũng l&ograve;i ra&rdquo; khiến mối quan hệ sau n&agrave;y trở n&ecirc;n căng thẳng kh&ocirc;ng đ&aacute;ng c&oacute;.</p>
<p>
	Tuyệt chi&ecirc;u 3</p>
<p>
	Một trong những nguy&ecirc;n nh&acirc;n khiến c&aacute;c b&agrave; mẹ kh&ocirc;ng bằng l&ograve;ng với bạn g&aacute;i của con trai ch&iacute;nh l&agrave; do chưa muốn &ldquo;cậu ấm&rdquo; sớm lập gia đ&igrave;nh. Những c&ocirc; n&agrave;ng y&ecirc;u ch&agrave;ng bằng tuổi thường gặp phải t&igrave;nh huống &eacute;o le n&agrave;y.</p>
<p>
	Trong trường hợp n&agrave;y, để &ldquo;lấy l&ograve;ng&rdquo; được mẹ chồng tương lai, bạn n&ecirc;n nhờ tới sự gi&uacute;p đỡ của người ấy. Nếu như mẹ ch&agrave;ng biết hai bạn chỉ muốn kết h&ocirc;n khi đ&atilde; ổn định c&ocirc;ng việc, kinh tế hoặc anh ấy muốn lấy vợ để bố mẹ sớm c&oacute; ch&aacute;u bế th&igrave; b&agrave; hẳn sẽ vui l&ograve;ng hơn rất nhiều.</p>
<p>
	Tuyệt chi&ecirc;u 4</p>
<p>
	Ngo&agrave;i việc &ldquo;chăm lo&rdquo; cho mẹ ch&agrave;ng, bạn c&ograve;n phải d&agrave;nh sự quan t&acirc;m tới c&aacute;c th&agrave;nh vi&ecirc;n kh&aacute;c trong gia đ&igrave;nh anh ấy như &ocirc;ng b&agrave;, bố ch&agrave;ng, anh em của ch&agrave;ng&hellip;</p>
<p>
	Nếu chẳng may mẹ ch&agrave;ng c&oacute; kh&ocirc;ng ưng &yacute; với bạn nhưng c&aacute;c th&agrave;nh vi&ecirc;n c&ograve;n lại đều c&oacute; thiện cảm rất tốt đối với bạn th&igrave; &iacute;t nhiều bạn cũng sẽ c&oacute; &ldquo;đồng minh&rdquo; trong c&ocirc;ng cuộc chinh phục mẹ chồng tương lai.</p>
<p>
	Tuyệt chi&ecirc;u 5</p>
<p>
	Để &quot;cải thiện&quot; mối quan hệ mẹ chồng n&agrave;ng d&acirc;u trong tương lai, bạn n&ecirc;n t&igrave;m hiểu sở th&iacute;ch của mẹ ch&agrave;ng v&agrave; mua cho b&agrave; những m&oacute;n qu&agrave; nhỏ nhỏ trong những dịp lễ tết.</p>
<p>
	Sự tinh tế v&agrave; kh&eacute;o l&eacute;o của bạn chắc chắc sẽ ghi điểm trong mắt mẹ ch&agrave;ng.</p>
<p>
	Khi th&agrave;nh người một nh&agrave;&hellip;</p>
<p>
	Tuyệt chi&ecirc;u 1</p>
<p>
	&ldquo;Mẹ chồng lu&ocirc;n đ&uacute;ng&rdquo; &ndash; l&agrave; một trong những điều bạn n&ecirc;n khắc cốt ghi t&acirc;m trong những ng&agrave;y đầu ti&ecirc;n về l&agrave;m d&acirc;u. Tuyệt đối kh&ocirc;ng để t&igrave;nh trạng mẹ chồng n&oacute;i 1 c&acirc;u, con d&acirc;u c&atilde;i nhem nhẻm 10 c&acirc;u.</p>
<p>
	&ldquo;Lời n&oacute;i chẳng mất tiền mua&rdquo; n&ecirc;n bạn h&atilde;y &ldquo;uốn lưỡi bảy lần trước khi n&oacute;i&rdquo; nh&eacute;. Đừng &ldquo;n&oacute;ng qu&aacute; mất kh&ocirc;n&rdquo; m&agrave; n&oacute;i những điều khiến mẹ chồngphật l&ograve;ng.</p>
<p>
	Mọi việc từ nhỏ nhất đến lớn nhất bạn cũng n&ecirc;n hỏi &yacute; kiến của mẹ ch&agrave;ng v&agrave; tốt hơn hết l&agrave; n&ecirc;n chiều l&ograve;ng b&agrave; một ch&uacute;t. Nếu như c&oacute; những việc bạn vẫn muốn l&agrave;m theo &yacute; của m&igrave;nh th&igrave; h&atilde;y từ từ thuyết phục mẹ chồng, chớ n&ecirc;n một m&igrave;nh tự quyết tất cả.</p>
<table>
	<tbody>
		<tr>
			<td>
				<img alt="10 tuyet chieu ''chinh phuc'' me chong kho tinh hinh anh 2" src="http://znews-photo-td.zadn.vn/w660/Uploaded/cqxrcajwp/2013_11_01/bji03160097.jpg" title="10 tuyệt chiêu ''chinh phục'' mẹ chồng khó tính hình ảnh 2" /></td>
		</tr>
		<tr>
			<td>
				Ảnh minh họa.</td>
		</tr>
	</tbody>
</table>
<p>
	Tuyệt chi&ecirc;u 2</p>
<p>
	&ldquo;Chớ n&ecirc;n ph&aacute;t biểu lung tung&rdquo; l&agrave; một trong những điều tối kỵ m&agrave; c&aacute;c n&agrave;ng d&acirc;u cần tr&aacute;nh. Việc thản nhi&ecirc;n đưa ra những lời nhận x&eacute;t, ch&ecirc; bai phũ ph&agrave;ng về th&oacute;i que sinh hoạt, điều kiện sống của nh&agrave; chồng sẽ khiến bạn gặp &quot;tai họa&quot;. Nếu bạn mắc phải sai lầm n&agrave;y, chắc chắn mẹ ch&agrave;ng sẽ &ldquo;trừng trị&rdquo; bạn thẳng tay đ&oacute;.</p>
<p>
	Thay v&agrave;o đ&oacute;, bạn n&ecirc;n kh&eacute;o l&eacute;o khen mẹ chồng trước mặt người ngo&agrave;i, đặc biệt l&agrave; với h&agrave;ng x&oacute;m v&agrave; bạn b&egrave; của b&agrave; để mẹ chồng c&oacute; dịp nở m&agrave;y nở mặt v&agrave; tự h&agrave;o về con d&acirc;u. Qua đ&oacute; cũng th&ecirc;m y&ecirc;u qu&yacute; bạn hơn.</p>
<p>
	Tuyệt chi&ecirc;u 3</p>
<p>
	Khi đ&atilde; l&agrave;m d&acirc;u trong nh&agrave;, bạn đừng qu&ecirc;n th&oacute;i quen mua cho mẹ ch&agrave;ng những m&oacute;n qu&agrave; nho nhỏ.</p>
<p>
	Nếu như bạn cất c&ocirc;ng chọn cho b&agrave; một c&aacute;i &aacute;o thật đẹp, thật đắt tiền nhưng lại bị b&agrave; than phiền l&agrave; l&atilde;ng ph&iacute;, h&atilde;y r&uacute;t kinh nghiệm cho lần sau. Bạn c&oacute; thể biếu tiền trực tiếp cho mẹ chồng để b&agrave; c&oacute; thể tự mua những đồ m&igrave;nh th&iacute;ch.</p>
<p>
	Tuyệt chi&ecirc;u 4</p>
<p>
	V&agrave;o mỗi buổi tối, sau khi cơm nước dọn dẹp b&aacute;t đũa xong, bạn đừng vội v&agrave;ng lẻn l&ecirc;n ph&ograve;ng với chồng ngay.</p>
<p>
	H&atilde;y d&agrave;nh ch&uacute;t thời gian c&ugrave;ng ăn hoa quả, c&ugrave;ng xem tivi v&agrave; tr&ograve; chuyện với mẹ chồng. Bạn cũng c&oacute; thể nhổ t&oacute;c s&acirc;u cho mẹ chồng.</p>
<p>
	Những h&agrave;nh động tưởng như rất nhỏ đ&oacute; th&ocirc;i lại gi&uacute;p mối quan hệ mẹ chồng n&agrave;ng d&acirc;u của bạn &ldquo;dễ thở&rdquo; hơn rất nhiều.</p>
<p>
	Tuyệt chi&ecirc;u 5</p>
<p>
	Nếu hai bạn đ&atilde; dọn ra ở ri&ecirc;ng, đừng lười về thăm nh&agrave; chồng hoặc thường xuy&ecirc;n để một m&igrave;nh &ocirc;ng x&atilde; về.</p>
<p>
	Điều đ&oacute; sẽ khiến mẹ chồng rất phật l&ograve;ng. Tốt hơn hết, h&atilde;y thường xuy&ecirc;n đưa c&aacute;c ch&aacute;u về thăm c&aacute;c cụ v&agrave; đừng qu&ecirc;n mua &iacute;t hoa qu&agrave;, đồ ăn, thuốc bổ về biếu bố mẹ chồng nh&eacute;.</p>
<p>
	Nếu vợ chồng bạn qu&aacute; bận, h&atilde;y thường xuy&ecirc;n gọi điện về hỏi thăm sức khoẻ c&aacute;c cụ nh&eacute;. Chỉ l&agrave; một cử chỉ một h&agrave;nh động quan t&acirc;m rất nhỏ nhưng sẽ gi&uacute;p mối quan hệ mẹ chồng n&agrave;ng d&acirc;u trở n&ecirc;n tốt đẹp hơn rất nhiều.</p>
', 1, 4)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (32, N'Thế nào là mặt tròn và mặt béo', N'2017_05_31_22_05_44_75beo.jpg', N'Sau khi xác định, nếu là mặt tròn xin được chúc mừng bạn. Còn nếu bạn rơi vào trường hợp béo mặt với những biểu hiện như nhiều mỡ, phù nề, mất cân đối thì cũng đừng vội buồn', CAST(N'2017-05-31 00:00:00.000' AS DateTime), 8, N'<p style="text-align: justify;">
	Khu&ocirc;n mặt l&agrave; tấm gương phản &aacute;nh t&acirc;m hồn v&agrave; tr&iacute; &oacute;c, v&igrave; n&oacute; thể hiện cảm x&uacute;c v&agrave; kh&iacute; chất của một người, đồng thời cũng l&agrave; điểm m&agrave; đối phương quan t&acirc;m ch&uacute; &yacute; đến đầu ti&ecirc;n. V&igrave; vậy tất cả mọi người, đặc biệt l&agrave; c&aacute;c bạn g&aacute;i lu&ocirc;n muốn c&oacute; khu&ocirc;n mặt thon gọn, dễ nh&igrave;n, g&acirc;y được thiện cảm với người đối diện.</p>
<p style="text-align: justify;">
	Hiện nay, mặt tr&ograve;n baby bầu bĩnh đang trở th&agrave;nh trao lưu hot h&ograve;n họt ở nhiều quốc gia ch&acirc;u &Aacute;, nhưng c&aacute;c n&agrave;ng chớ nhầm lẫn giữa hai kh&aacute;i niệm mặt tr&ograve;n v&agrave; mặt b&eacute;o nh&eacute;, nếu kh&ocirc;ng hiểu ch&iacute;nh x&aacute;c kh&ocirc;ng kh&eacute;o lại dẫn đến những t&igrave;nh huống dở kh&oacute;c dở cười đấy. Vậy n&ecirc;n, h&atilde;y c&ugrave;ng Emdep.vn t&igrave;m hiểu r&otilde; hơn về định nghĩa chuẩn đẹp n&agrave;y, đồng thời học lu&ocirc;n c&aacute;ch giảm b&eacute;o mặt nếu chẳng may bạn rơi v&agrave;o trường hợp đ&oacute; nh&eacute;.</p>
<p style="text-align: justify;">
	<strong>C&aacute;ch x&aacute;c định mặt tr&ograve;n, bầu bĩnh, đ&aacute;ng y&ecirc;u:</strong></p>
<p style="text-align: justify;">
	Phần m&aacute; v&agrave; xương h&agrave;m c&oacute; độ rộng tương đối bằng nhau, đường quai h&agrave;m tr&ograve;n v&agrave; mềm mại, cằm đầy đặn.</p>
<p style="text-align: justify;">
	Nếu may mắn sở hữu gương mặt tr&ograve;n baby với hai m&aacute; ph&uacute;ng ph&iacute;nh, bạn tr&ocirc;ng sẽ trẻ hơn người đồng tuổi rất nhiều. Cảm gi&aacute;c dường như tuổi xu&acirc;n rời khỏi bạn rất chậm v&agrave; bạn trẻ l&acirc;u, đồng thời g&acirc;y được thiện cảm tốt cho người đối diện v&igrave; n&eacute;t ng&acirc;y thơ, trong s&aacute;ng của m&igrave;nh.</p>
<p style="text-align: justify;">
	<strong>Khu&ocirc;n mặt b&eacute;o</strong></p>
<p>
	<img alt="" src="http://hutmokhongphauthuat.net/wp-content/uploads/2015/07/nguyen-nhan-beo-mat-va-cach-lam-tan-mo-mat-nhanh-nhat1.jpg" style="width: 300px; height: 188px;" /></p>
<p style="text-align: justify;">
	Sau khi x&aacute;c định, nếu l&agrave; mặt tr&ograve;n xin được ch&uacute;c mừng bạn. C&ograve;n nếu bạn rơi v&agrave;o trường hợp b&eacute;o mặt với những biểu hiện như nhiều mỡ, ph&ugrave; nề, mất c&acirc;n đối th&igrave; cũng đừng vội buồn v&igrave; ngay phần sau đ&acirc;y bạn sẽ được hướng dẫn những phương thức hiệu quả để giảm phần mỡ thừa tr&ecirc;n mặt nhanh ch&oacute;ng, gi&uacute;p lấy lại khu&ocirc;n mặt thon gon, thanh t&uacute;.</p>
<p style="text-align: justify;">
	<strong>1. Đắp mặt nạ đất s&eacute;t</strong></p>
<p style="text-align: justify;">
	Một trong những nguy&ecirc;n nh&acirc;n khiến gương mặt ch&uacute;ng ta tr&ocirc;ng to hơn, chảy xệ hơn đ&oacute; l&agrave; v&igrave; khả năng đ&agrave;n hồi của da giảm dần theo tuổi t&aacute;c. Mặt nạ hữu cơ gi&uacute;p k&eacute;o căng l&agrave;n da, tăng t&iacute;nh đ&agrave;n hồi cho da, khi da đ&agrave;n hồi tốt sẽ tạo n&ecirc;n cảm gi&aacute;c săn chắc cho gương mặt. Sử dụng mặt nạ đất s&eacute;t tự nhi&ecirc;n mỗi tuần một lần khiến gương mặt bạn tr&ocirc;ng thon hơn trước.</p>
<p style="text-align: justify;">
	<strong>2. Động t&aacute;c n&acirc;ng cằm</strong></p>
<p style="text-align: justify;">
	Từ từ ngẩng mặt nh&igrave;n l&ecirc;n trần nh&agrave;, k&eacute;o căng cổ, giữ trong năm gi&acirc;y. Mỗi lần thực hiện 10 lần. Tranh thủ những l&uacute;c rảnh trong ng&agrave;y thực hiện đều đặn để mang lại hiệu quả cao. Động t&aacute;c n&agrave;y gi&uacute;p lấy đi phần mỡ thừa quanh cổ, quanh h&agrave;m, l&agrave;m săn chắc cơ mặt v&agrave; cơ cổ. Dễ l&agrave;m m&agrave; lại mang đến hiệu quả.</p>
<p style="text-align: justify;">
	<strong>3. Ngủ đủ</strong></p>
<p style="text-align: justify;">
	Thiếu ngủ g&acirc;y quầng th&acirc;m, cơ mặt chảy xệ. V&igrave; vậy, cần ngủ đủ giấc 8 tiếng mỗi ng&agrave;y để cơ thể c&oacute; thời gian thải độc v&agrave; hồi phục sau một ng&agrave;y mệt mỏi. Hơn thế nữa, trong l&uacute;c ngủ cơ thể vẫn đốt ch&aacute;y năng lượng, điều n&agrave;y hỗ trợ cho việc giảm b&eacute;o mặt, tr&aacute;nh quầng th&acirc;m mắt.</p>
<p style="text-align: left;">
	<strong>4. Kh&ocirc;ng ăn mặn v&agrave; uống nhiều nước v&agrave;o đ&ecirc;m h&ocirc;m trước</strong></p>
<p style="text-align: left;">
	Muối giữ nước, kết hợp uống nhiều nước v&agrave;o đ&ecirc;m h&ocirc;m trước th&igrave; gương mặt bạn s&aacute;ng h&ocirc;m sau sẽ trương phồng l&ecirc;n, đặc biệt l&agrave; v&ugrave;ng bọng mắt sưng h&uacute;p. V&igrave; vậy, tr&aacute;nh ăn mặn v&agrave; uống nhiều nước v&agrave;o ban đ&ecirc;m, trước khi đi ngủ.</p>
<p style="text-align: left;">
	<strong>5. Kh&ocirc;ng nằm gối qu&aacute; thấp</strong></p>
<p style="text-align: left;">
	Nằm gối&nbsp;thấp khiến m&aacute;u dồn l&ecirc;n n&atilde;o, l&agrave;m cho mạch m&aacute;u bị sung huyết dẫn đến sưng mặt v&agrave; m&iacute; mắt.</p>
<p style="text-align: left;">
	<strong>6. Ăn vặt l&agrave;nh mạnh</strong><br />
	Ăn vặt giữa c&aacute;c bữa ăn l&agrave; một th&oacute;i quen l&agrave;nh mạnh, nếu bạn ăn đồ ăn nhẹ v&agrave; bổ dưỡng. Thay v&igrave; ăn vặt với b&aacute;nh quy, b&aacute;nh ngọt v&agrave; bỏng ng&ocirc;, c&aacute;c bạn h&atilde;y thay đổi lại bằng&nbsp;tr&aacute;i c&acirc;y v&agrave; rau cải. Tr&aacute;nh đồ ăn nhiều chất b&eacute;o, nhiều đường, kh&ocirc;ng uống rượu v&agrave; c&agrave; ph&ecirc;.</p>
<p style="text-align: left;">
	<strong>7. Mỉm cười</strong></p>
<p style="text-align: center;">
	<img alt="Mặt tròn và mặt béo khác nhau đấy nhé, các nàng muốn xinh đẹp đúng chuẩn phải học theo cách giảm béo mặt hiệu quả này" src="http://thumb.connect360.vn/unsafe/600x0/imgs.emdep.vn/Share/Image/2017/05/30/05-215859405.jpg" /></p>
<p style="text-align: justify;">
	Cười đ&uacute;ng c&aacute;ch, vừa phải, kh&ocirc;ng k&eacute;o chằng hai cơ m&aacute; hay nh&iacute;u mắt, nh&iacute;u m&agrave;y để tr&aacute;nh hiện tượng xuất hiện nếp nhăn, mau gi&agrave;. Mỉm cười tự nhi&ecirc;n thường xuy&ecirc;n để t&aacute;c động l&ecirc;n cơ mặt, l&agrave;m ti&ecirc;u mỡ. Đồng thời, nếu bạn c&oacute; th&oacute;i quen nhai kẹo cao su kh&ocirc;ng đường cũng sẽ gi&uacute;p cơ mặt hoạt động, đốt ch&aacute;y mỡ thừa, nhưng hạn chế nhai qu&aacute; nhiều kẹo cao su sẽ g&acirc;y ra t&aacute;c dụng phụ.</p>
<p style="text-align: justify;">
	Tr&ecirc;n đ&acirc;y l&agrave; một số c&aacute;ch đơn giản, cực k&igrave; dễ l&agrave;m để hỗ trợ c&aacute;c bạn trong việc giảm b&eacute;o khu&ocirc;n mặt. Ngo&agrave;i ra, c&aacute;c bạn n&ecirc;n tham khảo th&ecirc;m nhiều c&aacute;ch massage mặt rất phổ biến hiện nay. Tập thể dục đều đặn v&agrave; kết hợp chế độ ăn uống hợp l&iacute;, sinh hoạt l&agrave;nh mạnh để vừa giảm c&acirc;n, giảm b&eacute;o mặt, lại vừa c&oacute; một sức khỏe dẻo dai, bền bỉ.&nbsp;</p>
<p style="text-align: justify;">
	<em>Ch&uacute;c c&aacute;c bạn th&agrave;nh c&ocirc;ng!</em></p>
', 1, 4)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (33, N'Có dấu hiệu này khi ngủ, bé nhà bạn lớn lên thông minh hơn', N'2017_05_31_22_08_38_755bebo.jpeg', N'Bé có dấu hiệu này càng sớm, càng chứng tỏ bé sẽ càng nhanh nhẹn và thông minh sau này. ', CAST(N'2017-05-31 00:00:00.000' AS DateTime), 523, N'<p>
	C&aacute;c nh&agrave; t&acirc;m l&yacute; học cho rằng trẻ nhỏ mỉm cười trong khi ngủ kh&ocirc;ng chỉ l&agrave; một động t&aacute;c đơn giản của gương mặt v&agrave; c&ograve;n l&agrave; biểu hiện hoạt động của hệ thống thần kinh đặc biệt l&agrave; n&atilde;o bộ. Cười kh&ocirc;ng chỉ l&agrave; một c&aacute;ch tuyệt vời để tập thể dục, để th&uacute;c đẩy hoạt động của c&aacute;c cơ quan kh&aacute;c nhau trong cơ thể m&agrave; c&ograve;n tốt cho sự ph&aacute;t triển n&atilde;o bộ của b&eacute;. V&igrave; vậy, em b&eacute; c&agrave;ng biết cười sớm khi ngủ, c&agrave;ng c&oacute; chỉ số IQ cao hơn sau n&agrave;y.</p>
<p>
	B&eacute; từ 0-3 th&aacute;ng tuổi cười: thể hiện nhu cầu được đ&aacute;p ứng.</p>
<p>
	B&eacute; mới sinh từ 0-3 th&aacute;ng tuổi sẽ bắt đầu c&oacute; nụ cười sinh l&yacute; tức l&agrave; chỉ cần được đ&aacute;p ứng đ&uacute;ng nhu cầu, b&eacute; sẽ cười. Trẻ ở độ tuổi n&agrave;y cần rất nhiều thời gian để ngủ, được cung cấp đủ chất dinh dưỡng v&agrave; chăm s&oacute;c chu đ&aacute;o. B&eacute; kh&oacute;c hầu như l&agrave; do nhu cầu kh&ocirc;ng được đ&aacute;p ứng.</p>
<p>
	B&eacute; từ 3 đến 6 th&aacute;ng tuổi cười: t&igrave;nh y&ecirc;u của mẹ l&agrave; điều l&agrave;m b&eacute; hạnh ph&uacute;c nhất</p>
<p>
	<img alt="" src="http://www.commentsdb.com/wp-content/uploads/2015/07/Baby-Smile.jpg" style="width: 500px; height: 368px;" /></p>
<p>
	Với em b&eacute; ở độ tuổi n&agrave;y c&oacute; nhiều c&aacute;ch để l&agrave;m b&eacute; cười. Ở giai đoạn n&agrave;y, em b&eacute; thường quan t&acirc;m nhiều nhất đến biểu hiện tr&ecirc;n gương mặt của những người th&acirc;n. Hằng ng&agrave;y mẹ h&atilde;y chơi những tr&ograve; chơi vui nhộn với b&eacute;. Nụ cười của mẹ l&agrave; thứ qu&yacute; gi&aacute; nhất v&agrave; b&eacute; sẽ cảm thấy vui nhất khi nh&igrave;n thấy mẹ cười. V&igrave; vậy, việc tạo ra những ph&uacute;t gi&acirc;y hạnh ph&uacute;c giữa mẹ v&agrave; con c&aacute;i sẽ gi&uacute;p em b&eacute; cảm thấy an to&agrave;n, dần dần h&igrave;nh th&agrave;nh mối quan hệ gắn b&oacute; giữa cha mẹ v&agrave; con c&aacute;i.</p>
<p>
	B&eacute; dưới 1 tuổi cười: thể hiện sự tin tưởng</p>
<p>
	<img alt="" src="http://images.parents.mdpcdn.com/sites/parents.com/files/styles/width_360/public/images/p_MUM59.jpg" style="width: 360px; height: 360px;" /></p>
<p>
	Em khi chưa được một tuổi, nếu được &ldquo;đ&aacute;p ứng&rdquo; nhu hoặc c&oacute; người quen &quot;tr&ecirc;u chọc&quot;, b&eacute; sẽ cười nhiều hơn nữa. V&igrave; vậy, mẹ n&ecirc;n dạy b&eacute; tập đi, tập đẩy xe v&agrave; cười nhiều với b&eacute; hơn, b&eacute; sẽ vui v&agrave; hạnh ph&uacute;c hơn.</p>
<p>
	T&aacute;c dụng của nụ cười đối với sức khỏe của b&eacute;</p>
<p>
	Ngo&agrave;i tốt cho sự ph&aacute;t triển n&atilde;o bộ, nụ cười cũng mang đến t&aacute;c dụng tuyệt vời cho c&aacute;c cơ quan kh&aacute;c trong cơ thể trẻ.</p>
<p>
	Cho tr&aacute;i tim</p>
<p>
	Cười gi&uacute;p l&agrave;m gi&atilde;n c&aacute;c th&agrave;nh động mạch, tăng k&iacute;ch thước mạch m&aacute;u, gi&uacute;p tim được cung cấp nhiều m&aacute;u hơn.</p>
<p>
	Cho phổi</p>
<p>
	C&oacute; thể bạn từng nghe kinh nghiệm được &ocirc;ng b&agrave;, cha mẹ truyền lại l&agrave; &ldquo;để b&eacute; kh&oacute;c nhiều cho nở phổi&rdquo;, nhưng sự thật kh&ocirc;ng phải thế. Cười sẽ tốt cho phổi hơn l&agrave; kh&oacute;c v&agrave; sẽ kh&ocirc;ng l&agrave;m b&eacute; đau. Cười sẽ l&agrave;m phổi nở rộng hơn v&agrave; hơi thở của b&eacute; cũng nhịp nh&agrave;ng hơn. V&agrave; khi cười qu&aacute; tr&igrave;nh trao đổi oxy v&agrave; carbon dioxide sẽ diễn ra tốt hơn, l&agrave;m giảm nguy cơ nhiễm tr&ugrave;ng đường h&ocirc; hấp ở trẻ.</p>
<p>
	Cho gan</p>
<p>
	Tiếng cười l&agrave; c&aacute;ch giải độc tốt nhất cho gan. Cười cũng gi&uacute;p th&uacute;c đẩy sự ph&aacute;t triển của gan, mật.</p>
<p>
	Cho dạ d&agrave;y</p>
<p>
	Cười cũng gi&uacute;p th&uacute;c đẩy sự vận động của dạ d&agrave;y- ruột, gi&uacute;p ti&ecirc;u h&oacute;a v&agrave; thải kh&iacute; trong đường ti&ecirc;u h&oacute;a tốt hơn từ đ&oacute; gi&uacute;p b&eacute; ngăn ngừa t&aacute;o b&oacute;n.</p>
<p>
	Cho hệ miễn dịch</p>
<p>
	Tiếng cười kh&ocirc;ng chỉ l&agrave;m cho em b&eacute; cảm thấy hạnh ph&uacute;c m&agrave; c&oacute; ảnh hưởng t&iacute;ch cực đến hệ miễn dịch của trẻ.</p>
', 1, 4)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (34, N'Những loại rau trồng thoải mái dù nhà có chật chội thế nào đi nữa', N'2017_05_31_22_11_10_802reu.jpg', N' Những loại rau dưới đây không cần nhiều ánh nắng và quy trình chăm sóc cũng đơn giản nên bạn có thể thoải mái trồng trong nhà', CAST(N'2017-05-31 00:00:00.000' AS DateTime), 7, N'<p>
	<img alt="" src="http://baomoi-photo-1-td.zadn.vn/17/05/28/139/22396578/2_108552.jpg" style="width: 700px; height: 583px;" /></p>
<p>
	<img alt="" src="http://baomoi-photo-1-td.zadn.vn/17/05/28/139/22396578/3_104570.jpg" style="width: 700px; height: 739px;" /></p>
<p>
	<img alt="" src="http://baomoi-photo-1-td.zadn.vn/17/05/28/139/22396578/5_159743.jpg" style="width: 700px; height: 1166px;" /></p>
<p>
	<img alt="" src="http://cms.kienthuc.net.vn/zoom/500/Uploaded/ngoclinh/2017_05_28/NewFoldere/cach-trong-rau-mam-trong-thung-xop-9-phunutodayvn_DKSW.jpg" style="width: 500px; height: 300px;" /></p>
<p>
	Han</p>
', 1, 4)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (35, N'Bé mãi không tăng cân? Mẹ hãy làm cách sau', N'2017_05_31_22_12_41_998bebo.jpeg', N'Có rất nhiều lý do làm bé sụt cân hay không tăng cân suốt thời gian dài.  Những nguyên nhân thường gặp là biếng ăn, bị bệnh hoặc ăn uống không đủ lượng', CAST(N'2017-05-31 00:00:00.000' AS DateTime), 3, N'<p>
	1. C&aacute;ch x&aacute;c định b&eacute; nhẹ c&acirc;n</p>
<div>
	<p>
		<img alt="thai nhi cân nặng6." src="http://meonuoicon.com/wp-content/uploads/2016/04/thai-nhi-can-nang6-jpg.49386" /></p>
	<div>
		C&acirc;n nặng của trẻ lu&ocirc;n l&agrave; nỗi lo của mẹ​</div>
	<p>
		​</p>
</div>
<p>
	Việc x&aacute;c định b&eacute; nhẹ c&acirc;n hay kh&ocirc;ng rất quan trọng trong việc thay đổi chế độ dinh dưỡng. Điều đầu ti&ecirc;n, cha mẹ cần phải thường xuy&ecirc;n theo d&otilde;i c&acirc;n nặng v&agrave; chiều cao của trẻ, sau đ&oacute; đ&uacute;ng v&agrave;o một ng&agrave;y h&agrave;ng th&aacute;ng, me lại c&acirc;n v&agrave; đo, so s&aacute;nh với những th&aacute;ng trước.</p>
<p>
	Đối với trẻ dưới 2 tuổi, mẹ đo chiều cao bằng c&aacute;ch cho trẻ nằm xuống. Với trẻ tr&ecirc;n 2 tuổi, cho trẻ đứng khi đo chiều cao.</p>
<p>
	Nếu trong 3 th&aacute;ng li&ecirc;n tục b&eacute; kh&ocirc;ng tăng c&acirc;n hoặc bị tụt c&acirc;n, chiều cao kh&ocirc;ng đạt mức trung b&igrave;nh th&igrave; b&eacute; đang trong t&igrave;nh trạng nhẹ c&acirc;n, suy dinh dưỡng v&agrave; cần phải đến kh&aacute;m dinh dưỡng để can thiệp kịp thời.</p>
<p>
	2. Nguy&ecirc;n nh&acirc;n trẻ nhẹ c&acirc;n</p>
<div>
	​</div>
<p>
	&ndash; Do bệnh l&yacute;: Trẻ c&oacute; thể mắc một số bệnh li&ecirc;n quan tới hệ ti&ecirc;u h&oacute;a như ti&ecirc;u chảy, k&eacute;o d&agrave;i hoặc bị vi&ecirc;m đường h&ocirc; hấp khiến khả năng ăn, nuốt kh&oacute; khăn v&agrave; kh&ocirc;ng hấp thu được dinh dưỡng.</p>
<p>
	Ngo&agrave;i ra, trẻ c&oacute; thể mắc một số bệnh l&yacute; như cường gi&aacute;p, chấn thương, vừa phẫu thuật xong, bị bỏng hoặc những bệnh l&yacute; c&oacute; sử dụng corticoid, đ&aacute;i th&aacute;o đường, suy thận mạn, suy tim, bệnh gan, vi&ecirc;m dạ d&agrave;y, vi&ecirc;m khớp, chậm ph&aacute;t triển vận động, động kinh&hellip;</p>
<p>
	Đặc biệt một số trẻ c&oacute; thể bị mắc bệnh đường ruột l&agrave;m mất khả năng hấp thu chất dinh dưỡng.</p>
<p>
	&ndash; Trẻ sinh non, nhẹ c&acirc;n cũng l&agrave; nguy&ecirc;n nh&acirc;n khiến trẻ chậm ph&aacute;t triển v&agrave; kh&ocirc;ng thể hấp thu được nhiều dinh dưỡng v&agrave;o cơ thể.</p>
<p>
	&ndash; Trẻ bị dị tật bẩm sinh như dị tật hệ ti&ecirc;u h&oacute;a, dị tật hệ thần kinh hoặc bệnh l&yacute; nhiễm sắc thể.</p>
<p>
	3. L&agrave;m g&igrave; khi trẻ bị nhẹ c&acirc;n</p>
<p>
	Khi trẻ bị nhẹ cần, mẹ cần đưa ngay trẻ tới trung t&acirc;m dinh dưỡng để được kh&aacute;m dinh dưỡng v&agrave; đưa ra hướng điều trị hợp l&yacute; với từng thể trạng của trẻ.<br />
	Ngo&agrave;i ra, mẹ cũng cần lưu &yacute; chế độ dinh dưỡng, nghỉ ngơi hợp l&yacute; của trẻ nhẹ c&acirc;n. Theo c&aacute;c b&aacute;c sĩ, trẻ nhẹ c&acirc;n cần c&oacute; chế độ dinh dưỡng nghi&ecirc;m ngặt hơn so với những trẻ ph&aacute;t triển b&igrave;nh thường kh&aacute;c.</p>
<div>
	<img alt="tap-an-com-cho-be-dung-cach-cac-me-nen-biet-2." src="http://meonuoicon.com/wp-content/uploads/2016/04/tap-an-com-cho-be-dung-cach-cac-me-nen-biet-2-jpg.49385" /><br />
	X&acirc;y dựng chế độ ăn uống khoa học cho trẻ<br />
	​</div>
<p>
	Trong đ&oacute;, đối với trẻ ăn dặm mẹ lưu &yacute;:</p>
<p>
	&ndash; Một ng&agrave;y cần cho trẻ ăn 4 cữ ch&aacute;o đặc, đối với trẻ dưới 10 th&aacute;ng tuổi th&igrave; ăn ch&aacute;o lo&atilde;ng.</p>
<p>
	&ndash; Uống khoảng 300 &ndash; 500ml sữa/ng&agrave;y. Đối với trường hợp trẻ kh&ocirc;ng uống được sữa c&ocirc;ng thức do kh&ocirc;ng ti&ecirc;u h&oacute;a được đường lascote trong sữa, mẹ c&oacute; thể cho trẻ uống sữa kh&ocirc;ng chứa đường lascote.</p>
<p>
	&ndash; Cho trẻ ăn th&ecirc;m cữ v&aacute;ng sữa, sữa chua sau một giờ ăn ch&aacute;o.</p>
<p>
	&ndash; Ăn một số loại tr&aacute;i c&acirc;y theo m&ugrave;a.</p>
<p>
	&ndash; Cần tăng cường lượng chất b&eacute;o trong thực phẩm. Trong đ&oacute;, mỗi bữa cần cho trẻ ăn 1 th&igrave;a dầu ăn (Dầu oliu, dầu vừng, dầu hạt lanh, dầu gấc&hellip;).</p>
<p>
	Đối với trẻ lớn:</p>
<p>
	&ndash; Cho trẻ ăn 3 bữa ch&iacute;nh trong ng&agrave;y, mỗi bữa từ 1 &ndash; 2 ch&eacute;n cơm.</p>
<p>
	&ndash; Bổ sung th&ecirc;m c&aacute;c loại thực phẩm gi&agrave;u đạm như thịt, c&aacute;, trứng. Thường xuy&ecirc;n thay đổi c&aacute;ch chế biến để k&iacute;ch th&iacute;ch vị gi&aacute;c của trẻ.</p>
<p>
	&ndash; Tăng th&ecirc;m chất b&eacute;o v&agrave;o bữa ăn như chế biến c&aacute;c m&oacute;n rau x&agrave;o, thực phẩm chi&ecirc;n.</p>
<p>
	&ndash; Cho trẻ uống sữa c&ocirc;ng thức hoặc sữa tươi từ 300 &ndash; 500ml/ng&agrave;y.</p>
<p>
	&ndash; Sau bữa ăn ch&iacute;nh, cho trẻ ăn th&ecirc;m tr&aacute;i c&acirc;y, sữa chua, v&aacute;ng sữa. Hạn chế ăn c&aacute;c thực phẩm kh&ocirc;ng tốt cho sức khỏe như b&aacute;nh kẹo, bim bim v&igrave; ch&uacute;ng chỉ chứa năng lượng &ldquo;rỗng&rdquo; v&agrave; khiến trẻ mất đi cảm gi&aacute;c th&egrave;m ăn.</p>
<p>
	&ndash; Khuyến kh&iacute;ch trẻ tập thể dục thể thao để tăng cường sức đề kh&aacute;ng, ăn ngon v&agrave; ngủ kỹ hơn.</p>
<div>
	Meonuoicon (Tổng hợp)​</div>
', 1, 4)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (36, N'Tận dụng chuối chín làm bánh chuối hấp lạnh, cả nhà thích mê', N'2017_05_31_22_15_09_407chuoi.jpg', N'Món bánh chuối lạnh ngọt thơm vị cốt dừa, dẻo dai vị bột năng, bùi ngậy của lạc rang và chua ngọt của chuối, ăn 1 miếng là muốn ăn mãi không thôi! ', CAST(N'2017-05-31 00:00:00.000' AS DateTime), 4, N'<p>
	M&oacute;n&nbsp;b&aacute;nh chuối lạnh ngọt thơm vị cốt dừa, dẻo dai vị bột năng, b&ugrave;i ngậy của lạc rang v&agrave; chua ngọt của chuối, ăn 1 miếng l&agrave; muốn ăn m&atilde;i kh&ocirc;ng th&ocirc;i!</p>
<p>
	<img alt="" src="http://lambanh365.com/wp-content/uploads/2015/03/cach-lam-banh-chuoi-hap-1.jpg" style="width: 750px; height: 421px;" /></p>
<div itemprop="articleBody">
	<div>
		<p>
			&nbsp;Nguy&ecirc;n liệu l&agrave;m b&aacute;nh chuối hấp gồm:</p>
		<p>
			+ 6&nbsp;quả chuối ch&iacute;n</p>
		<p>
			+ 150g bột cốt dừa</p>
		<p>
			+ 150g đậu phộng</p>
		<p>
			+ 150g bột năng</p>
		<p>
			+ 100g đường c&aacute;t</p>
		<p>
			+ 2 ch&eacute;n nước lọc</p>
		<p>
			+ &frac12; muỗng c&agrave; ph&ecirc; bột nghệ</p>
		<p>
			<img alt="" src="http://www.bepgiadinh.com/wp-content/uploads/2011/06/22/B%C3%A1nh-chu%E1%BB%91i-h%E1%BA%A5p-n%C6%B0%E1%BB%9Bc-c%E1%BB%91t-d%E1%BB%ABa.jpg" style="width: 634px; height: 476px;" /></p>
	</div>
	<p>
		&nbsp;</p>
	<p>
		C&aacute;ch l&agrave;m m&oacute;n b&aacute;nh chuối hấp như sau:</p>
	<p>
		Bước 1:</p>
	<p>
		H&ograve;a tan 150g bột năng với 2 ch&eacute;n nước lọc, để ri&ecirc;ng một b&ecirc;n.</p>
	<p>
		<img alt="" src="http://beptruong.edu.vn/wp-content/uploads/2015/12/banh-chuoi-nuoc-dua.jpg" style="width: 560px; height: 373px;" /></p>
	<p>
		Bước 2:</p>
	<p>
		Lấy 2 quả chuối ch&iacute;n lột bỏ vỏ, đem th&aacute;i l&aacute;t tr&ograve;n mỏng. 4 quả chuối kh&aacute;c&nbsp;th&igrave; th&aacute;i nhỏ rồi dằm&nbsp;nhuyễn.</p>
	<p>
		Bước 3: Cho chuối l&aacute;t v&agrave; chuối dằm nhuyễn v&agrave;o thố bột năng, trộn đều l&ecirc;n. Tiếp đ&oacute;, bạn cho bột nghệ h&ograve;a tan với 1 muỗng c&agrave; ph&ecirc; nước v&agrave;o hỗn hợp chuối để tạo m&agrave;u v&agrave;ng đẹp.</p>
	<p>
		Bước 4: Cho hỗn hợp chuối v&agrave;o khu&ocirc;n, đem hấp c&aacute;ch thủy trong 30 ph&uacute;t l&agrave; b&aacute;nh ch&iacute;n. Để b&aacute;nh nguội rồi&nbsp;mới gỡ ra khỏi khu&ocirc;n nh&eacute;!</p>
	<p>
		Bước 5: Đậu phộng đem rang ch&iacute;n rồi b&oacute;c vỏ, cho v&agrave;o t&uacute;i ni l&ocirc;ng v&agrave; d&ugrave;ng ch&agrave;y đập cho đậu vỡ vụn nhưng kh&ocirc;ng n&aacute;t.</p>
	<p>
		Bước 6:</p>
	<p>
		H&ograve;a tan 150g bột cốt dừa với 300 ml nước lọc rồi đem nấu s&ocirc;i, cho th&ecirc;m v&agrave;o 1 muỗng canh đường c&aacute;t, khuấy đều cho đến khi đường tan v&agrave; th&agrave;nh hỗn hợp nước cốt dừa sền sệt l&agrave; được.</p>
	<p>
		Khi thưởng thức, bạn cắt b&aacute;nh chuối th&agrave;nh những miếng nhỏ, rồi chan nước cốt dừa v&agrave; rắc đậu phộng rang l&ecirc;n tr&ecirc;n nh&eacute;!</p>
	<p>
		Th&agrave;nh phẩm:</p>
	<p>
		Đ&acirc;y l&agrave; m&oacute;n b&aacute;nh kh&aacute; dễ l&agrave;m với những nguy&ecirc;n liệu thật&nbsp;đơn giản, dễ kiếm. Cuối tuần rảnh rỗi, c&aacute;c n&agrave;ng h&atilde;y trổ t&agrave;i l&agrave;m cho gia đ&igrave;nh&nbsp;m&igrave;nh thưởng thức nh&eacute;!</p>
	<p>
		Ch&uacute;c c&aacute;c bạn th&agrave;nh c&ocirc;ng với c&aacute;ch l&agrave;m b&aacute;nh chuối lạnh n&agrave;y. Đừng qu&ecirc;n cập nhật m&oacute;n ngon mỗi ng&agrave;y tr&ecirc;n Emdep.vn để trổ t&agrave;i cho cả gia đ&igrave;nh thưởng thức nh&eacute;!&nbsp;</p>
	<p>
		Chủ bếp&nbsp;Th&uacute;y Nguyễn</p>
</div>
<p>
	&nbsp;</p>
', 1, 4)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (37, N'Bánh mỳ chocolate thơm mềm cho bữa sáng', N'2017_05_31_22_16_30_880banhmi.jpg', N'Bánh mì nóng hổi, thơm nức mùi cà phê và chocolate, từng miếng tơi mềm ăn rất ngon. ', CAST(N'2017-05-31 00:00:00.000' AS DateTime), 12, N'<div>
	(Emdep.vn) - B&aacute;nh m&igrave; n&oacute;ng hổi, thơm nức m&ugrave;i c&agrave; ph&ecirc; v&agrave; chocolate, từng miếng tơi mềm ăn rất ngon.</div>
<div>
	<div>
		<div>
			<p>
				<img alt="" src="http://www.monngon.tv/uploads/images/2017/04/29/1d35ecb113251a491661c9c78babcd7c-cach-la-banh-mi-chocolate-slide.jpg" style="width: 772px; height: 432px;" /></p>
			<br />
			<div>
				<p>
					&nbsp;Nguy&ecirc;n liệu l&agrave;m b&aacute;nh m&igrave; chocolate&nbsp;gồm:</p>
				<div id="m_947148990219628075yui_3_16_0_ym19_1_1493034631566_5238">
					Phần b&aacute;nh m&igrave;:</div>
				<div id="m_947148990219628075yui_3_16_0_ym19_1_1493034631566_5135">
					- 260gr bột m&igrave;</div>
				<div dir="ltr" id="m_947148990219628075yui_3_16_0_ym19_1_1493034631566_5137">
					- 30gr đường</div>
				<div dir="ltr" id="m_947148990219628075yui_3_16_0_ym19_1_1493034631566_5205">
					- 5gr men nở</div>
				<div dir="ltr" id="m_947148990219628075yui_3_16_0_ym19_1_1493034631566_5217">
					- 1 quả trứng g&agrave;</div>
				<div dir="ltr" id="m_947148990219628075yui_3_16_0_ym19_1_1493034631566_5218">
					- 1 ch&uacute;t muối</div>
				<div dir="ltr" id="m_947148990219628075yui_3_16_0_ym19_1_1493034631566_5337">
					- 15gr bơ</div>
				<div dir="ltr" id="m_947148990219628075yui_3_16_0_ym19_1_1493034631566_5138">
					- 120ml sữa tươi</div>
				<div dir="ltr" id="m_947148990219628075yui_3_16_0_ym19_1_1493034631566_5139">
					- 1 th&igrave;a c&agrave; ph&ecirc; nước cốt chanh</div>
				<div dir="ltr" id="m_947148990219628075yui_3_16_0_ym19_1_1493034631566_5153">
					Hỗn hợp vỏ b&aacute;nh chocolate:</div>
				<div dir="ltr" id="m_947148990219628075yui_3_16_0_ym19_1_1493034631566_5154">
					- 1 th&igrave;a bột cacao</div>
				<div dir="ltr" id="m_947148990219628075yui_3_16_0_ym19_1_1493034631566_5219">
					- 35gr bột m&igrave;</div>
				<div dir="ltr" id="m_947148990219628075yui_3_16_0_ym19_1_1493034631566_5220">
					- 2 th&igrave;a nước c&agrave; ph&ecirc; đậm đặc</div>
				<div dir="ltr" id="m_947148990219628075yui_3_16_0_ym19_1_1493034631566_5221">
					- 30gr bơ (để nhiệt độ thường)</div>
				<div dir="ltr" id="m_947148990219628075yui_3_16_0_ym19_1_1493034631566_5222">
					- 1 x&iacute;u muối</div>
				<div dir="ltr" id="m_947148990219628075yui_3_16_0_ym19_1_1493034631566_5223">
					- 35gr bột đường</div>
				<div dir="ltr" id="m_947148990219628075yui_3_16_0_ym19_1_1493034631566_5224">
					- 25gr trứng g&agrave; đ&aacute;nh tan</div>
			</div>
		</div>
		<div id="m_947148990219628075yui_3_16_0_ym19_1_1493034631566_5136">
			C&aacute;ch l&agrave;m b&aacute;nh m&igrave; chocolate&nbsp;như sau:</div>
		<div dir="ltr" id="m_947148990219628075yui_3_16_0_ym19_1_1493034631566_5240">
			Phần b&aacute;nh m&igrave;:</div>
		<div dir="ltr" id="m_947148990219628075yui_3_16_0_ym19_1_1493034631566_5255">
			Bước 1: Cho 1/2 lượng sữa tươi, nước cốt chanh v&agrave;o 1 c&aacute;i b&aacute;t v&agrave; khuấy đều để cho sữa kết tủa.</div>
		<div dir="ltr" id="m_947148990219628075yui_3_16_0_ym19_1_1493034631566_5299">
			Bước 2: Cho bột m&igrave;, men nở v&agrave;o 1 c&aacute;i t&ocirc; to, trộn đều, sau đ&oacute; cho muối, đường v&agrave;o&nbsp;trộn c&ugrave;ng.&nbsp;</div>
		<div dir="ltr">
			Bước 3: Tiếp tục cho trứng g&agrave;, sữa tươi v&agrave; sữa đ&atilde; kết tủa v&agrave;o t&ocirc; bột. Nhồi bột cho tới khi th&agrave;nh 1 khối th&igrave; cho bơ v&agrave;o nhồi tiếp, tới khi khối bột kh&ocirc;ng d&iacute;nh tay v&agrave; mềm mịn l&agrave; được. Bọc k&iacute;n khối bột v&agrave; để cho bột nở gấp đ&ocirc;i.</div>
		<div dir="ltr" id="m_947148990219628075yui_3_16_0_ym19_1_1493034631566_5364">
			Phần vỏ b&aacute;nh m&agrave;u n&acirc;u chocolate:</div>
		<div dir="ltr" id="m_947148990219628075yui_3_16_0_ym19_1_1493034631566_5377">
			Bước 1: Cho bột m&igrave;, bột cacao v&agrave;o b&aacute;t trộn đều, sau đ&oacute; r&acirc;y cho bột mịn.</div>
		<div dir="ltr" id="m_947148990219628075yui_3_16_0_ym19_1_1493034631566_5425">
			Bước 2: Cho bơ, đường bột v&agrave; x&iacute;u muối&nbsp;v&agrave;o t&ocirc;, đ&aacute;nh đều cho h&ograve;a quyện. Tiếp tục cho trứng g&agrave; đ&aacute;nh tan v&agrave;o, khuấy&nbsp;đều cho trứng h&ograve;a quyện v&agrave;o bơ.</div>
		<div dir="ltr" id="m_947148990219628075yui_3_16_0_ym19_1_1493034631566_5469">
			Bước 3: Cuối c&ugrave;ng bạn cho bột m&igrave;, bột cacao đ&atilde; r&acirc;y mịn v&agrave;o &acirc;u trứng, trộn đều hỗn hợp bằng phới lồng.</div>
		<div dir="ltr">
			Bước 4: Cho tất cả hỗn hợp vừa trộn được v&agrave;o 1 c&aacute;i t&uacute;i ni l&ocirc;ng h&igrave;nh tam gi&aacute;c.</div>
		<div dir="ltr">
			Ho&agrave;n thiện b&aacute;nh:</div>
		<div dir="ltr" id="m_947148990219628075yui_3_16_0_ym19_1_1493034631566_5510">
			Bước 5: Khi khối bột đ&atilde; nở gấp đ&ocirc;i, bạn lấy ra b&agrave;n sạch v&agrave; ấn xẹp bọt kh&iacute; c&oacute; trong bột. Chia đều mỗi miếng khoảng 60gr, sau đ&oacute; l&agrave;m tr&ograve;n từng miếng bột lại, cho b&aacute;nh v&agrave;o khay nướng v&agrave; lấy khăn sạch đậy k&iacute;n để bột nở gấp đ&ocirc;i.</div>
		<div dir="ltr" id="m_947148990219628075yui_3_16_0_ym19_1_1493034631566_5558">
			Bước 6: B&aacute;nh sau khi đ&atilde; nở, bạn&nbsp;bật l&ograve; nướng ở 180 độ C l&agrave;m n&oacute;ng l&ograve; trước 10 ph&uacute;t. Lấy t&uacute;i ni l&ocirc;ng&nbsp;đựng hỗn hợp vỏ b&aacute;nh chocolate, cắt 1 lỗ nhỏ, sau đ&oacute; b&oacute;p l&ecirc;n mặt b&aacute;nh th&agrave;nh c&aacute;c h&igrave;nh v&ograve;ng tr&ograve;n xo&aacute;y, cứ như vậy l&agrave;m cho hết chỗ b&aacute;nh c&ograve;n lại.</div>
		<div dir="ltr" id="m_947148990219628075yui_3_16_0_ym19_1_1493034631566_5699">
			Bước 7: Cho khay b&aacute;nh v&agrave;o l&ograve; nướng khoảng 25 ph&uacute;t l&agrave; b&aacute;nh ch&iacute;n v&agrave; nở phồng. B&aacute;nh sẽ thơm nức m&ugrave;i c&agrave; ph&ecirc; lẫn cacao, để tr&ecirc;n gi&aacute; sắt cho nguội bớt l&agrave; c&oacute; thể thưởng thức được rồi!&nbsp;</div>
		<div dir="ltr">
			Th&agrave;nh phẩm:</div>
		<div dir="ltr">
			<p>
				<img alt="" src="http://anh.eva.vn/upload/4-2013/images/2013-10-17/1381997830-17-10-2013-3-12-53-CH.jpg" style="width: 800px; height: 1102px;" /></p>
		</div>
		<div dir="ltr" id="m_947148990219628075yui_3_16_0_ym19_1_1493034631566_5700">
			B&aacute;nh m&igrave; chocolate&nbsp;c&oacute; vị ngọt thơm của c&agrave; ph&ecirc; v&agrave; cacao, từng miếng tơi&nbsp;mềm đầy hấp dẫn.</div>
	</div>
</div>
<p>
	&nbsp;</p>
', 1, 4)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (38, N'Bạn sẽ có món bánh mì bơ tỏi siêu hảo hạng để thưởng thức bữa sáng', N'2017_05_31_22_17_47_607mitoi.jpg', N'Bánh mỳ bơ tỏi do chính tay "đầu bếp tại gia" chế biến sẽ khiến bữa sáng của cả gia đình trở nên hào hứng và ngon miệng hơn. ', CAST(N'2017-05-31 00:00:00.000' AS DateTime), 3, N'<p>
	B&aacute;nh mỳ bơ tỏi do ch&iacute;nh tay &quot;đầu bếp tại gia&quot; chế biến sẽ khiến bữa s&aacute;ng của cả gia đ&igrave;nh trở n&ecirc;n h&agrave;o hứng v&agrave; ngon miệng hơn.</p>
<div itemprop="articleBody">
	<div>
		<img alt="" src="http://food.fnr.sndimg.com/content/dam/images/food/fullset/2015/5/28/2/TM1A14F_Garlic-Bread_s4x3.jpg.rend.hgtvcom.616.462.jpeg" style="width: 716px; height: 537px;" /><br />
		<div>
			<p>
				&nbsp;Nguy&ecirc;n liệu l&agrave;m b&aacute;nh m&igrave; nướng bơ tỏi gồm:</p>
			<div>
				Phần b&aacute;nh m&igrave;:</div>
			<div>
				- 280gr bột m&igrave;</div>
			<div id="m_4599552677257331058yui_3_16_0_1_1490527761668_8994">
				- 5gr men nở</div>
			<div dir="ltr">
				- 1 th&igrave;a sữa bột</div>
			<div dir="ltr">
				- 150ml sữa tươi</div>
			<div dir="ltr" id="m_4599552677257331058yui_3_16_0_1_1490527761668_9002">
				- 1 ch&uacute;t muối</div>
			<div dir="ltr" id="m_4599552677257331058yui_3_16_0_1_1490527761668_9001">
				- 20gr đường</div>
			<div dir="ltr" id="m_4599552677257331058yui_3_16_0_1_1490527761668_9210">
				- 1 quả trứng g&agrave;</div>
			<div dir="ltr" id="m_4599552677257331058yui_3_16_0_1_1490527761668_9211">
				- 20gr bơ</div>
			<div dir="ltr" id="m_4599552677257331058yui_3_16_0_1_1490527761668_9219">
				Phần bơ tỏi:</div>
			<div dir="ltr" id="m_4599552677257331058yui_3_16_0_1_1490527761668_9430">
				- 2 th&igrave;a bơ thực vật</div>
			<div dir="ltr" id="m_4599552677257331058yui_3_16_0_1_1490527761668_9431">
				- 1-2 củ tỏi</div>
			<div dir="ltr" id="m_4599552677257331058yui_3_16_0_1_1490527761668_10036">
				- 1&nbsp;th&igrave;a c&agrave; ph&ecirc;&nbsp;muối</div>
			<div dir="ltr" id="m_4599552677257331058yui_3_16_0_1_1490527761668_10037">
				- 2 th&igrave;a dầu oliu</div>
			<div dir="ltr" id="m_4599552677257331058yui_3_16_0_1_1490527761668_13435">
				- 1 &iacute;t l&aacute; m&ugrave;i t&acirc;y kh&ocirc;</div>
			<div dir="ltr" id="m_4599552677257331058yui_3_16_0_1_1490527761668_10040">
				- 1 ch&uacute;t ti&ecirc;u</div>
			<div dir="ltr" id="m_4599552677257331058yui_3_16_0_1_1490527761668_10054">
				- 1 ch&uacute;t bột n&ecirc;m</div>
		</div>
	</div>
	<div>
		C&aacute;ch l&agrave;m b&aacute;nh m&igrave; nướng bơ tỏi như sau:</div>
	<div dir="ltr" id="m_4599552677257331058yui_3_16_0_1_1490527761668_10268">
		Phần b&aacute;nh m&igrave;:</div>
	<div dir="ltr" id="m_4599552677257331058yui_3_16_0_1_1490527761668_10269">
		Bước 1: Cho bột m&igrave;, men nở, đường, sữa bột, muối v&agrave;o 1 c&aacute;i t&ocirc;, sau đ&oacute; trộn đều c&aacute;c nguy&ecirc;n liệu.</div>
	<div dir="ltr" id="m_4599552677257331058yui_3_16_0_1_1490527761668_10496">
		Bước 2: Th&ecirc;m 1/2 quả trứng g&agrave; v&agrave; sữa tươi v&agrave;o t&ocirc; bột, nhồi cho tới khi th&agrave;nh 1 khối bột mới cho bơ v&agrave;o nhồi tiếp tới khi khối bột mềm, mịn, dẻo. Bọc k&iacute;n bột, ủ cho khối bột nở gấp đ&ocirc;i.</div>
	<div dir="ltr" id="m_4599552677257331058yui_3_16_0_1_1490527761668_13443">
		Bước 3: Bột đ&atilde; nở gấp đ&ocirc;i th&igrave; lấy ra b&agrave;n sạch, rắc ch&uacute;t bột m&igrave; l&ecirc;n b&agrave;n v&agrave; chia bột th&agrave;nh 6-8 miếng đều nhau, l&agrave;m tr&ograve;n c&aacute;c miếng bột, đậy k&iacute;n lại v&agrave; để bột nghỉ 10 ph&uacute;t.</div>
	<div dir="ltr">
		Bước 4: Sau 10 ph&uacute;t, lấy c&acirc;y c&aacute;n bột c&aacute;n cho tho&aacute;t hết bọt kh&iacute;, sau đ&oacute; gập từ từ m&eacute;p bột lại, từ tr&ecirc;n xuống dưới (như trong h&igrave;nh), d&ugrave;ng 2 tay v&ecirc; 2 b&ecirc;n đầu miếng bột sao cho hơi nhọn 1 ch&uacute;t, giống chiếc b&aacute;nh m&igrave; l&agrave; được.</div>
	<div dir="ltr" id="m_4599552677257331058yui_3_16_0_1_1490527761668_13450">
		Bước 5: Đặt b&aacute;nh v&agrave;o khay nướng v&agrave; đậy k&iacute;n lại, để bột nghỉ tới khi nở gấp đ&ocirc;i hoặc gấp 3.</div>
	<div dir="ltr" id="m_4599552677257331058yui_3_16_0_1_1490527761668_12172">
		Bước 6: Lấy dao rạch 2-3 đường tr&ecirc;n b&aacute;nh hoặc c&oacute; thể kh&ocirc;ng cần rạch cũng được.</div>
	<div dir="ltr" id="m_4599552677257331058yui_3_16_0_1_1490527761668_12823">
		Bước 7: Cho b&aacute;nh v&agrave;o l&ograve; nướng đ&atilde; được l&agrave;m n&oacute;ng sẵn trước 10 ph&uacute;t ở nhiệt độ 200 độ C,&nbsp;nướng 10 ph&uacute;t th&igrave; hạ nhiệt xuống 180 độ C v&agrave; nướng khoảng 10-15 ph&uacute;t nữa l&agrave; b&aacute;nh ch&iacute;n v&agrave;ng, lấy b&aacute;nh ra để cho nguội bớt.</div>
	<div dir="ltr" id="m_4599552677257331058yui_3_16_0_1_1490527761668_12837">
		Phần bơ tỏi:</div>
	<div dir="ltr" id="m_4599552677257331058yui_3_16_0_1_1490527761668_12838">
		Bước 1: Tỏi băm thật nhỏ rồi cho v&agrave;o b&aacute;t, th&ecirc;m bơ, muối, l&aacute; m&ugrave;i t&acirc;y, hạt ti&ecirc;u, bột n&ecirc;m, dầu oliu v&agrave; trộn đều l&ecirc;n l&agrave; xong hỗn hợp bơ tỏi.</div>
	<div dir="ltr" id="m_4599552677257331058yui_3_16_0_1_1490527761668_13653">
		Bước 2: D&ugrave;ng dao cắt b&aacute;nh m&igrave; l&agrave;m đ&ocirc;i, sau đ&oacute; bạn tr&eacute;t 1 lớp mỏng hỗn hợp bơ tỏi l&ecirc;n phần ruột của b&aacute;nh m&igrave;.</div>
	<div dir="ltr" id="m_4599552677257331058yui_3_16_0_1_1490527761668_13858">
		Bước 3:&nbsp;Xếp b&aacute;nh v&agrave;o khay nướng v&agrave; nướng ở nhiệt độ 180 độ C, nướng 5-8 ph&uacute;t l&agrave; b&aacute;nh thơm lừng m&ugrave;i bơ tỏi v&agrave; gi&ograve;n tan.</div>
	<div dir="ltr" id="m_4599552677257331058yui_3_16_0_1_1490527761668_14291">
		Vậy l&agrave; bạn đ&atilde; c&oacute; những chiếc b&aacute;nh m&igrave; nướng bơ tỏi thơm phức, gi&ograve;n tan&nbsp;cho cả gia đ&igrave;nh thưởng thức rồi đấy!</div>
	<div dir="ltr">
		Th&agrave;nh phẩm:</div>
	<div dir="ltr">
		Bạn c&oacute; thể l&agrave;m b&aacute;nh mỳ từ h&ocirc;m trước, s&aacute;ng dậy chỉ việc phết bơ tỏi l&ecirc;n v&agrave; nướng v&agrave;ng&nbsp;l&agrave; xong, rất tiện lợi, vừa ngon, vừa nhanh gọn.</div>
	<div dir="ltr">
		<p>
			Bữa s&aacute;ng với b&aacute;nh mỳ bơ tỏi v&agrave; 1 ly sữa l&agrave; sẵn s&agrave;ng bước v&agrave;o ng&agrave;y mới tr&agrave;n đầy hứng khởi rồi!&nbsp;</p>
	</div>
	<div dir="ltr">
		Ch&uacute;c c&aacute;c bạn th&agrave;nh c&ocirc;ng với c&aacute;ch l&agrave;m b&aacute;nh mỳ bơ tỏi n&agrave;y. Đừng qu&ecirc;n theo d&otilde;i m&oacute;n ngon mỗi ng&agrave;y tr&ecirc;n emdep để c&oacute; được cho m&igrave;nh những c&ocirc;ng thức l&agrave;m b&aacute;nh hấp dẫn nh&eacute;!&nbsp;
		<div dir="ltr">
			Chủ bếp Hương Giang</div>
	</div>
</div>
<p>
	&nbsp;</p>
', 1, 4)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (39, N'Cách ủ cơm rượu nếp cho Tết Đoan Ngọ', N'2017_05_31_22_19_58_556riu.jpg', N'Cơm rượu nếp là món ăn đặc trưng được người dân Việt Nam sử dụng vào ngày Tết Đoan Ngọ (hay còn gọi là Tết diệt sâu bọ). ', CAST(N'2017-05-31 00:00:00.000' AS DateTime), 2, N'<p>
	Theo d&acirc;n gian, sớm&nbsp;thức dậy trong ng&agrave;y Tết Đoan Ngọ, bạn n&ecirc;n ăn 1 &iacute;t cơm rượu nếp để c&oacute; thể diệt trừ được s&acirc;u bọ, giun s&aacute;n trong người.&nbsp;</p>
<p>
	Đến nay, tập tục ăn cơm rượu nếp vẫn c&ograve;n được nhiều gia đ&igrave;nh duy tr&igrave;. Ngo&agrave;i ra, người ta c&ograve;n lựa chọn c&aacute;c loại quả như mận, dưa hấu, vải...để ăn k&egrave;m.&nbsp;Người xưa quan niệm, những m&oacute;n ăn c&oacute; t&iacute;nh n&oacute;ng-cay-chua-đắng c&oacute; thể diệt trừ được k&iacute; sinh trong cơ thể, gi&uacute;p họ c&oacute; sức khỏe tốt hơn.&nbsp;</p>
<p>
	<img alt="" src="http://giadinh.vcmedia.vn/k:2016/com-ruou-1465287841193/tet-doan-ngo-bat-ngo-voi-cong-dung-cua-com-ruou-nhieu-nguoi-chua-biet.jpg" style="width: 500px; height: 333px;" /></p>
<p>
	C&ugrave;ng t&igrave;m hiểu c&aacute;ch l&agrave;m cơm rượu nếp của người d&acirc;n Việt Nam trong ng&agrave;y Tết n&agrave;y nh&eacute;!&nbsp;</p>
<div>
	<p>
		Nguy&ecirc;n liệu l&agrave;m cơm rượu nếp&nbsp;gồm:</p>
	<p>
		+ 1 kg gạo nếp lật (nếp lứt) (l&agrave; loại gạo nếp chưa được x&aacute;t bỏ lớp c&aacute;m) + 2 quả men rượu (C&oacute; thể mua tại c&aacute;c cửa h&agrave;ng tạp h&oacute;a trong chợ)</p>
</div>
<p>
	C&aacute;ch l&agrave;m cơm rượu nếp như sau:</p>
<p>
	Bước 1: Ng&acirc;m gạo nếp với nước ấm khoảng 8 tiếng cho mềm ra, nhặt sạch vỏ, hạt đen, vo gạo sơ qua nước cho sạch.</p>
<p>
	Bước 2: Cho gạo v&agrave;o nồi cơm nấu như nấu cơm nếp, cho đến khi hạt gạo ch&iacute;n mềm.</p>
<p>
	Bước 3: Cơm nếp ch&iacute;n th&igrave; bạn cho ra đĩa lớn hoặc m&acirc;m, xới v&agrave; d&agrave;n đều cơm.</p>
<p>
	Bước 4: Men rượu đem gi&atilde; thật mịn.</p>
<p>
	Bước 5: Khi gạo nếp sờ thấy hơi &acirc;m ấm, lấy men r&acirc;y v&agrave;o, trộn cho men d&iacute;nh đều v&agrave;o cơm.</p>
<p>
	Bước 6: Cho v&agrave;o lọ thuỷ tinh hoặc &acirc;u nhựa, lấy khăn phủ k&iacute;n khoảng 2-3 ng&agrave;y l&agrave; ăn được.</p>
<p>
	Th&agrave;nh phẩm:</p>
<p>
	Ch&uacute;c c&aacute;c bạn th&agrave;nh c&ocirc;ng với c&aacute;ch l&agrave;m cơm rượu nếp d&acirc;n gian n&agrave;y. Đừng qu&ecirc;n cập nhật m&oacute;n ngon mỗi ng&agrave;y tr&ecirc;n Emdep.vn để c&oacute; được cho m&igrave;nh những c&ocirc;ng thức m&oacute;n ăn hấp dẫn nh&eacute;!</p>
<p>
	&nbsp;</p>
', 1, 4)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (40, N'Canh mùng tơi nấu tép cho bữa cơm ngày nắng nóng', N'2017_05_31_22_21_13_476toit.jpg', N'Một bát canh mùng tơi nấu tép, ăn kèm vài miếng dưa cà và thịt rim mặn là đủ cho 1 bữa cơm ngon lành, của ngày hè phải không? ', CAST(N'2017-05-31 00:00:00.000' AS DateTime), 2, N'<div>
	<p>
		<img alt="" src="http://meovaobep.com/wp-content/uploads/2015/05/8.m%E1%BB%93ng_t%C6%A1i_n%E1%BA%A5u_t%C3%B4m_t%C6%B0%C6%A1i.jpg" style="width: 541px; height: 342px;" /></p>
	<div>
		<p>
			&nbsp;Nguy&ecirc;n liệu l&agrave;m canh m&ugrave;ng tơi&nbsp;nấu t&eacute;p gồm:</p>
		<div dir="ltr" id="m_-2454848496255117522yui_3_16_0_ym19_1_1495711089548_2519">
			- 1 mớ rau m&ugrave;ng tơi&nbsp;</div>
		<div dir="ltr" id="m_-2454848496255117522yui_3_16_0_ym19_1_1495711089548_2520">
			- 1/2 b&aacute;t con t&eacute;p kh&ocirc; hoặc t&eacute;p tươi</div>
		<div dir="ltr" id="m_-2454848496255117522yui_3_16_0_ym19_1_1495711089548_2522">
			- Gia vị: muối, bột n&ecirc;m, 1 x&iacute;u nước mắm, 1 x&iacute;u bột ngọt.</div>
	</div>
</div>
<div id="m_-2454848496255117522yiv0663341846yui_3_16_0_ym19_1_1495710724514_4423">
	&nbsp;C&aacute;ch l&agrave;m canh m&ugrave;ng tơi nấu t&eacute;p như sau:</div>
<div dir="ltr" id="m_-2454848496255117522yui_3_16_0_ym19_1_1495711089548_2524">
	Bước 1: Rau m&ugrave;ng tơi nhặt lấy l&aacute; v&agrave; ngọn non rồi đem rửa sạch, th&aacute;i đoạn nhỏ.</div>
<div dir="ltr" id="m_-2454848496255117522yui_3_16_0_ym19_1_1495711089548_3048">
	Bước 2: Lấy 1/2 số lượng t&eacute;p đem gi&atilde; nhỏ để nấu cho canh ngọt nước, 1/2 chỗ t&eacute;p c&ograve;n lại để nguy&ecirc;n con t&eacute;p, như vậy khi nấu xong nh&igrave;n m&oacute;n canh sẽ hấp dẫn hơn.</div>
<div dir="ltr">
	Bước 3: Cho nước v&agrave;o nồi đun s&ocirc;i, sau đ&oacute; cho hết chỗ t&eacute;p v&agrave;o nấu cho s&ocirc;i l&ecirc;n v&agrave;i ph&uacute;t.</div>
<div dir="ltr" id="m_-2454848496255117522yui_3_16_0_ym19_1_1495711089548_3170">
	Bước 4: Cuối c&ugrave;ng bạn cho rau m&ugrave;ng tơi v&agrave;o nấu đến khi&nbsp;s&ocirc;i l&ecirc;n, n&ecirc;m nếm gia vị vừa ăn l&agrave; tắt bếp.</div>
<div dir="ltr" id="m_-2454848496255117522yui_3_16_0_ym19_1_1495711089548_3171">
	Lưu &yacute;: Khi đ&atilde; cho rau m&ugrave;ng tơi v&agrave;o, bạn kh&ocirc;ng n&ecirc;n đậy nắp vung để rau lu&ocirc;n giữ được m&agrave;u xanh đẹp mắt nh&eacute;!</div>
<div dir="ltr" id="m_-2454848496255117522yui_3_16_0_ym19_1_1495711089548_3228">
	Bước 5: M&uacute;c canh rau m&ugrave;ng tơi nấu t&eacute;p ra t&ocirc; để thưởng thức.</div>
<div dir="ltr" id="m_-2454848496255117522yui_3_16_0_ym19_1_1495711089548_3175">
	Chẳng cần cầu kỳ với những nguy&ecirc;n liệu v&ocirc; c&ugrave;ng dễ kiếm, bạn đ&atilde; c&oacute; ngay 1 t&ocirc; canh&nbsp;m&ugrave;ng tơi vừa thơm ngon lại thanh m&aacute;t cho cả nh&agrave;.</div>
<div dir="ltr">
	Một b&aacute;t canh m&ugrave;ng tơi nấu t&eacute;p, ăn k&egrave;m v&agrave;i miếng dưa c&agrave; v&agrave; thịt rim mặn l&agrave; đủ cho 1 bữa cơm ngon l&agrave;nh, của&nbsp;ng&agrave;y h&egrave; phải kh&ocirc;ng?&nbsp;</div>
<div dir="ltr">
	Ch&uacute;c c&aacute;c bạn th&agrave;nh c&ocirc;ng với m&oacute;n canh n&agrave;y v&agrave; đừng qu&ecirc;n cập nhật m&oacute;n ngon mỗi ng&agrave;y tr&ecirc;n B&aacute;o điện tử Emdep.vn nh&eacute;!</div>
', 1, 4)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (41, N'Mâm cơm ngày hè hấp dẫn, món nào cũng ngon và dễ làm', N'2017_05_31_22_22_34_970comm.jpg', N'Chỉ với 92 ngàn đồng, bạn đã có 1 mâm cơm ngon hết ý khởi đầu tuần làm việc mới. ', CAST(N'2017-05-31 00:00:00.000' AS DateTime), 2, N'<h2>
	M&oacute;n thứ 1 : C&aacute;ch l&agrave;m thịt nướng l&agrave; chanh thơm ngon hấp dẫn thơm lừng ngon tuyệt</h2>
<p>
	<img alt="món ăn ngon" src="http://niemdamme.com.vn/Uploads/images/thit-nuong-la-chanh-1%20%281%29.jpg" /></p>
<div>
	Nguy&ecirc;n liệu l&agrave;m thịt nướng l&aacute; chanh thơm ngon hấp dẫn :</div>
<ul>
	<li>
		- 500g thịt lợn ba chỉ</li>
	<li>
		- 1 nắm l&aacute; chanh</li>
	<li>
		- Gia vị: 1 th&igrave;a nhỏ hạt n&ecirc;m, 2 th&igrave;a nhỏ nước mắm, 1 th&igrave;a nhỏ mật ong, 1/2 th&igrave;a nhỏ hạt ti&ecirc;u</li>
	<li>
		- Dầu ăn</li>
	<li>
		- Vỉ nướng</li>
	<li>
		- B&uacute;n</li>
	<li>
		- Rau sống</li>
	<li>
		- Than củi</li>
</ul>
<div>
	C&aacute;ch l&agrave;m <a href="http://niemdamme.com.vn/cach-lam-thit-nuong-la-chanh-thom-ngon-hap-dan-thom-lung-ngon-tuyet/14582-313.aspx" title="thịt nướng lá chanh ngon đơn giản hấp dẫn ">thịt nướng l&aacute; chanh ngon đơn giản hấp dẫn&nbsp;</a></div>
<h2>
	M&oacute;n thứ 2 : C&aacute;ch l&agrave;m dạ d&agrave;y om ngũ vị ngon đơn giản hấp dẫn tuyệt vời</h2>
<p>
	<img alt="món ăn ngon" src="http://niemdamme.com.vn/Uploads/images/cach-lam-bao-tu-ngu-vi-gion-thom-cuc-ngon-bao-tu-ngu-vi-8-1478742003-width500height375%281%29.jpg" /></p>
<div>
	CHUẨN BỊ NGUY&Ecirc;N LIỆU dạ d&agrave;y om ngũ vị ngon hấp dẫn :</div>
<ul>
	<li>
		- 1 c&aacute;i dạ d&agrave;y heo</li>
	<li>
		- 1 nh&aacute;nh sả đập dập 1</li>
	<li>
		- 1 muỗng c&agrave; ph&ecirc; muối</li>
	<li>
		- 1 muỗng canh nước cốt chanh</li>
	<li>
		- 400ml mước dừa tươi</li>
	<li>
		- 1 muỗng c&agrave; ph&ecirc; ngũ vị hương</li>
	<li>
		- 1 muỗng canh x&igrave; dầu; 2 muỗng c&agrave; ph&ecirc; nước mắm; &nbsp;1 muỗng canh đường; 1 muỗng canh dầu h&agrave;o; 1 muỗng c&agrave; ph&ecirc; ti&ecirc;u.</li>
	<li>
		- 2 t&eacute;p tỏi th&aacute;i l&aacute;t; 1 củ h&agrave;nh t&iacute;m băm nhỏ; 2 phần gốc h&agrave;nh l&aacute; băm nhỏ; 1 miếng gừng th&aacute;i l&aacute;t; 1 nh&aacute;nh h&agrave;nh l&aacute; th&aacute;i kh&uacute;c</li>
	<li>
		- 3 l&aacute; nguyệt quế kh&ocirc;</li>
</ul>
<div>
	&nbsp;C&Aacute;CH L&Agrave;M <a href="http://niemdamme.com.vn/cach-lam-da-day-om-ngu-vi-ngon-don-gian-hap-dan-tuyet-voi/14553-313.aspx" title="BAO TỬ NGŨ VỊ món ăn ngon hấp dẫn ">BAO TỬ NGŨ VỊ m&oacute;n ăn ngon hấp dẫn&nbsp;</a></div>
<h2>
	M&oacute;n thứ 3 : Hướng dẫn l&agrave;m c&aacute; luộc ngon ngọt hấp dẫn kh&ocirc;ng hề tanh</h2>
<p>
	<img alt="món ăn ngon" src="http://niemdamme.com.vn/Uploads/images/ca-luoc-ngon-dai-khach%281%29.jpg" /></p>
<div>
	Nguy&ecirc;n liệu l&agrave;m c&aacute; luộc ngon đơn giản hấp dẫn :</div>
<ul>
	<li>
		- c&aacute; tươi: 1 con</li>
	<li>
		- dứa: 1 quả</li>
	<li>
		- chuối xanh: 2 quả</li>
	<li>
		- khế chua: 1 quả</li>
	<li>
		- b&igrave;a: 0.5 b&aacute;t</li>
	<li>
		- h&agrave;nh l&aacute;: 1 th&igrave;a</li>
	<li>
		- sả: 2 nh&aacute;nh</li>
	<li>
		- gừng: 0.5 củ</li>
	<li>
		- th&igrave; l&agrave;: 1 th&igrave;a</li>
	<li>
		- ớt: 1 quả</li>
	<li>
		- rau sống: 300 gram</li>
	<li>
		- nước mắm: 1 th&igrave;a</li>
	<li>
		- chanh: 1 quả</li>
</ul>
<div>
	Hướng dẫn l&agrave;m <a href="http://niemdamme.com.vn/huong-dan-lam-ca-luoc-ngon-ngot-hap-dan-khong-he-tanh/14518-313.aspx" title="cá luộc ngon đơn giản ">c&aacute; luộc ngon đơn giản&nbsp;</a></div>
<h2>
	M&oacute;n thứ 4 : Hướng dẫn l&agrave;m Đậu r&aacute;n mỡ h&agrave;nh ngon miệng ng&agrave;y r&eacute;t</h2>
<p>
	<img alt="món ăn ngon" src="http://niemdamme.com.vn/Uploads/images/17103412_1790018591313342_6475648643014496875_n%281%29.jpg" /></p>
<div>
	Nguy&ecirc;n liệu đậu r&aacute;n mỡ h&agrave;nh ngon đơn giản :</div>
<ul>
	<li>
		- 4 b&igrave;a đậu phụ non.</li>
	<li>
		- H&agrave;nh l&aacute;.</li>
	<li>
		- Dầu ăn, 1 th&igrave;a canh nước mắm, 1 th&igrave;a c&agrave; ph&ecirc; đường.</li>
</ul>
<div>
	C&aacute;ch l&agrave;m <a href="http://niemdamme.com.vn/huong-dan-lam-dau-ran-mo-hanh-ngon-mieng-ngay-ret/14519-313.aspx" title="đậu rán mỡ hành ngon hấp dẫn ">đậu r&aacute;n mỡ h&agrave;nh ngon hấp dẫn&nbsp;</a></div>
<h2>
	M&oacute;n thứ 5 : C&aacute;ch l&agrave;m canh chua thịt băm ngon đơn giản hấp dẫn tuyệt vời</h2>
<p>
	<img alt="món ăn ngon" src="http://niemdamme.com.vn/Uploads/images/t%e1%ba%a3i%20xu%e1%bb%91ng%28123%29%281%29.jpg" /></p>
<div>
	Nguy&ecirc;n liệu l&agrave;m canh chua thịt băm ngon hấp dẫn :</div>
<ul>
	<li>
		Thịt lợn thăn: 300gr</li>
	<li>
		- C&agrave; chua: 3 quả</li>
	<li>
		- H&agrave;nh l&aacute;</li>
	<li>
		- H&agrave;nh củ: 1 củ</li>
	<li>
		- Rau m&ugrave;i: 1 mớ</li>
	<li>
		- Hạt n&ecirc;m</li>
	<li>
		- Dầu ăn</li>
	<li>
		- Nước mắm</li>
</ul>
<div>
	C&aacute;ch l&agrave;m <a href="http://niemdamme.com.vn/cach-lam-canh-chua-thit-bam-ngon-don-gian-hap-dan-tuyet-voi/14511-313.aspx" title="canh chua thịt băm ngon đơn giản hấp dẫn ">canh chua thịt băm ngon đơn giản hấp dẫn&nbsp;</a></div>
<h2>
	M&oacute;n thứ 6 : C&aacute;ch l&agrave;m gỏi mướp đắng tai heo ngon gi&ograve;n hấp dẫn</h2>
<p>
	<img alt="món ăn ngon" src="http://niemdamme.com.vn/Uploads/images/goi-muop-dang-tai-heo6%283%29.jpg" /></p>
<div>
	Nguy&ecirc;n liệu l&agrave;m gỏi mướp đắng tai heo ngon gi&ograve;n :</div>
<ul>
	<li>
		- 2-3 tr&aacute;i mướp đắng</li>
	<li>
		- 1/2 c&aacute;i tai heo</li>
	<li>
		- 1 củ c&agrave; rốt, 1 tr&aacute;i ớt sừng, 2 tr&aacute;i ớt hiểm.</li>
	<li>
		- 2-3 củ h&agrave;nh t&iacute;m</li>
	<li>
		- 1 th&igrave;a vừng trắng, chanh, nước mắm, dấm, đường, muối.</li>
</ul>
', 1, 8)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (42, N'Mâm cơm nhiều món ngon khởi động tuần làm việc mới', N'2017_05_31_22_23_48_827monngon.jpg', N'Mâm cơm nhiều món ngon khởi động tuần làm việc mới của bạn', CAST(N'2017-05-31 00:00:00.000' AS DateTime), 0, N'<h2>
	M&oacute;n thứ 1 : C&aacute;ch l&agrave;m thịt nướng l&agrave; chanh thơm ngon hấp dẫn thơm lừng ngon tuyệt</h2>
<p>
	<img alt="món ăn ngon" src="http://niemdamme.com.vn/Uploads/images/thit-nuong-la-chanh-1%20%281%29.jpg" /></p>
<div>
	Nguy&ecirc;n liệu l&agrave;m thịt nướng l&aacute; chanh thơm ngon hấp dẫn :</div>
<ul>
	<li>
		- 500g thịt lợn ba chỉ</li>
	<li>
		- 1 nắm l&aacute; chanh</li>
	<li>
		- Gia vị: 1 th&igrave;a nhỏ hạt n&ecirc;m, 2 th&igrave;a nhỏ nước mắm, 1 th&igrave;a nhỏ mật ong, 1/2 th&igrave;a nhỏ hạt ti&ecirc;u</li>
	<li>
		- Dầu ăn</li>
	<li>
		- Vỉ nướng</li>
	<li>
		- B&uacute;n</li>
	<li>
		- Rau sống</li>
	<li>
		- Than củi</li>
</ul>
<div>
	C&aacute;ch l&agrave;m <a href="http://niemdamme.com.vn/cach-lam-thit-nuong-la-chanh-thom-ngon-hap-dan-thom-lung-ngon-tuyet/14582-313.aspx" title="thịt nướng lá chanh ngon đơn giản hấp dẫn ">thịt nướng l&aacute; chanh ngon đơn giản hấp dẫn&nbsp;</a></div>
<h2>
	M&oacute;n thứ 2 : C&aacute;ch l&agrave;m dạ d&agrave;y om ngũ vị ngon đơn giản hấp dẫn tuyệt vời</h2>
<p>
	<img alt="món ăn ngon" src="http://niemdamme.com.vn/Uploads/images/cach-lam-bao-tu-ngu-vi-gion-thom-cuc-ngon-bao-tu-ngu-vi-8-1478742003-width500height375%281%29.jpg" /></p>
<div>
	CHUẨN BỊ NGUY&Ecirc;N LIỆU dạ d&agrave;y om ngũ vị ngon hấp dẫn :</div>
<ul>
	<li>
		- 1 c&aacute;i dạ d&agrave;y heo</li>
	<li>
		- 1 nh&aacute;nh sả đập dập 1</li>
	<li>
		- 1 muỗng c&agrave; ph&ecirc; muối</li>
	<li>
		- 1 muỗng canh nước cốt chanh</li>
	<li>
		- 400ml mước dừa tươi</li>
	<li>
		- 1 muỗng c&agrave; ph&ecirc; ngũ vị hương</li>
	<li>
		- 1 muỗng canh x&igrave; dầu; 2 muỗng c&agrave; ph&ecirc; nước mắm; &nbsp;1 muỗng canh đường; 1 muỗng canh dầu h&agrave;o; 1 muỗng c&agrave; ph&ecirc; ti&ecirc;u.</li>
	<li>
		- 2 t&eacute;p tỏi th&aacute;i l&aacute;t; 1 củ h&agrave;nh t&iacute;m băm nhỏ; 2 phần gốc h&agrave;nh l&aacute; băm nhỏ; 1 miếng gừng th&aacute;i l&aacute;t; 1 nh&aacute;nh h&agrave;nh l&aacute; th&aacute;i kh&uacute;c</li>
	<li>
		- 3 l&aacute; nguyệt quế kh&ocirc;</li>
</ul>
<div>
	&nbsp;C&Aacute;CH L&Agrave;M <a href="http://niemdamme.com.vn/cach-lam-da-day-om-ngu-vi-ngon-don-gian-hap-dan-tuyet-voi/14553-313.aspx" title="BAO TỬ NGŨ VỊ món ăn ngon hấp dẫn ">BAO TỬ NGŨ VỊ m&oacute;n ăn ngon hấp dẫn&nbsp;</a></div>
<h2>
	M&oacute;n thứ 3 : Hướng dẫn l&agrave;m c&aacute; luộc ngon ngọt hấp dẫn kh&ocirc;ng hề tanh</h2>
<p>
	<img alt="món ăn ngon" src="http://niemdamme.com.vn/Uploads/images/ca-luoc-ngon-dai-khach%281%29.jpg" /></p>
<div>
	Nguy&ecirc;n liệu l&agrave;m c&aacute; luộc ngon đơn giản hấp dẫn :</div>
<ul>
	<li>
		- c&aacute; tươi: 1 con</li>
	<li>
		- dứa: 1 quả</li>
	<li>
		- chuối xanh: 2 quả</li>
	<li>
		- khế chua: 1 quả</li>
	<li>
		- b&igrave;a: 0.5 b&aacute;t</li>
	<li>
		- h&agrave;nh l&aacute;: 1 th&igrave;a</li>
	<li>
		- sả: 2 nh&aacute;nh</li>
	<li>
		- gừng: 0.5 củ</li>
	<li>
		- th&igrave; l&agrave;: 1 th&igrave;a</li>
	<li>
		- ớt: 1 quả</li>
	<li>
		- rau sống: 300 gram</li>
	<li>
		- nước mắm: 1 th&igrave;a</li>
	<li>
		- chanh: 1 quả</li>
</ul>
<div>
	Hướng dẫn l&agrave;m <a href="http://niemdamme.com.vn/huong-dan-lam-ca-luoc-ngon-ngot-hap-dan-khong-he-tanh/14518-313.aspx" title="cá luộc ngon đơn giản ">c&aacute; luộc ngon đơn giản&nbsp;</a></div>
<h2>
	M&oacute;n thứ 4 : Hướng dẫn l&agrave;m Đậu r&aacute;n mỡ h&agrave;nh ngon miệng ng&agrave;y r&eacute;t</h2>
<p>
	<img alt="món ăn ngon" src="http://niemdamme.com.vn/Uploads/images/17103412_1790018591313342_6475648643014496875_n%281%29.jpg" /></p>
<div>
	Nguy&ecirc;n liệu đậu r&aacute;n mỡ h&agrave;nh ngon đơn giản :</div>
<ul>
	<li>
		- 4 b&igrave;a đậu phụ non.</li>
	<li>
		- H&agrave;nh l&aacute;.</li>
	<li>
		- Dầu ăn, 1 th&igrave;a canh nước mắm, 1 th&igrave;a c&agrave; ph&ecirc; đường.</li>
</ul>
<div>
	C&aacute;ch l&agrave;m <a href="http://niemdamme.com.vn/huong-dan-lam-dau-ran-mo-hanh-ngon-mieng-ngay-ret/14519-313.aspx" title="đậu rán mỡ hành ngon hấp dẫn ">đậu r&aacute;n mỡ h&agrave;nh ngon hấp dẫn&nbsp;</a></div>
<h2>
	M&oacute;n thứ 5 : C&aacute;ch l&agrave;m canh chua thịt băm ngon đơn giản hấp dẫn tuyệt vời</h2>
<p>
	<img alt="món ăn ngon" src="http://niemdamme.com.vn/Uploads/images/t%e1%ba%a3i%20xu%e1%bb%91ng%28123%29%281%29.jpg" /></p>
<div>
	Nguy&ecirc;n liệu l&agrave;m canh chua thịt băm ngon hấp dẫn :</div>
<ul>
	<li>
		Thịt lợn thăn: 300gr</li>
	<li>
		- C&agrave; chua: 3 quả</li>
	<li>
		- H&agrave;nh l&aacute;</li>
	<li>
		- H&agrave;nh củ: 1 củ</li>
	<li>
		- Rau m&ugrave;i: 1 mớ</li>
	<li>
		- Hạt n&ecirc;m</li>
	<li>
		- Dầu ăn</li>
	<li>
		- Nước mắm</li>
</ul>
<div>
	C&aacute;ch l&agrave;m <a href="http://niemdamme.com.vn/cach-lam-canh-chua-thit-bam-ngon-don-gian-hap-dan-tuyet-voi/14511-313.aspx" title="canh chua thịt băm ngon đơn giản hấp dẫn ">canh chua thịt băm ngon đơn giản hấp dẫn&nbsp;</a></div>
<h2>
	M&oacute;n thứ 6 : C&aacute;ch l&agrave;m gỏi mướp đắng tai heo ngon gi&ograve;n hấp dẫn</h2>
<p>
	<img alt="món ăn ngon" src="http://niemdamme.com.vn/Uploads/images/goi-muop-dang-tai-heo6%283%29.jpg" /></p>
<div>
	Nguy&ecirc;n liệu l&agrave;m gỏi mướp đắng tai heo ngon gi&ograve;n :</div>
<ul>
	<li>
		- 2-3 tr&aacute;i mướp đắng</li>
	<li>
		- 1/2 c&aacute;i tai heo</li>
	<li>
		- 1 củ c&agrave; rốt, 1 tr&aacute;i ớt sừng, 2 tr&aacute;i ớt hiểm.</li>
	<li>
		- 2-3 củ h&agrave;nh t&iacute;m</li>
	<li>
		- 1 th&igrave;a vừng trắng, chanh, nước mắm, dấm, đường, muối.</li>
</ul>
', 1, 8)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (43, N'Ngày nghỉ, trổ tài làm pizza hải sản đãi cả nhà', N'2017_05_31_22_26_20_802pira.jpg', N'Bạn hoàn toàn có thể tự làm món pizza hải sản tại nhà với công thức cực kì đơn giản của chúng tôi. ', CAST(N'2017-05-31 00:00:00.000' AS DateTime), 2, N'<h3>
	Nguy&ecirc;n liệu l&agrave;m b&aacute;nh pizza hải sản</h3>
<p>
	Phần nh&acirc;n hải sản</p>
<ol>
	<li>
		L&aacute; Oregano kh&ocirc;</li>
	<li>
		100g pho m&aacute;t mozzarella.</li>
	<li>
		100g t&ocirc;m s&uacute;</li>
	<li>
		50 g mực tươi</li>
	<li>
		50g cồi điệp</li>
	<li>
		Ớt chu&ocirc;ng xanh v&agrave; v&agrave;ng</li>
	<li>
		Xốt c&agrave; chua</li>
	<li>
		1 muỗng hạt n&ecirc;m</li>
</ol>
<p>
	Phần đế b&aacute;nh khoảng 22 &ndash; 23cm</p>
<ol>
	<li>
		150g bột m&igrave;</li>
	<li>
		Nước ấm để h&ograve;a bột m&igrave;</li>
	<li>
		1 muỗng men b&aacute;nh m&igrave;</li>
	<li>
		&frac12; muỗng sup dầu olive</li>
	<li>
		&frac12; muỗng đường nhỏ</li>
	<li>
		Một ch&uacute;t muối</li>
</ol>
<p>
	<img alt="Cách làm, nguyên liệu và hướng dẫn làm pizza hải sản ngon" src="https://monan9.com/wp-content/uploads/2015/01/banh-pizza-2.jpg" /></p>
<div>
	&nbsp;</div>
<h3>
	Hướng dẫn c&aacute;ch l&agrave;m Pizza hải sản ngon</h3>
<p>
	Bước 1: L&agrave;m đế b&aacute;nh<br />
	&ndash; Rắc 1 muỗng men b&aacute;nh m&igrave; v&agrave;o b&aacute;t nước ấm, để khoảng 5 ph&uacute;t ( men sẽ nở hết v&agrave; ngấm nước)<br />
	&ndash; Cho bột m&igrave; v&agrave;o c&aacute;i &acirc;u sạch, th&ecirc;m dầu olive, đường, muối, v&agrave; men đ&atilde; nở v&agrave;o trộn đều l&ecirc;n. ( Bạn nhớ l&agrave;m trũng giữa đống bột v&agrave; cho từ từ dầu olibe v&agrave; men v&agrave;o để trộn)<br />
	&ndash; Bạn nhồi bột cho tới khi thấy bột mịn l&agrave; được ( m&igrave;nh nh&agrave;o khoảng 50 lần)</p>
<p>
	<img alt="Hướng dẫn cách làm Pizza hải sản ngon" src="https://monan9.com/wp-content/uploads/2015/01/banh-pizza-1.jpg" /><br />
	&ndash; Qu&eacute;t một lớp dầu olive mỏng v&agrave;o c&aacute;i &acirc;u kh&aacute;c, sau đ&oacute; cho bột đxa nh&agrave;o v&agrave;o trong. D&ugrave;ng miếng bọc thức ăn bọc lại v&agrave; để bột nghỉ khoảng 1h30 ph&uacute;t<br />
	&ndash; Sau đ&oacute; lấy ra , đập mạnh v&agrave;o bột cho bột xẹp bớt. Sau đ&oacute; lấy bột ra c&aacute;n mỏng<br />
	&ndash; &Eacute;p v&agrave;o khu&ocirc;n đ&atilde; b&ocirc;i dầu olive ( cho b&aacute;nh kh&ocirc;ng bị d&iacute;nh). Lấy đường vi&ecirc;n ngo&agrave;i của b&aacute;nh phải cao hơn t&acirc;m b&aacute;nh. D&ugrave;ng c&aacute;c chiếc dĩa, đ&acirc;m l&ecirc;n mặt b&aacute;nh , để b&aacute;nh tr&aacute;nh bị phồng l&ecirc;n<br />
	&ndash; Cho v&agrave;o l&ograve; nước 250 độ C, khoảng 5 ph&uacute;t</p>
<p>
	<img alt="Hướng dẫn làm pizza hải sản tại nhà" src="https://monan9.com/wp-content/uploads/2015/01/banh-pizza-5.jpg" /></p>
<p>
	Bước 2: Phần nh&acirc;n b&aacute;nh<br />
	&ndash; Rửa sạch tất cả c&aacute;c nguy&ecirc;n liệu, t&ocirc;m cắt hạt lựu, mực cắt khoanh, ớt bổ m&uacute;i cau<br />
	&ndash; X&agrave;o l&aacute; L&aacute; Oregano kh&ocirc; tr&ecirc;n chảo dầu olive cho thật thơm, sau đ&oacute; cho t&ocirc;m, mực, cồi điệp, hạt n&ecirc;m v&agrave;o x&agrave;o cho ngấm dầu, sau đ&oacute; cho ớt chu&ocirc;ng v&agrave;o đảo tất cả trong khoảng 1 ph&uacute;t l&agrave; được.</p>
<p>
	<br />
	Bước 3: Ho&agrave;n th&agrave;nh b&aacute;nh pizza hải sản<br />
	&ndash; Lấy phần đế b&aacute;nh đ&atilde; nướng sơ qua ( bước 1), qu&eacute;t một lớp mỏng sốt c&agrave; l&ecirc;n bề mặt b&aacute;nh, cho phần nh&acirc;n hải sản đ&atilde; x&agrave;o ( bước 2) l&ecirc;n tr&ecirc;n, th&ecirc;m pho m&aacute;t th&aacute;i sợi, cho th&ecirc;m ch&uacute;t l&aacute; Oregano l&ecirc;n tr&ecirc;n.</p>
<p>
	<img alt="Cách làm pizza hải sản thơm ngon bổ dưỡng" src="https://monan9.com/wp-content/uploads/2015/01/banh-pizza-3.jpg" /><br />
	&ndash; Cho v&agrave;o l&ograve; nướng , bật khoảng 250 độ C, khoảng 10 ph&uacute;t. Vậy l&agrave; ch&uacute;ng ta sẽ được một chiếc b&aacute;nh pizza hải sản rất ngon.</p>
<p>
	C&aacute;ch l&agrave;m th&igrave; kh&ocirc;ng kh&oacute;, tuy nhi&ecirc;n muốn l&agrave;m được&nbsp;pizza <a href="https://dulich9.com/tong-hop-nhung-meo-tranh-ngo-doc-hai-san-khi-du-lich.html" target="_blank">hải sản</a>&nbsp;n&agrave;y nh&agrave; bạn phải c&oacute; l&ograve; nướng. C&aacute;c nguy&ecirc;n liệu th&igrave; c&oacute; thể ra si&ecirc;u thị ch&uacute;ng ta sẽ mua được đầy đủ. Nếu bạn th&iacute;ch l&agrave;m cho nhiều người ăn th&igrave; c&oacute; thể tăng th&ecirc;m nguy&ecirc;n liệu . M&oacute;n pizza ch&uacute;ng ta ăn n&oacute;ng mới ngon nh&eacute;! Ch&uacute;c c&aacute;c bạn th&agrave;nh c&ocirc;ng v&agrave; ngon miệng v&agrave; c&ugrave;ng chia sẻ c&aacute;ch l&agrave;m Pizza hải sản ngon n&agrave;y với mọi người nh&eacute;, h&atilde;y b&igrave;nh luận nếu bạn c&oacute; bất kỳ g&oacute;p &yacute; hay thắc mắc.</p>
', 1, 8)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (44, N'Sáng cuối tuần làm bún gà nấm cho cả nhà thưởng thức', N'2017_05_31_22_28_41_673bun.jpg', N'Bún là lựa chọn thường thấy của nhiều người vào mùa hè. Món bún gà nấm dưới đây có cách làm vô cùng đơn giản, rất dễ ăn, cả người lớn và trẻ nhỏ đều thích. ', CAST(N'2017-05-31 00:00:00.000' AS DateTime), 4, N'<p>
	Để l&agrave;m b&uacute;n g&agrave; nấm bạn cần chuẩn bị những nguy&ecirc;n liệu sau đ&acirc;y:</p>
<p>
	1 đ&ugrave;i g&agrave; nguy&ecirc;n phần m&aacute; đ&ugrave;i</p>
<p>
	200g nấm hương tươi (nấm đ&ocirc;ng c&ocirc;)</p>
<p>
	200g nấm hải sản</p>
<p>
	1 mớ rau cải c&uacute;c</p>
<p>
	B&uacute;n</p>
<p>
	Gừng, 1 nửa củ h&agrave;nh t&acirc;y</p>
<table border="0" cellpadding="0" cellspacing="0" style="margin-bottom: 10px;">
	<tbody>
	</tbody>
</table>
<div align="left">
	<img alt="" src="http://afamilycdn.com/VP75zw5duc3TeizYBCLqPsyCSiS/Image/EmoticonOng/11-282bb.png" /></div>
<div align="left">
	<table border="0" cellpadding="0" cellspacing="0" style="margin-bottom: 10px;">
		<tbody>
			<tr>
				<td style="width: 300px; padding: 0 20px 25px 0;" valign="top">
					<div align="left">
						<img alt="" src="http://afamilycdn.com/VP75zw5duc3TeizYBCLqPsyCSiS/Image/EmoticonOng/01-282bb.png" /></div>
				</td>
				<td style="padding: 0 5px 0 5px" valign="top">
					<img alt="" src="http://afamilycdn.com/thumb_w/400/E88MOq9iOdccccccccccccjjVmV53G/Image/2016/03/20160316_ANKT_BunGaNam%20%281%29-3bf43.jpg" title="" /><br />
					<p>
						Thịt g&agrave; lọc lấy phần thịt th&aacute;i miếng vừa ăn, cho phần xương g&agrave; c&ugrave;ng với gừng đập rập, h&agrave;nh t&acirc;y th&aacute;i miếng v&agrave;o nồi, th&ecirc;m nước ninh cho ngọt. Trong qu&aacute; tr&igrave;nh ninh nước d&ugrave;ng bạn n&ecirc;n thường xuy&ecirc;n hớt bỏ bọt để nước d&ugrave;ng trong. N&ecirc;m nếm gia vị vừa ăn.</p>
				</td>
			</tr>
		</tbody>
	</table>
</div>
<div align="left">
	<table border="0" cellpadding="0" cellspacing="0" style="margin-bottom: 10px;">
		<tbody>
			<tr>
				<td style="width: 300px; padding: 0 20px 25px 0;" valign="top">
					<div align="left">
						<img alt="" src="http://afamilycdn.com/VP75zw5duc3TeizYBCLqPsyCSiS/Image/EmoticonOng/02-282bb.png" /></div>
				</td>
				<td style="padding: 0 5px 0 5px" valign="top">
					<img alt="" src="http://afamilycdn.com/thumb_w/400/E88MOq9iOdccccccccccccjjVmV53G/Image/2016/03/20160316_ANKT_BunGaNam%20%282%29-3bf43.jpg" title="" /><br />
					<p>
						Nấm hương rửa sạch, th&aacute;i đ&ocirc;i hoặc ba tuỳ v&agrave;o độ lớn của nấm.</p>
				</td>
			</tr>
		</tbody>
	</table>
</div>
<div align="left">
	<table border="0" cellpadding="0" cellspacing="0" style="margin-bottom: 10px;">
		<tbody>
			<tr>
				<td style="width: 300px; padding: 0 20px 25px 0;" valign="top">
					<div align="left">
						<img alt="" src="http://afamilycdn.com/VP75zw5duc3TeizYBCLqPsyCSiS/Image/EmoticonOng/03-282bb.png" /></div>
				</td>
				<td style="padding: 0 5px 0 5px" valign="top">
					<img alt="" src="http://afamilycdn.com/thumb_w/400/E88MOq9iOdccccccccccccjjVmV53G/Image/2016/03/20160316_ANKT_BunGaNam%20%283%29-3bf43.jpg" title="" /><br />
					<p>
						Cho thịt g&agrave; v&agrave; nấm hương v&agrave;o x&agrave;o cho vừa vặn, thịt g&agrave; săn lại l&agrave; được.</p>
				</td>
			</tr>
		</tbody>
	</table>
</div>
<div align="left">
	<table border="0" cellpadding="0" cellspacing="0" style="margin-bottom: 10px;">
		<tbody>
			<tr>
				<td style="width: 300px; padding: 0 20px 25px 0;" valign="top">
					<div align="left">
						<img alt="" src="http://afamilycdn.com/VP75zw5duc3TeizYBCLqPsyCSiS/Image/EmoticonOng/04-282bb.png" /></div>
				</td>
				<td style="padding: 0 5px 0 5px" valign="top">
					<img alt="" src="http://afamilycdn.com/thumb_w/400/E88MOq9iOdccccccccccccjjVmV53G/Image/2016/03/20160316_ANKT_BunGaNam%20%284%29-3bf43.jpg" title="" /><br />
					<p>
						Sau đ&oacute; đổ v&agrave;o nồi nước d&ugrave;ng đang ninh.</p>
				</td>
			</tr>
		</tbody>
	</table>
</div>
<div align="left">
	<table border="0" cellpadding="0" cellspacing="0" style="margin-bottom: 10px;">
		<tbody>
			<tr>
				<td style="width: 300px; padding: 0 20px 25px 0;" valign="top">
					<div align="left">
						<img alt="" src="http://afamilycdn.com/VP75zw5duc3TeizYBCLqPsyCSiS/Image/EmoticonOng/05-282bb.png" /></div>
				</td>
				<td style="padding: 0 5px 0 5px" valign="top">
					<img alt="" src="http://afamilycdn.com/thumb_w/400/E88MOq9iOdccccccccccccjjVmV53G/Image/2016/03/20160316_ANKT_BunGaNam%20%285%29-3bf43.jpg" title="" /><br />
					<p>
						Nấm hải sản rửa sạch rồi thả v&agrave;o nồi nước d&ugrave;ng. Vặn lửa nhỏ. Cải c&uacute;c rửa sạch để r&aacute;o nước.</p>
				</td>
			</tr>
		</tbody>
	</table>
</div>
<div align="left">
	<table border="0" cellpadding="0" cellspacing="0" style="margin-bottom: 10px;">
		<tbody>
			<tr>
				<td style="width: 300px; padding: 0 20px 25px 0;" valign="top">
					<div align="left">
						<img alt="" src="http://afamilycdn.com/VP75zw5duc3TeizYBCLqPsyCSiS/Image/EmoticonOng/06-282bb.png" /></div>
				</td>
				<td style="padding: 0 5px 0 5px" valign="top">
					<img alt="" src="http://afamilycdn.com/thumb_w/400/E88MOq9iOdccccccccccccjjVmV53G/Image/2016/03/20160316_ANKT_BunGaNam%20%286%29-3bf43.jpg" title="" /><br />
					<p>
						Khi ăn trần b&uacute;n sơ, lấy b&uacute;n ra b&aacute;t, nh&uacute;ng cải c&uacute;c v&agrave;o nồi nước d&ugrave;ng cho ch&iacute;n tới rồi xếp l&ecirc;n b&aacute;t, chan th&ecirc;m nước d&ugrave;ng v&agrave; thịt v&agrave;o l&agrave; c&oacute; thể ăn được rồi.</p>
				</td>
			</tr>
		</tbody>
	</table>
</div>
<div align="left">
	<img alt="" src="http://afamilycdn.com/VP75zw5duc3TeizYBCLqPsyCSiS/Image/EmoticonOng/15-282bb.png" /></div>
<div align="left">
	&nbsp;</div>
<div align="left">
	Với nhiều chị em, chuẩn bị <a href="http://afamily.vn/bua-sang.htm" target="_blank" title="bữa sáng">bữa s&aacute;ng</a> l&agrave; việc tốn nhiều thời gian lại l&iacute;ch k&iacute;ch nữa. Tuy nhi&ecirc;n với m&oacute;n <a href="http://afamily.vn/an-ngon/mon-ngon-cuoi-tuan-bun-ga-nau-mang-20120504104351542.chn" target="_blank" title="bún gà">b&uacute;n g&agrave;</a> nấm n&agrave;y đảm bảo chị em chỉ cần chừng 20 ph&uacute;t l&agrave; đ&atilde; c&oacute; bữa sang ấm bụng m&agrave; ngon hết sảy rồi. B&uacute;n g&agrave; nấm thơm phức m&ugrave;i nấm, nước d&ugrave;ng ngọt ngon sẽ cho bạn khởi đầu ng&agrave;y mới đầy hứng khởi.<br />
	&nbsp;</div>
<div align="center">
	<img alt="" src="http://afamilycdn.com/thumb_w/600/E88MOq9iOdccccccccccccjjVmV53G/Image/2016/03/20160316_ANKT_BunGaNam%20%287%29-3bf43.jpg" style="cursor: zoom-in;" title="" /></div>
<div align="center">
	<p>
		Ch&uacute;c bạn ngon miệng!</p>
</div>
<p>
	&nbsp;</p>
', 1, 8)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (45, N'Trở về tuổi thơ với kem sữa gạo cực dễ làm', N'2017_05_31_22_29_58_599kem.jpg', N'Kem sữa gạo gắn liền với tuổi thơ của nhiều người. Món kem mát lạnh, thơm mùi bột nếp và dừa tươi, là món giải khát, giải nhiệt hiệu quả. ', CAST(N'2017-05-31 00:00:00.000' AS DateTime), 0, N'<p>
	<img alt="" src="https://cachlam9.com/wp-content/uploads/2015/07/cach-lam-kem-sua-gao-1.jpg" style="width: 480px; height: 361px;" /></p>
<p>
	&nbsp;</p>
<div>
	<p>
		&nbsp;Nguy&ecirc;n liệu l&agrave;m kem sữa gạo:</p>
	<p>
		+ 10gr bột gạo nếp.</p>
	<p>
		+ &nbsp;470ml nước lọc</p>
	<p>
		+ 80ml sữa tươi</p>
	<p>
		+&nbsp;3 th&igrave;a canh đường</p>
	<p>
		+&nbsp;2g muối</p>
	<p>
		+ Dừa nạo sợi</p>
	<p>
		+ Khu&ocirc;n kem.</p>
</div>
<p>
	&nbsp;</p>
<p>
	C&aacute;ch l&agrave;m kem sữa gạo như sau:</p>
<p>
	Bước 1:</p>
<p>
	Cho 20ml nước lọc v&agrave;o b&aacute;t bột gạo nếp, khuấy nhẹ v&agrave; đều tay, cho đến khi bột s&aacute;nh mịn rồi cho nốt 450ml nước c&ograve;n lại v&agrave;o b&aacute;t bột, tiếp tục khuấy lần nữa, đảm bảo bột ho&agrave;n to&agrave;n kh&ocirc;ng c&ograve;n lợn cợn.</p>
<p>
	Bước 2:</p>
<p>
	Đổ b&aacute;t bột v&agrave;o 1 chiếc nồi &nbsp;c&oacute; đế d&agrave;y (để tr&aacute;nh bị ch&aacute;y kh&eacute;t ở đ&aacute;y nồi, l&agrave;m hỏng vị kem), đun cho tới khi s&ocirc;i th&igrave; đổ sữa v&agrave; đường v&agrave;o. Tiếp tục vừa đun vừa khuấy đều cho tới khi hỗn hợp s&ocirc;i trở lại, đường tan hết (khoảng 2 ph&uacute;t).</p>
<p>
	Bước 3:</p>
<p>
	Chờ cho đến khi hỗn hợp sữa nguội ho&agrave;n to&agrave;n th&igrave; r&oacute;t v&agrave;o khu&ocirc;n kem. Cho khu&ocirc;n kem v&agrave;o ngăn đ&ocirc;ng tủ lạnh chừng 6-8 tiếng l&agrave; bạn c&oacute; thể thưởng thức được rồi!</p>
<p>
	Th&agrave;nh phẩm:&nbsp;</p>
<p>
	Khi ăn bạn h&atilde;y rắc dừa nạo l&ecirc;n c&aacute;c que kem để vị kem th&ecirc;m b&ugrave;i v&agrave; ngậy nh&eacute;</p>
<p>
	Bột gạo nếp dẻo thơm kết hợp với vị của sữa v&agrave; ngậy thơm của dừa sẽ khiến bạn v&ocirc; c&ugrave;ng h&agrave;i l&ograve;ng, đặc biệt&nbsp;trong những ng&agrave;y h&egrave; n&oacute;ng nực n&agrave;y.</p>
<p>
	Ch&uacute;c c&aacute;c bạn th&agrave;nh c&ocirc;ng với c&aacute;ch l&agrave;m m&oacute;n kem sữa gạo n&agrave;y.&nbsp;Đừng qu&ecirc;n theo d&otilde;i m&oacute;n ngon mỗi ng&agrave;y tr&ecirc;n Emdep.vn để c&oacute; được cho m&igrave;nh những c&ocirc;ng thức nấu&nbsp;ăn hấp dẫn nh&eacute;!</p>
', 1, 8)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (46, N'Đánh tan oi bức mùa hè với món thạch cam sữa chua', N'2017_05_31_22_31_55_483thach.jpg', N'Chọn những quả cam ngon, kết hợp với sữa chua và bột rau câu, bạn sẽ có ngay món tráng miệng, món ăn vặt thật ngon cho cả nhà.', CAST(N'2017-05-31 00:00:00.000' AS DateTime), 2, N'<p>
	<img alt="" src="https://bepnhatom.files.wordpress.com/2012/05/img_0225.jpg" style="width: 559px; height: 373px;" /></p>
<p>
	Chọn những quả cam ngon, kết hợp với sữa chua v&agrave; bột rau c&acirc;u, bạn sẽ c&oacute; ngay m&oacute;n tr&aacute;ng miệng, m&oacute;n ăn vặt thật ngon cho cả nh&agrave;.</p>
<div itemprop="articleBody">
	<p>
		C&aacute;ch l&agrave;m thạch cam sữa chua như sau:&nbsp;</p>
	<p>
		Bước 1: Trộn bột agar với đường c&aacute;t, h&ograve;a tan c&ugrave;ng 1 l&iacute;t nước lọc, ng&acirc;m khoảng 10 ph&uacute;t rồi bắc l&ecirc;n bếp nấu.</p>
	<p>
		Bước 2: Khi nước thạch s&ocirc;i l&ecirc;n th&igrave; vớt hết bọt cho nước thạch trong, li&ecirc;n tục khuấy đều để thạch v&agrave; đường h&ograve;a tan.</p>
	<p>
		Bước 3: Cam &eacute;p lấy nước.</p>
	<p>
		Bước 4: Nước thạch rau c&acirc;u chia ra l&agrave;m 2 phần:</p>
	<p>
		- H&ograve;a tan &frac12; nước thạch rau c&acirc;u với nước cam th&agrave;nh hỗn hợp thạch cam.</p>
	<p>
		- H&ograve;a tan &frac12; nước thạch rau c&acirc;u với sữa chua th&agrave;nh hỗn hợp thạch sữa chua.</p>
	<p>
		Bước 5: Cho lần lượt thạch sữa chua v&agrave; thạch cam v&agrave;o ly, cốc, ch&eacute;n hay khu&ocirc;n (t&ugrave;y th&iacute;ch). Để 2 hỗn hợp thạch kh&ocirc;ng bị trộn lẫn v&agrave;o nhau th&igrave; đổ theo từng lớp, khi lớp n&agrave;y se mặt th&igrave; nhẹ nh&agrave;ng đổ lớp kia l&ecirc;n cho đến khi đầy khu&ocirc;n, để nguội. Cất v&agrave;o ngăn m&aacute;t tủ lạnh d&ugrave;ng dần.&nbsp;</p>
	<p>
		Th&agrave;nh phẩm:</p>
	<p>
		<img alt="" src="http://lambanh365.com/wp-content/uploads/2015/06/lam-thach-cam-mat-ruoi-8.jpg" style="width: 640px; height: 428px;" /></p>
	<p>
		Trời nắng n&oacute;ng m&agrave; được thưởng thức những miếng thạch cam m&aacute;t lạnh n&agrave;y th&igrave; thật l&agrave; tuyệt. Vị thơm ngọt đặc trưng của cam quyện với vị chua chua, b&eacute;o ngậy của sữa tươi khiến m&oacute;n thạch c&agrave;ng trở n&ecirc;n v&ocirc; c&ugrave;ng hấp dẫn.</p>
	<p>
		Đ&acirc;y l&agrave; một m&oacute;n ăn vặt, m&oacute;n tr&aacute;ng miệng rất thơm ngon v&agrave; th&iacute;ch hợp cho ng&agrave;y h&egrave;. Ch&uacute;c c&aacute;c bạn th&agrave;nh c&ocirc;ng v&agrave; ngon miệng nh&eacute;!</p>
</div>
<p>
	&nbsp;</p>
', 1, 8)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (47, N'Thạch rau câu dừa giòn ngon, thơm mát, thật khó cưỡng', N'2017_05_31_22_33_13_647thachdu.jpg', N'Thạch rau câu dừa là một món tráng miệng rất được ưa chuộng, bởi không chỉ thơm ngon mà còn giúp làm mát cơ thể, rất phù hợp để các bạn dùng làm món ăn nhẹ hàng ngày. ', CAST(N'2017-05-31 00:00:00.000' AS DateTime), 2, N'<div>
	<p>
		<img alt="" src="https://cachlam9.com/wp-content/uploads/2013/08/Cach-lam-thach-rau-cau-dua-ngon.jpg" style="width: 436px; height: 315px;" /></p>
	<p>
		&nbsp;Nguy&ecirc;n liệu l&agrave;m thạch rau c&acirc;u dừa gồm:&nbsp;</p>
	<p>
		+ 5g bột agar gi&ograve;n (bột thạch gi&ograve;n)</p>
	<p>
		+ 200g đường c&aacute;t</p>
	<p>
		+ 1 quả dừa to (cơm dừa d&agrave;y)</p>
	<p>
		+ V&agrave;i t&eacute;p l&aacute; dứa</p>
	<p>
		+ 200ml nước lọc</p>
</div>
<p>
	&nbsp;C&aacute;ch l&agrave;m thạch rau c&acirc;u dừa như sau:&nbsp;</p>
<p>
	<img alt="" src="https://7monngonmoingay.com/wp-content/uploads/2014/12/cach-lam-rau-cau-dua-thuong-ngay-ta-hay-an.jpg" style="width: 500px; height: 288px;" /></p>
<p>
	Bước 1:&nbsp;Trộn bột agar với đường c&aacute;t, h&ograve;a tan c&ugrave;ng nước dừa v&agrave; nước lọc (khoảng 1,2 l&iacute;t) l&agrave; được, ng&acirc;m khoảng 10 ph&uacute;t rồi bắc l&ecirc;n bếp nấu. L&aacute; dứa rửa sạch, cuộn lại rồi cho v&agrave;o nấu c&ugrave;ng nước agar để tạo m&ugrave;i thơm.</p>
<p>
	Bước 2:&nbsp;D&ugrave;ng nắp chai bia để cạo cơm dừa ra th&agrave;nh từng sợi mỏng d&agrave;i, rồi chần sơ qua nước n&oacute;ng 2 ph&uacute;t (để bớt lượng dầu dừa), vớt ra để r&aacute;o.</p>
<p>
	Bước 3:&nbsp;Khi nước thạch agar s&ocirc;i l&ecirc;n th&igrave; vớt sạch bọt để thạch trong, khuấy li&ecirc;n tục để đường v&agrave; bột thạch tan ho&agrave;n to&agrave;n. Vớt bỏ l&aacute; dứa rồi đổ thạch rau c&acirc;u v&agrave;o khu&ocirc;n.</p>
<p>
	Bước 4:&nbsp;Tiếp theo đ&oacute;, bạn cho cơm dừa v&agrave;o thạch rau c&acirc;u, trộn đều rồi để nguội.</p>
<p>
	Bước 5: Cất thạch v&agrave;o ngăn m&aacute;t tủ lạnh, khi ăn th&igrave; cắt ra th&agrave;nh từng miếng vừa ăn l&agrave; được.</p>
<p>
	Th&agrave;nh phẩm:</p>
<p>
	Thạch rau c&acirc;u c&oacute; vị thanh của nước dừa tươi, vị b&eacute;o của cơm dừa v&agrave; m&ugrave;i thơm ngọt ng&agrave;o của l&aacute; dứa, thực sự l&agrave; m&oacute;n ăn rất hấp dẫn.</p>
<p>
	Từng miếng thạch rau c&acirc;u thanh m&aacute;t, gi&ograve;n sần sật, tan trong miệng rất tuyệt vời phải kh&ocirc;ng?</p>
<p>
	Ch&uacute;c c&aacute;c bạn th&agrave;nh c&ocirc;ng với c&aacute;ch l&agrave;m thạch rau c&acirc;u dừa n&agrave;y nh&eacute;! Đừng qu&ecirc;n theo d&otilde;i m&oacute;n ngon mỗi ng&agrave;y tr&ecirc;n Emdep.vn để c&oacute; được cho m&igrave;nh những c&ocirc;ng thức m&oacute;n ăn hấp dẫn.</p>
', 1, 8)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (48, N'Thạch xoài sữa đẹp xinh lung linh, vị chua ngọt, ăn thấy mê!', N'2017_05_31_22_35_07_233xoa.jpg', N'Món thạch xoài sữa thanh mát, ngọt lịm và bắt mắt, đánh tan cái nhiệt của mùa hè, là món ăn xế chiều hấp dẫn hoặc làm món tráng miệng cực ngon cho cả nhà.', CAST(N'2017-05-31 00:00:00.000' AS DateTime), 2, N'<p>
	<img alt="" src="http://lambanh365.com/wp-content/uploads/2015/06/cach-lam-thach-xoai-don-gian-ma-ngon-mieng-6.jpg" style="width: 551px; height: 453px;" /></p>
<div>
	<p>
		&nbsp;Nguy&ecirc;n liệu l&agrave;m thạch xo&agrave;i sữa như sau:&nbsp;</p>
	<p>
		+ 5g bột thạch rau c&acirc;u</p>
	<p>
		+ 350g đường c&aacute;t</p>
	<p>
		+ 150ml sữa tươi</p>
	<p>
		+ 1 tr&aacute;i xo&agrave;i ch&iacute;n</p>
	<p>
		+ 1,2l nước lọc</p>
</div>
<p>
	&nbsp;C&aacute;ch l&agrave;m thạch xo&agrave;i sữa như sau:&nbsp;</p>
<p>
	Bước 1: Trộn bột thạch&nbsp;với đường c&aacute;t, h&ograve;a tan c&ugrave;ng 1,2l nước lọc, ng&acirc;m khoảng 10 ph&uacute;t rồi bắc l&ecirc;n bếp nấu. Khi nước thạch s&ocirc;i l&ecirc;n th&igrave; vớt hết bọt cho thạch trong, li&ecirc;n tục khuấy đều để thạch v&agrave; đường h&ograve;a tan.</p>
<p>
	Bước 2: Xo&agrave;i ch&iacute;n gọt vỏ rồi th&aacute;i nhỏ, cho v&agrave;o m&aacute;y sinh tố xay nhuyễn c&ugrave;ng với 1 &iacute;t nước lọc.</p>
<p>
	Bước 3: Chia nước thạch ra l&agrave;m 2 phần:</p>
<p>
	Phần thạch xo&agrave;i: Trộn nước thạch&nbsp;với xo&agrave;i đ&atilde; xay nhuyễn, trộn thật đều để th&agrave;nh hỗn hợp thạch xo&agrave;i.</p>
<p>
	Phần thạch sữa: Trộn nước thạch với sữa tươi, trộn thật đều để th&agrave;nh hỗn hợp thạch sữa.</p>
<p>
	Bước 5: Lần lượt đổ thạch v&agrave;o khu&ocirc;n, đổ phần thạch xo&agrave;i trước, chờ lớp thạch xo&agrave;i se mặt th&igrave; tiếp tục đổ lớp thạch sữa l&ecirc;n tr&ecirc;n, cứ thế đổ xen kẽ nhau cho đến khi đầy khu&ocirc;n.</p>
<p>
	Để thạch nguội rồi bảo quản trong tủ lạnh, khi ăn gỡ thạch ra khỏi&nbsp;khu&ocirc;n rồi cắt miếng t&ugrave;y th&iacute;ch.</p>
<p>
	Lưu &yacute;:&nbsp;Nước thạch sẽ rất mau đ&ocirc;ng, n&ecirc;n trong khi chờ lớp n&agrave;y se mặt th&igrave; phần nước thạch kia sẽ bị đ&ocirc;ng sệt lại. Do đ&oacute;, bạn phải lu&ocirc;n ng&acirc;m phần nước thạch chưa sử dụng v&agrave;o nước n&oacute;ng, đậy k&iacute;n lại. Nếu thạch đ&ocirc;ng đặc th&igrave; c&oacute; thể đun n&oacute;ng&nbsp;lại v&agrave; thực hiện c&aacute;c bước tiếp theo dễ d&agrave;ng hơn.&nbsp;</p>
<p>
	Th&agrave;nh phẩm:</p>
<p>
	<img alt="" src="http://afamilycdn.com/thumb_w/650/2017/7-1493812421506.jpg" style="width: 650px; height: 488px;" /></p>
<p>
	Những ng&agrave;y nắng n&oacute;ng m&agrave; được thưởng thức m&oacute;n thạch xo&agrave;i sữa chua ngọt, thanh m&aacute;t n&agrave;y th&igrave; c&ograve;n g&igrave; tuyệt vời hơn.</p>
<p>
	M&agrave;u sắc bắt mắt, hương vị thơm ngon,&nbsp;chắc chắn ai cũng th&iacute;ch m&ecirc;. H&atilde;y c&ugrave;ng l&agrave;m cho cả nh&agrave; m&igrave;nh thưởng thức nh&eacute;!</p>
<p>
	Ch&uacute;c c&aacute;c bạn th&agrave;nh c&ocirc;ng với c&aacute;ch l&agrave;m thạch xo&agrave;i sữa n&agrave;y.&nbsp;Đừng qu&ecirc;n theo d&otilde;i m&oacute;n ngon mỗi ng&agrave;y tr&ecirc;n <a href="http://emdep.vn/mon-ngon.htm">Emdep.vn</a> để c&oacute; được cho m&igrave;nh những c&ocirc;ng thức m&oacute;n ăn&nbsp;hấp dẫn nh&eacute;!</p>
', 1, 8)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (49, N'Thịt lợn đang rẻ, tận dụng làm ngay mấy món ngon này thôi!', N'2017_05_31_22_36_46_60137757769676598800094232060521093151406326n-090148291.jpg', N'Những ngày này thị trường thịt lợn đang chao đảo khi giá thịt bỗng rẻ bất ngờ. Còn chần chừ gì mà không làm ngay những món ngon sau đây! ', CAST(N'2017-05-31 00:00:00.000' AS DateTime), 1, N'<p>
	Thịt lợn rẻ kh&ocirc;ng c&oacute; nghĩa l&agrave; chất lượng thịt kh&ocirc;ng tốt&nbsp;đ&acirc;u nh&eacute;! Gi&aacute; b&aacute;n đi xuống cũng l&agrave; l&yacute; do nhiều người d&acirc;n kh&ocirc;ng tập trung đầu tư thức ăn chăn nu&ocirc;i nữa m&agrave;&nbsp;để lợn sống v&agrave; ăn những nguy&ecirc;n liệu tự nhi&ecirc;n. Bởi thế, thịt lợn chắc, thơm, ngọt thịt v&agrave; kh&ocirc;ng lo d&iacute;nh tạp chất. &nbsp;</p>
<p>
	Loanh quanh với thịt lợn, nhiều người kh&ocirc;ng biết phải chế biến theo những c&aacute;ch n&agrave;o để c&oacute; m&oacute;n ăn hấp dẫn, kh&ocirc;ng bị tr&ugrave;ng lặp v&agrave; khơi dậy cảm hứng cho m&acirc;m&nbsp;cơm gia đ&igrave;nh. Bếp Emdep.vn sẽ gi&uacute;p bạn giải quyết điều n&agrave;y.&nbsp;</p>
<p>
	<img alt="" src="http://www.savourydays.com/wp-content/uploads/2017/01/C%C3%A1ch-l%C3%A0m-kh%C3%B4-heo-banner.jpg" style="width: 624px; height: 358px;" /></p>
<p>
	1. Ch&acirc;n gi&ograve;&nbsp;nấu giả cầy</p>
<p>
	Đ&acirc;y c&oacute; lẽ l&agrave; m&oacute;n ăn kho&aacute;i khẩu của rất nhiều &ocirc;ng chồng. Thịt ch&acirc;n gi&ograve; nấu giả cầy mềm thơm, quyện gia vị, mang 1 đặc trưng rất ri&ecirc;ng m&agrave; chỉ cần ngửi th&ocirc;i cũng đo&aacute;n ra l&agrave; m&oacute;n g&igrave; rồi!&nbsp;</p>
<p>
	Thứ gia vị riềng xay kết hợp với mắm t&ocirc;m v&agrave; mẻ chua tạo th&agrave;nh 1 &quot;combo gia vị&quot; đầy hợp l&yacute;, mang lại m&ugrave;i thơm v&agrave; sự ngon miệng kh&ocirc;ng thể ch&ecirc; v&agrave;o đ&acirc;u được.&nbsp;</p>
<p>
	Nguy&ecirc;n liệu l&agrave;m giả cầy:<br />
	- 2&nbsp;miếng thịt ch&acirc;n gi&ograve;<br />
	- 4 chiếc m&oacute;ng gi&ograve;<br />
	- Mẻ (cơm mẻ)</p>
<p>
	- 1 củ riềng<br />
	- Mắm t&ocirc;m<br />
	- Muối</p>
<p>
	2. Sườn x&agrave;o chua ngọt&nbsp;</p>
<p>
	Sườn x&agrave;o chua ngọt l&agrave; m&oacute;n ăn kh&ocirc;ng chỉ hấp dẫn người lớn m&agrave; trẻ nhỏ cũng th&iacute;ch m&ecirc;. Vị chua ngọt ngấm trong từng miếng thịt sườn khiến bạn chỉ muốn ăn m&atilde;i kh&ocirc;ng th&ocirc;i!&nbsp;</p>
<p>
	Để l&agrave;m m&oacute;n ăn n&agrave;y ngon đ&uacute;ng điệu, c&oacute; lẽ kh&acirc;u pha chế nguy&ecirc;n liệu nước sốt chua ngọt l&agrave;&nbsp;cầu k&igrave; v&agrave; quan trọng nhất.&nbsp;</p>
<p>
	Nguy&ecirc;n liệu l&agrave;m sườn x&agrave;o chua ngọt gồm:&nbsp;</p>
<div>
	+ Sườn non: 500 gram</div>
<div>
	+ Tỏi: 4 -5 t&eacute;p</div>
<div>
	+ Ớt: 1-2 quả&nbsp;</div>
<div>
	+ H&agrave;nh t&iacute;m: 1 củ</div>
<div>
	+ Giấm</div>
<div>
	+&nbsp;Đường</div>
<div>
	+ Muối</div>
<div>
	+ X&igrave; dầu hoặc nước mắm</div>
<div>
	&nbsp;</div>
<div>
	3. Thịt heo ng&acirc;m mắm</div>
<div>
	Một m&oacute;n ăn biến tấu lạ miệng v&agrave; rất ph&ugrave; hợp l&agrave;m m&oacute;n nhậu đ&oacute; l&agrave; thịt heo ng&acirc;m mắm. Thịt heo được luộc ch&iacute;n rồi ng&acirc;m với nước mắm chua ngọt theo 1 &nbsp;c&ocirc;ng thức chuẩn khoảng v&agrave;i ng&agrave;y l&agrave; ăn được.&nbsp;</div>
<div>
	Miếng thịt mềm, thơm, ngấm gia vị, ăn 1 lại muốn ăn 10. M&acirc;m cơm ng&agrave;y h&egrave; m&agrave; c&oacute; đĩa thịt heo ng&acirc;m mắm chấm tương ớt, thưởng thức c&ugrave;ng cốc bia m&aacute;t lạnh th&igrave; hết &yacute;!&nbsp;</div>
<div>
	Nguy&ecirc;n liệu l&agrave;m thịt heo ng&acirc;m mắm:</div>
<div>
	<p>
		+ 1kg thịt ba chỉ hoặc thịt đ&ugrave;i, thịt ch&acirc;n gi&ograve;, thịt đầu&hellip;</p>
	<p>
		+ Nước mắm ngon&nbsp;</p>
	<p>
		+ Đường c&aacute;t trắng.</p>
	<p>
		+ Đường ph&egrave;n.</p>
	<p>
		+ Tỏi, hoa hồi, hạt ti&ecirc;u sọ, ớt tươi.</p>
</div>
<p>
	&nbsp;</p>
<p>
	4. Gi&ograve; lụa</p>
<p>
	C&aacute;ch l&agrave;m gi&ograve; lụa tại nh&agrave; kh&ocirc;ng kh&oacute;, đ&acirc;y lại c&ograve;n l&agrave; c&aacute;ch tận dụng thịt lợn rất hiệu quả, đem lại cho bạn 1 m&oacute;n ăn ngon v&agrave; c&oacute; thời gian sử dụng l&acirc;u d&agrave;i. Hơn nữa, việc tự chế biến gi&ograve; lụa tại nh&agrave; c&ograve;n đảm bảo vệ sinh an to&agrave;n thực phẩm, tr&aacute;nh h&agrave;n the.&nbsp;</p>
<p>
	Gi&ograve; ngon l&agrave; ở sự kĩ c&agrave;ng v&agrave; kh&eacute;o l&eacute;o của người chế biến. Lựa chọn thịt lợn mới, xay nhuyễn c&ugrave;ng gia vị, &eacute;p khu&ocirc;n hoặc g&oacute;i l&aacute; chuối rồi đem luộc ch&iacute;n, c&aacute;c bước chỉ c&oacute; vậy nhưng kh&ocirc;ng phải ai cũng th&agrave;nh c&ocirc;ng.</p>
<div>
	Nguy&ecirc;n liệu:</div>
<div>
	+ 500gr thịt heo xay sẵn. Thịt xay sẵn thường c&oacute; mỡ v&agrave; nạc. Kh&ocirc;ng n&ecirc;n d&ugrave;ng thịt nguy&ecirc;n nạc khiến gi&ograve; rất kh&ocirc;, k&eacute;m độ ngon.</div>
<div>
	+ 30gr bột năng hay bột bắp</div>
<div>
	+ Gia vị: 1 muỗng canh nước mắm; 1/2 muỗng c&agrave; ph&ecirc; bột n&ecirc;m; 1/2 muỗng c&agrave; ph&ecirc; đường; 1 muỗng c&agrave; ph&ecirc; bột ti&ecirc;u trắng (ti&ecirc;u trắng sẽ l&agrave;m gi&ograve; kh&ocirc;ng bị đen)</div>
<div>
	+ 50ml nước đ&aacute; lạnh (cần thật lạnh)</div>
<div>
	+ 15g bột nở</div>
<div>
	&nbsp;</div>
<div>
	5. T&ocirc;m kh&ocirc; chưng thịt</div>
<div>
	T&ocirc;m kh&ocirc; chưng thịt l&agrave; m&oacute;n ăn rất thơm ngon. Nếu để ở nhiệt độ thường, bạn c&oacute; thể ăn được khoảng 2 tuần. Nếu để trong ngăn m&aacute;t tủ lạnh, bạn thậm ch&iacute; c&ograve;n c&oacute; thể ăn được từ 3-4 th&aacute;ng cơ đấy!&nbsp;</div>
<div>
	T&ocirc;m kh&ocirc; đem x&agrave;o c&ugrave;ng với thịt, n&ecirc;m th&ecirc;m đậm đ&agrave; tỏi, ớt c&ugrave;ng c&aacute;c gia vị mắm, ti&ecirc;u hợp l&yacute;, l&agrave;m 1 lần m&agrave; c&oacute; thể ăn d&agrave;i l&acirc;u. M&oacute;n ăn n&agrave;y khi n&oacute;ng hổi rất dễ tốn cơm v&agrave; thưởng thức với x&ocirc;i hay cơm đều hợp l&yacute; nh&eacute;!&nbsp;</div>
<div>
	<p>
		Nguy&ecirc;n liệu l&agrave;m t&ocirc;m kh&ocirc; chưng thịt:</p>
	<p>
		+ Thịt nạc: 0,3kg</p>
	<p>
		+ T&ocirc;m kh&ocirc;: 0,5kg</p>
	<p>
		+ H&agrave;nh kh&ocirc;: 0,1kg</p>
	<p>
		+ Tỏi: 0,1kg</p>
	<p>
		+ Ớt: 4 quả</p>
	<p>
		+ Gia vị, nước mắm, hạt ti&ecirc;u, m&igrave; ch&iacute;nh.</p>
</div>
<div>
	6. Thịt heo cuộn kim chi om cay&nbsp;</div>
<div>
	Sự pha trộn giữa 2 nền ẩm thực Việt &nbsp;- H&agrave;n tạo n&ecirc;n 1 m&oacute;n ăn hấp dẫn v&agrave; ngon cơm v&ocirc; c&ugrave;ng. Bạn đ&atilde; bao giờ ăn thử m&oacute;n n&agrave;y chưa?</div>
<div>
	Thay v&igrave; nấu những m&oacute;n thịt heo quen thuộc, h&ocirc;m nay h&atilde;y thử v&agrave;o bếp v&agrave; kết hợp với kim chi xem sao! Vị chua gi&ograve;n của kim chi om c&ugrave;ng thịt ba chỉ v&agrave; nấm khiến m&oacute;n ăn v&ocirc; c&ugrave;ng bắt mắt, hương vị thật kh&ocirc;ng ch&ecirc; v&agrave;o đ&acirc;u được!</div>
<div>
	<p>
		&nbsp;</p>
</div>
<div>
	7. Thịt ba chỉ nướng riềng mẻ</div>
<div>
	Vẫn sử dụng nguy&ecirc;n liệu giống như c&aacute;ch nấu giả cầy nhưng thịt lợn nướng riềng mẻ đem lại 1 cảm gi&aacute;c kh&aacute;c&nbsp;biệt hơn. Thịt lợn sau khi ướp được nướng&nbsp;v&agrave;ng ươm, hương thơm quyến rũ khiến mọi người kh&ocirc;ng thể ngồi y&ecirc;n&nbsp;v&agrave; mong ng&oacute;ng được thưởng thức ngay lập tức. &nbsp;</div>
<p>
	Nguy&ecirc;n liệu l&agrave;m thịt ba chỉ nướng riềng mẻ gồm:&nbsp;</p>
<p>
	+ 500gr thịt ba chỉ, để nguy&ecirc;n b&igrave;</p>
<p>
	+ 200gr riềng xay (1 củ riềng vừa)</p>
<p>
	+ 2,5 muỗng mắm t&ocirc;m</p>
<p>
	+ 2 muỗng mẻ</p>
<p>
	+ 3 th&igrave;a c&agrave; ph&ecirc;&nbsp;bột canh</p>
<p>
	+ 2 th&igrave;a c&agrave; ph&ecirc; m&igrave; ch&iacute;nh</p>
<p>
	+ Xi&ecirc;n tre (t&ugrave;y độ d&agrave;i)</p>
<p>
	&nbsp;</p>
<p>
	8. Thịt lợn kh&ocirc;&nbsp;</p>
<p>
	M&oacute;n thịt lợn kh&ocirc; với c&aacute;ch ướp v&agrave; chế biến đơn giản, đem lại cho bạn m&oacute;n ăn tuyệt vời chẳng k&eacute;m thịt b&ograve; kh&ocirc; đ&acirc;u nh&eacute;! Đ&acirc;y cũng l&agrave; 1 c&aacute;ch tận dụng thịt lợn hiệu quả, th&iacute;ch hợp để l&agrave;m m&oacute;n nhậu hoặc ăn vặt.&nbsp;</p>
<p>
	Nguy&ecirc;n liệu l&agrave;m thịt heo kh&ocirc;:&nbsp;<br />
	+ 600 gr thịt heo m&ocirc;ng hay thăn<br />
	+ 30 ml nước lạnh<br />
	+ 65 gr đường<br />
	+ Dầu ớt<br />
	+ Ớt kh&ocirc;<br />
	+ M&egrave; trắng</p>
<p>
	+ Muối<br />
	+ Dầu h&agrave;o<br />
	+ Ngũ vị hương<br />
	+ Sả<br />
	+ Bột n&ecirc;m</p>
<p>
	&nbsp;</p>
', 1, 8)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (50, N'Gợi ý trang phục đi chơi dễ thương cho bé ngày 1/6', N'2017_05_31_22_40_01_900mau-nhi-111530297.jpg', N'Ngày Quốc tế thiếu nhi đã cận kề, các mẹ đã chuẩn bị gì cho bé yêu chưa?', CAST(N'2017-05-31 00:00:00.000' AS DateTime), 4, N'<p>
	Ng&agrave;y Quốc tế thiếu nhi đ&atilde; cận kề, c&aacute;c mẹ đ&atilde; chuẩn bị g&igrave; cho b&eacute; y&ecirc;u chưa? Ngo&agrave;i việc ăn g&igrave;, chơi g&igrave;, ở đ&acirc;u th&igrave; trang phục cũng l&agrave; vấn đề được c&aacute;c b&eacute; cũng như phụ huynh rất quan t&acirc;m. V&agrave; đối với c&aacute;c b&eacute; g&aacute;i th&igrave; việc mặc g&igrave; cho &quot;đẹp hơn c&aacute;c bạn&quot; cũng đủ khiến cha mẹ đau đầu rồi.</p>
<p>
	Emdep.vn sẽ gợi &yacute; cho c&aacute;c bậc phụ huynh một v&agrave;i trang phục đ&aacute;ng y&ecirc;u cho b&eacute; đi chơi v&agrave; tha hồ chụp nhiều ảnh đẹp trong ng&agrave;y 1/6.</p>
<p>
	V&aacute;y x&ograve;e c&ocirc;ng ch&uacute;a<img alt="" src="http://phunuso.vn/wp-content/uploads/2014/09/nhung-mau-dam-xoe-xinh-xan-cho-be-gai-them-dieu-da-va-dang-yeu-23915.jpg" style="width: 601px; height: 549px;" /></p>
<p>
	Đương nhi&ecirc;n rồi, v&aacute;y x&ograve;e c&ocirc;ng ch&uacute;a l&agrave; item được c&aacute;c b&eacute; g&aacute;i y&ecirc;u th&iacute;ch nhất. C&ocirc; b&eacute; n&agrave;o cũng muốn được mặc những chiếc v&aacute;y x&ograve;e bồng bềnh điệu đ&agrave; v&agrave; xinh xắn. Một v&agrave;i mẫu v&aacute;y x&ograve;e cha mẹ c&oacute; thể tặng b&eacute; như v&aacute;y x&ograve;e Bạch Tuyết, v&aacute;y c&ocirc;ng ch&uacute;a Elsa...</p>
<p>
	Chiếc bờm t&oacute;c đồng điệu c&ugrave;ng bộ v&aacute;y x&ograve;e sẽ gi&uacute;p c&aacute;c b&eacute; th&ecirc;m cute v&agrave; nổi bật hơn. Chỉ cần buộc t&oacute;c hoặc tết đu&ocirc;i sam đơn giản để t&ocirc;n l&ecirc;n trang phục đ&aacute;ng y&ecirc;u m&agrave; b&eacute; đang mặc.</p>
<p>
	V&aacute;y yếm + &aacute;o ph&ocirc;ng</p>
<p>
	Một kiểu trang phục nữa cũng rất hợp cho c&aacute;c b&eacute; đi chơi l&agrave; v&aacute;y yếm kết hợp &aacute;o ph&ocirc;ng. Vừa nh&iacute; nhảnh, hồn nhi&ecirc;n đ&uacute;ng lứa tuổi lại gi&uacute;p c&aacute;c b&eacute; thoải m&aacute;i vận động.</p>
<p>
	B&ecirc;n cạnh chất liệu denim, c&aacute;c mẹ c&oacute; thể chọn v&aacute;y hoặc quần yếm sắc m&agrave;u tươi s&aacute;ng kh&aacute;c như v&agrave;ng, hồng hay trắng... chắc chắn cũng thu h&uacute;t kh&ocirc;ng k&eacute;m. Với set đồ n&agrave;y, sneaker hoặc slip-on l&agrave; lựa chọn tuyệt vời nhất.</p>
<p>
	V&aacute;y Hanbok</p>
<p>
	Hanbok l&agrave; trang phục truyền thống của H&agrave;n Quốc với 2 chi tiết gồm &aacute;o v&agrave; ch&acirc;n v&aacute;y. Khi chọn Hanbok cho b&eacute; g&aacute;i, phụ huynh n&ecirc;n ưu ti&ecirc;n c&aacute;c m&agrave;u tươi s&aacute;ng, nữ t&iacute;nh như hồng s&aacute;ng, đỏ. Ngo&agrave;i ra, phi&ecirc;n bản Hanbok d&agrave;nh cho trẻ nhỏ c&ograve;n c&oacute; mũ đội đầu rất đ&aacute;ng y&ecirc;u.</p>
<p>
	Chắc chắn ai cũng sẽ phải ngắm nh&igrave;n &quot;thi&ecirc;n thần nhỏ&quot; đ&aacute;ng y&ecirc;u của bạn với bộ Hanbok rất nổi n&agrave;y.</p>
<p>
	V&aacute;y ballet</p>
<p>
	V&aacute;y ballet kh&ocirc;ng chỉ đ&aacute;ng y&ecirc;u m&agrave; c&ograve;n gi&uacute;p c&aacute;c b&eacute; &quot;thả ga&quot; thể hiện c&aacute;c động t&aacute;c m&uacute;a rất cute.</p>
<p>
	&nbsp;C&aacute;c mẹ n&ecirc;n chọn một đ&ocirc;i gi&agrave;y bệt cho b&eacute; khi diện trang phục n&agrave;y để tạo sự ăn &yacute; cho vẻ ngo&agrave;i.&nbsp;</p>
<p>
	V&aacute;y kim sa lấp l&aacute;nh</p>
<p>
	V&aacute;y kim sa lấp l&aacute;nh đương nhi&ecirc;n l&agrave; item m&agrave; bất kỳ b&eacute; g&aacute;i n&agrave;o cũng muốn mặc. C&aacute;c mẹ c&oacute; thể chọn v&aacute;y x&ograve;e d&agrave;i chạm đất hoặc ngắn ngang gối đều rất xinh.</p>
<p>
	C&aacute;c mẹ c&ograve;n chờ đợi g&igrave; nữa m&agrave; kh&ocirc;ng tặng ngay &quot;thi&ecirc;n thần nhỏ&quot; của m&igrave;nh một chiếc v&aacute;y lấp l&aacute;nh thu h&uacute;t như thế n&agrave;y. Với kiểu v&aacute;y kim sa, n&ecirc;n tr&aacute;nh c&aacute;c m&agrave;u tối như đen, n&acirc;u, ghi v&agrave; ưu ti&ecirc;n những m&agrave;u tươi tắn, ph&ugrave; hợp với b&eacute; g&aacute;i như hồng, xanh, đỏ, v&agrave;ng, cam... Chắc chắn l&agrave; b&eacute; sẽ th&iacute;ch m&ecirc; m&oacute;n qu&agrave; của bạn.</p>
', 1, 1)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (51, N'Mix đồ hè sành điệu cho 4 phong cách cơ bản', N'2017_05_31_22_41_02_98mix.jpg', N'Dù bạn theo đuổi phong cách gì thì những gợi ý dưới đây cũng rất hữu ích.', CAST(N'2017-05-31 00:00:00.000' AS DateTime), 0, N'<div>
	<p>
		&ldquo;Dường như đ&atilde; l&acirc;u lắm rồi, chưa c&oacute; một xu hướng thời trang n&agrave;o đủ sức khiến phụ nữ sẵn s&agrave;ng gạt tất cả những g&igrave; kh&aacute;c trong tủ quần &aacute;o sang một b&ecirc;n như phong c&aacute;ch tối giản.&rdquo;</p>
</div>
<p>
	<a href="http://elle.vn/thoi-trang" rel="noopener noreferrer" target="_blank">Thời trang</a> cũng mang hơi thở v&agrave; d&aacute;ng dấp kh&ocirc;ng kh&aacute;c g&igrave; một con người. Khi đ&atilde; mỏi mệt với những bộ sưu tập thời trang haute couture nổi loạn v&agrave; kịch t&iacute;nh, thời trang quay lại với những thiết kế cổ điển, nhẹ nh&agrave;ng m&agrave; vẫn tinh tế v&agrave; cuốn h&uacute;t. Tương tự, gam m&agrave;u hot của năm 2016 cũng l&agrave; những gam <a href="http://www.elle.vn/xu-huong-thoi-trang/mau-trung-tinh-gam-mau-hot-nam-2016" rel="noopener noreferrer" target="_blank" title="Màu trung tính – gam màu hot năm 2016">m&agrave;u trung t&iacute;nh</a> như hồng thạch anh (rose quartz), xanh thanh b&igrave;nh (serenity) v&agrave; x&aacute;m hoa c&agrave; (lilac grey), tượng trưng cho &ldquo;cảm gi&aacute;c an l&agrave;nh cũng như xoa dịu mọi gi&aacute;c quan nhằm đem đến sự b&igrave;nh an trong t&acirc;m hồn&rdquo;.</p>
<p>
	<a href="http://www.elle.vn/the-gioi-van-hoa/phong-cach-toi-gian-den-tu-chau-phi-cua-nghe-si-safaa-erruas" rel="noopener noreferrer" target="_blank" title="Phong cách tối giản đến từ châu Phi của nghệ sĩ Safaa Erruas">Phong c&aacute;ch tối giản</a> (minimalism) tựa như một cốc nước lọc m&aacute;t l&agrave;nh cho l&agrave;ng thời trang thế giới. Tuy c&oacute; giản đơn v&agrave; thuần khiết nhưng kh&ocirc;ng hề nhạt nhẽo, v&ocirc; vị. Xu hướng minimalism vẫn &acirc;m ỉ từ năm 2014 đến nay v&agrave; kh&ocirc;ng c&oacute; dấu hiệu giảm nhiệt, c&oacute; lẽ bởi n&oacute; đ&atilde; thuộc về những g&igrave; gọi l&agrave; &ldquo;kinh điển&rdquo; &ndash; ph&ugrave; hợp v&agrave; hữu dụng ở mọi thời đại.</p>
<p>
	&nbsp;.</p>
<div id="attachment_119290">
	<img alt="Minimalism Gợi ý phối đồ đẹp theo phong cách tối giản 15 ELLE VN" src="http://www.elle.vn/wp-content/uploads/2016/02/15/Minimalism-G%E1%BB%A3i-%C3%BD-ph%E1%BB%91i-%C4%91%E1%BB%93-%C4%91%E1%BA%B9p-theo-phong-c%C3%A1ch-t%E1%BB%91i-gi%E1%BA%A3n-15-ELLE-VN-490x408.jpg" />
	<p>
		Đơn giản nhưng thanh lịch</p>
</div>
<p>
	Phong c&aacute;ch tối giản chỉ n&ecirc;n c&oacute; từ 2 đến 3 m&agrave;u đơn sắc tr&ecirc;n tổng thể trang phục. Mọi phụ kiện, họa tiết viền, ren đều được c&aacute;c t&iacute;n đồ thời trang tối giản h&oacute;a hết mức c&oacute; thể theo nguy&ecirc;n tắc &ldquo;less is more&rdquo;.</p>
<p>
	&nbsp;.</p>
<div id="attachment_119289">
	<img alt="Minimalism Gợi ý phối đồ đẹp theo phong cách tối giản 14 ELLE VN" src="http://www.elle.vn/wp-content/uploads/2016/02/15/Minimalism-G%E1%BB%A3i-%C3%BD-ph%E1%BB%91i-%C4%91%E1%BB%93-%C4%91%E1%BA%B9p-theo-phong-c%C3%A1ch-t%E1%BB%91i-gi%E1%BA%A3n-14-ELLE-VN-490x653.jpg" />
	<p>
		C&aacute;ch k&ecirc;t hợp m&agrave;u sắc v&agrave; item rất quan trọng trong việc tạo n&ecirc;n phong c&aacute;ch tổi giản</p>
</div>
<p>
	H&atilde;y c&ugrave;ng <a href="http://elle.vn/thoi-trang" rel="noopener noreferrer" target="_blank">ELLE</a> kh&aacute;m ph&aacute; những c&aacute;ch phối đồ v&agrave; phối m&agrave;u tối giản theo một c&aacute;ch rất ph&ugrave; hợp với người ch&acirc;u &Aacute; dưới đ&acirc;y. Những việc cần l&agrave;m l&agrave; ghi nhớ, kiểm tra tủ quần &aacute;o của m&igrave;nh v&agrave; h&atilde;y thử kết hợp những m&oacute;n đồ cơ bản c&oacute; sẵn nếu bạn muốn trở th&agrave;nh một t&iacute;n đồ của phong c&aacute;ch n&agrave;y.</p>
<p>
	1. Xanh serenity + trắng</p>
<p>
	.</p>
<div id="attachment_119276">
	<img alt="Minimalism Gợi ý phối đồ đẹp theo phong cách tối giản 01 ELLE VN" src="http://www.elle.vn/wp-content/uploads/2016/02/15/Minimalism-G%E1%BB%A3i-%C3%BD-ph%E1%BB%91i-%C4%91%E1%BB%93-%C4%91%E1%BA%B9p-theo-phong-c%C3%A1ch-t%E1%BB%91i-gi%E1%BA%A3n-01-ELLE-VN-490x571.jpg" />
	<p>
		Xanh serenity vẫn đang tiếp tục nằm trong danh s&aacute;ch gam m&agrave;u trung t&iacute;nh hot của năm 2016.</p>
</div>
<p>
	&nbsp;</p>
<div id="attachment_119277">
	<img alt="Minimalism Gợi ý phối đồ đẹp theo phong cách tối giản 02 ELLE VN" src="http://www.elle.vn/wp-content/uploads/2016/02/15/Minimalism-G%E1%BB%A3i-%C3%BD-ph%E1%BB%91i-%C4%91%E1%BB%93-%C4%91%E1%BA%B9p-theo-phong-c%C3%A1ch-t%E1%BB%91i-gi%E1%BA%A3n-02-ELLE-VN-490x653.jpg" />
	<p>
		Phối xanh serenity v&agrave; trắng l&agrave; c&aacute;ch phối đồ kh&ocirc;ng lỗi mốt theo thời gian</p>
</div>
<p>
	2. Hồng thạch anh + trắng/x&aacute;m</p>
<p>
	&nbsp;.</p>
<div id="attachment_119278">
	<img alt="Minimalism Gợi ý phối đồ đẹp theo phong cách tối giản 03 ELLE VN" src="http://www.elle.vn/wp-content/uploads/2016/02/15/Minimalism-G%E1%BB%A3i-%C3%BD-ph%E1%BB%91i-%C4%91%E1%BB%93-%C4%91%E1%BA%B9p-theo-phong-c%C3%A1ch-t%E1%BB%91i-gi%E1%BA%A3n-03-ELLE-VN-490x653.jpg" />
	<p>
		C&aacute;c thiết kế tối giản h&oacute;a những họa tiết rườm r&agrave;.</p>
</div>
<p>
	&nbsp;</p>
<div id="attachment_119279">
	<img alt="Minimalism Gợi ý phối đồ đẹp theo phong cách tối giản 04 ELLE VN" src="http://www.elle.vn/wp-content/uploads/2016/02/15/Minimalism-G%E1%BB%A3i-%C3%BD-ph%E1%BB%91i-%C4%91%E1%BB%93-%C4%91%E1%BA%B9p-theo-phong-c%C3%A1ch-t%E1%BB%91i-gi%E1%BA%A3n-04-ELLE-VN-490x653.jpg" />
	<p>
		Hồng thạch anh mang lại vẻ ấm &aacute;p đ&aacute;ng tin cậy, dễ d&agrave;ng tạo n&ecirc;n n&eacute;t thanh lịch, t&ocirc;n da người mặc l&agrave; những điểm mạnh khiến sắc hồng thạch anh được ph&aacute;i nữ đặc biệt ưu &aacute;i.</p>
</div>
<p>
	&nbsp;</p>
<div id="attachment_119280">
	<img alt="Minimalism Gợi ý phối đồ đẹp theo phong cách tối giản 05 ELLE VN" src="http://www.elle.vn/wp-content/uploads/2016/02/15/Minimalism-G%E1%BB%A3i-%C3%BD-ph%E1%BB%91i-%C4%91%E1%BB%93-%C4%91%E1%BA%B9p-theo-phong-c%C3%A1ch-t%E1%BB%91i-gi%E1%BA%A3n-05-ELLE-VN-490x653.jpg" />
	<p>
		Ngo&agrave;i c&ocirc;ng thức cơ bản hồng v&agrave; trắng th&igrave; sắc hồng n&agrave;y cũng rất ăn &yacute; v&agrave; thu h&uacute;t khi kết hợp với t&ocirc;ng x&aacute;m.</p>
</div>
<p>
	3. Camel + trắng</p>
<p>
	&nbsp;.</p>
<div id="attachment_119281">
	<img alt="Minimalism Gợi ý phối đồ đẹp theo phong cách tối giản 06 ELLE VN" src="http://www.elle.vn/wp-content/uploads/2016/02/15/Minimalism-G%E1%BB%A3i-%C3%BD-ph%E1%BB%91i-%C4%91%E1%BB%93-%C4%91%E1%BA%B9p-theo-phong-c%C3%A1ch-t%E1%BB%91i-gi%E1%BA%A3n-06-ELLE-VN-490x653.jpg" />
	<p>
		Kết hợp nhiều sắc độ của một m&agrave;u tr&ecirc;n trang phục cũng l&agrave; c&aacute;ch để tạo n&ecirc;n phong c&aacute;ch minimal.</p>
</div>
<p>
	4. Camel + xanh navy</p>
<p>
	&nbsp;.</p>
<div id="attachment_119282">
	<img alt="Minimalism Gợi ý phối đồ đẹp theo phong cách tối giản 07 ELLE VN" src="http://www.elle.vn/wp-content/uploads/2016/02/15/Minimalism-G%E1%BB%A3i-%C3%BD-ph%E1%BB%91i-%C4%91%E1%BB%93-%C4%91%E1%BA%B9p-theo-phong-c%C3%A1ch-t%E1%BB%91i-gi%E1%BA%A3n-07-ELLE-VN-490x653.jpg" />
	<p>
		Với ưu điểm t&ocirc;n da của m&agrave;u camel kết hợp c&ugrave;ng xanh navy &ndash; m&agrave;u sắc của đẳng cấp tạo n&ecirc;n một bộ đ&ocirc;i tối giản ho&agrave;n hảo.</p>
</div>
<p>
	&nbsp;</p>
', 1, 1)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (52, N'10 kiểu trang phục là ''kẻ thù'' của cô nàng ''hạt tiêu''', N'2017_05_31_22_42_30_500Capture.JPG', N'Nàng ''hạt tiêu'' hãy tránh xa những món đồ dưới đây nếu không bạn sẽ bị "dìm" không thương tiếc.', CAST(N'2017-05-31 00:00:00.000' AS DateTime), 0, N'<p>
	<img alt="sdfaùd" src="http://2sao.vietnamnetjsc.vn/images/2017/05/19/22/12/6-11553167.jpg" /></p>
', 1, 1)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (53, N'Bí kíp chọn chân váy cực chuẩn cho cô nàng ''hạt tiêu''', N'2017_05_31_22_44_04_8381skirt-170601012.jpg', N' Với bí kíp dưới đây cô nàng bé hạt tiêu trở nên cao ráo ngay tức thì.', CAST(N'2017-05-31 00:00:00.000' AS DateTime), 0, N'<p align="center" style="text-align: justify;">
	<strong>Ch&acirc;n v&aacute;y tennis</strong></p>
<p align="center" style="text-align: center;">
	<img alt="Thời trang:Bí kíp chọn chân váy cực chuẩn cho cô nàng ''hạt tiêu''" src="http://static.netlife.vn//2017/04/08/10/00/thoi-trangbi-kip-chon-chan-vay-cuc-chuan-cho-co-nang-hat-tieu_1.jpg?maxwidth=480" width="600" /></p>
<p align="center" style="text-align: justify;">
	Với kiểu d&aacute;ng ngắn, ch&acirc;n v&aacute;y tennis l&agrave; một trong những item gi&uacute;p bạn ăn gian chiều cao hiệu quả. Kiểu v&aacute;y n&agrave;y c&oacute; thể kết hợp được với rất nhiều trang phục, phong c&aacute;ch <b><a href="http://netlife.vn/thoi-trang/thoi-trang-he-toi-dien-nhung-item-nay-moi-dung-mot-c124-20170407164152508.html" target="_blank">thời trang</a></b> kh&aacute;c nhau. Mix c&ugrave;ng &aacute;o thun polo, crop-top hay &aacute;o ph&ocirc;ng su&ocirc;ng sẽ gi&uacute;p bạn trẻ trung, năng động&nbsp;hơn.</p>
<p align="center" style="text-align: justify;">
	<strong>Ch&acirc;n v&aacute;y chữ A</strong></p>
<p align="center" style="text-align: center;">
	<img alt="Thời trang:Bí kíp chọn chân váy cực chuẩn cho cô nàng ''hạt tiêu''" src="http://static.netlife.vn//2017/04/08/10/00/thoi-trangbi-kip-chon-chan-vay-cuc-chuan-cho-co-nang-hat-tieu_2.jpg?maxwidth=480" width="600" /></p>
<div id="vmcbackground">
	<center>
		&nbsp;</center>
</div>
<div id="abdf">
	<p align="center" style="text-align: justify;">
		Ch&acirc;n v&aacute;y chữ A l&agrave; trang phục <a href="http://netlife.vn/thoi-trang/thoi-trang-quyen-ru-moi-anh-nhin-voi-vay-lien-hoa-tiet-hoa-vintage-%E2%80%93-item-cong-so-hot-nhat-c124-20170407114743995.html" target="_blank"><b>thời trang</b></a> c&oacute; khả năng &quot;k&eacute;o d&agrave;i&quot; đ&ocirc;i ch&acirc;n v&agrave; gi&uacute;p n&agrave;ng thấp b&eacute; trở n&ecirc;n quyến rũ hơn. Phần chiết eo v&agrave; th&acirc;n v&aacute;y c&oacute; độ x&ograve;e vừa phải tạo n&ecirc;n sự h&agrave;i h&ograve;a với tỉ lệ cơ thể. Nếu kh&ocirc;ng muốn trở th&agrave;nh &quot;nấm l&ugrave;n&quot; di động bạn n&ecirc;n chọn v&aacute;y tr&ecirc;n gối hay chạm gối.</p>
	<p align="center" style="text-align: justify;">
		<strong>Ch&acirc;n v&aacute;y d&agrave;i</strong></p>
	<p align="center" style="text-align: center;">
		<img alt="Thời trang:Bí kíp chọn chân váy cực chuẩn cho cô nàng ''hạt tiêu''" src="http://static.netlife.vn//2017/04/08/10/00/thoi-trangbi-kip-chon-chan-vay-cuc-chuan-cho-co-nang-hat-tieu_3.jpg?maxwidth=480" width="600" /></p>
</div>
<p align="center" style="text-align: justify;">
	Ch&acirc;n v&aacute;y d&agrave;i ho&agrave;n to&agrave;n c&oacute; thể phối đồ d&agrave;nh cho c&ocirc; n&agrave;ng &quot;hạt ti&ecirc;u&quot; v&agrave;o m&ugrave;a xu&acirc;n - h&egrave;. Bạn h&atilde;y chọn một chiếc ch&acirc;n v&aacute;y cạp cao d&agrave;i đến bắp ch&acirc;n c&ugrave;ng với &aacute;o crop-top.&nbsp;</p>
<p align="center" style="text-align: justify;">
	<strong>Ch&acirc;n v&aacute;y đến đầu gối</strong></p>
<p align="center" style="text-align: center;">
	<img alt="Thời trang:Bí kíp chọn chân váy cực chuẩn cho cô nàng ''hạt tiêu''" src="http://static.netlife.vn//2017/04/08/10/00/thoi-trangbi-kip-chon-chan-vay-cuc-chuan-cho-co-nang-hat-tieu_4.jpg?maxwidth=480" width="600" /></p>
<p align="center" style="text-align: justify;">
	Đ&acirc;y cũng ch&iacute;nh l&agrave; sự lựa chọn ho&agrave;n hảo cho n&agrave;ng ch&acirc;n ngắn. N&agrave;ng &quot;nấm l&ugrave;n&quot; n&ecirc;n chọn ch&acirc;n v&aacute;y c&oacute; độ x&ograve;e vừa phải, thường l&agrave; đến đầu gối với phần cạp may cao vừa t&ocirc;n d&aacute;ng lại gi&uacute;p ch&acirc;n như d&agrave;i hơn.</p>
<p align="center" style="text-align: justify;">
	<strong>Ch&acirc;n v&aacute;y xẻ cao</strong></p>
<p align="center" style="text-align: center;">
	<img alt="Thời trang:Bí kíp chọn chân váy cực chuẩn cho cô nàng ''hạt tiêu''" src="http://static.netlife.vn//2017/04/08/10/00/thoi-trangbi-kip-chon-chan-vay-cuc-chuan-cho-co-nang-hat-tieu_5.jpg?maxwidth=480" width="600" /></p>
<p align="center" style="text-align: justify;">
	Ch&acirc;n v&aacute;y xẻ cao l&agrave; item cứu tinh cho c&ocirc; n&agrave;ng &quot;hạt ti&ecirc;u&quot;. Với chi tiết xẻ cao h&uacute;t mắt, bạn vừa c&oacute; thể khoe kh&eacute;o đ&ocirc;i ch&acirc;n gợi cảm vừa tr&ocirc;ng cao r&aacute;o v&agrave; thon gọn hơn kh&aacute; nhiều. H&atilde;y chọn những ch&acirc;n v&aacute;y c&oacute; m&agrave;u sắc trung t&iacute;nh như be, trắng, đen,&hellip; v&agrave; tr&aacute;nh họa tiết sặc sỡ, rối mắt.</p>
<p align="center" style="text-align: justify;">
	<strong>Ch&acirc;n v&aacute;y b&uacute;t ch&igrave; cạp cao</strong></p>
<p align="center" style="text-align: center;">
	<img alt="Thời trang:Bí kíp chọn chân váy cực chuẩn cho cô nàng ''hạt tiêu''" src="http://static.netlife.vn//2017/04/08/10/00/thoi-trangbi-kip-chon-chan-vay-cuc-chuan-cho-co-nang-hat-tieu_6.jpg?maxwidth=480" width="600" /></p>
<p align="center" style="text-align: justify;">
	Đ&acirc;y l&agrave; d&aacute;ng v&aacute;y tuyệt vời d&agrave;nh cho v&oacute;c d&aacute;ng nhỏ nhắn của bạn. Độ &ocirc;m s&aacute;t hợp l&yacute; v&agrave; cạp cao gi&uacute;p t&ocirc;n v&ograve;ng eo v&agrave; tăng chiều cao cho ph&aacute;i đẹp. Ch&acirc;n v&aacute;y b&uacute;t ch&igrave; mang đến sự duy&ecirc;n d&aacute;ng cho chủ nh&acirc;n.</p>
<p align="center" style="text-align: justify;">
	<strong>Ch&acirc;n v&aacute;y &ocirc;m nhẹ</strong></p>
<p align="center" style="text-align: center;">
	<a href="http://emdep.vn/lady-stylist/bi-kip-chon-chan-vay-cuc-chuan-cho-co-nang-hat-tieu-20170407165936721.htm" target="_blank"><img alt="Thời trang:Bí kíp chọn chân váy cực chuẩn cho cô nàng ''hạt tiêu''" src="http://static.netlife.vn//2017/04/08/10/00/thoi-trangbi-kip-chon-chan-vay-cuc-chuan-cho-co-nang-hat-tieu_7.jpg?maxwidth=480" width="600" /></a></p>
<p align="center" style="text-align: justify;">
	Những ch&acirc;n v&aacute;y &ocirc;m nhẹ ch&acirc;n cũng gi&uacute;p những&nbsp;n&agrave;ng thấp b&eacute; c&acirc;n bằng tỉ lệ cơ thể. Bạn n&ecirc;n diện gi&agrave;y cao g&oacute;t để &quot;ăn gian&quot; chiều cao nữa nh&eacute;.</p>
', 1, 1)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (54, N'7 kiểu trang sức không thể thiếu dành cho các quý cô có bán tại emdep.vn', N'2017_05_31_22_45_38_2487-kieu-trang-suc-khong-the-thieu-cua-phu-nu-em-dep-1-141506701.jpg', N'7 kiểu trang sức không thể thiếu dành cho các quý cô có bán tại emdep.vn', CAST(N'2017-05-31 00:00:00.000' AS DateTime), 2, N'<p>
	Trang sức l&agrave; loại phụ kiện tuyệt vời nhất m&agrave; mọi c&ocirc; g&aacute;i đều mơ ước. Với trang sức, bạn c&oacute; thể khoe vẻ sang trọng của m&igrave;nh, đồng thời cũng l&agrave; tiếng n&oacute;i của c&aacute; t&iacute;nh. Khi kết hợp với trang phục, c&aacute;c loại trang sức sẽ gi&uacute;p bạn tỏa s&aacute;ng hơn, đồng thời cũng l&agrave; m&oacute;n đồ &ldquo;của để d&agrave;nh&rdquo; bạn c&oacute; thể giữ g&igrave;n m&atilde;i m&atilde;i m&agrave; kh&ocirc;ng phải chạy theo những xu hướng thời trang từ năm n&agrave;y sang năm kh&aacute;c. V&igrave; thế, h&atilde;y đầu tư th&ocirc;ng minh v&agrave;o những m&oacute;n trang sức sẽ gắn b&oacute; d&agrave;i l&acirc;u với bạn.</p>
<p>
	1. Khuy&ecirc;n nụ đ&iacute;nh đ&aacute;</p>
<p>
	<img alt="7 kiểu trang sức không thể thiếu dành cho các quý cô" src="http://thumb.connect360.vn/unsafe/600x0/imgs.emdep.vn/Share/Image/2017/03/29/7-kieu-trang-suc-khong-the-thieu-cua-phu-nu-em-dep-1-141506701.jpg" /></p>
<p>
	Đ&acirc;y l&agrave; một kiểu trang sức cổ điển m&agrave; gần như mọi c&ocirc; g&aacute;i đều sở hữu. Lấy cảm hứng từ những đ&ocirc;i khuy&ecirc;n tai kim cương qu&yacute; gi&aacute;, những đ&ocirc;i <a href="http://emdep.vn/hot-trend/khuyen-tai-nho-xinh-phu-kien-dang-de-thu-nhat-nam-nay-20170207214448533.htm">khuy&ecirc;n nụ đ&iacute;nh đ&aacute; </a>sẽ tạo n&ecirc;n diện mạo thanh lịch, nhẹ nh&agrave;ng. Bạn c&oacute; thể chọn những d&aacute;ng khuy&ecirc;n theo sở th&iacute;ch, v&iacute; dụ khuy&ecirc;n h&igrave;nh thoi, h&igrave;nh b&ocirc;ng hoa, hoặc h&igrave;nh ng&ocirc;i sao, c&agrave;ng nhỏ xinh th&igrave; c&agrave;ng duy&ecirc;n d&aacute;ng.</p>
<p>
	<img alt="7 kiểu trang sức không thể thiếu dành cho các quý cô" src="http://thumb.connect360.vn/unsafe/600x0/imgs.emdep.vn/Share/Image/2017/03/29/7-kieu-trang-suc-khong-the-thieu-cua-phu-nu-em-dep-2-141518816.jpg" /></p>
<p>
	<img alt="7 kiểu trang sức không thể thiếu dành cho các quý cô" src="http://thumb.connect360.vn/unsafe/600x0/imgs.emdep.vn/Share/Image/2017/03/29/7-kieu-trang-suc-khong-the-thieu-cua-phu-nu-em-dep-3-141527544.jpg" /></p>
<p>
	Với khuy&ecirc;n nụ đ&iacute;nh đ&aacute;, gần như bạn c&oacute; thể đeo mọi l&uacute;c mọi nơi, với mọi kiểu trang phục, từ đi chơi, đi l&agrave;m tới dự tiệc. Nh&igrave;n chung, bạn c&oacute; thể mua khuy&ecirc;n bạc đ&iacute;nh đ&aacute; với mức gi&aacute; trung b&igrave;nh, hoặc mua khuy&ecirc;n mỹ k&yacute;, nhưng n&ecirc;n chọn h&agrave;ng c&oacute; chất lượng tương đối tốt, để khuy&ecirc;n kh&ocirc;ng g&acirc;y k&iacute;ch ứng da, v&agrave; hạt đ&aacute; c&oacute; độ s&aacute;ng cần thiết. Khuy&ecirc;n nụ đ&iacute;nh đ&aacute; đặc biệt th&iacute;ch hợp với những c&ocirc; n&agrave;ng c&oacute; nước da trắng s&aacute;ng, đ&ocirc;i khi bạn chẳng cần trang điểm m&agrave; chỉ cần đeo khuy&ecirc;n đ&atilde; gi&uacute;p khu&ocirc;n mặt tỏa s&aacute;ng rồi.</p>
<p>
	2. V&ograve;ng cổ ngọc trai</p>
<p>
	<img alt="7 kiểu trang sức không thể thiếu dành cho các quý cô" src="http://thumb.connect360.vn/unsafe/598x0/imgs.emdep.vn/Share/Image/2017/03/29/7-kieu-trang-suc-khong-the-thieu-cua-phu-nu-em-dep-4-141541089.jpg" /></p>
<p>
	Với những chị em gắn b&oacute; với phong c&aacute;ch thời trang cổ điển, lấy cảm hứng từ những ng&ocirc;i sao Hollywood, th&igrave; chắc chắn kh&ocirc;ng thể bỏ qua một chuỗi v&ograve;ng cổ ngọc trai. Chỉ cần một chuỗi v&ograve;ng cổ ngọc trai (tự nhi&ecirc;n, nh&acirc;n tạo hoặc mỹ k&yacute; đều được), bạn đ&atilde; c&oacute; thể tạo ra độ c&acirc;n bằng giữa vẻ đẹp hiện đại v&agrave; cổ điển. Đặc biệt, v&ograve;ng cổ ngọc trai c&oacute; thể n&oacute;i l&agrave; phối được với đủ c&aacute;c m&agrave;u sắc, n&ecirc;n bạn cứ tự do chọn kiểu &aacute;o y&ecirc;u th&iacute;ch, nhưng tốt nhất l&agrave; chọn &aacute;o trơn m&agrave;u, kh&ocirc;ng họa tiết.</p>
<p>
	3. Khuy&ecirc;n tai tr&ograve;n</p>
<p>
	<img alt="7 kiểu trang sức không thể thiếu dành cho các quý cô" src="http://thumb.connect360.vn/unsafe/600x0/imgs.emdep.vn/Share/Image/2017/03/29/7-kieu-trang-suc-khong-the-thieu-cua-phu-nu-em-dep-5-141556277.jpg" /></p>
<p>
	Một đ&ocirc;i khuy&ecirc;n tai tr&ograve;n c&oacute; thể phối với nhiều loại v&aacute;y kh&aacute;c nhau. Bạn c&oacute; thể phối với v&aacute;y c&ocirc;ng sở để tạo sự tự tin, hoặc phối với ch&acirc;n v&aacute;y midi khi dạo phố, thậm ch&iacute; phối với quần jeans cũng rất c&aacute; t&iacute;nh. Nếu chọn đồ đi dự tiệc, h&atilde;y lựa chọn loại khuy&ecirc;n tr&ograve;n c&oacute; m&agrave;u v&agrave;ng &aacute;nh kim để th&ecirc;m bắt mắt, nhất l&agrave; trong những điệu nhảy. Đổi lại, nếu muốn đeo khuy&ecirc;n tai tr&ograve;n cho những dịp th&ocirc;ng thường, n&ecirc;n chọn t&ocirc;ng m&agrave;u bạc, với k&iacute;ch thước vừa phải để tạo diện mạo c&acirc;n bằng, dễ chịu.</p>
<p>
	<img alt="7 kiểu trang sức không thể thiếu dành cho các quý cô" src="http://thumb.connect360.vn/unsafe/600x0/imgs.emdep.vn/Share/Image/2017/03/29/7-kieu-trang-suc-khong-the-thieu-cua-phu-nu-em-dep-6-14160708.jpg" /></p>
<p>
	4. Lắc tay kim loại</p>
<p>
	Chỉ một chiếc lắc tay nhỏ xinh cũng c&oacute; thể tạo th&ecirc;m vẻ tinh tế khi phối đồ. Kiểu lắc cứng sẽ tạo phong th&aacute;i trẻ trung hơn, dễ phối với nhiều kiểu v&ograve;ng tay kh&aacute;c như v&ograve;ng da, v&ograve;ng tay handmade. Khi đeo lắc tay kim loại, bạn n&ecirc;n phối k&egrave;m với những bộ trang phục đơn giản, thậm ch&iacute; l&agrave; mang hơi hướng menswear, sẽ tạo hiệu ứng rất tốt.</p>
<p>
	<img alt="7 kiểu trang sức không thể thiếu dành cho các quý cô" src="http://thumb.connect360.vn/unsafe/600x0/imgs.emdep.vn/Share/Image/2017/03/29/7-kieu-trang-suc-khong-the-thieu-cua-phu-nu-em-dep-7-141619191.jpg" /></p>
<p>
	Lắc tay kim loại cũng c&oacute; thể phối với c&aacute;c loại nhẫn bộ, những chiếc nhẫn mảnh, kh&ocirc;ng đ&iacute;nh đ&aacute; cầu kỳ, th&iacute;ch hợp cho những ng&agrave;y đi chơi cuối tuần. Trong m&ugrave;a h&egrave; n&agrave;y, bạn c&oacute; thể phối lắc tay kim loại với &aacute;o s&aacute;t n&aacute;ch, đem lại điểm nhấn cho c&aacute;nh tay.</p>
<p>
	<img alt="7 kiểu trang sức không thể thiếu dành cho các quý cô" src="http://thumb.connect360.vn/unsafe/600x0/imgs.emdep.vn/Share/Image/2017/03/29/7-kieu-trang-suc-khong-the-thieu-cua-phu-nu-em-dep-8-141630676.jpg" /></p>
<p>
	<img alt="7 kiểu trang sức không thể thiếu dành cho các quý cô" src="http://thumb.connect360.vn/unsafe/600x0/imgs.emdep.vn/Share/Image/2017/03/29/7-kieu-trang-suc-khong-the-thieu-cua-phu-nu-em-dep-9-141641324.jpg" /></p>
<p>
	5. D&acirc;y chuyền d&agrave;i</p>
<p>
	D&acirc;y chuyền d&aacute;ng d&agrave;i, mảnh vừa tạo vẻ tinh tế, nhẹ nh&agrave;ng, vừa c&oacute; khả năng &ldquo;đ&aacute;nh lừa thị gi&aacute;c&rdquo; khiến cơ thể cao r&aacute;o, thon gọn hơn. Bạn c&oacute; thể phối d&acirc;y chuyền d&agrave;i với một v&agrave;i chiếc v&ograve;ng cổ ngắn hơn, choker hoặc v&ograve;ng c&oacute; mặt kỷ niệm để tạo lớp trang sức ấn tượng, th&iacute;ch hợp khi mặc v&aacute;y trễ vai hoặc những chiếc &aacute;o cổ rộng của m&ugrave;a h&egrave;. Ch&uacute; &yacute; chọn &aacute;o trơn m&agrave;u để l&agrave;m sợi d&acirc;y chuyền được nổi bật hơn.</p>
<p>
	<img alt="7 kiểu trang sức không thể thiếu dành cho các quý cô" src="http://thumb.connect360.vn/unsafe/600x0/imgs.emdep.vn/Share/Image/2017/03/29/7-kieu-trang-suc-khong-the-thieu-cua-phu-nu-em-dep-10-141653618.jpg" /></p>
<p>
	6. Đồng hồ cổ điển</p>
<p>
	Bạn c&oacute; thể d&ugrave;ng nhiều thiết bị hiện đại để xem giờ, nhưng gi&aacute; trị của một chiếc đồng hồ đeo tay cổ điển l&agrave; kh&ocirc;ng thể đo đếm được. D&ugrave; bạn mặc một bộ vest c&ocirc;ng sở sang trọng, hay chỉ l&agrave; &aacute;o crop top v&agrave; quần shorts, th&igrave; khi th&ecirc;m một chiếc đồng hồ ở cổ tay, bạn sẽ tạo được phong th&aacute;i qu&yacute; tộc v&agrave; tự tin. C&agrave;ng ưu ti&ecirc;n những thiết kế đồng hồ đơn giản, gọn g&agrave;ng, th&igrave; bạn c&agrave;ng c&oacute; thể phối được nhiều phong c&aacute;ch quần &aacute;o với n&oacute;.</p>
<p>
	<img alt="7 kiểu trang sức không thể thiếu dành cho các quý cô" src="http://thumb.connect360.vn/unsafe/600x0/imgs.emdep.vn/Share/Image/2017/03/29/7-kieu-trang-suc-khong-the-thieu-cua-phu-nu-em-dep-11-141705874.jpg" /></p>
<p>
	<img alt="7 kiểu trang sức không thể thiếu dành cho các quý cô" src="http://thumb.connect360.vn/unsafe/600x0/imgs.emdep.vn/Share/Image/2017/03/29/7-kieu-trang-suc-khong-the-thieu-cua-phu-nu-em-dep-12-141713448.jpg" /></p>
<p>
	7. Khuy&ecirc;n tai bản lớn</p>
<p>
	Muốn tạo ra sự đột ph&aacute;, t&aacute;o bạo cho phong c&aacute;ch, th&igrave; c&aacute;ch dễ nhất l&agrave; sắm một đ&ocirc;i khuy&ecirc;n tai bản lớn, với thiết kế v&agrave; chất liệu bắt mắt. Khi tham dự những buổi tiệc sang trọng, dự tiệc cưới, hoặc chụp ảnh thời trang, th&igrave; bạn c&oacute; thể nhờ đến đ&ocirc;i khuy&ecirc;n tai bản lớn n&agrave;y, tạo sự tương phản với những bộ trang phục đơn giản m&agrave; bạn chưa kịp thay. Khuy&ecirc;n tai bản lớn d&ugrave; l&agrave; đ&iacute;nh đ&aacute; hay bằng kim loại, th&igrave; c&agrave;ng c&oacute; độ lấp l&aacute;nh, c&agrave;ng hấp dẫn thị gi&aacute;c v&agrave; gi&uacute;p bạn trẻ trung hơn.</p>
<p>
	<img alt="7 kiểu trang sức không thể thiếu dành cho các quý cô" src="http://thumb.connect360.vn/unsafe/600x0/imgs.emdep.vn/Share/Image/2017/03/29/7-kieu-trang-suc-khong-the-thieu-cua-phu-nu-em-dep-13-141724986.jpg" /></p>
', 1, 1)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (55, N'Vàng đã hết thời – Trang sức bạc lên ngôi', N'2017_05_31_22_51_20_931xu-huong-trang-suc-bac-2015-em-dep-1-134504585.jpg', N'Không phải lúc nào đeo khuyên tai vàng hay vòng cổ vàng mới là nổi bật, bởi bạn còn phải xem chất liệu đang thịnh hành của mùa này là gì. ', CAST(N'2017-05-31 00:00:00.000' AS DateTime), 1, N'<div>
	Những chiếc v&ograve;ng hay nhẫn bạc lại bắt đầu được ưa th&iacute;ch trở lại. M&agrave;u của<a href="http://emdep.vn/nang-ban/tre-trung-tuoi-moi-voi-nhung-kieu-trang-suc-tu-lam-don-gian-20150702154300477.htm"> trang sức bạc</a> đem đến một c&aacute; t&iacute;nh tươi mới hơn, phi giới t&iacute;nh v&agrave; c&oacute; phần bụi bặm. Trang sức bạc c&oacute; thể mang cảm hứng rất viễn tưởng, đậm m&agrave;u sắc c&ocirc;ng nghệ cao, cũng c&oacute; thể rất bay bổng v&agrave; mang hơi hướng của n&uacute;i rừng. Ngo&agrave;i việc gi&uacute;p tiết kiệm rất nhiều chi ph&iacute;, th&igrave; đeo trang sức bạc thay cho trang sức v&agrave;ng c&ograve;n đem lại cả lợi &iacute;ch sức khỏe, v&agrave; tất nhi&ecirc;n l&agrave; cộng điểm phong c&aacute;ch.&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	1. V&ograve;ng tay bạc</div>
<div>
	<img alt="Vàng đã hết thời – Trang sức bạc lên ngôi" src="http://thumb.connect360.vn/unsafe/0x0/imgs.emdep.vn/Share/Image/2015/07/09/xu-huong-trang-suc-bac-2015-em-dep-1-134504585.jpg" /></div>
<div>
	Hai xu hướng v&ograve;ng tay bạc đang được y&ecirc;u th&iacute;ch, l&agrave; những chiếc v&ograve;ng tay bản dẹt, v&agrave; những chiếc d&acirc;y x&iacute;ch uốn lượn quanh cổ tay. C&oacute; một ấn tượng khiến cho những chiếc v&ograve;ng tay bạc bất ngờ được ưa th&iacute;ch giữa cơn b&atilde;o xu hướng &aacute;nh v&agrave;ng, đ&oacute; l&agrave; v&ograve;ng tay m&agrave;u bạc tạo cảm gi&aacute;c rắn rỏi hơn cho những đ&ocirc;i tay. Ch&iacute;nh v&igrave; thế, n&oacute; l&agrave; lựa chọn l&yacute; tưởng cho c&aacute;c c&ocirc; g&aacute;i năng động, cầu tiến v&agrave; quyết đo&aacute;n.</div>
<div>
	<img alt="Vàng đã hết thời – Trang sức bạc lên ngôi" src="http://thumb.connect360.vn/unsafe/0x0/imgs.emdep.vn/Share/Image/2015/07/09/xu-huong-trang-suc-bac-2015-em-dep-2-134522354.jpg" /></div>
<div>
	<div>
		<img alt="Vàng đã hết thời – Trang sức bạc lên ngôi" src="http://thumb.connect360.vn/unsafe/0x0/imgs.emdep.vn/Share/Image/2015/07/09/xu-huong-trang-suc-bac-2015-em-dep-3-134530684.jpg" /></div>
	<div>
		V&ograve;ng tay bạc dạng d&acirc;y x&iacute;ch c&oacute; thể được đeo k&egrave;m với đồng hồ m&agrave;u bạc kim loại.</div>
	<div>
		<div>
			<img alt="Vàng đã hết thời – Trang sức bạc lên ngôi" src="http://thumb.connect360.vn/unsafe/0x0/imgs.emdep.vn/Share/Image/2015/07/09/xu-huong-trang-suc-bac-2015-em-dep-4-134539639.jpg" /></div>
		<div>
			Những kiểu v&ograve;ng dạng bản dẹt rất được ưa chuộng, giống như một phần của cổ tay &aacute;o, tạo cảm gi&aacute;c hiện đại v&agrave; b&iacute; ẩn.&nbsp;</div>
		<div>
			<div>
				<img alt="Vàng đã hết thời – Trang sức bạc lên ngôi" src="http://thumb.connect360.vn/unsafe/0x0/imgs.emdep.vn/Share/Image/2015/07/09/xu-huong-trang-suc-bac-2015-em-dep-5-134553804.PNG" /></div>
			<div>
				<div>
					<img alt="Vàng đã hết thời – Trang sức bạc lên ngôi" src="http://thumb.connect360.vn/unsafe/0x0/imgs.emdep.vn/Share/Image/2015/07/09/xu-huong-trang-suc-bac-2015-em-dep-6-134602243.jpg" /></div>
				<div>
					V&ograve;ng tay bạc h&igrave;nh rắn tiếp tục l&agrave; lựa chọn của c&aacute;c qu&yacute; c&ocirc; gợi cảm v&agrave; quyết đo&aacute;n.</div>
				<div>
					<div>
						<img alt="Vàng đã hết thời – Trang sức bạc lên ngôi" src="http://thumb.connect360.vn/unsafe/0x0/imgs.emdep.vn/Share/Image/2015/07/09/xu-huong-trang-suc-bac-2015-em-dep-7-134612071.jpg" /></div>
					<div>
						&nbsp;</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div>
	2. Khuy&ecirc;n tai bạc</div>
<div>
	<img alt="Vàng đã hết thời – Trang sức bạc lên ngôi" src="http://thumb.connect360.vn/unsafe/0x0/imgs.emdep.vn/Share/Image/2015/07/09/xu-huong-trang-suc-bac-2015-em-dep-8-134633833.jpg" /></div>
<div>
	Khuy&ecirc;n tai bạc dạng chuỗi tạo vẻ nữ t&iacute;nh, hợp với c&aacute;c trang phục kiểu bohemian.</div>
<div>
	Sự l&atilde;ng mạn của những đ&ocirc;i khuy&ecirc;n tai bạc khiến ch&uacute;ng bắt đầu được ch&uacute; &yacute; trong c&aacute;c tiệm trang sức. Khuy&ecirc;n tai bạc kh&ocirc;ng lấp l&aacute;nh tỏa s&aacute;ng như khuy&ecirc;n tai v&agrave;ng, nhưng kh&oacute; c&oacute; thể phủ nhận l&agrave; ch&uacute;ng nữ t&iacute;nh hơn, d&ugrave; được thiết kế theo kiểu d&aacute;ng n&agrave;o đi chăng nữa. Chất liệu bạc đem đến một cảm nhận h&agrave;i h&ograve;a giữa kết cấu v&agrave; &yacute; tưởng, n&ecirc;n những chiếc khuy&ecirc;n tai được thiết kế mỏng manh nhất nh&igrave;n vẫn rất vững v&agrave;ng, trong khi những đ&ocirc;i khuy&ecirc;n được đ&uacute;c d&agrave;y vu&ocirc;ng vắn nh&igrave;n vẫn c&oacute; độ uyển chuyển. Khuy&ecirc;n tai bạc dễ kết hợp với nhiều kiểu trang phục, bao gồm cả v&aacute;y cưới v&agrave; đồ dạ hội. Trong những ng&agrave;y n&oacute;ng gay gắt, đeo một đ&ocirc;i khuy&ecirc;n tai bạc c&oacute; lẽ cũng khiến bạn cảm thấy dịu trời hơn l&agrave; chọn m&agrave;u v&agrave;ng ch&oacute;i lọi.</div>
<div>
	<img alt="Vàng đã hết thời – Trang sức bạc lên ngôi" src="http://thumb.connect360.vn/unsafe/0x0/imgs.emdep.vn/Share/Image/2015/07/09/xu-huong-trang-suc-bac-2015-em-dep-9-134649558.jpg" /></div>
<div>
	<div>
		<img alt="Vàng đã hết thời – Trang sức bạc lên ngôi" src="http://thumb.connect360.vn/unsafe/0x0/imgs.emdep.vn/Share/Image/2015/07/09/xu-huong-trang-suc-bac-2015-em-dep-10-134659558.jpg" /></div>
	<div>
		<div>
			<img alt="Vàng đã hết thời – Trang sức bạc lên ngôi" src="http://thumb.connect360.vn/unsafe/0x0/imgs.emdep.vn/Share/Image/2015/07/09/xu-huong-trang-suc-bac-2015-em-dep-11-134714627.jpg" /></div>
		<div>
			<div>
				<img alt="Vàng đã hết thời – Trang sức bạc lên ngôi" src="http://thumb.connect360.vn/unsafe/0x0/imgs.emdep.vn/Share/Image/2015/07/09/xu-huong-trang-suc-bac-2015-em-dep-12-134731413.jpg" /></div>
			<div>
				&nbsp;</div>
		</div>
	</div>
</div>
<div>
	3. Nhẫn bạc</div>
<div>
	<img alt="Vàng đã hết thời – Trang sức bạc lên ngôi" src="http://thumb.connect360.vn/unsafe/0x0/imgs.emdep.vn/Share/Image/2015/07/09/xu-huong-trang-suc-bac-2015-em-dep-13-13475291.jpg" /></div>
<div>
	Nhẫn bạc bản dẹt kh&ocirc;ng họa tiết l&agrave; lựa chọn v&ocirc; c&ugrave;ng ho&agrave;n hảo cho phong c&aacute;ch menswear.</div>
<div>
	Nguy&ecirc;n tắc đơn giản nhất của năm 2015: Một chiếc nhẫn bạc kh&ocirc;ng bao giờ l&agrave; đủ. H&atilde;y thỏa sức đeo thật nhiều nhẫn theo đ&uacute;ng thỏa nguyện, thậm ch&iacute; đeo đủ cả 10 ng&oacute;n v&agrave; hơn thế nữa, mỗi ng&oacute;n v&agrave;i chiếc nhẫn. Bạn thấy đấy, kh&ocirc;ng thể &aacute;p dụng c&aacute;ch đeo đ&oacute; cho nhẫn v&agrave;ng hay nhẫn đ&aacute; qu&yacute;, trừ khi bạn l&agrave; một c&ocirc; d&acirc;u trong đ&aacute;m cưới lạc hậu hoặc đang muốn thử th&aacute;ch độ an to&agrave;n của đường phố Việt Nam. Sự phối hợp của cả một bộ nhẫn bạc tr&ecirc;n c&aacute;c ng&oacute;n tay gợi n&ecirc;n mộng tưởng về x&uacute;c gi&aacute;c v&ocirc; c&ugrave;ng kho&aacute;i lạc, khơi n&ecirc;n những ẩn &yacute; về t&igrave;nh &aacute;i v&agrave; sự quấn qu&yacute;t, c&ugrave;ng được điều kỳ diệu c&oacute; thể thực hiện bằng mười đầu ng&oacute;n tay. C&oacute; thể khẳng định ngay: Nhẫn bạc năm 2015 chỉ d&agrave;nh cho những c&aacute; t&iacute;nh cực mạnh. Nhẫn bạc thể hiện r&otilde; sức mạnh của nữ quyền, v&agrave; l&agrave; v&ugrave;ng &ldquo;th&aacute;nh địa&rdquo; ri&ecirc;ng d&agrave;nh cho c&aacute;c qu&yacute; c&ocirc; độc th&acirc;n, kh&ocirc;ng vướng bận nhẫn cưới hay nhẫn đ&iacute;nh h&ocirc;n.</div>
<div>
	<img alt="Vàng đã hết thời – Trang sức bạc lên ngôi" src="http://thumb.connect360.vn/unsafe/0x0/imgs.emdep.vn/Share/Image/2015/07/09/xu-huong-trang-suc-bac-2015-em-dep-14-134807855.jpg" /></div>
<div>
	<div>
		<img alt="Vàng đã hết thời – Trang sức bạc lên ngôi" src="http://thumb.connect360.vn/unsafe/0x0/imgs.emdep.vn/Share/Image/2015/07/09/xu-huong-trang-suc-bac-2015-em-dep-15-134848883.jpg" /></div>
	<div>
		<div>
			<img alt="Vàng đã hết thời – Trang sức bạc lên ngôi" src="http://thumb.connect360.vn/unsafe/0x0/imgs.emdep.vn/Share/Image/2015/07/09/xu-huong-trang-suc-bac-2015-em-dep-16-134856121.jpg" /></div>
		<div>
			<div>
				<img alt="Vàng đã hết thời – Trang sức bạc lên ngôi" src="http://thumb.connect360.vn/unsafe/0x0/imgs.emdep.vn/Share/Image/2015/07/09/xu-huong-trang-suc-bac-2015-em-dep-17-134903578.jpg" /></div>
			<div>
				<div>
					<img alt="Vàng đã hết thời – Trang sức bạc lên ngôi" src="http://thumb.connect360.vn/unsafe/0x0/imgs.emdep.vn/Share/Image/2015/07/09/xu-huong-trang-suc-bac-2015-em-dep-18-134918679.jpg" /></div>
			</div>
		</div>
	</div>
</div>
<div>
	&nbsp;</div>
<div>
	4. V&ograve;ng cổ bạc</div>
<div>
	<img alt="Vàng đã hết thời – Trang sức bạc lên ngôi" src="http://thumb.connect360.vn/unsafe/0x0/imgs.emdep.vn/Share/Image/2015/07/09/xu-huong-trang-suc-bac-2015-em-dep-19-13493392.jpg" /></div>
<div>
	V&ograve;ng cổ bạc họa tiết tạo th&ecirc;m dấu ấn c&aacute; t&iacute;nh cho &aacute;o ph&ocirc;ng v&agrave; quần - v&aacute;y da mang phong c&aacute;ch rock-chic.</div>
<div>
	Nếu bạn đ&atilde; sẵn s&agrave;ng để nổi loạn v&agrave; trở th&agrave;nh &ldquo;g&aacute;i hư&rdquo;, h&atilde;y đeo v&ograve;ng cổ bạc. Chất liệu bạc kh&ocirc;ng c&ograve;n được coi l&agrave; &ldquo;dưới cơ&rdquo; so với v&agrave;ng hay bạch kim, m&agrave; n&oacute; cho ph&eacute;p bạn thể hiện tinh thần tự do hơn, v&ocirc; tư hơn, th&aacute;ch thức nhiều s&aacute;ng tạo thiết kế. C&aacute;c họa tiết mang phong c&aacute;ch du mục hay những h&igrave;nh khối cổ điển đều c&oacute; thể được thể hiện dễ d&agrave;ng bằng chất liệu bạc, kh&ocirc;ng đem đến cảm gi&aacute;c g&ograve; b&oacute; hay nặng nề. Bạn cũng c&oacute; thể dễ d&agrave;ng chọn những kiểu v&ograve;ng cổ bạc thiết kế đơn giản cho c&aacute;c trang phục tối giản hay menswear, mang n&eacute;t lạnh l&ugrave;ng v&agrave; rất sắc b&eacute;n. Tho&aacute;t khỏi chất liệu v&agrave;ng truyền thống, bạn sẽ thấy rằng m&igrave;nh c&oacute; thể rũ bỏ h&igrave;nh tượng c&ocirc; n&agrave;ng ham m&ecirc; vật chất điệu đ&agrave; th&iacute;ch khoe mẽ, m&agrave; thể hiện r&otilde; bản chất s&acirc;u sắc v&agrave; c&oacute; phần ngạo nghễ.&nbsp;</div>
<div>
	<img alt="Vàng đã hết thời – Trang sức bạc lên ngôi" src="http://thumb.connect360.vn/unsafe/0x0/imgs.emdep.vn/Share/Image/2015/07/09/xu-huong-trang-suc-bac-2015-em-dep-20-134951033.jpg" /></div>
<div>
	<div>
		<img alt="Vàng đã hết thời – Trang sức bạc lên ngôi" src="http://thumb.connect360.vn/unsafe/0x0/imgs.emdep.vn/Share/Image/2015/07/09/xu-huong-trang-suc-bac-2015-em-dep-21-13500239.jpg" /></div>
	<div>
		<div>
			<img alt="Vàng đã hết thời – Trang sức bạc lên ngôi" src="http://thumb.connect360.vn/unsafe/0x0/imgs.emdep.vn/Share/Image/2015/07/09/xu-huong-trang-suc-bac-2015-em-dep-22-135019207.jpg" /></div>
		<div>
			V&ograve;ng kiềng bạc - một thiết kế cổ truyền - lại được t&aacute;i sinh trong phong c&aacute;ch tối giản hiện đại.</div>
		<div>
			<div>
				<img alt="Vàng đã hết thời – Trang sức bạc lên ngôi" src="http://thumb.connect360.vn/unsafe/0x0/imgs.emdep.vn/Share/Image/2015/07/09/xu-huong-trang-suc-bac-2015-em-dep-23-135029674.jpg" /></div>
			<div>
				D&acirc;y chuyền bạc bản lớn - Trang sức mới d&agrave;nh cho c&aacute;c qu&yacute; c&ocirc; c&ocirc;ng sở.&nbsp;</div>
			<div>
				<div>
					<img alt="Vàng đã hết thời – Trang sức bạc lên ngôi" src="http://thumb.connect360.vn/unsafe/0x0/imgs.emdep.vn/Share/Image/2015/07/09/xu-huong-trang-suc-bac-2015-em-dep-24-135039721.jpg" /></div>
				<div>
					V&ograve;ng cổ bạc h&igrave;nh ngựa gỗ mang &acirc;m hưởng vintage được đeo ngược sau lưng như một ẩn dụ về k&yacute; ức ngọt ng&agrave;o đ&atilde; tr&ocirc;i v&agrave;o dĩ v&atilde;ng.</div>
			</div>
		</div>
	</div>
</div>
<p>
	&nbsp;</p>
', 1, 1)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (56, N'Fanny pack - món đồ yêu thích mới của các nàng sành điệu', N'2017_05_31_22_52_13_590tui5-09271554.jpg', N'Fanny pack - món đồ yêu thích mới của các nàng sành điệu', CAST(N'2017-05-31 00:00:00.000' AS DateTime), 1, N'<p>
	Tr&aacute;i với suy nghĩ của nhiều người, những c&ocirc; n&agrave;ng s&agrave;nh điệu hiện nay đang rất ưa th&iacute;ch chiếc t&uacute;i đeo ngang h&ocirc;ng fanny pack v&ocirc; c&ugrave;ng đơn giản.</p>
<div>
	<p>
		Bạn cho rằng những c&ocirc; g&aacute;i s&agrave;nh điệu lu&ocirc;n &ldquo;t&ocirc;n thờ&rdquo; những chiếc v&aacute;y điệu đ&agrave; hoặc những bộ đồ c&aacute; t&iacute;nh. Ấy vậy kh&ocirc;ng. Thời trang lu&ocirc;n ẩn chứa nhiều điều bất ngờ khiến người ta kh&oacute; l&ograve;ng đo&aacute;n biết được.</p>
	<p>
		Theo tờ Business Insider, những c&ocirc; g&aacute;i thuộc c&aacute;c nh&oacute;m hội nổi tiếng s&agrave;nh điệu ở nhiều trường đại học Mỹ hiện đang &ldquo;ph&aacute;t cuồng&rdquo; với fanny pack &ndash; t&uacute;i đeo ngang h&ocirc;ng. Nhiều c&ocirc;ng ty sản xuất phụ kiện thời trang đ&atilde; nắm bắt xu hướng n&agrave;y với việc sản xuất h&agrave;ng loạt, một số thậm ch&iacute; c&ograve;n sản xuất h&agrave;ng đặt ri&ecirc;ng từ kh&aacute;ch h&agrave;ng. Đại diện của c&ocirc;ng ty thời trang GreekU cho hay: &ldquo;Fanny pack l&agrave; mặt h&agrave;ng sản xuất lớn nhất của c&ocirc;ng ty ch&uacute;ng t&ocirc;i trong năm qua, số h&agrave;ng b&aacute;n ra thậm ch&iacute; tăng hơn 130%&rdquo;.</p>
	<p>
		Thoạt nh&igrave;n qua, những chiếc t&uacute;i đơn giản n&agrave;y tưởng kh&oacute; m&agrave; lọt v&agrave;o &ldquo;mắt xanh&rdquo; của những t&iacute;n đồ thời trang s&agrave;nh điệu. Vậy nhưng qua lời giải th&iacute;ch của c&aacute;c nữ sinh, chiếc t&uacute;i n&agrave;y được ưa th&iacute;ch v&igrave; sự tiện dụng của n&oacute;. C&aacute;c c&ocirc; g&aacute;i kh&ocirc;ng cần phải giữ khư khư chiếc t&uacute;i tr&ecirc;n tay giống như t&uacute;i x&aacute;ch hay v&iacute; cầm tay v&agrave; c&oacute; thể dễ d&agrave;ng điều chỉnh vị tr&iacute; chiếc t&uacute;i sao cho thuận tiện.</p>
	<p>
		Đ&uacute;ng l&agrave; thời trang thật kh&oacute; đo&aacute;n biết. H&atilde;y c&ugrave;ng ng&oacute; qua chiếc t&uacute;i kỳ diệu đang l&agrave; xu hướng của c&aacute;c c&ocirc; n&agrave;ng s&agrave;nh điệu tr&ecirc;n thế giới nh&eacute;!</p>
	<p>
		<a data-index="0" href="http://imgs.emdep.vn/Share/Image/2015/07/07/tui1-092532361.jpg"><img src="http://imgs.emdep.vn/Share/Image/2015/07/07/tui1-092532361.jpg" /></a></p>
	<p>
		<a data-index="1" href="http://imgs.emdep.vn/Share/Image/2015/07/07/tui2-092542532.jpg"><img src="http://imgs.emdep.vn/Share/Image/2015/07/07/tui2-092542532.jpg" /></a></p>
	<p>
		<a data-index="2" href="http://imgs.emdep.vn/Share/Image/2015/07/07/tui3-09255052.jpg"><img src="http://imgs.emdep.vn/Share/Image/2015/07/07/tui3-09255052.jpg" /></a></p>
	<p>
		T&uacute;i denim American Apparel 524.000 VNĐ.</p>
	<p>
		<a data-index="3" href="http://imgs.emdep.vn/Share/Image/2015/07/07/tui4-092613405.jpg"><img src="http://imgs.emdep.vn/Share/Image/2015/07/07/tui4-092613405.jpg" /></a></p>
	<p>
		T&uacute;i da giả đeo ch&eacute;o m&agrave;u navy ASOS 480.000 VNĐ.</p>
	<p>
		<a data-index="4" href="http://imgs.emdep.vn/Share/Image/2015/07/07/tui5-09271554.jpg"><img src="http://imgs.emdep.vn/Share/Image/2015/07/07/tui5-09271554.jpg" /></a></p>
	<p>
		T&uacute;i Nylon Cordura của American Apparel 480.000 VNĐ.</p>
	<p>
		Trang Lưu</p>
	<p>
		Nguồn: Whowhatwear</p>
	<p>
		(Theo Congluan)</p>
</div>
<p>
	&nbsp;</p>
', 1, 1)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (57, N'Các xu hướng thời trang mới 2017', N'2017_05_31_22_53_23_856spring2015attendees1bfj85s8lyx-091245241.jpg', N'Váy maxi trễ vai phất phớt dưới nắng hè, tạo hình ảnh bay bổng và lãng mạn cho các nàng', CAST(N'2017-05-31 00:00:00.000' AS DateTime), 5, N'<div class="breadcrumd-tn">
	<span><a class="active" href="http://netnews.vn/Nguoi-dep.html" title="Người đẹp">Người đẹp </a> </span> <a href="http://netnews.vn/nu-sinh.html"> Nữ sinh </a> <a href="http://netnews.vn/hoa-hau.html"> Hoa hậu </a> <a href="http://netnews.vn/nguoi-mau.html"> Người mẫu </a></div>
<h1 class="tn-detail-h1">
	10 xu hướng thời trang khuynh đảo đường phố London 2015</h1>
<div class="social-detail">
	<p class="left-item-time">
		<span class="sp-time">Chủ nhật, 15/03/2015 14:12</span></p>
</div>
<p>
	<strong><span style="font-family: Times New Roman;">C&aacute;c m&oacute;n đồ của thập ni&ecirc;n 1950, 1970 v&agrave; 1980 lần lượt được c&aacute;c t&iacute;n đồ thời trang Anh phối ho&agrave;n hảo với phong c&aacute;ch hiện đại. </span></strong></p>
<div class="news-other">
	<ul class="chr-ul ul-news-other">
		<li class="chr-li">
			<a class="chr-lnk" href="http://netnews.vn/Xu-huong-troi-day-kieu-moi-cua-Trung-Quoc-trong-nam-2015-quan-su-150-158-623164.html">Xu hướng trỗi dậy &#39;kiểu mới&#39; của Trung Quốc trong năm 2015 </a></li>
		<li class="chr-li">
			<a class="chr-lnk" href="http://netnews.vn/Xu-huong-vay-hoa-cat-laser-lam-xieu-long-my-nhan-Vbiz-nguoi-dep-7-0-516980.html">Xu hướng v&aacute;y hoa cắt laser l&agrave;m xi&ecirc;u l&ograve;ng mỹ nh&acirc;n V-biz </a></li>
		<li class="chr-li">
			<a class="chr-lnk" href="http://netnews.vn/Top-xu-huong-thoi-trang-duoc-sao-Hollywood-chuong-nhat-2014-nguoi-dep-7-0-610367.html">Top xu hướng thời trang được sao Hollywood chuộng nhất 2014 </a></li>
		<li class="chr-li">
			<a class="chr-lnk" href="http://netnews.vn/6-xu-huong-thoi-trang-thong-tri-san-dien-Milan-nguoi-dep-7-0-705003.html">6 xu hướng thời trang thống trị s&agrave;n diễn Milan </a></li>
	</ul>
</div>
<p>
	<img alt="10 xu hướng khuynh đảo đường phố London 2015" src="http://media1.tinngan.vn/archive/images/2015/03/15/120423_1.jpg" style="opacity: 1;" /></p>
<p>
	V&aacute;y ngắn xếp ly của <strong>thập ni&ecirc;n 1980</strong> l&agrave; một trong những xu hướng mặc nổi trội tr&ecirc;n đường phố London trong th&aacute;ng qua.</p>
<p>
	Kiểu d&aacute;ng trẻ trung, dễ mặc gi&uacute;p c&aacute;c c&ocirc; g&aacute;i c&oacute; thể phối linh hoạt với nhiều phong c&aacute;ch, từ back-to-school đến thanh lịch, c&aacute; t&iacute;nh.</p>
<p>
	<img alt="10 xu hướng khuynh đảo đường phố London 2015" src="http://media1.tinngan.vn/archive/images/2015/03/15/120423_2.jpg" style="opacity: 1;" /></p>
<p>
	V&aacute;y liền th&acirc;n cổ điển mang hơi thở thập ni&ecirc;n 1950 l&agrave; sự lựa chọn thứ hai của c&aacute;c t&iacute;n đồ thời trang ở xứ sương m&ugrave;.</p>
<p>
	Việc kết hợp giữa v&aacute;y thời xưa với một đ&ocirc;i gi&agrave;y &aacute;nh bạc hiện đại của thời nay được đ&aacute;nh gi&aacute; cao hơn hẳn so với những set đồ chỉ thi&ecirc;n về một thời kỳ n&agrave;o đ&oacute;.</p>
<p>
	<img alt="10 xu hướng khuynh đảo đường phố London 2015" src="http://media1.tinngan.vn/archive/images/2015/03/15/120423_3.jpg" style="opacity: 1;" /></p>
<p>
	Phong c&aacute;ch tua rua nổi bật trong hơn một năm trở lại đ&acirc;y cho thấy tr&agrave;o lưu hippie vẫn c&oacute; vị thế vững chắc trong l&agrave;ng mốt.</p>
<p>
	Nếu c&aacute;c c&ocirc; g&aacute;i New York mặc theo phong c&aacute;ch n&agrave;y với một kh&ocirc;ng kh&iacute; năng động c&ugrave;ng &aacute;o kho&aacute;c da, quần ống vẩy, gi&agrave;y thể thao... th&igrave; người London lại th&iacute;ch to&aacute;t l&ecirc;n vẻ thanh lịch.</p>
<p>
	Sự hoang d&atilde; của tua rua sẽ được tiết chế bớt với một chiếc &aacute;o sơ mi cổ điển, &aacute;o <a href="http://tinngan.vn/xem.aspx?id=555619&amp;pid=7&amp;cid=0">blazer</a> mẫu mực.</p>
<p>
	<img alt="10 xu hướng khuynh đảo đường phố London 2015" src="http://media1.tinngan.vn/archive/images/2015/03/15/120423_4.jpg" style="opacity: 1;" /></p>
<p>
	&Aacute;o len m&agrave;u x&aacute;m cũng đang l&agrave; sự lựa chọn của nhiều t&iacute;n đồ thời trang tr&ecirc;n thế giới, kh&ocirc;ng ri&ecirc;ng London.</p>
<p>
	Theo tạp ch&iacute; Vogue, c&oacute; đến &#39;50 sắc th&aacute;i x&aacute;m&#39; thể hiện đa dạng tr&ecirc;n c&aacute;c kiểu quần &aacute;o ở<strong> Tuần lễ thời trang</strong> New York Thu Đ&ocirc;ng 2015 vừa qua.</p>
<p>
	Điều n&agrave;y cho thấy, x&aacute;m kh&ocirc;ng chỉ l&agrave; gam hot trong bảng m&agrave;u Xu&acirc;n H&egrave; năm nay m&agrave; n&oacute; c&ograve;n tiếp tục được ưa chuộng đến tận cuối năm.</p>
<p>
	<img alt="10 xu hướng khuynh đảo đường phố London 2015" src="http://media1.tinngan.vn/archive/images/2015/03/15/120423_5.jpg" style="opacity: 1;" /></p>
<p>
	V&aacute;y xẻ t&agrave; gi&uacute;p c&aacute;c c&ocirc; g&aacute;i khoe sự gợi cảm của đ&ocirc;i ch&acirc;n. Bạn c&oacute; thể mặc ch&uacute;ng với &aacute;o sweater, ankle boots, đơn giản nhưng vẫn đẹp mắt, ph&ugrave; hợp trong nhiều ho&agrave;n cảnh d&ugrave; đi l&agrave;m, đi chơi hay tham dự những sự kiện nhỏ.</p>
<p>
	<img alt="10 xu hướng khuynh đảo đường phố London 2015" src="http://media1.tinngan.vn/archive/images/2015/03/15/120423_6.jpg" style="opacity: 1;" /></p>
<p>
	Những chiếc quần s&aacute;ng m&agrave;u ống loe của thập ni&ecirc;n 1970 đang dần trở lại.</p>
<p>
	Để diện mốt n&agrave;y m&agrave; kh&ocirc;ng bị lạc l&otilde;ng giữa những bộ &aacute;o quần hiện đại thời nay, bạn c&oacute; thể kết hợp với &aacute;o sơ mi trắng cổ điển, hoặc &aacute;o viền thể thao, gi&agrave;y đế th&ocirc; hoặc sandals đế b&aacute;nh mỳ, k&iacute;nh mắt s&agrave;nh điệu.</p>
<p>
	<img alt="10 xu hướng khuynh đảo đường phố London 2015" src="http://media1.tinngan.vn/archive/images/2015/03/15/120423_7.jpg" style="opacity: 1;" /></p>
<p>
	Sức mạnh của những bộ suit l&agrave; đề t&agrave;i n&oacute;ng xuất hiện tr&ecirc;n c&aacute;c mặt b&aacute;o của l&agrave;ng mốt.</p>
<p>
	Người Anh vốn lu&ocirc;n coi trọng vẻ đẹp lịch l&atilde;m, sang trọng. Vậy kh&ocirc;ng g&igrave; ho&agrave;n hảo hơn l&agrave; diện một bộ suit kẻ nhẹ nh&agrave;ng, c&aacute; t&iacute;nh tr&ecirc;n phố, c&ugrave;ng những phụ kiện đơn giản. &nbsp;</p>
<p>
	<img alt="10 xu hướng khuynh đảo đường phố London 2015" src="http://media1.tinngan.vn/archive/images/2015/03/15/120423_8.jpg" style="opacity: 1;" /></p>
<p>
	Kaki - mặt h&agrave;ng chủ lực của năm nay - đang g&acirc;y ấn tượng mạnh ở New York v&agrave; London, thể hiện ở <strong>phong c&aacute;ch qu&acirc;n đội</strong>.</p>
<p>
	Để đ&oacute;n đầu xu hướng m&ugrave;a Thu Đ&ocirc;ng tới, h&atilde;y diện một chiếc &aacute;o kho&aacute;c nh&agrave; binh m&agrave;u r&ecirc;u với quần tomboy.</p>
<p>
	<img alt="10 xu hướng khuynh đảo đường phố London 2015" src="http://media1.tinngan.vn/archive/images/2015/03/15/120423_9.jpg" style="opacity: 1;" /></p>
<p>
	Diện cả bộ <strong><a href="http://tinngan.vn/xem.aspx?id=419890&amp;pid=7&amp;cid=843">denim </a></strong>được may đo chuẩn mực l&agrave; c&aacute;ch m&agrave; người Anh th&iacute;ch th&uacute;.</p>
<p>
	Đi theo xu hướng chung của thế giới, thay v&igrave; chọn những bộ denim bụi bặm, mạnh mẽ, c&aacute;c c&ocirc; g&aacute;i nơi đ&acirc;y lại c&oacute; xu hướng chọn những trang phục c&oacute; kiểu d&aacute;ng nữ t&iacute;nh, chất liệu denim được xử l&yacute; trơn mượt.</p>
<p>
	<img alt="10 xu hướng khuynh đảo đường phố London 2015" src="http://media1.tinngan.vn/archive/images/2015/03/15/120423_10.jpg" style="opacity: 1;" /></p>
<p>
	Kh&ocirc;ng giống với Milan hay Paris - nơi những chiếc &aacute;o kho&aacute;c l&ocirc;ng m&agrave;u sắc, hầm hố, dị biệt lu&ocirc;n c&oacute; đất diễn,</p>
<p>
	London l&agrave; cuộc chơi tao nh&atilde; của &aacute;o kho&aacute;c l&ocirc;ng trắng đơn giản nhưng vẫn khiến bao người phải ngo&aacute;i nh&igrave;n.</p>
<p>
	Để l&agrave;m t&ocirc;n m&oacute;n đồ n&agrave;y một c&aacute;ch tối đa, đi theo phong c&aacute;ch <strong>monochrome</strong> l&agrave; sự lựa chọn th&ocirc;ng minh.</p>
', 1, 1)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (58, N'Nữ trang tiết lộ tính cách bạn ', N'2017_05_31_22_54_26_71910.jpg', N'Bạn thuộc tuýp nào? Mê vòng vèo Bohemian, trang sức bạc Thái hay những viên hồng ngọc long lanh rực rỡ? Hãy cẩn thận, chúng sẽ nói với thế giới bạn là ai. ', CAST(N'2017-05-31 00:00:00.000' AS DateTime), 5, N'<div>
	C&ugrave;ng nh&igrave;n lại m&igrave;nh xem bạn thuộc tu&yacute;p n&agrave;o.&nbsp;</div>
<div>
	<img alt="" src="http://thumb.connect360.vn/unsafe/0x0/imgs.emdep.vn/Share/Image/2015/06/25/nu-trang-155421256.jpg" /></div>
', 1, 1)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (59, N'Những đồ chơi nguy hiểm, phụ huynh Việt tuyệt đối không nên mua cho con dịp 1/6', N'2017_05_31_22_56_46_64img0143-172022421.JPG', N'Tâm lý của những ông bố bà mẹ vào dịp Quốc tế thiếu nhi thường là chiều con, chỉ cần con thích món đồ chơi nào thì sẽ mua cho con bằng được.', CAST(N'2017-05-31 00:00:00.000' AS DateTime), 3, N'<p>
	B&oacute;ng bay bơm kh&iacute; hydro</p>
<p>
	<img alt="" src="http://shopbongbay.com/uploads/files/bong-bay-bong-bay-hidro-bong-bay-oxi-bong-bay-tha-tran.jpg" style="width: 501px; height: 414px;" /></p>
<p>
	Chắc hẳn mọi người vẫn chưa qu&ecirc;n được những vụ việc b&oacute;ng bay nổ kinh ho&agrave;ng đ&atilde; từng xảy ra c&aacute;ch đ&acirc;y v&agrave;i th&aacute;ng. Một chiếc xe &ocirc; t&ocirc; đ&atilde; bị vỡ cửa k&iacute;nh do &aacute;p lực từ quả b&oacute;ng bay ph&aacute;t nổ, thậm ch&iacute; một c&ocirc; g&aacute;i trẻ cũng đ&atilde; phải nhập viện v&igrave; bị bỏng khắp mặt do kh&iacute; hydro nổ trước đ&oacute;.</p>
<p>
	Được biết, những quả b&oacute;ng bay thường được bơm bằng kh&iacute; nitơ để đảm bảo an to&agrave;n, nhưng một số tiểu thương lại bơm kh&iacute; hydro v&agrave;o để giảm bớt chi ph&iacute;. Trong khi đ&oacute;, kh&iacute; hydro lại rất dễ ph&aacute;t nổ v&agrave; c&oacute; t&iacute;nh s&aacute;t thương cao, g&acirc;y bỏng nặng. Chỉ cần hai quả b&oacute;ng bay ch&agrave; nhẹ v&agrave;o nhau hoặc vỏ b&oacute;ng bay ma s&aacute;t với mặt phẳng kh&aacute;c cũng c&oacute; thể ph&aacute;t nổ.</p>
<p>
	V&agrave;o những ng&agrave;y lễ như Quốc tế thiếu nhi 1/6 hay tết Trung Thu, tại c&aacute;c khu vui chơi giải tr&iacute; vẫn thường thấy những ch&ugrave;m b&oacute;ng bay nhiều m&agrave;u sắc được b&aacute;n cho trẻ nhỏ. C&aacute;c bậc phụ huynh cần hết sức thận trọng khi lựa chọn mua loại đồ chơi n&agrave;y cho con nhỏ.</p>
<p>
	Nếu mua b&oacute;ng bay cho con m&agrave; chưa biết r&otilde; ch&uacute;ng được bơm hơi bằng kh&iacute; g&igrave; th&igrave; n&ecirc;n hạn chế ma s&aacute;t, tuyệt đối đừng để b&oacute;ng v&agrave;o kh&ocirc;ng gian chật hẹp như &ocirc; t&ocirc;. V&igrave; nếu quả b&oacute;ng ph&aacute;t nổ trong kh&ocirc;ng gian hẹp sẽ tạo n&ecirc;n sức &eacute;p rất lớn v&agrave; nguy hiểm.</p>
<p>
	Đồ chơi nhựa kh&ocirc;ng r&otilde; nguồn gốc xuất xứ</p>
<p>
	Hiện nay, ở c&aacute;c khu chợ trời, hay thậm ch&iacute; l&agrave; lề đường, cổng c&ocirc;ng vi&ecirc;n hay trung t&acirc;m thương mại, c&oacute; rất nhiều người b&aacute;n những m&oacute;n đồ chơi bằng nhựa nhiều m&agrave;u sắc v&agrave; rất bắt mắt d&agrave;nh cho trẻ nhưng kh&ocirc;ng r&otilde; nguồn gốc xuất xứ.</p>
<p>
	Mỗi bộ đồ chơi n&agrave;y c&oacute; gi&aacute; kh&aacute; rẻ, từ 20.000 - 50.000/bộ, nhiều mẫu m&atilde;, chủng loại như bộ đồ nấu bếp, b&uacute;p b&ecirc; nhựa, xe &ocirc; t&ocirc;, đồ chơi kh&aacute;m bệnh...</p>
<p>
	Nhiều bậc phụ huynh v&igrave; con đ&ograve;i, gi&aacute; lại rẻ n&ecirc;n &quot;tặc lưỡi&quot; mua cho con m&agrave; kh&ocirc;ng nghĩ đến những hiểm họa r&igrave;nh rập trong những m&oacute;n đồ chơi bằng nhựa n&agrave;y.</p>
<p>
	Thực tế, tr&ecirc;n thị trường hiện nay đang xuất hiện rất nhiều đồ chơi bằng nhựa cho trẻ nhưng lại l&agrave; h&agrave;ng nhập lậu, kh&ocirc;ng c&oacute; nguồn gốc xuất xứ, bao b&igrave; in chằng chịt chữ Trung Quốc.</p>
<p>
	Phần lớn, những loại đồ chơi gi&aacute; rẻ kh&ocirc;ng r&otilde; nguồn gốc đều được l&agrave;m từ nhựa t&aacute;i chế, chứa nhiều chất h&oacute;a học độc hại c&oacute; khả năng g&acirc;y ung thư để l&agrave;m tăng m&agrave;u sắc v&agrave; độ bền.</p>
<p>
	Trong qu&aacute; tr&igrave;nh đ&oacute;ng g&oacute;i, những chất h&oacute;a học n&agrave;y kh&ocirc;ng được tẩy rửa hết, khi trẻ chơi c&oacute; thể dễ d&agrave;ng bị phơi nhiễm những chất độc, g&acirc;y n&ecirc;n những ảnh hưởng nghi&ecirc;m trọng đến sức khỏe của trẻ.&nbsp;</p>
<p>
	Vậy n&ecirc;n, khi mua đồ chơi cho trẻ, c&aacute;c bậc phụ huynh n&ecirc;n ch&uacute; trọng việc t&igrave;m hiểu nguồn gốc xuất xứ của m&oacute;n h&agrave;ng, tr&aacute;nh để trẻ tiếp x&uacute;c với những m&oacute;n đồ chơi kh&ocirc;ng r&otilde; nguồn gốc.</p>
<p>
	Trẻ dưới 3 tuổi kh&ocirc;ng chơi chất nhờn ma qu&aacute;i</p>
<p>
	Chất nhờn ma qu&aacute;i hay c&ograve;n được gọi l&agrave; Slime l&agrave; m&oacute;n đồ chơi xuất hiện ở hầu hết c&aacute;c cổng trường tiểu học v&agrave; THCS. Đ&acirc;y l&agrave; m&oacute;n đồ chơi được quảng c&aacute;o kh&aacute; nhiều l&agrave; c&oacute; khả năng k&iacute;ch th&iacute;ch sự s&aacute;ng tạo của trẻ nhỏ, tạo được nhiều h&igrave;nh th&ugrave; kh&aacute;c nhau, mang nhiều m&agrave;u sắc sặc sỡ, đặc biệt l&agrave; n&oacute; trơn mềm như nước nhưng lại kh&ocirc;ng hề d&iacute;nh ra tay.</p>
<p>
	C&aacute;ch l&agrave;m m&oacute;n đồ chơi n&agrave;y c&ograve;n được đăng tải kh&aacute; nhiều tr&ecirc;n youtube bằng những nguy&ecirc;n liệu sẵn c&oacute; như x&agrave; ph&ograve;ng, hồ nước...</p>
<p>
	Tưởng chừng m&oacute;n đồ chơi n&agrave;y kh&aacute; v&ocirc; hại nhưng thực tế lại kh&aacute; nguy hiểm đối với những trẻ nhỏ, đặc biệt l&agrave; những trẻ dưới 3 tuổi, thường c&oacute; th&oacute;i quen cho đồ chơi v&agrave;o miệng.</p>
<p>
	Chất nhờn ma qu&aacute;i c&oacute; nhiều m&agrave;u sắc n&ecirc;n rất dễ bị nhầm l&agrave; kẹo b&aacute;nh, trong khi đ&oacute;, loại đồ chơi n&agrave;y được l&agrave;m n&ecirc;n từ những chất kh&ocirc;ng thể ăn được.</p>
<p>
	Mặc d&ugrave; hiện nay chưa c&oacute; trường hợp trẻ nhỏ nuốt phải chất nhờn ma qu&aacute;i n&agrave;o được ghi nhận nhưng c&aacute;c bậc phụ huynh cũng kh&ocirc;ng thể chủ quan khi để trẻ chơi một m&igrave;nh với loại đồ chơi n&agrave;y.</p>
<p>
	C&acirc;y thổi bong b&oacute;ng tr&agrave;n ngập phố đi bộ</p>
<p>
	V&agrave;o những ng&agrave;y cuối tuần, tr&ecirc;n phố đi bộ, cứ độ 50m th&igrave; sẽ lại thấy c&oacute; những người rao b&aacute;n c&acirc;y thổi bong b&oacute;ng. Hoặc trong dịp 1/6 n&agrave;y, nếu đến cổng c&aacute;c c&ocirc;ng vi&ecirc;n lớn cũng sẽ thấy những chiếc giỏ đựng đầy c&acirc;y thổi bong b&oacute;ng b&aacute;n cho trẻ em.</p>
<p>
	Những c&acirc;y thổi n&agrave;y d&agrave;i chừng 30 cm, c&oacute; phần tay cầm v&agrave; phần chứa dung dịch để thổi b&oacute;ng. Theo như lời của những người b&aacute;n h&agrave;ng, dung dịch thổi bong b&oacute;ng giống như x&agrave; ph&ograve;ng, nhưng n&oacute; lại c&oacute; độ kết d&iacute;nh cao hơn để tạo được những quả bong b&oacute;ng k&iacute;ch thước lớn.</p>
<p>
	Thực tế, đ&atilde; c&oacute; nhiều trường hợp trẻ nhỏ tại Việt Nam bị bỏng da, da nổi mẩn, ngứa v&igrave; tiếp x&uacute;c với nước x&agrave; ph&ograve;ng thổi bong b&oacute;ng. Dễ thấy những c&acirc;y thổi bong b&oacute;ng được b&aacute;n tr&agrave;n lan tr&ecirc;n thị trường đều kh&ocirc;ng đề r&otilde; nơi sản xuất v&agrave; th&agrave;nh phần tạo n&ecirc;n nước x&agrave; ph&ograve;ng.</p>
<p>
	Một số loại nước x&agrave; ph&ograve;ng thổi bong b&oacute;ng tr&ecirc;n thị trường cũng được cho l&agrave; c&oacute; chứa chất ăn m&ograve;n mạnh, khi tiếp x&uacute;c nhiều với da c&oacute; thể g&acirc;y bỏng. Trong khi đ&oacute;, rất nhiều trẻ nhỏ khi thổi bong b&oacute;ng thường d&ugrave;ng tay kh&ocirc;ng để đập bể bong b&oacute;ng hoặc để người hứng nước từ bong b&ograve;ng bể rơi xuống.</p>
<p>
	Da trẻ nhỏ c&ograve;n kh&aacute; non nớt n&ecirc;n rất dễ bị tổn thương khi tiếp x&uacute;c nhiều với nước x&agrave; ph&ograve;ng. C&aacute;c bậc phụ huynh tuyệt đối kh&ocirc;ng n&ecirc;n chủ quan khi mua cho trẻ loại đồ chơi n&agrave;y v&agrave; n&ecirc;n vệ sinh da tay, da cơ thể trẻ tiếp x&uacute;c với nước x&agrave; ph&ograve;ng thật sạch sẽ sau khi chơi để tr&aacute;nh bị dị ứng, bỏng.</p>
<p>
	C&aacute;c loại n&aacute; cao su, s&uacute;ng bắn đạn nhựa</p>
<p>
	Những năm gần đ&acirc;y, t&igrave;nh trạng c&aacute;c cửa h&agrave;ng b&aacute;n c&aacute;c loại đồ chơi mang t&iacute;nh bạo lực như n&aacute; cao su, s&uacute;ng nhựa b&aacute;n đạn nhựa, đạn xốp, đạn bi... đều đ&atilde; giảm đi rất nhiều. Bởi lẽ những mặt h&agrave;ng mang t&iacute;nh bạo lực n&agrave;y đều đang được c&aacute;c cơ quan quản l&yacute; hạn chế hết sức, tr&aacute;nh ảnh hưởng đến t&acirc;m l&yacute; của trẻ nhỏ.</p>
<p>
	Tuy nhi&ecirc;n, những mặt h&agrave;ng n&agrave;y lại được b&aacute;n rất nhiều tr&ecirc;n c&aacute;c trang mua h&agrave;ng online. Hiển nhi&ecirc;n, nhiều &ocirc;ng bố b&agrave; mẹ v&igrave; chiều con n&ecirc;n cũng t&igrave;m mua cho con chơi m&agrave; kh&ocirc;ng nghĩ đến hậu quả.</p>
<p>
	C&aacute;c loại s&uacute;ng nhựa bắn c&aacute;c loại đạn hay c&aacute;c loại n&aacute; cao su khi quảng c&aacute;o đều được cho l&agrave; an to&agrave;n đối với trẻ, được l&agrave;m từ chất liệu tốt v&agrave; bền, d&agrave;nh cho trẻ 7 tuổi trở l&ecirc;n, kh&ocirc;ng sử dụng pin m&agrave; hoạt động dưới dạng cơ học.</p>
<p>
	Loại đạn được khuyến kh&iacute;ch sử dụng l&agrave; đạn xốp, nghe t&ecirc;n loại đạn n&agrave;y tưởng chừng như v&ocirc; hại nhưng khi bắn ra ch&uacute;ng vẫn c&oacute; t&iacute;nh s&aacute;t thương. Nếu bắn ở cự ly gần th&igrave; nguy cơ tổn thương mắt l&agrave; rất lớn, trong khi đ&oacute; loại đồ chơi n&agrave;y kh&ocirc;ng được b&aacute;n k&egrave;m với mặt nạ, nếu để trẻ chơi m&agrave; kh&ocirc;ng c&oacute; kiểm so&aacute;t sẽ rất nguy hiểm cho cả trẻ lẫn người xung quanh.</p>
', 1, 5)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (60, N'Mẹo chuyển tiền rẻ nhất “cứu nguy” người thân, bạn bè.', N'2017_05_31_22_58_41_955dich-vu-li-xi-cua-viettel-1-155357542.jpg', N'Mẹo chuyển tiền rẻ nhất “cứu nguy” người thân, bạn bè.', CAST(N'2017-05-31 00:00:00.000' AS DateTime), 4, N'<div class="vbbox-selectcontent2">
	<div>
		Trong những ng&agrave;y Tết Nguy&ecirc;n Đ&aacute;n 2017 n&agrave;y, nếu c&oacute; nhu cầu chuyển tiền cho người th&acirc;n, bạn b&egrave; v&igrave; lỡ qu&ecirc;n mua thẻ hoặc &ldquo;cứu nguy&rdquo; v&igrave; một l&yacute; do kh&aacute;c, bạn ho&agrave;n to&agrave;n c&oacute; thể tận dụng triệt để mẹo thiết thực sau! Được biết, đ&acirc;y cũng l&agrave; c&aacute;ch m&agrave; c&aacute;c cư d&acirc;n mạng đang rầm rộ chia sẻ truyền tay nhau b&iacute; k&iacute;p cực hay v&agrave; tiết kiệm n&agrave;y. Theo đ&oacute;, bạn c&oacute; thể dễ d&agrave;ng thực hiện chuyển tiền Mobifone cho thu&ecirc; bao kh&aacute;c c&ugrave;ng mạng để &ldquo;cứu nguy&rdquo; trong những trường hợp cấp thiết. Thay v&igrave; nạp card, để gi&uacute;p bạn b&egrave;, người th&acirc;n, bạn ho&agrave;n to&agrave;n c&oacute; thể gi&uacute;p đỡ họ bằng c&aacute;ch chuyển tiền từ t&agrave;i khoản ch&iacute;nh của m&igrave;nh sang t&agrave;i khoản ch&iacute;nh thu&ecirc; bao đ&oacute; th&ocirc;ng qua dịch vụ L&igrave; x&igrave; chuyển tiền an to&agrave;n của Mobifone. Dịch vụ L&igrave; x&igrave; n&agrave;y của Mobifone được thực hiện qua đầu số 9368 với khuyến m&atilde;i giảm ph&iacute; chuyển tiền. Thay v&igrave; nạp card, để gi&uacute;p bạn b&egrave;, người th&acirc;n, bạn ho&agrave;n to&agrave;n c&oacute; thể gi&uacute;p đỡ họ bằng c&aacute;ch chuyển tiền từ t&agrave;i khoản ch&iacute;nh của m&igrave;nh sang t&agrave;i khoản ch&iacute;nh thu&ecirc; bao đ&oacute; th&ocirc;ng qua dịch vụ L&igrave; x&igrave; chuyển tiền. Ảnh minh họa. Thực tế, hẳn bạn cũng biết, đối với c&aacute;c dịch vụ chuyển tiền giữa c&aacute;c thu&ecirc; bao của nh&agrave; mạng Mobifone v&agrave; cả Vinaphone đều c&oacute; mức ph&iacute; &ldquo;s&agrave;n&rdquo; khi chuyển tiền l&agrave; 15% gi&aacute; trị giao dịch/01 lần giao dịch. Nhưng với dịch vụ L&igrave; x&igrave; n&agrave;y của Mobifone sẽ cực kỳ hữu &iacute;ch với nhiều người c&oacute; nhu cầu chuyển tiền trong dịp Tết Nguy&ecirc;n Đ&aacute;n. Theo đ&oacute;, sử dụng dịch vụ L&igrave; x&igrave; sẽ gi&uacute;p tiết kiệm giảm mức ph&iacute; xuống c&ograve;n 10% gi&aacute; trị giao dịch/ 01 lần giao dịch v&agrave;o c&aacute;c ng&agrave;y 25/01/2016 - 02/02/2017, 10/02/2017 - 15/02/2017 v&agrave; 01/03/2017-09/03/2017 tương ứng với c&aacute;c dịp Tết Nguy&ecirc;n Đ&aacute;n, Valentines v&agrave; ng&agrave;y Quốc tế Phụ nữ 08/03. Ngo&agrave;i được hưởng mức ph&iacute; gi&aacute; rẻ khi chuyển tiền, những người sử dụng dịch vụ n&agrave;y c&ograve;n c&oacute; th&ecirc;m cơ hội tr&uacute;ng thưởng dựa tr&ecirc;n số tiền chuyển đến bạn b&egrave;, người th&acirc;n. Cụ thể, nếu lọt Top 5 thu&ecirc; bao c&oacute; số tiền chuyển cao nhất tuần, bạn sẽ c&oacute; cơ hội nhận được thẻ nạp bằng 10% tổng số tiền đ&atilde; chuyển th&agrave;nh c&ocirc;ng trong tuần. Điều n&agrave;y c&oacute; nghĩa, bạn ho&agrave;n to&agrave;n kh&ocirc;ng mất khoản ph&iacute; n&agrave;o. Hay trong dịp Tết Nguy&ecirc;n Đ&aacute;n, Valetine v&agrave; Quốc tế Phụ nữ 08/03 nếu bạn nằm trong Top 6 đến Top 35 tuần (Top 5 đ&atilde; c&oacute; phần thưởng như đ&atilde; n&oacute;i ở tr&ecirc;n) bạn sẽ được tặng thẻ 50.000 đồng. Đ&acirc;y thực sự l&agrave; một cơ hội hiếm c&oacute; m&agrave; nh&agrave; mạng d&agrave;nh tặng cho kh&aacute;ch h&agrave;ng dịp n&agrave;y.</div>
</div>
<p>
	&nbsp;</p>
', 1, 5)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (61, N'4 chính sách thiết thực có hiệu lực từ tháng 3 ai cũng nên biết', N'2017_05_31_23_00_09_429photo-0-1488245840321-090404407.jpg', N'4 chính sách thiết thực có hiệu lực từ tháng 3 ai cũng nên biết', CAST(N'2017-05-31 00:00:00.000' AS DateTime), 2, N'<h2 data-field="sapo">
	Từ th&aacute;ng 3, nhiều thủ tục h&agrave;nh ch&iacute;nh trong lĩnh vực đất đai sẽ giảm một nửa hoặc 1/3 thời gian so với quy định trước đ&acirc;y.</h2>
<div data-field="body">
	<p>
		Cấp sổ đỏ trong 15 ng&agrave;y</p>
	<div type="Photo">
		<div>
			<img alt="
Từ 3/3, thời gian cấp sổ đỏ không được quá 15 ngày
" data-original="http://giadinh.vcmedia.vn/2017/photo-0-1488245718623.jpg" id="img_0d7b7bb0-fd56-11e6-896b-17b31d47e829" rel="http://giadinh.vcmedia.vn/2017/photo-0-1488245718623.jpg" src="http://giadinh.vcmedia.vn/2017/photo-0-1488245718623.jpg" type="photo" /></div>
		<div>
			<p>
				Từ 3/3, thời gian cấp sổ đỏ kh&ocirc;ng được qu&aacute; 15 ng&agrave;y</p>
		</div>
	</div>
	<p>
		Cụ thể, việc đăng k&yacute;, cấp giấy chứng nhận quyền sử dụng đất (sổ đỏ), quyền sở hữu nh&agrave; ở v&agrave; t&agrave;i sản kh&aacute;c gắn liền với đất cho người nhận chuyển nhượng sổ đỏ v&agrave; quyền sở hữu nh&agrave; ở, c&ocirc;ng tr&igrave;nh x&acirc;y dựng của tổ chức đầu tư x&acirc;y dựng l&agrave; kh&ocirc;ng qu&aacute; 15 ng&agrave;y (quy định cũ l&agrave; 30 ng&agrave;y).</p>
	<p>
		Việc đăng k&yacute;, cấp sổ đỏ, quyền sở hữu nh&agrave; ở v&agrave; t&agrave;i sản kh&aacute;c gắn liền với đất bổ sung đối với t&agrave;i sản gắn liền với đất cũng giảm xuống c&ograve;n 15 ng&agrave;y thay v&igrave; 20 ng&agrave;y như trước.</p>
	<p>
		Ri&ecirc;ng, thủ tục cấp lại sổ đỏ, giấy chứng nhận quyền sở hữu nh&agrave; ở, giấy chứng nhận quyền sở hữu c&ocirc;ng tr&igrave;nh x&acirc;y dựng bị mất giảm 2/3 thời gian, xuống c&ograve;n 10 ng&agrave;y thay v&igrave; 30 ng&agrave;y.</p>
	<p>
		Theo Nghị định 01/2017/NĐ-CP (c&oacute; hiệu lực từ ng&agrave;y 03/3/2017) sửa đổi, bổ sung một số Nghị định quy định chi tiết thi h&agrave;nh Luật đất đai gồm: Nghị định 43/2014/NĐ-CP, Nghị định 44/2014/NĐ-CP, Nghị định 47/2014/NĐ-CP đ&atilde; bổ sung một số quy định về đất đai như:</p>
	<p>
		Thu hồi đất đối với trường hợp: Kh&ocirc;ng thực hiện nghĩa vụ của người sử dụng đất hoặc thực hiện kh&ocirc;ng đầy đủ nghĩa vụ nộp tiền sử dụng đất, tiền thu&ecirc; đất đ&atilde; bị cưỡng chế thực hiện nghĩa vụ t&agrave;i ch&iacute;nh nhưng kh&ocirc;ng chấp h&agrave;nh; Chấm dứt hoạt động của dự &aacute;n đầu tư.</p>
	<p>
		Cấp Giấy chứng nhận quyền sử dụng đất, quyền sở hữu nh&agrave; ở v&agrave; t&agrave;i sản kh&aacute;c gắn liền với đất đối với diện t&iacute;ch đất tăng th&ecirc;m so với giấy tờ về quyền sử dụng đất cho hộ gia đ&igrave;nh, c&aacute; nh&acirc;n đang sử dụng đất.</p>
	<p>
		Cho thu&ecirc; t&agrave;i sản gắn liền với đất thu&ecirc;, đất thu&ecirc; lại trả tiền thu&ecirc; đất h&agrave;ng năm.</p>
	<p>
		Trẻ đủ 15 tuổi được mở t&agrave;i khoản thanh to&aacute;n kh&ocirc;ng cần t&agrave;i sản ri&ecirc;ng</p>
	<div type="Photo">
		<div>
			<img alt="
Trẻ em được đứng tên sở hữu thẻ ngân hàng thanh toán
" data-original="http://giadinh.vcmedia.vn/2017/photo-0-1488245789479.jpg" id="img_37e46ab0-fd56-11e6-af85-a114006b5426" rel="http://giadinh.vcmedia.vn/2017/photo-0-1488245789479.jpg" src="http://giadinh.vcmedia.vn/2017/photo-0-1488245789479.jpg" type="photo" /></div>
		<div>
			<p>
				Trẻ em được đứng t&ecirc;n sở hữu thẻ ng&acirc;n h&agrave;ng thanh to&aacute;n</p>
		</div>
	</div>
	<p>
		Đ&acirc;y l&agrave; nội dung mới được quy định tại Th&ocirc;ng tư 32/2016/TT-NHNN (c&oacute; hiệu lực từ ng&agrave;y 01/03/2017) sửa đổi Th&ocirc;ng tư 23/2014/TT-NHNN hướng dẫn việc mở v&agrave; sử dụng t&agrave;i khoản thanh to&aacute;n tại tổ chức cung ứng dịch vụ thanh to&aacute;n.</p>
	<p>
		Theo đ&oacute;, sửa đổi, bổ sung đối tượng l&agrave; c&aacute; nh&acirc;n được mở t&agrave;i khoản thanh to&aacute;n tại ng&acirc;n h&agrave;ng, chi nh&aacute;nh ng&acirc;n h&agrave;ng nước ngo&agrave;i như sau:</p>
	<p>
		Người từ đủ 15 tuổi đến chưa đủ 18 tuổi kh&ocirc;ng bị mất hoặc hạn chế năng lực h&agrave;nh vi d&acirc;n sự (kh&ocirc;ng y&ecirc;u cầu c&oacute; t&agrave;i sản ri&ecirc;ng bảo đảm thực hiện nghĩa vụ trong việc mở t&agrave;i khoản thanh to&aacute;n như quy định hiện h&agrave;nh);</p>
	<p>
		Bổ sung th&ecirc;m đối tượng l&agrave; người c&oacute; kh&oacute; khăn trong nhận thức, l&agrave;m chủ h&agrave;nh vi theo quy định của ph&aacute;p luật Việt Nam mở t&agrave;i khoản thanh to&aacute;n th&ocirc;ng qua người gi&aacute;m hộ.</p>
	<p>
		Kh&ocirc;ng giới hạn nguyện vọng x&eacute;t tuyển đại học</p>
	<div type="Photo">
		<div>
			<img alt="
Thí sinh sẽ không bị giới hạn nguyện vọng xét tuyển đại học trong năm 2017.
" data-original="http://giadinh.vcmedia.vn/2017/photo-0-1488245840321.jpg" id="img_56059500-fd56-11e6-af85-a114006b5426" rel="http://giadinh.vcmedia.vn/2017/photo-0-1488245840321.jpg" src="http://giadinh.vcmedia.vn/2017/photo-0-1488245840321.jpg" type="photo" /></div>
		<div>
			<p>
				Th&iacute; sinh sẽ kh&ocirc;ng bị giới hạn nguyện vọng x&eacute;t tuyển đại học trong năm 2017.</p>
		</div>
	</div>
	<p>
		Ng&agrave;y 25/1, Bộ Gi&aacute;o dục v&agrave; Đ&agrave;o tạo ban h&agrave;nh Th&ocirc;ng tư 04/2017/TT-BGDĐT về quy chế thi THPT quốc gia, x&eacute;t c&ocirc;ng nhận tốt nghiệp THPT v&agrave; Th&ocirc;ng tư 05/2017/TT-BGDĐT về quy chế tuyển sinh đại học hệ ch&iacute;nh quy, tuyển sinh cao đẳng nh&oacute;m ng&agrave;nh đ&agrave;o tạo gi&aacute;o vi&ecirc;n hệ ch&iacute;nh quy.</p>
	<p>
		Theo đ&oacute;, Quy chế thi THPT v&agrave; x&eacute;t tuyển đại học trong năm 2017 c&oacute; nhiều điểm mới đ&aacute;ng ch&uacute; &yacute; như:</p>
	<p>
		Thay đổi về số lượng b&agrave;i thi THPT (05 b&agrave;i thi thay v&igrave; tổ chức 8 m&ocirc;n thi như trước đ&acirc;y). Th&ocirc;ng tư 04 quy định: 03 b&agrave;i thi độc lập:To&aacute;n, Ngoại ngữ, Ngữ văn.</p>
	<p>
		02 b&agrave;i thi tổ hợp, trong đ&oacute;: 01 b&agrave;i thi Khoa học Tự nhi&ecirc;n gồm tổ hợp c&aacute;c m&ocirc;n Vật l&iacute;, H&oacute;a học, Sinh học;</p>
	<p>
		01 b&agrave;i thi Khoa học X&atilde; hội gồm tổ hợp c&aacute;c m&ocirc;n Lịch sử, Địa l&iacute;, Gi&aacute;o dục c&ocirc;ng d&acirc;n đối với th&iacute; sinh học chương tr&igrave;nh Gi&aacute;o dục THPT; tổ hợp c&aacute;c m&ocirc;n Lịch sử, Địa l&iacute; đối với th&iacute; sinh học chương tr&igrave;nh gi&aacute;o dục thường xuy&ecirc;n cấp THPT.</p>
	<p>
		Kh&ocirc;ng giới hạn nguyện vọng x&eacute;t tuyển đại học 2017. Theo Th&ocirc;ng tư 05, th&iacute; sinh được đăng k&yacute; x&eacute;t tuyển kh&ocirc;ng giới hạn số nguyện vọng, số trường v&agrave; nguyện vọng sắp xếp theo thứ tự ưu ti&ecirc;n từ cao xuống thấp.</p>
	<p>
		Th&ocirc;ng tư 04/2017/TT-BGDĐT v&agrave; Th&ocirc;ng tư 05/2017/TT-BGDĐT c&oacute; hiệu lực từ ng&agrave;y 10/3/2017</p>
	<p>
		50 km cao tốc phải c&oacute; một trạm cấp cứu</p>
	<p>
		Th&ocirc;ng tư số 49/2016 của Bộ Y tế quy định về tổ chức v&agrave; hoạt động cấp cứu tai nạn giao th&ocirc;ng tr&ecirc;n đường bộ cao tốc.</p>
	<p>
		Theo đ&oacute;, hoạt động cấp cứu tai nạn giao th&ocirc;ng phải bảo đảm nguy&ecirc;n tắc nhanh ch&oacute;ng, kịp thời v&agrave; hiệu quả để cấp cứu v&agrave; vận chuyển kịp thời nạn nh&acirc;n đến cơ sở kh&aacute;m bệnh, chữa bệnh gần nhất.</p>
	<p>
		Mạng lưới cơ sở phục vụ hoạt động cứu nạn tr&ecirc;n cao tốc bao gồm c&aacute;c trạm cấp cứu, được tổ chức như sau:</p>
	<p>
		Trạm cấp cứu được tổ chức lồng gh&eacute;p với cơ sở kh&aacute;m bệnh, chữa bệnh c&oacute; sẵn tr&ecirc;n tuyến đường cao tốc đi qua bao gồm trạm y tế x&atilde;/phường; trung t&acirc;m y tế quận/huyện c&oacute; chức năng kh&aacute;m bệnh, chữa bệnh; trung t&acirc;m cấp cứu 115; bệnh viện nh&agrave; nước v&agrave; bệnh viện tư nh&acirc;n.</p>
	<p>
		Tối thiểu, 50 km đường bộ cao tốc phải c&oacute; một trạm cấp cứu. Th&ocirc;ng tư n&agrave;y c&oacute; hiệu lực từ 1/3.</p>
</div>
<p>
	&nbsp;</p>
', 1, 5)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (62, N'Cô gái nổi giận vì được cầu hôn bằng... xe hơi, sổ đỏ', N'2017_05_31_23_01_59_738cau-hon-bi-tu-choi-1-181250382.jpg', N'Cô gái nổi giận vì được cầu hôn bằng... xe hơi, sổ đỏ', CAST(N'2017-05-31 00:00:00.000' AS DateTime), 3, N'<p>
	Theo Sina, sự việc diễn ra ở b&ecirc;n ngo&agrave;i cổng Văn miếu Đức Dương, thuộc th&agrave;nh phố Đức Dương, tỉnh Tứ Xuy&ecirc;n, Trung Quốc.</p>
<p>
	Một nh&acirc;n chứng kể lại, ch&agrave;ng trai cầm b&oacute; hoa to, quỳ gối n&oacute;i với bạn g&aacute;i: &quot;Anh hy vọng em sẽ đồng &yacute; lấy anh đ&uacute;ng ng&agrave;y Thất Tịch n&agrave;y (7/7 &acirc;m lịch - PV)&quot;.</p>
<p>
	C&ocirc; g&aacute;i vừa bất ngờ, vừa mỉm cười hạnh ph&uacute;c nhận lấy b&oacute; hoa. Những người xung quanh đồng loạt vỗ tay ch&uacute;c mừng t&igrave;nh y&ecirc;u sắp đơm hoa kết tr&aacute;i của của cặp đ&ocirc;i.</p>
<p>
	<a data-index="0" href="http://baomoi-photo-3-td.zadn.vn/16/08/12/265/20072831/1_48193.jpg"><img alt="Co gai noi gian vi duoc cau hon bang... xe hoi, so do - Anh 1" src="http://baomoi-photo-3-td.zadn.vn/w460x/16/08/12/265/20072831/1_48193.jpg" title="Cô gái nổi giận vì được cầu hôn bằng... xe hơi, sổ đỏ - Ảnh 1" /></a></p>
<p>
	C&ocirc; g&aacute;i hạnh ph&uacute;c v&agrave; bất ngờ trước lời cầu h&ocirc;n của bạn trai.</p>
<p>
	Tuy nhi&ecirc;n, niềm vui chẳng được l&acirc;u. Khi ch&agrave;ng trai giơ giấy tờ đất c&ugrave;ng nhẫn ra n&oacute;i tiếp: &quot;Ở đ&acirc;y sổ đỏ, nhẫn c&ugrave;ng ch&igrave;a kh&oacute;a &ocirc; t&ocirc;. Nếu em lấy anh, ng&agrave;y mai to&agrave;n bộ t&agrave;i sản n&agrave;y sẽ được sang t&ecirc;n em&quot;, c&ocirc; g&aacute;i đ&atilde; từ chối v&agrave; dứt kho&aacute;t bỏ đi.</p>
<p>
	C&ocirc; cho biết, hạnh động của bạn trai khiến c&ocirc; cảm thấy v&ocirc; c&ugrave;ng tự &aacute;i, mối t&igrave;nh của họ suốt thời gian qua chỉ duy tr&igrave; nhờ tiền bạc.</p>
<p>
	&quot;&Yacute; anh l&agrave; sao? Bản th&acirc;n t&ocirc;i cũng c&oacute; thể tự mua nh&agrave; mua xe, kh&ocirc;ng cần anh phải sang t&ecirc;n! T&ocirc;i kh&ocirc;ng lấy anh v&igrave; tiền&quot; - c&ocirc; g&aacute;i n&oacute;i rồi bỏ đi, ch&agrave;ng trai cũng lập tức đứng dậy đuổi theo xin lỗi.</p>
<p>
	<a data-index="1" href="http://baomoi-photo-3-td.zadn.vn/16/08/12/265/20072831/2_68055.jpg"><img alt="Co gai noi gian vi duoc cau hon bang... xe hoi, so do - Anh 2" src="http://baomoi-photo-3-td.zadn.vn/w460x/16/08/12/265/20072831/2_68055.jpg" title="Cô gái nổi giận vì được cầu hôn bằng... xe hơi, sổ đỏ - Ảnh 2" /></a></p>
<p>
	Ch&agrave;ng trai giơ sổ đỏ, ch&igrave;a kh&oacute;a xe v&agrave; nhẫn ra cầu h&ocirc;n bạn g&aacute;i.</p>
<p>
	<a data-index="2" href="http://baomoi-photo-3-td.zadn.vn/16/08/12/265/20072831/3_60827.jpg"><img alt="Co gai noi gian vi duoc cau hon bang... xe hoi, so do - Anh 3" src="http://baomoi-photo-3-td.zadn.vn/w460x/16/08/12/265/20072831/3_60827.jpg" title="Cô gái nổi giận vì được cầu hôn bằng... xe hơi, sổ đỏ - Ảnh 3" /></a></p>
<p>
	C&ocirc; g&aacute;i dứt kho&aacute;t từ chối khi bạn trai n&oacute;i sẽ sang t&ecirc;n sổ đỏ ngay lập tức nếu bạn g&aacute;i đồng &yacute; kết h&ocirc;n.</p>
<p>
	Lời tỏ t&igrave;nh bất th&agrave;nh n&agrave;y g&acirc;y ra nhiều tranh c&atilde;i trong cộng đồng mạng. Một số cho rằng c&ocirc; g&aacute;i qu&aacute; nhạy cảm. Nhưng kh&ocirc;ng &iacute;t người đ&atilde; l&ecirc;n tiếng ủng hộ h&agrave;nh động của c&ocirc;.</p>
<p>
	&quot;Cầu h&ocirc;n th&igrave; cầu h&ocirc;n, lại c&ograve;n đưa giấy tờ nh&agrave; ra trao đổi? Anh n&agrave;y định mua vợ &agrave;? T&ocirc;i l&agrave; c&ocirc; ấy t&ocirc;i cũng sẽ từ chối&quot;, một t&agrave;i khoản t&ecirc;n MiZ cho biết.</p>
<p>
	&quot;Anh ch&agrave;ng n&agrave;y thật ngốc, cầu h&ocirc;n cũng kh&ocirc;ng xong!&quot;, Laoshanyang cho hay.</p>
', 1, 4)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (63, N'Xác minh tiểu thương cướp và đe dọa người bán thịt lợn', N'2017_05_31_23_03_34_756page-1496215642581-155159488.jpg', N'Liên quan đến vụ việc trên, trưa 31/5, ông Nguyễn Tiến Lợi, Trưởng Công an xã Tân Lập đã cử lực lượng công an xã xuống xác minh thông tin tiểu thương chợ Tân Lập "cướp" thịt lợn', CAST(N'2017-05-31 00:00:00.000' AS DateTime), 5, N'<p>
	Gần một ng&agrave;y nay, tr&ecirc;n mạng x&atilde; hội x&ocirc;n xao đoạn clip ghi lại h&igrave;nh ảnh 1 nh&oacute;m tiểu thương trong chợ được cho l&agrave; c&oacute; h&agrave;nh vi ngăn cản, kh&ocirc;ng cho một người phụ nữ lớn tuổi b&aacute;n thịt lợn ph&iacute;a ngo&agrave;i chợ T&acirc;n Lập, huyện Đan Phượng, H&agrave; Nội.&nbsp;</p>
<p>
	Cụ thể trong đoạn clip,&nbsp;một người phụ nữ t&ecirc;n Hồng (ở x&atilde; C&aacute;t Quế, huyện Ho&agrave;i Đức, H&agrave; Nội) v&igrave; thịt lợn rẻ kh&ocirc;ng b&aacute;n được n&ecirc;n đ&atilde; tự giết lợn mang ra gần chợ T&acirc;n Lập b&aacute;n. L&uacute;c n&agrave;y 1 nh&oacute;m tiểu thương gồm 4 phụ nữ trẻ tuổi mặc tạp dề lao ra c&atilde;i lộn, đ&ograve;i &quot;cướp&quot; miếng thịt lợn tr&ecirc;n tay người n&agrave;y.&nbsp;</p>
<p>
	Chia sẻ với ch&uacute;ng t&ocirc;i, b&agrave; Hồng cho hay: &quot;Trước đ&oacute;, v&igrave; thịt lợn rẻ t&ocirc;i c&oacute; k&ecirc;u than với v&agrave;i người quen ở T&acirc;n Lập v&agrave; được họ động vi&ecirc;n tự mổ rồi đem ra đ&acirc;y b&aacute;n, họ mua ủng hộ cho. T&ocirc;i cũng b&aacute;n được 3 h&ocirc;m ở đ&acirc;y, đến h&ocirc;m 30/5, t&ocirc;i b&aacute;n c&ograve;n mấy c&acirc;n nữa th&igrave; 4 người phụ nữ t&ocirc;i từng quen biết, b&aacute;n thịt lợn trong chợ T&acirc;n Lập đến đe dọa rồi cướp thịt của t&ocirc;i&quot;.</p>
<div type="Photo">
	<div>
		<a data-fancybox-group="img-lightbox" href="http://kenh14cdn.com/2017/page-1496215642581.jpg" target="_blank" title="Nhóm tiểu thương cướp thịt lợn, đe dọa không cho người phụ nữ bán thịt ở chợ. Ảnh cắt từ clip."><img alt="Xác minh tiểu thương cướp và đe dọa người phụ nữ không được bán thịt lợn ở Hà Nội - Ảnh 2." data-original="http://kenh14cdn.com/2017/page-1496215642581.jpg" id="img_977e3950-45d2-11e7-ab58-03b0b16dc8c3" rel="lightbox" src="http://kenh14cdn.com/2017/page-1496215642581.jpg" title="Xác minh tiểu thương cướp và đe dọa người phụ nữ không được bán thịt lợn ở Hà Nội - Ảnh 2." type="photo" /></a></div>
	<div>
		<p data-placeholder="[nhập chú thích]">
			Nh&oacute;m tiểu thương cướp thịt lợn, đe dọa kh&ocirc;ng cho người phụ nữ b&aacute;n thịt ở chợ. Ảnh cắt từ clip.</p>
	</div>
</div>
<p>
	B&agrave; Hồng kể, l&uacute;c đ&oacute; một người trong nh&oacute;m tiểu thương tr&ecirc;n c&ograve;n cầm miếng thịt lợn đem ra bờ ao định n&eacute;m đi, may m&agrave; b&agrave; giằng lại kịp.&nbsp;Theo b&agrave; Hồng, thịt lợn b&agrave; mang ra b&aacute;n với gi&aacute; 55.000/kg, c&ograve;n trong chợ c&aacute;c tiểu thương kh&aacute;c b&aacute;n 60.000/kg. B&agrave; Hồng cũng lo lắng bởi hiện ở nh&agrave; b&agrave; c&ograve;n hơn 30 con lợn nữa kh&ocirc;ng b&aacute;n được.</p>
<p>
	Li&ecirc;n quan đến vụ việc tr&ecirc;n, trưa 31/5, &ocirc;ng Nguyễn Tiến Lợi, Trưởng C&ocirc;ng an x&atilde; T&acirc;n Lập đ&atilde; cử lực lượng c&ocirc;ng an x&atilde; xuống x&aacute;c minh th&ocirc;ng tin tiểu thương chợ T&acirc;n Lập &quot;cướp&quot; thịt lợn của một người d&acirc;n mang đến b&aacute;n.</p>
<p>
	Theo &ocirc;ng Lợi, x&atilde; cũng chỉ mới nắm được sự việc tr&ecirc;n mạng chứ chưa c&oacute; th&ocirc;ng tin cụ thể. C&ocirc;ng an x&atilde; cũng chưa tiếp nhận đơn tr&igrave;nh b&aacute;o n&agrave;o li&ecirc;n quan đến sự việc. Qua đoạn clip, c&oacute; một số người giống với người d&acirc;n ở địa phương v&agrave; đơn vị sẽ mời những người n&agrave;y đến để x&aacute;c minh.</p>
', 1, 5)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (64, N'Phạm Băng Băng bất ngờ tuyên bố 5 năm nữa sẽ "nghỉ hưu"', N'2017_05_31_23_05_29_864photo-3-1495039866567-1496197892705-135142785.jpg', N' (Emdep.vn) - Đang ở đỉnh cao sự nghiệp, Phạm Băng Băng đã suy nghĩ đến chuyện rời xa làng giải trí và tận hưởng thế giới của mình. ', CAST(N'2017-05-31 00:00:00.000' AS DateTime), 3, N'<h2>
	Đang ở đỉnh cao sự nghiệp, Phạm Băng Băng đ&atilde; suy nghĩ đến chuyện rời xa l&agrave;ng giải tr&iacute; v&agrave; tận hưởng thế giới của m&igrave;nh.</h2>
<p>
	<a href="http://kenh14.vn/pham-bang-bang.html" target="_blank" title="Phạm Băng Băng ">Phạm Băng Băng</a> những năm gần đ&acirc;y trở th&agrave;nh biểu tượng sắc đẹp v&agrave; th&agrave;nh c&ocirc;ng của l&agrave;ng giải tr&iacute; Hoa ngữ. C&ocirc; n&agrave;ng cũng vừa ho&agrave;n th&agrave;nh sứ mệnh ban gi&aacute;m khảo tại LHP Quốc tế Cannes 2017 vừa qua, hơn thế nữa, chuyện t&igrave;nh ngọt ng&agrave;o v&agrave; vi&ecirc;n m&atilde;n với bạn trai L&yacute; Thần cũng khiến cuộc sống của người đẹp ho&agrave;n hảo trong mắt người h&acirc;m mộ.</p>
<div type="Photo">
	<div>
		<a data-fancybox-group="img-lightbox" href="http://kenh14cdn.com/2017/photo-3-1495039866567-1496197892705.jpg" target="_blank" title=""><img alt="Phạm Băng Băng bất ngờ tuyên bố 5 năm nữa sẽ nghỉ hưu để đi du lịch thế giới - Ảnh 1." data-original="http://kenh14cdn.com/2017/photo-3-1495039866567-1496197892705.jpg" id="img_43077040-45a9-11e7-b031-39e7fb22e2f2" rel="lightbox" src="http://kenh14cdn.com/2017/photo-3-1495039866567-1496197892705.jpg" title="Phạm Băng Băng bất ngờ tuyên bố 5 năm nữa sẽ nghỉ hưu để đi du lịch thế giới - Ảnh 1." type="photo" /></a></div>
</div>
<p>
	Tuy nhi&ecirc;n, mới đ&acirc;y nhất, trong một b&agrave;i phỏng vấn với c&aacute;nh ph&oacute;ng vi&ecirc;n trong nước sau khi trở về từ LHP Cannes, mỹ nh&acirc;n họ Phạm bộc bạch c&ocirc; dự định 5 năm nữa (khi tr&ograve;n 40 tuổi), c&ocirc; sẽ &quot;nghỉ hưu&quot;: &quot;Dự dịnh của t&ocirc;i đến năm 40 sẽ kh&ocirc;ng c&ograve;n l&agrave; diễn vi&ecirc;n nữa. Sau đ&oacute; th&igrave; t&ocirc;i sẽ du lịch v&ograve;ng quanh thế giới. T&ocirc;i đ&atilde; d&agrave;nh tất cả thời gian, tư tưởng, cảm nghĩ, tận hưởng mọi thứ của m&igrave;nh trong 40 năm qua v&agrave;o c&ocirc;ng việc hết cả rồi&quot;.</p>
<p>
	N&agrave;ng &quot;V&otilde; Mỵ Nương&quot; bộc bạch: &quot;Rất nhiều người bạn n&oacute;i với t&ocirc;i điều n&agrave;y l&agrave; kh&ocirc;ng thể. Bạn l&agrave; &quot;con nghiện&quot; c&ocirc;ng việc, đi&ecirc;n cuồng v&igrave; c&ocirc;ng việc như thế th&igrave; l&agrave;m sao c&oacute; thể dừng tất cả lại được. T&ocirc;i cũng kh&ocirc;ng biết nữa, tất cả vẫn cần phải suy nghĩ th&ecirc;m&quot;.</p>
<div type="Photo">
	<div>
		<a data-fancybox-group="img-lightbox" href="http://kenh14cdn.com/2017/18620101-1547098985301945-8034029120711912224-n-1496197962057.jpg" target="_blank" title=""><img alt="Phạm Băng Băng bất ngờ tuyên bố 5 năm nữa sẽ nghỉ hưu để đi du lịch thế giới - Ảnh 2." data-original="http://kenh14cdn.com/2017/18620101-1547098985301945-8034029120711912224-n-1496197962057.jpg" id="img_6d5499e0-45a9-11e7-a665-51efb01dc95e" rel="lightbox" src="http://kenh14cdn.com/2017/18620101-1547098985301945-8034029120711912224-n-1496197962057.jpg" title="Phạm Băng Băng bất ngờ tuyên bố 5 năm nữa sẽ nghỉ hưu để đi du lịch thế giới - Ảnh 2." type="photo" /></a></div>
</div>
<p>
	Trở th&agrave;nh nữ diễn vi&ecirc;n kỳ cựu trong nghề, Phạm Băng Băng n&oacute;i m&igrave;nh lu&ocirc;n ủng hộ c&aacute;c đạo diễn trẻ bằng c&aacute;ch tự hạ c&aacute;t-s&ecirc; của ch&iacute;nh m&igrave;nh. C&ocirc; tiết lộ, m&igrave;nh từng quay một bộ phim của đạo diễn trẻ nhưng chỉ nhận c&aacute;t-s&ecirc; đ&uacute;ng 100 ng&agrave;n NDT (khoảng 350 triệu đồng) - một con số qu&aacute; b&eacute; nhỏ so với thu nhập hơn 100 tỷ đồng từ bộ phim &quot;V&otilde; Mỵ Nương truyền kỳ&quot; m&agrave; Phạm Băng Băng từng đ&oacute;ng: &quot;T&ocirc;i nghĩ chuyện tiền nong thực sự kh&ocirc;ng phải l&agrave; thứ t&ocirc;i đặc biệt quan t&acirc;m&quot;.</p>
<div type="Photo">
	<div>
		<a data-fancybox-group="img-lightbox" href="http://kenh14cdn.com/2017/18582099-1546379535373890-1414486009085740431-n-1496197995064.jpg" target="_blank" title=""><img alt="Phạm Băng Băng bất ngờ tuyên bố 5 năm nữa sẽ nghỉ hưu để đi du lịch thế giới - Ảnh 3." data-original="http://kenh14cdn.com/2017/18582099-1546379535373890-1414486009085740431-n-1496197995064.jpg" id="img_809530a0-45a9-11e7-a665-51efb01dc95e" rel="lightbox" src="http://kenh14cdn.com/2017/18582099-1546379535373890-1414486009085740431-n-1496197995064.jpg" title="Phạm Băng Băng bất ngờ tuyên bố 5 năm nữa sẽ nghỉ hưu để đi du lịch thế giới - Ảnh 3." type="photo" /></a></div>
</div>
<p>
	N&oacute;i về chuyện t&igrave;nh của m&igrave;nh với L&yacute; Thần, Phạm Băng Băng kh&ocirc;ng giấu nổi niềm hạnh ph&uacute;c: &quot;Chuyện t&ocirc;i v&agrave; L&yacute; Thần gặp nhau ở Cannes, quả thật khiến t&ocirc;i v&ocirc; c&ugrave;ng bất ngờ. T&ocirc;i thật sự kh&ocirc;ng hề biết anh ấy sẽ đến thăm t&ocirc;i. Rạng s&aacute;ng ng&agrave;y h&ocirc;m đ&oacute;, t&ocirc;i vừa đi xem xong 1 bộ phim, đang chuẩn bị đi ăn s&aacute;ng th&igrave; bất ngờ anh ấy đến. T&ocirc;i sững sờ lu&ocirc;n, như thể bị &quot;đ&oacute;ng băng&quot; vậy. Anh ấy thừa biết t&ocirc;i sẽ kh&ocirc;ng cho anh ấy đến Cannes bởi v&igrave; lịch tr&igrave;nh l&agrave;m việc tại đ&acirc;y v&ocirc; c&ugrave;ng căng thẳng&quot;.</p>
<div type="Photo">
	<div>
		<a data-fancybox-group="img-lightbox" href="http://kenh14cdn.com/2017/18698069-1534902919907545-7696975509059966374-n-1496198067188.jpg" target="_blank" title=""><img alt="Phạm Băng Băng bất ngờ tuyên bố 5 năm nữa sẽ nghỉ hưu để đi du lịch thế giới - Ảnh 4." data-original="http://kenh14cdn.com/2017/18698069-1534902919907545-7696975509059966374-n-1496198067188.jpg" id="img_abb19120-45a9-11e7-b751-fb0ef455be0f" rel="lightbox" src="http://kenh14cdn.com/thumb_w/660/2017/18698069-1534902919907545-7696975509059966374-n-1496198067188.jpg" title="Phạm Băng Băng bất ngờ tuyên bố 5 năm nữa sẽ nghỉ hưu để đi du lịch thế giới - Ảnh 4." type="photo" /></a></div>
</div>
<p>
	&nbsp;</p>
', 1, 6)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (65, N'Lưu Diệc Phi - Song Seung Hun chia tay nhau vì "lệnh cấm Hàn"?', N'2017_05_31_23_06_40_54luudiecphi2-1495887517155-124011093.jpg', N' (Emdep.vn) - Lại thêm một tin đồn nữa về cặp đôi Song Seung Hun - Lưu Diệc Phi, và lần này chính nam tài tử "Trái tim mùa thu" đã lên tiếng bác bỏ. ', CAST(N'2017-05-31 00:00:00.000' AS DateTime), 3, N'<h2>
	Lại th&ecirc;m một tin đồn nữa về cặp đ&ocirc;i Song Seung Hun - Lưu Diệc Phi, v&agrave; lần n&agrave;y ch&iacute;nh nam t&agrave;i tử &quot;Tr&aacute;i tim m&ugrave;a thu&quot; đ&atilde; l&ecirc;n tiếng b&aacute;c bỏ.</h2>
<p>
	Trang Sina đưa tin, gần đ&acirc;y, tr&ecirc;n mạng x&atilde; hội xuất hiện th&ecirc;m tin đồn cặp đ&ocirc;i<a href="http://kenh14.vn/luu-diec-phi-song-seung-hun.html" target="_blank" title="Lưu Diệc Phi - Song Seung Hun"> Lưu Diệc Phi - Song Seung Hun</a> đ&atilde; &quot;đường ai nấy đi&quot; v&igrave; lệnh cấm H&agrave;n qu&aacute; r&aacute;o riết b&ecirc;n Trung. Đ&acirc;y lại l&agrave; một th&ocirc;ng tin nữa tiếp theo tin đồn <a href="http://kenh14.vn/luu-diec-phi-beo-len-trong-thay-lo-vong-2-lon-bat-thuong-vi-mang-bau-voi-song-seung-hun-20170413091551673.chn" target="_blank" title="Lưu Diệc Phi béo lên trông thấy, lộ vòng 2 ">Lưu Diệc Phi mang thai</a> c&aacute;ch đ&acirc;y kh&ocirc;ng l&acirc;u.</p>
<div type="Photo">
	<div>
		<a data-fancybox-group="img-lightbox" href="http://kenh14cdn.com/2017/luudiecphi2-1495887517155.jpg" target="_blank" title=""><img alt="Lưu Diệc Phi - Song Seung Hun chia tay nhau vì áp lực của lệnh cấm Hàn? - Ảnh 1." data-original="http://kenh14cdn.com/2017/luudiecphi2-1495887517155.jpg" id="img_9cc46280-42d6-11e7-b2d0-cdf7a36e9bbc" rel="lightbox" src="http://kenh14cdn.com/2017/luudiecphi2-1495887517155.jpg" title="Lưu Diệc Phi - Song Seung Hun chia tay nhau vì áp lực của lệnh cấm Hàn? - Ảnh 1." type="photo" /></a></div>
</div>
<p>
	Được biết, nguồn tin đưa ra th&ocirc;ng tin cặp đ&ocirc;i Seung Hun - Diệc Phi chia tay nhau c&oacute; cho hay: &quot;V&igrave; lệnh cấm H&agrave;n tại showbiz xứ Trung g&acirc;y &aacute;p lực kh&ocirc;ng nhỏ l&ecirc;n t&igrave;nh cảm của cặp đ&ocirc;i, n&ecirc;n cả hai quyết định chia tay. Mối quan hệ của cả hai trở n&ecirc;n gượng gạo, c&aacute;c fan cũng g&acirc;y sức &eacute;p l&ecirc;n mối quan hệ H&agrave;n - Trung n&agrave;y, Lưu Diệc Phi cũng v&ocirc; c&ugrave;ng quan t&acirc;m tới suy nghĩ v&agrave; mong mỏi của c&aacute;c fan, ch&iacute;nh v&igrave; lẽ đ&oacute; n&ecirc;n cả hai dần xa c&aacute;ch, t&igrave;nh cảm nhạt nho&agrave;&quot;.</p>
<p>
	Nguồn tin cho biết th&ecirc;m,<a href="http://kenh14.vn/song-seung-hun.html" target="_blank" title="Song Seung Hun"> Song Seung Hun</a> cũng v&igrave; &aacute;p lực n&agrave;y m&agrave; chủ động n&oacute;i lời chia tay với Lưu Diệc Phi, anh c&ograve;n cảm thấy m&igrave;nh kh&ocirc;ng thể mang lại hạnh ph&uacute;c cho bạn g&aacute;i xinh đẹp.</p>
<div type="Photo">
	<div>
		<a data-fancybox-group="img-lightbox" href="http://kenh14cdn.com/2017/songseunghun1-1495887532581.jpg" target="_blank" title=""><img alt="Lưu Diệc Phi - Song Seung Hun chia tay nhau vì áp lực của lệnh cấm Hàn? - Ảnh 2." data-original="http://kenh14cdn.com/2017/songseunghun1-1495887532581.jpg" id="img_a5f83070-42d6-11e7-b2d0-cdf7a36e9bbc" rel="lightbox" src="http://kenh14cdn.com/2017/songseunghun1-1495887532581.jpg" title="Lưu Diệc Phi - Song Seung Hun chia tay nhau vì áp lực của lệnh cấm Hàn? - Ảnh 2." type="photo" /></a></div>
</div>
<p>
	Đ&aacute;p lại những tin đồn tr&ecirc;n, ph&iacute;a Lưu Diệc Phi đ&atilde; li&ecirc;n lạc với giới truyền th&ocirc;ng v&agrave; khẳng định như sau: &quot;Gần đ&acirc;y, c&oacute; th&ocirc;ng tin lan truyền Song Seung Hun - Lưu Diệc Phi chia tay nhau, điều n&agrave;y l&agrave; sai sự thật. Ngo&agrave;i ra, l&yacute; do v&igrave; &quot;lệnh cấm H&agrave;n&quot; m&agrave; cặp đ&ocirc;i chia tay cũng l&agrave; v&ocirc; căn cứ. T&igrave;nh cảm đ&ocirc;i b&ecirc;n vẫn v&ocirc; c&ugrave;ng tốt đẹp&quot;.</p>
<p>
	Kể từ khi c&ocirc;ng khai t&igrave;nh cảm đến nay, cặp đ&ocirc;i Song Seung Hun - Lưu Diệc Phi gặp v&ocirc; số lời đồn đo&aacute;n cả hai chia tay v&igrave; nhiều l&yacute; do kh&aacute;c nhau. Từng c&oacute; tin đồn, n&agrave;ng &quot;Thần ti&ecirc;n tỷ tỷ&quot; kh&ocirc;ng qu&ecirc;n được bạn g&aacute;i đồng t&iacute;nh m&agrave; chia tay t&agrave;i tử &quot;Tr&aacute;i tim m&ugrave;a thu&quot;, cũng c&oacute; tin đồn Song Seung Hun cảm thấy m&igrave;nh kh&ocirc;ng thể mang lại hạnh ph&uacute;c cho bạn g&aacute;i m&agrave; cả hai &quot;đường ai nấy đi&quot;.</p>
<div type="Photo">
	<div>
		<a data-fancybox-group="img-lightbox" href="http://kenh14cdn.com/2017/luudiecphi3-1495887542047.jpg" target="_blank" title=""><img alt="Lưu Diệc Phi - Song Seung Hun chia tay nhau vì áp lực của lệnh cấm Hàn? - Ảnh 3." data-original="http://kenh14cdn.com/2017/luudiecphi3-1495887542047.jpg" id="img_ab9458b0-42d6-11e7-b2d0-cdf7a36e9bbc" rel="lightbox" src="http://kenh14cdn.com/2017/luudiecphi3-1495887542047.jpg" title="Lưu Diệc Phi - Song Seung Hun chia tay nhau vì áp lực của lệnh cấm Hàn? - Ảnh 3." type="photo" /></a></div>
</div>
<p>
	&nbsp;</p>
', 1, 6)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (66, N'Rộ tin đồn chia tay Song Seung Hun dịp sinh nhật Lưu Diệc Phi', N'2017_05_31_23_07_34_75220160826040053240-141909846.jpg', N' (Emdep.vn) - Cặp đôi không xuất hiện cùng nhau và không có bất cứ động tĩnh gì ngay trong cả ngày sinh nhật Lưu Diệc Phi. ', CAST(N'2017-05-31 00:00:00.000' AS DateTime), 2, N'<h2>
	Lại th&ecirc;m một tin đồn nữa về cặp đ&ocirc;i Song Seung Hun - Lưu Diệc Phi, v&agrave; lần n&agrave;y ch&iacute;nh nam t&agrave;i tử &quot;Tr&aacute;i tim m&ugrave;a thu&quot; đ&atilde; l&ecirc;n tiếng b&aacute;c bỏ.</h2>
<p>
	Trang Sina đưa tin, gần đ&acirc;y, tr&ecirc;n mạng x&atilde; hội xuất hiện th&ecirc;m tin đồn cặp đ&ocirc;i<a href="http://kenh14.vn/luu-diec-phi-song-seung-hun.html" target="_blank" title="Lưu Diệc Phi - Song Seung Hun"> Lưu Diệc Phi - Song Seung Hun</a> đ&atilde; &quot;đường ai nấy đi&quot; v&igrave; lệnh cấm H&agrave;n qu&aacute; r&aacute;o riết b&ecirc;n Trung. Đ&acirc;y lại l&agrave; một th&ocirc;ng tin nữa tiếp theo tin đồn <a href="http://kenh14.vn/luu-diec-phi-beo-len-trong-thay-lo-vong-2-lon-bat-thuong-vi-mang-bau-voi-song-seung-hun-20170413091551673.chn" target="_blank" title="Lưu Diệc Phi béo lên trông thấy, lộ vòng 2 ">Lưu Diệc Phi mang thai</a> c&aacute;ch đ&acirc;y kh&ocirc;ng l&acirc;u.</p>
<div type="Photo">
	<div>
		<a data-fancybox-group="img-lightbox" href="http://kenh14cdn.com/2017/luudiecphi2-1495887517155.jpg" target="_blank" title=""><img alt="Lưu Diệc Phi - Song Seung Hun chia tay nhau vì áp lực của lệnh cấm Hàn? - Ảnh 1." data-original="http://kenh14cdn.com/2017/luudiecphi2-1495887517155.jpg" id="img_9cc46280-42d6-11e7-b2d0-cdf7a36e9bbc" rel="lightbox" src="http://kenh14cdn.com/2017/luudiecphi2-1495887517155.jpg" title="Lưu Diệc Phi - Song Seung Hun chia tay nhau vì áp lực của lệnh cấm Hàn? - Ảnh 1." type="photo" /></a></div>
</div>
<p>
	Được biết, nguồn tin đưa ra th&ocirc;ng tin cặp đ&ocirc;i Seung Hun - Diệc Phi chia tay nhau c&oacute; cho hay: &quot;V&igrave; lệnh cấm H&agrave;n tại showbiz xứ Trung g&acirc;y &aacute;p lực kh&ocirc;ng nhỏ l&ecirc;n t&igrave;nh cảm của cặp đ&ocirc;i, n&ecirc;n cả hai quyết định chia tay. Mối quan hệ của cả hai trở n&ecirc;n gượng gạo, c&aacute;c fan cũng g&acirc;y sức &eacute;p l&ecirc;n mối quan hệ H&agrave;n - Trung n&agrave;y, Lưu Diệc Phi cũng v&ocirc; c&ugrave;ng quan t&acirc;m tới suy nghĩ v&agrave; mong mỏi của c&aacute;c fan, ch&iacute;nh v&igrave; lẽ đ&oacute; n&ecirc;n cả hai dần xa c&aacute;ch, t&igrave;nh cảm nhạt nho&agrave;&quot;.</p>
<p>
	Nguồn tin cho biết th&ecirc;m,<a href="http://kenh14.vn/song-seung-hun.html" target="_blank" title="Song Seung Hun"> Song Seung Hun</a> cũng v&igrave; &aacute;p lực n&agrave;y m&agrave; chủ động n&oacute;i lời chia tay với Lưu Diệc Phi, anh c&ograve;n cảm thấy m&igrave;nh kh&ocirc;ng thể mang lại hạnh ph&uacute;c cho bạn g&aacute;i xinh đẹp.</p>
<div type="Photo">
	<div>
		<a data-fancybox-group="img-lightbox" href="http://kenh14cdn.com/2017/songseunghun1-1495887532581.jpg" target="_blank" title=""><img alt="Lưu Diệc Phi - Song Seung Hun chia tay nhau vì áp lực của lệnh cấm Hàn? - Ảnh 2." data-original="http://kenh14cdn.com/2017/songseunghun1-1495887532581.jpg" id="img_a5f83070-42d6-11e7-b2d0-cdf7a36e9bbc" rel="lightbox" src="http://kenh14cdn.com/2017/songseunghun1-1495887532581.jpg" title="Lưu Diệc Phi - Song Seung Hun chia tay nhau vì áp lực của lệnh cấm Hàn? - Ảnh 2." type="photo" /></a></div>
</div>
<p>
	Đ&aacute;p lại những tin đồn tr&ecirc;n, ph&iacute;a Lưu Diệc Phi đ&atilde; li&ecirc;n lạc với giới truyền th&ocirc;ng v&agrave; khẳng định như sau: &quot;Gần đ&acirc;y, c&oacute; th&ocirc;ng tin lan truyền Song Seung Hun - Lưu Diệc Phi chia tay nhau, điều n&agrave;y l&agrave; sai sự thật. Ngo&agrave;i ra, l&yacute; do v&igrave; &quot;lệnh cấm H&agrave;n&quot; m&agrave; cặp đ&ocirc;i chia tay cũng l&agrave; v&ocirc; căn cứ. T&igrave;nh cảm đ&ocirc;i b&ecirc;n vẫn v&ocirc; c&ugrave;ng tốt đẹp&quot;.</p>
<p>
	Kể từ khi c&ocirc;ng khai t&igrave;nh cảm đến nay, cặp đ&ocirc;i Song Seung Hun - Lưu Diệc Phi gặp v&ocirc; số lời đồn đo&aacute;n cả hai chia tay v&igrave; nhiều l&yacute; do kh&aacute;c nhau. Từng c&oacute; tin đồn, n&agrave;ng &quot;Thần ti&ecirc;n tỷ tỷ&quot; kh&ocirc;ng qu&ecirc;n được bạn g&aacute;i đồng t&iacute;nh m&agrave; chia tay t&agrave;i tử &quot;Tr&aacute;i tim m&ugrave;a thu&quot;, cũng c&oacute; tin đồn Song Seung Hun cảm thấy m&igrave;nh kh&ocirc;ng thể mang lại hạnh ph&uacute;c cho bạn g&aacute;i m&agrave; cả hai &quot;đường ai nấy đi&quot;.</p>
<div type="Photo">
	<div>
		<a data-fancybox-group="img-lightbox" href="http://kenh14cdn.com/2017/luudiecphi3-1495887542047.jpg" target="_blank" title=""><img alt="Lưu Diệc Phi - Song Seung Hun chia tay nhau vì áp lực của lệnh cấm Hàn? - Ảnh 3." data-original="http://kenh14cdn.com/2017/luudiecphi3-1495887542047.jpg" id="img_ab9458b0-42d6-11e7-b2d0-cdf7a36e9bbc" rel="lightbox" src="http://kenh14cdn.com/2017/luudiecphi3-1495887542047.jpg" title="Lưu Diệc Phi - Song Seung Hun chia tay nhau vì áp lực của lệnh cấm Hàn? - Ảnh 3." type="photo" /></a></div>
</div>
<p>
	&nbsp;</p>
', 1, 6)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (67, N'Kim Hiền tự tin khoe vóc dáng sau 2 lần sinh nở ', N'2017_05_31_23_08_39_3251-095442122.jpg', N' (Emdep.vn) - Diễn viên ''Hương phù sa'' mặc bikini khi đi tắm ở hồ bơi cùng hai con trong kỳ nghỉ ở Las Vegas. ', CAST(N'2017-05-31 00:00:00.000' AS DateTime), 0, N'<p>
	<img alt="kim-hien-tu-tin-khoe-voc-dang-sau-2-lan-sinh-no" data-natural-width="550" data-pwidth="690" data-width="550" src="http://img.f21.ngoisao.vnecdn.net/2016/08/25/kim-hien-5-2941-1472117336.jpg" /></p>
<table border="0" cellpadding="3" cellspacing="0">
	<tbody>
		<tr>
			<td>
				&nbsp;</td>
		</tr>
		<tr>
			<td>
				<p>
					Trước khi kết th&uacute;c dịp nghỉ h&egrave;, cả gia đ&igrave;nh Kim Hiền đ&atilde; c&ugrave;ng nhau đến Las Vegas&nbsp;vui chơi v&agrave; sưởi ấm t&igrave;nh cảm.&nbsp;</p>
			</td>
		</tr>
	</tbody>
</table>
<table border="0" cellpadding="3" cellspacing="0">
	<tbody>
		<tr>
			<td>
				<img alt="kim-hien-tu-tin-khoe-voc-dang-sau-2-lan-sinh-no-1" data-natural-width="550" data-pwidth="690" data-width="550" src="http://img.f21.ngoisao.vnecdn.net/2016/08/25/kim-hien-14-4046-1472117337.jpg" /></td>
		</tr>
		<tr>
			<td>
				<p>
					N&agrave;ng &Uacute;t R&aacute;ng chia sẻ, th&agrave;nh phố s&ocirc;i động v&agrave; n&aacute;o nhiệt, kh&aacute;c hẳn với kh&ocirc;ng gian y&ecirc;n b&igrave;nh ở nơi vợ chồng c&ocirc; sống tại California.&nbsp;</p>
			</td>
		</tr>
	</tbody>
</table>
<table border="0" cellpadding="3" cellspacing="0">
	<tbody>
		<tr>
			<td>
				<img alt="kim-hien-tu-tin-khoe-voc-dang-sau-2-lan-sinh-no-2" data-natural-width="550" data-pwidth="690" data-width="550" src="http://img.f21.ngoisao.vnecdn.net/2016/08/25/kim-hien-1-7399-1472117336.jpg" /></td>
		</tr>
		<tr>
			<td>
				<p>
					Kh&ocirc;ng chỉ vợ chồng Kim Hiền m&agrave; hai nh&oacute;c tỳ Sonic, Yvona đều th&iacute;ch th&uacute; với chuyến đi n&agrave;y.&nbsp;</p>
			</td>
		</tr>
	</tbody>
</table>
<table border="0" cellpadding="3" cellspacing="0">
	<tbody>
		<tr>
			<td>
				<img alt="kim-hien-tu-tin-khoe-voc-dang-sau-2-lan-sinh-no-3" data-natural-width="500" data-pwidth="690" data-width="500" src="http://img.f21.ngoisao.vnecdn.net/2016/08/25/kim-hien-12-3374-1472117337.jpg" /></td>
		</tr>
		<tr>
			<td>
				<p>
					D&ugrave; đ&atilde; trải qua hai lần sinh nở nhưng Kim Hiền vẫn tự tin mặc bikini, c&ugrave;ng con g&aacute;i tắm nắng b&ecirc;n hồ bơi của kh&aacute;ch sạn.&nbsp;</p>
			</td>
		</tr>
	</tbody>
</table>
<table border="0" cellpadding="3" cellspacing="0">
	<tbody>
		<tr>
			<td>
				<img alt="kim-hien-tu-tin-khoe-voc-dang-sau-2-lan-sinh-no-4" data-natural-width="550" data-pwidth="690" data-width="550" src="http://img.f21.ngoisao.vnecdn.net/2016/08/25/kim-hien-11-2161-1472117337.jpg" /></td>
		</tr>
		<tr>
			<td>
				<p>
					Mặc d&ugrave; kh&ocirc;ng sở hữu chiều cao l&yacute; tưởng nhưng Kim Hiền vẫn l&agrave;m nhiều người ngưỡng mộ về v&oacute;c d&aacute;ng gọn g&agrave;ng.&nbsp;</p>
			</td>
		</tr>
	</tbody>
</table>
<table border="0" cellpadding="3" cellspacing="0">
	<tbody>
		<tr>
			<td>
				<img alt="kim-hien-tu-tin-khoe-voc-dang-sau-2-lan-sinh-no-5" data-natural-width="550" data-pwidth="690" data-width="550" src="http://img.f21.ngoisao.vnecdn.net/2016/08/25/kim-hien-7-4167-1472117337.jpg" /></td>
		</tr>
		<tr>
			<td>
				<p>
					C&ocirc; tiết lộ, sau những ng&agrave;y phơi nắng, l&agrave;n da của c&ocirc; đ&atilde; đen sạm đi kh&aacute; nhiều.&nbsp;</p>
			</td>
		</tr>
	</tbody>
</table>
<table border="0" cellpadding="3" cellspacing="0">
	<tbody>
		<tr>
			<td>
				<img alt="kim-hien-tu-tin-khoe-voc-dang-sau-2-lan-sinh-no-6" data-natural-width="550" data-pwidth="690" data-width="550" src="http://img.f21.ngoisao.vnecdn.net/2016/08/25/kim-hien-10-9254-1472117337.jpg" /></td>
		</tr>
		<tr>
			<td>
				<p>
					Ri&ecirc;ng Sonic th&igrave; đặc biệt h&agrave;o hứng với những hoạt động vui chơi m&agrave; bố&nbsp;mẹ d&agrave;nh cho m&igrave;nh.&nbsp;</p>
			</td>
		</tr>
	</tbody>
</table>
<table border="0" cellpadding="3" cellspacing="0">
	<tbody>
		<tr>
			<td>
				<img alt="kim-hien-tu-tin-khoe-voc-dang-sau-2-lan-sinh-no-7" data-natural-width="550" data-pwidth="690" data-width="550" src="http://img.f21.ngoisao.vnecdn.net/2016/08/25/kim-hien-13-8356-1472117337.jpg" /></td>
		</tr>
		<tr>
			<td>
				<p>
					Las Vegas c&oacute; nhiều kh&aacute;ch sạn nổi tiếng về kiến tr&uacute;c n&ecirc;n nữ diễn vi&ecirc;n cũng tranh thủ đi thăm quan.&nbsp;</p>
			</td>
		</tr>
	</tbody>
</table>
<table border="0" cellpadding="3" cellspacing="0">
	<tbody>
		<tr>
			<td>
				<img alt="kim-hien-tu-tin-khoe-voc-dang-sau-2-lan-sinh-no-8" data-natural-width="600" data-pwidth="690" data-width="600" src="http://img.f21.ngoisao.vnecdn.net/2016/08/25/kim-hien-23-1808-1472117337.jpg" /></td>
		</tr>
		<tr>
			<td>
				<p>
					C&ocirc; cảm thấy m&igrave;nh may mắn khi &ocirc;ng x&atilde; Andy lu&ocirc;n gi&uacute;p đỡ vợ chăm s&oacute;c hai nh&oacute;c tỳ.&nbsp;</p>
			</td>
		</tr>
	</tbody>
</table>
<table border="0" cellpadding="3" cellspacing="0">
	<tbody>
		<tr>
			<td>
				<img alt="kim-hien-tu-tin-khoe-voc-dang-sau-2-lan-sinh-no-9" data-pwidth="690" data-width="550" src="http://img.f21.ngoisao.vnecdn.net/2016/08/25/kim-hien-4-3375-1472120054.jpg" /></td>
		</tr>
		<tr>
			<td>
				<p>
					Anh y&ecirc;u thương Sonic như ch&iacute;nh con đẻ của m&igrave;nh. Với ri&ecirc;ng n&agrave;ng c&ocirc;ng ch&uacute;a Yvona, anh rất tự h&agrave;o v&igrave; c&ocirc; b&eacute; giống hệt m&igrave;nh.&nbsp;</p>
			</td>
		</tr>
	</tbody>
</table>
<table border="0" cellpadding="3" cellspacing="0">
	<tbody>
		<tr>
			<td>
				<img alt="kim-hien-tu-tin-khoe-voc-dang-sau-2-lan-sinh-no-10" data-pwidth="690" data-width="550" src="http://img.f21.ngoisao.vnecdn.net/2016/08/25/kim-hien-2-5923-1472120054.jpg" /></td>
		</tr>
		<tr>
			<td>
				<p>
					Kim Hiền thường xuy&ecirc;n lưu lại những khoảnh khắc đẹp về &ocirc;ng x&atilde; b&ecirc;n c&aacute;c con.</p>
			</td>
		</tr>
	</tbody>
</table>
<p>
	&nbsp;</p>
', 1, 6)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (68, N'Phạm Băng Băng xấu xí khó hiểu trong phim mới', N'2017_05_31_23_09_57_1437041999057530679-141650301.jpg', N' (Emdep.vn) - Photoshop quá đà đã khiến hình ảnh của Phạm Băng Băng trở nên xấu khó hiểu với khuôn mặt nhọn hoắt đáng sợ. ', CAST(N'2017-05-31 00:00:00.000' AS DateTime), 0, N'<p>
	Bộ phim &quot;Tước t&iacute;ch&quot; với sự tham gia của h&agrave;ng loạt ng&ocirc;i sao nổi tiếng như Phạm Băng Băng v&agrave; Dương Mịch, Ng&ocirc; Diệc Ph&agrave;m tiếp tục thu h&uacute;t sự ch&uacute; &yacute;, mong chờ của đ&ocirc;ng đảo người h&acirc;m mộ. Mới đ&acirc;y, bộ phim tiếp tục tung ra những h&igrave;nh poster phim, khiến người h&acirc;m mộ kh&ocirc;ng khỏi b&agrave;n t&aacute;n x&ocirc;n xao v&igrave; nhan sắc &quot;l&ecirc;n xuống thất thường&quot; của d&agrave;n diễn vi&ecirc;n ch&iacute;nh.</p>
<p>
	Trong poster ch&iacute;nh của bộ phim, do photoshop kh&ocirc;ng hợp l&yacute;, khu&ocirc;n mặt của Phạm Băng Băng trở n&ecirc;n xấu x&iacute; một c&aacute;ch kh&oacute; hiểu. Chiếc cằm của c&ocirc; v&igrave; xử l&yacute; qu&aacute; đ&agrave; trở n&ecirc;n nhọn v&agrave; dị thường. Trong khi đ&oacute;, h&igrave;nh ảnh thật của Phạm Băng Băng trong phim v&ocirc; c&ugrave;ng xinh đẹp v&agrave; c&oacute; ch&uacute;t ma mị.</p>
<p>
	Những h&igrave;nh ảnh mới nhất đ&atilde; cho thấy tạo h&igrave;nh của nữ diễn vi&ecirc;n trong phim kh&aacute; ấn tượng, với trang phục m&agrave;u đen v&agrave; gắn nhiều trang thiết bị tr&ecirc;n mặt. Bộ trang phục tối m&agrave;u c&agrave;ng l&agrave;m nổi bật nước da trắng ngần v&agrave; vẻ xinh đẹp sắc sảo của Phạm Băng Băng.</p>
<p>
	<a data-index="0" href="http://baomoi-photo-2-td.zadn.vn/16/08/26/265/20183539/1_108969.jpg"><img alt="Pham Bang Bang xau xi kho hieu trong phim moi - Anh 1" src="http://baomoi-photo-2-td.zadn.vn/w460x/16/08/26/265/20183539/1_108969.jpg" title="Phạm Băng Băng xấu xí khó hiểu trong phim mới - Ảnh 1" /></a></p>
<p>
	Poster bị xử l&yacute; qu&aacute; đ&agrave; khiến khu&ocirc;n mặt Phạm Băng Băng trở n&ecirc;n m&eacute;o m&oacute;</p>
<p>
	<a data-index="1" href="http://baomoi-photo-2-td.zadn.vn/16/08/26/265/20183539/3_64636.jpg"><img alt="Pham Bang Bang xau xi kho hieu trong phim moi - Anh 2" src="http://baomoi-photo-2-td.zadn.vn/w460x/16/08/26/265/20183539/3_64636.jpg" title="Phạm Băng Băng xấu xí khó hiểu trong phim mới - Ảnh 2" /></a></p>
<p>
	<a data-index="2" href="http://baomoi-photo-2-td.zadn.vn/16/08/26/265/20183539/4_108595.jpg"><img alt="Pham Bang Bang xau xi kho hieu trong phim moi - Anh 3" src="http://baomoi-photo-2-td.zadn.vn/w460x/16/08/26/265/20183539/4_108595.jpg" title="Phạm Băng Băng xấu xí khó hiểu trong phim mới - Ảnh 3" /></a></p>
<p>
	<a data-index="3" href="http://baomoi-photo-2-td.zadn.vn/16/08/26/265/20183539/5_141057.jpg"><img alt="Pham Bang Bang xau xi kho hieu trong phim moi - Anh 4" src="http://baomoi-photo-2-td.zadn.vn/w460x/16/08/26/265/20183539/5_141057.jpg" title="Phạm Băng Băng xấu xí khó hiểu trong phim mới - Ảnh 4" /></a></p>
<p>
	Ngược hẳn với poster phim, những h&igrave;nh ảnh mới của Phạm Băng Băng trong phim xinh đẹp sắc sảo đến ma mị.</p>
<p>
	<a data-index="4" href="http://baomoi-photo-2-td.zadn.vn/16/08/26/265/20183539/6_577283.jpg"><img alt="Pham Bang Bang xau xi kho hieu trong phim moi - Anh 5" src="http://baomoi-photo-2-td.zadn.vn/w460x/16/08/26/265/20183539/6_577283.jpg" title="Phạm Băng Băng xấu xí khó hiểu trong phim mới - Ảnh 5" /></a></p>
<p>
	H&igrave;nh ảnh mới đ&acirc;y nhất của Phạm Băng Băng</p>
<p>
	<a data-index="5" href="http://baomoi-photo-2-td.zadn.vn/16/08/26/265/20183539/7_446706.jpg"><img alt="Pham Bang Bang xau xi kho hieu trong phim moi - Anh 6" src="http://baomoi-photo-2-td.zadn.vn/w460x/16/08/26/265/20183539/7_446706.jpg" title="Phạm Băng Băng xấu xí khó hiểu trong phim mới - Ảnh 6" /></a></p>
<p>
	Poster ch&iacute;nh của bộ phim đ&atilde; kh&ocirc;ng t&ocirc;n vinh được vẻ đẹp sắc nước hương trời của Phạm Băng Băng.</p>
<p>
	Bộ phim &quot;Tước t&iacute;ch&quot; l&agrave; c&acirc;u chuyện về thế giới thần thoại tr&ecirc;n đại lục Odin, gồm 4 v&ugrave;ng đất ri&ecirc;ng lẻ được sự quản l&yacute; của c&aacute;c vị ph&aacute;p sư t&agrave;i ph&eacute;p cao cường. Bộ phim chuyển thể từ tiểu thuyết c&ugrave;ng t&ecirc;n, nhằm kỷ niệm 10 năm bắt đầu sự nghiệp viết l&aacute;ch của Qu&aacute;ch K&iacute;nh Minh. H&igrave;nh tượng đẹp sắc lạnh của Phạm Băng Băng được cho l&agrave; ph&ugrave; hợp với đặc điểm vai diễn Quỷ Sơn Li&ecirc;n Tuyền của c&ocirc; trong phim.</p>
<p>
	C&ugrave;ng xem h&igrave;nh ảnh của một v&agrave;i vai diễn nổi bật kh&aacute;c trong phim:</p>
<p>
	<a data-index="6" href="http://baomoi-photo-2-td.zadn.vn/16/08/26/265/20183539/8_70400.jpg"><img alt="Pham Bang Bang xau xi kho hieu trong phim moi - Anh 7" src="http://baomoi-photo-2-td.zadn.vn/w460x/16/08/26/265/20183539/8_70400.jpg" title="Phạm Băng Băng xấu xí khó hiểu trong phim mới - Ảnh 7" /></a></p>
<p>
	Ng&ocirc; Diệc Ph&agrave;m</p>
<p>
	<a data-index="7" href="http://baomoi-photo-2-td.zadn.vn/16/08/26/265/20183539/9_170800.jpg"><img alt="Pham Bang Bang xau xi kho hieu trong phim moi - Anh 8" src="http://baomoi-photo-2-td.zadn.vn/w460x/16/08/26/265/20183539/9_170800.jpg" title="Phạm Băng Băng xấu xí khó hiểu trong phim mới - Ảnh 8" /></a></p>
<p>
	Dương Mịch</p>
<p>
	<a data-index="8" href="http://baomoi-photo-2-td.zadn.vn/16/08/26/265/20183539/10_92134.jpg"><img alt="Pham Bang Bang xau xi kho hieu trong phim moi - Anh 9" src="http://baomoi-photo-2-td.zadn.vn/w460x/16/08/26/265/20183539/10_92134.jpg" title="Phạm Băng Băng xấu xí khó hiểu trong phim mới - Ảnh 9" /></a></p>
<p>
	Trần Vỹ Đ&igrave;nh</p>
<p>
	<a data-index="9" href="http://baomoi-photo-2-td.zadn.vn/16/08/26/265/20183539/11_64150.jpg"><img alt="Pham Bang Bang xau xi kho hieu trong phim moi - Anh 10" src="http://baomoi-photo-2-td.zadn.vn/w460x/16/08/26/265/20183539/11_64150.jpg" title="Phạm Băng Băng xấu xí khó hiểu trong phim mới - Ảnh 10" /></a></p>
<p>
	Trần Học Đ&ocirc;ng</p>
<p>
	<a data-index="10" href="http://baomoi-photo-2-td.zadn.vn/16/08/26/265/20183539/12_82270.jpg"><img alt="Pham Bang Bang xau xi kho hieu trong phim moi - Anh 11" src="http://baomoi-photo-2-td.zadn.vn/w460x/16/08/26/265/20183539/12_82270.jpg" title="Phạm Băng Băng xấu xí khó hiểu trong phim mới - Ảnh 11" /></a></p>
<p>
	L&yacute; Trị Đ&igrave;nh</p>
<p>
	<a data-index="11" href="http://baomoi-photo-2-td.zadn.vn/16/08/26/265/20183539/13_65783.jpg"><img alt="Pham Bang Bang xau xi kho hieu trong phim moi - Anh 12" src="http://baomoi-photo-2-td.zadn.vn/w460x/16/08/26/265/20183539/13_65783.jpg" title="Phạm Băng Băng xấu xí khó hiểu trong phim mới - Ảnh 12" /></a></p>
<p>
	L&acirc;m Duẫn</p>
', 1, 6)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (69, N'4 MC dẫn dắt Chung kết Hoa hậu Việt Nam 2017', N'2017_05_31_23_10_48_890-014638734.png', N' (Emdep.vn) - Vòng Chung kết cuộc thi nhan sắc lớn nhất Việt Nam năm nay sẽ được dẫn dắt bởi 4 gương mặt: Á hậu Thuỵ Vân, ca sĩ - MC Ái Phương, Vũ Mạnh Cường và Đức Bảo. ', CAST(N'2017-05-31 00:00:00.000' AS DateTime), 1, N'<h3 class="sapo cms-desc">
	&Aacute; hậu Thụy V&acirc;n, &Aacute;i Phương, Vũ Mạnh Cường, Đức Bảo sẽ l&agrave; 4 gương mặt dẫn dắt v&ograve;ng Chung kết cuộc thi Hoa hậu Việt Nam 2016.</h3>
<div class="cms-body" id="abody">
	<div style="text-align: justify;">
		Sau h&agrave;ng loạt scandal như th&iacute; sinh bị tố thẩm mỹ, th&iacute; sinh xin r&uacute;t đơn khỏi cuộc thi trước thềm chung kết... c&agrave;ng khiến chương tr&igrave;nh Hoa hậu Việt Nam được mong chờ hơn bao giờ hết.</div>
	<div style="text-align: justify;">
		Mới đ&acirc;y, BTC cuộc thi nhan sắc lớn nhất Việt Nam đ&atilde; c&ocirc;ng bố 4 gương mặt sẽ dẫn dắt <strong style="font-size: 14px;">đ&ecirc;m Chung kết Hoa hậu Việt Nam 2016</strong> l&agrave; &Aacute; hậu Thụy V&acirc;n, Vũ Mạnh Cường, Si&ecirc;u mẫu &Aacute;i Phương v&agrave; Đức Bảo.</div>
	<div style="text-align: justify;">
		<div style="text-align:center;">
			<center>
				<table class="contentimg" style="text-align: center;">
					<tbody>
						<tr>
							<td style="text-align: center;">
								<a href="http://cms.kienthuc.net.vn/zoom/1000/uploaded/vuthuy/2016_08_27/6/4-mc-tai-sac-dan-chung-ket-hoa-hau-viet-nam-2016.png" target="_blank"><img alt="4 MC tai, sac dan Chung ket Hoa hau Viet Nam 2016" src="http://cms.kienthuc.net.vn/zoom/500/uploaded/vuthuy/2016_08_27/6/4-mc-tai-sac-dan-chung-ket-hoa-hau-viet-nam-2016.png" style="width: 500px; height: 333px;" title="4 MC tài, sắc dẫn Chung kết Hoa hậu Việt Nam 2016" /></a></td>
						</tr>
						<tr>
							<td style="text-align: center;">
								&nbsp;</td>
						</tr>
					</tbody>
				</table>
			</center>
		</div>
	</div>
	<div style="text-align: justify;">
		&Aacute; hậu Thụy V&acirc;n sau khi đăng quang Hoa hậu Việt Nam 2008 đ&atilde; nhanh ch&oacute;ng b&eacute;n duy&ecirc;n với lĩnh vực dẫn chương tr&igrave;nh, cụ thể c&ocirc; đang l&agrave; MC được y&ecirc;u mến ở Trung t&acirc;m tin tức VTV24 của Đ&agrave;i truyền h&igrave;nh Việt Nam. C&ograve;n Vũ Mạnh Cường - bạn dẫn với c&ocirc;, cũng c&oacute; kh&ocirc;ng &iacute;t kinh nghiệm dẫn dắt c&aacute;c cuộc thi nhan sắc.</div>
	<div style="text-align: justify;">
		<div style="text-align:center;">
			<center>
				<table class="contentimg" style="text-align: center;">
					<tbody>
						<tr>
							<td style="text-align: center;">
								<a href="http://cms.kienthuc.net.vn/zoom/1000/uploaded/vuthuy/2016_08_27/6/4-mc-tai-sac-dan-chung-ket-hoa-hau-viet-nam-2016-hinh-2.png" target="_blank"><img alt="4 MC tai, sac dan Chung ket Hoa hau Viet Nam 2016-Hinh-2" src="http://cms.kienthuc.net.vn/zoom/500/uploaded/vuthuy/2016_08_27/6/4-mc-tai-sac-dan-chung-ket-hoa-hau-viet-nam-2016-hinh-2.png" style="width: 500px; height: 333px;" title="4 MC tài, sắc dẫn Chung kết Hoa hậu Việt Nam 2016 - Hình 2" /></a></td>
						</tr>
						<tr>
							<td style="text-align: center;">
								&nbsp;</td>
						</tr>
					</tbody>
				</table>
			</center>
		</div>
	</div>
	<div style="text-align: justify;">
		Ở khu vực ph&iacute;a Nam, si&ecirc;u mẫu &Aacute;i Phương cũng được ch&uacute; &yacute; bởi sự xinh đẹp, duy&ecirc;n d&aacute;ng khi dẫn trong c&aacute;c sự kiện, event lớn. Khi lấn s&acirc;n sang l&agrave;m MC, &Aacute;i Phương cũng được giới chuy&ecirc;n m&ocirc;n đ&aacute;nh gi&aacute; l&agrave; một người c&oacute; tiềm năng. B&ecirc;n cạnh c&ocirc; l&agrave; Đức Bảo - ch&agrave;ng MC vui t&iacute;nh, hoạt ng&ocirc;n trong chương tr&igrave;nh &quot;Cafe s&aacute;ng với VTV3&quot;, đ&ocirc;i khi lại bắt gặp anh trong chương tr&igrave;nh &quot;Ch&uacute;ng t&ocirc;i l&agrave; chiến sĩ&quot; của Đ&agrave;i truyền h&igrave;nh Việt Nam. Anh cũng được đ&aacute;nh gi&aacute; cao về khả năng dẫn Song ngữ.</div>
	<div style="text-align: justify;">
		<span style="font-size: 14px;">Cuộc thi </span><em style="font-size: 16px;">Hoa hậu Việt Nam</em><span style="font-size: 14px;"> năm nay được nhiều người chờ đ&oacute;n kh&ocirc;ng phải chỉ để ngắm nhan sắc, t&agrave;i năng của c&aacute;c th&iacute; sinh m&agrave; năm nay c&oacute; nhiều điều kh&aacute;c biệt như s&acirc;n khấu thiết kế ho&agrave;nh tr&aacute;ng, d&agrave;n kh&aacute;ch mời đều l&agrave; những ng&ocirc;i sao hạng A của showbiz Việt m&agrave; c&ograve;n c&oacute; sự xuất hiện c&oacute; </span><span style="font-size: 14px; text-decoration: underline;">ng&ocirc;i sao H&agrave;n Quốc Bi Rain</span><span style="font-size: 14px;">.</span></div>
	<div style="text-align: justify;">
		<div style="text-align:center;">
			<center>
				<table class="contentimg" style="text-align: center;">
					<tbody>
						<tr>
							<td style="text-align: center;">
								<a href="http://cms.kienthuc.net.vn/zoom/1000/uploaded/vuthuy/2016_08_27/6/4-mc-tai-sac-dan-chung-ket-hoa-hau-viet-nam-2016-hinh-3.png" target="_blank"><img alt="4 MC tai, sac dan Chung ket Hoa hau Viet Nam 2016-Hinh-3" src="http://cms.kienthuc.net.vn/zoom/500/uploaded/vuthuy/2016_08_27/6/4-mc-tai-sac-dan-chung-ket-hoa-hau-viet-nam-2016-hinh-3.png" style="width: 500px; height: 392px;" title="4 MC tài, sắc dẫn Chung kết Hoa hậu Việt Nam 2016 - Hình 3" /></a></td>
						</tr>
						<tr>
							<td style="text-align: center;">
								&nbsp;</td>
						</tr>
					</tbody>
				</table>
			</center>
		</div>
	</div>
	<div style="text-align: justify;">
		Ban tổ chức cho biết, đ&ecirc;m Chung kết đ&atilde; c&oacute; t&igrave;nh trạng &ldquo;ch&aacute;y v&eacute;&rdquo; khi c&aacute;c hạng gi&aacute; v&eacute; VIP (mức gi&aacute; 25 triệu) kh&ocirc;ng c&ograve;n, chủ yếu d&agrave;nh cho kh&aacute;ch mời v&agrave; nh&agrave; t&agrave;i trợ, mức v&eacute; hạng phổ th&ocirc;ng từ 3-5 triệu đồng cũng chỉ c&ograve;n 100 v&eacute;.</div>
</div>
<p>
	&nbsp;</p>
', 1, 6)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (70, N'Taylor Swift và Tom Hiddleston bắt đầu trục trặc', N'2017_05_31_23_12_07_6663750f82c00000578-0-image-a-11472052067831-112046836.jpg', N' (Emdep.vn) - Sau những ngày tháng ngọt ngào, cặp đôi đã bắt đầu có dấu hiệu rạn nứt. ', CAST(N'2017-05-31 00:00:00.000' AS DateTime), 0, N'<p>
	Những h&igrave;nh ảnh hạnh ph&uacute;c ngọt ng&agrave;o tay trong tay của Taylor Swift v&agrave; Tom Hiddleston li&ecirc;n tục xuất hiện tr&ecirc;n mặt b&aacute;o một thời gian d&agrave;i từng khiến cộng đồng ngưỡng mộ v&agrave; ghen tị. Nhưng c&oacute; lẽ cũng đ&atilde; đến l&uacute;c t&igrave;nh y&ecirc;u thi&ecirc;n đường của họ cũng xuất hiện những vết rạn nứt khi cả hai đ&atilde; c&oacute; một cuộc tranh c&atilde;i lớn v&agrave;o đầu th&aacute;ng, theo UsWeekly đưa tin.</p>
<p>
	Thời gian gần đ&acirc;y cả hai cũng đ&atilde; kh&ocirc;ng c&ograve;n s&aacute;t c&aacute;nh b&ecirc;n nhau do bận rộn với c&aacute;c c&ocirc;ng việc ri&ecirc;ng. Một người th&acirc;n cận với Taylor cho biết, thật kh&oacute; để sắp xếp lịch tr&igrave;nh cho họ.</p>
<p>
	<a data-index="0" href="http://baomoi-photo-1-td.zadn.vn/16/08/25/265/20179479/1_198001.jpg"><img alt="Taylor Swift va Tom Hiddleston bat dau truc trac - Anh 1" src="http://baomoi-photo-1-td.zadn.vn/w460x/16/08/25/265/20179479/1_198001.jpg" title="Taylor Swift và Tom Hiddleston bắt đầu trục trặc - Ảnh 1" /></a></p>
<p>
	Hai ng&ocirc;i sao từng c&oacute; thời gian gắn b&oacute; như h&igrave;nh với b&oacute;ng.</p>
<p>
	<a data-index="1" href="http://baomoi-photo-1-td.zadn.vn/16/08/25/265/20179479/2_127429.jpg"><img alt="Taylor Swift va Tom Hiddleston bat dau truc trac - Anh 2" src="http://baomoi-photo-1-td.zadn.vn/w460x/16/08/25/265/20179479/2_127429.jpg" title="Taylor Swift và Tom Hiddleston bắt đầu trục trặc - Ảnh 2" /></a></p>
<p>
	Trước khi hẹn h&ograve; với nữ ca sĩ nhạc đồng qu&ecirc;, ng&ocirc;i sao nổi tiếng với vai Loki l&agrave; ứng cử vi&ecirc;n tiềm năng cho vai điệp vi&ecirc;n 007, thay thế cho Daniel Craig. Vai diễn trong &quot;The Night Manager&quot; cũng mang lại nhiều giải thưởng v&agrave; th&agrave;nh c&ocirc;ng cho Tom.</p>
<p>
	Nhưng ngay sau đ&oacute;, việc hẹn h&ograve; ng&agrave;y đ&ecirc;m kh&ocirc;ng ngơi nghỉ với Taylor cũng đ&atilde; ảnh hưởng kh&ocirc;ng nhỏ tới c&ocirc;ng việc của Tom. C&oacute; lẽ v&igrave; vậy, giờ nam t&agrave;i tử n&agrave;y đ&agrave;nh giảm tốc độ mối quan hệ lại. Nhiều &yacute; kiến cho rằng, Tom đ&atilde; bị rơi v&agrave;o &quot;bẫy của Taylor&quot;.</p>
<p>
	Một nguồn tin cho biết: &quot;Kh&ocirc;ng thể phủ nhận rằng h&igrave;nh ảnh của Tom đ&atilde; bị ảnh hưởng xấu khi bắt đầu hẹn h&ograve; Taylor. Tom chắc chắn kh&ocirc;ng bao giờ l&ecirc;n kế hoạch trong việc t&igrave;nh y&ecirc;u n&agrave;y g&acirc;y t&aacute;c động ti&ecirc;u cực đến sự nghiệp của m&igrave;nh, nhưng &ocirc;ng ấy kh&ocirc;ng thể ngờ n&oacute; đ&atilde; phản t&aacute;c dụng.&quot;</p>
<p>
	<a data-index="2" href="http://baomoi-photo-1-td.zadn.vn/16/08/25/265/20179479/3_180452.jpg"><img alt="Taylor Swift va Tom Hiddleston bat dau truc trac - Anh 3" src="http://baomoi-photo-1-td.zadn.vn/w460x/16/08/25/265/20179479/3_180452.jpg" title="Taylor Swift và Tom Hiddleston bắt đầu trục trặc - Ảnh 3" /></a></p>
<p>
	H&igrave;nh ảnh gần đ&acirc;y của Taylor</p>
<p>
	<a data-index="3" href="http://baomoi-photo-1-td.zadn.vn/16/08/25/265/20179479/4_113845.jpg"><img alt="Taylor Swift va Tom Hiddleston bat dau truc trac - Anh 4" src="http://baomoi-photo-1-td.zadn.vn/w460x/16/08/25/265/20179479/4_113845.jpg" title="Taylor Swift và Tom Hiddleston bắt đầu trục trặc - Ảnh 4" /></a></p>
<p>
	H&igrave;nh ảnh của Tom ng&agrave;y 23/8/2016, khi anh mặc trang phục của nh&acirc;n vật Loki<br />
	để tới thăm một bệnh viện trẻ em.</p>
', 1, 6)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (71, N'Loạt hành động khó tin của Taylor và Tom chỉ sau 2 tuần yêu nhau', N'2017_05_31_23_14_06_781taylor-swift-tom-4-175257865.jpg', N' (Emdep.vn) - Nhìn những hình ảnh thân mật mọi nơi mọi lúc của Taylor Swift và Tom Hiddleston cùng những việc cặp đôi đã làm, bất cứ ai cũng hy vọng vào một cái kết hoàn hảo cho cặp đôi. ', CAST(N'2017-05-31 00:00:00.000' AS DateTime), 0, N'<p>
	Taylor Swift khiến fan ph&aacute;t ghen tị trước &quot;bộ sưu tập người y&ecirc;u&quot; đều l&agrave; những anh ch&agrave;ng điển trai v&agrave; t&agrave;i năng h&agrave;ng đầu thế giới. Ngay sau khi cặp với &quot;Loki&quot; Tom Hiddleston, cặp đ&ocirc;i lại c&agrave;ng khiến c&aacute;c fan vừa ngưỡng mộ vừa ph&aacute;t hờn trước những h&agrave;nh động ngọt ng&agrave;o với cấp độ ng&agrave;y một tăng dần v&agrave; dồn dập xuất hiện trước mắt c&ocirc;ng ch&uacute;ng.</p>
<p>
	Mới đ&acirc;y, cả hai đ&atilde; c&oacute; chuyến du lịch vui vẻ tại Rome v&agrave;o thứ hai theo giờ địa phương. Sau khi li&ecirc;n tục nắm tay nhau kh&ocirc;ng rời, Taylor Swift đ&atilde; qu&agrave;ng vai Tom, rồi cả hai th&acirc;n mật trao cho nhau nụ h&ocirc;n nồng thắm, bất chấp &aacute;nh mắt người h&acirc;m mộ v&agrave; m&aacute;y ảnh của c&aacute;c ph&oacute;ng vi&ecirc;n đang chĩa v&agrave;o. Như bao cặp đ&ocirc;i đang y&ecirc;u kh&aacute;c, cả hai đang trong những ng&agrave;y th&aacute;ng mật ngọt hạnh ph&uacute;c nhất, ngay sau m&agrave;n &acirc;u yếm, Tom c&ograve;n kh&ocirc;ng khỏi cười ngất trước sự đ&aacute;ng y&ecirc;u hoặc những c&acirc;u n&oacute;i của bạn g&aacute;i m&igrave;nh.</p>
<p>
	<a data-index="0" href="http://baomoi-photo-3-td.zadn.vn/16/06/30/265/19737824/1_196398.jpg"><img alt="Loat hanh dong kho tin cua Taylor va Tom chi sau 2 tuan yeu nhau - Anh 1" src="http://baomoi-photo-3-td.zadn.vn/w460x/16/06/30/265/19737824/1_196398.jpg" title="Loạt hành động khó tin của Taylor và Tom chỉ sau 2 tuần yêu nhau - Ảnh 1" /></a></p>
<p>
	Cả hai kh&ocirc;ng ngừng nắm tay nhau</p>
<p>
	<a data-index="1" href="http://baomoi-photo-3-td.zadn.vn/16/06/30/265/19737824/2_82672.jpg"><img alt="Loat hanh dong kho tin cua Taylor va Tom chi sau 2 tuan yeu nhau - Anh 2" src="http://baomoi-photo-3-td.zadn.vn/w460x/16/06/30/265/19737824/2_82672.jpg" title="Loạt hành động khó tin của Taylor và Tom chỉ sau 2 tuần yêu nhau - Ảnh 2" /></a></p>
<p>
	&Acirc;u yếm nhau nơi c&ocirc;ng cộng</p>
<p>
	<a data-index="2" href="http://baomoi-photo-3-td.zadn.vn/16/06/30/265/19737824/3_213301.jpg"><img alt="Loat hanh dong kho tin cua Taylor va Tom chi sau 2 tuan yeu nhau - Anh 3" src="http://baomoi-photo-3-td.zadn.vn/w460x/16/06/30/265/19737824/3_213301.jpg" title="Loạt hành động khó tin của Taylor và Tom chỉ sau 2 tuần yêu nhau - Ảnh 3" /></a></p>
<p>
	Trao cho nhau nụ h&ocirc;n ngọt ng&agrave;o</p>
<p>
	<a data-index="3" href="http://baomoi-photo-3-td.zadn.vn/16/06/30/265/19737824/4_231380.jpg"><img alt="Loat hanh dong kho tin cua Taylor va Tom chi sau 2 tuan yeu nhau - Anh 4" src="http://baomoi-photo-3-td.zadn.vn/w460x/16/06/30/265/19737824/4_231380.jpg" title="Loạt hành động khó tin của Taylor và Tom chỉ sau 2 tuần yêu nhau - Ảnh 4" /></a></p>
<p>
	Cười ngất v&igrave; hạnh ph&uacute;c.</p>
<p>
	Trong suốt thời gian du lịch tại Rome, cả hai đều tay trong tay kh&ocirc;ng rời, thỉnh thoảng trao nhau những c&aacute;i nh&igrave;n hoặc h&agrave;nh động đầy y&ecirc;u thương. Ngay cả trong những l&uacute;c đi ăn trong nh&agrave; h&agrave;ng, Tom cũng thường xuy&ecirc;n h&ocirc;n tay bạn t&igrave;nh một c&aacute;ch vừa tr&acirc;n trọng vừa ngọt ng&agrave;o.</p>
<p>
	<a data-index="4" href="http://baomoi-photo-3-td.zadn.vn/16/06/30/265/19737824/5_191239.jpg"><img alt="Loat hanh dong kho tin cua Taylor va Tom chi sau 2 tuan yeu nhau - Anh 5" src="http://baomoi-photo-3-td.zadn.vn/w460x/16/06/30/265/19737824/5_191239.jpg" title="Loạt hành động khó tin của Taylor và Tom chỉ sau 2 tuần yêu nhau - Ảnh 5" /></a></p>
<p>
	Suốt thời gian ở Rome, hai người lu&ocirc;n b&ecirc;n nhau, thậm ch&iacute; kh&ocirc;ng rời tay nhau.</p>
<p>
	<a data-index="5" href="http://baomoi-photo-3-td.zadn.vn/16/06/30/265/19737824/6_132661.jpg"><img alt="Loat hanh dong kho tin cua Taylor va Tom chi sau 2 tuan yeu nhau - Anh 6" src="http://baomoi-photo-3-td.zadn.vn/w460x/16/06/30/265/19737824/6_132661.jpg" title="Loạt hành động khó tin của Taylor và Tom chỉ sau 2 tuần yêu nhau - Ảnh 6" /></a></p>
<p>
	Taylor h&ocirc;n tay bạn g&aacute;i như một qu&yacute; &ocirc;ng người Anh lịch thiệp</p>
<p>
	D&ugrave; vừa chia tay bạn trai cũ Calvin Harris chưa được bao l&acirc;u v&agrave; ch&iacute;nh thức hẹn h&ograve; với Tom chỉ được 2 tuần, những g&igrave; cặp đ&ocirc;i đang d&agrave;nh cho nhau khiến người h&acirc;m mộ đều hy vọng họ sẽ sớm tiến xa, thậm ch&iacute; đi tới h&ocirc;n nh&acirc;n. Cụ thể, Taylor đ&atilde; chia sẻ với bạn th&acirc;n của m&igrave;nh về việc Tom l&agrave; người c&ocirc; d&agrave;nh nhiều t&igrave;nh cảm nhất trong số c&aacute;c ch&agrave;ng trai. Trong tin nhắn của m&igrave;nh gửi bạn, Taylor viết: &quot;T&ocirc;i nghĩ t&ocirc;i đang y&ecirc;u v&agrave; chưa từng cảm thấy như thế n&agrave;y trước đ&acirc;y&quot;. Ngo&agrave;i ra, Taylor cho biết Tom rất l&atilde;ng mạn v&agrave; chu đ&aacute;o với c&ocirc;. Anh cực kỳ quyến rũ.</p>
<p>
	Minh chứng cho việc cặp đ&ocirc;i c&oacute; cơ hội tiến xa l&agrave; Taylor v&agrave; Tom đều đ&atilde; nhanh ch&oacute;ng giới thiệu gia đ&igrave;nh của m&igrave;nh với đối phương. Cụ thể, Taylor đ&atilde; giới thiệu Tom với bố mẹ của m&igrave;nh trong chuyến du lịch tới Nashville. Ngay sau đ&oacute;, trong l&uacute;c du lịch tại Anh v&agrave;o cuối tuần vừa qua, Taylor đ&atilde; gặp mặt gia đ&igrave;nh Tom, trong đ&oacute; c&oacute; mẹ v&agrave; chị g&aacute;i anh. C&ocirc; n&agrave;ng ng&ocirc;i sao h&agrave;ng đầu Hollywood tỏ ra v&ocirc; c&ugrave;ng th&acirc;n thiện như một ch&uacute; nai tơ b&ecirc;n mẹ của người y&ecirc;u. Ngay cả việc lựa chọn trang phục k&iacute;n đ&aacute;o c&oacute; lẽ cũng nằm trong chủ &yacute; của Taylor khi ra mắt &quot;phụ huynh&quot;. C&oacute; lẽ mọi sự cố gắng của Taylor đ&atilde; được c&ocirc;ng nhận khi Tom tỏ ra hết sức h&agrave;i l&ograve;ng nghe mẹ v&agrave; bạn g&aacute;i tr&ograve; chuyện t&acirc;m đầu &yacute; hợp.</p>
<p>
	<a data-index="6" href="http://baomoi-photo-3-td.zadn.vn/16/06/30/265/19737824/7_207463.jpg"><img alt="Loat hanh dong kho tin cua Taylor va Tom chi sau 2 tuan yeu nhau - Anh 7" src="http://baomoi-photo-3-td.zadn.vn/w460x/16/06/30/265/19737824/7_207463.jpg" title="Loạt hành động khó tin của Taylor và Tom chỉ sau 2 tuần yêu nhau - Ảnh 7" /></a></p>
<p>
	V&agrave;o thứ 5 (23/6), Taylor đ&atilde; giới thiệu Tom với cha mẹ m&igrave;nh</p>
<p>
	<a data-index="7" href="http://baomoi-photo-3-td.zadn.vn/16/06/30/265/19737824/8_246410.jpg"><img alt="Loat hanh dong kho tin cua Taylor va Tom chi sau 2 tuan yeu nhau - Anh 8" src="http://baomoi-photo-3-td.zadn.vn/w460x/16/06/30/265/19737824/8_246410.jpg" title="Loạt hành động khó tin của Taylor và Tom chỉ sau 2 tuần yêu nhau - Ảnh 8" /></a></p>
<p>
	Cặp đ&ocirc;i bay tới Anh v&agrave;o thứ 6, bằng m&aacute;y bay ri&ecirc;ng của Taylor v&agrave; thu&ecirc; một chiếc Jaguar để l&aacute;i về v&ugrave;ng n&ocirc;ng th&ocirc;n gần Ipswich, nơi Tom lớn l&ecirc;n. Tại đ&acirc;y, Taylor gặp mẹ Tom lần đầu ti&ecirc;n.</p>
<p>
	<a data-index="8" href="http://baomoi-photo-3-td.zadn.vn/16/06/30/265/19737824/9_181715.jpg"><img alt="Loat hanh dong kho tin cua Taylor va Tom chi sau 2 tuan yeu nhau - Anh 9" src="http://baomoi-photo-3-td.zadn.vn/w460x/16/06/30/265/19737824/9_181715.jpg" title="Loạt hành động khó tin của Taylor và Tom chỉ sau 2 tuần yêu nhau - Ảnh 9" /></a></p>
<p>
	Sau đ&oacute;, Taylor đ&atilde; tới gặp gia đ&igrave;nh của Tom tại Suffolk v&agrave;o Chủ nhật (26/6), trong đ&oacute; c&oacute; mẹ v&agrave; chị g&aacute;i Tom.</p>
<p>
	<a data-index="9" href="http://baomoi-photo-3-td.zadn.vn/16/06/30/265/19737824/10_132061.jpg"><img alt="Loat hanh dong kho tin cua Taylor va Tom chi sau 2 tuan yeu nhau - Anh 10" src="http://baomoi-photo-3-td.zadn.vn/w460x/16/06/30/265/19737824/10_132061.jpg" title="Loạt hành động khó tin của Taylor và Tom chỉ sau 2 tuần yêu nhau - Ảnh 10" /></a></p>
<p>
	Taylor đ&atilde; tr&ograve; chuyện th&acirc;n mật với mẹ của Tom tr&ecirc;n b&atilde;i biển, tr&ocirc;ng mặt Tom rất h&agrave;i l&ograve;ng trước c&acirc;u chuyện của mẹ v&agrave; bạn g&aacute;i.</p>
<p>
	<a data-index="10" href="http://baomoi-photo-3-td.zadn.vn/16/06/30/265/19737824/11_160533.jpg"><img alt="Loat hanh dong kho tin cua Taylor va Tom chi sau 2 tuan yeu nhau - Anh 11" src="http://baomoi-photo-3-td.zadn.vn/w460x/16/06/30/265/19737824/11_160533.jpg" title="Loạt hành động khó tin của Taylor và Tom chỉ sau 2 tuần yêu nhau - Ảnh 11" /></a></p>
<p>
	Biểu hiện cho thấy Taylor đang y&ecirc;u Tom s&acirc;u sắc, khu&ocirc;n mặt c&ocirc; kh&ocirc;ng ngừng hướng về anh.</p>
<p>
	Th&ecirc;m một dấu hiệu nữa cho thấy sự &quot;hết l&ograve;ng hết dạ&quot; của Taylor với mối t&igrave;nh n&agrave;y l&agrave; c&ocirc; đ&atilde; c&oacute; nhiều sự thay đổi ăn mặc từ khi gặp Tom. Ngo&agrave;i việc lu&ocirc;n cố gắng chọn trang phục ton sur ton với bạn trai, ăn mặc k&iacute;n đ&aacute;o khi gặp gia đ&igrave;nh đối phương, Taylor c&ograve;n chủ động &quot;tăng cường&quot; k&iacute;ch thước v&ograve;ng một của m&igrave;nh.</p>
<p>
	Trước đ&acirc;y, ngay trong cả những sự kiện, giải thưởng lớn, Taylor vẫn trung th&agrave;nh với phong c&aacute;ch &quot;m&agrave;n h&igrave;nh phẳng&quot;, tự tin với v&ograve;ng một tự nhi&ecirc;n. Nhưng sau khi hẹn Tom, c&ocirc; đ&atilde; g&acirc;y bất ngờ cho người h&acirc;m mộ v&agrave; khiến b&aacute;o ch&iacute; x&ocirc;n xao khi v&ograve;ng một bỗng to một c&aacute;ch bất thường, do d&ugrave;ng nội y loại đẩy. Chăm ch&uacute;t cho diện mạo bản th&acirc;n, chẳng phải Taylor đang muốn đẹp hơn trong mắt Tom v&agrave; ho&agrave;n to&agrave;n thu h&uacute;t được anh ch&agrave;ng?</p>
<p>
	<a data-index="11" href="http://baomoi-photo-3-td.zadn.vn/16/06/30/265/19737824/12_180577.jpg"><img alt="Loat hanh dong kho tin cua Taylor va Tom chi sau 2 tuan yeu nhau - Anh 12" src="http://baomoi-photo-3-td.zadn.vn/w460x/16/06/30/265/19737824/12_180577.jpg" title="Loạt hành động khó tin của Taylor và Tom chỉ sau 2 tuần yêu nhau - Ảnh 12" /></a></p>
<p>
	Cặp đ&ocirc;i thường ăn mặc ton sur ton v&agrave; xuất hiện v&ocirc; c&ugrave;ng đẹp đ&ocirc;i b&ecirc;n nhau</p>
<p>
	<a data-index="12" href="http://baomoi-photo-3-td.zadn.vn/16/06/30/265/19737824/13_137009.jpg"><img alt="Loat hanh dong kho tin cua Taylor va Tom chi sau 2 tuan yeu nhau - Anh 13" src="http://baomoi-photo-3-td.zadn.vn/w460x/16/06/30/265/19737824/13_137009.jpg" title="Loạt hành động khó tin của Taylor và Tom chỉ sau 2 tuần yêu nhau - Ảnh 13" /></a></p>
<p>
	Cặp đ&ocirc;i v&agrave;o buổi tối sau khi gặp bố mẹ Taylor</p>
<p>
	Kh&ocirc;ng ngại thể hiện t&igrave;nh cảm trước mắt ph&oacute;ng vi&ecirc;n, ở nơi c&ocirc;ng cộng, ngay cả khi gặp gỡ bạn b&egrave;, hai người cũng kh&ocirc;ng ngần ngại c&oacute; những h&agrave;nh động th&acirc;n mật với nhau. V&igrave; vậy kh&ocirc;ng c&oacute; g&igrave; lạ khi chỉ trong 2 tuần hẹn h&ograve;, h&igrave;nh ảnh hai người li&ecirc;n tục nắm tay, h&ocirc;n tay, &ocirc;m h&ocirc;n lu&ocirc;n d&agrave;y đặc tr&ecirc;n mạng. Người h&acirc;m mộ hy vọng v&agrave;o một t&igrave;nh y&ecirc;u s&eacute;t đ&aacute;nh, Taylor đ&atilde; t&igrave;m ra được t&igrave;nh y&ecirc;u đ&iacute;ch thực của đời m&igrave;nh sau khi trải qua cả một danh s&aacute;ch bạn trai nhiều kh&ocirc;ng thua k&eacute;m danh s&aacute;ch giải thưởng danh gi&aacute; của c&ocirc;. V&agrave; một c&aacute;i kết đẹp sẽ xảy đến với cặp đ&ocirc;i trai t&agrave;i g&aacute;i sắc ho&agrave;n hảo n&agrave;y của Hollywood.</p>
<p>
	<a data-index="13" href="http://baomoi-photo-3-td.zadn.vn/16/06/30/265/19737824/14_72041.jpg"><img alt="Loat hanh dong kho tin cua Taylor va Tom chi sau 2 tuan yeu nhau - Anh 14" src="http://baomoi-photo-3-td.zadn.vn/w460x/16/06/30/265/19737824/14_72041.jpg" title="Loạt hành động khó tin của Taylor và Tom chỉ sau 2 tuần yêu nhau - Ảnh 14" /></a></p>
<p>
	<a data-index="14" href="http://baomoi-photo-3-td.zadn.vn/16/06/30/265/19737824/15_70833.jpg"><img alt="Loat hanh dong kho tin cua Taylor va Tom chi sau 2 tuan yeu nhau - Anh 15" src="http://baomoi-photo-3-td.zadn.vn/w460x/16/06/30/265/19737824/15_70833.jpg" title="Loạt hành động khó tin của Taylor và Tom chỉ sau 2 tuần yêu nhau - Ảnh 15" /></a></p>
<p>
	<a data-index="15" href="http://baomoi-photo-3-td.zadn.vn/16/06/30/265/19737824/16_177614.jpg"><img alt="Loat hanh dong kho tin cua Taylor va Tom chi sau 2 tuan yeu nhau - Anh 16" src="http://baomoi-photo-3-td.zadn.vn/w460x/16/06/30/265/19737824/16_177614.jpg" title="Loạt hành động khó tin của Taylor và Tom chỉ sau 2 tuần yêu nhau - Ảnh 16" /></a></p>
<p>
	Cặp đ&ocirc;i kh&ocirc;ng ngừng th&acirc;n mật ngay trước mặt bạn b&egrave;</p>
', 1, 6)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (72, N'Bộ 3 HLV “The Face” đọ mặt mộc: Ai xinh hơn?', N'2017_05_31_23_15_31_668photo-2-1467102042320-021237436.jpg', N' (Emdep.vn) - Tháo bỏ lớp phấn trang điểm, Hồ Ngọc Hà, Phạm Hương hay Lan Khuê đều rất tự tin khoe mặt mộc với làn da trắng khỏe không tì vết. ', CAST(N'2017-05-31 00:00:00.000' AS DateTime), 1, N'<div>
	Th&aacute;o bỏ lớp phấn trang điểm, Hồ Ngọc H&agrave;, Phạm Hương hay Lan Khu&ecirc; đều rất tự tin khoe mặt mộc với l&agrave;n da trắng khỏe kh&ocirc;ng t&igrave; vết.</div>
<p>
	The Face đang bước v&agrave;o những tập đầu ti&ecirc;n v&agrave; bắt đầu g&acirc;y s&oacute;ng gi&oacute; bởi những m&agrave;n &ldquo;đấu tr&iacute;&rdquo; ra mặt của c&aacute;c HLV. Đ&uacute;ng như dự đo&aacute;n ban đầu của ph&iacute;a sản xuất lẫn kh&aacute;n giả, bộ 3 Hồ Ngọc H&agrave; - Phạm Hương - Lan Khu&ecirc; đang &ldquo;h&acirc;m n&oacute;ng&rdquo; chương tr&igrave;nh bởi kh&ocirc;ng chỉ việc gi&agrave;nh giật th&iacute; sinh, họ c&ograve;n được xem l&agrave; &ldquo;kh&ocirc;ng bằng l&ograve;ng nhau&rdquo; giữa đời thường. Bỏ qua những yếu tố ấy, nh&igrave;n v&agrave;o d&agrave;n th&iacute; sinh năm nay, c&oacute; thể ước chừng được chất lượng của The Face m&ugrave;a đầu ti&ecirc;n sẽ rất kịch t&iacute;nh, hấp dẫn.</p>
<p>
	Để trở th&agrave;nh gi&aacute;m khảo chương tr&igrave;nh gương mặt ưa chuộng về quảng c&aacute;o, H&agrave; Hồ, Phạm Hương, Lan Khu&ecirc; kh&ocirc;ng chỉ đẹp xuất sắc trong mỗi khu&ocirc;n ảnh, concept, m&agrave; với mặt mộc họ c&ograve;n khiến nhiều người &ldquo;say m&ecirc;&rdquo;. Nếu như nhiều người đẹp, ca sĩ hay Hoa hậu ngại khoe mặt mộc v&igrave; sợ sự đối lập khiến h&igrave;nh ảnh thấp k&eacute;m hơn th&igrave; bộ 3 HLV The Face lại kh&ocirc;ng ngần ngại khoe ảnh &ldquo;b&igrave;nh d&acirc;n&rdquo; selfie nhưng vẫn giữ n&eacute;t đ&aacute;ng y&ecirc;u, ưa nh&igrave;n v&agrave; l&agrave;n da hồng h&agrave;o, tươi trẻ.</p>
<p>
	Hồ Ngọc H&agrave; - &ldquo;Nữ ho&agrave;ng mặt mộc&rdquo;</p>
<p>
	Nếu như những bức ảnh h&agrave;o nho&aacute;ng khoe nhan sắc mỹ miều với lớp trang điểm sắc b&eacute;n khiến Hồ Ngọc H&agrave; tỏa s&aacute;ng tr&ecirc;n thảm đỏ, th&igrave; c&ocirc; cũng kh&ocirc;ng ngại khoe mặt mộc kh&ocirc;ng son phấn khiến nhiều người ghen tị. &ldquo;B&agrave; mẹ một con&rdquo; tuy lu&ocirc;n đối mặt với scandal, &aacute;p lực c&ocirc;ng việc nhưng H&agrave; Hồ vẫn lu&ocirc;n giữ được sự tươi trẻ đ&aacute;ng nể phục.</p>
<p>
	<a data-index="0" href="http://baomoi-photo-1-td.zadn.vn/16/06/30/265/19736394/1_101081.jpg"><img alt="Bo 3 HLV “The Face” do mat moc: Ai xinh hon? - Anh 1" src="http://baomoi-photo-1-td.zadn.vn/w460x/16/06/30/265/19736394/1_101081.jpg" title="Bộ 3 HLV “The Face” đọ mặt mộc: Ai xinh hơn? - Ảnh 1" /></a></p>
<p>
	Nh&igrave;n v&agrave;o ảnh gốc chụp selfie kh&ocirc;ng son phấn, kh&ocirc;ng kh&oacute; để thấy r&otilde; gương mặt c&aacute; t&iacute;nh của H&agrave; Hồ.</p>
<p>
	<a data-index="1" href="http://baomoi-photo-1-td.zadn.vn/16/06/30/265/19736394/2_264852.jpg"><img alt="Bo 3 HLV “The Face” do mat moc: Ai xinh hon? - Anh 2" src="http://baomoi-photo-1-td.zadn.vn/w460x/16/06/30/265/19736394/2_264852.jpg" title="Bộ 3 HLV “The Face” đọ mặt mộc: Ai xinh hơn? - Ảnh 2" /></a></p>
<p>
	H&agrave; Hồ c&oacute; b&iacute; quyết ăn uống, chăm s&oacute;c, tập thể thao v&agrave; giữ g&igrave;n l&agrave;n da khỏe đẹp khiến ai cũng muốn học hỏi</p>
<p>
	Phạm Hương - N&eacute;t đ&aacute;ng y&ecirc;u sau danh xưng Hoa hậu đẹp nhất Việt Nam</p>
<p>
	Sau Miss Universe 2015, d&ugrave; ra về tay trắng nhưng h&igrave;nh ảnh của Phạm Hương r&otilde; r&agrave;ng đ&atilde; n&acirc;ng l&ecirc;n một bậc cao đ&aacute;ng kể. Kh&ocirc;ng chỉ đứng trong nh&oacute;m sao hạng A, Phạm Hương c&ograve;n được nhận x&eacute;t l&agrave; c&oacute; nhan sắc đẹp nhất trong số c&aacute;c Hoa hậu từng đăng quang trong c&aacute;c cuộc thi ở Việt Nam. Tham gia The Face, Phạm Hương c&ograve;n cho thấy g&oacute;c nh&igrave;n mới về con người của c&ocirc;, rất th&ocirc;ng minh, nhạy b&eacute;n v&agrave; kh&ocirc;ng chịu nh&uacute;n nhường bất kỳ ai.</p>
<p>
	Về khoản sắc đẹp, Phạm Hương kh&ocirc;ng hề k&eacute;m cạnh bất cứ mỹ nh&acirc;n n&agrave;o về khoản mặt mộc. C&ocirc; kh&ocirc;ng ngần ngại chụp ảnh selfie với cặp k&iacute;nh cận kiểu &ldquo;tr&iacute; thức&rdquo; quen thuộc tr&ecirc;n giảng đường. Đằng sau một h&igrave;nh ảnh Hoa hậu sexy, Phạm Hương của đời thường vẫn kh&aacute; giản dị, chỉ &aacute;o sơmi, quần jean, hay v&aacute;y đơn giản với lớp trang điểm rất nhẹ.</p>
<p>
	<a data-index="2" href="http://baomoi-photo-1-td.zadn.vn/16/06/30/265/19736394/3_111882.jpg"><img alt="Bo 3 HLV “The Face” do mat moc: Ai xinh hon? - Anh 3" src="http://baomoi-photo-1-td.zadn.vn/w460x/16/06/30/265/19736394/3_111882.jpg" title="Bộ 3 HLV “The Face” đọ mặt mộc: Ai xinh hơn? - Ảnh 3" /></a></p>
<p>
	Sở hữu nhiều đường n&eacute;t đẹp tr&ecirc;n gương mặt, Phạm Hương kh&ocirc;ng ngại chụp ảnh khoe ch&acirc;n dung thật sự của m&igrave;nh.</p>
<p>
	<a data-index="3" href="http://baomoi-photo-1-td.zadn.vn/16/06/30/265/19736394/4_91960.jpg"><img alt="Bo 3 HLV “The Face” do mat moc: Ai xinh hon? - Anh 4" src="http://baomoi-photo-1-td.zadn.vn/w460x/16/06/30/265/19736394/4_91960.jpg" title="Bộ 3 HLV “The Face” đọ mặt mộc: Ai xinh hơn? - Ảnh 4" /></a></p>
<p>
	Lan Khu&ecirc; - Kiểu đẹp sắc n&eacute;t như Si&ecirc;u mẫu</p>
<p>
	Từng l&agrave; một Si&ecirc;u mẫu c&oacute; giải thưởng danh gi&aacute;, thế n&ecirc;n d&ugrave; đ&atilde; l&agrave; Hoa kh&ocirc;i &Aacute;o d&agrave;i hay Top 11 Miss World 2015 th&igrave; mọi người vẫn quen gọi c&ocirc; l&agrave; &ldquo;Si&ecirc;u mẫu&rdquo;. Quả thật, Lan Khu&ecirc; c&oacute; kh&iacute; chất của một người mẫu chuy&ecirc;n nghiệp với gương mặt g&oacute;c cạnh, sắc b&eacute;n trong &aacute;nh mắt v&agrave; c&oacute; ch&uacute;t &ldquo;đanh đ&aacute;&rdquo;. Tham gia The Face, ngay tập đầu ti&ecirc;n, Lan Khu&ecirc; đ&atilde; c&oacute; lượng fan đ&aacute;ng nể chỉ v&igrave; một biểu cảm &ldquo;đanh đ&aacute;&rdquo; được cho l&agrave; đối đầu với Phạm Hương.</p>
<p>
	<a data-index="4" href="http://baomoi-photo-1-td.zadn.vn/16/06/30/265/19736394/5_102383.jpg"><img alt="Bo 3 HLV “The Face” do mat moc: Ai xinh hon? - Anh 5" src="http://baomoi-photo-1-td.zadn.vn/w460x/16/06/30/265/19736394/5_102383.jpg" title="Bộ 3 HLV “The Face” đọ mặt mộc: Ai xinh hơn? - Ảnh 5" /></a></p>
<p>
	<a data-index="5" href="http://baomoi-photo-1-td.zadn.vn/16/06/30/265/19736394/6_73965.jpg"><img alt="Bo 3 HLV “The Face” do mat moc: Ai xinh hon? - Anh 6" src="http://baomoi-photo-1-td.zadn.vn/w460x/16/06/30/265/19736394/6_73965.jpg" title="Bộ 3 HLV “The Face” đọ mặt mộc: Ai xinh hơn? - Ảnh 6" /></a></p>
<p>
	X&eacute;t về khoản mặt mộc, nếu bỏ đi lớp phấn son c&aacute; t&iacute;nh, Lan Khu&ecirc; tr&ocirc;ng đ&aacute;ng y&ecirc;u, dễ thương hơn hẳn.</p>
', 1, 6)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (73, N'Chân dung "tuyệt sắc giai nhân" vừa đăng quang Hoa hậu Thái Lan', N'2017_05_31_23_16_45_463photo-1-1467021636829-010145301.jpg', N' (Emdep.vn) - Tân Miss Grand Thailand 2016 - Supaporn Malisorn là một mỹ nhân sở hữu vẻ đẹp lộng lẫy, mê đắm mọi ánh nhìn. ', CAST(N'2017-05-31 00:00:00.000' AS DateTime), 0, N'<p class="Lead">
	T&acirc;n Miss Grand Thailand 2016 - Supaporn Malisorn l&agrave; một mỹ nh&acirc;n sở hữu vẻ đẹp lộng lẫy, m&ecirc; đắm mọi &aacute;nh nh&igrave;n.</p>
<div>
	<img alt="Chân dung ‘tuyệt sắc giai nhân’ vừa đăng quang Hoa hậu Hoà bình Thái Lan 2016" border="0" class="headimg" height="900" src="http://www.cherryradio.com.au/images/stories/articles/1958_cr_5771d296b1ac6.jpg" style="; border: 0px;" title="Chân dung ‘tuyệt sắc giai nhân’ vừa đăng quang Hoa hậu Hoà bình Thái Lan 2016" width="600" /></div>
<div>
	<em>ảnh minh họa</em></div>
<p>
	V&agrave;o ng&agrave;y 26/6, đ&ecirc;m chung kết cuộc thi Hoa hậu H&ograve;a b&igrave;nh Th&aacute;i Lan 2016 đ&atilde; diễn ra th&agrave;nh c&ocirc;ng tốt đẹp với chiến thắng thuộc về người đẹp Supaporn Malisorn, đại diện nhan sắc của tỉnh Songkhla.</p>
<p>
	Supaporn Malisorn năm nay 22 tuổi v&agrave; sở hữu gương mặt tuyệt xinh, chiều cao 1m75 c&ugrave;ng body rất bốc lửa.</p>
', 1, 6)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (74, N'Phải làm những điều này để không mang bệnh khi đi vệ sinh ở nơi công cộng', N'2017_05_31_23_19_10_832flushingtoilet-e1429549756831-001411384.jpg', N' (Emdep.vn) - Nếu không muốn bị mắc bệnh, bạn cần ghi nhớ các cách sử dụng nhà vệ sinh công cộng an toàn. ', CAST(N'2017-05-31 00:00:00.000' AS DateTime), 1, N'<h2 style="font-size:20px;line-height:30px;margin-bottom:20px;">
	Nếu kh&ocirc;ng muốn bị mắc bệnh, bạn cần ghi nhớ c&aacute;c c&aacute;ch sử dụng nh&agrave; vệ sinh c&ocirc;ng cộng an to&agrave;n.</h2>
<p>
	&nbsp;</p>
<p>
	<img alt="Đừng đi vệ sinh công cộng nếu như bạn không làm những điều này" src="http://thumb.connect360.vn/unsafe/560x0/imgs.emdep.vn/Share/Image/2017/05/28/u-shaped-toilet-seat-bowl-560x390-001142482.jpg" width="100%" /></p>
<p>
	Nếu nh&agrave; vệ sinh c&oacute; nắp đậy, bạn sẽ kh&ocirc;ng phải qu&aacute; lo lắng đến vi khuẩn g&acirc;y bệnh.&nbsp;Tuy nhi&ecirc;n, kh&ocirc;ng phải tất cả c&aacute;c nh&agrave; vệ sinh đều c&oacute; nắp đậy. Bạn c&oacute; thể nhiễm khoảng 200 vi khuẩn ph&acirc;n tr&ecirc;n mỗi centimet vu&ocirc;ng của bệ x&iacute; nếu như d&ugrave;ng bệ ngồi xổm hoặc bệ ngồi kh&ocirc;ng c&oacute; nắp. Ngo&agrave;i ra, kh&ocirc;ng gian trong nh&agrave; vệ sinh c&ocirc;ng cộng cũng chứa &iacute;t nhất 500 vi khuẩn trong mỗi centimet vu&ocirc;ng.</p>
<p>
	<strong>L&agrave;m thế n&agrave;o để sử dụng nh&agrave; vệ sinh c&ocirc;ng cộng an to&agrave;n?</strong></p>
<p>
	Trước d&ugrave;ng nh&agrave; vệ sinh c&ocirc;ng cộng, bạn đừng qu&ecirc;n những nguy&ecirc;n tắc dưới đ&acirc;y:</p>
<p>
	- Lau bệ ngồi bồn cầu</p>
<p>
	Nếu bạn mang khăn giấy, h&atilde;y sử dụng ch&uacute;ng để lau bệ nh&agrave; vệ sinh.&nbsp;Nếu kh&ocirc;ng c&oacute;, bạn chỉ cần sử dụng giấy vệ sinh c&oacute; sẵn.</p>
<p>
	- L&oacute;t giấy l&ecirc;n bồn cầu vệ sinh</p>
<p>
	<img alt="Đừng đi vệ sinh công cộng nếu như bạn không làm những điều này" src="http://thumb.connect360.vn/unsafe/700x0/imgs.emdep.vn/Share/Image/2017/05/28/18-toilet-paper-on-toilet-seats-fb-918x482-001224586.jpg" width="100%" /></p>
<p>
	D&ugrave;ng giấy l&oacute;t l&ecirc;n bồn cấu vệ sinh cũng l&agrave; một trong những c&aacute;ch ngăn ngừa vi khuẩn tiếp x&uacute;c với da kh&aacute; hiệu quả. Bạn c&oacute; thể lấy giấy l&oacute;t chuy&ecirc;n dụng hay giấy vệ sinh th&ocirc;ng thường để l&oacute;t l&ecirc;n.</p>
<p>
	- Xả nước an to&agrave;n</p>
<p>
	<img alt="Đừng đi vệ sinh công cộng nếu như bạn không làm những điều này" src="http://thumb.connect360.vn/unsafe/600x0/imgs.emdep.vn/Share/Image/2017/05/28/flushingtoilet-e1429549756831-001411384.jpg" width="100%" /></p>
<p>
	Khi xả nước, bạn c&oacute; thể sử dụng ch&acirc;n thay v&igrave; tay. Khi dội bồn cầu, bạn cũng n&ecirc;n n&iacute;n thở để tr&aacute;nh h&iacute;t v&agrave;o c&aacute;c kh&iacute; độc hại.&nbsp;</p>
<p>
	- Rửa tay</p>
<p>
	Bồn rửa tay nguy hiểm hơn bồn cầu rất nhiều. V&igrave; bồn rửa thường sũng nước, bạn c&oacute; thể dễ d&agrave;ng l&acirc;y nhiễm vi khuẩn khi mở nắp v&ograve;i nướcngay sau khi đi vệ sinh. Thậm ch&iacute; vi khuẩn c&oacute; thể l&acirc;y lan sang đồ c&aacute; nh&acirc;n kh&aacute;c của bạn. Để bảo vệ sức khỏe, tốt nhất bạn h&atilde;y rửa tay bằng x&agrave; ph&ograve;ng thật kỹ.</p>
<p>
	- Lau kh&ocirc; tay</p>
<p>
	Sau khi rửa, bạn n&ecirc;n lau kh&ocirc; tay.&nbsp;Nếu nh&agrave; vệ sinh kh&ocirc;ng c&oacute; m&aacute;y sấy kh&ocirc; bạn h&atilde;y d&ugrave;ng khăn giấy lau sạch.</p>
<p>
	- Sử dụng nước rửa tay tiệt tr&ugrave;ng&nbsp;</p>
<p>
	<a href="http://tinmoi24.vn/phai-lam-nhung-dieu-nay-de-khong-mang-benh-khi-di-ve-sinh-o-noi-cong-cong/news-82-6-647462ede054cf95e35fa3b141a031b6" target="_blank"><img alt=" nhà vệ sinh công cộng" src="http://thumb.connect360.vn/unsafe/679x0/imgs.emdep.vn/Share/Image/2017/05/28/hand-sanitizer-58b5afae5f9b586046b194c7-001515188.jpg" width="100%" /></a></p>
<p>
	Khi bạn ra khỏi ph&ograve;ng tắm, đừng qu&ecirc;n sử dụng nước rửa tay tiệt tr&ugrave;ng&nbsp;.</p>
<p>
	- Tr&aacute;nh tiếp x&uacute;c đồ trong nh&agrave; vệ sinh</p>
<p>
	Nếu muốn đảm bảo sức khỏe, bạn n&ecirc;n hạn chế động chạm v&agrave;o bất cứ thứ g&igrave; trong nh&agrave; vệ sinh như v&ograve;i nước, tay nắm cửa v&agrave; cần gạt nước.</p>
', 1, 7)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (75, N'Khám phá bí mật sống thọ của cụ bà Ấn Độ', N'2017_05_31_23_20_06_116gia-3-155529444.jpg', N' (Emdep.vn) - Người Nhật uống trà xanh mỗi ngày, ăn hải sản và thức ăn lên men thường xuyên, đi bộ và thiền định... để khỏe mạnh và sống thọ. ', CAST(N'2017-05-31 00:00:00.000' AS DateTime), 3, N'<p>
	<span style="">Theo Tạp ch&iacute; <a class="seo-suggest-link" href="http://soha.vn//9-dau-hieu-suc-khoe-dang-ngo-o-nam-gioi-20170111141658724.htm" target="_blank" title="9 dấu hiệu sức khỏe đáng ngờ ở nam giới ">sức khỏe</a> (Medical Journal), Cụ b&agrave; Talley sinh ng&agrave;y 23/5/1899 tại Georgia (Mỹ) v&agrave; lớn l&ecirc;n trong một trang trại trồng b&ocirc;ng v&agrave; lạc.</span></p>
<p>
	Năm 1936, cụ chuyển tới Michigan sống c&ugrave;ng chồng, đến năm 1988 th&igrave; chồng b&agrave; qua đời. Con g&aacute;i của cụ mặc d&ugrave; đ&atilde; hơn 76 tuổi nhưng vẫn c&oacute; sức khỏe tốt v&agrave; chăm s&oacute;c cụ h&agrave;ng ng&agrave;y.</p>
<div class="VCSortableInPreviewMode noCaption active" style="" type="Photo">
	<div>
		<img alt="Cụ bà thọ hơn 116 tuổi nhờ 7 bí quyết bạn hoàn toàn có thể áp dụng được - Ảnh 1." data-original="http://sohanews.sohacdn.com/2017/http-sohanews-sohacdn-com-thumb-w-660-2017-photo-1-1484210379448-1484210606060.png" height="" id="img_2eb17730-d8a3-11e6-8a8a-7d52ccdc1e1f" rel="lightbox" src="http://sohanews.sohacdn.com/2017/http-sohanews-sohacdn-com-thumb-w-660-2017-photo-1-1484210379448-1484210606060.png" style="max-width:100%;" title="Cụ bà thọ hơn 116 tuổi nhờ 7 bí quyết bạn hoàn toàn có thể áp dụng được - Ảnh 1." type="photo" width="" /></div>
</div>
<p>
	Talley cho biết, cụ kh&ocirc;ng bao giờ h&uacute;t thuốc, <a class="seo-suggest-link" href="http://soha.vn//6-dieu-nam-gioi-dung-bao-gio-lam-sau-khi-uong-ruou-tet-lai-cang-phai-luu-y-20170109065708502.htm" target="_blank" title="6 điều nam giới đừng bao giờ làm sau khi uống rượu, Tết lại càng phải lưu ý! ">uống rượu</a>, chỉ mới từng một lần phẫu thuật amidan. Trong ng&agrave;y sinh nhật tuổi thứ 115, cụ cũng đ&atilde; ho&agrave;n th&agrave;nh chương tr&igrave;nh kh&aacute;m sức khỏe định kỳ v&agrave; được b&aacute;c sĩ cho biết cơ thể vẫn đang rất khỏe mạnh.</p>
<p>
	Về kinh nghiệm để c&oacute; sức khỏe tốt v&agrave; sỡ hữu số tuổi đạt kỷ lục thế giới như cụ, Talley tiết lộ 7 lời khuy&ecirc;n để c&oacute; cuộc sống vui vẻ khỏe mạnh như sau.</p>
<p>
	<b><i>1. Ki&ecirc;n tr&igrave; theo đuổi phương ch&acirc;m sống tốt</i></b></p>
<p>
	Bạn muốn người kh&aacute;c đối xử với m&igrave;nh thế n&agrave;o th&igrave; h&atilde;y đối xử với họ như thế.</p>
<p>
	<b><i>2. Duy tr&igrave; th&aacute;i độ v&agrave; g&oacute;c nh&igrave;n h&agrave;i hước</i></b></p>
<p>
	Cụ b&agrave; thường nhớ lại những kinh nghiệm cuộc sống hay những nụ cười vụng về trước đ&acirc;y của m&igrave;nh v&agrave; nghĩ về những điều vui vẻ.</p>
<p>
	<b><i>3. Thường xuy&ecirc;n tập thể dục</i></b></p>
<p>
	B&agrave; th&iacute;ch l&agrave;m việc v&agrave; tập thể dục từ khi c&ograve;n trẻ, duy tr&igrave; đến năm 102 tuổi vẫn tập b&agrave;i tập ngồi xổm, đứng l&ecirc;n ngồi xuống. Cho đến 104 tuổi, cụ Talley vẫn giữ th&oacute;i quen chơi n&eacute;m b&oacute;ng bowling.</p>
<div class="VCSortableInPreviewMode GifPhoto noCaption" style="" type="Photo">
	<div>
		<img alt="Cụ bà thọ hơn 116 tuổi nhờ 7 bí quyết bạn hoàn toàn có thể áp dụng được - Ảnh 2." data-original="http://sohanews.sohacdn.com/2017/photo-1-1484210652443.gif" height="" id="img_4b0868d0-d8a3-11e6-8a8a-7d52ccdc1e1f" rel="lightbox" src="http://sohanews.sohacdn.com/2017/photo-1-1484210652443.gif" style="max-width:100%;" title="Cụ bà thọ hơn 116 tuổi nhờ 7 bí quyết bạn hoàn toàn có thể áp dụng được - Ảnh 2." type="photo" width="" /></div>
</div>
<p>
	<i><b style="font-size: 12pt;">4. Chế độ <a class="seo-suggest-link" href="http://soha.vn//hoc-sinh-lop-2-da-day-thi-hang-loat-bac-si-canh-bao-2-thoi-diem-nen-chu-y-che-do-an-uong-20161222180937928.htm" target="_blank" title="Học sinh lớp 2 đã dậy thì hàng loạt, bác sĩ cảnh báo 2 thời điểm nên chú ý chế độ ăn uống ">ăn uống</a> kh&ocirc;ng n&ecirc;n ki&ecirc;ng khem nghi&ecirc;m ngặt qu&aacute; mức</b></i></p>
<p>
	Thi thoảng c&oacute; thể &quot;nu&ocirc;ng chiều&quot; bản th&acirc;n v&agrave; ăn uống những m&oacute;n ăn theo sở th&iacute;ch của m&igrave;nh. M&oacute;n ăn m&agrave; cụ Talley th&iacute;ch nhất ch&iacute;nh l&agrave; ch&acirc;n gi&ograve; hay lưỡi lợn nấu đ&ocirc;ng. Cụ cũng th&iacute;ch ăn đồ ngọt.</p>
<p>
	<b><i>5. Duy tr&igrave; t&iacute;n ngưỡng</i></b></p>
<p>
	Bạn c&oacute; thể duy tr&igrave; t&iacute;n ngưỡng của m&igrave;nh để c&oacute; thể gửi gắm niềm tin của m&igrave;nh trong những khi gặp thất bại, chia sẻ khi kh&oacute; khăn v&agrave; giữ cho nhịp sống c&acirc;n bằng, h&agrave;i h&ograve;a.</p>
<p>
	<b><i>6. Tr&acirc;n trọng t&igrave;nh cảm v&agrave; cuộc sống gia đ&igrave;nh</i></b></p>
<p>
	Cụ Talley th&iacute;ch sống c&ugrave;ng với con g&aacute;i m&igrave;nh, hoạt động y&ecirc;u th&iacute;ch h&agrave;ng ng&agrave;y của cụ l&agrave; chơi với chắt.</p>
<div class="VCSortableInPreviewMode" style="" type="Photo">
	<div>
		<img alt="Cụ bà thọ hơn 116 tuổi nhờ 7 bí quyết bạn hoàn toàn có thể áp dụng được - Ảnh 3." data-original="http://sohanews.sohacdn.com/2017/http-sohanews-sohacdn-com-thumb-w-660-2017-photo-1-1484210564112-1484210602767.png" height="" id="img_2d4f0100-d8a3-11e6-8a8a-7d52ccdc1e1f" rel="lightbox" src="http://sohanews.sohacdn.com/2017/http-sohanews-sohacdn-com-thumb-w-660-2017-photo-1-1484210564112-1484210602767.png" style="max-width:100%;" title="Cụ bà thọ hơn 116 tuổi nhờ 7 bí quyết bạn hoàn toàn có thể áp dụng được - Ảnh 3." type="photo" width="" /></div>
	<div class="PhotoCMS_Caption" style="width: 660px; margin: 0px auto;">
		<p data-placeholder="[nhập chú thích]">
			Cụ b&agrave; Talley bế chắt ngoại</p>
	</div>
</div>
<p>
	<span style=""><i><b>7. Lu&ocirc;n khi&ecirc;m tốn v&agrave; kh&ocirc;n ngoan</b></i></span></p>
<p>
	<span style="">Mặc d&ugrave; cụ Talley c&oacute; tr&igrave;nh độ học vấn kh&ocirc;ng cao, nhưng cụ lu&ocirc;n lu&ocirc;n giữ th&aacute;i độ khi&ecirc;m tốn v&agrave; lịch sự, lu&ocirc;n d&ugrave;ng những khả năng tốt nhất của m&igrave;nh để gi&uacute;p đỡ người kh&aacute;c hết m&igrave;nh.</span></p>
<p>
	<span style="">Cụ b&agrave; Jeralean Talley đ&atilde; từng l&agrave; người phụ nữ giữ kỷ lục sống thọ nhất thế giới. Cụ b&agrave; mất ng&agrave;y 17/6/2015 (thọ 116 tuổi 25 ng&agrave;y).</span></p>
', 1, 7)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (76, N'Loại cây có hoa đẹp nhưng lá rất độc', N'2017_05_31_23_21_09_191truc-dao-o-10165812.jpg', N' (Emdep.vn) - Trúc đào là cây thuốc trong đông y điều trị nhiều bệnh và rất tốt cho người suy tim. Nhưng nếu không may ăn phải lá trúc đào nguy cơ bị ngộ độc cao. ', CAST(N'2017-05-31 00:00:00.000' AS DateTime), 2, N'<h2>
	Hoa loa k&egrave;n (k&egrave;n của thi&ecirc;n thần, hơi thở của quỷ)</h2>
<p>
	Nh&igrave;n bề ngo&agrave;i, những b&ocirc;ng hoa loa k&egrave;n m&agrave;u trắng hoặc v&agrave;ng, trắng pha hồng, đỏ n&agrave;y dường như v&ocirc; hại. Nhưng đ&acirc;y lại l&agrave; lo&agrave;i c&acirc;y c&oacute; độc tố rất khủng khiếp. Xuất xứ từ Colombia, lo&agrave;i c&acirc;y n&agrave;y được gọi với t&ecirc;n gọi &ldquo;hơi thở của quỷ&rdquo;.</p>
<p>
	<img alt="Hoa &quot;hơi thở của quỷ&quot; được cho là có chất kịch độc khiến nạn nhân rơi vào tình trạng vô thức, không kiểm soát được hành vi." data-i="0" src="http://img.khoahoc.tv/photos/image/2016/04/02/hoa-doc-01.jpg" title="Hoa &quot;hơi thở của quỷ&quot; được cho là có chất kịch độc khiến nạn nhân rơi vào tình trạng vô thức, không kiểm soát được hành vi." /><br />
	Hoa &quot;hơi thở của quỷ&quot; được cho l&agrave; c&oacute; chất kịch độc khiến nạn nh&acirc;n rơi v&agrave;o t&igrave;nh trạng v&ocirc; thức, kh&ocirc;ng kiểm so&aacute;t được h&agrave;nh vi.</p>
<p>
	Chỉ cần ngửi hoa, nạn nh&acirc;n sẽ lập tức rơi v&agrave;o t&igrave;nh trạng v&ocirc; thức, kh&ocirc;ng kiểm so&aacute;t được h&agrave;nh vi, n&oacute;i năng lảm nhảm. Chất chiết xuất từ hoa n&agrave;y được cho l&agrave; phương tiện để bọn tội phạm th&ocirc;i mi&ecirc;n, đầu độc nạn nh&acirc;n để lừa lấy t&agrave;i sản hoặc h&atilde;m hiếp phụ nữ m&agrave; nạn nh&acirc;n kh&ocirc;ng hề hay biết.</p>
<h2>
	Hoa tử đằng (đậu t&iacute;a)</h2>
<p>
	<img alt="Nếu ăn phải hoa tử đằng sẽ bị trúng độc, chuột rút và tiêu chảy." data-i="1" src="http://img.khoahoc.tv/photos/image/2016/04/02/hoa-doc-02.jpg" title="Nếu ăn phải hoa tử đằng sẽ bị trúng độc, chuột rút và tiêu chảy." /><br />
	Nếu ăn phải hoa tử đằng sẽ bị tr&uacute;ng độc, chuột r&uacute;t v&agrave; ti&ecirc;u chảy.</p>
<p>
	L&agrave; lo&agrave;i hoa họ đậu, d&acirc;y leo, hoa th&agrave;nh từng ch&ugrave;m m&agrave;u t&iacute;m rất đẹp, được trồng l&agrave;m cảnh phổ biến ở Trung Quốc, Nhật Bản, H&agrave;n Quốc&hellip;</p>
<p>
	Hoa tử đằng vừa đẹp, vừa c&oacute; m&ugrave;i thơm. Tuy nhi&ecirc;n hạt hoa tử đằng rất độc. Nếu ăn phải sẽ bị tr&uacute;ng độc, n&ocirc;n n&oacute;i, chuột r&uacute;t v&agrave; ti&ecirc;u chảy.</p>
<h2>
	Muồng ho&agrave;ng yến (hoa b&ograve; cạp v&agrave;ng, hoa osaka)</h2>
<p>
	<img alt="Cả lá, hoa, quả của cây muồng hoàng yến đều có thể gây ngộ độc nếu ăn phải. " data-i="2" src="http://img.khoahoc.tv/photos/image/2016/04/02/hoa-doc-03.jpg" title="Cả lá, hoa, quả của cây muồng hoàng yến đều có thể gây ngộ độc nếu ăn phải. " /><br />
	Cả l&aacute;, hoa, quả của c&acirc;y muồng ho&agrave;ng yến đều c&oacute; thể g&acirc;y ngộ độc nếu ăn phải.</p>
<p>
	Cũng l&agrave; lo&agrave;i c&acirc;y hoa cảnh họ đậu, muồng ho&agrave;ng yến l&agrave; c&acirc;y th&acirc;n gỗ, t&aacute;n tr&ograve;n. Hoa nở v&agrave;ng th&agrave;nh từng ch&ugrave;m rực rỡ từ th&aacute;ng 6 đến th&aacute;ng 9 h&agrave;ng năm. Ch&ugrave;m hoa d&agrave;i, rủ xuống, d&agrave;i 20-40 cm, cụm hoa lớn.</p>
<p>
	Tr&aacute;i muồng ho&agrave;ng yến d&agrave;i, trong c&oacute; hạt h&igrave;nh tr&aacute;i xoan. Cả hoa, l&aacute;, quả v&agrave; hạt muồng ho&agrave;ng yến đều c&oacute; chất độc, nếu ăn phải sẽ g&acirc;y ngộ độc.</p>
<h2>
	Hoa cẩm t&uacute; cầu (hoa đĩa)</h2>
<p>
	<img alt="Trong lịch sử, nữ hoàng Cleopatra đã từng ép người hầu tự tử bằng loài hoa này." data-i="3" src="http://img.khoahoc.tv/photos/image/2016/04/02/hoa-doc-04.jpg" title="Trong lịch sử, nữ hoàng Cleopatra đã từng ép người hầu tự tử bằng loài hoa này." /><br />
	Trong lịch sử, nữ ho&agrave;ng Cleopatra đ&atilde; từng &eacute;p người hầu tự tử bằng lo&agrave;i hoa n&agrave;y.</p>
<p>
	Hoa cẩm t&uacute; cầu với những đ&oacute;a hoa h&igrave;nh cầu m&agrave;u hồng, trắng, xanh rất đẹp ta vẫn thấy được trồng l&agrave;m cảnh thật ra kh&ocirc;ng phải l&agrave; lo&agrave;i c&acirc;y hiền l&agrave;nh. Cả l&aacute; v&agrave; hoa cẩm t&uacute; cầu đều c&oacute; chứa độc tố. Trong lịch sử, nữ ho&agrave;ng Cleopatra đ&atilde; từng &eacute;p người hầu tự tử bằng lo&agrave;i hoa n&agrave;y.</p>
<p>
	Do đ&oacute;, nếu sơ &yacute; ăn phải độc tố n&agrave;y c&oacute; thể lập tức bị ngứa ng&aacute;y, n&ocirc;n &oacute;i, đổ mồ h&ocirc;i v&agrave; đau bụng dữ dội. Nghi&ecirc;m trọng hơn c&oacute; thể dẫn tới h&ocirc;n m&ecirc;, co giật, rối loạn tuần ho&agrave;n m&aacute;u.</p>
<h2>
	Hoa rum</h2>
<p>
	<img alt="Loại hoa được rất nhiều cô dâu ưa chuộng này có chứa nhiều chất độc calcium oxalate." data-i="4" src="http://img.khoahoc.tv/photos/image/2016/04/02/hoa-doc-05.jpg" title="Loại hoa được rất nhiều cô dâu ưa chuộng này có chứa nhiều chất độc calcium oxalate." /><br />
	Loại hoa được rất nhiều c&ocirc; d&acirc;u ưa chuộng n&agrave;y c&oacute; chứa nhiều chất độc calcium oxalate.</p>
<p>
	L&aacute; v&agrave; củ của hoa rum c&oacute; chứa nhiều chất độc đường ruột calcium oxalate. Nếu nhầm lẫn hoặc sơ &yacute; ăn phải sẽ bị ngộ độc, triệu chứng thường thấy l&agrave; &oacute;i mửa, bỏng miệng, t&ecirc; lưỡi, sưng bề mặt ni&ecirc;m mạc.</p>
<h2>
	L&ocirc; hội (nha đam)</h2>
<p>
	Đ&acirc;y l&agrave; lo&agrave;i c&acirc;y rất quen thuộc, được d&ugrave;ng rộng r&atilde;i để chăm s&oacute;c sắc đẹp, nấu ch&egrave; v.v&hellip; Tuy nhi&ecirc;n, loại c&acirc;y n&agrave;y được c&aacute;c thầy thuốc Đ&ocirc;ng y xếp v&agrave;o loại thuốc tẩy xổ, trục thủy.</p>
<p>
	<img alt="Phụ nữ có thai nếu ăn nhiều nha đam sẽ có nguy cơ bị sảy thai." data-i="5" src="http://img.khoahoc.tv/photos/image/2016/04/02/hoa-doc-06.jpg" title="Phụ nữ có thai nếu ăn nhiều nha đam sẽ có nguy cơ bị sảy thai." /><br />
	Phụ nữ c&oacute; thai nếu ăn nhiều nha đam sẽ c&oacute; nguy cơ bị sảy thai.</p>
<p>
	Những người bị bệnh tim kh&ocirc;ng n&ecirc;n d&ugrave;ng l&ocirc; hội v&igrave; sẽ c&oacute; nguy cơ g&acirc;y loạn nhịp tim. Nhựa l&ocirc; hội nếu d&ugrave;ng liều cao c&oacute; thể g&acirc;y ngộ độc, ngứa sần da, cho&aacute;ng v&aacute;ng, xuất huyết ti&ecirc;u h&oacute;a.</p>
<p>
	Đặc biệt phụ nữ c&oacute; thai kh&ocirc;ng n&ecirc;n sử dụng l&ocirc; hội v&igrave; n&oacute; tiềm ẩn nguy cơ g&acirc;y sảy thai.</p>
<h2>
	Tr&uacute;c đ&agrave;o</h2>
<p>
	<img alt="Trúc đào là loại cây có độc tính rất cao, nguy hiểm với tim mạch. " data-i="6" src="http://img.khoahoc.tv/photos/image/2016/04/02/hoa-doc-07.jpg" title="Trúc đào là loại cây có độc tính rất cao, nguy hiểm với tim mạch. " /><br />
	Tr&uacute;c đ&agrave;o l&agrave; loại c&acirc;y c&oacute; độc t&iacute;nh rất cao, nguy hiểm với tim mạch.</p>
<p>
	L&agrave; lo&agrave;i hoa c&oacute; độc t&iacute;nh rất cao, rất nguy hiểm đối với hệ tim mạch. Chất độc n&agrave;y c&oacute; mặt trong c&acirc;y, l&aacute;, hoa, tr&aacute;i, hạt tr&uacute;c đ&agrave;o. Triệu chứng xuất hiện sau khi ăn phải 10-15 ph&uacute;t sau ăn với biểu hiện buồn n&ocirc;n &oacute;i dữ dội, lơ mơ, nhức đầu, mệt lả, ti&ecirc;u chảy li&ecirc;n tục, loạn nhịp tim nghi&ecirc;m trọng.</p>
<p>
	Nếu kh&ocirc;ng được cứu chữa kịp thời c&oacute; thể trụy tim mạch, kh&ocirc;ng đo được huyết &aacute;p dẫn tới tử vong. Ở nhiều nơi, c&agrave;nh l&aacute; v&agrave; hạt tr&uacute;c đ&agrave;o được gi&atilde; n&aacute;t để l&agrave;m thuốc trừ s&acirc;u bệnh rất hiệu quả.</p>
<h2>
	Hoa ngoắt nghẻo</h2>
<p>
	<img alt="Hoa ngoắt nghẻo có chứa chất kịch độc colchicine và một số chất độc khác." data-i="7" src="http://img.khoahoc.tv/photos/image/2016/04/02/hoa-doc-08.jpg" title="Hoa ngoắt nghẻo có chứa chất kịch độc colchicine và một số chất độc khác." /><br />
	Hoa ngoắt nghẻo c&oacute; chứa chất kịch độc colchicine v&agrave; một số chất độc kh&aacute;c.</p>
<p>
	T&ecirc;n khoa học l&agrave; Gloriosa superba. Củ v&agrave; hạt c&acirc;y c&oacute; chất kịch độc Colchicine v&agrave; một số alkaloid kh&aacute;c m&agrave; nếu ăn v&agrave;o sẽ g&acirc;y t&ecirc; lưỡi, l&agrave;m cho cơ thể mất cảm gi&aacute;c, nặng th&igrave; h&ocirc;n m&ecirc; v&agrave; nếu kh&ocirc;ng xử l&yacute; kịp thời sẽ dẫn đến tử vong.</p>
<h2>
	Hoa cần nước</h2>
<p>
	<img alt="Cần nước được coi là loại thực vật độc hại nhất ở Bắc Mỹ. Ở Việt Nam, cây này mọc nhiều ở vùng đầm lầy, ao hồ ẩm ướt." data-i="8" src="http://img.khoahoc.tv/photos/image/2016/04/02/hoa-doc-09.jpg" title="Cần nước được coi là loại thực vật độc hại nhất ở Bắc Mỹ. Ở Việt Nam, cây này mọc nhiều ở vùng đầm lầy, ao hồ ẩm ướt." /><br />
	Cần nước được coi l&agrave; loại thực vật độc hại nhất ở Bắc Mỹ. Ở Việt Nam, c&acirc;y n&agrave;y mọc nhiều ở v&ugrave;ng đầm lầy, ao hồ ẩm ướt.</p>
<p>
	Theo b&aacute;o c&aacute;o của Bộ n&ocirc;ng nghiệp Mỹ th&igrave; c&acirc;y độc cần nước l&agrave; loại thực vật độc hại nhất ở Bắc Mỹ. Hoa v&agrave; th&acirc;n c&acirc;y th&igrave; an to&agrave;n nhưng phần rễ c&acirc;y lại chứa chất nhựa chết người d&ugrave; chỉ hấp thụ một lượng rất nhỏ, với th&agrave;nh phần ch&iacute;nh l&agrave; chất cicutoxin g&acirc;y n&ecirc;n chứng co giật, tai biến mạch m&aacute;u n&atilde;o.</p>
<h2>
	Hoa thụy hương</h2>
<p>
	<img alt="Thụy hương là một loại cây độc hại vô cùng với chất mezerein có độc tính rất cao." data-i="9" src="http://img.khoahoc.tv/photos/image/2016/04/02/hoa-doc-10.jpg" title="Thụy hương là một loại cây độc hại vô cùng với chất mezerein có độc tính rất cao." /><br />
	Thụy hương l&agrave; một loại c&acirc;y độc hại v&ocirc; c&ugrave;ng với chất mezerein c&oacute; độc t&iacute;nh rất cao.</p>
<p>
	Thụy hương l&agrave; một loại c&acirc;y bụi để trang tr&iacute; trong vườn nh&agrave; rất được ưa th&iacute;ch ở ch&acirc;u &Acirc;u, gần đ&acirc;y đ&atilde; du nhập v&agrave;o Việt Nam v&agrave; được trồng nhiều trong khu&ocirc;n vi&ecirc;n c&aacute;c căn biệt thự. Tuy nhi&ecirc;n, đ&acirc;y l&agrave; một loại c&acirc;y độc hại v&ocirc; c&ugrave;ng với chất mezerein c&oacute; độc t&iacute;nh rất cao.</p>
<p>
	Nếu v&ocirc; t&igrave;nh ăn phải l&aacute; hay quả c&acirc;y th&igrave; triệu chứng l&uacute;c đầu l&agrave; buồn n&ocirc;n v&agrave; &oacute;i mửa dữ dội, theo đ&oacute; l&agrave; xuất huyết trong, h&ocirc;n m&ecirc; rồi dẫn đến tử vong.</p>
<h2>
	Hoa ch&ugrave;m ph&aacute;o (mao địa ho&agrave;ng)</h2>
<p>
	<img alt="Nếu ăn phải hoa mao địa hoàng sẽ bị đau bụng, rối loạn nhịp tim." data-i="10" src="http://img.khoahoc.tv/photos/image/2016/04/02/hoa-doc-11.jpg" title="HoaaNếu ăn phải hoa mao địa hoàng sẽ bị đau bụng, rối loạn nhịp tim. ngoắt nghẻo có chứa chất kịch độc colchicine và một số chất độc khác." /><br />
	Nếu ăn phải hoa mao địa ho&agrave;ng sẽ bị đau bụng, rối loạn nhịp tim.</p>
<p>
	Đ&acirc;y l&agrave; một lo&agrave;i hoa đẹp với những ch&ugrave;m hoa chĩa thẳng l&ecirc;n trời như một ngọn th&aacute;p. Lo&agrave;i hoa n&agrave;y cũng l&agrave; nguy&ecirc;n liệu để b&agrave;o chế thuốc chữa bệnh tim v&agrave; một số bệnh thường gặp kh&aacute;c như thiếu m&aacute;u v&agrave; t&aacute;o b&oacute;n. Nhưng nếu ăn tươi, ch&uacute;ng c&oacute; thể g&acirc;y rối loạn nhịp tim v&agrave; đau bụng dữ dội.</p>
<h2>
	Hoa dạ hương</h2>
<p>
	Hoa dạ hương trong đ&ecirc;m sẽ ph&aacute;t t&aacute;n ra rất nhiều c&aacute;c hạt nhỏ c&oacute; t&aacute;c dụng k&iacute;ch th&iacute;ch khứu gi&aacute;c, người ta thường trồng một bụi nhỏ hoa n&agrave;y quanh nh&agrave; v&igrave; ch&uacute;ng c&oacute; t&aacute;c dụng đuổi muỗi.</p>
<p>
	<img alt="Loại hoa này có chứa một loại chất kiềm độc, nếu tiếp xúc với hoa quá lâu sẽ làm cho tóc bị rụng nhanh." data-i="11" src="http://img.khoahoc.tv/photos/image/2016/04/02/hoa-doc-12.jpg" title="Loại hoa này có chứa một loại chất kiềm độc, nếu tiếp xúc với hoa quá lâu sẽ làm cho tóc bị rụng nhanh." /><br />
	Loại hoa n&agrave;y c&oacute; chứa một loại chất kiềm độc, nếu tiếp x&uacute;c với hoa qu&aacute; l&acirc;u sẽ l&agrave;m cho t&oacute;c bị rụng nhanh.</p>
<p>
	Tuy vậy, nếu ngửi qu&aacute; nhiều v&agrave; qu&aacute; l&acirc;u m&ugrave;i hoa dạ hương th&igrave; sẽ l&agrave;m cho những người bị cao huyết &aacute;p v&agrave; người bị bệnh tim cảm thấy ch&oacute;ng mặt hoa mắt, kh&oacute; chịu, thậm ch&iacute; c&ograve;n c&oacute; thể l&agrave;m cho bệnh t&igrave;nh trở n&ecirc;n nghi&ecirc;m trọng hơn.</p>
<p>
	Loại hoa n&agrave;y c&oacute; chứa một loại chất kiềm độc, nếu tiếp x&uacute;c với hoa qu&aacute; l&acirc;u sẽ l&agrave;m cho t&oacute;c bị rụng nhanh.</p>
<h2>
	Thường xu&acirc;n</h2>
<p>
	<img alt="Lá thường xuân có thể gây khó thở, buồn nôn, phát ban, nổi mụn, nôn mửa, tê liệt hoặc gây hôn mê." data-i="12" src="http://img.khoahoc.tv/photos/image/2016/04/02/hoa-doc-2.jpg" title="Lá thường xuân có thể gây khó thở, buồn nôn, phát ban, nổi mụn, nôn mửa, tê liệt hoặc gây hôn mê." />L&aacute; thường xu&acirc;n c&oacute; thể g&acirc;y kh&oacute; thở, buồn n&ocirc;n, ph&aacute;t ban, nổi mụn, n&ocirc;n mửa, t&ecirc; liệt hoặc g&acirc;y h&ocirc;n m&ecirc;.</p>
<p>
	C&acirc;y thường xu&acirc;n l&agrave; họ d&acirc;y leo n&ecirc;n thường được trồng trong nh&agrave; như c&acirc;y cảnh hoặc trồng th&agrave;nh gi&agrave;n b&aacute;m tr&ecirc;n tường nh&agrave;. Tuy nhi&ecirc;n, những l&aacute; thường xu&acirc;n xanh mướt n&agrave;y lại chứa những độc tố g&acirc;y hại cho sức khỏe con người, dẫn đến c&aacute;c hiện tượng như kh&oacute; thở, buồn n&ocirc;n, ph&aacute;t ban, nổi mụn, n&ocirc;n mửa, t&ecirc; liệt hoặc g&acirc;y h&ocirc;n m&ecirc;.</p>
<h2>
	C&acirc;y thủy t&ugrave;ng (th&ocirc;ng đỏ)</h2>
<p>
	<img alt="Mọi bộ phận trên cây thủy tùng đều có độc tố gây chết người." data-i="13" src="http://img.khoahoc.tv/photos/image/2016/04/02/hoa-doc-4.jpg" title="Mọi bộ phận trên cây thủy tùng đều có độc tố gây chết người." />Mọi bộ phận tr&ecirc;n c&acirc;y thủy t&ugrave;ng đều c&oacute; độc tố g&acirc;y chết người.</p>
<p>
	C&acirc;y thủy t&ugrave;ng l&agrave; c&acirc;y bụi rất phổ biến ở c&aacute;c nước ch&acirc;u &Acirc;u, ch&acirc;u Phi v&agrave; Trung Đ&ocirc;ng. Khi ra quả, tr&aacute;i của lo&agrave;i c&acirc;y n&agrave;y mềm, m&agrave;u đỏ ch&iacute;n mọng tr&ocirc;ng rất bắt mắt tuy nhi&ecirc;n cũng giống như tr&uacute;c đ&agrave;o, mọi bộ phận của lo&agrave;i c&acirc;y n&agrave;y đều c&oacute; độc tố g&acirc;y chết người. Đặc biệt, ai ăn phải hột thủy t&ugrave;ng g&acirc;y t&ecirc; liệt hoặc co giật v&agrave; sẽ tử vong ngay chỉ trong v&agrave;i ph&uacute;t.</p>
<h2>
	Hoa thủy ti&ecirc;n</h2>
<p>
	<img alt="Nếu ăn nhầm hoa thủy tiên, bạn có thể bị phát ban đỏ hoặc lở loét trên da." data-i="14" src="http://img.khoahoc.tv/photos/image/2016/04/02/hoa-doc-1.jpg" title="Nếu ăn nhầm hoa thủy tiên, bạn có thể bị phát ban đỏ hoặc lở loét trên da." />Nếu ăn nhầm hoa thủy ti&ecirc;n, bạn c&oacute; thể bị ph&aacute;t ban đỏ hoặc lở lo&eacute;t tr&ecirc;n da.</p>
<p>
	Hoa thủy ti&ecirc;n l&agrave; một trong những loại hoa đẹp v&agrave; được nhiều người y&ecirc;u th&iacute;ch. Tuy nhi&ecirc;n, nếu ăn nhầm lo&agrave;i hoa n&agrave;y, bạn c&oacute; thể bị độc tố c&oacute; trong hoa g&acirc;y t&ecirc; liệt, ph&aacute;t ban đỏ hoặc lở lo&eacute;t tr&ecirc;n da.</p>
<h2>
	Hoa Baneberry trắng</h2>
<p>
	<img alt="Chất độc có trong những quả baneberry có thể khiến tim ngừng đập ngay tức khắc." data-i="15" src="http://img.khoahoc.tv/photos/image/2016/04/02/hoa-doc-5.jpg" title="Chất độc có trong những quả baneberry có thể khiến tim ngừng đập ngay tức khắc." />Chất độc c&oacute; trong những quả baneberry c&oacute; thể khiến tim ngừng đập ngay tức khắc.</p>
<p>
	Baneberry xuất hiện nhiều ở v&ugrave;ng Đ&ocirc;ng v&agrave; Bắc Mỹ. Tất cả c&aacute;c bộ phận của lo&agrave;i hoa n&agrave;y đều c&oacute; độc t&iacute;nh cao nhưng độc nhất l&agrave; ở hoa v&agrave; quả. Chất độc c&oacute; trong những quả baneberry căng mọng hấp dẫn c&oacute; thể khiến tim ngừng đập ngay tức khắc.</p>
<h2>
	C&acirc;y l&aacute; ban</h2>
<p>
	<img alt="Những chiếc lông trên lá của cây lá ban chứa hàm lượng độc tố rất cao." data-i="16" src="http://img.khoahoc.tv/photos/image/2016/04/02/hoa-doc-6.jpg" title="Những chiếc lông trên lá của cây lá ban chứa hàm lượng độc tố rất cao." />Những chiếc l&ocirc;ng tr&ecirc;n l&aacute; của c&acirc;y l&aacute; ban chứa h&agrave;m lượng độc tố rất cao.</p>
<p>
	C&acirc;y ch&acirc;m l&aacute; ban đặc trưng bởi những chiếc l&aacute; xanh rộng phủ đầy l&ocirc;ng nhọn. Những chiếc l&ocirc;ng n&agrave;y chứa h&agrave;m lượng độc tố rất cao, chỉ cần v&ocirc; t&igrave;nh chạm nhẹ cũng g&acirc;y ra cảm gi&aacute;c đau nhức trong nhiều ng&agrave;y, thậm ch&iacute; cả th&aacute;ng. Nghi&ecirc;m trọng hơn, lo&agrave;i c&acirc;y n&agrave;y cũng c&oacute; thể g&acirc;y tử vong.</p>
<h2>
	C&acirc;y phụ tử (c&acirc;y &ocirc; đầu)</h2>
<p>
	<img alt="Cây phụ tử gây nôn, chóng mặt, tiêu chảy nếu không may đụng phải." data-i="17" src="http://img.khoahoc.tv/photos/image/2016/04/02/hoa-doc-7.jpg" title="Cây phụ tử gây nôn, chóng mặt, tiêu chảy nếu không may đụng phải." />C&acirc;y phụ tử g&acirc;y n&ocirc;n, ch&oacute;ng mặt, ti&ecirc;u chảy nếu kh&ocirc;ng may đụng phải.</p>
<p>
	C&acirc;y phụ tử l&agrave; một loại c&acirc;y độc g&acirc;y n&ocirc;n, ch&oacute;ng mặt, ti&ecirc;u chảy nếu kh&ocirc;ng may đụng phải. Nếu v&ocirc; t&igrave;nh ăn phải c&acirc;y n&agrave;y sẽ thấy tim đập nhanh, sau đ&oacute; bị liệt tim, ngừng thở v&agrave; dẫn đến tử vong.</p>
<h2>
	C&acirc;y t&aacute;o &quot;chết ch&oacute;c&quot;</h2>
<p>
	<img alt="Nhựa của cây táo này cực kỳ nguy hiểm, nếu bị dính vào người thì cái chết là điều không thể tránh khỏi." data-i="18" src="http://img.khoahoc.tv/photos/image/2016/04/02/hoa-doc-8.jpg" title="Nhựa của cây táo này cực kỳ nguy hiểm, nếu bị dính vào người thì cái chết là điều không thể tránh khỏi." />Nhựa của c&acirc;y t&aacute;o n&agrave;y cực kỳ nguy hiểm, nếu bị d&iacute;nh v&agrave;o người th&igrave; c&aacute;i chết l&agrave; điều kh&ocirc;ng thể tr&aacute;nh khỏi.</p>
<p>
	Lo&agrave;i c&acirc;y n&agrave;y c&oacute; t&aacute;n lớn được trồng nhiều ở gần biển để chắn s&oacute;ng. Quả c&oacute; m&agrave;u xanh v&agrave; khi ch&iacute;n c&oacute; m&agrave;u v&agrave;ng đỏ, nh&igrave;n rất giống t&aacute;o. Tuy nhi&ecirc;n, đ&acirc;y l&agrave; lo&agrave;i c&acirc;y cực độc đến nỗi người ta phải treo biển cảnh b&aacute;o tr&ecirc;n th&acirc;n c&acirc;y y&ecirc;u cầu mọi người tr&aacute;nh xa ch&uacute;ng &iacute;t nhất 6m, tr&aacute;nh để nhựa d&iacute;nh l&ecirc;n da. Nếu để nhựa c&acirc;y d&iacute;nh v&agrave;o người, c&aacute;i chết l&agrave; điều kh&ocirc;ng thể tr&aacute;nh khỏi. Thậm ch&iacute;, đứng dười t&aacute;n c&acirc;y cũng c&oacute; thể khiến da ngứa ng&aacute;y, ph&aacute;t ban v&agrave; nổi mẩn đỏ.</p>
<h2>
	C&acirc;y vạn ni&ecirc;n thanh</h2>
<p>
	<img alt="Nhựa của cây vạn niên thanh có thể gây dị ứng da, bỏng, nghẹn và khó thở." data-i="19" src="http://img.khoahoc.tv/photos/image/2016/04/02/hoa-doc-9.jpg" title="Nhựa của cây vạn niên thanh có thể gây dị ứng da, bỏng, nghẹn và khó thở." />Nhựa của c&acirc;y vạn ni&ecirc;n thanh c&oacute; thể g&acirc;y dị ứng da, bỏng, nghẹn v&agrave; kh&oacute; thở.</p>
<p>
	C&acirc;y vạn ni&ecirc;n thanh được trồng phổ biến như một loại c&acirc;y cảnh trong nh&agrave;. Nếu v&ocirc; t&igrave;nh ăn nhầm l&aacute; của c&acirc;y n&agrave;y sẽ dẫn đến bỏng r&aacute;t ni&ecirc;m mạc v&agrave; tổn thương da. Nếu v&ocirc; t&igrave;nh để nhựa d&iacute;nh v&agrave;o c&oacute; thể g&acirc;y dị ứng da, bỏng, nghẹn v&agrave; kh&oacute; thở. Thậm ch&iacute;, nghi&ecirc;m trọng hơn, vạn ni&ecirc;n thanh c&oacute; thể g&acirc;y chết người nếu tiếp x&uacute;c với qu&aacute; nhiều nhựa c&acirc;y.</p>
', 1, 7)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (77, N'Ăn gì để nhanh hết say rượu, hồi phục gan nhanh chóng hơn?', N'2017_05_31_23_22_06_9581pbj-bhofack2-opener-175901799.jpg', N' (Emdep.vn) - Sau khi say rượu, bạn có thể dùng những thực phẩm sau để giảm say và hồi phục cho gan. ', CAST(N'2017-05-31 00:00:00.000' AS DateTime), 0, N'<div>
	Sau khi say rượu, bạn c&oacute; thể d&ugrave;ng những thực phẩm sau để giảm say v&agrave; hồi phục cho gan.</div>
<p>
	Bơ đậu phộng v&agrave; thạch</p>
<p>
	<a data-index="0" href="http://baomoi-photo-3-td.zadn.vn/17/01/21/265/21380153/1_89927.jpg"><img alt="An gi de nhanh het say ruou, hoi phuc gan nhanh chong hon? - Anh 1" src="http://baomoi-photo-3-td.zadn.vn/w460x/17/01/21/265/21380153/1_89927.jpg" title="Ăn gì để nhanh hết say rượu, hồi phục gan nhanh chóng hơn? - Ảnh 1" /></a></p>
<p>
	Khi say rượu bạn n&ecirc;n ăn bơ đậu phộng v&agrave; thạch hoặc b&aacute;nh m&igrave; ngũ cốc nguy&ecirc;n hạt. Carbohydrate c&oacute; trong ngũ cốc nguy&ecirc;n hạt gi&uacute;p hấp thụ rượu dư thừa trong dạ d&agrave;y của bạn v&agrave; bổ sung th&ecirc;m một số vitamin B gi&uacute;p giải rượu.</p>
<p>
	Phở/s&uacute;p g&agrave;</p>
<p>
	<a data-index="1" href="http://baomoi-photo-3-td.zadn.vn/17/01/21/265/21380153/2_70082.jpg"><img alt="An gi de nhanh het say ruou, hoi phuc gan nhanh chong hon? - Anh 2" src="http://baomoi-photo-3-td.zadn.vn/w460x/17/01/21/265/21380153/2_70082.jpg" title="Ăn gì để nhanh hết say rượu, hồi phục gan nhanh chóng hơn? - Ảnh 2" /></a></p>
<p>
	Phở hay s&uacute;p g&agrave; gi&uacute;p bổ sung chất lỏng v&agrave; muối bị mất do rượu v&agrave; cung cấp cysteine - một loại ax&iacute;t amin gi&uacute;p gan giải rượu, giảm đau đầu hiệu quả.</p>
<p>
	Trứng r&aacute;n k&egrave;m rau củ</p>
<p>
	<a data-index="2" href="http://baomoi-photo-3-td.zadn.vn/17/01/21/265/21380153/3_87793.jpg"><img alt="An gi de nhanh het say ruou, hoi phuc gan nhanh chong hon? - Anh 3" src="http://baomoi-photo-3-td.zadn.vn/w460x/17/01/21/265/21380153/3_87793.jpg" title="Ăn gì để nhanh hết say rượu, hồi phục gan nhanh chóng hơn? - Ảnh 3" /></a></p>
<p>
	Giống như s&uacute;p g&agrave;, trứng chứa cysteine c&oacute; thể giảm thiểu đau đầu, ớn lạnh. Ngo&agrave;i ra, trứng cũng chứa taurine amino axit, gi&uacute;p thải độc gan hiệu quả. Tuy nhi&ecirc;n, bạn kh&ocirc;ng n&ecirc;n ăn ph&ocirc; mai v&agrave; thịt x&ocirc;ng kh&oacute;i khi say rượu. Những thực phẩm n&agrave;y g&acirc;y k&iacute;ch th&iacute;ch hệ ti&ecirc;u h&oacute;a v&agrave; l&agrave;m cho bạn cảm thấy tồi tệ hơn.</p>
<p>
	Tr&agrave; gừng</p>
<p>
	<a data-index="3" href="http://baomoi-photo-3-td.zadn.vn/17/01/21/265/21380153/4_30981.jpeg"><img alt="An gi de nhanh het say ruou, hoi phuc gan nhanh chong hon? - Anh 4" src="http://baomoi-photo-3-td.zadn.vn/w460x/17/01/21/265/21380153/4_30981.jpeg" title="Ăn gì để nhanh hết say rượu, hồi phục gan nhanh chóng hơn? - Ảnh 4" /></a></p>
<p>
	Thay v&igrave; uống soda gừng, bạn h&atilde;y uống loại nước c&oacute; lượng đường thấp hơn như tr&agrave; gừng. Kh&ocirc;ng chỉ cung cấp lượng gừng l&agrave;m dịu dạ d&agrave;y, tr&agrave; gừng c&ograve;n gi&uacute;p bổ sung vitamin B l&agrave;m giảm nồng độ cồn, giảm t&aacute;c hại của rượu l&ecirc;n ni&ecirc;m mạc ruột.</p>
<p>
	Chuối</p>
<p>
	<a data-index="4" href="http://baomoi-photo-3-td.zadn.vn/17/01/21/265/21380153/5_23577.jpg"><img alt="An gi de nhanh het say ruou, hoi phuc gan nhanh chong hon? - Anh 5" src="http://baomoi-photo-3-td.zadn.vn/w460x/17/01/21/265/21380153/5_23577.jpg" title="Ăn gì để nhanh hết say rượu, hồi phục gan nhanh chóng hơn? - Ảnh 5" /></a></p>
<p>
	Chuối chứa nhiều kali gi&uacute;p giải rượu hiệu quả. Ngo&agrave;i ra bạn c&oacute; thể xay sinh tố chuối với mật ong hoặc ăn k&egrave;m chuối với b&aacute;nh sandwich, mật ong.</p>
<p>
	B&aacute;nh waffle</p>
<p>
	<a data-index="5" href="http://baomoi-photo-3-td.zadn.vn/17/01/21/265/21380153/6_90200.jpg"><img alt="An gi de nhanh het say ruou, hoi phuc gan nhanh chong hon? - Anh 6" src="http://baomoi-photo-3-td.zadn.vn/w460x/17/01/21/265/21380153/6_90200.jpg" title="Ăn gì để nhanh hết say rượu, hồi phục gan nhanh chóng hơn? - Ảnh 6" /></a></p>
<p>
	B&aacute;nh waffle cũng l&agrave; một trong những thực phẩm gi&uacute;p giải rượu nhanh ch&oacute;ng. Waffle cung cấp vitamin B v&agrave; protein dồi d&agrave;o cho cơ thể.</p>
', 1, 7)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (78, N'Nên ăn gì sau khi tập thể thao?', N'2017_05_31_23_23_20_73221aangiemdep10.jpg', N' (Em đẹp) - Nếu là người thường xuyên luyện tập thể dục thể thao, chắc hẳn bạn đã biết một nguyên tắc cơ bản là: phải ăn một thứ gì đó sau khi tập để bù lại năng lượng. ', CAST(N'2017-05-31 00:00:00.000' AS DateTime), 0, N'<p>
	Việc ăn g&igrave;, ăn trước hay sau tập thể dục phụ thuộc rất lớn v&agrave;o mục đ&iacute;ch, thời gian v&agrave; loại h&igrave;nh thể dục bạn chọn. Tuy nhi&ecirc;n, bạn c&oacute; thể &aacute;p dụng những lời khuy&ecirc;n dưới đ&acirc;y để đảm bảo sức khoẻ v&agrave; ph&aacute;t huy được lợi &iacute;ch của việc tập thể dục.</p>
<p>
	1. Trước khi tập thể dục</p>
<p>
	&ndash; Ng&agrave;y nay, nhiều người đ&atilde; ch&uacute; trọng nhiều hơn tới việc tập thể dục do nhu cầu của sức khỏe. Tập thể dục đang l&agrave; một phương ph&aacute;p gi&uacute;p kiểm so&aacute;t trọng lượng, chống lại bệnh tật, giải tỏa căng thẳng, gi&uacute;p giấc ngủ ngon, l&agrave;m tăng năng lượng cũng như hữu &iacute;ch cho đời sống t&igrave;nh dục.</p>
<p>
	&ndash; Hầu hết mọi người thường chạy thể dục buổi s&aacute;ng với c&aacute;i bụng rỗng. Điều đ&oacute; l&agrave; ho&agrave;n to&agrave;n sai lầm, v&igrave; n&oacute; khiến bạn cảm thấy mệt mỏi v&agrave; dễ cho&aacute;ng ngay từ l&uacute;c bắt đầu tập luyện. Bạn n&ecirc;n t&igrave;m một thời gian ch&iacute;nh x&aacute;c v&agrave; th&iacute;ch hợp để c&oacute; một bữa ăn nhỏ. C&aacute;c đồ ăn nhẹ v&agrave; l&agrave;nh mạnh với cơ thể sẽ l&agrave; nguy&ecirc;n liệu tốt cho bạn trong v&agrave; sau khi tập thể thao.</p>
<p>
	&ndash; Thay v&igrave; d&ugrave;ng một bữa ăn đủ dinh dưỡng bạn c&oacute; thể ăn một ch&uacute;t đồ ăn nhẹ c&oacute; nhiều protein v&agrave; carbohydrate. Tham khảo lời khuy&ecirc;n từ b&aacute;c sĩ về chế độ ăn uống cũng như kế hoạch tập thể dục của bạn, nếu như trước đ&oacute; bạn c&oacute; vấn đề về sức khỏe.</p>
<p>
	&ndash;&nbsp;Ăn một miếng b&aacute;nh m&igrave; với một ly nhỏ nước hoa quả sẽ gi&uacute;p bạn tiếp th&ecirc;m sinh lực cho cơ thể m&agrave; kh&ocirc;ng lo ngại về việc tăng c&acirc;n. Với việc c&oacute; một bữa ăn nhẹ trước khi tập thể dục sẽ khiến cơ thể bạn duy tr&igrave; một nguồn năng lượng trong v&ograve;ng một giờ. Tuy vậy nếu bạn c&oacute; b&agrave;i tập thể dục nhiều hơn một giờ đồng hồ, bạn sẽ cần phải tiếp nhi&ecirc;n liệu với một bữa ăn nhẹ đủ protein.</p>
<p>
	&ndash; Một &iacute;t tr&aacute;i c&acirc;y tươi, nước đ&aacute; v&agrave; một hộp sữa chua, xay nhuyễn tất cả nguy&ecirc;n liệu. Nếu muốn bạn c&oacute; thể th&ecirc;m một ch&uacute;t mật ong hoặc xi-r&ocirc; để l&agrave;m ngọt. Sinh tố sữa chua l&agrave; bữa ăn nhẹ v&agrave; m&aacute;t m&agrave; bạn c&oacute; thể uống khoảng 30 ph&uacute;t trước khi tập thể dục. Sữa chua c&oacute; chứa protein, trong khi tr&aacute;i c&acirc;y sẽ cung cấp cho cơ thể bạn một nguồn năng lượng mới.</p>
<p>
	&ndash; Chuối gi&uacute;p k&eacute;o d&agrave;i năng lượng cơ thể của bạn hơn.&nbsp;Nếu bạn c&oacute; kế hoạch tập thể dục nhiều hơn một giờ đồng hồ, trước khi tập luyện của bạn n&ecirc;n ăn chuối. Một quả chuối c&oacute; chứa c&aacute;c carbohydrate phức hợp, gi&uacute;p k&eacute;o d&agrave;i năng lượng cơ thể của bạn hơn. Hoặc bạn c&oacute; thể d&ugrave;ng một quả chuối như một bữa ăn nhẹ giữa giờ tập luyện nếu c&oacute; kế hoạch tập trong v&agrave;i giờ.</p>
<p>
	&ndash; Ăn một cốc sữa chua &iacute;t b&eacute;o trước&nbsp;khi bạn tập thể dục&nbsp;sẽ gi&uacute;p tiếp sinh lực cho cơ thể của bạn bởi v&igrave; n&oacute; chứa một h&agrave;m lượng protein cao. Bạn c&oacute; thể cho th&ecirc;m một &iacute;t tr&aacute;i c&acirc;y v&agrave;o ăn c&ugrave;ng nhằm bổ sung th&ecirc;m h&agrave;m lượng carbonhydrate. Nếu bạn&nbsp;sử dụng sữa chua&nbsp;trong qu&aacute; tr&igrave;nh tập luyện của bạn, n&oacute; gi&uacute;p ổn định lượng đường trong m&aacute;u.</p>
<p>
	2. Trong khi tập thể dục</p>
<p>
	&ndash; Nước l&agrave; điều quan trọng nhất trong quả tr&igrave;nh&nbsp;luyện tập. V&igrave; nước chiếm tới 70% trọng lượng của cơ thể. Phần lớn mọi người thường mắc sai lầm l&agrave; chỉ uống nước sau khi tập thể thao m&agrave; qu&ecirc;n rằng ch&uacute;ng ta cần tiếp nước trước khi tập nữa. Khoảng nửa l&iacute;t nước trước khi tập l&agrave; hợp l&yacute;. Trong khi tập cũng n&ecirc;n duy tr&igrave; uống nước. Qu&aacute; tr&igrave;nh đốt ch&aacute;y năng lượng rất cần nước để tr&aacute;nh căng cơ, bong g&acirc;n. Sự lựa chọn h&agrave;ng đầu tất nhi&ecirc;n sẽ l&agrave; nước tinh khiết. Tuy nhi&ecirc;n nếu vắt th&ecirc;m ch&uacute;t chanh hay cho th&ecirc;m v&agrave;i muỗng siro th&igrave; việc ti&ecirc;u thụ nước c&oacute; thể dễ d&agrave;ng hơn. Kh&ocirc;ng n&ecirc;n uống những loại nước pha sẵn như soda hay nước ngọt. C&ograve;n rượu l&agrave; chất cấm kỵ.</p>
<p>
	2. Sau khi tập thể dục</p>
<p>
	2.1. N&ecirc;n ăn:</p>
<p>
	&ndash; Ăn sớm sau khi tập thể dục l&agrave; điều tốt nhất, kể cả việc bạn đang c&oacute; kế hoạch để giảm c&acirc;n. N&ecirc;n d&ugrave;ng ngay một m&oacute;n ngũ cốc để cắt đứt cơn đ&oacute;i trong khi chờ đến bữa ăn ch&iacute;nh. Sau khi tập xong th&igrave; một ly sữa chocolate sẽ l&agrave; c&aacute;ch tuyệt vời để phục hồi lại năng lượng. Hoa quả cũng rất quan trọng, chuối hoặc một số loại ngũ cốc rất tốt cho qu&aacute; tr&igrave;nh phục hồi n&agrave;y.</p>
<p>
	&ndash; Những thực phẩm trong bữa ăn tiếp sau đ&oacute; phải c&oacute; h&agrave;m lượng protein thật cao như thịt, c&aacute;, trứng v&agrave; phomat. Lượng protein n&agrave;y gi&uacute;p phục hồi cơ bắp sau c&aacute;c hoạt đ&ocirc;ng thể lực k&eacute;o d&agrave;i. Ngo&agrave;i ra, c&aacute;c vitamin v&agrave; chất kho&aacute;ng c&oacute; trong rau sống, rau luộc,&nbsp;tr&aacute;i c&acirc;y tươi&nbsp;v&agrave; c&aacute;c thực phẩm kh&aacute;c cũng kh&ocirc;ng thể thiếu trong việc phục hồi thể lực chung cho to&agrave;n cơ thể.</p>
<p>
	&ndash; Ch&uacute;ng ta n&ecirc;n hạn chế c&aacute;c thực phẩm chứa nhiều chất b&eacute;o, đồ ăn nhanh trước khi tập v&igrave; ch&uacute;ng l&agrave;m chậm qu&aacute; tr&igrave;nh ti&ecirc;u h&oacute;a. Với những người c&oacute; khả năng mắc những biến chứng th&igrave; tốt nhất n&ecirc;n cung cấp đường qua c&aacute;c loại tr&aacute;i c&acirc;y.</p>
<p>
	&ndash; T&ugrave;y v&agrave;o c&aacute;c loại h&igrave;nh&nbsp;thể thao&nbsp;m&agrave; ch&uacute;ng ta c&oacute; những c&ocirc;ng thức ăn uống chi tiết kh&aacute;c nhau. Cấp độ luyện tập thể thao c&agrave;ng cao th&igrave; chế độ ăn uống c&agrave;ng phải mang đặc th&ugrave; ri&ecirc;ng. Điều quan trọng nữa l&agrave; bạn phải lắng nghe cơ thể m&igrave;nh, thận trọng lựa chọn những đồ ăn chất lượng đảm bảo, tươi ngon nhất.</p>
<p>
	2.2. Kh&ocirc;ng n&ecirc;n ăn:</p>
<p>
	&ndash; Pho m&aacute;t:&nbsp;Đ&acirc;y l&agrave; m&oacute;n ăn bạn kh&ocirc;ng n&ecirc;n sử dụng sau khi chạy bộ v&igrave; n&oacute; chứa một lượng lớn chất b&eacute;o b&atilde;o h&ograve;a v&agrave; muối. Nếu bạn đang muốn c&oacute; một bữa ăn nhẹ c&ugrave;ng pho m&aacute;t, h&atilde;y chọn khoai t&acirc;y chi&ecirc;n c&oacute; hương vị pho m&aacute;t.</p>
<p>
	&ndash; C&aacute;c loại thịt đ&atilde; qua chế biến:&nbsp;Thực phẩm n&agrave;y thường c&oacute; nhiều chất b&eacute;o v&agrave; muối. Ch&uacute;ng c&oacute; thể l&agrave;m chậm qu&aacute; tr&igrave;nh ti&ecirc;u h&oacute;a. Thay v&igrave; chọn thịt x&ocirc;ng kh&oacute;i, x&uacute;c x&iacute;ch, bạn h&atilde;y ăn b&aacute;nh sandwich với thịt g&agrave; luộc.</p>
<p>
	&ndash; Ngũ cốc đ&oacute;ng g&oacute;i:&nbsp;Một số loại ngũ cốc đ&oacute;ng g&oacute;i chứa nhiều đường, v&igrave; vậy n&oacute; kh&ocirc;ng phải l&agrave; sự lựa chọn kh&ocirc;n ngoan sau khi tập thể dục</p>
<p>
	&ndash; B&aacute;nh m&igrave;:&nbsp;Tinh bột trong b&aacute;nh m&igrave; sẽ nhanh ch&oacute;ng biến th&agrave;nh đường sau khi bạn ăn v&agrave;o. Nhưng nếu cảm thấy qu&aacute; th&egrave;m m&oacute;n b&aacute;nh m&igrave;, bạn c&oacute; thể thay thế bằng b&aacute;nh m&igrave; trắng.</p>
<p>
	&ndash; Nước &eacute;p tr&aacute;i c&acirc;y:&nbsp;Nước tr&aacute;i c&acirc;y chứa nhiều đường sẽ khiến bạn tăng đường huyết v&agrave; l&agrave;m vỡ kế hoạch giảm c&acirc;n của bạn.</p>
<p>
	&ndash; Trứng chi&ecirc;n:&nbsp;Trứng được xem l&agrave; một m&oacute;n ăn tuyệt vời sau khi tập luyện v&igrave; ch&uacute;ng chứa nhiều protein v&agrave; choline tốt cho tim. Tuy nhi&ecirc;n, bạn n&ecirc;n tr&aacute;nh m&oacute;n trứng chi&ecirc;n v&igrave; ch&uacute;ng c&oacute; nhiều chất b&eacute;o.</p>
<p>
	Kết luận:</p>
<p>
	Về cơ bản đ&oacute; l&agrave; những ch&uacute; &yacute; nho nhỏ cần biết trước, trong v&agrave; sau khi tập thể dục. Tất nhi&ecirc;n rằng ch&uacute;ng chỉ mang t&iacute;nh kh&aacute;i qu&aacute;t v&igrave; mỗi người c&oacute; một chế độ luyện tập, đặc điểm cơ thể kh&aacute;c nhau. Hy vọng rằng bạn sẽ c&oacute; được một chế độ hợp l&yacute; nhất để đạt được kết quả luyện tập tốt.</p>
<p>
	Ngo&agrave;i ra, nếu bạn c&oacute; th&oacute;i quen tập thể dục buổi s&aacute;ng th&igrave; h&atilde;y lưu &yacute; một số điều cần tr&aacute;nh sau đ&acirc;y:</p>
<p>
	&ndash; Kh&ocirc;ng n&ecirc;n tập qu&aacute; sớm, l&uacute;c trời chưa s&aacute;ng:&nbsp;Thời điểm n&agrave;y mặt trời chưa mọc, kh&ocirc;ng kh&iacute; &ocirc; nhiễm vẫn c&ograve;n s&aacute;t mặt đất v&igrave; đ&acirc;y l&agrave; thời điểm c&acirc;y xanh h&uacute;t lấy oxy v&agrave; thải kh&iacute; CO2 n&ecirc;n rất bất lợi cho sức khỏe.</p>
<p>
	&ndash; Tr&aacute;nh ng&agrave;y c&oacute; gi&oacute; thổi mạnh:&nbsp;V&igrave; nếu tập luyện sớm, gi&oacute; sẽ thổi bạt năng lượng của cơ thể.</p>
<p>
	&ndash; Tr&aacute;nh ng&agrave;y c&oacute; sương m&ugrave;:&nbsp;V&igrave; trong những ng&agrave;y n&agrave;y, kh&ocirc;ng kh&iacute; thường bị &ocirc; nhiễm nặng n&ecirc;n nếu bạn tập thể dục sớm sẽ rất dễ h&iacute;t phải kh&ocirc;ng kh&iacute; c&oacute; hại cho sức khỏe.</p>
<p>
	&ndash; Tr&aacute;nh tập ở nơi gần đường lớn, cạnh nh&agrave; m&aacute;y hoặc nơi &ocirc; nhiễm:&nbsp;V&igrave; c&aacute;c bụi bẩn v&agrave; kh&iacute; độc ở khu vực n&agrave;y sẽ kh&ocirc;ng an to&agrave;n cho sức khỏe.</p>
', 1, 7)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (79, N'Cùng bé yêu đón 1/6 với 5 bộ phim hoạt hình vui nhộn', N'2017_05_31_23_24_44_469dao-095143011.jpg', N' (Emdep.vn) - Để ngày quốc tế thiếu nhi 1/6 của bé thêm phần ý nghĩa, bố mẹ có thể cùng con thưởng thức những bộ phim hoạt hình hài hước, vui nhộn dưới đây. ', CAST(N'2017-05-31 00:00:00.000' AS DateTime), 0, N'<div>
	Ng&agrave;y Quốc tế Thiếu nhi 1/6, cha mẹ c&oacute; thể d&agrave;nh thời gian để xem những bộ phim hoạt h&igrave;nh hấp dẫn sau nhằm gi&uacute;p c&aacute;c con c&oacute; th&ecirc;m niềm vui v&agrave; r&uacute;t ra được những b&agrave;i học bổ &iacute;ch.</div>
<p>
	Với lứa tuổi thiếu nhi, những bộ phim hoạt h&igrave;nh l&agrave; m&oacute;n ăn tinh thần kh&ocirc;ng thể thiếu trong tuổi thơ của mỗi đứa trẻ. Hiện nay, sự ph&aacute;t triển của bộ m&ocirc;n nghệ thuật thứ 7 đ&atilde; mang đến cho c&aacute;c em nhiều lựa chọn hơn để c&oacute; thể thưởng thức những c&acirc;u chuyện th&uacute; vị, hấp dẫn tr&ecirc;n m&agrave;n ảnh.</p>
<p>
	C&ugrave;ng với đ&oacute;, nhiều bộ phim hoạt h&igrave;nh đ&atilde; gắn liền với nhiều thế hệ trẻ thơ với nội dung hấp dẫn, h&igrave;nh ảnh đẹp v&agrave; để lại cho người xem nhiều ấn tượng s&acirc;u sắc. Nh&acirc;n dịp ng&agrave;y Quốc tế Thiếu nhi 1/6 , c&ugrave;ng điểm lại những bộ phim hoạt h&igrave;nh hay nhất m&agrave; c&aacute;c em nhỏ n&ecirc;n xem để được giải tr&iacute; nhiều hơn.</p>
<p>
	1. Snow White and the Seven Dwarfs - Bạch Tuyết v&agrave; bảy ch&uacute; l&ugrave;n (1937)</p>
<p>
	Chuyển thể từ c&acirc;u chuyện cổ t&iacute;ch nổi tiếng khắp thế giới đối với mọi trẻ em, N&agrave;ng Bạch Tuyết v&agrave; bảy ch&uacute; l&ugrave;n l&agrave; bộ phim hoạt h&igrave;nh d&agrave;i đầu ti&ecirc;n do Walt Disney sản xuất, mở ra kỷ nguy&ecirc;n mới cho sự ph&aacute;t triển của thể loại phim hoạt h&igrave;nh.</p>
<p>
	<a data-index="0" href="http://baomoi-photo-1-td.zadn.vn/17/05/29/229/22397400/1_304568.jpg"><img alt="Quoc te Thieu nhi 1/6: Nhung bo phim hoat hinh hay nhat danh cho be - Anh 1" src="http://baomoi-photo-1-td.zadn.vn/w460x/17/05/29/229/22397400/1_304568.jpg" title="Quốc tế Thiếu nhi 1/6: Những bộ phim hoạt hình hay nhất dành cho bé - Ảnh 1" /></a></p>
<p>
	Phim hoạt h&igrave;nh Snow White and the Seven Dwarfs - Bạch Tuyết v&agrave; bảy ch&uacute; l&ugrave;n (1937)</p>
<p>
	Bộ phim l&agrave; c&acirc;u chuyện kể về n&agrave;ng c&ocirc;ng ch&uacute;a bị ho&agrave;ng hậu ganh gh&eacute;t v&igrave; sắc đẹp hơn người. Trải qua nhiều s&oacute;ng gi&oacute;, n&agrave;ng c&oacute; cuộc sống vui vẻ với 7 ch&uacute; l&ugrave;n đ&aacute;ng y&ecirc;u v&agrave; gặp được ho&agrave;ng tử của đời m&igrave;nh. Đ&acirc;y l&agrave; bộ phim hoạt h&igrave;nh kinh điển nhất m&agrave; c&aacute;c em nhỏ n&ecirc;n xem, đặc biệt l&agrave; c&aacute;c b&eacute; g&aacute;i để cảm nhận được vẻ đẹp của l&ograve;ng nh&acirc;n hậu.</p>
<p>
	2. The Lion King - Vua sư tử (1994)</p>
<p>
	Tuy đ&atilde; ra đời hơn 20 năm nhưng bộ phim hoạt h&igrave;nh kinh điển được vẽ tay của Walt Disney vẫn c&oacute; sức l&ocirc;i cuốn với trẻ em ở bất kỳ thế hệ n&agrave;o. Ch&uacute; sư tử nh&iacute; Simba c&ugrave;ng những người bạn Timon v&agrave; Pumbaa vẫn cuốn h&uacute;t bao thế hệ kh&aacute;n giả, kh&ocirc;ng chỉ lũ trẻ m&agrave; c&ograve;n cả với người lớn.</p>
<p>
	Với sức hấp dẫn đ&oacute;, phim đoạt một giải Quả cầu v&agrave;ng, hai giải Oscar v&agrave; l&agrave; bộ phim hoạt h&igrave;nh vẽ tay ăn kh&aacute;ch nhất mọi thời đại. Hh&igrave;nh ảnh rực rỡ, &acirc;m nhạc l&atilde;ng mạn c&ugrave;ng một nội dung ẩn chứa &yacute; nghĩa nh&acirc;n văn s&acirc;u sắc, Vua sư tử vẫn l&agrave; một biểu tượng hoạt h&igrave;nh kh&oacute; c&oacute; thể lật đổ của Disney.</p>
<p>
	3. Toy Story - C&acirc;u chuyện đồ chơi (1995, 1999, 2010)</p>
<p>
	Kể từ năm 1995, khi h&atilde;ng Pixar lần đầu tr&igrave;nh l&agrave;ng t&aacute;c phẩm Toy Story g&acirc;y ấn tượng n&agrave;y, kỷ nguy&ecirc;n của phim hoạt h&igrave;nh đ&atilde; bước sang một trang mới với c&aacute;c si&ecirc;u phẩm được sản xuất dưới định dạng 3D. Bộ phim l&agrave; c&acirc;u chuyện n&oacute;i về thế giới đồ chơi của cậu b&eacute; Andy, khi vắng b&oacute;ng chủ nh&acirc;n, đ&aacute;m đồ chơi c&oacute; thể cử động v&agrave; thể hiện cảm x&uacute;c hệt như con người.</p>
<p>
	Với 3 phi&ecirc;n bản kh&aacute;c nhau, đến năm 2010, Pixar đ&atilde; nhận được năm đề cử Oscar, trong đ&oacute; c&oacute; hạng mục Phim hay nhất v&agrave; gi&agrave;nh tượng v&agrave;ng cho danh hiệu Phim hoạt h&igrave;nh hay nhất. Bộ phim vẫn giữ nguy&ecirc;n yếu tố đ&atilde; l&agrave;m n&ecirc;n th&agrave;nh c&ocirc;ng của những tập phim trước đồng thời c&oacute; một c&aacute;i kết &yacute; nghĩa v&agrave; trọn vẹn để kết th&uacute;c loạt phim. Đ&acirc;y cũng l&agrave; phim hoạt h&igrave;nh đầu ti&ecirc;n trong lịch sử đạt tới cột mốc doanh thu một tỷ USD.</p>
<p>
	4. Spirited Away &ndash; V&ugrave;ng đất linh hồn (2001)</p>
<p>
	Trong những bộ phim hoạt h&igrave;nh hay nhất mọi thời đại, hoạt h&igrave;nh Nhật Bản c&oacute; một vị tr&iacute; quan trọng với những t&aacute;c phẩm nổi tiếng. Spirited Away l&agrave; một v&iacute; dụ ti&ecirc;u biểu đ&oacute;.</p>
<p>
	Trong phim, b&eacute; Chihiro bị mắc kẹt trong thế giới ma thuật v&agrave; phải l&agrave;m việc cho ph&ugrave; thủy Yubaba để cứu cha mẹ m&igrave;nh trở lại h&igrave;nh dạng lo&agrave;i người sau khi bị một năng lực si&ecirc;u nhi&ecirc;n biến th&agrave;nh những ch&uacute; heo. Đ&acirc;y được xem l&agrave; bộ phim th&agrave;nh c&ocirc;ng nhất của đại diễn Hayao Miyazaki khi trở th&agrave;nh t&aacute;c phẩm điện ảnh th&agrave;nh c&ocirc;ng nhất của Nhật Bản khi xuất khẩu ra thị trường quốc tế , đưa t&ecirc;n tuổi h&atilde;ng Ghibli ngang bằng với c&aacute;c h&atilde;ng lớn kh&aacute;c.</p>
<p>
	<a data-index="1" href="http://baomoi-photo-1-td.zadn.vn/17/05/29/229/22397400/2_1073604.jpg"><img alt="Quoc te Thieu nhi 1/6: Nhung bo phim hoat hinh hay nhat danh cho be - Anh 2" src="http://baomoi-photo-1-td.zadn.vn/w460x/17/05/29/229/22397400/2_1073604.jpg" title="Quốc tế Thiếu nhi 1/6: Những bộ phim hoạt hình hay nhất dành cho bé - Ảnh 2" /></a></p>
<p>
	V&ugrave;ng đất linh hồn đoạt giải Oscar cho hạng mục phim hoạt h&igrave;nh xuất sắc nhất 2002</p>
<p>
	Với nhiều tầng lớp &yacute; nghĩa kh&aacute;c nhau v&agrave; tr&iacute; tưởng phong ph&uacute; của nh&agrave; l&agrave;m phim, V&ugrave;ng đất linh hồn đoạt giải Oscar cho hạng mục phim hoạt h&igrave;nh xuất sắc nhất v&agrave; giải Gấu V&agrave;ng tại Li&ecirc;n hoan phim Berlin năm 2002 v&agrave; nằm trong top 10 của danh s&aacute;ch 50 phim bạn n&ecirc;n xem khi ở tuổi 14 của Viện phim Anh quốc (BFI).</p>
<p>
	5. Wall-E - Robot biết y&ecirc;u (2008)</p>
<p>
	Khi mới ra mắt, Robot biết y&ecirc;u được đ&aacute;nh gi&aacute; l&agrave; một dự &aacute;n điện ảnh kh&aacute; t&aacute;o bạo. Với những nh&acirc;n vật ch&iacute;nh hầu như kh&ocirc;ng thể n&oacute;i chuyện, bộ phim chẳng cần lời thoại &ldquo;đao to b&uacute;a lớn&rdquo; nhưng vẫn mang trong m&igrave;nh một th&ocirc;ng điệp đầy t&iacute;nh thời sự về việc bảo về m&ocirc;i trường. T&aacute;c phẩm l&agrave; lời ch&acirc;m biếm một x&atilde; hội đang ra sức t&agrave;n ph&aacute; thế giới sống của m&igrave;nh, k&eacute;o theo đ&oacute; l&agrave; những hệ lụy nặng nề từ những h&agrave;nh động v&ocirc; &yacute; thức.</p>
<p>
	Thế giới trong nh&acirc;n vật trong phim hiện l&ecirc;n v&ocirc; c&ugrave;ng ấm &aacute;p v&agrave; nhộn nhịp. Đặc biệt nhất l&agrave; thiết kế đ&aacute;ng y&ecirc;u v&agrave; biểu cảm đầy m&agrave;u sắc của ch&uacute; robot nhặt r&aacute;c Wall-E c&ugrave;ng với t&igrave;nh y&ecirc;u cảm động của ch&uacute; d&agrave;nh cho c&ocirc; robot hiện đại Eve - người được cử xuống Tr&aacute;i Đất để t&igrave;m mầm sống.</p>
<p>
	6. How to train your dragon - B&iacute; k&iacute;p luyện rồng (2010, 2014)</p>
<p>
	V&agrave;o năm 2010, B&iacute; k&iacute;p luyện rồng được c&ocirc;ng chiếu v&agrave; tạo n&ecirc;n tiếng vang lớn, n&acirc;ng tầm h&atilde;ng phim hoạt h&igrave;nh DreamWorks Animation l&ecirc;n một tầm cao mới. Bởi những gi&aacute; trị của bộ phim mang lại ngo&agrave;i những hiệu ứng kĩ xảo đẹp mắt c&ograve;n l&agrave; cậu chuyện khơi gợi bản năng y&ecirc;u thương động vật của trẻ em với t&igrave;nh bạn tuyệt đẹp của ch&uacute; b&eacute; người Viking t&ecirc;n Hiccup v&agrave; ch&uacute; rồng m&agrave; cậu đặt biệt danh l&agrave; Răng S&uacute;n.</p>
<p>
	Kh&ocirc;ng như những bộ phim trước đ&oacute; của DreamWorks khi chỉ tuyển trọn những ng&ocirc;i sao nổi tiếng để lồng tiếng c&aacute;c nh&acirc;n vật của m&igrave;nh, B&iacute; k&iacute;p luyện rồng đ&atilde; đi s&acirc;u l&agrave;m nổi bật nội dung của phim v&agrave; đi đến một thắng lợi tuyệt đối.</p>
<p>
	7. Frozen - Nữ ho&agrave;ng băng gi&aacute; (2013)</p>
<p>
	Khơi nguồn cảm hứng từ c&acirc;u chuyện cổ t&iacute;ch B&agrave; ch&uacute;a tuyết của nh&agrave; văn người Đan Mạch Hans Christian Andersen, bộ phim kể c&acirc;u chuyện về một n&agrave;ng c&ocirc;ng ch&uacute;a dũng cảm l&ecirc;n đường t&igrave;m chị g&aacute;i, một nữ ho&agrave;ng đang phải sống c&ocirc; đơn một m&igrave;nh giữa nơi lạnh lẽo.</p>
<p>
	Frozen được đ&aacute;nh gi&aacute; l&agrave; bộ phim hoạt h&igrave;nh nhạc kịch hay nhất của Disney từ thời kỳ phục hưng của h&atilde;ng. V&igrave; vậy, cũng kh&ocirc;ng ngạc nhi&ecirc;n khi phim th&agrave;nh c&ocirc;ng ngoạn mục về thương mại khi thu về tr&ecirc;n 1,2 tỉ USD doanh thu ph&ograve;ng v&eacute; to&agrave;n cầu, trở th&agrave;nh phim hoạt h&igrave;nh c&oacute; doanh thu cao nhất hiện nay.</p>
<p>
	Ngo&agrave;i yếu tố thị trường, bộ phim cũng được đ&aacute;nh gi&aacute; cao ở g&oacute;c độ nghệ thuật khi gi&agrave;nh được hai giải Oscar ở hạng mục Phim hoạt h&igrave;nh hay nhất v&agrave; Ca kh&uacute;c trong phim hay nhất (Let It Go), một giải Quả cầu v&agrave;ng cho Phim hoạt h&igrave;nh hay nhất, giải BAFTA c&ugrave;ng hạng mục v&agrave; nhiều giải thưởng danh gi&aacute; kh&aacute;c.</p>
<p>
	8. Big Hero 6 - Biệt Đội Big Hero 6 (2014)</p>
<p>
	Big Hero 6 l&agrave; một c&acirc;u chuyện kh&ocirc;ng chỉ d&agrave;nh ri&ecirc;ng cho lứa tuổi thiếu nhi m&agrave; ph&ugrave; hợp với tất cả mọi người. Nội dung phim hội đủ yếu tố t&acirc;m l&yacute;, h&agrave;nh động, phi&ecirc;u lưu, khoa học v&agrave; cả giới t&iacute;nh. Big Hero 6 mang đến cảm gi&aacute;c vui vẻ cho trẻ em, h&agrave;i hước cho người lớn v&agrave; thỏa m&atilde;n cho những kh&aacute;n giả lớn tuổi v&agrave; kh&oacute; t&iacute;nh nhất n&ecirc;n đ&acirc;y ch&iacute;nh l&agrave; một lựa chọn ho&agrave;n hảo cho c&aacute;c gia đ&igrave;nh ng&agrave;y Quốc tế Thiếu nhi 1/6 n&agrave;y.</p>
<p>
	<a data-index="2" href="http://baomoi-photo-1-td.zadn.vn/17/05/29/229/22397400/3_147617.jpg"><img alt="Quoc te Thieu nhi 1/6: Nhung bo phim hoat hinh hay nhat danh cho be - Anh 3" src="http://baomoi-photo-1-td.zadn.vn/w460x/17/05/29/229/22397400/3_147617.jpg" title="Quốc tế Thiếu nhi 1/6: Những bộ phim hoạt hình hay nhất dành cho bé - Ảnh 3" /></a></p>
<p>
	Big Hero 6 ghi điểm bởi &acirc;m nhạc s&ocirc;i động v&agrave; lời b&agrave;i h&aacute;t rất ph&ugrave; hợp với kịch bản</p>
<p>
	Bộ phim ghi điểm bởi t&igrave;nh tiết tinh tế v&agrave; hết sức nhẹ nh&agrave;ng khi n&oacute;i về h&agrave;nh tr&igrave;nh trưởng th&agrave;nh của cậu b&eacute; Hiro c&ugrave;ng với người h&ugrave;ng robot Baymax v&agrave; những c&aacute;i &ocirc;m &ecirc;m &aacute;i của nh&acirc;m vật tr&ograve;n trịa n&agrave;y. Ngo&agrave;i nội dung v&agrave; tạo h&igrave;nh nh&acirc;n vật xuất sắc, Big Hero 6 ghi điểm bởi &acirc;m nhạc s&ocirc;i động v&agrave; lời b&agrave;i h&aacute;t rất ph&ugrave; hợp với kịch bản.</p>
<p>
	9. Inside Out - Những mảnh gh&eacute;p cảm x&uacute;c (2015)</p>
<p>
	L&agrave; dự &aacute;n được được hai h&atilde;ng hoạt h&igrave;nh nổi tiếng Pixar v&agrave; Disney ấp ủ trong nhiều năm, ngay khi ra mắt t&aacute;c phẩm đ&atilde; khiến người h&acirc;m mộ v&ocirc; c&ugrave;ng h&agrave;i l&ograve;ng. Bộ phim n&oacute;i về c&ocirc; b&eacute; 11 tuổi Riley với những cảm x&uacute;c lẫn lộn khi phải chuyển đến sống tại một nơi xa lạ. C&ocirc; bị chi phối bởi năm cảm x&uacute;c gồm Vui Vẻ, Buồn b&atilde;, Sợ sệt, Chảnh chọe v&agrave; Giận dữ. Những cảm x&uacute;c n&agrave;y lưu giữ c&aacute;c k&yacute; ức h&agrave;ng ng&agrave;y cho Riley v&agrave; gi&uacute;p c&ocirc; b&eacute; trưởng th&agrave;nh.</p>
<p>
	Những nh&agrave; ph&ecirc; b&igrave;nh phim đ&aacute;nh gi&aacute; đ&acirc;y l&agrave; đỉnh cao của tr&iacute; tuệ con người được thể hiện qua phim hoạt h&igrave;nh. Một c&acirc;u chuyện về những cảm x&uacute;c trong bộ n&atilde;o con người kh&ocirc;ng phải l&agrave; điều m&agrave; ai cũng c&oacute; thể s&aacute;ng tạo ra được. Kh&ocirc;ng nằm ngo&agrave;i dự đo&aacute;n, Inside Out ch&iacute;nh l&agrave; Phim hoạt h&igrave;nh xuất sắc nhất tại Oscar lần thứ 88.</p>
<p>
	10. Your Name (2016)</p>
<p>
	Your Name mang lại chuyện t&igrave;nh đầy cảm động của hai con người xa lạ t&igrave;nh cờ bị &quot;ho&aacute;n đổi&quot; th&acirc;n x&aacute;c cho nhau. Kh&aacute;c với những bộ phim trước đ&oacute;, Your Name sở hữu tiết tấu nhanh, dồn dập c&ugrave;ng một h&agrave;nh tr&igrave;nh truy đuổi số phận cực kỳ bất ngờ.</p>
<p>
	Mitsuha lu&ocirc;n ch&aacute;n chường với cuộc sống tẻ nhạt của m&igrave;nh v&agrave; mơ ước được l&agrave;m anh ch&agrave;ng đẹp trai sống tại thủ đ&ocirc;. Trong khi đ&oacute;, Taki hằng đ&ecirc;m lại nh&igrave;n thấy m&igrave;nh trong h&igrave;nh h&agrave;i c&ocirc; g&aacute;i v&ugrave;ng miền qu&ecirc;. Ước mơ của cả 2 đ&atilde; th&agrave;nh sự thật khi sao chổi ngh&igrave;n năm xuất hiện tr&ecirc;n tr&aacute;i đất v&agrave; rồi cứ c&aacute;ch ng&agrave;y lại được ho&aacute;n đổi cơ thể cho nhau.</p>
<p>
	V&igrave; thế, t&aacute;c phẩm mới nhất của đạo diễn Makoto Shinkai đ&atilde; trở th&agrave;nh bộ phim c&oacute; doanh thu cao thứ ba mọi thời đại ở đất nước n&agrave;y (vượt qua Princess Mononoke, xếp sau Howl&rsquo;s Moving Castle v&agrave; Spirited Away).</p>
<p>
	<a data-index="3" href="http://baomoi-photo-1-td.zadn.vn/17/05/29/229/22397400/4_110007.jpg"><img alt="Quoc te Thieu nhi 1/6: Nhung bo phim hoat hinh hay nhat danh cho be - Anh 4" src="http://baomoi-photo-1-td.zadn.vn/w460x/17/05/29/229/22397400/4_110007.jpg" title="Quốc tế Thiếu nhi 1/6: Những bộ phim hoạt hình hay nhất dành cho bé - Ảnh 4" /></a></p>
<p>
	Your Name sở hữu tiết tấu nhanh, dồn dập v&ocirc; c&ugrave;ng cuốn h&uacute;t</p>
<p>
	Tr&ecirc;n đ&acirc;y l&agrave; 10 bộ phim hoạt h&igrave;nh với những c&acirc;u chuyện kh&aacute;c nhau c&oacute; sức cuốn h&uacute;t v&ocirc; c&ugrave;ng mạnh mẽ. Bạn c&oacute; thể d&agrave;nh thời gian để xem với những em nhỏ v&agrave;o dịp Quốc tế Thiếu nhi 1/6, vừa giải tr&iacute; vừa cũng c&aacute;c bạn nhỏ r&uacute;t ra những b&agrave;i học bổ &iacute;ch trong cuộc sống.</p>
', 1, 9)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (80, N'Đến ''viêm màng túi'' vì quá nhiều phim hay ra rạp cuối tuần này', N'2017_05_31_23_25_45_209in-080303854.jpg', N' (Emdep.vn) - Ra rạp cuối tuần này, khán giả sẽ có nhiều lựa chọn từ dòng phim gia đình đến phim hành động. ', CAST(N'2017-05-31 00:00:00.000' AS DateTime), 0, N'<p>
	<strong>C&oacute; căn nh&agrave; nằm nghe nắng mưa</strong></p>
<p>
	Khởi chiếu: 5/5<br />
	Thời lượng: 100 ph&uacute;t<br />
	Diễn vi&ecirc;n: NSƯT Kim Xu&acirc;n, NSND Ngọc Gi&agrave;u, L&ecirc; B&igrave;nh, Tấn Thi, Kiều Oanh, Dương Cường, Khắc Minh, Kiều Trinh&hellip;</p>
<p>
	<img alt="Đóng đô ở rạp chiếu cuối tuần vì những phim hay khó bỏ lỡ" class="td-animation-stack-type0-2" src="http://thumb.connect360.vn/unsafe/700x0/imgs.emdep.vn/Share/Image/2017/05/05/nha-082522328.jpg" width="600" /></p>
<p>
	&ldquo;Căn nh&agrave; nằm nghe nắng mưa&rdquo; kể về c&acirc;u chuyện của Nam (Khắc Minh). Đ&oacute; l&agrave; một c&acirc;u b&eacute; ngoan ngo&atilde;n, hiếu thảo nhưng v&ocirc; t&igrave;nh vướng v&agrave;o rắc rối v&agrave; trở th&agrave;nh kẻ giết người. Mẹ của cậu, b&agrave; Tư (Kim Xu&acirc;n) đ&atilde; t&igrave;m c&aacute;ch đưa con trai đi trốn để tr&aacute;nh v&agrave;o t&ugrave;. Cũng từ đ&oacute;, b&agrave; phải sống trong sự xa l&aacute;nh, gi&egrave;m pha của h&agrave;ng x&oacute;m l&aacute;ng giềng. Tuy vậy b&agrave; vẫn cố gắng chịu đựng v&agrave; vượt qua để mong một ng&agrave;y con trai được giải oan v&agrave; được nghe tiếng gọi th&acirc;n thương của con trai.</p>
<p>
	<img alt="Đóng đô ở rạp chiếu cuối tuần vì những phim hay khó bỏ lỡ" class="td-animation-stack-type0-2" src="http://thumb.connect360.vn/unsafe/700x0/imgs.emdep.vn/Share/Image/2017/05/05/n-082656739.jpg" width="600" /></p>
<p>
	Với những t&igrave;nh tiết nhẹ nh&agrave;ng nhưng thấm đẫm nh&acirc;n văn, &ldquo;Căn nh&agrave; nằm nghe nắng mưa&rdquo; đưa người xem trở về những năm xưa cũ c&ugrave;ng những trăn trở, đau đ&aacute;u của người mẹ thương con.</p>
<p>
	<strong>The Circle (V&ograve;ng xoay ảo)</strong></p>
<p>
	Khởi chiếu: 5/5<br />
	Thời lượng: 110 ph&uacute;t<br />
	Diễn vi&ecirc;n: Emma Watson, Tom Hanks, John Boyega, Patton Oswalt, Bill Paxton, Karen Gillan, Ellar Coltrane</p>
<p>
	<img alt="Đóng đô ở rạp chiếu cuối tuần vì những phim hay khó bỏ lỡ" class="td-animation-stack-type0-2" src="http://thumb.connect360.vn/unsafe/700x0/imgs.emdep.vn/Share/Image/2017/05/05/circle-082532281.jpg" width="600" /></p>
<p>
	&ldquo;The Circle&rdquo; xoay quanh cuộc sống của c&ocirc; g&aacute;i trẻ Mae (Emma Watson). C&ocirc; được nhận v&agrave;o l&agrave;m tại The Circle, một tập đo&agrave;n c&ocirc;ng nghệ lớn h&agrave;ng đầu thế giới. Mọi thứ tưởng chừng như ho&agrave;n hảo với c&ocirc; g&aacute;i trẻ cho đến l&uacute;c Mae ph&aacute;t hiện ra những b&iacute; mật khủng khiếp giấu k&iacute;n đằng sau danh tiếng v&agrave; sự ph&aacute;t triển của c&ocirc;ng ty m&igrave;nh đang l&agrave;m việc. C&ocirc; g&aacute;i trẻ sẽ phải l&agrave;m g&igrave; để đối ph&oacute; với những vấn đề m&igrave;nh gặp phải?</p>
<p>
	<img alt="Đóng đô ở rạp chiếu cuối tuần vì những phim hay khó bỏ lỡ" class="td-animation-stack-type0-2" src="http://thumb.connect360.vn/unsafe/700x0/imgs.emdep.vn/Share/Image/2017/05/05/e-082709703.jpg" width="600" /></p>
<p>
	Sau th&agrave;nh c&ocirc;ng của &ldquo;Beauty and The Beast&rdquo;, Emma Watson lại tiếp tục khiến kh&aacute;n giả th&aacute;n phục khả năng diễn xuất t&agrave;i t&igrave;nh của m&igrave;nh trong vai diễn mới. Thế n&ecirc;n &ldquo;The Circle&rdquo; c&agrave;ng được chờ đ&oacute;n để xem c&ocirc; g&aacute;i trẻ sẽ c&ograve;n g&acirc;y n&ecirc;n những bất ngờ n&agrave;o nữa.</p>
<p>
	<strong>Extraordinary Mission (Nhiệm vụ phi ph&agrave;m)</strong></p>
<p>
	Khởi chiếu: 5/5<br />
	Thời lượng: 117 ph&uacute;t<br />
	Diễn vi&ecirc;n: Ho&agrave;ng Hi&ecirc;n, Đoạn Dịch Ho&agrave;nh, Lang Nguyệt Đ&igrave;nh, Tổ Phong</p>
<p>
	<img alt="phim chiếu rạp, phim cuối tuần" class="td-animation-stack-type0-2" src="http://thumb.connect360.vn/unsafe/700x0/imgs.emdep.vn/Share/Image/2017/05/05/miss-082541516.jpg" width="600" /></p>
<p>
	Trong &ldquo;Extraordinary Misson&rdquo;, L&acirc;m Khải (Ho&agrave;ng Hi&ecirc;n)nhận nhiệm vụ th&acirc;m nhập v&agrave;o tổ chức bu&ocirc;n ma t&uacute;y xuy&ecirc;n quốc gia nguy hiểm theo mệnh lệnh của cấp tr&ecirc;n. Sau khi lọt v&agrave;o được tổ chức n&agrave;y, anh &acirc;m thầm điều tra, theo d&otilde;i v&agrave; ph&aacute;t hiện ra mối li&ecirc;n hệ đ&aacute;ng ngờ giữa người đứng đầu tổ chức n&agrave;y với vụ &aacute;n ma t&uacute;y 8 năm trước do cấp tr&ecirc;n của m&igrave;nh phụ tr&aacute;ch. Từ đ&oacute;, những b&iacute; mật chưa c&oacute; lời giải đ&aacute;p dần dần h&eacute; lộ.</p>
', 1, 9)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (81, N'Đủ loạt phim hay kéo bạn ra rạp chiếu cuối tuần này', N'2017_05_31_23_26_37_603king-081308819.jpg', N' (Emdep.vn) - Cuối tuần này ra rạp, khán giả sẽ được thưởng thức loạt phim hay từ thể loại thần thoại đến kinh dị, hoạt hình. ', CAST(N'2017-05-31 00:00:00.000' AS DateTime), 0, N'<p>
	<strong>C&oacute; căn nh&agrave; nằm nghe nắng mưa</strong></p>
<p>
	Khởi chiếu: 5/5<br />
	Thời lượng: 100 ph&uacute;t<br />
	Diễn vi&ecirc;n: NSƯT Kim Xu&acirc;n, NSND Ngọc Gi&agrave;u, L&ecirc; B&igrave;nh, Tấn Thi, Kiều Oanh, Dương Cường, Khắc Minh, Kiều Trinh&hellip;</p>
<p>
	<img alt="Đóng đô ở rạp chiếu cuối tuần vì những phim hay khó bỏ lỡ" class="td-animation-stack-type0-2" src="http://thumb.connect360.vn/unsafe/700x0/imgs.emdep.vn/Share/Image/2017/05/05/nha-082522328.jpg" width="600" /></p>
<p>
	&ldquo;Căn nh&agrave; nằm nghe nắng mưa&rdquo; kể về c&acirc;u chuyện của Nam (Khắc Minh). Đ&oacute; l&agrave; một c&acirc;u b&eacute; ngoan ngo&atilde;n, hiếu thảo nhưng v&ocirc; t&igrave;nh vướng v&agrave;o rắc rối v&agrave; trở th&agrave;nh kẻ giết người. Mẹ của cậu, b&agrave; Tư (Kim Xu&acirc;n) đ&atilde; t&igrave;m c&aacute;ch đưa con trai đi trốn để tr&aacute;nh v&agrave;o t&ugrave;. Cũng từ đ&oacute;, b&agrave; phải sống trong sự xa l&aacute;nh, gi&egrave;m pha của h&agrave;ng x&oacute;m l&aacute;ng giềng. Tuy vậy b&agrave; vẫn cố gắng chịu đựng v&agrave; vượt qua để mong một ng&agrave;y con trai được giải oan v&agrave; được nghe tiếng gọi th&acirc;n thương của con trai.</p>
<p>
	<img alt="Đóng đô ở rạp chiếu cuối tuần vì những phim hay khó bỏ lỡ" class="td-animation-stack-type0-2" src="http://thumb.connect360.vn/unsafe/700x0/imgs.emdep.vn/Share/Image/2017/05/05/n-082656739.jpg" width="600" /></p>
<p>
	Với những t&igrave;nh tiết nhẹ nh&agrave;ng nhưng thấm đẫm nh&acirc;n văn, &ldquo;Căn nh&agrave; nằm nghe nắng mưa&rdquo; đưa người xem trở về những năm xưa cũ c&ugrave;ng những trăn trở, đau đ&aacute;u của người mẹ thương con.</p>
<p>
	<strong>The Circle (V&ograve;ng xoay ảo)</strong></p>
<p>
	Khởi chiếu: 5/5<br />
	Thời lượng: 110 ph&uacute;t<br />
	Diễn vi&ecirc;n: Emma Watson, Tom Hanks, John Boyega, Patton Oswalt, Bill Paxton, Karen Gillan, Ellar Coltrane</p>
<p>
	<img alt="Đóng đô ở rạp chiếu cuối tuần vì những phim hay khó bỏ lỡ" class="td-animation-stack-type0-2" src="http://thumb.connect360.vn/unsafe/700x0/imgs.emdep.vn/Share/Image/2017/05/05/circle-082532281.jpg" width="600" /></p>
<p>
	&ldquo;The Circle&rdquo; xoay quanh cuộc sống của c&ocirc; g&aacute;i trẻ Mae (Emma Watson). C&ocirc; được nhận v&agrave;o l&agrave;m tại The Circle, một tập đo&agrave;n c&ocirc;ng nghệ lớn h&agrave;ng đầu thế giới. Mọi thứ tưởng chừng như ho&agrave;n hảo với c&ocirc; g&aacute;i trẻ cho đến l&uacute;c Mae ph&aacute;t hiện ra những b&iacute; mật khủng khiếp giấu k&iacute;n đằng sau danh tiếng v&agrave; sự ph&aacute;t triển của c&ocirc;ng ty m&igrave;nh đang l&agrave;m việc. C&ocirc; g&aacute;i trẻ sẽ phải l&agrave;m g&igrave; để đối ph&oacute; với những vấn đề m&igrave;nh gặp phải?</p>
<p>
	<img alt="Đóng đô ở rạp chiếu cuối tuần vì những phim hay khó bỏ lỡ" class="td-animation-stack-type0-2" src="http://thumb.connect360.vn/unsafe/700x0/imgs.emdep.vn/Share/Image/2017/05/05/e-082709703.jpg" width="600" /></p>
<p>
	Sau th&agrave;nh c&ocirc;ng của &ldquo;Beauty and The Beast&rdquo;, Emma Watson lại tiếp tục khiến kh&aacute;n giả th&aacute;n phục khả năng diễn xuất t&agrave;i t&igrave;nh của m&igrave;nh trong vai diễn mới. Thế n&ecirc;n &ldquo;The Circle&rdquo; c&agrave;ng được chờ đ&oacute;n để xem c&ocirc; g&aacute;i trẻ sẽ c&ograve;n g&acirc;y n&ecirc;n những bất ngờ n&agrave;o nữa.</p>
<p>
	<strong>Extraordinary Mission (Nhiệm vụ phi ph&agrave;m)</strong></p>
<p>
	Khởi chiếu: 5/5<br />
	Thời lượng: 117 ph&uacute;t<br />
	Diễn vi&ecirc;n: Ho&agrave;ng Hi&ecirc;n, Đoạn Dịch Ho&agrave;nh, Lang Nguyệt Đ&igrave;nh, Tổ Phong</p>
<p>
	<img alt="phim chiếu rạp, phim cuối tuần" class="td-animation-stack-type0-2" src="http://thumb.connect360.vn/unsafe/700x0/imgs.emdep.vn/Share/Image/2017/05/05/miss-082541516.jpg" width="600" /></p>
<p>
	Trong &ldquo;Extraordinary Misson&rdquo;, L&acirc;m Khải (Ho&agrave;ng Hi&ecirc;n)nhận nhiệm vụ th&acirc;m nhập v&agrave;o tổ chức bu&ocirc;n ma t&uacute;y xuy&ecirc;n quốc gia nguy hiểm theo mệnh lệnh của cấp tr&ecirc;n. Sau khi lọt v&agrave;o được tổ chức n&agrave;y, anh &acirc;m thầm điều tra, theo d&otilde;i v&agrave; ph&aacute;t hiện ra mối li&ecirc;n hệ đ&aacute;ng ngờ giữa người đứng đầu tổ chức n&agrave;y với vụ &aacute;n ma t&uacute;y 8 năm trước do cấp tr&ecirc;n của m&igrave;nh phụ tr&aacute;ch. Từ đ&oacute;, những b&iacute; mật chưa c&oacute; lời giải đ&aacute;p dần dần h&eacute; lộ.</p>
', 1, 9)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (82, N'Dịp nghỉ lễ 30/4 nhanh chân ra rạp xem ''Em chưa 18''', N'2017_05_31_23_27_25_15318-144610016.jpg', N' (Emdep.vn) - "Em chưa 18" là phim Việt được khán giả cực kỳ mong chờ vào cuối tuần này bên cạnh màn tái xuất của "Guardians Of The Galaxy 2" và thế giới diệu kỳ của "Smurfs: The Lost Village". ', CAST(N'2017-05-31 00:00:00.000' AS DateTime), 0, N'<p class="the-article-summary cms-desc">
	V&agrave;o dịp lễ 30/4, &quot;Em chưa 18&quot; l&agrave; phim c&oacute; nhiều suất chiếu vượt trội, nhiều rạp đ&atilde; tăng gi&aacute; v&eacute; bộ phim Việt n&agrave;y.</p>
<div class="the-article-body cms-body">
	<p>
		Rạp chiếu phim l&agrave; một trong những điểm giải tr&iacute; được nhiều người lựa chọn trong c&aacute;c dịp lễ.</p>
	<p>
		Dịp nghỉ lễ 30/4 năm nay, c&aacute;c suất chiếu tại c&aacute;c cụm rạp ở TP.HCM tiếp tục được giới trẻ, cũng như c&aacute;c &ldquo;mọt phim&rdquo; lựa chọn l&agrave; điểm vui chơi tốn &iacute;t chi ph&iacute; nhất.</p>
	<p>
		<em>Em chưa 18, Vệ binh dải ng&acirc;n h&agrave; 2, X&igrave; Trum: Ng&ocirc;i l&agrave;ng b&iacute; ẩn, Tiếng vọng từ tường đ&aacute;, Fast &amp; Furious 8, C&ocirc; g&aacute;i v&agrave; g&atilde; khổng lồ, Th&agrave;nh phố ảo</em> ... l&agrave; những bộ phim đang được ph&aacute;t h&agrave;nh tại cụm rạp CGV. Trong đ&oacute; <em>Em chưa 18</em> c&oacute; lượt mua online v&agrave; mua trực tiếp vượt trội so với c&aacute;c phim c&ograve;n lại.</p>
	<table align="center" class="picture">
		<tbody>
			<tr>
				<td class="pic">
					<img alt="‘Em chua 18’ dat khach rap chieu ngay nghi le hinh anh 1" height="975" src="http://znews-photo-td.zadn.vn/w660/Uploaded/Yfrur/2017_04_30/ec18characterposterkmtkt21490935133437.jpg" width="650" /></td>
			</tr>
			<tr>
				<td class="pCaption caption">
					Phim <em>Em chưa 18 </em>c&oacute; suất chiếu nhiều nhất ở c&aacute;c cụm rạp BHD, Galaxy, CGV... Ảnh: <em>ĐPCC.</em></td>
			</tr>
		</tbody>
	</table>
	<p>
		&ldquo;<em>Em chưa 18 </em>từ l&uacute;c ph&aacute;t h&agrave;nh cho đến thời điểm n&agrave;y vẫn l&agrave; lựa chọn đầu ti&ecirc;n khi kh&aacute;ch h&agrave;ng hỏi mua v&eacute;, kế sau đ&oacute; l&agrave; <em>Fast &amp; Furious 8, X&igrave; Trum: Ng&ocirc;i l&agrave;ng b&iacute; ẩn.</em> C&aacute;c suất chiếu của <em>Em chưa 18</em> lu&ocirc;n được đặt mua online từ kh&aacute;c sớm v&agrave; suất n&agrave;o cũng k&iacute;n rạp&rdquo;, một nh&acirc;n vi&ecirc;n b&aacute;n h&agrave;ng tại CGV CT Plaza chia sẻ.</p>
	<p>
		Mặc d&ugrave; l&agrave; phim c&oacute; nhiều suất chiếu nhất m&ugrave;a lễ, nhưng kh&ocirc;ng v&igrave; thế m&agrave; CGV tăng gi&aacute; b&aacute;n. <em>Em chưa 18</em> vẫn được giữ ở mức 85.000 VNĐ &ndash; 95.000 VNĐ (tuỳ vị tr&iacute; chỗ ngồi) v&agrave;o hai ng&agrave;y lễ 30/4 v&agrave; 1/5. CGV được cho l&agrave; rạp c&oacute; chỗ ngồi tiện nghi, m&agrave;n h&igrave;nh hiện đại nhất hiện nay n&ecirc;n gi&aacute; v&eacute; kh&aacute; ch&ecirc;nh lệch so với BHD, Galaxy...</p>
	<p>
		Giống với CGV, tại BHD, <em>Em chưa 18</em> cũng l&agrave; phim c&oacute; suất chiếu nhiều nhất. Thậm ch&iacute;, trong dịp lễ, một số cụm rạp của BHD c&ograve;n tăng cường suất chiếu. Cụ thế BHD Bitexco c&oacute; th&ecirc;m suất chiếu v&agrave;o l&uacute;c 8h30 s&aacute;ng. C&aacute;c suất chiếu kh&aacute;c trong ng&agrave;y vẫn được giữ nguy&ecirc;n. Suất cuối c&ugrave;ng l&uacute;c 23h40.</p>
	<p>
		Gi&aacute; v&eacute; tại BHD Bitexco tăng hơn so với ng&agrave;y thường khoảng từ 15.000 VND đến 20.000 VND tuỳ phim v&agrave; suất chiếu.</p>
	<table align="center" class="picture">
		<tbody>
			<tr>
				<td class="pic">
					<img alt="‘Em chua 18’ dat khach rap chieu ngay nghi le hinh anh 2" height="425" src="http://znews-photo-td.zadn.vn/w660/Uploaded/Yfrur/2017_04_30/18197727_10209479394041138_1783108336_n.jpg" title="‘Em chưa 18’ đắt khách rạp chiếu ngày nghỉ lễ hình ảnh 2" width="678" /></td>
			</tr>
			<tr>
				<td class="pCaption caption">
					Gi&aacute; v&eacute;<em>&nbsp;</em>tại Galaxy Nguyễn Du ng&agrave;y lễ tăng th&ecirc;m 10.000 VND so với ng&agrave;y thường. Ảnh: <em>KL.</em></td>
			</tr>
		</tbody>
	</table>
	<p>
		&ldquo;Hiện <em>Em chưa 18</em> đang h&uacute;t người xem. Hầu hết kh&aacute;ch h&agrave;ng đều lựa chọn phim n&agrave;y v&agrave; suất b&aacute;n chạy nhất v&agrave;o khoảng 20h đến 22h. D&ugrave; rạp tăng gi&aacute; v&eacute; cho tất cả c&aacute;c phim nh&acirc;n ng&agrave;y lễ nhưng người xem vẫn đến kh&aacute; đ&ocirc;ng. Lượt v&eacute; đặt online cũng nhiều hơn so với b&igrave;nh thường&rdquo;, một nh&acirc;n vi&ecirc;n b&aacute;n v&eacute; tại BHD Bitexco cho biết.</p>
	<p>
		Khi được hỏi về việc lựa chọn rạp BHD Bitexco, CGV để thưởng thức phim trong ng&agrave;y lễ khi hai cụm rạp n&agrave;y c&oacute; c&ugrave;ng gi&aacute; v&eacute;, chị H&agrave; Hương (nh&acirc;n vi&ecirc;n văn ph&ograve;ng) cho hay chị v&agrave; gia đ&igrave;nh chọn BHD Bitexco v&igrave; điểm n&agrave;y kh&aacute; gần với nh&agrave; chị. Hơn nữa, xem phim tại Bitexco cũng thuận tiện cho việc mua sắm, ăn uống v&igrave; gia đ&igrave;nh chị dự định d&agrave;nh thời gian b&ecirc;n nhau v&agrave;o tối 30/4.</p>
	<p>
		Tương tự CGV v&agrave; BHD, Galaxy Cinema tăng gi&aacute; cho tất cả c&aacute;c phim đang ph&aacute;t h&agrave;nh dịp lễ Quốc tế Lao động. Gi&aacute; ng&agrave;y thường (gồm thứ 2,4,5 l&agrave; 75.000 VND) ng&agrave;y đặc biệt l&agrave; thứ 3 &ndash; 55.000 VND th&igrave; ng&agrave;y lễ Galaxy Nguyễn Du c&oacute; gi&aacute; v&eacute; 85.000 VND cho người lớn, thấp nhất l&agrave; 55.000 VND cho trẻ em.&nbsp;<em>Em chưa 18</em> cũng l&agrave; một phim ăn kh&aacute;ch tại cụm rạp n&agrave;y.</p>
	<p>
		Ng&agrave;y 30/4, phim <em>Em chưa 18</em> tại Galaxy Nguyễn Du c&oacute; 11 suất chiếu, v&agrave; 9 suất chiếu cho ng&agrave;y 1/5.</p>
	<table align="center" class="picture">
		<tbody>
			<tr>
				<td class="pic">
					<img alt="‘Em chua 18’ dat khach rap chieu ngay nghi le hinh anh 3" height="612" src="http://znews-photo-td.zadn.vn/w660/Uploaded/Yfrur/2017_04_30/18253849_10209479394161141_777308148_n.jpg" title="‘Em chưa 18’ đắt khách rạp chiếu ngày nghỉ lễ hình ảnh 3" width="942" /></td>
			</tr>
			<tr>
				<td class="pCaption caption">
					Rạp Cinestar đ&ocirc;ng kh&aacute;ch ở mọi thời điểm trong ng&agrave;y 30/4. Ảnh: <em>KL.</em></td>
			</tr>
		</tbody>
	</table>
	<p>
		B&ecirc;n cạnh những cụm rạp thu h&uacute;t người xem, th&igrave; rạp chiếu phim d&agrave;nh cho giới sinh vi&ecirc;n, học sinh &ndash; Cinestar &ndash; vẫn giữ nguy&ecirc;n gi&aacute; v&eacute; l&agrave; 45.000 VND cho tất cả c&aacute;c suất chiếu. Phim <em>Em chưa 18 </em>chiếm số suất chiếu l&ecirc;n đến 13 tại Cinestar Nguyễn Tr&atilde;i.</p>
</div>
<p>
	&nbsp;</p>
', 1, 9)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (83, N'Hawaii đẹp thế kia ngại gì mà không vượt đại dương đến trải nghiệm', N'2017_05_31_23_28_25_8481-visit-hawaii-153105498.jpg', N' (Emdep.vn) - Còn gì tuyệt vời hơn khi hòa mình vào làn nước trong xanh, rặng san hô sặc sỡ hay những ngọn núi lửa hùng vĩ tại Hawaii – thiên đường nơi hạ giới. ', CAST(N'2017-05-31 00:00:00.000' AS DateTime), 0, N'<p>
	Hawaii l&agrave; điểm đến tuyệt vời cho những du kh&aacute;ch y&ecirc;u th&iacute;ch vẻ đẹp biển. Khung cảnh tuyệt đẹp làm đắm say b&acirc;́t kỳ du khách nào khi đặt ch&acirc;n đến h&ograve;n ngọc giữa Th&aacute;i B&igrave;nh Dương.&nbsp;V&igrave; vậy, khi đến Hawaii bạn kh&ocirc;ng thể bỏ qua những điểm đến th&uacute; vị dưới đ&acirc;y.</p>
<p>
	Biển bắc&nbsp;Oahu&nbsp;(The&nbsp;North Shore, Hawaii)</p>
<p>
	<img alt="" src="https://upload.wikimedia.org/wikipedia/commons/5/59/Hawai-_2013-04-18_22-41.jpg" style="width: 680px; height: 425px;" /></p>
<p>
	Oahu l&agrave; đảo lớn thứ hai trong quần đảo Hawaii v&agrave; l&agrave; đảo đ&ocirc;ng d&acirc;n nhất ở tiểu bang Hawaii, Mỹ. Đ&acirc;y l&agrave; điểm đến đầy phi&ecirc;u lưu cho du kh&aacute;ch ưa kh&aacute;m ph&aacute;. Bạn c&oacute; thể tham gia c&aacute;c hoạt động thể thao hấp dẫn như lướt s&oacute;ng, bơi lội, ch&egrave;o thuyền kayak, l&ecirc;n v&aacute;ch đ&aacute; Pali.</p>
<p>
	Nếu kh&ocirc;ng th&iacute;ch chơi c&aacute;c tr&ograve; chơi mạo hiểm, bạn c&oacute; thể v&ograve;ng quanh Oahu hay ngắm ho&agrave;ng h&ocirc;n tuyệt đẹp ở Waikki.</p>
<p>
	Bờ biển&nbsp;Na Pali (đảo Kauai, Hawaii)</p>
<p>
	Bờ biển Na Pali&nbsp;l&agrave; một phần của h&ograve;n đảo xinh đẹp Kauai. Những b&atilde;i biển hoang sơ, v&aacute;ch đ&aacute; ấn tượng, con đường m&ograve;n, đường d&agrave;i gập ghềnh v&agrave; di t&iacute;ch khảo cổ khiến bạn như lạc v&agrave;o thi&ecirc;n đường dưới hạ giới. Đi bộ, leo n&uacute;i, ch&egrave;o thuyền kayak hay ngắm cảnh từ trực thăng l&agrave; những trải nghiệm khiến bạn cảm gi&aacute;c như được h&ograve;a m&igrave;nh v&agrave;o v&ugrave;ng đất tuyệt diệu n&agrave;y.</p>
<p>
	Đến thăm quần đảo Hawaii, bạn c&ograve;n c&oacute; cơ hội lặn biển, chi&ecirc;m ngưỡng vẻ đẹp của biển, ngắm nh&igrave;n sinh vật biển như c&aacute; mập, r&ugrave;a biển xanh,&hellip; Ở đ&acirc;y, r&ugrave;a biển xanh được coi l&agrave; biểu tượng cho may mắn v&agrave; trường thọ.</p>
<p>
	Vườn quốc gia Haleakalā</p>
<p>
	Vườn quốc gia Haleakalā l&agrave; một trong những điểm đến thu h&uacute;t kh&aacute;ch du kh&aacute;ch khắp nơi tr&ecirc;n thế giới. Du kh&aacute;ch đến đ&acirc;y vừa được chi&ecirc;m ngưỡng phong cảnh thi&ecirc;n nhi&ecirc;n thơ mộng, b&atilde;i c&aacute;t d&agrave;i, những c&aacute;nh rừng xanh m&aacute;t vừa được đ&oacute;n &aacute;nh b&igrave;nh minh tr&ecirc;n đỉnh n&uacute;i lửa&nbsp;Haleakalā.</p>
', 1, 9)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (84, N'Chỉ cách Việt Nam 200km cũng có một Hawaii đẹp như tranh vẽ', N'2017_05_31_23_30_46_283pic-1-155104853.jpg', N' (Emdep.vn) - Chắc chắn bạn sẽ không thất vọng khi đến thăm thành phố biển được mệnh danh là “Hawaii” của Trung Quốc này. ', CAST(N'2017-05-31 00:00:00.000' AS DateTime), 1, N'<p>
	Bắc Hải l&agrave; một th&agrave;nh phố biển nằm ph&iacute;a đ&ocirc;ng nam thuộc khu tự trị d&acirc;n tộc Choang Quảng T&acirc;y, Trung Quốc v&agrave; ph&iacute;a bắc Vịnh Bắc Bộ. Mặc d&ugrave; kh&ocirc;ng nổi tiếng so với những địa danh kh&aacute;c như Bắc Kinh, Thượng Hải&hellip; song Bắc Hải cũng l&agrave; một điểm dừng ch&acirc;n l&yacute; tưởng cho m&ugrave;a h&egrave; bởi thời tiết thuận lợi, nhiều danh lam thắng cảnh v&agrave; đặc biệt l&agrave; b&atilde;i biển tuyệt đẹp.</p>
<p>
	<img alt="" src="https://upload.wikimedia.org/wikipedia/commons/5/59/Hawai-_2013-04-18_22-41.jpg" style="width: 580px; height: 363px;" /></p>
<p>
	Bắc Hải được biết đến với miền đất đẹp như tranh vẽ với b&atilde;i biển Ng&acirc;n Than c&oacute; b&atilde;i c&aacute;t mịn, nước biển sạch v&agrave; s&oacute;ng nhẹ nh&agrave;ng.</p>
<p>
	V&agrave;o m&ugrave;a du lịch, nơi đ&acirc;y tập trung rất đ&ocirc;ng du kh&aacute;ch đến tắm biển v&agrave; thưởng thức cảnh đẹp của biển Ng&acirc;n Than. Một điểm nhấn của Ng&acirc;n Than l&agrave; h&agrave;ng dừa xanh m&aacute;t chạy dọc b&atilde;i biển, mang lại cảm gi&aacute;c thư th&aacute;i khi nằm nghỉ ngơi dưới t&aacute;n dừa.</p>
<p>
	Ho&agrave;ng h&ocirc;n bu&ocirc;ng xuống, b&atilde;i biển như được d&aacute;t một &aacute;nh v&agrave;ng huyền ảo. T&acirc;m hồn trở n&ecirc;n thư th&aacute;i c&ugrave;ng c&aacute;c con s&oacute;ng vỗ bờ.</p>
<p>
	Ngo&agrave;i vẻ đẹp tự nhi&ecirc;n, Bắc Hải c&oacute; rất nhiều điểm di t&iacute;ch lịch sử như khu Phố cổ của th&agrave;nh phố được x&acirc;y dựng v&agrave;o thời nh&agrave; Thanh. Với sự kết hợp giữa c&aacute;c t&ograve;a nh&agrave; mang phong c&aacute;ch phương Đ&ocirc;ng v&agrave; phương T&acirc;y, hiện nay chủ yếu quanh khu vực đường Ch&acirc;u Hải v&agrave; đường Trung Sơn.</p>
<p>
	Bắc Hải được mở cửa cho người nước ngo&agrave;i như l&agrave; một cảng thương mại v&agrave;o năm 1876, v&agrave; c&aacute;c l&atilde;nh sự qu&aacute;n của th&agrave;nh phố đ&atilde; ảnh hưởng lớn đến kiến tr&uacute;c tr&ecirc;n khu Phố cổ.</p>
<p>
	Trong khu Phố cổ, du kh&aacute;ch như được trở về những năm 50 &ndash; 60 với những nh&agrave; h&agrave;ng, qu&aacute;n c&agrave; ph&ecirc; v&agrave; c&ocirc;ng vi&ecirc;n được bố tr&iacute; theo phong c&aacute;ch cổ điển. Sẽ rất hợp với những bạn trẻ n&agrave;o muốn t&igrave;m kh&ocirc;ng gian y&ecirc;n tĩnh để cảm nhận cuộc sống.</p>
<p>
	Ngo&agrave;i ra, du kh&aacute;ch sẽ được thưởng thức những m&oacute;n ăn hải sản hấp dẫn với gi&aacute; mềm hơn rất nhiều so với c&aacute;c điểm du lịch kh&aacute;c của Trung Quốc, thực đơn thường gồm c&oacute; h&agrave;u nướng mỡ h&agrave;nh, bề bề rang muối, c&aacute; r&aacute;n gi&ograve;n&hellip;</p>
<p>
	Xung quanh quảng trường Vịnh Bắc Bộ l&agrave; khu trung t&acirc;m bu&ocirc;n b&aacute;n của th&agrave;nh phố, c&oacute; rất nhiều cửa h&agrave;ng, khu thương mại, kh&aacute;ch đ&ocirc;ng nườm nượp suốt đ&ecirc;m ng&agrave;y. Khu n&agrave;y c&oacute; chợ đ&ecirc;m Bắc Hải nổi tiếng, kh&ocirc;ng chỉ bu&ocirc;n b&aacute;n nhiều thứ h&agrave;ng, qu&agrave; lưu niệm lạ mắt, m&agrave; c&ograve;n c&oacute; hoạt động ca m&uacute;a tưng bừng.</p>
', 1, 9)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (85, N'Những cánh đồng hoa cải vàng ươm, rực rỡ ở Trung Quốc ', N'2017_05_31_23_31_41_3341-120753517.jpg', N' (Emdep.vn) - Những cánh đồng hoa cải vàng ươm, rực rỡ ở Trung Quốc sẽ khiến bạn như đang lạc vào chốn thiên đường. ', CAST(N'2017-05-31 00:00:00.000' AS DateTime), 1, N'<p>
	Mỗi độ xu&acirc;n về, kh&aacute;ch du lịch khắp nơi tr&ecirc;n thế giới lại &ugrave;n &ugrave;n k&eacute;o về Luoping, một huyện nhỏ thuộc tỉnh V&acirc;n Nam, Trung Quốc để được đắm m&igrave;nh trong sắc v&agrave;ng rực rỡ của những c&aacute;nh đồng hoa cải trải d&agrave;i bất tận.</p>
<h1>
	Biển hoa cải v&agrave;ng tuyệt đẹp ở Trung Quốc</h1>
<h2>
	Mỗi độ xu&acirc;n về, kh&aacute;ch du lịch khắp nơi tr&ecirc;n thế giới lại &ugrave;n &ugrave;n k&eacute;o về Luoping, một huyện nhỏ thuộc tỉnh V&acirc;n Nam, Trung Quốc để được đắm m&igrave;nh trong sắc v&agrave;ng rực rỡ của những c&aacute;nh đồng hoa cải trải d&agrave;i bất tận.</h2>
<table border="0" cellpadding="1" cellspacing="1">
	<tbody>
		<tr>
			<td>
				&nbsp;<img alt="Bien hoa cai vang tuyet dep o Trung Quoc hinh anh 1" border="0" src="http://img2.news.zing.vn/2012/10/11/1-30.jpg" /></td>
		</tr>
		<tr>
			<td>
				&nbsp;Những ngọn đồi thấp mấp m&ocirc; như những chiếc n&oacute;p &uacute;p giữa c&aacute;nh đồng hoa cải v&agrave;ng ươm, bất tận.</td>
		</tr>
	</tbody>
</table>
<p>
	Những c&aacute;nh đồng hoa cải dầu ở Luoping nở rộ v&agrave;o khoảng th&aacute;ng 2 k&eacute;o sang th&aacute;ng 3, mở ra cảnh tượng v&ocirc; c&ugrave;ng kỳ vĩ: một &ldquo;biển v&agrave;ng&rdquo; rực rỡ, trải d&agrave;i tới tận ch&acirc;n trời. Ch&iacute;nh v&agrave;o thời điểm đ&oacute;, Luoping cũng trở th&agrave;nh th&aacute;nh địa đối với nhiếp ảnh gia tr&ecirc;n to&agrave;n thế giới. Kh&aacute;ch du lịch từ khắp mọi nơi bắt đầu &ugrave;n &ugrave;n k&eacute;o về để chi&ecirc;m ngưỡng vẻ đẹp rực rỡ của c&aacute;nh đồng hoa cải rộng m&ecirc;nh m&ocirc;ng.</p>
<p>
	Tr&ecirc;n thực tế, c&aacute;c c&aacute;nh đồng hoa cải dầu quy m&ocirc; lớn c&oacute; mặt ở khắp Trung Quốc, nở rộ v&agrave;o những thời điểm kh&aacute;c nhau trong năm, t&ugrave;y thuộc v&agrave;o thời tiết v&agrave; nhiệt độ ở từng khu vực. Tuy nhi&ecirc;n, &ldquo;biển v&agrave;ng&rdquo; hoa cải ở Luoping được xem l&agrave; rộng lớn nhất, đẹp v&agrave; quyến rũ nhất với những ngọn đồi thấp mấp m&ocirc;, tựa như những chiếc n&oacute;n &uacute;p giữa &ldquo;biển v&agrave;ng&rdquo;.</p>
<p>
	Ngo&agrave;i ra, c&aacute;nh đồng hoa cải ở Luoping c&ograve;n l&agrave; &ldquo;thi&ecirc;n đường&rdquo; đối với c&aacute;c lo&agrave;i ong. M&ugrave;a xu&acirc;n, khi hoa cải nở rộ cũng l&agrave; m&ugrave;a nu&ocirc;i ong lấy mật của người d&acirc;n địa phương. H&agrave;ng loạt trang trại nu&ocirc;i ong ngắn hạn được dựng l&ecirc;n giữa c&aacute;nh đồng cải. Cho đến khi m&ugrave;a hoa kết th&uacute;c, những trang trại n&agrave;y mới được chuyển đến c&aacute;c địa điểm kh&aacute;c, nơi c&oacute; nhiều hoa dại, đủ cung cấp mật hoa nu&ocirc;i ong.</p>
<p>
	Ch&ugrave;m ảnh cực đẹp chụp những c&aacute;nh đồng hoa cải ở Luoping, Trung Quốc:</p>
<table border="0" cellpadding="1" cellspacing="1">
	<tbody>
		<tr>
			<td>
				&nbsp;<img alt="Bien hoa cai vang tuyet dep o Trung Quoc hinh anh 2" border="0" src="http://img2.news.zing.vn/2012/10/11/2-29.jpg" title="Biển hoa cải vàng tuyệt đẹp ở Trung Quốc hình ảnh 2" /></td>
		</tr>
		<tr>
			<td>
				&nbsp;C&aacute;nh đồng hoa cải dầu ở Luoping đẹp như một bức tranh.</td>
		</tr>
		<tr>
			<td>
				&nbsp;<img alt="Bien hoa cai vang tuyet dep o Trung Quoc hinh anh 3" border="0" src="http://img2.news.zing.vn/2012/10/11/4-19.jpg" title="Biển hoa cải vàng tuyệt đẹp ở Trung Quốc hình ảnh 3" /></td>
		</tr>
		<tr>
			<td>
				&nbsp;Hoa cải nở v&agrave;ng ươm, rực rỡ.</td>
		</tr>
		<tr>
			<td>
				&nbsp;<img alt="Bien hoa cai vang tuyet dep o Trung Quoc hinh anh 4" border="0" src="http://img2.news.zing.vn/2012/10/11/11-7.jpg" title="Biển hoa cải vàng tuyệt đẹp ở Trung Quốc hình ảnh 4" /></td>
		</tr>
		<tr>
			<td>
				Những c&aacute;nh đồng hoa cải dầu ở Luoping v&agrave;o thời điểm nở rộ nhất trở th&agrave;nh th&aacute;nh địa Mecca đối với d&acirc;n nhiếp ảnh.</td>
		</tr>
		<tr>
			<td>
				&nbsp;<img alt="Bien hoa cai vang tuyet dep o Trung Quoc hinh anh 5" border="0" src="http://img2.news.zing.vn/2012/10/11/7-10.jpg" title="Biển hoa cải vàng tuyệt đẹp ở Trung Quốc hình ảnh 5" /></td>
		</tr>
		<tr>
			<td>
				&nbsp;Hoa cải v&agrave;ng ươm trong sương&nbsp; sớm.</td>
		</tr>
		<tr>
			<td>
				&nbsp;<img alt="Bien hoa cai vang tuyet dep o Trung Quoc hinh anh 6" border="0" src="http://img2.news.zing.vn/2012/10/11/13-6.jpg" title="Biển hoa cải vàng tuyệt đẹp ở Trung Quốc hình ảnh 6" /></td>
		</tr>
		<tr>
			<td>
				&nbsp;C&aacute;nh đồng hoa cải dầu nh&igrave;n từ tr&ecirc;n cao tựa như c&aacute;nh đồng l&uacute;a ch&iacute;n.</td>
		</tr>
		<tr>
			<td>
				<img alt="Bien hoa cai vang tuyet dep o Trung Quoc hinh anh 7" border="0" src="http://img2.news.zing.vn/2012/10/11/16-3.jpg" title="Biển hoa cải vàng tuyệt đẹp ở Trung Quốc hình ảnh 7" /></td>
		</tr>
		<tr>
			<td>
				Hoa cải được trồng tr&ecirc;n c&aacute;c sườn đồi tương tự như ruộng bậc thang của c&aacute;c d&acirc;n tộc v&ugrave;ng cao ở Việt Nam.</td>
		</tr>
		<tr>
			<td>
				&nbsp;<img alt="Bien hoa cai vang tuyet dep o Trung Quoc hinh anh 8" border="0" src="http://img2.news.zing.vn/2012/10/11/14-14.jpg" title="Biển hoa cải vàng tuyệt đẹp ở Trung Quốc hình ảnh 8" /></td>
		</tr>
		<tr>
			<td>
				&nbsp;<img alt="Bien hoa cai vang tuyet dep o Trung Quoc hinh anh 9" border="0" src="http://img2.news.zing.vn/2012/10/11/6-12.jpg" title="Biển hoa cải vàng tuyệt đẹp ở Trung Quốc hình ảnh 9" /></td>
		</tr>
		<tr>
			<td>
				&nbsp;<img alt="Bien hoa cai vang tuyet dep o Trung Quoc hinh anh 10" border="0" src="http://img2.news.zing.vn/2012/10/11/17-3.jpg" /></td>
		</tr>
		<tr>
			<td>
				&nbsp;<img alt="Bien hoa cai vang tuyet dep o Trung Quoc hinh anh 11" border="0" src="http://img2.news.zing.vn/2012/10/11/9-10.jpg" title="Biển hoa cải vàng tuyệt đẹp ở Trung Quốc hình ảnh 11" /></td>
		</tr>
		<tr>
			<td>
				&nbsp;<img alt="Bien hoa cai vang tuyet dep o Trung Quoc hinh anh 12" border="0" src="http://img2.news.zing.vn/2012/10/11/3-18.jpg" title="Biển hoa cải vàng tuyệt đẹp ở Trung Quốc hình ảnh 12" /></td>
		</tr>
		<tr>
			<td>
				&nbsp;<img alt="Bien hoa cai vang tuyet dep o Trung Quoc hinh anh 13" border="0" src="http://img2.news.zing.vn/2012/10/11/8-10.jpg" title="Biển hoa cải vàng tuyệt đẹp ở Trung Quốc hình ảnh 13" /></td>
		</tr>
		<tr>
			<td>
				&nbsp;<img alt="Bien hoa cai vang tuyet dep o Trung Quoc hinh anh 14" border="0" src="http://img2.news.zing.vn/2012/10/11/10-8.jpg" title="Biển hoa cải vàng tuyệt đẹp ở Trung Quốc hình ảnh 14" /></td>
		</tr>
		<tr>
			<td>
				&nbsp;<img alt="Bien hoa cai vang tuyet dep o Trung Quoc hinh anh 15" border="0" src="http://img2.news.zing.vn/2012/10/11/12-6.jpg" /></td>
		</tr>
		<tr>
			<td>
				&nbsp;<img alt="Bien hoa cai vang tuyet dep o Trung Quoc hinh anh 16" border="0" src="http://img2.news.zing.vn/2012/10/11/18-3.jpg" /></td>
		</tr>
		<tr>
			<td>
				&nbsp;<img alt="Bien hoa cai vang tuyet dep o Trung Quoc hinh anh 17" border="0" src="http://img2.news.zing.vn/2012/10/11/20-2.jpg" /></td>
		</tr>
	</tbody>
</table>
<p>
	&nbsp;</p>
', 1, 9)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (86, N'Muốn con thông minh, bố mẹ không biết 8 cách rèn luyện này tiếc nuối cả một đời', N'2017_05_31_23_33_25_282nang-cao-tri-luc-1-093630043.jpg', N' (Emdep.vn) - Tình hình phát triển trí lực của trẻ sẽ ảnh hưởng không nhỏ đến khả năng học tập, làm việc và tương tác với xã hội sau này. Nắm bắt 8 phương pháp sau đây sẽ không quá khó để bạn rèn luyệ', CAST(N'2017-05-31 00:00:00.000' AS DateTime), 1, N'<p class="body-text">
	<strong>Muốn con th&ocirc;ng minh vượt trội, h&atilde;y dạy con c&agrave;ng sớm c&agrave;ng tốt</strong></p>
<p class="body-text">
	Rất nhiều phụ huynh c&oacute; suy nghĩ rằng, con c&ograve;n b&eacute; lắm, h&atilde;y cứ để con th&iacute;ch l&agrave;m g&igrave; th&igrave; l&agrave;m, lớn rồi từ từ uốn nắn. Nhưng đ&acirc;y l&agrave; suy nghĩ v&ocirc; c&ugrave;ng sai lầm. Bởi từ 0 đến 6 tuổi l&agrave; giai đoạn ph&aacute;t triển tr&iacute; n&atilde;o quan trọng nhất. Đặc biệt l&agrave; từ 2 đến 4 tuổi, n&atilde;o bộ c&oacute; sự ph&aacute;t triển v&ocirc; c&ugrave;ng nhanh ch&oacute;ng. Nếu l&agrave;m tốt trong giai đoạn n&agrave;y, con bạn sẽ th&ocirc;ng minh vượt trội. Thực tế, sự th&ocirc;ng minh của trẻ một phần do di truyền, nhưng sự r&egrave;n luyện mới l&agrave; yếu tố quyết định tr&iacute; th&ocirc;ng minh ấy c&oacute; ph&aacute;t triển hay kh&ocirc;ng. Để con ng&agrave;y c&agrave;ng th&ocirc;ng minh v&agrave; lanh lợi hơn, bố mẹ đừng qu&ecirc;n l&agrave;m những điều dưới đ&acirc;y.</p>
<p class="body-text">
	<strong>1. Để trẻ vận động v&agrave; đi bộ thật nhiều</strong></p>
<p class="body-text">
	Năng lượng b&ecirc;n trong của trẻ sẽ ph&aacute;t huy ho&agrave;n hảo khi c&aacute;c gi&aacute;c quan, kỹ năng vận động v&agrave; ng&ocirc;n ngữ được k&iacute;ch hoạt ngay sau sinh. Từ một tuổi trẻ cần đi bộ với qu&atilde;ng đường d&agrave;i nhất c&oacute; thể. Bế ẵm, &ocirc;m ấp hay để con ngồi xe đẩy, &ocirc; t&ocirc; cả ng&agrave;y sẽ l&agrave;m mất khả năng di chuyển.</p>
<p class="body-text">
	Sự hoạt động của cơ thể sẽ k&iacute;ch th&iacute;ch n&atilde;o bộ c&agrave;ng ph&aacute;t triển nhanh hơn, tăng phản xạ của n&atilde;o bộ, nhờ đ&oacute; m&agrave; trẻ th&ocirc;ng minh vượt trội. Nếu trẻ bị k&igrave;m h&atilde;m khả năng cũng như kh&ocirc;ng gian vận động, th&igrave; n&atilde;o bộ cũng lu&ocirc;n ở trạng th&aacute;i &ldquo;tĩnh&rdquo;, &iacute;t phải tư duy, dần dần trẻ trở n&ecirc;n thụ động, kh&ocirc;ng nhanh nhạy trong phản xạ v&agrave; k&eacute;m th&ocirc;ng minh.</p>
<p class="body-text">
	Khi b&eacute; từ 2 tuổi trở l&ecirc;n, bạn n&ecirc;n để con đi tr&ecirc;n những con đường gồ ghề một ch&uacute;t hoặc tập l&ecirc;n xuống cầu thang&hellip; Bạn c&oacute; thể đứng ở xa n&eacute;m b&oacute;ng v&agrave; để con tự bắt. Đầu ti&ecirc;n, b&eacute; sẽ chạy theo quả b&oacute;ng, sau đ&oacute; ch&uacute;ng sẽ học được c&aacute;ch quan s&aacute;t mục ti&ecirc;u v&agrave; t&igrave;m ra con đường ngắn nhất đến đ&oacute;.</p>
<p class="body-text">
	<strong>2. 2 tuổi l&agrave; thời điểm v&agrave;ng để ph&aacute;t triển ng&ocirc;n ngữ</strong></p>
<p class="body-image">
	<a class="photo" data-index="0" href="http://baomoi-photo-2-td.zadn.vn/16/05/21/283/19426975/1_187199.jpg"><img alt="8 dieu phai lam de day con thong minh vuot troi - Anh 1" src="http://baomoi-photo-2-td.zadn.vn/w460x/16/05/21/283/19426975/1_187199.jpg" title="8 điều phải làm để dạy con thông minh vượt trội - Ảnh 1" /></a></p>
<p class="body-text">
	Từ khoảng 1 tuổi bạn sẽ bắt đầu thấy con bi b&ocirc; tập n&oacute;i. Đến giai đoạn 2 tuổi ch&iacute;nh l&agrave; thời điểm v&agrave;ng để ph&aacute;t triển ng&ocirc;n ngữ của trẻ. Giai đoạn n&agrave;y kh&ocirc;ng d&agrave;i, chỉ k&eacute;o d&agrave;i từ khi 2 tuổi đến 2 tuổi rưỡi. Nếu bạn bỏ qua thời điểm n&agrave;y sẽ rất đ&aacute;ng tiếc. Trong khoảng thời gian v&agrave;ng n&agrave;y, bạn h&atilde;y uốn nắn con n&oacute;i với giọng chuẩn. Điều n&agrave;y gi&uacute;p con bạn tr&aacute;nh được t&igrave;nh trạng n&oacute;i ngọng hay n&oacute;i lắp.</p>
<p class="body-text">
	Ngo&agrave;i ra c&aacute;c tr&ograve; chơi ng&ocirc;n ngữ n&ecirc;n được khuyến kh&iacute;ch. C&oacute; rất nhiều c&aacute;ch để chơi. V&iacute; dụ: hỏi ch&uacute;ng &ldquo;Bi c&oacute; biết trong ph&ograve;ng tắm c&oacute; đồ g&igrave; m&agrave;u đỏ kh&ocirc;ng?&rdquo;, hay hỏi con t&ecirc;n của những đồ vật c&oacute; m&agrave;u đỏ trong nh&agrave; m&agrave; ch&uacute;ng biết.</p>
<p class="body-text">
	Khoa học cho thấy, sự ph&aacute;t triển về ng&ocirc;n ngữ đi liền với sự ph&aacute;t triển của tr&iacute; tuệ. Bởi khi ghi nhớ ng&ocirc;n ngữ, n&atilde;o bộ phải hoạt động v&agrave; tư duy, nhờ đ&oacute; m&agrave; c&agrave;ng k&iacute;ch th&iacute;ch trẻ th&ocirc;ng minh vượt trội.</p>
<p class="body-text">
	<strong>3. Dạy con đọc s&aacute;ch</strong></p>
<p class="body-text">
	C&oacute; rất nhiều phụ huynh cho rằng, con chưa biết chữ th&igrave; sao c&oacute; thể dạy đọc s&aacute;ch? Nhưng thực tế l&agrave; bạn c&oacute; thể dạy con đọc s&aacute;ng ngay từ 1 đến 2 tuổi bằng những cuốn s&aacute;ch c&oacute; h&igrave;nh ảnh. H&atilde;y chọn mua s&aacute;ch thật th&ocirc;ng minh, với những bức tranh vẽ m&agrave;u sắc v&agrave; thu h&uacute;t. Ban đầu trẻ sẽ chỉ coi đ&oacute; l&agrave; một tr&ograve; chơi, nhưng khi quen dần với s&aacute;ch, bạn h&atilde;y đọc cho con nội dung b&ecirc;n trong. Điều n&agrave;y rất quan trọng, bởi n&oacute; gi&uacute;p trẻ l&agrave;m quen với s&aacute;ch từ rất sớm, coi việc đọc s&aacute;ch như một tr&ograve; chơi v&agrave; kh&ocirc;ng hề bị &aacute;p lực. Trẻ được tiếp x&uacute;c với s&aacute;ch c&agrave;ng sớm th&igrave; c&agrave;ng th&ocirc;ng minh vượt trội. Kh&ocirc;ng c&oacute; một loại đồ chơi n&agrave;o hữu &iacute;ch v&agrave; gi&uacute;p con th&ocirc;ng minh như s&aacute;ch.</p>
<p class="body-text">
	<strong>4.</strong> <strong>Dạy con về mối quan hệ nguy&ecirc;n nh&acirc;n &ndash; kết quả</strong></p>
<p class="body-text">
	Rất đơn giản th&ocirc;i, v&iacute; dụ, tay con sẽ bị bỏng khi sờ v&agrave;o bếp lửa khi đ&oacute; h&atilde;y n&oacute;i với ch&uacute;ng &ldquo;Đừng sờ v&agrave;o bếp nh&eacute;, v&igrave; con sẽ bị bỏng đ&oacute;&rdquo;.</p>
<p class="body-text">
	Nhiều b&agrave; mẹ thường n&oacute;i với con &ldquo;Bếp lửa thật xấu t&iacute;nh, l&agrave;m Bi bị bỏng&rdquo;, hoặc khi con bị kẹt tay v&agrave;o c&aacute;nh cửa, c&aacute;c mẹ lại dỗ d&agrave;nh &ldquo;C&aacute;nh cửa hư qu&aacute;, để mẹ phạt bạn ấy&rdquo;. L&agrave;m như vậy khiến trẻ kh&ocirc;ng nhận biết được mối quan hệ nh&acirc;n &ndash; quả, do đ&oacute; ch&uacute;ng sẽ kh&ocirc;ng hiểu bản chất sự việc. Điều n&agrave;y tưởng như v&ocirc; hại, nhưng thực tế, nếu ngay từ b&eacute; trẻ đ&atilde; hiểu mọi thứ một c&aacute;ch kh&ocirc;ng đ&uacute;ng bản chất th&igrave; sẽ h&igrave;nh th&agrave;nh lối tư duy chỉ nh&igrave;n b&ecirc;n ngo&agrave;i, m&agrave; kh&ocirc;ng cần hiểu s&acirc;u cốt l&otilde;i. N&oacute; kh&ocirc;ng tốt ch&uacute;t n&agrave;o cho tr&iacute; tuệ của trẻ. Nếu muốn con th&ocirc;ng minh vượt trội, h&atilde;y dạy con hiểu về quan hệ nguy&ecirc;n nh&acirc;n v&agrave; kết quả.</p>
<p class="body-text">
	<strong>5. H&atilde;y để con tự lập trong khả năng c&oacute; thể</strong></p>
<p class="body-text">
	Tự rửa tay, thắt d&acirc;y gi&agrave;y, c&agrave;i c&uacute;c &aacute;o&hellip; H&atilde;y để con thực h&agrave;nh những kỹ năng n&agrave;y mặc d&ugrave; ban đầu sẽ rất kh&oacute; khăn v&agrave; đ&ograve;i hỏi sự ki&ecirc;n nhẫn. Nhưng c&agrave;ng d&agrave;nh nhiều thời gian dạy con từ b&acirc;y giờ bạn c&agrave;ng nh&agrave;n về sau. Sự tự lập trong cuộc sống gi&uacute;p trẻ kh&aacute;m ph&aacute; v&agrave; nhanh nhẹn hơn rất nhiều. Rồi bạn sẽ bất ngờ khi thấy rằng, con c&oacute; thể l&agrave;m được rất nhiều điều m&agrave; bạn chưa bao giờ tưởng tượng thấy. Đừng qu&ecirc;n khen ngợi khi con l&agrave;m được một điều g&igrave; đ&oacute; nh&eacute;.</p>
<p class="body-text">
	<strong>6. Lu&ocirc;n khuyến kh&iacute;ch d&ugrave; con l&agrave;m chưa tốt</strong></p>
<p class="body-text">
	Kể cả khi con l&agrave;m chưa tốt, vẫn n&ecirc;n c&oacute; sự khuyến kh&iacute;ch. Sự cổ vũ của bố mẹ sẽ gi&uacute;p con thấy tự tin thể hiện bản th&acirc;n hơn rất nhiều, nhờ đ&oacute; m&agrave; trẻ th&ocirc;ng minh vượt trội. Nếu bạn cứ hở ra l&agrave; ch&ecirc; bai, hay nhắc đi nhắc lại những thiếu x&oacute;t của con sẽ khiến b&eacute; tự ti, kh&ocirc;ng d&aacute;m l&agrave;m bất cứ điều g&igrave;.</p>
<p class="body-text">
	<strong>7. H&atilde;y nhớ dạy con về sự ngăn nắp</strong></p>
<p class="body-text">
	Từ 2 đến 3 tuổi, trẻ bắt đầu h&igrave;nh th&agrave;nh c&aacute;c th&oacute;i quen, nề nếp của cuộc sống. Giai đoạn n&agrave;y, nếu bạn kh&ocirc;ng bắt đầu dạy con về sự ngăn nắp, th&igrave; chắc chắn lớn l&ecirc;n con bạn sẽ rất lộn xộn. H&atilde;y lu&ocirc;n dạy con sắp xếp mọi thứ gọn g&agrave;ng, đồ chơi d&ugrave;ng xong phải đặt đ&uacute;ng vị tr&iacute;. Bạn cũng c&oacute; thể dạy con qua tr&ograve; chơi thứ tự &ldquo;Đặt quả b&oacute;ng l&ecirc;n kệ, để b&uacute;p b&ecirc; l&ecirc;n b&agrave;n cho mẹ&rdquo;. Như thế, ch&uacute;ng sẽ biết c&aacute;ch cất đồ đ&uacute;ng chỗ. Điều quan trọng l&agrave;, bố mẹ phải l&agrave;m gương cho con của m&igrave;nh. Bởi trẻ thường học theo v&agrave; bắt chước mọi thứ bố mẹ l&agrave;m. Sự gọn g&agrave;ng trong cuộc sống, cũng gi&uacute;p h&igrave;nh th&agrave;nh sự ngăn nắp v&agrave; logic trong tư duy, để con th&ocirc;ng minh vượt trội.</p>
<p class="body-text">
	<strong>8. Trẻ 2 tuổi c&oacute; tr&iacute; nhớ thi&ecirc;n t&agrave;i</strong></p>
<p class="body-text">
	Trẻ ph&aacute;t triển ch&oacute;ng mặt ở giai đoạn 2-3 tuổi. Những g&igrave; ch&uacute;ng học được l&uacute;c đ&oacute; phản &aacute;nh th&aacute;i độ học tập sau n&agrave;y, v&agrave; đ&acirc;y l&agrave; điều kh&ocirc;ng thể thay đổi. Giai đoạn 2 tuổi, nếu được dạy tốt những điều cơ bản, trẻ sẽ rất nổi bật v&agrave; th&ocirc;ng minh vượt trộ. Nhưng nếu thiếu sự hướng dẫn hay chỉ để con chơi ch&uacute;ng sẽ đ&aacute;nh mất tiềm năng tự nhi&ecirc;n m&agrave; bạn kh&ocirc;ng nhận ra</p>
<p class="body-text">
	V&igrave; thế ở tuổi l&ecirc;n 2, bạn cần gi&uacute;p con ph&aacute;t triển tr&iacute; nhớ nhiều nhất c&oacute; thể. V&iacute; dụ như: học cờ của c&aacute;c nước, c&aacute;c loại xe &ocirc; t&ocirc;, t&ecirc;n c&aacute;c điểm dừng xe bus theo tuyến&hellip; Ch&uacute;ng rất hữu &iacute;ch cho việc ph&aacute;t triển năng lực của con. Đừng bao giờ bỏ qua c&aacute;c giai đoạn v&agrave;ng trong sự ph&aacute;t triển của con. Nếu kh&ocirc;ng bạn sẽ v&ocirc; c&ugrave;ng tiếc nuối về sau n&agrave;y đấy.</p>
', 1, 12)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (87, N'Có những dấu hiệu này, con của bạn đã có sẵn thông minh khỏi lo quá nhiều', N'2017_05_31_23_34_40_200thong-4-151138762.jpg', N'Con của bạn có khả năng tò mò đặc biệt, chúng có thể khiến người khác khó chịu vì hỏi quá nhiều.?', CAST(N'2017-05-31 00:00:00.000' AS DateTime), 1, N'<p>
	Ch&uacute;ng ta hay n&oacute;i về những trẻ em học chậm hoặc c&oacute; vấn đề về học tập nhưng hiếm khi n&oacute;i về những đứa trẻ c&oacute; tr&iacute; th&ocirc;ng minh v&agrave; khả năng nhận thức hơn người. C&oacute; lẽ bởi v&igrave; những khả năng n&agrave;y kh&ocirc;ng xuất hiện ở nhiều đứa trẻ. Thậm ch&iacute; một số trẻ c&oacute; tr&iacute; th&ocirc;ng minh cao hơn c&oacute; thể bị coi l&agrave; c&oacute; vấn đề v&igrave; ch&uacute;ng thể hiện một số đặc điểm sau, theo liệt k&ecirc; của&nbsp;FamilyShare:&nbsp;</p>
<p>
	&nbsp;1. Nhanh ch&aacute;n học&nbsp;</p>
<p>
	Gi&aacute;o vi&ecirc;n c&oacute; thể nghĩ rằng trẻ bị ph&acirc;n t&acirc;m v&agrave; kh&ocirc;ng ch&uacute; &yacute; đến b&agrave;i giảng. Tuy nhi&ecirc;n, c&oacute; thể sự thực l&agrave; trẻ đ&atilde; biết hoặc hiểu mọi thứ ngay lần đầu được giảng giải. Trẻ c&oacute; thể ho&agrave;n th&agrave;nh c&ocirc;ng việc của m&igrave;nh trước người kh&aacute;c v&agrave; cần nhiều c&ocirc;ng việc hơn trẻ kh&aacute;c để lu&ocirc;n bận rộn.&nbsp;</p>
<p>
	&nbsp;2. Học rất dễ d&agrave;ng&nbsp;</p>
<p>
	Trẻ c&oacute; năng khiếu c&oacute; thể hiểu mọi thứ một c&aacute;ch nhanh ch&oacute;ng v&agrave; dễ d&agrave;ng - kh&ocirc;ng cần phải tr&igrave;nh b&agrave;y bằng v&iacute; dụ hoặc giải th&iacute;ch nhiều lần. Ch&uacute;ng th&iacute;ch học, th&iacute;ch xem hướng dẫn tr&ecirc;n internet, đọc nhiều hơn những đứa trẻ b&igrave;nh thường v&agrave; viết về những suy nghĩ của m&igrave;nh. Một số trẻ c&oacute; thể bị coi l&agrave; tự thu v&agrave;o vỏ ốc của bản th&acirc;n v&igrave; kh&ocirc;ng chơi đ&ugrave;a với bạn b&egrave;, nhưng c&oacute; thể v&igrave; ch&uacute;ng th&iacute;ch c&aacute;c hoạt động học tập chứ kh&ocirc;ng phải l&agrave; hoạt động vui chơi.&nbsp;</p>
<p>
	3. C&oacute; vốn từ vựng rất rộng&nbsp;</p>
<p>
	Đứa trẻ c&oacute; thể n&oacute;i những từ v&agrave; c&acirc;u m&agrave; bạn chưa bao giờ nghe, thảo luận về c&aacute;c chủ đề m&agrave; bạn kh&ocirc;ng nghĩ một đứa trẻ biết. Người lớn c&oacute; thể cảm thấy bị th&aacute;ch thức bởi họ kh&ocirc;ng quen với việc n&oacute;i chuyện với những đứa trẻ c&oacute; thể nghĩ v&agrave; thể hiện những &yacute; tưởng như thế. Trẻ c&oacute; năng khiếu thậm ch&iacute; c&oacute; thể ph&aacute;t minh ra ng&ocirc;n ngữ phức tạp của m&igrave;nh thay v&igrave; chỉ n&oacute;i tiếng mẹ đẻ.</p>
<p>
	4. C&oacute; những quy định v&agrave; kỷ luật ri&ecirc;ng&nbsp;</p>
<p>
	Đồ chơi v&agrave; s&aacute;ch vở lu&ocirc;n được ch&uacute;ng giữ g&igrave;n ngăn nắp.&nbsp; Đứa trẻ thi&ecirc;n t&agrave;i giống một chuy&ecirc;n gia khi n&oacute;i đến những g&igrave; m&agrave; ch&uacute;ng say m&ecirc; v&agrave; ch&uacute;ng c&oacute; xu hướng giữ những thứ n&agrave;y theo một quy tắc ri&ecirc;ng. Ch&uacute;ng c&oacute; thể đọc v&agrave; n&oacute;i h&agrave;ng giờ về những thứ m&igrave;nh đam m&ecirc;. Mặc d&ugrave; chỉ n&oacute;i về chiến tranh giữa c&aacute;c v&igrave; sao nhưng ch&uacute;ng sẽ khiến bạn kinh ngạc với những hiểu biết về c&aacute;c h&agrave;nh tinh trong vũ trụ.&nbsp;</p>
<p>
	5. T&ograve; m&ograve; v&agrave; hỏi nhiều c&acirc;u hỏi&nbsp;</p>
<p>
	Con của bạn c&oacute; khả năng t&ograve; m&ograve; đặc biệt, ch&uacute;ng c&oacute; thể khiến người kh&aacute;c kh&oacute; chịu v&igrave; hỏi qu&aacute; nhiều. Gi&aacute;o vi&ecirc;n truyền thống sẽ chỉ nh&igrave;n thấy một đứa trẻ kh&ocirc;ng thể tập trung v&agrave;o những g&igrave; đang được giảng dạy ở thời điểm đ&oacute;, nhưng nếu bạn ch&uacute; &yacute; bạn sẽ thấy c&acirc;u hỏi của b&eacute; tiết lộ t&agrave;i năng thi&ecirc;n bẩm của b&eacute;.&nbsp;</p>
<p>
	6. C&oacute; sự tập trung đ&aacute;ng kinh ngạc&nbsp;</p>
<p>
	Mọi thứ xung quanh trẻ dường như biến mất khi ch&uacute;ng tập trung v&agrave;o một thứ g&igrave; mới, bất cứ c&aacute;i g&igrave; cũng c&oacute; thể khiến ch&uacute;ng quan t&acirc;m v&agrave; tập trung mọi ch&uacute; &yacute; v&agrave;o. Đ&oacute; c&oacute; thể l&agrave; cuốn truyện hoặc một chủ đề rộng lớn như đại dương. Kể cả trong bữa ăn, giờ học, l&uacute;c chơi hay đi ngủ trẻ cũng nghĩ về những thứ n&agrave;y.&nbsp;</p>
<p>
	Nếu con bạn c&oacute; những đặc điểm n&agrave;y, b&eacute; c&oacute; thể l&agrave; một thi&ecirc;n t&agrave;i. Bạn c&oacute; thể thảo luận với c&ocirc; gi&aacute;o v&agrave; nh&agrave; trường để con nhận được sự gi&aacute;o dục ph&ugrave; hợp. Giống như bất kỳ đứa trẻ n&agrave;o, trẻ c&oacute; những đặc điểm n&agrave;y cần được giữ cho bận rộn v&agrave; kiểm tra tr&iacute; tuệ thường xuy&ecirc;n. Nếu bạn v&agrave; thầy c&ocirc; gi&aacute;o sớm nhận ra t&agrave;i năng của con, n&ecirc;n tập trung ph&aacute;t triển để mang lại lợi &iacute;ch cho con v&agrave; những người xung quanh.</p>
', 1, 12)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (88, N'Bố mẹ cứ nhớ 7 điều này, con bạn có cơ hội trở nên thông minh từ khi mới lọt lòng', N'2017_05_31_23_35_42_276201703091043392165447-thang-tuoi-tre-bi-221215419.jpg', N'Trẻ học được rất nhiều khi chơi trò chơi. Ngoài ra, chơi cũng là một cách vận động thể chất, đóng góp vào sự phát triển não bộ của trẻ.', CAST(N'2017-05-31 00:00:00.000' AS DateTime), 2, N'<p>
	N&atilde;o trẻ ph&aacute;t triển mạnh trong những năm đầu đời. Mỗi khoảnh khắc tr&ocirc;i đi, em b&eacute; chắc chắn sẽ học hỏi được một điều g&igrave; đ&oacute;.</p>
<p>
	<img alt="" src="https://image.rewardme.in/Assets/Modules/Editorial/Article/Images/baby-clothes-baby-friendly-with-these-10-washing-tips-2-size-3.jpg" style="width: 590px; height: 393px;" /></p>
<p>
	1. Dỗ d&agrave;nh khi trẻ kh&oacute;c</p>
<p>
	Khi bạn nghe thấy tiếng kh&oacute;c của con, h&atilde;y t&igrave;m hiểu nguy&ecirc;n nh&acirc;n v&agrave; thỏa m&atilde;n nhu cầu của b&eacute;. Mẹ trấn an v&agrave; l&agrave;m cho b&eacute; cảm thấy y&ecirc;n t&acirc;m, an to&agrave;n sẽ tạo ra một t&aacute;c động t&iacute;ch cực đến n&atilde;o của trẻ. C&aacute;c hoạt động vui đ&ugrave;a, &acirc;u yếm, nu&ocirc;i dưỡng v&agrave; c&aacute;c h&agrave;nh động thể hiện t&igrave;nh y&ecirc;u kh&aacute;c gi&uacute;p cung cấp c&aacute;c t&iacute;n hiệu an to&agrave;n cần thiết để th&uacute;c đẩy sự ph&aacute;t triển n&atilde;o bộ của trẻ sơ sinh.</p>
<p>
	2. Để con tập b&ograve;</p>
<p>
	H&atilde;y để con bạn tập b&ograve; v&agrave; b&ograve; khắp nh&agrave;. Khi b&eacute; b&ograve; v&agrave; kh&aacute;m ph&aacute; thế giới xung quanh, n&atilde;o của trẻ đang &ldquo;tự vẽ&rdquo; n&ecirc;n bản đồ trong nh&agrave; v&agrave; tự t&igrave;m ra c&aacute;c kh&ocirc;ng gian, đồ vật v&agrave; vị tr&iacute; để đồ vật. Việc định vị xem m&igrave;nh đang ở đ&acirc;u v&agrave; x&aacute;c định vị tr&iacute; của đồ vật rất tốt cho sự ph&aacute;t triển tr&iacute; n&atilde;o của trẻ trong những năm th&aacute;ng đầu đời. &nbsp;</p>
<p>
	&nbsp;</p>
<p>
	3. Massage cho b&eacute;</p>
<p>
	Mẹ h&atilde;y thường xuy&ecirc;n massage cho b&eacute;. Massage gi&uacute;p b&eacute; giảm c&aacute;u gắt, căng thẳng v&agrave; l&agrave;m cho trẻ lu&ocirc;n cảm thấy an to&agrave;n. Massage cũng gi&uacute;p b&eacute; cảm nhận được t&igrave;nh y&ecirc;u thương từ đ&oacute; k&iacute;ch th&iacute;ch sự ph&aacute;t triển của n&atilde;o bộ. &nbsp;</p>
<p>
	4.Quan t&acirc;m đến con</p>
<p>
	Khi bạn quan t&acirc;m đ&uacute;ng mức v&agrave; l&agrave;m cho em b&eacute; cảm thấy ổn, n&atilde;o bộ của b&eacute; sẽ ph&aacute;t triển rất nhanh v&agrave; b&eacute; sẽ cố gắng kh&aacute;m ph&aacute;, giải m&atilde; thế giới xung quanh một c&aacute;ch t&iacute;ch cực.</p>
<p>
	&nbsp;</p>
<p>
	5. Cho trẻ chơi nhiều tr&ograve; chơi</p>
<p>
	Trẻ học được rất nhiều khi chơi tr&ograve; chơi. Ngo&agrave;i ra, chơi cũng l&agrave; một c&aacute;ch vận động thể chất, đ&oacute;ng g&oacute;p v&agrave;o sự ph&aacute;t triển n&atilde;o bộ của trẻ.</p>
<p>
	6. L&agrave;m những c&ocirc;ng việc nhỏ c&ugrave;ng con</p>
<p>
	Mẹ hướng dẫn con v&agrave; c&ugrave;ng con l&agrave;m c&aacute;c c&ocirc;ng việc nhỏ sẽ khiến n&atilde;o bộ của trẻ nhận ra rằng c&ocirc;ng việc con đang được l&agrave;m l&agrave; một nhiệm vụ rất quan trọng. Nhờ đ&oacute; trẻ sẽ c&agrave;ng ham th&iacute;ch v&agrave; mong muốn được l&agrave;m c&aacute;c c&ocirc;ng việc nhiều hơn.</p>
<p>
	7. Khen ngợi trẻ</p>
<p>
	Khi b&eacute; bắt đầu hiểu được những điều bạn n&oacute;i, h&atilde;y khen ngợi con khi l&agrave;m được việc n&agrave;o đ&oacute;. Khi mẹ khen ngợi, n&atilde;o bộ của con sẽ ghi lại h&igrave;nh ảnh bản th&acirc;n một c&aacute;ch t&iacute;ch cực. Ngo&agrave;i ra, mẹ n&ecirc;n dạy những từ mới h&agrave;ng ng&agrave;y để gi&uacute;p n&atilde;o bộ của trẻ lu&ocirc;n hoạt động.</p>
', 1, 12)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (89, N'Trước khi mang thai, bà bầu nào cũng phải chú ý các mũi tiêm quan trọng này', N'2017_05_31_23_36_44_173tiem-1-121808706.jpg', N' (Emdep.vn) - Cách tốt nhất để phụ nữ mang bầu được bảo vệ khỏi nguy cơ mắc bệnh là tiêm phòng những vắc-xin quan trọng dưới đây: ', CAST(N'2017-05-31 00:00:00.000' AS DateTime), 0, N'<p>
	1. Rubella</p>
<p>
	90% trường hợp người mẹ nhiễm rubella trong 3 th&aacute;ng đầu thai kỳ c&oacute; thể g&acirc;y dị tật thai nhi hoặc sảy thai. Virus n&agrave;y ảnh hưởng đến n&atilde;o, tim, tai v&agrave; mắt của em b&eacute; trong bụng, thậm ch&iacute; c&oacute; thể để lại di chứng khi trẻ ch&agrave;o đời.</p>
<p>
	2. Sởi</p>
<p>
	Nếu b&agrave; mẹ mắc bệnh sởi khi mang thai, nguy cơ dị dạng thai nhi rất cao. Ngo&agrave;i ra, phụ nữ bị sởi khi mang thai c&oacute; thể g&acirc;y sảy thai, sinh non hoặc thai chết lưu.</p>
<p>
	<img alt="Truoc khi mang thai, ba bau nao cung phai chu y cac mui tiem quan trong nay - Anh 1" src="http://img.tinhot.biz/auto/490/baomoi-photo-2-td.zadn.vn/17/02/25/265/21627124/1_40825.jpg" title="Trước khi mang thai, bà bầu nào cũng phải chú ý các mũi tiêm quan trọng này - Ảnh 1" /></p>
<p>
	3. Quai bị</p>
<p>
	Virus quai bị c&oacute; thể l&agrave;m vi&ecirc;m nhiễm buồng trứng, đồng thời ph&aacute; hủy tế b&agrave;o trứng, l&agrave;m ảnh hưởng nghi&ecirc;m trọng đến sức khỏe sinh sản của phụ nữ. Ngo&agrave;i ra, quai bị c&oacute; thể g&acirc;y dị tật bẩm sinh, sinh non v&agrave; thai chết lưu. Đặc biệt, nguy cơ c&agrave;ng cao hơn nếu mẹ bầu bị nhiễm quai bị trong 3 th&aacute;ng đầu thai kỳ.</p>
<p>
	Hiện nay, c&oacute; loại văcxin 3 trong 1 (sởi - quai bị - rubella), mẹ c&oacute; thể chỉ cần ch&iacute;ch ngừa 1 mũi c&oacute; thể ph&ograve;ng ngừa cả 3 bệnh n&agrave;y.</p>
<p>
	4. Thủy đậu</p>
<p>
	Nếu đ&atilde; ti&ecirc;m ph&ograve;ng thủy đậu khi c&ograve;n nhỏ, bạn n&ecirc;n ti&ecirc;m th&ecirc;m một mũi tăng cường.</p>
<p>
	5. C&uacute;m</p>
<p>
	Đ&acirc;y l&agrave; căn bệnh thường gặp nhất ở Việt Nam. Cảm c&uacute;m th&ocirc;ng thường sẽ kh&ocirc;ng g&acirc;y ra những biến chứng g&igrave; đặc biệt. Song khi mang thai, những cơn cảm c&uacute;m k&eacute;o d&agrave;i c&oacute; thể g&acirc;y dị tật bẩm sinh cho thai nhi, nhất l&agrave; mẹ mắc bệnh trong 3 th&aacute;ng đầu thai kỳ.</p>
<p>
	Ngo&agrave;i ra, nếu cẩn thận, mẹ cũng cần ti&ecirc;m ph&ograve;ng những vắc-xin dưới đ&acirc;y để đảm bảo an to&agrave;n nhất trong việc sinh nở:</p>
<p>
	1. Vi&ecirc;m gan si&ecirc;u vi B</p>
<p>
	Virus n&agrave;y c&oacute; thể l&acirc;y truyền th&ocirc;ng qua m&aacute;u v&agrave; dịch cơ thể. V&igrave; vậy, chị em c&oacute; thể dễ d&agrave;ng mắc bệnh n&agrave;y m&agrave; kh&ocirc;ng hề hay biết. Kh&ocirc;ng chỉ họ m&agrave; người chồng cũng n&ecirc;n ti&ecirc;m ph&ograve;ng vi&ecirc;m gan si&ecirc;u vi B. Văcxin n&agrave;y gồm 3 mũi, ti&ecirc;m trong v&ograve;ng 4 th&aacute;ng. Nếu kh&ocirc;ng ho&agrave;n th&agrave;nh 3 mũi vi&ecirc;m gan si&ecirc;u vi B trước khi mang thai, bạn ho&agrave;n to&agrave;n c&oacute; thể tiếp tục ti&ecirc;m ph&ograve;ng khi mang thai.</p>
<p>
	2. Virus vi&ecirc;m gan A</p>
<p>
	Virus vi&ecirc;m gan A kh&ocirc;ng g&acirc;y bệnh vi&ecirc;m gan mạn t&iacute;nh nhưng trong giai đoạn cấp t&iacute;nh c&oacute; tỷ lệ tử vong cao hơn. Bệnh n&agrave;y kh&ocirc;ng ảnh hưởng nhiều đến thai nhi nhưng nguy hiểm cho b&agrave; mẹ n&ecirc;n cũng cần ti&ecirc;m trước khi mang thai.</p>
<p>
	3. Uốn v&aacute;n</p>
<p>
	Bệnh c&oacute; thể g&acirc;y tử vong cho trẻ sơ sinh. Phụ nữ trong tuổi c&oacute; khả năng sinh sản n&ecirc;n được ti&ecirc;m văcxin ngừa uốn v&aacute;n trước khi c&oacute; thai hoặc v&agrave;o tuần 24-36 của thai kỳ. (Vắc-xin n&agrave;y cần ti&ecirc;m mũi cuối c&ugrave;ng trước ng&agrave;y dự sinh &iacute;t nhất 4 tuần)</p>
<p>
	4. Văcxin ngừa ung thư cổ tử cung</p>
<p>
	Nếu dưới 26 tuổi, bạn n&ecirc;n xem x&eacute;t đến việc ti&ecirc;m ph&ograve;ng ung thư cổ tử cung. Văcxin n&agrave;y bao gồm 3 mũi, k&eacute;o d&agrave;i trong 6 th&aacute;ng v&agrave; kh&ocirc;ng thể tiếp tục nếu như bạn mang thai. V&igrave; vậy, bạn n&ecirc;n t&iacute;nh to&aacute;n thời gian ph&ugrave; hợp nếu muốn ho&agrave;n th&agrave;nh việc ph&ograve;ng ngừa n&agrave;y trước khi c&oacute; bầu.</p>
', 1, 12)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (90, N'6 thực phẩm cực tốt cho phụ nữ đang cố gắng mang thai', N'2017_05_31_23_37_21_9917-thuc-pham-danh-cho-phu-nu-dang-co-gang-mang-thai-2-163052742.jpg', N' (Emdep.vn) - Đậu, kem, bí ngô là 3 trong số 6 loại thực phẩm rất tốt cho phụ nữ trong giai đoạn này. ', CAST(N'2017-05-31 00:00:00.000' AS DateTime), 0, N'<div>
	Với những ai đang cố gắng <a href="http://emdep.vn/tag/mang-thai.htm">mang thai</a>, chăm s&oacute;c sức khỏe bằng thực phẩm l&agrave; bước kh&ocirc;ng thể thiếu. Vậy thực phẩm n&agrave;o hỗ trợ khả năng sinh sản của phụ nữ tốt nhất? C&aacute;c chuy&ecirc;n gia cho biết, bạn n&ecirc;n ưu ti&ecirc;n top 6 loại thực phẩm sau.</div>
<div>
	C&aacute;c loại quả, hạt đậu</div>
<div>
	C&oacute; rất nhiều loại đậu v&agrave; c&aacute;ch chế biến quả đậu, hạt đậu th&agrave;nh c&aacute;c m&oacute;n ăn kh&aacute;c nhau tốt cho sức khỏe sinh sản của phụ nữ. C&aacute;c nh&agrave; khoa học của trường y Havard cho biết trong số gần 19 ngh&igrave;n phụ nữ ở độ tuổi sinh đẻ c&oacute; 39% bị v&ocirc; sinh do nạp v&agrave;o cơ thể lượng lớn protein động vật. C&ograve;n nh&oacute;m phụ nữ ăn nhiều protein thực vật như dầu đậu n&agrave;nh l&agrave;m từ đậu tương &iacute;t gặp c&aacute;c vấn đề về thụ thai hơn. Ngo&agrave;i đậu n&agrave;nh, c&ograve;n rất nhiều loại c&acirc;y thuộc họ nh&agrave; đậu kh&aacute;c m&agrave; bạn c&oacute; thể ăn để tăng khả năng c&oacute; con theo &yacute; muốn như đậu lăng, đậu tương non, m&oacute;n đậu phụ v&agrave; c&aacute;c loại hạt chứa protein thực vật tương tự.</div>
<div>
	Kem</div>
<div>
	Thật tuyệt! Rất nhiều phụ nữ th&iacute;ch kem v&agrave; m&oacute;n đồ ăn n&agrave;y lại nằm trong danh s&aacute;ch thực phẩm gi&uacute;p dễ thụ thai. Nghi&ecirc;n cứu cho thấy, c&aacute;c sản phẩm l&agrave;m từ sữa bao gồm cả kem gi&uacute;p phụ nữ chống lại việc kh&oacute; c&oacute; con do rụng trứng. Tuy nhi&ecirc;n, sữa t&aacute;ch b&eacute;o hoặc &iacute;t b&eacute;o lại c&oacute; t&aacute;c dụng ngược lại.&nbsp;</div>
<div>
	<img alt="" src="http://rauxanhcasach.vn/wp-content/uploads/2016/09/rau-xanh.jpg" style="width: 651px; height: 401px;" /></div>
<div>
	Rau l&aacute; xanh</div>
<div>
	Rau bina, b&ocirc;ng cải xanh v&agrave; nhiều loại rau l&aacute; xanh sẫm kh&aacute;c chứa h&agrave;m lượng folate cao một loại vitamin B được cho l&agrave; c&oacute; thể cải thiện sự rụng trứng ở phụ nữ. Để tăng khả năng thụ thai, bạn n&ecirc;n khuyến kh&iacute;ch &ocirc;ng x&atilde; của m&igrave;nh ăn c&aacute;c m&oacute;n ăn chế biến từ rau xanh c&ugrave;ng để tăng sản xuất lượng tinh tr&ugrave;ng khỏe.</div>
<div>
	Hạt b&iacute; ng&ocirc;</div>
<div>
	Hạt b&iacute; ng&ocirc; c&oacute; chứa rất nhiều sắt kh&ocirc;ng chứa huyết sắc tố, một loại sắt được t&igrave;m thấy ở một số loại thực vật nhất định v&agrave; thực phẩm tăng cường sắt. Một nghi&ecirc;n cứu chỉ ra rằng phụ nữ thường xuy&ecirc;n bổ sung thực phẩm chức năng chứa sắt đ&atilde; giảm được 40% t&igrave;nh trạng kh&oacute; c&oacute; con hơn những người kh&ocirc;ng bổ sung sắt. Vậy, nếu bạn đang c&oacute; kế hoạch sin hem b&eacute;, h&atilde;y ăn thật nhiều hạt b&iacute; ng&ocirc; giống như đồ ăn vặt h&agrave;ng ng&agrave;y, hoặc cho ch&uacute;ng v&agrave;o c&aacute;c loại b&aacute;nh nướng để ăn c&ugrave;ng.</div>
<div>
	&nbsp;</div>
<div>
	Dầu &ocirc; liu</div>
<div>
	Dầu &ocirc; liu l&agrave; chất b&eacute;o kh&ocirc;ng b&atilde;o h&ograve;a dạng đơn thể gi&uacute;p tăng độ nhạy cảm với insulin v&agrave; giảm vi&ecirc;m sưng to&agrave;n cơ thể (vi&ecirc;m sưng c&oacute; li&ecirc;n quan đến rụng trứng, thụ thai v&agrave; sự ph&aacute;t triển sớm của ph&ocirc;i thai). Bạn c&oacute; thể sử dụng dầu &ocirc; liu để trộn salad, nấu ăn hoặc d&ugrave;ng thay bơ.</div>
<div>
	C&aacute; hồi&nbsp;</div>
<div>
	C&aacute;c loại c&aacute; nước lạnh chứa rất nhiều axit b&eacute;o omega-3 gi&uacute;p điều chỉnh ho&oacute;c-m&ocirc;n sinh sản v&agrave; tăng lưu lượng m&aacute;u đến cơ quan sinh sản. C&aacute; hồi cũng l&agrave; loại c&aacute; chứa thủy ng&acirc;n thấp hơn so với c&aacute;c loại c&aacute; kh&aacute;c. Đ&oacute; l&agrave; l&yacute; do tại sao bạn n&ecirc;n cho c&aacute; hồi v&agrave;o thực đơn ăn uống để dễ c&oacute; em b&eacute;.</div>
', 1, 12)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (91, N'7 vấn đề sức khỏe cần kiểm tra khi chuẩn bị mang thai', N'2017_05_31_23_38_23_397-muc-suc-khoe-can-kiem-tra-khi-chuan-bi-mang-thai-1-150041563.jpg', N' (Emdep.vn) - Trước khi có kế hoạch mang thai, hãy chắc chắn rằng bạn đã chuẩn bị sức khỏe thể chất và tinh thần tốt để sẵn sàng cho sự kiện trọng đại trong đời này. ', CAST(N'2017-05-31 00:00:00.000' AS DateTime), 0, N'<div>
	Mang thai l&agrave; niềm vui lớn nhất đối với người phụ nữ, nhưng nếu kh&ocirc;ng chuẩn bị kỹ c&agrave;ng, bạn sẽ c&oacute; những trải nghiệm &aacute;m ảnh, t&aacute;c động kh&ocirc;ng nhỏ đến cuộc sống sau n&agrave;y. Về mặt sức khỏe, bạn đừng n&ecirc;n bỏ qua 7 điều quan trọng dưới đ&acirc;y khi chuẩn bị mang thai.</div>
<div>
	1. Kiểm tra răng&nbsp;</div>
<div>
	H&atilde;y đi gặp b&aacute;c sĩ nha khoa v&agrave; khắc phục tất cả c&aacute;c vấn đề về răng trước khi mang thai. Bất k&igrave; vấn đề g&igrave; về răng trong thai kỳ đều g&acirc;y ra những t&aacute;c hại lớn cho bạn v&agrave; em b&eacute; (bởi v&igrave; bạn kh&ocirc;ng thể uống thuốc kh&aacute;ng sinh v&agrave; giảm đau khi mang thai). Hơn nữa, việc nhổ v&agrave; c&aacute;c phẫu thuật răng phức tạp kh&aacute;c khi mang thai cũng rất nguy hiểm cho b&agrave; bầu.</div>
<div>
	2. X&eacute;t nghiệm nh&oacute;m m&aacute;u</div>
<div>
	Bạn n&ecirc;n kiểm tra nh&oacute;m m&aacute;u để biết ch&iacute;nh x&aacute;c nh&oacute;m m&aacute;u của m&igrave;nh. Việc n&agrave;y gi&uacute;p kiểm tra sự ph&ugrave; hợp giữa nh&oacute;m m&aacute;u của bạn v&agrave; &ocirc;ng x&atilde;. Nếu bạn c&oacute; nh&oacute;m m&aacute;u Rh-, v&agrave; của chồng bạn l&agrave; Rh+, bạn n&ecirc;n cho b&aacute;c sĩ biết điều n&agrave;y. Erythroblastosis fetalis l&agrave; một loại rối loạn m&aacute;u xảy ra ở thai nhi hoặc trẻ sơ sinh c&oacute; thể xảy ra do sự kh&ocirc;ng tương th&iacute;ch giữa m&aacute;u của người chồng v&agrave; người vợ. Rối loại n&agrave;y xảy ra khi c&aacute;c tế b&agrave;o bạch cầu của mẹ tấn c&ocirc;ng c&aacute;c tế b&agrave;o hồng cầu của em b&eacute; do kh&ocirc;ng tương th&iacute;ch.</div>
<div>
	<img alt="7 mục sức khỏe cần kiểm tra khi chuẩn bị mang thai" src="http://thumb.connect360.vn/unsafe/0x0/imgs.emdep.vn/Share/Image/2015/11/13/7-muc-suc-khoe-can-kiem-tra-khi-chuan-bi-mang-thai-1-150041563.jpg" /></div>
<div>
	3. Kiểm tra tuyến gi&aacute;p</div>
<div>
	Tuyến gi&aacute;p l&agrave; nơi sản xuất ho&oacute;c-m&ocirc;n n&ecirc;n c&oacute; ảnh hưởng quan trọng đến qu&aacute; tr&igrave;nh mang thai của phụ nữ. Lượng ho&oacute;c-m&ocirc;n tuyến gi&aacute;p thấp g&acirc;y ra t&igrave;nh trạng suy gi&aacute;p v&agrave; ảnh hưởng đến sự ph&aacute;t triển n&atilde;o bộ của em b&eacute;. Thậm ch&iacute;, nếu b&agrave; bầu c&oacute; vấn đề về tuyến gi&aacute;p nghi&ecirc;m trọng, t&igrave;nh trạng n&agrave;y c&oacute; thể g&acirc;y ra sẩy thai.</div>
<div>
	4. Đi gặp b&aacute;c sĩ t&acirc;m l&yacute;</div>
<div>
	Sức khỏe thể chất v&agrave; tinh thần đều quan trọng như nhau. Nếu t&acirc;m l&yacute; của bạn hoặc &ocirc;ng x&atilde; chưa sẵn s&agrave;ng để c&oacute; em b&eacute;, hoặc bạn gặp qu&aacute; nhiều căng thẳng v&agrave; lo lắng trong cuộc sống, c&ocirc;ng việc, t&agrave;i ch&iacute;nh, bạn n&ecirc;n c&acirc;n nhắc ho&atilde;n lại việc c&oacute; em b&eacute;. T&acirc;m l&yacute; của người mẹ kh&ocirc;ng b&igrave;nh ổn c&oacute; thể khiến bạn bị suy nhược v&agrave; kh&ocirc;ng c&oacute; một thai kỳ khỏe mạnh. Em b&eacute; của bạn do đ&oacute; cũng kh&ocirc;ng c&oacute; sự ph&aacute;t triển tốt nhất về c&acirc;n nặng, tr&iacute; n&atilde;o v&agrave; c&oacute; thể gặp một số c&aacute;c vấn đề về khuyết tật.</div>
<div>
	5. Kiểm tra dinh dưỡng</div>
<div>
	<img alt="7 mục sức khỏe cần kiểm tra khi chuẩn bị mang thai" src="http://thumb.connect360.vn/unsafe/0x0/imgs.emdep.vn/Share/Image/2015/11/13/7-muc-suc-khoe-can-kiem-tra-khi-chuan-bi-mang-thai-3-150117872.jpg" /></div>
<div>
	Dinh dưỡng rất quan trọng đối với b&agrave; bầu. Kh&ocirc;ng cần phải b&agrave;n c&atilde;i nhiều, bạn n&ecirc;n đi kiểm tra dinh dưỡng cơ thể để biết chắc m&igrave;nh đang thiếu, thừa những loại dưỡng chất g&igrave; v&agrave; c&acirc;n bằng lại ch&uacute;ng đầy đủ trước khi mang thai.</div>
<div>
	6. Đo c&acirc;n nặng</div>
<div>
	C&acirc;n nặng của bạn ảnh hưởng lớn đến sức khỏe của bạn v&agrave; phản &aacute;nh c&aacute;c bệnh li&ecirc;n quan. B&aacute;c sĩ sẽ cho bạn biết c&acirc;n nặng của bạn đ&atilde; đủ tốt để mang thai hay chưa, v&agrave; nhiệm vụ của bạn l&agrave; điều chỉnh lại c&acirc;n nặng sao cho th&iacute;ch hợp.</div>
<div>
	7. Kiểm tra huyết sắc tố&nbsp;&nbsp; &nbsp;</div>
<div>
	<a href="http://emdep.vn/chuan-bi-mang-thai/7-van-de-suc-khoe-can-kiem-tra-khi-chuan-bi-mang-thai-20151113150010812.htm" target="_blank"><img alt="7 vấn đề sức khỏe cần kiểm tra khi chuẩn bị mang thai" src="http://thumb.connect360.vn/unsafe/0x0/imgs.emdep.vn/Share/Image/2015/11/13/7-muc-suc-khoe-can-kiem-tra-khi-chuan-bi-mang-thai-2-150052197.jpg" /></a></div>
<div>
	Kiểm tra huyết sắc tố l&agrave; một trong những mục kiểm tra sức khỏe trước khi mang thai quan trọng m&agrave; bạn kh&ocirc;ng n&ecirc;n bỏ qua. X&eacute;t nghiệm n&agrave;y sẽ cho biết mức huyết sắc tố của bạn đ&atilde; đủ để mang thai hay chưa. Nếu bạn bị thiếu huyết sắc tố, bạn cần bổ sung axit folic trước khi mang thai để ngăn ngừa biến chứng trong thai kỳ.</div>
', 1, 12)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (92, N'7 cách trị ho và cảm lạnh cho bà bầu không cần thuốc', N'2017_05_31_23_39_33_5807-cach-tri-ho-va-cam-lanh-cho-ba-bau-2-09252924.jpg', N' (Emdep.vn) - Xông hơi, súc miệng bằng nước muối hoặc dùng tinh dầu bạc hà là 3 trong 7 cách hiệu quả nhất giúp bà bầu trị ho và cảm lạnh nhanh chóng. ', CAST(N'2017-05-31 00:00:00.000' AS DateTime), 0, N'<div>
	Khi mang thai những mẹo trị cảm c&uacute;m v&ocirc; c&ugrave;ng cần thiết đối với b&agrave; bầu. Bởi nếu kh&ocirc;ng d&ugrave;ng mẹo trị cảm c&uacute;m m&agrave; tự &yacute; uống thuốc sẽ nguy hiểm cho thai nhi.</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<p>
	C&aacute;ch trị cảm c&uacute;m cho b&agrave; bầu&nbsp;theo d&acirc;n gian rất an to&agrave;n. Những c&aacute;ch n&agrave;y kh&ocirc;ng chỉ d&ugrave;ng được với phụ nữ mang thai m&agrave; ngay cả người b&igrave;nh thường cũng c&oacute; thể &aacute;p dụng hiệu quả.</p>
<p>
	Cảm c&uacute;m vốn l&agrave; căn bệnh thường gặp v&agrave; kh&ocirc;ng qu&aacute; nguy hiểm. Nhưng với phụ nữ mang thai th&igrave; đ&acirc;y lại l&agrave; căn bệnh đ&aacute;ng sợ. Bởi virus c&uacute;m kh&ocirc;ng chỉ khiến thai nhi c&oacute; nguy cơ bị dị tật, m&agrave; khi b&agrave; bầu sốt cao cộng với độc t&iacute;nh của virus c&oacute; thể k&iacute;ch th&iacute;ch co b&oacute;p tử cung dễ g&acirc;y ra hiện tượng <a href="https://www.lamsao.com/say-thai-p184t1843.html">sảy thai</a>, sinh non.</p>
<p>
	Khi mang bầu chị em n&ecirc;n hạn chế tối đa việc sử dụng thuốc để tr&aacute;nh ảnh hưởng tới thai nhi. Nếu b&agrave; bầu thấy m&igrave;nh c&oacute; triệu chứng của bệnh c&uacute;m h&atilde;y đến gặp b&aacute;c sĩ, tr&aacute;nh tự &yacute; mua thuốc về sử dụng.</p>
<p>
	B&ecirc;n cạnh đ&oacute; b&agrave; bầu cũng c&oacute; thể &aacute;p dụng c&aacute;c c&aacute;ch chữa cảm c&uacute;m an to&agrave;n của d&acirc;n gian. Mặc d&ugrave; c&aacute;c phương ph&aacute;p n&agrave;y kh&ocirc;ng mang lại hiệu quả ngay lập tức như thuốc, nhưng n&oacute; lại rất an to&agrave;n cho cả mẹ v&agrave; em b&eacute;.</p>
<h3>
	C&aacute;c c&aacute;ch trị cảm c&uacute;m cho b&agrave; bầu theo d&acirc;n gian&nbsp;</h3>
<ul>
	<li>
		<div>
			1</div>
		<div>
			<p>
				Uống l&aacute; kinh giới, t&iacute;a t&ocirc;</p>
			<p>
				Theo Đ&ocirc;ng y th&igrave; l&aacute; kinh giới c&oacute; vị cay, t&iacute;nh ấm, c&oacute; t&aacute;c dụng l&agrave;m ra mồ h&ocirc;i, gi&uacute;p lợi tiểu, chữa sốt n&oacute;ng, trị cảm gi&oacute;, chữa bệnh dị ứng, sao đen để cầm huyết. Khi bị cảm c&uacute;m b&agrave; bầu c&oacute; thể sử dụng l&aacute; kinh giới để chữa khỏi bệnh một c&aacute;ch an to&agrave;n.</p>
			<div>
				<div>
					<div>
						ADVERTISING</div>
				</div>
			</div>
			<p>
				Bạn lấy l&aacute; kinh giới, t&iacute;a t&ocirc; mỗi thứ 15g, cam thảo 2,5g. Đem nấu đun s&ocirc;i lấy nước uống. Những vị thuốc n&agrave;y sẽ nhanh ch&oacute;ng gi&uacute;p mẹ bầu tho&aacute;t khỏi c&aacute;c triệu chứng cảm c&uacute;m.</p>
		</div>
	</li>
</ul>
<ul>
	<li>
		<div>
			2</div>
		<div>
			<p>
				X&ocirc;ng mặt bằng l&aacute; thuốc</p>
			<p>
				Ngo&agrave;i việc uống l&aacute; kinh giới, t&iacute;a t&ocirc;, b&agrave; bầu n&ecirc;n kết hợp th&ecirc;m với c&aacute;ch trị cảm c&uacute;m kh&aacute;c l&agrave; x&ocirc;ng mặt bằng l&aacute; thuốc, sẽ gi&uacute;p mẹ tho&aacute;i m&aacute;i hơn v&agrave; bệnh cũng nhanh khỏi. Bạn c&oacute; thể sử dụng một v&agrave;i loại l&aacute; như: l&aacute; bưởi, h&uacute;ng quế, t&iacute;a t&ocirc;, bạc h&agrave;, rau tần, ngổ, riềng, gừng, h&agrave;nh, chanh&hellip; Khi x&ocirc;ng, chọn khoảng 5 - 7 loại, mỗi loại khoảng 50g - 100g, rửa sạch cho v&agrave;o nồi lớn đổ ngập nước, đậy vung cho k&iacute;n.</p>
			<p>
				Đun s&ocirc;i nồi l&aacute; x&ocirc;ng chừng 3 - 5 ph&uacute;t. Sau đ&oacute; mở h&eacute; nắp nồi cho hơi n&oacute;ng tho&aacute;t ra dần dần, bạn h&atilde;y h&iacute;t thở thật đều, thật nhiều. N&ecirc;n ngồi khoảng 5 - 10 ph&uacute;t cho tới khi mồ h&ocirc;i ở mặt to&aacute;t ra, sau đ&oacute; lấy khăn lau cho kh&ocirc; mặt. X&ocirc;ng hơi xong chị em h&atilde;y uống một ly nước chanh cho th&ecirc;m v&agrave;o một &iacute;t muối.</p>
			<p>
				<img alt="Cách trị cảm cúm cho bà bầu không cần thuốc cực kỳ hay" src="https://media.lamsao.com//Data//quynhdtn/03112015/meo_tri_cam_cum_khong_can_thuoc_cuc_hay_cho_ba_bau_3.jpg" title="Cách trị cảm cúm cho bà bầu không cần thuốc cực kỳ hay1" /></p>
			<pre>
C&aacute;ch trị cảm c&uacute;m cho b&agrave; bầu bằng x&ocirc;ng hơi l&aacute; thuốc rất hiệu quả 
</pre>
		</div>
	</li>
</ul>
<ul>
	<li>
		<div>
			3</div>
		<div>
			<p>
				Ăn ch&aacute;o trứng n&oacute;ng</p>
			<p>
				Nếu bị cảm c&uacute;m nhẹ, b&agrave; bầu chỉ cần ăn ch&aacute;o trứng n&oacute;ng với h&agrave;nh v&agrave; l&aacute; t&iacute;a t&ocirc;. Lưu &yacute; rằng ch&aacute;o trứng phải ăn khi c&ograve;n n&oacute;ng để cơ thể to&aacute;t ra mồ h&ocirc;i, điều đ&oacute; sẽ gi&uacute;p b&agrave; bầu cảm thấy dễ chịu hơn. M&oacute;n ăn n&agrave;y kh&ocirc;ng chỉ bổ dưỡng m&agrave; c&ograve;n l&agrave; c&aacute;ch trị cảm c&uacute;m an to&agrave;n cho mẹ v&agrave; b&eacute;.</p>
			<p>
				<img alt="Mẹo trị cảm cúm không cần thuốc cực hay cho bà bầu-2" src="https://media.lamsao.com//Data//quynhdtn/03112015/meo_tri_cam_cum_khong_can_thuoc_cuc_hay_cho_ba_bau_4.jpg" title="Mẹo trị cảm cúm không cần thuốc cực hay cho bà bầu-2" /></p>
			<pre>
Ăn ch&aacute;o trứng n&oacute;ng cũng l&agrave; một c&aacute;ch trị cảm c&uacute;m cho b&agrave; bầu cực hay 
</pre>
		</div>
	</li>
</ul>
<ul>
	<li>
		<div>
			4</div>
		<div>
			<p>
				Sử dụng tỏi</p>
			<p>
				Tỏi l&agrave; gia vị gần như kh&ocirc;ng thể thiếu trong căn bếp mỗi gia đ&igrave;nh, n&oacute; c&ograve;n được sử dụng trong c&aacute;ch trị cảm c&uacute;m của d&acirc;n gian rất hiệu quả.</p>
			<p>
				Khi bị cảm c&uacute;m, bạn h&atilde;y gi&atilde; n&aacute;t một v&agrave;i t&eacute;p tỏi, h&ograve;a v&agrave;o cốc nước rồi uống trực tiếp sẽ khỏi bệnh rất nhanh. Mặc d&ugrave; kh&oacute; uống do m&ugrave;i vị của tỏi cay nồng, nhưng sau n&oacute; sẽ mang lại cảm gi&aacute;c rất dễ chịu sau đ&oacute;.</p>
			<p>
				Trong qu&aacute; tr&igrave;nh mang thai bạn n&ecirc;n th&ecirc;m tỏi v&agrave;o m&oacute;n ăn của m&igrave;nh khi chế biến để ph&ograve;ng tr&aacute;nh cảm c&uacute;m. Tuy nhi&ecirc;n c&aacute;ch tốt nhất để trị chứng cảm c&uacute;m vẫn l&agrave; ăn tỏi sống.</p>
		</div>
	</li>
</ul>
<p>
	Những c&aacute;ch ph&ograve;ng bệnh cảm c&uacute;m cho b&agrave; bầu trong thai kỳ</p>
<p>
	Cảm c&uacute;m trong thai kỳ rất nguy hiểm cho thai nhi v&agrave; cả b&agrave; bầu. Ch&iacute;nh v&igrave; thế, khi mang thai bạn cần cẩn thận ph&ograve;ng tr&aacute;nh để kh&ocirc;ng mắc phải căn bệnh n&agrave;y. H&atilde;y &aacute;p dụng một số c&aacute;ch ph&ograve;ng tr&aacute;nh cảm c&uacute;m hiệu quả sau:</p>
<ul>
	<li>
		<div>
			1</div>
		<div>
			<p>
				Bổ sung vitamin C</p>
			<p>
				Vitamin C l&agrave; dưỡng chất kh&ocirc;ng thể thiếu để n&acirc;ng cao hệ miễn dịch của cơ thể. Ch&iacute;nh v&igrave; thế khi mang thai bạn cần bổ sung đầy đủ vitamin C để tăng khả năng ph&ograve;ng bệnh. H&atilde;y thường xuy&ecirc;n ăn những loại quả gi&agrave;u vitamin C như cam, chanh, bưởi&hellip; Nếu bị cảm c&uacute;m, bạn c&oacute; thể uống bổ sung th&ecirc;m vi&ecirc;n C để cung cấp nhanh ch&oacute;ng nguồn vitamin C cho cơ thể nh&eacute;.</p>
		</div>
	</li>
</ul>
<ul>
	<li>
		<div>
			2</div>
		<div>
			<p>
				Uống nhiều nước</p>
			<p>
				Theo lời khuy&ecirc;n của c&aacute;c b&aacute;c sĩ khi bị c&uacute;m bạn n&ecirc;n uống nhiều nước (c&oacute; thể l&agrave; nước lọc, nước hoa quả, ch&aacute;o, s&uacute;p...), đặc biệt l&agrave; nước ấm. Việc n&agrave;y sẽ gi&uacute;p mũi bạn được th&ocirc;ng tho&aacute;ng hơn.</p>
		</div>
	</li>
</ul>
<ul>
	<li>
		<div>
			3</div>
		<div>
			<p>
				S&uacute;c miệng nước muối</p>
			<p>
				Nước muối c&oacute; t&aacute;c dụng kh&aacute;ng khuẩn rất tốt. V&igrave; thế để ph&ograve;ng tr&aacute;nh cảm c&uacute;m, bạn n&ecirc;n s&uacute;c miệng nước muối khoảng v&agrave;i lần mỗi ng&agrave;y nh&eacute;. Điều n&agrave;y c&ograve;n gi&uacute;p giảm vi&ecirc;m vọng v&agrave; ngăn ngừa nhiễm tr&ugrave;ng nữa đấy.</p>
		</div>
	</li>
</ul>
<div>
	4</div>
<p>
	Tr&aacute;nh xa người bị cảm</p>
<p>
	Khi mang thai, khả năng đề kh&aacute;ng của b&agrave; bầu k&eacute;m hơn b&igrave;nh thường rất nhiều, do vậy chị em n&ecirc;n tr&aacute;nh tiếp x&uacute;c với những người bị bệnh cảm c&uacute;m để đề ph&ograve;ng bị l&acirc;y bệnh nh&eacute;.</p>
', 1, 12)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (93, N'Mức tăng cân an toàn cho bà bầu trong thai kì', N'2017_05_31_23_41_07_897de-ba-bau-co-can-nang-an-toan-trong-suot-thai-ky-1-095511049.jpg', N'Bạn nên tăng khoảng 1 – 2 kg trong 3 tháng đầu tiên mang thai và tăng khoảng 0,5 kg/tuần trong giai đoạn cuối của thai kỳ', CAST(N'2017-05-31 00:00:00.000' AS DateTime), 2, N'<div>
	Một chế độ ăn uống l&agrave;nh mạnh sẽ gi&uacute;p thai nhi trong bụng bạn nhận được đủ dinh dưỡng để ph&aacute;t triển khỏe mạnh. Nhưng bạn c&oacute; biết m&igrave;nh cần th&ecirc;m bao nhi&ecirc;u calo trong giai đoạn mang thai quan trọng? Thực tế, kh&ocirc;ng c&oacute; một c&ocirc;ng thức chuẩn n&agrave;o cho tất cả c&aacute;c <a href="http://emdep.vn/bau-sinh-no.htm">b&agrave; bầu</a> cả bởi v&igrave; thể trạng mỗi phụ nữ c&oacute; thai l&agrave; kh&aacute;c nhau. Quan niệm &ldquo;ăn cho 2 người&rdquo; cũng ho&agrave;n to&agrave;n sai. Theo c&aacute;c chuy&ecirc;n gia, trung b&igrave;nh mỗi phụ nữ mang thai chỉ cần nhiều hơn 300 calo mỗi ng&agrave;y so với lượng calo họ nạp v&agrave;o cơ thể trước khi mang thai. Điều n&agrave;y đồng nghĩa với việc họ sẽ tăng c&acirc;n khỏe mạnh trong thai kỳ v&agrave; kh&ocirc;ng lo sợ về việc thừa c&acirc;n sẽ ảnh hưởng đến cả mẹ v&agrave; b&eacute;.</div>
<div>
	H&atilde;y hỏi b&aacute;c sĩ của bạn để biết r&otilde; m&igrave;nh cần tăng bao nhi&ecirc;u c&acirc;n khi mang thai. Trung b&igrave;nh, một phụ nữ c&oacute; c&acirc;n nặng ti&ecirc;u chuẩn khi bắt đầu <a href="http://emdep.vn/tag/mang-thai.htm">mang thai</a> sẽ tăng từ 11 &ndash; 13,5 kg so với trước đ&oacute;, phụ nữ thiếu c&acirc;n cần tăng nhiều c&acirc;n hơn, từ 13 &ndash; 18 kg, c&ograve;n phụ nữ thừa c&acirc;n chỉ cần tăng từ 7 &ndash; 11 kg trong giai đoạn mang thai.</div>
<div>
	Nh&igrave;n chung, bạn n&ecirc;n tăng khoảng 1 &ndash; 2 kg trong 3 th&aacute;ng đầu ti&ecirc;n mang thai v&agrave; tăng khoảng 0,5 kg/tuần trong giai đoạn cuối của thai kỳ. Nếu bạn mang thai đ&ocirc;i, bạn cần tăng từ 16 &ndash; 20 kg trong suốt thai kỳ.</div>
<div>
	<a href="http://emdep.vn/lam-me/muc-tang-can-an-toan-cho-ba-bau-trong-thai-ki-20151112094939548.htm" target="_blank"><img alt="Mức tăng cân an toàn cho bà bầu trong thai kì" src="http://thumb.connect360.vn/unsafe/0x0/imgs.emdep.vn/Share/Image/2015/11/12/de-ba-bau-co-can-nang-an-toan-trong-suot-thai-ky-1-095511049.jpg" /></a></div>
<div>
	B&agrave; bầu tăng c&acirc;n ở những đ&acirc;u?</div>
<div>
	Em b&eacute;: (Trung b&igrave;nh) 3,6 kg</div>
<div>
	Nhau thai: 1 &ndash; 1,3 kg</div>
<div>
	Nước ối: 1 &ndash; 1,3 kg</div>
<div>
	M&ocirc; v&uacute;: 1 &ndash; 1,3 kg</div>
<div>
	Lượng m&aacute;u: 1,8 kg</div>
<div>
	Mỡ: 2,2 &ndash; 4 kg</div>
<div>
	Tử cung: 1 &ndash; 2,2 kg</div>
<div>
	Tổng cộng: 11 &ndash; 16 kg</div>
<div>
	Giảm c&acirc;n khi mang thai c&oacute; an to&agrave;n kh&ocirc;ng?</div>
<div>
	Nếu bạn bị thừa c&acirc;n khi mang thai, bạn c&oacute; thể giảm c&acirc;n nhưng phải dưới sự theo d&otilde;i nghi&ecirc;m ngặt của b&aacute;c sĩ. Tuy nhi&ecirc;n, trong mọi trường hợp giảm c&acirc;n hoặc ăn ki&ecirc;ng khi mang thai kh&ocirc;ng được khuyến kh&iacute;ch.</div>
<div>
	L&agrave;m thế n&agrave;o để tăng đủ c&acirc;n khi mang thai?</div>
<div>
	Nếu c&acirc;n nặng của bạn &iacute;t, bạn n&ecirc;n tăng c&acirc;n an to&agrave;n trước hoặc khi mang thai. Dưới đ&acirc;y l&agrave; một v&agrave;i c&aacute;ch để bạn &aacute;p dụng:</div>
<div>
	-&nbsp;&nbsp; &nbsp;Ăn từ 5 &ndash; 6 bữa nhỏ mỗi ng&agrave;y.</div>
<div>
	-&nbsp;&nbsp; &nbsp;Ăn c&aacute;c bữa phụ, ăn vặt nhanh với c&aacute;c thực phẩm l&agrave;nh mạnh như hạt kh&ocirc;, kem, sữa chua, b&aacute;nh nướng, pho m&aacute;t, hoa quả kh&ocirc;&hellip;</div>
<div>
	-&nbsp;&nbsp; &nbsp;Ăn b&aacute;nh mỳ phết bơ lạc, b&aacute;nh quy gi&ograve;n, t&aacute;o, chuối hoặc cần t&acirc;y. 1 th&igrave;a bơ lạc c&oacute; thể cung cấp cho bạn 100 calo v&agrave; 7g protein.</div>
<div>
	-&nbsp;&nbsp; &nbsp;Cho th&ecirc;m sữa t&aacute;ch b&eacute;o v&agrave;o khoai t&acirc;y, trứng v&agrave; ngũ cốc n&oacute;ng.</div>
<div>
	-&nbsp;&nbsp; &nbsp;Bổ sung c&aacute;c loại thực phẩm gi&uacute;p tăng c&acirc;n l&agrave;nh mạnh v&agrave;o bữa ăn h&agrave;ng ng&agrave;y như bơ, bơ thực vật, pho m&aacute;t, kem, sữa chua,...</div>
<div>
	Nếu bạn tăng qu&aacute; nhiều c&acirc;n khi mang thai&hellip;</div>
<div>
	Nếu c&acirc;n nặng của bạn vượt mức c&acirc;n m&agrave; b&aacute;c sĩ khuyến c&aacute;o, h&atilde;y đi gặp b&aacute;c sĩ để kiểm so&aacute;t t&igrave;nh h&igrave;nh c&acirc;n nặng của m&igrave;nh. Dưới đ&acirc;y l&agrave; một v&agrave;i c&aacute;ch hiệu quả để bạn &aacute;p dụng:</div>
<div>
	-&nbsp;&nbsp; &nbsp;Khi ăn thực phẩm ăn nhanh, h&atilde;y loại bỏ c&aacute;c loại đồ ăn chứa nhiều dầu mỡ.</div>
<div>
	-&nbsp;&nbsp; &nbsp;Tr&aacute;nh c&aacute;c sản phẩm sữa chưa t&aacute;ch b&eacute;o nhưng vẫn phải uống &iacute;t nhất 1 cốc sữa t&aacute;ch b&eacute;o h&agrave;ng ng&agrave;y, hoặc ăn sữa chua, ăn pho m&aacute;t kh&ocirc;ng b&eacute;o.</div>
<div>
	-&nbsp;&nbsp; &nbsp;Hạn chế ăn đồ ngọt v&agrave; thức uống ngọt như soda, nước hoa quả, nước chanh&hellip;</div>
<div>
	-&nbsp;&nbsp; &nbsp;Kh&ocirc;ng ăn mặn v&igrave; muối khiến bạn giữ nước trong cơ thể.</div>
<div>
	-&nbsp;&nbsp; &nbsp;Hạn chế ăn c&aacute;c loại đồ ăn vặt nhiều calo như b&aacute;nh donut, kẹo, b&aacute;nh, mật ong, khoai t&acirc;y chi&ecirc;n&hellip;</div>
<div>
	-&nbsp;&nbsp; &nbsp;Sử dụng chất b&eacute;o c&oacute; kiểm so&aacute;t v&agrave; tr&aacute;nh ăn c&aacute;c đồ c&oacute; nhiều dầu mỡ.</div>
<div>
	-&nbsp;&nbsp; &nbsp;Tập thể dục nhẹ nh&agrave;ng như đi bộ hoặc bơi.</div>
<div>
	Xem th&ecirc;m</div>
', 1, 12)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (94, N'Khi bố - mẹ chăm con: một trời - một vực', N'2017_05_31_23_42_14_808bebo.jpeg', N' (Emdep.vn) - "Có nuôi con mới biết lòng cha mẹ" - cứ thử làm mẹ một lần thì mới ngấm nhưng vất vả không biết đến bao giờ mới hết để con trưởng thành, lớn khôn. ', CAST(N'2017-05-31 00:00:00.000' AS DateTime), 0, N'<div>
	<img alt="Sự khác biệt trong cách chăm con giữa bố và mẹ" src="http://mebubu.com/mbb/image/blog/khi-bo-me-cham-con-mot-troi-mot-vuc-2986-1.jpg" /></div>
<div>
	Ở b&ecirc;n mẹ, con được &quot;n&acirc;ng như n&acirc;ng trứng, hứng như hứng hoa&quot;, trong khi ở b&ecirc;n bố, con thường xuy&ecirc;n bị l&ocirc;i ra l&agrave;m tr&ograve; hề như thế n&agrave;y.</div>
<div>
	<img alt="Sự khác biệt trong cách chăm con giữa bố và mẹ" src="http://mebubu.com/mbb/image/blog/khi-bo-me-cham-con-mot-troi-mot-vuc-2986-2.jpg" /></div>
<p>
	&nbsp;</p>
<div>
	Con lu&ocirc;n c&oacute; v&ocirc; số những c&acirc;u hỏi, y&ecirc;u cầu d&agrave;nh cho mẹ. C&ograve;n với bố, con chỉ hỏi một c&acirc;u duy nhất: &quot;Mẹ con đ&acirc;u?&quot;</div>
<div>
	<img alt="Sự khác biệt trong cách chăm con giữa bố và mẹ" src="http://mebubu.com/mbb/image/blog/khi-bo-me-cham-con-mot-troi-mot-vuc-2986-3.jpg" /></div>
<div>
	Tr&aacute;i ngược với mẹ, bố lu&ocirc;n nghĩ m&igrave;nh l&agrave; &ocirc;ng bố tuyệt vời nhất trong mắt con.</div>
<div>
	<img alt="Sự khác biệt trong cách chăm con giữa bố và mẹ" src="http://mebubu.com/mbb/image/blog/khi-bo-me-cham-con-mot-troi-mot-vuc-2986-4.jpg" /></div>
<div>
	<img alt="Sự khác biệt trong cách chăm con giữa bố và mẹ" src="http://mebubu.com/mbb/image/blog/khi-bo-me-cham-con-mot-troi-mot-vuc-2986-5.jpg" /></div>
<div>
	Khi b&eacute; được đi chơi c&ugrave;ng bố, kh&aacute;c hẳn với l&uacute;c được đi c&ugrave;ng mẹ.</div>
<div>
	<img alt="Sự khác biệt trong cách chăm con giữa bố và mẹ" src="http://mebubu.com/mbb/image/blog/khi-bo-me-cham-con-mot-troi-mot-vuc-2986-6.jpg" /></div>
<div>
	Khi con được đi vườn th&uacute; c&ugrave;ng bố mẹ.</div>
<div>
	<img alt="Sự khác biệt trong cách chăm con giữa bố và mẹ" src="http://mebubu.com/mbb/image/blog/khi-bo-me-cham-con-mot-troi-mot-vuc-2986-7.jpg" /></div>
<div>
	Mẹ lu&ocirc;n chỉ bảo dẫn dắt tận t&igrave;nh, c&ograve;n bố th&igrave; đ&ocirc;i khi c&ograve;n tranh gi&agrave;nh cả với con.</div>
<div>
	<img alt="Sự khác biệt trong cách chăm con giữa bố và mẹ" src="http://mebubu.com/mbb/image/blog/khi-bo-me-cham-con-mot-troi-mot-vuc-2986-8.jpg" /></div>
<div>
	Xe đẩy của con khi đi c&ugrave;ng bố v&agrave; mẹ.</div>
<div>
	<img alt="Sự khác biệt trong cách chăm con giữa bố và mẹ" src="http://mebubu.com/mbb/image/blog/khi-bo-me-cham-con-mot-troi-mot-vuc-2986-9.jpg" /></div>
<div>
	Ở b&ecirc;n mẹ con lu&ocirc;n xinh đẹp rạng rỡ, c&ograve;n ở b&ecirc;n bố th&igrave;...</div>
<div>
	<img alt="Sự khác biệt trong cách chăm con giữa bố và mẹ" src="http://mebubu.com/mbb/image/blog/khi-bo-me-cham-con-mot-troi-mot-vuc-2986-10.jpg" /></div>
<div>
	Cuộc hội thoai một d&agrave;i một ngắn giữa con v&agrave; mẹ, con v&agrave; bố.</div>
<div>
	<a href="http://mebubu.com/blog/khi-bo-me-cham-con-mot-troi-mot-vuc-2986#" target="_blank"><img alt="Khi bố - mẹ chăm con: một trời - một vực" src="http://mebubu.com/mbb/image/blog/khi-bo-me-cham-con-mot-troi-mot-vuc-2986-11.jpg" /></a></div>
', 1, 12)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (95, N'Tô son tràn môi, lòng môi hay ombre... mốt trang điểm Hàn Quốc', N'2017_05_31_23_45_26_434goi-y-cach-to-son-sao-han-221741073.jpg', N' (Emdep.vn) - Một đôi môi quyến rũ gợi cảm giúp bạn trở nên thu hút hơn người đối diện, nổi bần bật luôn. ', CAST(N'2017-05-31 00:00:00.000' AS DateTime), 0, N'<p>
	T&ocirc; son x&iacute; muội</p>
<p>
	<img alt="Điểm lại những mốt tô son Hàn Quộc được giới trẻ khắp nơi hào hứng làm theo" src="http://thumb.connect360.vn/unsafe/600x0/imgs.emdep.vn/Share/Image/2017/05/30/goi-y-cach-to-son-sao-han-221741073.jpg" /></p>
<p>
	<img alt="Điểm lại những mốt tô son Hàn Quộc được giới trẻ khắp nơi hào hứng làm theo" src="http://thumb.connect360.vn/unsafe/600x0/imgs.emdep.vn/Share/Image/2017/05/30/meo-to-son-dep-nhu-sao-han-221741104.jpg" /></p>
<p>
	<img alt="Điểm lại những mốt tô son Hàn Quộc được giới trẻ khắp nơi hào hứng làm theo" src="http://thumb.connect360.vn/unsafe/500x0/imgs.emdep.vn/Share/Image/2017/05/30/sao-han-to-son-xi-muoi-221741609.jpg" /></p>
<p>
	C&aacute;ch t&ocirc; son x&iacute; muội gi&uacute;p c&aacute;c n&agrave;ng trở n&ecirc;n nữ t&iacute;nh, đ&ocirc;i m&ocirc;i gợi cảm, đ&aacute;ng y&ecirc;u hơn. M&agrave; c&aacute;ch thực hiện v&ocirc; c&ugrave;ng đơn giản, chỉ v&agrave;i lần quẹt son cũng đủ khiến đ&ocirc;i m&ocirc;i bạn tươi thắm, gợi cảm kh&oacute; cưỡng.</p>
<p>
	<img alt="Điểm lại những mốt tô son Hàn Quộc được giới trẻ khắp nơi hào hứng làm theo" src="http://thumb.connect360.vn/unsafe/600x0/imgs.emdep.vn/Share/Image/2017/05/30/son-moi-xi-muoi-222044112.jpg" /></p>
<p>
	T&ocirc; l&ograve;ng m&ocirc;i gợi cảm</p>
<p>
	<img alt="Điểm lại những mốt tô son Hàn Quộc được giới trẻ khắp nơi hào hứng làm theo" src="http://thumb.connect360.vn/unsafe/700x0/imgs.emdep.vn/Share/Image/2017/05/30/moi-xi-muoi-sa0-han-221815394.jpg" /></p>
<p>
	<img alt="Điểm lại những mốt tô son Hàn Quộc được giới trẻ khắp nơi hào hứng làm theo" src="http://thumb.connect360.vn/unsafe/700x0/imgs.emdep.vn/Share/Image/2017/05/30/to-son-sao-han-221815905.jpg" /></p>
<p>
	T&ocirc; l&ograve;ng m&ocirc;i gi&uacute;p chị em to&aacute;t l&ecirc;n vẻ trẻ trung, ng&acirc;y thơ nhưng cũng kh&ocirc;ng k&eacute;m phần gợi cảm. Kiểu son m&agrave;u đỏ tươi, hồng, cam thường được chị em ưa chuộng khi đ&aacute;nh l&ograve;ng m&ocirc;i.</p>
<p>
	<img alt="Điểm lại những mốt tô son Hàn Quộc được giới trẻ khắp nơi hào hứng làm theo" src="http://thumb.connect360.vn/unsafe/600x0/imgs.emdep.vn/Share/Image/2017/05/30/son-long-moi-221957612.jpg" /></p>
<p>
	T&ocirc; son tr&agrave;n m&ocirc;i</p>
<p>
	<img alt="Điểm lại những mốt tô son Hàn Quộc được giới trẻ khắp nơi hào hứng làm theo" src="http://thumb.connect360.vn/unsafe/550x0/imgs.emdep.vn/Share/Image/2017/05/30/cach-to-son-tran-moi-22192478.jpg" /></p>
<p>
	<img alt="Điểm lại những mốt tô son Hàn Quộc được giới trẻ khắp nơi hào hứng làm theo" src="http://thumb.connect360.vn/unsafe/550x0/imgs.emdep.vn/Share/Image/2017/05/30/to-son-tran-moi-22192527.jpg" /></p>
<p>
	<img alt="Điểm lại những mốt tô son Hàn Quộc được giới trẻ khắp nơi hào hứng làm theo" src="http://thumb.connect360.vn/unsafe/600x0/imgs.emdep.vn/Share/Image/2017/05/30/meo-to-son-tran-moi-221925782.jpg" /></p>
<p>
	Thoạt đầu nh&igrave;n tr&ocirc;ng như bạn bị lem son ra ngo&agrave;i viền m&ocirc;i nhưng c&aacute;ch t&ocirc; son tr&agrave;n m&ocirc;i gi&uacute;p đ&ocirc;i m&ocirc;i trở n&ecirc;n đầy đặn, nhẹ nh&agrave;ng như n&agrave;ng thơ vậy. Đ&ocirc;i m&ocirc;i bạn sẽ trở n&ecirc;n quyến rũ, sexy kh&oacute; cưỡng. C&aacute;c m&agrave;u son nổi bật như cam, đỏ hồng, đỏ cực kỳ hợp với c&aacute;ch t&ocirc; son tr&agrave;n m&ocirc;i.</p>
<p>
	Đ&ocirc;i m&ocirc;i nh&ograve;e son kết hợp l&agrave;n da trong veo, nhẹ nh&agrave;ng kh&ocirc;ng b&oacute;ng dầu, chuốt mascara to tr&ograve;n tr&ocirc;ng bạn tựa như thi&ecirc;n thần bước ra từ truyện cổ t&iacute;ch vậy. Nũng nịu, cưng chiều kh&oacute; cưỡng!</p>
<p>
	T&ocirc; son kiểu ombre</p>
<p>
	<img alt="Điểm lại những mốt tô son Hàn Quộc được giới trẻ khắp nơi hào hứng làm theo" src="http://thumb.connect360.vn/unsafe/460x0/imgs.emdep.vn/Share/Image/2017/05/30/cach-to-son-ombre-221855701.jpg" /></p>
<p>
	<a href="http://emdep.vn/trang-diem/to-son-tran-moi-long-moi-hay-ombre-mot-trang-diem-han-quoc-duoc-gioi-tre-khap-noi-hao-hung-lam-theo-20170530221601878.htm" target="_blank"><img alt="tô son kiểu hàn" src="http://thumb.connect360.vn/unsafe/460x0/imgs.emdep.vn/Share/Image/2017/05/30/to-son-ombre-221855723.png" /></a></p>
<p>
	Kiểu t&ocirc; son với phần trong đậm, viền m&ocirc;i nhạt được nhiều sao h&agrave;n ưa chuộng. Chị em cũng kh&ocirc;ng bỏ lỡ để đu theo kiểu l&agrave;m đẹp n&agrave;y.</p>
<p>
	Với kiểu t&ocirc; son viền m&ocirc;i nhạt, l&ograve;ng đậm tr&ocirc;ng đ&ocirc;i m&ocirc;i bạn đỏ ửng, đ&aacute;ng y&ecirc;u m&agrave; vẫn giữ được n&eacute;t tự nhi&ecirc;n cho đ&ocirc;i m&ocirc;i. Nh&igrave;n đ&ocirc;i m&ocirc;i như vậy, c&oacute; ch&agrave;ng n&agrave;o m&agrave; cưỡng lại được kh&ocirc;ng?</p>
', 1, 2)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (96, N'Son ba màu - xu hướng mỹ phẩm đẹp, độc, lạ', N'2017_05_31_23_46_33_9075-141308221.jpg', N' (Em đẹp) - Son ba màu là sự giao hòa tuyệt vời của dòng son tint và son dưỡng bởi chúng lên màu tự nhiên và dưỡng môi mềm mịn. ', CAST(N'2017-05-31 00:00:00.000' AS DateTime), 5, N'<div>
	<p>
		Kiểu trang điểm t&ocirc; son l&ograve;ng m&ocirc;i đ&atilde; xuất hiện tại H&agrave;n Quốc trong khoảng 10 năm nhưng đến nay tr&agrave;o lưu n&agrave;y vẫn được giới trẻ đ&oacute;n nhận. Để&nbsp; c&oacute; được phong c&aacute;ch n&agrave;y, bạn cần thực hiện rất nhiều thao t&aacute;c cầu kỳ. Nhưng với sự xuất hiện của son ba m&agrave;u &ndash; loại son giao h&ograve;a của d&ograve;ng son tint v&agrave; son dưỡng, chị em sẽ c&oacute; được được đ&ocirc;i m&ocirc;i hồng h&agrave;o tự nhi&ecirc;n m&agrave; kh&ocirc;ng hề tốn thời gian như trước.</p>
	<p>
		Son ba m&agrave;u l&agrave; g&igrave;?</p>
	<p>
		<img alt="son-ba-mau" src="http://xinhcangay.com/imageservice/Images/GetImage?iid=325360&amp;size=800x797" /></p>
	<p>
		Son ba m&agrave;u (Triple Shot Lipstick) l&agrave; loại son thỏi, gồm 3 m&agrave;u sắc trong 1 thỏi v&agrave; được sắp xếp theo thứ tự t&ocirc;ng m&agrave;u đậm dần. Nhờ đ&oacute;, n&oacute; c&oacute; thể tạo th&agrave;nh kiểu t&ocirc; son l&ograve;ng m&ocirc;i một c&aacute;ch nhanh ch&oacute;ng. Ngo&agrave;i việc tạo hiệu ứng chuyển m&agrave;u rất tự nhi&ecirc;n, 3 lớp m&agrave;u trong thỏi son đều c&oacute; t&aacute;c dụng ri&ecirc;ng:</p>
	<p>
		<img alt="" src="http://xinhcangay.com/imageservice/Images/GetImage?iid=325361&amp;size=800x510" /></p>
	<p>
		Lớp m&agrave;u ch&iacute;nh: C&oacute; t&aacute;c dụng l&ecirc;n m&agrave;u v&agrave; chứa th&agrave;nh phần dưỡng nhẹ</p>
	<p>
		Lớp dưỡng m&agrave;u: Dưỡng ẩm v&agrave; tạo sự chuyển m&agrave;u tự nhi&ecirc;n.</p>
	<p>
		Lớp base: Gi&uacute;p ho&agrave; hợp m&agrave;u m&ocirc;i với m&agrave;u da, gi&uacute;p m&ocirc;i s&aacute;ng, mềm mại.</p>
	<p>
		Xuất xứ</p>
	<p>
		Son ba m&agrave;u xuất hiện lần đầu ti&ecirc;n tại H&agrave;n Quốc từ giữa năm 2014 nhưng tới đầu năm nay mới bắt đầu nở rộ th&agrave;nh tr&agrave;o lưu. Hiện nay, ngo&agrave;i H&agrave;n Quốc, Th&aacute;i Lan v&agrave; ch&acirc;u &Acirc;u cũng bắt đầu giới thiệu d&ograve;ng sản phẩm n&agrave;y với nhiều phi&ecirc;n bản kh&aacute;c nhau.</p>
	<p>
		<img alt="" src="http://xinhcangay.com/imageservice/Images/GetImage?iid=325362&amp;size=800x800" /></p>
	<p>
		Điểm chung của c&aacute;c thỏi son 3 m&agrave;u l&agrave; ở cấu tạo. Ch&uacute;ng đều c&oacute; kiểu d&aacute;ng trẻ trung, ph&ugrave; hợp với mọi c&ocirc; n&agrave;ng.</p>
	<p>
		L&yacute; do giới trẻ chuộng son ba m&agrave;u</p>
	<p>
		Nhờ sự kết hợp tuyệt vời của d&ograve;ng son dưỡng c&oacute; độ dưỡng cao v&agrave; son tint tạo n&eacute;t hồng h&agrave;o tự nhi&ecirc;n cho đ&ocirc;i m&ocirc;i n&ecirc;n kiểu son n&agrave;y rất ph&ugrave; hợp với những c&ocirc; n&agrave;ng trẻ trung, y&ecirc;u th&iacute;ch phong c&aacute;ch l&agrave;m đẹp nhanh, gọn, đẹp.</p>
	<p>
		<img alt="" src="http://xinhcangay.com/imageservice/Images/GetImage?iid=325363&amp;size=640x800" /></p>
	<p>
		Khi d&ugrave;ng son ba m&agrave;u, bạn c&oacute; thể bỏ qua bước t&ocirc; son dưỡng m&agrave; m&ocirc;i vẫn kh&ocirc;ng bị kh&ocirc; như khi d&ugrave;ng son lỳ, son kem hay son s&aacute;p th&ocirc;ng thường. Chỉ chưa đầy một ph&uacute;t, đ&ocirc;i m&ocirc;i bạn đ&atilde; trở n&ecirc;n tươi tắn, mềm mịn.</p>
	<p>
		<img alt="" src="http://xinhcangay.com/imageservice/Images/GetImage?iid=325364&amp;size=554x800" /></p>
	<p>
		Ngo&agrave;i ra, l&yacute; do gi&aacute; cả kh&aacute; mềm cũng l&agrave; yếu tố loại son độc đ&aacute;o n&agrave;y b&ugrave;ng nổ. Chỉ với 200.000 - 300.000 đồng, bạn đ&atilde; sở hữu ngay một thỏi son ba m&agrave;u chất lượng, an to&agrave;n cho da.</p>
	<p>
		<img alt="" src="http://xinhcangay.com/imageservice/Images/GetImage?iid=325365&amp;size=800x700" /></p>
	<p>
		Sự phong ph&uacute; về m&agrave;u son cũng l&agrave; yếu tố quan trọng khiến giới trẻ m&ecirc; mệt d&ograve;ng son n&agrave;y. Trong đ&oacute;, những t&ocirc;ng trẻ trung như đỏ nhạt, hồng, cam... được ưa chuộng nhất bởi rất dễ phối v&aacute;y &aacute;o.</p>
	<p>
		C&aacute;ch d&ugrave;ng son ba m&agrave;u</p>
	<p>
		Khi t&ocirc; son ba m&agrave;u, bạn n&ecirc;n ch&uacute; &yacute; hướng thỏi son sao cho lớp base chạm v&agrave;o viền m&ocirc;i v&agrave; lớp m&agrave;u ch&iacute;nh ở vị tr&iacute; l&ograve;ng m&ocirc;i.</p>
	<p>
		<img alt="" src="http://xinhcangay.com/imageservice/Images/GetImage?iid=325366&amp;size=800x800" /></p>
	<p>
		Một lưu &yacute; nữa l&agrave; trước khi t&ocirc; son c&aacute;c n&agrave;ng n&ecirc;n ch&uacute; &yacute; l&agrave;m sạch tế b&agrave;o chết tr&ecirc;n m&ocirc;i để son c&oacute; thể&nbsp;l&ecirc;n m&agrave;u chuẩn&nbsp;nhất.</p>
</div>
<p>
	&nbsp;</p>
', 1, 2)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (97, N'Tự làm phấn nước cushion cực đơn giản', N'2017_05_31_23_47_41_539cushion1-wordpress-130332383.jpg', N' (Emdep.vn) - Bạn có thể hòa theo trào lưu cushion đang gây sốt toàn châu Á mà không cần tốn quá nhiều tiền vì cách tự làm phấn nước đơn giản đến không ngờ! ', CAST(N'2017-05-31 00:00:00.000' AS DateTime), 1, N'<div>
	Cơn sốt phấn nước - cushion đang &quot;c&agrave;n qu&eacute;t&quot; khắp ch&acirc;u &Aacute; với khởi nguồn từ c&aacute;c bộ phim H&agrave;n Quốc v&agrave; tiếp tục được nh&acirc;n rộng nhờ sự quảng b&aacute; của c&aacute;c ng&ocirc;i sao, thần tượng v&agrave; blogger l&agrave;m đẹp. Phấn nước cushion được ph&aacute;i đẹp ch&acirc;u &Aacute; y&ecirc;u th&iacute;ch nhờ sự mỏng mịn tự nhi&ecirc;n v&agrave; nhiều c&ocirc;ng dụng được t&iacute;ch hợp chỉ trong một bước trang điểm. Tuy nhi&ecirc;n, phấn nước cushion cũng khiến người ti&ecirc;u d&ugrave;ng phải nhăn mặt v&igrave; gi&aacute; th&agrave;nh cao ngất ngưởng, từ 600.000 VNĐ đến 1.500.000 VNĐ một hộp c&oacute; khối lượng kh&aacute; nhỏ, chỉ khoảng 15-20g/mỗi hộp.&nbsp;</div>
<div>
	&nbsp;
	<div>
		<img src="http://thumb.connect360.vn/unsafe/0x0/imgs.emdep.vn/Share/Image/2014/11/27/cushion1-wordpress-130332383.jpg" /></div>
	<div>
		(Ảnh: wordpress).</div>
</div>
<div>
	&nbsp;</div>
<div>
	Với những t&iacute;n đồ l&agrave;m đẹp th&ocirc;ng th&aacute;i, kh&ocirc;ng kh&oacute; để nhận ra rằng t&iacute;nh năng mỏng mịn v&agrave; vẫn dưỡng ẩm tốt</div>
<div>
	của phấn nước cushion thực chất kh&ocirc;ng phải nằm trong c&ocirc;ng thức b&iacute; mật của chất kem, m&agrave; lại đến từ ch&iacute;nh kết cấu đệm m&uacute;t gi&uacute;p ph&acirc;n t&aacute;n đều lượng kem v&agrave; tạo độ ẩm mịn cho kem khi thoa l&ecirc;n mặt. Ch&iacute;nh v&igrave; thế, ch&uacute;ng ta ho&agrave;n to&agrave;n c&oacute; thể tự l&agrave;m cho m&igrave;nh một hộp phấn nước cushion v&ocirc; c&ugrave;ng đơn giản với những nguy&ecirc;n vật liệu dễ kiếm, chi ph&iacute; cực thấp v&agrave; c&ograve;n c&oacute; thể t&ugrave;y chỉnh chất kem theo sở th&iacute;ch v&agrave; nhu cầu của m&igrave;nh.</div>
<div>
	&nbsp;</div>
<div>
	+ Nguy&ecirc;n liệu:</div>
<div>
	&nbsp;
	<div>
		<img src="http://thumb.connect360.vn/unsafe/0x0/imgs.emdep.vn/Share/Image/2014/11/27/diycushion1-130424097.jpg" /></div>
</div>
<div>
	&nbsp;</div>
<div>
	- Một miếng m&uacute;t đ&aacute;nh kem, chọn&nbsp;loại mỏng, thật mềm v&agrave; thật xốp. Bạn c&oacute; thể mua c&aacute;c loại m&uacute;t tại c&aacute;c</div>
<div>
	tiệm b&aacute;n mỹ phẩm hoặc tạp h&oacute;a với gi&aacute; chỉ từ 10.000/ miếng.</div>
<div>
	- B&aacute;t v&agrave; th&igrave;a nhựa để trộn kem.</div>
<div>
	- Hộp đựng: Bạn c&oacute; thể tận dụng hộp phấn cũ đ&atilde; d&ugrave;ng hết (phải được rửa sạch v&agrave; lau kh&ocirc;) hoặc mua hộp phấn rỗng tại c&aacute;c trang web b&aacute;n vỏ hộp v&agrave; nguy&ecirc;n liệu mỹ phẩm handmade.</div>
<div>
	- Cồn 90%.</div>
<div>
	- C&aacute;c th&agrave;nh phần để trộn kem trang điểm:</div>
<div>
	+ Kem dưỡng ẩm&nbsp;m&agrave; bạn đang d&ugrave;ng, n&ecirc;n d&ugrave;ng loại kem dưỡng ban ng&agrave;y.</div>
<div>
	+ Serum hoặc tinh chất (essence) m&agrave; bạn đang d&ugrave;ng.</div>
<div>
	+ Kem chống nắng m&agrave; bạn đang d&ugrave;ng.</div>
<div>
	+ C&aacute;c loại kem nền/bb cream/ cc cream m&agrave; bạn đang d&ugrave;ng, c&oacute; thể kết hợp nhiều loại hoặc chỉ một loại m&agrave; bạn th&iacute;ch nhất.</div>
<div>
	+ C&oacute; thể th&ecirc;m một ch&uacute;t kem l&oacute;t c&oacute; nhũ nếu bạn muốn phấn nước của m&igrave;nh c&oacute; độ bắt s&aacute;ng.</div>
<div>
	&nbsp;</div>
<div>
	+ Thực hiện:</div>
<div>
	&nbsp;</div>
<div>
	- Cho c&aacute;c th&agrave;nh phần kem dưỡng v&agrave; kem nền n&oacute;i tr&ecirc;n v&agrave;o b&aacute;t để trộn đều. T&ugrave;y v&agrave;o độ dưỡng v&agrave; độ che phủ m&agrave; bạn mong muốn m&agrave; t&ugrave;y chỉnh tỉ lệ c&aacute;c th&agrave;nh phần với nhau. V&iacute; dụ, bạn muốn tận dụng độ che phủ tốt từ BB cream nhưng muốn kết hợp CC cream để khắc phục vấn đề xuống t&ocirc;ng g&acirc;y xỉn m&agrave;u của BB cream th&igrave; trộn với tỷ lệ 1 BB : 1 CC. Khi trộn kem ch&uacute; &yacute; sao cho tổng lượng kem chỉ đựng đầy khoảng 1/3 hoặc 1/2 hộp đựng.</div>
<div>
	&nbsp;
	<div>
		<img src="http://thumb.connect360.vn/unsafe/0x0/imgs.emdep.vn/Share/Image/2014/11/27/diycushion2-130445828.jpg" /></div>
</div>
<div>
	&nbsp;</div>
<div>
	&nbsp;</div>
<div>
	- Cắt miếng m&uacute;t trang điểm cho vừa với hộp đựng. Đổ một &iacute;t cồn v&agrave;o b&aacute;t v&agrave; đặt miếng m&uacute;t v&agrave;o đ&oacute; để s&aacute;t khuẩn ho&agrave;n to&agrave;n, sau đ&oacute; vắt kiệt cho miếng m&uacute;t thật kh&ocirc;.</div>
<div>
	&nbsp;
	<div>
		<img src="http://thumb.connect360.vn/unsafe/0x0/imgs.emdep.vn/Share/Image/2014/11/27/diycushion3-130545065.jpg" /></div>
</div>
<div>
	&nbsp;</div>
<div>
	- Đặt miếng m&uacute;t đ&atilde; kh&ocirc; v&agrave;o b&aacute;t đựng kem đ&atilde; trộn, lật miếng m&uacute;t qua lại nhiều lần cho miếng m&uacute;t thấm hết phần kem trong b&aacute;t, sau đ&oacute; đặt miếng m&uacute;t v&agrave;o trong hộp đựng.</div>
<div>
	&nbsp;
	<div>
		<img src="http://thumb.connect360.vn/unsafe/0x0/imgs.emdep.vn/Share/Image/2014/11/27/diycushion4-130609932.jpg" /></div>
	<p>
		Hộp phấn nước của bạn đ&atilde; ho&agrave;n th&agrave;nh. Mỗi khi trang điểm, bạn chỉ cần ấn nhẹ v&agrave;o miếng m&uacute;t l&agrave; phấn nước sẽ thấm l&ecirc;n một lớp rất mỏng.</p>
	<p>
		&nbsp;</p>
</div>
<div>
	&nbsp;
	<div>
		<img src="http://thumb.connect360.vn/unsafe/0x0/imgs.emdep.vn/Share/Image/2014/11/27/diycushion5-130631694.jpg" /></div>
	Để c&oacute; hiệu quả tốt nhất, bạn n&ecirc;n mua miếng m&uacute;t trang điểm chuy&ecirc;n dụng cho phấn nước (air puff), thường c&oacute; một mặt m&agrave;u xanh, b&aacute;n tại c&aacute;c showroom mỹ phẩm H&agrave;n Quốc ch&iacute;nh h&atilde;ng với gi&aacute; khoảng 90.000 VNĐ hoặc mua tại c&aacute;c cửa h&agrave;ng b&aacute;n mỹ phẩm H&agrave;n Quốc x&aacute;ch tay với gi&aacute; từ 45.000 VNĐ.</div>
<div>
	&nbsp;
	<div>
		<img src="http://thumb.connect360.vn/unsafe/0x0/imgs.emdep.vn/Share/Image/2014/11/27/cushion2-caramabes-130651584.jpg" /></div>
	<div>
		(Ảnh: caramabes).</div>
	<br />
	&nbsp;</div>
<div>
	Với hộp phấn nước tự chế n&agrave;y, bạn sẽ thấy chất kem được t&aacute;n mỏng nhẹ, mềm mịn kh&ocirc;ng k&eacute;m g&igrave; c&aacute;c loại phấn nước đắt tiền, m&agrave; lại hội tụ đủ c&aacute;c c&ocirc;ng dụng dưỡng da, chống nắng, t&ocirc;ng m&agrave;u v&agrave; độ che phủ được t&ugrave;y chỉnh theo đ&uacute;ng nhu cầu của bạn.&nbsp;</div>
<div>
	&nbsp;
	<div>
		<img src="http://thumb.connect360.vn/unsafe/0x0/imgs.emdep.vn/Share/Image/2014/11/27/cushion3-viviangan-130732565.jpg" /></div>
	<div>
		(Ảnh: viviangan).</div>
	<div>
		&nbsp;</div>
</div>
<div>
	Eve Nguyễn</div>
<p>
	(Tổng hợp)</p>
', 1, 2)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (98, N'Tự chế "mặt nạ" cho tóc siêu mượt', N'2017_05_31_23_48_28_9185d4-loai-u-toc-tu-che-dau-oliu-trung-emdep.jpg', N' (Emdep.vn) - Ai bảo chỉ có mặt mới cần đến mặt nạ. Bạn đã biết cách tạo mặt nạ để biến những "cọng rơm" xơ xác thành suối tóc suôn mềm chưa? ', CAST(N'2017-05-31 00:00:00.000' AS DateTime), 3, N'<header>
	<h1>
		6 loại mặt nạ tự chế gi&uacute;p t&oacute;c su&ocirc;n mượt tự nhi&ecirc;n</h1>
	<ul>
		<li>
			15:45 03/10/2013</li>
	</ul>
</header>
<ul>
	<li data-customize="true" data-href="http://news.zing.vn/zingnews-post357487.html?utm_source=zalo&amp;utm_medium=zalomsg&amp;utm_campaign=zingdesktop" data-layout="icon-text" data-oaid="4564080408575020426">
		&nbsp;</li>
	<li>
		&nbsp;</li>
	<li>
		&nbsp;</li>
	<li>
		1</li>
</ul>
<p>
	Ph&aacute;i đẹp sẽ c&oacute; một suối t&oacute;c b&oacute;ng mượt như &yacute; nếu chăm chỉ đắp mặt nạ tự nhi&ecirc;n từ những nguy&ecirc;n liệu si&ecirc;u rẻ v&agrave; rất an to&agrave;n.</p>
<div>
	<p>
		Một m&aacute;i t&oacute;c d&agrave;i &oacute;ng ả, su&ocirc;n mượt tự nhi&ecirc;n lu&ocirc;n l&agrave; mong ước của tất cả c&aacute;c bạn g&aacute;i. Tuy nhi&ecirc;n, việc &eacute;p, duỗi hay sử dụng ho&aacute; chất sẽ khiến m&aacute;i t&oacute;c của bạn bị xơ, rụng v&agrave; mất đi sự b&oacute;ng mượt vốn c&oacute;.</p>
	<p>
		Th&ecirc;m v&agrave;o đ&oacute;, bạn c&ograve;n phải chịu những t&aacute;c động kh&ocirc;ng tốt tới sức khoẻ khi tiếp x&uacute;c với những ho&aacute; chất độc hại.</p>
	<p>
		V&igrave; thế, h&atilde;y bớt ch&uacute;t thời gian để chuẩn bị một v&agrave;i loại &ldquo;thần dược&rdquo; d&agrave;nh cho g&oacute;c con người của m&igrave;nh trong những ng&agrave;y tiết trời ẩm ương.</p>
	<p>
		Tr&ecirc;n thực tế, những nguy&ecirc;n liệu tự nhi&ecirc;n &ldquo;ngon, bổ, rẻ&rdquo; cho m&aacute;i t&oacute;c c&oacute; sẵn xung quanh bạn. Điều bạn cần ch&iacute;nh l&agrave; thời gian v&agrave; sự ki&ecirc;n nhẫn để lặp đi lặp lại qu&aacute; tr&igrave;nh chăm s&oacute;c t&oacute;c &iacute;t nhất 2 lần/tuần.</p>
	<p>
		Ki&ecirc;n tr&igrave; đầu tư một ch&uacute;t thời gian v&agrave; c&ocirc;ng sức, m&aacute;i t&oacute;c sẽ trở n&ecirc;n su&ocirc;n mượt khiến bạn muốn bu&ocirc;ng t&oacute;c m&atilde;i th&ocirc;i.</p>
	<p>
		Nước cốt dừa v&agrave; cốt chanh</p>
	<p>
		Nước cốt dừa l&agrave; một trong những &ldquo;người bạn&rdquo; th&acirc;n thiết của m&aacute;i t&oacute;c su&ocirc;n mượt. Để tăng hiệu quả khi sử dụng loại dung dịch n&agrave;y, c&aacute;c bạn g&aacute;i n&ecirc;n kết hợp th&ecirc;m với nước cốt chanh.</p>
	<table>
		<tbody>
			<tr>
				<td>
					<img alt="6 loai mat na tu che giup toc suon muot tu nhien hinh anh 1" src="http://znews-photo-td.zadn.vn/w660/Uploaded/cqxrcajwp/2013_10_03/daugoitrirungtoctudauduavanuoccotchanh3.jpg" /></td>
			</tr>
			<tr>
				<td>
					Th&ecirc;m một v&agrave;i giọt chanh tươi v&agrave;o nước cốt dừa sẽ tạo n&ecirc;n một hỗn hợp ho&agrave;n hảo cho m&aacute;i t&oacute;c d&agrave;i su&ocirc;n mượt. Ảnh minh hoạ.</td>
			</tr>
		</tbody>
	</table>
	<p>
		Trộn đều hỗn hợp dung dịch cốt dừa v&agrave; chanh rồi cho v&agrave;o tủ lạnh trong v&agrave;i giờ cho tới khi tr&ecirc;n bề mặt hỗn hợp tạo th&agrave;nh một lớp kem mềm như dầu xả.</p>
	<p>
		Lấy phần kem n&agrave;y thoa đều l&ecirc;n t&oacute;c, nhẹ nh&agrave;ng xoa b&oacute;p rồi quấn t&oacute;c lại bằng khăng n&oacute;ng.</p>
	<p>
		Chờ &iacute;t nhất 1 giờ để t&oacute;c c&oacute; thể hấp thụ tốt nhất những dưỡng chất cần thiết từ dừa v&agrave; chanh. Sau đ&oacute; xả sạch t&oacute;c v&agrave; gội lại đầu bằng một loại dầu gọi dịu nhẹ.</p>
	<p>
		Nhẹ nh&agrave;ng l&acirc;u kh&ocirc; m&aacute;i t&oacute;c của m&igrave;nh v&agrave; cảm nhận sự kh&aacute;c biệt của m&aacute;i t&oacute;c.</p>
	<p>
		Dầu dừa v&agrave; dầu &ocirc;liu</p>
	<table>
		<tbody>
			<tr>
				<td>
					<img alt="6 loai mat na tu che giup toc suon muot tu nhien hinh anh 2" src="http://znews-photo-td.zadn.vn/w660/Uploaded/cqxrcajwp/2013_10_03/Regularhotoiltreatment.jpg" title="6 loại mặt nạ tự chế giúp tóc suôn mượt tự nhiên hình ảnh 2" /></td>
			</tr>
		</tbody>
	</table>
	<p>
		Hỗn hợp dầu dừa v&agrave; &ocirc;liu hoặc dầu dừa v&agrave; hạnh nh&acirc;n cũng l&agrave; &ldquo;thần dược&rdquo; bổ sung dinh dưỡng cho m&aacute;i t&oacute;c, gi&uacute;p t&oacute;c thẳng v&agrave; su&ocirc;n mượt.</p>
	<p>
		Thường xuy&ecirc;n xoa &ldquo;dầu xả&rdquo; kể tr&ecirc;n l&ecirc;n t&oacute;c, nhẹ nh&agrave;ng m&aacute;txa, xoa b&oacute;p, ủ lại bằng khăn n&oacute;ng trong khoảng 45 ph&uacute;t rồi xả sạch bằng dầu gội dịu nhẹ.</p>
	<p>
		Sữa tươi kh&ocirc;ng đường</p>
	<p>
		Khi nhắc tới những sản phẩm trong bếp rất hữu &iacute;ch đối với m&aacute;i t&oacute;c d&agrave;i, su&ocirc;n mượt, bạn kh&ocirc;ng thể kh&ocirc;ng nhắc tới sữa.</p>
	<p>
		H&atilde;y đổ sữa v&agrave;o b&igrave;nh xịt v&agrave; phun l&ecirc;n m&aacute;i t&oacute;c của bạn. Chờ trong khoảng 30 ph&uacute;t để cho t&oacute;c hấp thụ sữa. Sau đ&oacute; gội sạch v&agrave; cảm nhận sự kh&aacute;c biệt.</p>
	<p>
		Sữa v&agrave; mật ong</p>
	<table>
		<tbody>
			<tr>
				<td>
					<img alt="6 loai mat na tu che giup toc suon muot tu nhien hinh anh 3" src="http://znews-photo-td.zadn.vn/w660/Uploaded/cqxrcajwp/2013_10_03/Milkandhoneyforhair1.jpg" /></td>
			</tr>
		</tbody>
	</table>
	<p>
		Pha th&ecirc;m một &iacute;t mật ong v&agrave;o sữa để tạo n&ecirc;n một hỗn hợp sền sệt d&ugrave;ng để đắp l&ecirc;n t&oacute;c. Để tăng th&ecirc;m hiệu quả cho loại mặt nạ n&agrave;y, h&atilde;y nghiền th&ecirc;m d&acirc;u t&acirc;y hay chuối v&agrave; đ&aacute;nh đều với dung dịch kể tr&ecirc;n.</p>
	<p>
		Đắp l&ecirc;n t&oacute;c v&agrave; chờ đợi trong khoảng nửa giờ rồi gội sạch. M&aacute;i t&oacute;c của bạn sẽ thay đổi ngo&agrave;i sức tưởng tượng nếu chủ nh&acirc;n của n&oacute; chịu kh&oacute; đầu tư.</p>
	<p>
		Dầu &ocirc;liu v&agrave; trứng</p>
	<p>
		Bạn g&aacute;i n&agrave;o cũng biết dầu &ocirc;liu v&agrave; trứng l&agrave; những sản phẩm tự nhi&ecirc;n kh&ocirc;ng thể thiếu trong việc chăm s&oacute;c t&oacute;c. Thế nhưng c&aacute;c bạn c&oacute; biết rằng hỗn hợp của hai dung dịch n&agrave;y sẽ tạo n&ecirc;n một điều kỳ diệu tr&ecirc;n m&aacute;i t&oacute;c của bạn?</p>
	<table>
		<tbody>
			<tr>
				<td>
					<img alt="6 loai mat na tu che giup toc suon muot tu nhien hinh anh 4" src="http://znews-photo-td.zadn.vn/w660/Uploaded/cqxrcajwp/2013_10_03/Oliveoilwithegg.jpg" title="6 loại mặt nạ tự chế giúp tóc suôn mượt tự nhiên hình ảnh 4" /></td>
			</tr>
		</tbody>
	</table>
	<p>
		Trộn đều hai quả trứng g&agrave; với một lượng dầu &ocirc;liu vừa đủ rồi đắp l&ecirc;n m&aacute;i t&oacute;c của bạn. Chờ &iacute;t nhất trong 1 tiếng rồi gội lại với dầu gội dịu nhẹ. M&aacute;i t&oacute;c của bạn sẽ mềm mại, su&ocirc;n mượt như vừa đi hấp t&oacute;c tại spa vậy.</p>
	<p>
		Chuối v&agrave; mật ong</p>
	<p>
		Bạn c&oacute; biết chuối chứa rất nhiều kali, vitamin B6 v&agrave; c&aacute;c dưỡng chất tạo độ ẩm v&agrave; b&oacute;ng cho m&aacute;i t&oacute;c? Nếu muốn sở hữu một m&aacute;i t&oacute;c d&agrave;y, su&ocirc;n mượt, ngo&agrave;i việc thường xuy&ecirc;n ăn loại hoa quả n&agrave;y, c&aacute;c bạn g&aacute;i c&ograve;n n&ecirc;n tự chế th&ecirc;m mặt nạ, dầu xả cho t&oacute;c từ chuối.</p>
	<p>
		Tuy theo độ d&agrave;i ngắn của t&oacute;c m&agrave; bạn nghiền nhuyễn từ 1-2 quả chuối, sau đ&oacute; trộn đều với sữa tươi kh&ocirc;ng đường, nước cốt dừa hoặc mật &ocirc;ng.</p>
	<p>
		Thoa hỗn hợp n&agrave;y l&ecirc;n t&oacute;c trong v&ograve;ng 20 ph&uacute;t rồi gội lại nhẹ nh&agrave;ng. Bạn phải ki&ecirc;n tr&igrave; v&agrave; thực hiện &iacute;t nhất 2 lần/tuần để đạt được hiệu quả như &yacute;.</p>
</div>
<p>
	&nbsp;</p>
', 1, 2)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (99, N'Giá vàng giao dịch quanh mốc 33 triệu đồng/lượng', N'2017_05_31_23_49_55_506gia-vang-5-091930148.jpg', N' (Emdep.vn) - Giá vàng hôm nay 30/5/2017 giao dịch quanh mốc 33 triệu đồng/lượng, giá vàng thế giới đi lên. ', CAST(N'2017-05-31 00:00:00.000' AS DateTime), 5, N'<div id="cotent_detail">
	<div>
		Tin tức cập nhật gi&aacute; v&agrave;ng mới nhất, v&agrave;ng SJC giao dịch quanh mốc 33,14 triệu đồng/lượng (mua v&agrave;o) - 33,38 triệu đồng/lượng (b&aacute;n ra). Như vậy, gi&aacute; v&agrave;ng trong nước đ&atilde; giảm 10.000 đồng/lượng so với mức 33,15 triệu đồng/lượng (mua v&agrave;o) - 33,39 triệu đồng/lượng (b&aacute;n ra) c&ugrave;ng thời điểm h&ocirc;m qua.<br />
		Cụ thể, tại thị trường H&agrave; Nội, gi&aacute; v&agrave;ng SJC giao dịch quanh mốc 33,14 triệu đồng/lượng (mua v&agrave;o) - 33,38 triệu đồng/lượng (b&aacute;n ra). Tại thị trường TP.HCM, gi&aacute; v&agrave;ng SJC s&aacute;ng nay ni&ecirc;m yết ở mức 33,14 triệu đồng/lượng (mua v&agrave;o) - 33,36 triệu đồng/lượng (b&aacute;n ra).</div>
	<div>
		<div data-src="http://cdn.kinhtedothi.vn/mfiles/data/2015/11/810303CF/vang.jpg" data-sub-html="&lt;div class=''sapo_slide''&gt;&lt;/div&gt;">
			<a> <img src="http://cdn.kinhtedothi.vn/mfiles/data/2015/11/810303CF/vang.jpg" /> </a></div>
	</div>
	<div>
		&nbsp;</div>
	<div>
		Tin nhanh, gi&aacute; v&agrave;ng SJC tại tập đo&agrave;n Doji tại H&agrave; Nội v&agrave; TP.HCM thời điểm 8 giờ 30 s&aacute;ng nay lần lượt giao dịch ở mức 33,28 triệu đồng/lượng (mua v&agrave;o), ở mức 33,33 triệu đồng/lượng (b&aacute;n ra) v&agrave; 33,26 triệu đồng/lượng (mua v&agrave;o), ở mức 33,32 triệu đồng/lượng (b&aacute;n ra).<br />
		Trong khi đ&oacute;, gi&aacute; v&agrave;ng SJC giao dịch tại một số ng&acirc;n h&agrave;ng như Vietinbank Gold l&agrave; 33,14 triệu đồng/lượng (mua v&agrave;o) v&agrave; 33,38 triệu đồng/lượng (b&aacute;n ra); TPBank Gold l&agrave; 33,28 triệu đồng/lượng (mua v&agrave;o) v&agrave; 33,33 triệu đồng/lượng (b&aacute;n ra).<br />
		Thị trường v&agrave;ng thế giới, gi&aacute; v&agrave;ng giao tr&ecirc;n s&agrave;n Kitco thời điểm 6 giờ 30 s&aacute;ng nay (theo giờ Việt Nam) đang đứng tại 1.083,90 USD/ounce. Như vậy, từ đầu th&aacute;ng 11 đến nay, gi&aacute; v&agrave;ng đ&atilde; giảm hơn 5% sau khi b&aacute;o c&aacute;o việc l&agrave;m th&aacute;ng 10 khả thi hơn dự kiến đ&atilde; l&agrave;m tăng dự đo&aacute;n Cục Dự trữ Li&ecirc;n bang Mỹ (FED) n&acirc;ng l&atilde;i suất trong phi&ecirc;n họp ch&iacute;nh s&aacute;ch v&agrave;o cuối năm nay.<br />
		Nhiều người dự đo&aacute;n gi&aacute; v&agrave;ng tuần tới sẽ phục hồi về mặt kỹ thuật. Thep kết quả khảo s&aacute;t của Kitco với 25 người l&agrave; nh&agrave; đầu tư, chuy&ecirc;n gia ph&acirc;n t&iacute;ch về gi&aacute; v&agrave;ng tuần tới, kết quả cho thấy 13 người nhận định gi&aacute; tăng, c&ograve;n 6 người cho rằng gi&aacute; v&agrave;ng giảm v&agrave; cũng chừng đ&oacute; người nhận định gi&aacute; v&agrave;ng kh&ocirc;ng thay đổi.</div>
</div>
<p>
	&nbsp;</p>
', 1, 5)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (100, N'Trải nghiệm chuyển vùng quốc tế rẻ "như ở nhà"', N'2017_05_31_23_51_05_403mobifone-123840177.jpg', N' (Emdep.vn) - Từ ngày 1/9/2016, MobiFone tiếp tục triển khai gói cước ưu đãi Roam Like Home. ', CAST(N'2017-05-31 00:00:00.000' AS DateTime), 3, N'<p>
	G&oacute;i cước DataRoam Like Home l&agrave; một trong những bước đột ph&aacute; đi đầu của mạng MobiFone trong nỗ lực đưa Dịch vụ Chuyển v&ugrave;ng quốc tế (CVQT) tới gần hơn với người sử dụng th&ocirc;ng qua mức gi&aacute; tiệm cận nội địa.</p>
<p>
	L&agrave; một th&ocirc;ng dịch vi&ecirc;n c&ocirc;ng t&aacute;c tại c&ocirc;ng ty nước ngo&agrave;i, chị Nga thường xuy&ecirc;n phải đi c&ocirc;ng t&aacute;c sang Nhật Bản v&agrave; H&agrave;n Quốc. C&oacute; th&aacute;ng chị Nga đi tới 4-5 lần. V&igrave; hay phải xa nh&agrave; như vậy, điện thoại trở n&ecirc;n v&ocirc; c&ugrave;ng quan trọng đối với chị để giữ li&ecirc;n lạc với người th&acirc;n, đặc biệt l&agrave; với c&ocirc; con g&aacute;i b&eacute; nhỏ của chị ở nh&agrave;. Ng&agrave;y trước cứ đến s&acirc;n bay, chị Nga lại phải tất tả đi t&igrave;m cửa h&agrave;ng b&aacute;n SIM thẻ điện thoại nội địa, l&agrave;m thủ tục khai b&aacute;o rồi lại th&aacute;o SIM cũ ra, lắp SIM mới v&agrave;o. Sau đ&oacute; chị lại phải t&igrave;m nơi c&oacute; Wifi để kết nối Viber với chồng v&agrave; con g&aacute;i. C&aacute;c thao t&aacute;c tưởng chừng đơn giản nhưng đ&ocirc;i khi mang đến kh&ocirc;ng &iacute;t phiền to&aacute;i đối với chị. Thế nhưng từ ng&agrave;y MobiFone cung cấp g&oacute;i cước CVQT DataRoam Like Home cho ph&eacute;p kh&aacute;ch h&agrave;ng sử dụng Dịch vụ Data với gi&aacute; cước kh&ocirc;ng kh&aacute;c nhiều so với gi&aacute; nội địa, chị Nga đ&atilde; kh&ocirc;ng c&ograve;n phải lo th&aacute;o lắp SIM rồi mua thẻ nạp như trước đ&acirc;y.&nbsp;</p>
<div>
	<table>
		<tbody>
			<tr>
				<td>
					<img alt="Gói cước chuyển vùng quốc tế giá rẻ “ như ở nhà” tại Nhật Bản và Hàn Quốc ảnh 1" data-photo-original-="" src="http://image.laodong.com.vn/w440/uploaded/phongkinhdoanh/2016_11_28/1_megv.jpg" /></td>
			</tr>
			<tr>
				<td>
					&nbsp;</td>
			</tr>
		</tbody>
	</table>
</div>
<p>
	Theo đ&oacute;, từ giữa th&aacute;ng 10/2016 đến hết 31/12/2016, g&oacute;i cước &ldquo;DataRoam Like Home&rdquo; được MobiFone triển khai tại hai nước Nhật Bản v&agrave; H&agrave;n Quốc với Dịch vụ CVQT Data/Internet. Chỉ với 150.000 đồng, kh&aacute;ch h&agrave;ng sẽ c&oacute; ngay 250 MB Data sử dụng trong v&ograve;ng 01 ng&agrave;y kể từ thời điểm đăng k&yacute;. Dung lượng Data n&agrave;y đảm bảo cho nhu cầu lướt Web, Email hay sử dụng c&aacute;c ứng dụng mạng x&atilde; hội kh&ocirc;ng thể thiếu của người d&ugrave;ng. Chị Nga chia sẻ: &ldquo;G&oacute;i cước DataRoam Like Home tiện lợi thật. T&ocirc;i kh&ocirc;ng phải vất vả thay SIM như trước đ&acirc;y m&agrave; vừa tiết kiệm được chi ph&iacute;&rdquo;.</p>
<p>
	G&oacute;i cước DataRoam Like Home l&agrave; một trong những bước đột ph&aacute;, đi đầu của mạng MobiFone trong nỗ lực đưa Dịch vụ CVQT tới gần hơn với người sử dụng th&ocirc;ng qua mức gi&aacute; tiệm cận nội địa. Để đăng k&yacute; g&oacute;i cước, thu&ecirc; bao c&oacute; thể soạn tin nhắn với c&uacute; ph&aacute;p &ldquo;DK_DH1&rdquo; (g&oacute;i cước tại Nhật Bản) hoặc &ldquo;DK_DH2&rdquo; (g&oacute;i cước tại H&agrave;n Quốc) gửi 999. C&aacute;ch thứ 2 l&agrave; bấm *093*4*4*1# v&agrave; lựa chọn g&oacute;i cước.</p>
<p>
	Ngo&agrave;i ra, g&oacute;i cước DataRoam Like Home c&ograve;n gi&uacute;p kh&aacute;ch h&agrave;ng tr&aacute;nh ph&aacute;t sinh cước cao ngo&agrave;i &yacute; muốn th&ocirc;ng qua biện ph&aacute;p quản l&yacute; v&agrave; cảnh b&aacute;o kịp thời. &nbsp;Khi hết dung lượng g&oacute;i cước, MobiFone sẽ ngắt tạm thời dịch vụ v&agrave; nhắn tin th&ocirc;ng b&aacute;o nhằm gi&uacute;p kh&aacute;ch h&agrave;ng c&oacute; thể chủ động kiểm so&aacute;t chi ph&iacute; v&agrave; y&ecirc;n t&acirc;m hơn khi sử dụng dịch vụ. B&ecirc;n cạnh đ&oacute;, trong qu&aacute; tr&igrave;nh sử dụng, kh&aacute;ch h&agrave;ng c&oacute; thể kiểm tra dung lượng c&ograve;n lại của g&oacute;i cước bằng c&aacute;ch soạn tin nhắn gửi tổng đ&agrave;i hoặc bấm m&atilde; USSD.</p>
<p>
	Đại diện Trung t&acirc;m Viễn th&ocirc;ng Quốc tế MobiFone cho biết: &ldquo;Trong thời đại hội nhập kinh tế thế giới như hiện nay, xu hướng chung của c&aacute;c nh&agrave; mạng l&agrave; x&acirc;y dựng gi&aacute; cước CVQT tiệm cận với gi&aacute; nội địa, mang đến cho kh&aacute;ch h&agrave;ng những trải nghiệm tốt nhất khi đi nước ngo&agrave;i. Bắt kịp xu thế n&agrave;y, MobiFone đ&atilde; kh&ocirc;ng ngừng hợp t&aacute;c với c&aacute;c nh&agrave; mạng quốc tế, nghi&ecirc;n cứu v&agrave; ph&aacute;t triển c&aacute;c g&oacute;i cước gi&aacute; rẻ, c&aacute;c tiện &iacute;ch CVQT l&agrave;m h&agrave;i l&ograve;ng nhu cầu người sử dụng&rdquo;.</p>
', 1, 5)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (101, N'Dân mạng sướng rơn vì trời Hà Nội đã mưa sau những ngày nắng nóng kỷ lục', N'2017_06_06_22_31_25_57mua6-160056064.jpg', N' (Emdep.vn) - Sau những ngày Hà Nội nắng nóng như thiêu đốt, cho đến gần 16h chiều nay, Hà Nội bắt đầu đón những cơn mưa dông đầu tiên hiếm hoi. ', CAST(N'2017-06-06 00:00:00.000' AS DateTime), 0, N'<p>
	Từ khoảng 15h30, trời H&agrave; Nội bắt đầu c&oacute; nhiều m&acirc;y đen k&eacute;o đến khắp bầu trời. Tuy nhi&ecirc;n, kh&ocirc;ng kh&iacute; vẫn c&ograve;n rất oi ả. Đến khoảng 13h40 ph&uacute;t, H&agrave; Nội bắt đầu đ&oacute;n những cơn mưa nhỏ đầu ti&ecirc;n.</p>
<p>
	D&ugrave; cơn mưa chiều nay kh&ocirc;ng to nhưng những giọt mưa hiếm hoi sau những ng&agrave;y nắng n&oacute;ng cũng đ&atilde; phần n&agrave;o gi&uacute;p cả th&agrave;nh phố hạ hỏa những ng&agrave;y nắng như hỏa l&ograve;.</p>
<p>
	Ch&iacute;nh v&igrave; qu&aacute; mong ng&oacute;ng cơn mưa đến suốt cả ng&agrave;y h&ocirc;m nay n&ecirc;n khi trời đổ mưa, cư d&acirc;n mạng đặc biệt th&iacute;ch th&uacute; v&agrave; phấn kh&iacute;ch. Họ li&ecirc;n tiếp cập nhật những d&ograve;ng trạng th&aacute;i cũng như h&igrave;nh ảnh về cơn mưa ở ngay nơi m&igrave;nh cư tr&uacute; khiến cho facebook chiều nay trở n&ecirc;n rộn r&agrave;ng hơn.</p>
<p>
	<img alt="Dân mạng sướng rơn vì trời Hà Nội đã mưa sau những ngày nắng nóng kỷ lục" src="http://thumb.connect360.vn/unsafe/503x0/imgs.emdep.vn/Share/Image/2017/06/06/mua1-160055549.jpg" /></p>
<p>
	<img alt="Dân mạng sướng rơn vì trời Hà Nội đã mưa sau những ngày nắng nóng kỷ lục" src="http://thumb.connect360.vn/unsafe/486x0/imgs.emdep.vn/Share/Image/2017/06/06/mua6-160056064.jpg" /></p>
<p>
	<img alt="Dân mạng sướng rơn vì trời Hà Nội đã mưa sau những ngày nắng nóng kỷ lục" src="http://thumb.connect360.vn/unsafe/488x0/imgs.emdep.vn/Share/Image/2017/06/06/mua5-160056579.jpg" /></p>
<p>
	<img alt="Dân mạng sướng rơn vì trời Hà Nội đã mưa sau những ngày nắng nóng kỷ lục" src="http://thumb.connect360.vn/unsafe/496x0/imgs.emdep.vn/Share/Image/2017/06/06/mua4-160057093.jpg" /></p>
<p>
	&nbsp;</p>
<p>
	<img alt="Dân mạng sướng rơn vì trời Hà Nội đã mưa sau những ngày nắng nóng kỷ lục" src="http://thumb.connect360.vn/unsafe/484x0/imgs.emdep.vn/Share/Image/2017/06/06/mua2-160058123.jpg" /></p>
<p>
	<img alt="Dân mạng sướng rơn vì trời Hà Nội đã mưa sau những ngày nắng nóng kỷ lục" src="http://thumb.connect360.vn/unsafe/481x0/imgs.emdep.vn/Share/Image/2017/06/06/mua7-160328835.jpg" /></p>
<p>
	<img alt="Dân mạng sướng rơn vì trời Hà Nội đã mưa sau những ngày nắng nóng kỷ lục" src="http://thumb.connect360.vn/unsafe/489x0/imgs.emdep.vn/Share/Image/2017/06/06/mua8-160329334.jpg" /></p>
<p>
	<img alt="Dân mạng sướng rơn vì trời Hà Nội đã mưa sau những ngày nắng nóng kỷ lục" src="http://thumb.connect360.vn/unsafe/486x0/imgs.emdep.vn/Share/Image/2017/06/06/mua10-160329849.png" /></p>
<p>
	Theo Trung t&acirc;m Dự b&aacute;o Kh&iacute; tượng Thủy văn Trung ương, hiện nay (6/6), r&atilde;nh &aacute;p thấp c&oacute; trục v&agrave;o khoảng 22-24 độ vĩ Bắc tiếp tục bị n&eacute;n bởi &aacute;p cao lục địa ở ph&iacute;a Bắc. V&igrave; thế, do ảnh hưởng của r&atilde;nh &aacute;p thấp bị n&eacute;n bởi &aacute;p cao lục địa n&ecirc;n h&ocirc;m nay (6/6) v&agrave; ng&agrave;y mai (7/6) ở Bắc Bộ c&oacute; mưa r&agrave;o v&agrave; d&ocirc;ng.</p>
<p>
	Ri&ecirc;ng khu vực H&agrave; Nội từ chiều v&agrave; đ&ecirc;m nay nay c&oacute; mưa vừa, c&oacute; nơi mưa to v&agrave; gi&ocirc;ng. Trong cơn gi&ocirc;ng c&oacute; khả năng xảy ra tố, lốc v&agrave; gi&oacute; giật mạnh. Nhiệt độ thấp nhất từ 26-29 độ C, cao nhất từ 32-35 độ C.</p>
<p>
	<img alt="Dân mạng sướng rơn vì trời Hà Nội đã mưa sau những ngày nắng nóng kỷ lục" src="http://thumb.connect360.vn/unsafe/700x0/imgs.emdep.vn/Share/Image/2017/06/06/189850919779461190152111290659709n-162023352.jpg" /></p>
<p>
	<img alt="Dân mạng sướng rơn vì trời Hà Nội đã mưa sau những ngày nắng nóng kỷ lục" src="http://thumb.connect360.vn/unsafe/485x0/imgs.emdep.vn/Share/Image/2017/06/06/mua13-160609468.jpg" /></p>
<p>
	<img alt="Dân mạng sướng rơn vì trời Hà Nội đã mưa sau những ngày nắng nóng kỷ lục" src="http://thumb.connect360.vn/unsafe/486x0/imgs.emdep.vn/Share/Image/2017/06/06/mua12-160609734.jpg" /></p>
<p>
	<a href="http://emdep.vn/nhip-song/dan-mang-suong-ron-vi-troi-ha-noi-da-mua-sau-nhung-ngay-nang-nong-ky-luc-2017060615515201.htm" target="_blank"><img alt="mưa rào" src="http://thumb.connect360.vn/unsafe/487x0/imgs.emdep.vn/Share/Image/2017/06/06/mua11-160610248.jpg" /></a></p>
', 1, 4)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (102, N'Nắng nóng, hàng nước mía, trà chanh thu lợi cả triệu đồng/ngày', N'2017_06_06_22_33_31_502photo1496675-140405019.jpg', N' (Emdep.vn) - Vào những ngày hè nóng nực, trà đá, trà chanh cũng trở thành địa điểm tụ tập của đông đảo của người dân Hà Nội. Tuy chỉ là những hàng quán bình dân, nhưng nhờ lượng khách tăng đột biến, ', CAST(N'2017-06-06 00:00:00.000' AS DateTime), 2, N'<p>
	Nắng n&oacute;ng tại H&agrave; Nội những ng&agrave;y qua khiến cho c&aacute;c loại đồ uống giải kh&aacute;t như Tr&agrave; đ&aacute;, nước m&iacute;a, tr&agrave; chanh, &hellip; đắt kh&aacute;ch.</p>
<p>
	V&agrave;o những ng&agrave;y h&egrave; n&oacute;ng nực, tr&agrave; đ&aacute;, tr&agrave; chanh cũng sẽ trở th&agrave;nh địa điểm tập trung của người đ&ocirc;ng đảo của người H&agrave; Nội. Only những người b&igrave;nh d&acirc;n, nhưng với số lượng lớn c&aacute;c biến tăng, n&ecirc;n qu&aacute;n c&oacute; thể kiếm được h&agrave;ng triệu đồng mỗi ng&agrave;y.</p>
<div>
	<figcaption> </figcaption>
	<p>
		Trong ng&agrave;y 3/6 &ndash; một trong những ng&agrave;y được đ&aacute;nh gi&aacute; l&agrave; <a href="http://soha.vn/nang-nong.html" target="_blank" title="nắng nóng"> nắng n&oacute;ng </a> nhất tại H&agrave; Nội từ đầu đến nay, những ch&egrave; đ&aacute;, tr&agrave; chanh từ 7h tối đ&atilde; đ&ocirc;ng Nghẹt người</p>
	<p>
		<img alt="" src="http://www.stardarpan.com/uploads/WebImg/201603/1457753826106106-gannekeras.jpg" style="width: 450px; height: 257px;" /></p>
	<p>
		Gi&aacute; mỗi cốc tr&agrave; đ&aacute; được b&aacute;n với mức gi&aacute; từ 3.000 &ndash; 5.000 đồng. The mức kh&ocirc;ng tăng so với ng&agrave;y thường. Tuy nhi&ecirc;n, theo một qu&aacute;n c&agrave; ph&ecirc; ở khu vực Ng&atilde; Tư Sở, đến 10h tối qua, bạn đ&atilde; b&aacute;n được gần 500 ly đ&aacute; cẩm thạch, chưa hướng hương v&agrave; ăn hoa quả k&egrave;m theo, gần như l&agrave; thu h&uacute;t gần 2 triệu đồng cho 3 giờ l&agrave;m việc</p>
	<p>
		Do you believe this day, những ng&agrave;y nắng n&oacute;ng, thường thường đ&ocirc;ng gấp đ&ocirc;i, gấp ba ng&agrave;y thường.</p>
	<p>
		C&aacute;c loại ch&egrave; chanh, ch&egrave; quất, nước m&iacute;a cũng l&agrave; đồ uống đắt tiền trong những ng&agrave;y nắng n&oacute;ng n&agrave;y. Mỗi loại nước uống c&oacute; gi&aacute; dao động từ 10.000 &ndash; 12.000 đồng / cốc, mức kh&ocirc;ng tăng so với ng&agrave;y thường.</p>
	<p>
		D&ugrave; gi&aacute; kh&ocirc;ng tăng nhưng số lượng kh&aacute;ch tăng đột biến đ&atilde; khiến cho c&aacute;c qu&aacute;n c&agrave; ph&ecirc; c&oacute; thu nhập tăng l&ecirc;n đến cả triệu đồng / ng&agrave;y</p>
	<p>
		Chị Mến, chủ một xe nước m&iacute;a ở Hồ Đền Lừ cho biết: &quot;Từ l&uacute;c nắng đến nay, trung b&igrave;nh mỗi ng&agrave;y b&aacute;n được 100 cốc, mỗi th&ugrave;ng 10.000 đồng, t&iacute;nh mỗi ng&agrave;y cũng kiếm được Hơn 1 triệu đồng &quot;</p>
	<p>
		Theo lộ tr&igrave;nh của Nam &ndash; một qu&aacute;n tr&agrave; ở Ng&atilde; Tư Sở, trong những ng&agrave;y qua anh kiếm kh&ocirc;ng dưới 5 triệu đồng / ng&agrave;y khi b&aacute;n tr&agrave; chanh với gi&aacute; 8.000 đồng / cốc, k&egrave;m theo hạt hướng Positive with approx 10000 of / disk.</p>
	<p>
		Từ khoảng 7h tối đi, khu vực n&agrave;y thường xuy&ecirc;n chật k&iacute;n người, chủ yếu l&agrave; c&aacute;c bạn trẻ, học sinh, sinh vi&ecirc;n. Họ đến đ&acirc;y để uống ch&egrave; chanh, sấu v&agrave; đ&aacute; hạt nh&acirc;n v&agrave; c&ugrave;ng với nhau, &quot;ch&eacute;m gi&oacute;&quot; với bạn b&egrave;</p>
	<p>
		&quot;Mỗi ng&agrave;y ch&uacute;ng ta h&atilde;y đ&oacute;n khoảng tr&ecirc;n 500 kh&aacute;ch, c&oacute; ng&agrave;y h&ocirc;m đ&oacute; trở l&ecirc;n với một người m&agrave; t&ocirc;i kh&ocirc;ng cần đến m&aacute;y t&iacute;nh, n&ecirc;n bạn phải thu&ecirc; th&ecirc;m nh&acirc;n vi&ecirc;n chạy b&agrave;n c&ugrave;ng người mua xe cho kh&aacute;ch&quot;, anh Nam Cho biết th&ecirc;m</p>
	<p>
		Ngay qu&aacute;n c&agrave; ph&ecirc; Nam, chị Mai cũng lu&ocirc;n đ&ocirc;ng kh&aacute;ch, đặc biệt l&agrave; từ 8h tối</p>
	<p>
		Chị Mai cũng cho biết, mỗi tối c&oacute; thể b&aacute;n được từ 200-300 cốc nước m&iacute;a, nhiều triệu đồng</p>
	<p>
		Chị Mai nhầm t&iacute;nh: &quot;Mỗi c&acirc;y c&oacute; gi&aacute; từ 12.000 &ndash; 15.000 đồng, cộng th&ecirc;m một đường nước v&agrave; nhiều đ&aacute;, t&ocirc;i pha chế được tối thiểu 3 cốc nước m&iacute;a b&aacute;n với gi&aacute; 10.000 đồng / cốc. Sau khi trừ tất cả c&aacute;c chi ph&iacute;, h&atilde;y thử m&iacute;a đ&aacute; 1 vốn 3 lời. C&oacute; những ng&agrave;y đ&ocirc;ng, t&ocirc;i kiếm khoảng 4 &ndash; 5 triệu đồng &quot;</p>
</div>
<p>
	&nbsp;</p>
', 1, 4)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (103, N'Khấp khởi đợi mưa dông chưa thấy, người lao động oằn mình mưu sinh trên ''chảo lửa''', N'2017_06_06_22_35_12_184img20170605101758-101914427.jpg', N'Khấp khởi đợi mưa dông chưa thấy, người lao động oằn mình mưu sinh trên ''chảo lửa''', CAST(N'2017-06-06 00:00:00.000' AS DateTime), 4, N'<p>
	Mấy ng&agrave;y nay, trận nắng n&oacute;ng kỷ lục trải khắp miền Bắc đ&atilde; l&agrave;m đảo lộn cuộc sống của nhiều người d&acirc;n. T&iacute;nh đến ng&agrave;y h&ocirc;m nay, đợt nắng n&oacute;ng đ&atilde; k&eacute;o d&agrave;i đến ng&agrave;y thứ 5. Tại H&agrave; Nội, cơn nắng n&oacute;ng kỷ lục khiến hai người tử vong khi đang đi tr&ecirc;n đường v&igrave; sốc nhiệt.</p>
<p>
	<img alt="Hà Nội: Ngỡ có mưa, người lao động vẫn trườn mình trên “chảo lửa”" src="http://thumb.connect360.vn/unsafe/600x0/imgs.emdep.vn/Share/Image/2017/06/06/img20170605101758-101914427.jpg" /></p>
<p>
	Nắng như đổ lửa, người đi đường trở th&agrave;nh Ninja.</p>
<p>
	Nắng n&oacute;ng như thi&ecirc;u đốt khiến ai cũng mong ng&oacute;ng 1 cơn mưa d&ocirc;ng bất ngờ k&eacute;o đến. Theo Trung t&acirc;m dự b&aacute;o kh&iacute; tượng thủy văn, từ đ&ecirc;m nay đến rạng s&aacute;ng mai, khi r&atilde;nh thấp bị n&eacute;n bởi kh&ocirc;ng kh&iacute; lạnh xuống gần nước ta, c&aacute;c tỉnh v&ugrave;ng n&uacute;i, trung du Bắc Bộ sẽ c&oacute; mưa r&agrave;o rải r&aacute;c v&agrave; c&oacute; d&ocirc;ng.&nbsp;</p>
<p>
	Điều n&agrave;y l&agrave;m nhiều người lầm tưởng h&ocirc;m nay, họ sẽ được đ&oacute;n nhận những cơn mưa d&ocirc;ng để xoa dịu những ng&agrave;y oi bức, nắng như đổ lửa vừa qua. Nhưng cho đến thời điểm n&agrave;y, sức n&oacute;ng mặc d&ugrave; đ&atilde; c&oacute; dấu hiệu giảm nhiệt nhưng c&aacute;i oi ả th&igrave; vẫn c&ograve;n nguy&ecirc;n.&nbsp;</p>
<p>
	Với những người lao động trong nh&agrave; hoặc ở nơi c&oacute; quạt m&aacute;t, điều h&ograve;a sẽ bớt ngột ngạt hơn nhiều so với những người lao động tay ch&acirc;n đang phải g&ograve; lưng chịu trận trực tiếp từ trận n&oacute;ng kỷ lục n&agrave;y.</p>
<p>
	<img alt="Hà Nội: Ngỡ có mưa, người lao động vẫn trườn mình trên “chảo lửa”" src="http://thumb.connect360.vn/unsafe/600x0/imgs.emdep.vn/Share/Image/2017/06/06/img20170605080539-101607242.jpg" /></p>
<p>
	Một số phụ nữ lao động tự bịt khẩu trang v&agrave; &aacute;o chống &nbsp;nắng k&iacute;n m&iacute;t đang đứng chờ đợi người đến gọi thu&ecirc; l&agrave;m.</p>
<p>
	&nbsp;Theo anh Nguyễn Văn Luyện, một thợ c&ocirc;ng tr&igrave;nh đang thi c&ocirc;ng tại dự &aacute;n x&acirc;y dựng tr&ecirc;n đường Nguyễn Cảnh Dị cho biết: &quot;Mấy ng&agrave;y h&ocirc;m nắng n&oacute;ng qu&aacute;, với ch&uacute;ng t&ocirc;i, l&agrave;m việc ngo&agrave;i trời giống như địa ngục vậy. B&igrave;nh thường khi đi l&agrave;m t&ocirc;i chỉ mặc chiếc &aacute;o ph&ocirc;ng cộc tay b&ecirc;n trong, b&ecirc;n ngo&agrave;i kho&aacute;c &aacute;o bảo hộ lao động.</p>
<p>
	Mấy h&ocirc;m nay nắng đến nỗi, t&ocirc;i phải thay chiếc &aacute;o ph&ocirc;ng mỏng b&ecirc;n trong bằng chiếc &aacute;o lao động d&agrave;i tay, sau đ&oacute; kho&aacute;c &aacute;o bảo hộ, nhưng nắng vẫn xi&ecirc;n ch&aacute;y d&aacute;t người&quot;.</p>
<p>
	V&igrave; thời tiết nắng như thế n&ecirc;n anh Luyện cho biết, c&ocirc;ng trường đ&atilde; phải thay đổi lịch l&agrave;m việc. B&igrave;nh thường thời gian buổi s&aacute;ng bắt đầu từ 7h đến 11h trưa. Chiều từ 13h30 đến 17h. Nhưng thời tiết nắng như chảo lửa thế n&agrave;y kh&ocirc;ng thể giữ lịch l&agrave;m việc cũ được.</p>
<p>
	<img alt="Khấp khởi đợi mưa dông chưa thấy, người lao động oằn mình mưu sinh trên ''chảo lửa''" src="http://thumb.connect360.vn/unsafe/700x0/imgs.emdep.vn/Share/Image/2017/06/06/muu-sinh-trong-11545505.JPG" /></p>
<p>
	<img alt="Khấp khởi đợi mưa dông chưa thấy, người lao động oằn mình mưu sinh trên ''chảo lửa''" src="http://thumb.connect360.vn/unsafe/700x0/imgs.emdep.vn/Share/Image/2017/06/06/mat-duong-115454551.jpg" /></p>
<p>
	Hiện, c&ocirc;ng trường chỗ anh Luyện đ&atilde; thay đổi lịch l&agrave;m việc sớm hơn. Buổi s&aacute;ng bắt đầu từ 5h30 đến 11h. Buổi chiều phải l&ugrave;i thời gian xuống 15h30 đến 19h.</p>
<p>
	D&ugrave; đ&atilde; l&ugrave;i lịch l&agrave;m muộn hơn rất nhiều so với trước nhưng sức nắng của mặt trời chiếu từ trưa đến chiều theo anh Luyện vẫn rất khủng khiếp. Ngo&agrave;i c&ocirc;ng trường hầm hập như l&ograve; b&aacute;t qu&aacute;i, những thanh sắt th&eacute;p cũng n&oacute;ng đến bỏng tay người l&agrave;m d&ugrave; đều đeo gang tay bảo hộ.</p>
<p>
	&quot;Mấy h&ocirc;m nắng n&oacute;ng, d&ugrave; to&agrave;n c&ocirc;ng nh&acirc;n trong độ tuổi thanh ni&ecirc;n nhưng do l&agrave;m việc tại c&ocirc;ng trường n&ecirc;n chỗ t&ocirc;i c&oacute; kh&aacute; nhiều c&ocirc;ng nh&acirc;n bị say nắng. Khi say nắng, họ lại v&agrave;o văn ph&ograve;ng nằm nghỉ hoặc nghỉ ngơi tại chỗ c&oacute; b&oacute;ng r&acirc;m. Ai cũng nhắc nhau phải l&agrave;m việc cầm chừng, vừa l&agrave;m vừa nghe ng&oacute;ng cơ thể để tr&aacute;nh bị sốc nhiệt.&quot;, anh Luyện cho biết.</p>
<p>
	<img alt="Hà Nội: Ngỡ có mưa, người lao động vẫn trườn mình trên “chảo lửa”" src="http://thumb.connect360.vn/unsafe/600x0/imgs.emdep.vn/Share/Image/2017/06/06/img20170605103805-10200402.jpg" /></p>
<p>
	<img alt="Hà Nội: Ngỡ có mưa, người lao động vẫn trườn mình trên “chảo lửa”" src="http://thumb.connect360.vn/unsafe/600x0/imgs.emdep.vn/Share/Image/2017/06/06/img20170605103615-101859467.jpg" /></p>
<p>
	Cơn n&oacute;ng hầm hập từ dưới nền b&ecirc; t&ocirc;ng hấp l&ecirc;n, nhưng người lao động vẫn cố gắng kiếm sống.</p>
<p>
	Tại c&aacute;c bến b&atilde;i, mặc d&ugrave; trời nắng n&oacute;ng như đổ lửa nhưng những người khu&acirc;n v&aacute;c thu&ecirc; vẫn v&igrave; miếng cơm manh &aacute;o phải oằn m&igrave;nh l&agrave;m việc mưu sinh giữa ng&agrave;y nắng oi bức.</p>
<p>
	&Ocirc;ng Trần Văn Thanh (45 tuổi, Ba V&igrave;, H&agrave; Nội) l&agrave;m nghề khu&acirc;n v&aacute;c tại bến xe Mỹ Đ&igrave;nh gần 4 năm nay. Chia sẻ về c&ocirc;ng việc thời điểm hiện tại, &ocirc;ng lắc đầu ng&aacute;n ngẩm: &quot;C&oacute; thời điểm một số năm trước, thời tiết l&ecirc;n đến gần 40 độ nhưng kh&ocirc;ng k&eacute;o d&agrave;i như thế n&agrave;y. Năm nay ch&uacute;ng t&ocirc;i mới thấy thời tiết khắc nghiệt hơn hẳn mọi năm. C&ocirc;ng việc của t&ocirc;i ở đ&acirc;y th&igrave; vất vả, trời oi bức như n&agrave;y c&agrave;ng ngột ngạt v&agrave; mất sức hơn. Nhưng biết hưng l&agrave;m thế n&agrave;o được. T&iacute;nh chất c&ocirc;ng việc đ&atilde; vậy rồi, phải cố gắng th&ocirc;i&quot;.</p>
<p>
	<img alt="Hà Nội: Ngỡ có mưa, người lao động vẫn trườn mình trên “chảo lửa”" src="http://thumb.connect360.vn/unsafe/600x0/imgs.emdep.vn/Share/Image/2017/06/06/img20170605103820-102134063.jpg" /></p>
<p>
	Ở c&aacute;c bến b&atilde;i, những người khu&acirc;n v&aacute;c ng&agrave;y noi bức c&oacute; việc nhiều hơn nhưng cũng đuối sức v&igrave; nắng.</p>
<p>
	Theo &ocirc;ng Thanh, v&agrave;o những ng&agrave;y nắng n&oacute;ng, tuy &ocirc;ng c&oacute; nhiều việc để l&agrave;m hơn ng&agrave;y thường nhưng cũng rất mệt mỏi khi mưu sinh phục vụ kh&aacute;ch ng&agrave;y n&agrave;y.</p>
<p>
	&quot;V&agrave;o những ng&agrave;y r&acirc;m m&aacute;t, kh&aacute;ch h&agrave;ng người ta tiếc tiền m&agrave; kh&ocirc;ng thu&ecirc; người bốc v&aacute;c vận chuyển h&agrave;ng, h&agrave;nh l&yacute; từ trong bến ra ngo&agrave;i bến. Nhưng thời tiết n&agrave;y, ai cũng mệt n&ecirc;n họ c&oacute; phần ngại hơn. V&igrave; vậy họ vẫy v&agrave; thu&ecirc; ch&uacute;ng t&ocirc;i nhiều hơn. Ch&uacute;ng t&ocirc;i c&oacute; th&ecirc;m cơ hội việc l&agrave;m nhưng l&agrave;m nhiều cũng oải v&agrave; đuối sức lắm&quot;, &ocirc;ng Thanh t&acirc;m sự.</p>
<p>
	<img alt="Hà Nội: Ngỡ có mưa, người lao động vẫn trườn mình trên “chảo lửa”" src="http://thumb.connect360.vn/unsafe/600x0/imgs.emdep.vn/Share/Image/2017/06/06/img20170605104039-102144889.jpg" /></p>
<p>
	<img alt="Hà Nội: Ngỡ có mưa, người lao động vẫn trườn mình trên “chảo lửa”" src="http://thumb.connect360.vn/unsafe/600x0/imgs.emdep.vn/Share/Image/2017/06/06/img20170605104120-102152627.jpg" /></p>
<p>
	Cũng theo &ocirc;ng Thanh v&agrave; nhiều người lao động ngh&egrave;o kh&aacute;c, qua theo d&otilde;i dự b&aacute;o thời tiết thấy h&ocirc;m nay c&oacute; mưa. V&igrave; thế, s&aacute;ng ra trời dịu hơn, &ocirc;ng Thanh đ&atilde; khấp khởi mừng đi l&agrave;m. Nhưng kh&ocirc;ng ngờ, thời tiết ngo&agrave;i trời đ&atilde; giảm nhiệt nhưng oi bức khiến ai cũng kh&oacute; chịu.</p>
<p>
	&quot;Mọi người lại động vi&ecirc;n nhau l&agrave;m cố nốt h&ocirc;m nay tr&ecirc;n chảo lửa oi bức rồi ng&agrave;y mai sẽ được tận hưởng những cơn mưa d&ocirc;ng m&aacute;t mẻ. Chưa l&uacute;c n&agrave;o, ch&uacute;ng t&ocirc;i lại mong mưa về như những ng&agrave;y n&agrave;y&quot;, &ocirc;ng Thanh mệt mỏi n&oacute;i.</p>
', 1, 4)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (104, N'Cuối cùng thủ đô Hà Nội đã có mưa sau những ngày vật vã vì nắng nóng', N'2017_06_06_22_37_02_510photo-1-1496728452997-133828338.jpg', N' (Emdep.vn) - Sau đợt nóng kinh điển kéo dài 5 ngày qua, ngày 6/6, thủ đô Hà Nội đã đón cơn mưa giải nhiệt đầu tiên. ', CAST(N'2017-06-06 00:00:00.000' AS DateTime), 1, N'<p>
	Mấy ng&agrave;y nay, trận nắng n&oacute;ng kỷ lục trải khắp miền Bắc đ&atilde; l&agrave;m đảo lộn cuộc sống của nhiều người d&acirc;n. T&iacute;nh đến ng&agrave;y h&ocirc;m nay, đợt nắng n&oacute;ng đ&atilde; k&eacute;o d&agrave;i đến ng&agrave;y thứ 5. Tại H&agrave; Nội, cơn nắng n&oacute;ng kỷ lục khiến hai người tử vong khi đang đi tr&ecirc;n đường v&igrave; sốc nhiệt.</p>
<p>
	<img alt="Hà Nội: Ngỡ có mưa, người lao động vẫn trườn mình trên “chảo lửa”" src="http://thumb.connect360.vn/unsafe/600x0/imgs.emdep.vn/Share/Image/2017/06/06/img20170605101758-101914427.jpg" /></p>
<p>
	Nắng như đổ lửa, người đi đường trở th&agrave;nh Ninja.</p>
<p>
	Nắng n&oacute;ng như thi&ecirc;u đốt khiến ai cũng mong ng&oacute;ng 1 cơn mưa d&ocirc;ng bất ngờ k&eacute;o đến. Theo Trung t&acirc;m dự b&aacute;o kh&iacute; tượng thủy văn, từ đ&ecirc;m nay đến rạng s&aacute;ng mai, khi r&atilde;nh thấp bị n&eacute;n bởi kh&ocirc;ng kh&iacute; lạnh xuống gần nước ta, c&aacute;c tỉnh v&ugrave;ng n&uacute;i, trung du Bắc Bộ sẽ c&oacute; mưa r&agrave;o rải r&aacute;c v&agrave; c&oacute; d&ocirc;ng.&nbsp;</p>
<p>
	Điều n&agrave;y l&agrave;m nhiều người lầm tưởng h&ocirc;m nay, họ sẽ được đ&oacute;n nhận những cơn mưa d&ocirc;ng để xoa dịu những ng&agrave;y oi bức, nắng như đổ lửa vừa qua. Nhưng cho đến thời điểm n&agrave;y, sức n&oacute;ng mặc d&ugrave; đ&atilde; c&oacute; dấu hiệu giảm nhiệt nhưng c&aacute;i oi ả th&igrave; vẫn c&ograve;n nguy&ecirc;n.&nbsp;</p>
<p>
	Với những người lao động trong nh&agrave; hoặc ở nơi c&oacute; quạt m&aacute;t, điều h&ograve;a sẽ bớt ngột ngạt hơn nhiều so với những người lao động tay ch&acirc;n đang phải g&ograve; lưng chịu trận trực tiếp từ trận n&oacute;ng kỷ lục n&agrave;y.</p>
<p>
	<img alt="Hà Nội: Ngỡ có mưa, người lao động vẫn trườn mình trên “chảo lửa”" src="http://thumb.connect360.vn/unsafe/600x0/imgs.emdep.vn/Share/Image/2017/06/06/img20170605080539-101607242.jpg" /></p>
<p>
	Một số phụ nữ lao động tự bịt khẩu trang v&agrave; &aacute;o chống &nbsp;nắng k&iacute;n m&iacute;t đang đứng chờ đợi người đến gọi thu&ecirc; l&agrave;m.</p>
<p>
	&nbsp;Theo anh Nguyễn Văn Luyện, một thợ c&ocirc;ng tr&igrave;nh đang thi c&ocirc;ng tại dự &aacute;n x&acirc;y dựng tr&ecirc;n đường Nguyễn Cảnh Dị cho biết: &quot;Mấy ng&agrave;y h&ocirc;m nắng n&oacute;ng qu&aacute;, với ch&uacute;ng t&ocirc;i, l&agrave;m việc ngo&agrave;i trời giống như địa ngục vậy. B&igrave;nh thường khi đi l&agrave;m t&ocirc;i chỉ mặc chiếc &aacute;o ph&ocirc;ng cộc tay b&ecirc;n trong, b&ecirc;n ngo&agrave;i kho&aacute;c &aacute;o bảo hộ lao động.</p>
<p>
	Mấy h&ocirc;m nay nắng đến nỗi, t&ocirc;i phải thay chiếc &aacute;o ph&ocirc;ng mỏng b&ecirc;n trong bằng chiếc &aacute;o lao động d&agrave;i tay, sau đ&oacute; kho&aacute;c &aacute;o bảo hộ, nhưng nắng vẫn xi&ecirc;n ch&aacute;y d&aacute;t người&quot;.</p>
<p>
	V&igrave; thời tiết nắng như thế n&ecirc;n anh Luyện cho biết, c&ocirc;ng trường đ&atilde; phải thay đổi lịch l&agrave;m việc. B&igrave;nh thường thời gian buổi s&aacute;ng bắt đầu từ 7h đến 11h trưa. Chiều từ 13h30 đến 17h. Nhưng thời tiết nắng như chảo lửa thế n&agrave;y kh&ocirc;ng thể giữ lịch l&agrave;m việc cũ được.</p>
<p>
	<img alt="Khấp khởi đợi mưa dông chưa thấy, người lao động oằn mình mưu sinh trên ''chảo lửa''" src="http://thumb.connect360.vn/unsafe/700x0/imgs.emdep.vn/Share/Image/2017/06/06/muu-sinh-trong-11545505.JPG" /></p>
<p>
	<img alt="Khấp khởi đợi mưa dông chưa thấy, người lao động oằn mình mưu sinh trên ''chảo lửa''" src="http://thumb.connect360.vn/unsafe/700x0/imgs.emdep.vn/Share/Image/2017/06/06/mat-duong-115454551.jpg" /></p>
<p>
	Hiện, c&ocirc;ng trường chỗ anh Luyện đ&atilde; thay đổi lịch l&agrave;m việc sớm hơn. Buổi s&aacute;ng bắt đầu từ 5h30 đến 11h. Buổi chiều phải l&ugrave;i thời gian xuống 15h30 đến 19h.</p>
<p>
	D&ugrave; đ&atilde; l&ugrave;i lịch l&agrave;m muộn hơn rất nhiều so với trước nhưng sức nắng của mặt trời chiếu từ trưa đến chiều theo anh Luyện vẫn rất khủng khiếp. Ngo&agrave;i c&ocirc;ng trường hầm hập như l&ograve; b&aacute;t qu&aacute;i, những thanh sắt th&eacute;p cũng n&oacute;ng đến bỏng tay người l&agrave;m d&ugrave; đều đeo gang tay bảo hộ.</p>
<p>
	&quot;Mấy h&ocirc;m nắng n&oacute;ng, d&ugrave; to&agrave;n c&ocirc;ng nh&acirc;n trong độ tuổi thanh ni&ecirc;n nhưng do l&agrave;m việc tại c&ocirc;ng trường n&ecirc;n chỗ t&ocirc;i c&oacute; kh&aacute; nhiều c&ocirc;ng nh&acirc;n bị say nắng. Khi say nắng, họ lại v&agrave;o văn ph&ograve;ng nằm nghỉ hoặc nghỉ ngơi tại chỗ c&oacute; b&oacute;ng r&acirc;m. Ai cũng nhắc nhau phải l&agrave;m việc cầm chừng, vừa l&agrave;m vừa nghe ng&oacute;ng cơ thể để tr&aacute;nh bị sốc nhiệt.&quot;, anh Luyện cho biết.</p>
<p>
	<img alt="Hà Nội: Ngỡ có mưa, người lao động vẫn trườn mình trên “chảo lửa”" src="http://thumb.connect360.vn/unsafe/600x0/imgs.emdep.vn/Share/Image/2017/06/06/img20170605103805-10200402.jpg" /></p>
<p>
	<img alt="Hà Nội: Ngỡ có mưa, người lao động vẫn trườn mình trên “chảo lửa”" src="http://thumb.connect360.vn/unsafe/600x0/imgs.emdep.vn/Share/Image/2017/06/06/img20170605103615-101859467.jpg" /></p>
<p>
	Cơn n&oacute;ng hầm hập từ dưới nền b&ecirc; t&ocirc;ng hấp l&ecirc;n, nhưng người lao động vẫn cố gắng kiếm sống.</p>
<p>
	Tại c&aacute;c bến b&atilde;i, mặc d&ugrave; trời nắng n&oacute;ng như đổ lửa nhưng những người khu&acirc;n v&aacute;c thu&ecirc; vẫn v&igrave; miếng cơm manh &aacute;o phải oằn m&igrave;nh l&agrave;m việc mưu sinh giữa ng&agrave;y nắng oi bức.</p>
<p>
	&Ocirc;ng Trần Văn Thanh (45 tuổi, Ba V&igrave;, H&agrave; Nội) l&agrave;m nghề khu&acirc;n v&aacute;c tại bến xe Mỹ Đ&igrave;nh gần 4 năm nay. Chia sẻ về c&ocirc;ng việc thời điểm hiện tại, &ocirc;ng lắc đầu ng&aacute;n ngẩm: &quot;C&oacute; thời điểm một số năm trước, thời tiết l&ecirc;n đến gần 40 độ nhưng kh&ocirc;ng k&eacute;o d&agrave;i như thế n&agrave;y. Năm nay ch&uacute;ng t&ocirc;i mới thấy thời tiết khắc nghiệt hơn hẳn mọi năm. C&ocirc;ng việc của t&ocirc;i ở đ&acirc;y th&igrave; vất vả, trời oi bức như n&agrave;y c&agrave;ng ngột ngạt v&agrave; mất sức hơn. Nhưng biết hưng l&agrave;m thế n&agrave;o được. T&iacute;nh chất c&ocirc;ng việc đ&atilde; vậy rồi, phải cố gắng th&ocirc;i&quot;.</p>
<p>
	<img alt="Hà Nội: Ngỡ có mưa, người lao động vẫn trườn mình trên “chảo lửa”" src="http://thumb.connect360.vn/unsafe/600x0/imgs.emdep.vn/Share/Image/2017/06/06/img20170605103820-102134063.jpg" /></p>
<p>
	Ở c&aacute;c bến b&atilde;i, những người khu&acirc;n v&aacute;c ng&agrave;y noi bức c&oacute; việc nhiều hơn nhưng cũng đuối sức v&igrave; nắng.</p>
<p>
	Theo &ocirc;ng Thanh, v&agrave;o những ng&agrave;y nắng n&oacute;ng, tuy &ocirc;ng c&oacute; nhiều việc để l&agrave;m hơn ng&agrave;y thường nhưng cũng rất mệt mỏi khi mưu sinh phục vụ kh&aacute;ch ng&agrave;y n&agrave;y.</p>
<p>
	&quot;V&agrave;o những ng&agrave;y r&acirc;m m&aacute;t, kh&aacute;ch h&agrave;ng người ta tiếc tiền m&agrave; kh&ocirc;ng thu&ecirc; người bốc v&aacute;c vận chuyển h&agrave;ng, h&agrave;nh l&yacute; từ trong bến ra ngo&agrave;i bến. Nhưng thời tiết n&agrave;y, ai cũng mệt n&ecirc;n họ c&oacute; phần ngại hơn. V&igrave; vậy họ vẫy v&agrave; thu&ecirc; ch&uacute;ng t&ocirc;i nhiều hơn. Ch&uacute;ng t&ocirc;i c&oacute; th&ecirc;m cơ hội việc l&agrave;m nhưng l&agrave;m nhiều cũng oải v&agrave; đuối sức lắm&quot;, &ocirc;ng Thanh t&acirc;m sự.</p>
<p>
	<img alt="Hà Nội: Ngỡ có mưa, người lao động vẫn trườn mình trên “chảo lửa”" src="http://thumb.connect360.vn/unsafe/600x0/imgs.emdep.vn/Share/Image/2017/06/06/img20170605104039-102144889.jpg" /></p>
<p>
	<img alt="Hà Nội: Ngỡ có mưa, người lao động vẫn trườn mình trên “chảo lửa”" src="http://thumb.connect360.vn/unsafe/600x0/imgs.emdep.vn/Share/Image/2017/06/06/img20170605104120-102152627.jpg" /></p>
<p>
	Cũng theo &ocirc;ng Thanh v&agrave; nhiều người lao động ngh&egrave;o kh&aacute;c, qua theo d&otilde;i dự b&aacute;o thời tiết thấy h&ocirc;m nay c&oacute; mưa. V&igrave; thế, s&aacute;ng ra trời dịu hơn, &ocirc;ng Thanh đ&atilde; khấp khởi mừng đi l&agrave;m. Nhưng kh&ocirc;ng ngờ, thời tiết ngo&agrave;i trời đ&atilde; giảm nhiệt nhưng oi bức khiến ai cũng kh&oacute; chịu.</p>
<p>
	&quot;Mọi người lại động vi&ecirc;n nhau l&agrave;m cố nốt h&ocirc;m nay tr&ecirc;n chảo lửa oi bức rồi ng&agrave;y mai sẽ được tận hưởng những cơn mưa d&ocirc;ng m&aacute;t mẻ. Chưa l&uacute;c n&agrave;o, ch&uacute;ng t&ocirc;i lại mong mưa về như những ng&agrave;y n&agrave;y&quot;, &ocirc;ng Thanh mệt mỏi n&oacute;i.</p>
', 1, 4)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (105, N'Nhốt con trong nhà - Kỳ nghỉ hè ám ảnh của phụ huynh nghèo và con trẻ Hà Nội', N'2017_06_06_22_56_59_711380250198-084051692.jpg', N' (Emdep.vn) - Vừa bận rộn đi làm, quê lại ở xa cũng như tâm lý không muốn xa con nên nhiều phụ huynh Hà Nội đã “đánh cắp” kỳ nghỉ hè của con. Thay vào đó, họ nhốt con trong nhà làm bạn với 4 bức tường', CAST(N'2017-06-06 00:00:00.000' AS DateTime), 0, N'<p>
	Theo t&igrave;m hiểu của Emdep, những gia đ&igrave;nh n&agrave;o ở H&agrave; Nội d&aacute;m cho con về qu&ecirc;, kh&ocirc;ng tham gia học h&egrave;&hellip; l&agrave; một &ldquo;cuộc c&aacute;ch mạng lớn&rdquo;. Phần nhiều phụ huynh học sinh vẫn c&oacute; t&acirc;m l&yacute; nhồi nh&eacute;t con học h&agrave;nh như &ldquo;nhồi thức ăn cho g&agrave;&rdquo; ngay trong dịp h&egrave;. Nhiều trẻ bị động v&agrave; &aacute;p lực tột độ ngay trong ch&iacute;nh kỳ nghỉ m&agrave; lẽ ra đ&oacute; phải l&agrave;&hellip; thi&ecirc;n đường.</p>
<p>
	Kh&ocirc;ng chỉ bắt con chỉ ăn v&agrave; học, kh&ocirc;ng &iacute;t phụ huynh v&igrave; bận rộn với c&ocirc;ng việc m&agrave; &ldquo;nhốt&rdquo; con một m&igrave;nh ở nh&agrave;. Đ&acirc;y c&oacute; lẽ l&agrave; những kỳ nghỉ h&egrave; &aacute;m ảnh suốt đời con trẻ H&agrave; Nội.</p>
<p>
	Chị Phạm Th&ugrave;y Vinh (Nghĩa Đ&ocirc;, H&agrave; Nội) buồn rầu kể, do bận rộn đi l&agrave;m, qu&ecirc; xa kh&ocirc;ng về được, &ocirc;ng b&agrave; nội ở qu&ecirc; th&igrave; sức khỏe yếu kh&ocirc;ng chăm được trẻ, vợ chồng chị buộc phải nhốt con trong nh&agrave;, 2 đứa trẻ tự chơi với nhau.</p>
<p>
	<img alt="Nhốt con trong nhà - Kỳ nghỉ hè ám ảnh của phụ huynh nghèo và con trẻ Hà Nội" src="http://thumb.connect360.vn/unsafe/660x0/imgs.emdep.vn/Share/Image/2017/06/06/12-085041963.jpg" /></p>
<p>
	<a href="http://emdep.vn/nhip-song/nhot-con-trong-nha-ky-nghi-he-am-anh-cua-phu-huynh-ngheo-va-con-tre-ha-noi-20170526132816626.htm" target="_blank"><img alt="kỳ nghỉ hè" src="http://thumb.connect360.vn/unsafe/596x0/imgs.emdep.vn/Share/Image/2017/06/06/me-oi-dung-nhot-con-1-085043507.jpg" /></a></p>
<p>
	Nhiều vợ chồng trẻ buộc phải nhốt con trong nh&agrave;, 2 đứa trẻ tự chơi với nhau. Ảnh minh họa.</p>
<p>
	Để con ngoan ngo&atilde;n chơi trong nh&agrave;, chị Vinh mở ti vi sẵn, b&agrave;y đồ ăn thức uống v&agrave; đồ chơi cho con l&agrave;m g&igrave; t&ugrave;y th&iacute;ch. B&ecirc;n cạnh đ&oacute;, chị Vinh cũng gửi gắm b&aacute;c h&agrave;ng x&oacute;m cạnh nh&agrave; thỉnh thoảng sang nh&agrave; chị ng&oacute; hộ.</p>
<p>
	Chị Vinh ngậm ng&ugrave;i t&acirc;m sự: &ldquo;Vợ chồng m&igrave;nh l&agrave;m c&ocirc;ng nh&acirc;n, thu nhập cũng eo hẹp n&ecirc;n kh&ocirc;ng c&oacute; tiền thu&ecirc; &ocirc; sin. Thực l&ograve;ng, để hai con tự chơi với nhau cũng v&igrave; cực chẳng đ&atilde;. Nh&igrave;n thấy con, m&igrave;nh lại nghĩ tới cảnh của m&igrave;nh hồi b&eacute;&quot;.</p>
<p>
	Chị Vinh cũng kể, trước đ&acirc;y khi chị c&ograve;n con n&iacute;t, kỳ nghỉ h&egrave;&nbsp;chưa nh&agrave; ai c&oacute; điều kiện thu&ecirc; &ocirc; sin. &Ocirc;ng b&agrave; th&igrave; ở qu&ecirc; xa th&agrave;nh ra bố mẹ to&agrave;n để chị ở nh&agrave; tự quản v&agrave; nhờ h&agrave;ng x&oacute;m ng&oacute; nghi&ecirc;ng gi&uacute;p.</p>
<p>
	&quot;Tuy nhi&ecirc;n m&igrave;nh suốt ng&agrave;y kh&oacute;a cửa đi chơi đen s&igrave;, gầy sọp v&agrave; to&agrave;n mải chơi qu&ecirc;n giờ về n&ecirc;n cuối c&ugrave;ng bị nhốt trong nh&agrave;. Bị nhốt trong nh&agrave;, bố mẹ cũng kh&ocirc;ng y&ecirc;n t&acirc;m. M&ugrave;a h&egrave; l&agrave; m&ugrave;a ong l&agrave;m tổ, ng&agrave;y xưa trong nh&agrave; m&igrave;nh cũng c&oacute; một tổ ong v&agrave;ng to đ&ugrave;ng n&ecirc;n sợ anh em m&igrave;nh nghịch ngợm.&nbsp;</p>
<p>
	Giờ vợ chồng m&igrave;nh đi l&agrave;m, nhốt con ở nh&agrave; cũng kh&ocirc;ng y&ecirc;n t&acirc;m ch&uacute;t n&agrave;o. N&oacute;i thật vợ chồng m&igrave;nh chỉ sợ con nghịch đồ điện hoặc c&aacute;c vật dụng kh&ocirc;ng an to&agrave;n th&igrave; &acirc;n hận lắm. Nhưng ho&agrave;n cảnh l&agrave; vậy, biết phải l&agrave;m sao?&rdquo;, b&agrave; mẹ n&agrave;y than thở.</p>
<p>
	&nbsp;C&ugrave;ng chung t&acirc;m l&yacute; với chị Vinh, nhiều bậc phụ huynh H&agrave; Nội cũng &quot;k&ecirc;u như vạc&quot; bởi cho con đi trung t&acirc;m vui chơi th&igrave; đắt đỏ, bố mẹ th&igrave; kh&ocirc;ng thể nghỉ việc để chơi v&agrave; theo s&aacute;t con. Chỉ c&ograve;n c&aacute;ch kh&oacute;a cửa để con chơi trong nh&agrave;. Muốn con c&oacute; tuổi thơ bằng bạn bằng b&egrave; nhưng kinh tế kh&oacute; khăn n&ecirc;n đ&agrave;nh chịu.</p>
<p>
	Chị L&ecirc; Hồng Hải (đường Giải Ph&oacute;ng, H&agrave; Nội) cho hay, h&egrave; đến cũng l&agrave; l&uacute;c nh&agrave; chị đau đầu t&igrave;m chỗ gửi con. Năm ngo&aacute;i vợ chồng chị gửi con về qu&ecirc; với &ocirc;ng b&agrave; ngoại. Nhưng năm nay, &ocirc;ng b&agrave; v&agrave;o Nam chơi với họ h&agrave;ng. Điều n&agrave;y đồng nghĩa với việc chị Hải bất đắc dĩ phải &ldquo;nhốt&rdquo; con ở nh&agrave; cả ng&agrave;y v&igrave; kh&ocirc;ng c&oacute; chỗ gửi.</p>
<p>
	&ldquo;Những ng&agrave;y đi l&agrave;m th&igrave; kh&oacute;a cửa để con tự chơi trong nh&agrave;, giờ nghỉ trưa tranh thủ về xem con ăn uống v&agrave; th&uacute;c giục con ngủ nghỉ. C&oacute; h&ocirc;m con ở nh&agrave; ch&aacute;n qu&aacute;, thấy mẹ về ăn trưa cứ nằng nặc đ&ograve;i mẹ ở nh&agrave; chơi c&ugrave;ng, t&ocirc;i đ&agrave;nh phải đưa con l&ecirc;n cơ quan&rdquo;, chị Hải n&oacute;i.</p>
<p>
	Chị Hải bảo, ng&agrave;y n&agrave;o đi l&agrave;m về cũng nghe con k&ecirc;u ch&aacute;n v&igrave; phải ở nh&agrave; một m&igrave;nh, chị x&oacute;t lắm. Chị cũng muốn t&igrave;m chỗ vui chơi cho con, nhưng gi&aacute; cả đắt đỏ qu&aacute; n&ecirc;n th&ocirc;i. Với lại ng&agrave;y nắng nực, chị cũng phải đi l&agrave;m n&ecirc;n nhốt con trong nh&agrave; l&agrave; biện ph&aacute;p hay nhất.</p>
<p>
	<img alt="Nhốt con trong nhà - Kỳ nghỉ hè ám ảnh của phụ huynh nghèo và con trẻ Hà Nội" src="http://thumb.connect360.vn/unsafe/640x0/imgs.emdep.vn/Share/Image/2017/06/06/me-oi-dung-nhot-con-085042493.jpg" /></p>
<p>
	<img alt="Nhốt con trong nhà - Kỳ nghỉ hè ám ảnh của phụ huynh nghèo và con trẻ Hà Nội" src="http://thumb.connect360.vn/unsafe/450x0/imgs.emdep.vn/Share/Image/2017/06/06/he-1-c9b5a-085042992.jpg" /></p>
<p>
	Những ng&agrave;y đi l&agrave;m th&igrave; kh&oacute;a cửa để con tự chơi trong nh&agrave;, giờ nghỉ trưa tranh thủ về xem con ăn uống v&agrave; th&uacute;c giục con ngủ nghỉ. Ảnh minh họa</p>
<p>
	&ldquo;Muốn cho con đi trung t&acirc;m vui chơi m&agrave; đắt đỏ qu&aacute;, to&agrave;n tiền triệu cả, lương hai vợ chồng chỉ đủ chi ti&ecirc;u sinh hoạt, c&ograve;n phải tiết kiệm để chuẩn bị cho đứa con lớn v&agrave;o cấp 2. Cũng muốn con c&oacute; tuổi thơ được vui chơi bằng bạn bằng b&egrave; nhưng kh&ocirc;ng c&oacute; tiền th&igrave; đ&agrave;nh chịu&rdquo;, chị Hải chia sẻ th&ecirc;m.</p>
<p>
	Cả ng&agrave;y &ldquo;nhốt&rdquo; con ở nh&agrave; n&ecirc;n tối về chị thường đưa con ra hồ Kim Đồng để h&oacute;ng m&aacute;t v&agrave; xem mọi người tập erobic. &ldquo;Được ra chỗ đ&ocirc;ng người l&agrave; con b&eacute; th&iacute;ch lắm, tối n&agrave;o ăn cơm xong cũng đ&ograve;i mẹ đưa ra chơi&rdquo;, chị n&oacute;i th&ecirc;m.</p>
<p>
	Để con ở nh&agrave;, nhưng kh&ocirc;ng ng&agrave;y n&agrave;o đi l&agrave;m l&agrave; chị thấy y&ecirc;n t&acirc;m. C&oacute; h&ocirc;m đi l&agrave;m về thấy con thở ngắn than d&agrave;i rằng: &ldquo;B&aacute;c h&agrave;ng x&oacute;m bảo con rằng, bố mẹ m&agrave;y chỉ mải kiếm tiền, con c&aacute;i th&igrave; cứ như giam lỏng trong t&ugrave;&rdquo;.</p>
<p>
	Kh&ocirc;ng dừng lại ở đ&oacute;, c&ocirc; con g&aacute;i con gặng hỏi chị Hải: &ldquo;Giam lỏng trong t&ugrave; l&agrave; g&igrave; hả mẹ?&rdquo;. C&acirc;u hỏi ng&acirc;y ng&ocirc; cửa b&eacute; như lưỡi dao sắc lẹm cứa v&agrave;o l&ograve;ng chị. Chị Hải chỉ biết &ocirc;m con v&agrave;o l&ograve;ng, mắt nh&ograve;e lệ. V&igrave; sống ở th&agrave;nh phố, nh&agrave; lại ngh&egrave;o, qu&ecirc; xa n&ecirc;n chị kh&ocirc;ng thể b&ugrave; đắp cho con 1 kỳ nghỉ h&egrave; đ&uacute;ng nghĩa.</p>
', 1, 4)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (106, N'Từ 1/6, đưa bảng điểm của con lên mạng là phạm luật', N'2017_06_06_22_41_51_6831380250198-084051692.jpg', N' (Emdep.vn) - Nhiều phụ huynh đưa bảng điểm của con lên mạng để chia sẻ niềm vui nhưng không biết như thế là phạm luật nếu chưa hỏi ý kiến của trẻ. ', CAST(N'2017-06-06 00:00:00.000' AS DateTime), 1, N'<p>
	Chấm dứt &ldquo;bệnh th&agrave;nh t&iacute;ch&rdquo; của phụ huynh</p>
<p>
	Việc cha mẹ cung cấp h&igrave;nh ảnh cụ thể về kết quả học tập của con m&agrave; kh&ocirc;ng được con đồng &yacute; kh&ocirc;ng phải l&agrave; hiếm gặp, nhất l&agrave; mỗi khi kết th&uacute;c học kỳ hay năm học. Từ 1/6, Luật Trẻ em c&oacute; hiệu lực. Theo đ&oacute;, nếu trẻ từ 7 tuổi trở l&ecirc;n, cha mẹ cần hỏi &yacute; kiến trẻ trước khi tiết lộ th&ocirc;ng tin về đời sống ri&ecirc;ng tư, b&iacute; mật c&aacute; nh&acirc;n của trẻ; nếu trẻ chưa đủ 7 tuổi th&igrave; cha mẹ c&oacute; quyền quyết định, nhưng phải xem x&eacute;t dựa tr&ecirc;n mục ti&ecirc;u v&igrave; sự ph&aacute;t triển tốt nhất của trẻ.</p>
<div type="Photo">
	<div>
		<img alt="Đăng tải bảng điểm trên mạng nếu không có sự đồng ý của trẻ là phạm luật." data-original="https://dantricdn.com/2017/photo-1-1496018286011.jpg" id="img_0cded740-4407-11e7-9c5b-474288254b07" rel="https://dantricdn.com/2017/photo-1-1496018286011.jpg" src="https://dantricdn.com/2017/photo-1-1496018286011.jpg" type="photo" /></div>
	<div>
		Đăng tải bảng điểm tr&ecirc;n mạng nếu kh&ocirc;ng c&oacute; sự đồng &yacute; của trẻ l&agrave; phạm luật.</div>
</div>
<p>
	&nbsp;</p>
<p>
	Với kh&ocirc;ng &iacute;t phụ huynh, bảng điểm đẹp của con l&agrave; th&agrave;nh quả khiến bố mẹ vui mừng, muốn đăng l&ecirc;n mạng đơn giản để chia sẻ niềm tự h&agrave;o c&ugrave;ng nhiều người. Tuy nhi&ecirc;n, hệ lụy sau h&agrave;nh vi n&agrave;y l&agrave; g&igrave;?</p>
<p>
	TS. Vũ Thu Hương (giảng vi&ecirc;n khoa Gi&aacute;o dục tiểu học - Trường ĐH Sư phạm H&agrave; Nội) đ&aacute;nh gi&aacute; quy định cấm đưa bảng điểm l&ecirc;n mạng khi chưa c&oacute; sự đồng &yacute; từ trẻ l&agrave; biện ph&aacute;p tuyệt vời chấm dứt bệnh th&agrave;nh t&iacute;ch của phụ huynh.</p>
<p>
	TS Hương ph&acirc;n t&iacute;ch, việc bố mẹ khoe con c&oacute; nhiều hệ lụy. Thứ nhất với những phụ huynh chuy&ecirc;n khoe con th&igrave; bản th&acirc;n họ cũng c&oacute; &aacute;p lực. &ldquo;Khoe được một lần muốn khoe lần hai v&agrave; nhiều lần nữa, muốn con l&uacute;c n&agrave;o phải &ldquo;đỉnh&rdquo;, phải tuyệt vời... &Aacute;p lực l&ecirc;n trẻ con l&agrave; kh&ocirc;ng thể tr&aacute;nh khỏi&rdquo;.</p>
<p>
	Nếu trẻ kh&ocirc;ng đạt như mong muốn, kh&ocirc;ng c&oacute; th&agrave;nh t&iacute;ch cao để &quot;khoe&quot; th&igrave; bố mẹ cảm thấy thất vọng v&agrave; tr&uacute;t giận dữ v&agrave;o đầu đứa trẻ. Từ đ&oacute;, c&aacute;c con sẽ cảm thấy học h&agrave;nh l&agrave; nghĩa vụ khủng khiếp, mất niềm vui v&agrave; giảm s&uacute;t hiệu quả học tập.</p>
<p>
	TS. Vũ Thu Hương đề cập th&ecirc;m đến thực trạng &ldquo;ph&acirc;n cấp&rdquo; mối quan hệ bạn b&egrave; trong lớp học dựa theo th&agrave;nh t&iacute;ch. C&aacute;c bạn học giỏi th&igrave; kh&ocirc;ng chơi với người học k&eacute;m hơn m&igrave;nh khiến c&aacute;c bạn học &quot;dốt&quot; rất tủi th&acirc;n. Theo nữ giảng vi&ecirc;n, ch&iacute;nh bệnh th&agrave;nh t&iacute;ch cũng ảnh hưởng kh&ocirc;ng tốt đến mối quan hệ giữa c&aacute;c đứa trẻ.</p>
<p>
	Nhiều phụ huynh kh&ocirc;ng cần biết con học được thực sự những g&igrave;, chỉ th&iacute;ch ch&uacute;ng c&oacute; th&agrave;nh t&iacute;ch để&hellip; khoe. Nhưng một đứa trẻ đạt điểm cao kh&ocirc;ng chắc chắn c&oacute; được th&agrave;nh c&ocirc;ng sau n&agrave;y hơn c&aacute;c bạn điểm k&eacute;m.</p>
<p>
	&nbsp;</p>
<div type="Photo">
	<div>
		<img alt="TS. Vũ Thu Hương." data-original="https://dantricdn.com/2017/photo-2-1496018286077.jpg" id="img_0d99c2d0-4407-11e7-9c5b-474288254b07" rel="https://dantricdn.com/2017/photo-2-1496018286077.jpg" src="https://dantricdn.com/2017/photo-2-1496018286077.jpg" type="photo" /></div>
	<div>
		TS. Vũ Thu Hương.</div>
</div>
<p>
	&nbsp;</p>
<p>
	TS. Hương t&acirc;m sự, bản th&acirc;n chị cũng từng học dốt v&agrave; c&oacute; người chị g&aacute;i học rất giỏi. Bố mẹ tự h&agrave;o về c&ocirc; chị bao nhi&ecirc;u th&igrave; lại thất vọng về c&ocirc; em b&acirc;y nhi&ecirc;u. Vậy n&ecirc;n hồi b&eacute; TS Hương c&oacute; suy nghĩ chị g&aacute;i m&igrave;nh thật sướng. Tuy vậy, người chị của TS Hương lại kh&ocirc;ng cảm thấy thế v&agrave; trả lời c&ocirc; em g&aacute;i rằng: &quot;Chị kh&ocirc;ng sướng, v&igrave; l&uacute;c n&agrave;o chị cũng cảm thấy cần phải giỏi. Chị chỉ cần &iacute;t giỏi đi một ch&uacute;t l&agrave; bố mẹ thất vọng, bao nhi&ecirc;u đau khổ sẽ tr&uacute;t l&ecirc;n đầu chị&quot;.</p>
<div data-back="E6E6FA" data-border="999" dir="center" id="ObjectBoxContent_1496037087326" type="content">
	<p>
		Từ ng&agrave;y 1/6/2017, Luật Trẻ em ch&iacute;nh thức c&oacute; hiệu lực. Theo đ&oacute;, luật nghi&ecirc;m cấm c&aacute;c h&agrave;nh vi c&ocirc;ng bố, tiết lộ th&ocirc;ng tin về đời sống ri&ecirc;ng tư, b&iacute; mật c&aacute; nh&acirc;n của trẻ em m&agrave; kh&ocirc;ng được sự đồng &yacute; của trẻ em từ đủ 7 tuổi trở l&ecirc;n v&agrave; của cha, mẹ, người gi&aacute;m hộ của trẻ em.</p>
	<p>
		Từ ng&agrave;y 1/72017, Nghị định 56/2017/NĐ-CP của Ch&iacute;nh phủ quy định một số điều hướng dẫn thi h&agrave;nh Luật Trẻ em cũng sẽ c&oacute; hiệu lực. Nghị định quy định r&otilde; th&ocirc;ng tin b&iacute; mật đời tư của trẻ em l&agrave; c&aacute;c th&ocirc;ng tin về t&ecirc;n, tuổi, đặc điểm nhận dạng c&aacute; nh&acirc;n, địa chỉ th&ocirc;ng tin về trường lớp, kết quả học tập v&agrave; c&aacute;c mối quan hệ bạn b&egrave; của trẻ em&hellip;</p>
</div>
<p>
	&nbsp;</p>
<p>
	B&iacute; mật học h&agrave;nh cũng l&agrave; một phần ri&ecirc;ng tư của trẻ</p>
<p>
	Theo nữ giảng vi&ecirc;n ĐH Sư phạm H&agrave; Nội, luật đưa ra c&oacute; thể khiến nhiều người cảm gi&aacute;c &quot;th&ocirc; bạo&quot; nhưng n&oacute; rất đ&uacute;ng khi đứng về quyền lợi của trẻ, bảo vệ ch&uacute;ng. Những th&agrave;nh t&iacute;ch, sai phạm lầm lỗi hay th&agrave;nh quả của trẻ cũng giống như một phần cơ thể trẻ, n&oacute; ho&agrave;n to&agrave;n c&oacute; quyền giữ b&iacute; mật, đ&oacute; kh&ocirc;ng phải việc của mọi người.</p>
<p>
	&ldquo;Một đứa trẻ mặc quần &aacute;o th&igrave; kh&ocirc;ng ai c&oacute; quyền bắt n&oacute; cởi quần &aacute;o hay bắt n&oacute; phải cho ai xem khiếm khuyết tr&ecirc;n cơ thể. Quay lại chuyện b&iacute; mật học h&agrave;nh cũng vậy, ch&uacute;ng cũng kh&ocirc;ng muốn phơi ra ngo&agrave;i&rdquo;, TS Hương v&iacute; von.</p>
<p>
	Người lớn cứ nghĩ c&oacute; quyền đối với con c&aacute;i m&igrave;nh nhưng kh&ocirc;ng biết h&agrave;nh vi đăng điểm l&ecirc;n mạng c&oacute; thể g&acirc;y tổn thương thế n&agrave;o với trẻ con. Nếu muốn động vi&ecirc;n, kh&iacute;ch lệ con bố mẹ ho&agrave;n to&agrave;n c&oacute; những c&aacute;ch tốt hơn.</p>
<p>
	&ldquo;Đưa bảng điểm tr&ecirc;n mạng kh&ocirc;ng c&oacute; gi&aacute; trị gi&aacute;o dục hay động vi&ecirc;n. Luật cấm l&agrave; hợp l&yacute; để phụ huynh nh&igrave;n nhận lại ch&iacute;nh m&igrave;nh. Đối với một đứa trẻ đi học quan trọng nhất l&agrave; trưởng th&agrave;nh v&agrave; gi&uacute;p đỡ cho người kh&aacute;c chứ kh&ocirc;ng phải đạt được bảng điểm đẹp hay tr&ecirc;n t&agrave;i bạn b&egrave;&rdquo;, TS, Vũ Thu Hương nhận định .</p>
<p>
	Đăng bảng điểm l&ecirc;n mạng c&oacute; mang lại lợi &iacute;ch g&igrave; cho trẻ kh&ocirc;ng?</p>
<p>
	PGS.TS. Nguyễn Ngọc Oanh, Ph&oacute; trưởng khoa Quan hệ Quốc tế (Học viện B&aacute;o ch&iacute; v&agrave; Tuy&ecirc;n truyền), chuy&ecirc;n gia về quyền trẻ em, ranh giới giữa việc phạm luật v&agrave; kh&ocirc;ng phạm luật trong trường hợp n&agrave;y rất mong manh.</p>
<div type="Photo">
	<div>
		<img alt="PGS.TS Nguyễn Ngọc Oanh." data-original="https://dantricdn.com/2017/photo-3-1496018287683.jpg" id="img_0d283c50-4407-11e7-b2d0-cdf7a36e9bbc" rel="https://dantricdn.com/2017/photo-3-1496018287683.jpg" src="https://dantricdn.com/2017/photo-3-1496018287683.jpg" type="photo" /></div>
	<div>
		PGS.TS Nguyễn Ngọc Oanh.</div>
</div>
<p>
	&nbsp;</p>
<p>
	&ldquo;Nếu th&ocirc;ng tin đăng tải được con đồng &yacute; th&igrave; kh&ocirc;ng sai luật, nhưng bố mẹ cũng cần c&acirc;n nhắc c&aacute;c h&agrave;nh vi n&agrave;y v&agrave; đặt c&acirc;u hỏi liệu việc đăng tải h&igrave;nh ảnh đ&oacute; c&oacute; phải v&igrave; lợi &iacute;ch tốt nhất của con hay kh&ocirc;ng?&rdquo;, PGS.TS Nguyễn Ngọc Oanh chia sẻ.</p>
<p>
	Theo &ocirc;ng, cần l&agrave;m r&otilde; mục đ&iacute;ch khi đưa bảng điểm của con l&ecirc;n mạng, đưa cho ai đọc, được &iacute;ch lợi g&igrave;, phụ huynh c&oacute; hỏi &yacute; con trước khi đăng tải kh&ocirc;ng, th&aacute;i độ của con với việc n&agrave;y thế n&agrave;o&hellip;</p>
<p>
	Trong c&ocirc;ng ước quốc tế về quyền trẻ em c&oacute; nguy&ecirc;n tắc l&agrave; &ldquo;lợi &iacute;ch tốt nhất của trẻ em&rdquo;. Do đ&oacute;, việc đăng tải bảng điểm n&oacute;i ri&ecirc;ng v&agrave; th&ocirc;ng tin của trẻ n&oacute;i chung phải hướng tới rằng, n&oacute; c&oacute; mang lại lợi &iacute;ch tốt nhất cho trẻ kh&ocirc;ng. Đặc biệt, mạng x&atilde; hội l&agrave; nơi phụ huynh cần phải c&acirc;n nhắc thận trọng.</p>
<p>
	&ldquo;Đ&oacute; l&agrave; mạng thế n&agrave;o, c&oacute; kiểm so&aacute;t được kh&ocirc;ng nếu đưa l&ecirc;n v&agrave; c&oacute; mang lại lợi &iacute;ch cho con trẻ kh&ocirc;ng. Tu&acirc;n thủ nguy&ecirc;n tắc tốt nhất cho trẻ phụ huynh sẽ hiểu n&ecirc;n hay kh&ocirc;ng n&ecirc;n l&agrave;m g&igrave;&rdquo;, &ocirc;ng Oanh n&oacute;i.</p>
<p>
	PGS-TS Nguyễn Ngọc Oanh lưu &yacute; th&ecirc;m, đ&atilde; từng c&oacute; trường hợp những kẻ xấu c&oacute; th&ocirc;ng tin v&agrave; lập kế hoạch bắt c&oacute;c trẻ, hoặc c&oacute; những kẻ biến th&aacute;i lạm dụng t&igrave;nh dục hay sử dụng th&ocirc;ng tin v&agrave;o mục đ&iacute;ch xấu&hellip;</p>
', 1, 4)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (107, N'Điểm chuẩn lớp 10 TP.HCM sẽ giảm', N'2017_06_06_22_44_35_97420170603110622-de-toan-071641316.jpg', N' (Emdep.vn) - Ông Nguyễn Tiến Đạt, Phó Giám đốc Sở GD-ĐT TP.HCM cho biết có thể điểm chuẩn lớp 10 sẽ giảm. ', CAST(N'2017-06-06 00:00:00.000' AS DateTime), 2, N'<p>
	Chiều 3/6, &ocirc;ng Nguyễn Tiến Đạt, Ph&oacute; Gi&aacute;m đốc Sở Gi&aacute;o dục v&agrave; Đ&agrave;o tạo (GD&amp;ĐT) TPHCM đ&atilde; cung cấp một số th&ocirc;ng tin về kỳ thi tuyển sinh v&agrave;o lớp 10 c&ocirc;ng lập năm học 2017-2018.</p>
<p>
	<img alt="" src="http://academy.vn/wp-content/uploads/2016/08/bang-quy-doi-diem-toeic-ets-oxford-1.png" style="width: 500px; height: 474px;" /></p>
<p>
	Theo &ocirc;ng Đạt, ở ng&agrave;y thi đầu ti&ecirc;n (2/6), số lượng th&iacute; sinh vắng l&agrave; 400 em; ng&agrave;y thi thứ 2 (3/6) vắng 453 em.</p>
<p>
	&ldquo;Kỳ thi đ&atilde; diễn ra ra an to&agrave;n, nghi&ecirc;m t&uacute;c, kh&ocirc;ng c&oacute; c&aacute;n bộ, gi&aacute;m thị hay th&iacute; sinh n&agrave;o vi phạm quy chế, kh&ocirc;ng xảy ra trường hợp đ&aacute;ng tiếc về giao th&ocirc;ng, y tế, thực phẩm...&rdquo;, &ocirc;ng Đạt n&oacute;i.</p>
<p>
	Về ph&uacute;c khảo v&agrave; c&ocirc;ng bố điểm thi, &ocirc;ng Đạt cho biết, dự kiến v&agrave;o ng&agrave;y 12/6, Sở GD&amp;ĐT sẽ c&ocirc;ng bố điểm thi. Th&iacute; sinh bắt đầu nộp đơn ph&uacute;c khảo từ 12 đến 14/6 tại trường phổ th&ocirc;ng c&aacute;c em đang học lớp 9, kh&ocirc;ng giới hạn m&ocirc;n ph&uacute;c khảo v&agrave; th&iacute; sinh kh&ocirc;ng phải nộp lệ ph&iacute;.</p>
<p>
	&ldquo;Tuy nhi&ecirc;n, c&aacute;c th&iacute; sinh n&ecirc;n nhớ r&otilde; b&agrave;i l&agrave;m, c&acirc;n nhắc thật kỹ trước khi quyết định nộp đơn ph&uacute;c khảo. Trường phổ th&ocirc;ng nhận đơn cũng n&ecirc;n xem x&eacute;t kỹ lưỡng, tư vấn cho học sinh muốn ph&uacute;c khảo v&igrave; điểm sau ph&uacute;c khảo l&agrave; điểm cuối c&ugrave;ng của c&aacute;c em&rdquo; &ocirc;ng Nguyễn Tiến Đạt lưu &yacute;.</p>
<p>
	Sở GD&amp;ĐT cũng dự kiến ng&agrave;y 19/6 sẽ c&ocirc;ng bố kết quả ph&uacute;c khảo v&agrave; ng&agrave;y 3/7 sẽ c&ocirc;ng bố điểm chuẩn v&agrave;o lớp 10 v&agrave; danh s&aacute;ch học sinh tr&uacute;ng tuyển v&agrave;o c&aacute;c trường THPT.</p>
<p>
	Li&ecirc;n quan đến đề thi m&ocirc;n To&aacute;n (thi v&agrave;o s&aacute;ng 3/6) được nhiều học sinh, gi&aacute;o vi&ecirc;n nhận định l&agrave; kh&oacute; hơn so với c&aacute;c năm trước, đại diện l&atilde;nh đạo Sở cho rằng đ&acirc;y l&agrave; kỳ tuyển sinh n&ecirc;n &quot;kh&oacute; l&agrave; kh&oacute; chung&quot;.</p>
<p>
	&ldquo;C&oacute; thể điểm chuẩn đầu v&agrave;o sẽ thấp hơn chứ kh&ocirc;ng ảnh hưởng đến vấn đề cạnh tranh để v&agrave;o c&aacute;c trường. Thực tế, đề c&oacute; sự ph&acirc;n h&oacute;a tốt, nếu học trung b&igrave;nh vẫn được 5-6 điểm với những b&agrave;i to&aacute;n truyền thống, chuẩn kiến thức, quen thuộc&hellip;&rdquo;, đại diện l&atilde;nh đạo Sở GD&amp;ĐT TPHCM cho biết.</p>
', 1, 4)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (108, N'Bật cười bài văn bá đạo của em bé khiến cô giáo "cạn lời"', N'2017_06_06_22_46_16_562photo-1-1495882130678-184052226.jpg', N' (Emdep.vn) - Không chỉ gợi ra vấn đề “văn mẫu”, câu chuyện đề văn “tả con chó” còn khiến chúng ta suy ngẫm về một điều rộng hơn. ', CAST(N'2017-06-06 00:00:00.000' AS DateTime), 0, N'<div>
	<p>
		Văn học v&agrave; học văn lu&ocirc;n l&agrave; đề t&agrave;i được nhiều người trăn trở luận b&agrave;n. C&oacute; lẽ v&igrave; thế m&agrave; dễ hiểu sự quan t&acirc;m những ng&agrave;y qua d&agrave;nh cho bức ảnh chụp một b&agrave;i kiểm tra văn của học sinh tiểu học, c&oacute; đề b&agrave;i y&ecirc;u cầu &ldquo;tả con ch&oacute; của nh&agrave; em&rdquo;. Rất thật th&agrave;, phần b&agrave;i l&agrave;m viết: &ldquo;Nh&agrave; em kh&ocirc;ng c&oacute; nu&ocirc;i ch&oacute;. Khi n&agrave;o nh&agrave; em nu&ocirc;i ch&oacute; em sẽ tả&rdquo;. V&agrave; hệ quả, &ldquo;Cạn lời. Về nh&agrave; l&agrave;m lại&rdquo; l&agrave; lời ph&ecirc; m&agrave; b&agrave;i văn &ldquo;b&aacute; đạo&rdquo; n&agrave;y nhận được.</p>
	<div type="Photo">
		<div>
			<img alt="Bật cười bài văn bá đạo của em bé khiến cô giáo cạn lời - Ảnh 1." data-original="http://afamilycdn.com/2017/photo-1-1495879808572.jpg" id="img_b3f635d0-42c4-11e7-b22f-f9c45fb6d10c" rel="lightbox" src="http://afamilycdn.com/2017/photo-1-1495879808572.jpg" title="Bật cười bài văn bá đạo của em bé khiến cô giáo cạn lời - Ảnh 1." type="photo" /></div>
		<div>
			<p data-placeholder="[nhập chú thích]">
				B&agrave;i văn &quot;b&aacute; đạo&quot; được nhiều người quan t&acirc;m, b&igrave;nh luận.</p>
		</div>
	</div>
	<p>
		Trong ch&uacute;ng ta ai chẳng c&oacute; một thời trải nghiệm những đề văn kiểu n&agrave;y, ai chẳng phải thuộc nằm l&ograve;ng một số c&ocirc;ng thức văn mi&ecirc;u tả để đối ph&oacute;, thường được gọi l&agrave; &ldquo;văn mẫu&rdquo;. Chỉ c&oacute; điều chắc chẳng mấy ai d&aacute;m thẳng thắn&hellip; th&uacute; nhận như em học sinh kia th&ocirc;i. Cứ thử đi chệch c&aacute;c &ldquo;c&ocirc;ng thức truyền thống&rdquo; xem, điểm k&eacute;m như chơi.</p>
	<p>
		V&iacute; dụ, học văn thời ch&uacute;ng t&ocirc;i, tả b&agrave; th&igrave; nhất nhất phải t&oacute;c trắng, bỏm bẻm nhai trầu, nụ cười đ&ocirc;n hậu&hellip; Chẳng r&otilde; đến giờ, với thế hệ c&aacute;c b&agrave; nội - ngoại kh&ocirc;ng &iacute;t người rất s&agrave;nh điệu t&oacute;c nhuộm, mặc v&aacute;y th&igrave; &ldquo;văn mẫu&rdquo; c&oacute; g&igrave; thay đổi?</p>
	<p>
		Cũng v&igrave; c&aacute;i sự chuộng &ldquo;văn mẫu&rdquo; m&agrave; c&oacute; khi một b&agrave;i văn thật th&agrave;, đ&aacute;ng y&ecirc;u lại bị c&ocirc; gi&aacute;o ph&ecirc; nặng nề, cho điểm thấp v&agrave; bị chế nhạo khi được c&ocirc;ng bố ra b&ecirc;n ngo&agrave;i. Nh&igrave;n ở g&oacute;c độ n&agrave;y ch&uacute;ng ta sẽ thấy những b&agrave;i văn &ldquo;b&aacute; đạo&rdquo; h&oacute;a ra kh&ocirc;ng &ldquo;b&aacute; đạo&rdquo;, đ&aacute;ng cười như vẫn tưởng.</p>
	<p>
		C&ograve;n nhớ một dạo người ta chia sẻ b&agrave;i viết tả bố của một học sinh tiểu học. Ch&uacute;ng ta buồn cười v&igrave; em tả &ldquo;em mong bố em bớt n&oacute;ng t&iacute;nh đi một ch&uacute;t để m&ocirc;ng em đỡ bị nổi lươn&rdquo; m&agrave; kh&ocirc;ng thấy đ&oacute; l&agrave; h&igrave;nh ảnh &ocirc;ng bố rất ch&acirc;n thực, c&oacute; phần &ldquo;điển h&igrave;nh&rdquo; v&agrave; mong ước của em rất hồn nhi&ecirc;n, trẻ con. V&agrave; ngay cả c&ocirc; gi&aacute;o chắc cũng sẽ bỏ qua, thay v&igrave; cổ vũ họa cảm rất tốt của em khi viết đoạn văn n&agrave;y: &ldquo;Bố rất cao lớn. Mỗi lần bố &ocirc;m em, em ch&igrave;m trong b&oacute;ng tối&rdquo;.</p>
	<p>
		Quay lại đề b&agrave;i &ldquo;tả con ch&oacute;&rdquo;, dường như ch&uacute;ng ta đ&atilde; qu&aacute; quen thuộc với những đề văn kiểu n&agrave;y đến mức hiếm khi tự hỏi lại: sao cứ nhất nhất l&agrave; &ldquo;của nh&agrave; em&rdquo;: ch&oacute; nh&agrave; em, m&egrave;o nh&agrave; em, c&acirc;y cau nh&agrave; em, c&acirc;y m&iacute;t nh&agrave; em&hellip; Từ trong tư duy của việc ra đề đ&atilde; cứng nhắc mặc định &ldquo;nh&agrave; em&rdquo; quyết phải c&oacute; những thứ đ&oacute;. Vậy nếu &ldquo;nh&agrave; em&rdquo; kh&ocirc;ng c&oacute;, em sẽ đ&agrave;nh thỏa hiệp v&agrave; cả n&oacute;i dối bằng c&aacute;ch bịa ra cho c&oacute;?</p>
	<p>
		Văn mẫu b&oacute; hẹp tr&iacute; tưởng tượng, l&agrave;m thui chột khả năng s&aacute;ng tạo, thiếu t&ocirc;n trọng sự kh&aacute;c biệt&hellip; của học sinh ra sao c&oacute; lẽ ch&uacute;ng ta đ&atilde; n&oacute;i nhiều. D&ugrave; rằng kh&ocirc;ng v&igrave; thế m&agrave; sự lạc hậu trong c&aacute;ch dạy v&agrave; học m&ocirc;n văn đ&atilde; được khắc phục như kỳ vọng.</p>
	<p>
		Nhưng kh&ocirc;ng chỉ gợi ra vấn đề &ldquo;văn mẫu&rdquo;, c&acirc;u chuyện đề văn &ldquo;tả con ch&oacute;&rdquo; c&ograve;n khiến ch&uacute;ng ta suy ngẫm về một điều rộng hơn.</p>
	<p>
		&ldquo;Rối loạn thiếu hụt thi&ecirc;n nhi&ecirc;n&rdquo; (Nature Deficit Disorder) l&agrave; một kh&aacute;i niệm do t&aacute;c giả - nh&agrave; b&aacute;o người Mỹ Ricard Louv đưa ra trong cuốn s&aacute;ch[1]của m&igrave;nh c&aacute;ch đ&acirc;y hơn 10 năm, cảnh b&aacute;o những hệ quả khi trẻ em ng&agrave;y c&agrave;ng c&aacute;ch biệt với th&ecirc;́ giới tự nhi&ecirc;n.</p>
	<p>
		Đ&acirc;y c&oacute; lẽ l&agrave; mối lo chung của thời hiện đại. Nhưng n&oacute; sẽ c&agrave;ng đ&aacute;ng quan t&acirc;m hơn ở Việt Nam, nơi c&oacute; nền gi&aacute;o dục qu&aacute; nặng về truyền đạt kiến thức v&agrave; mắc bệnh th&agrave;nh t&iacute;ch. Ngay cả c&aacute;c bậc phụ huynh hầu như cũng mới chăm chắm dồn mọi ch&uacute; &yacute; v&agrave;o điểm số, kiến thức con học được ở trường.</p>
	<p>
		Viết đến đ&acirc;y, t&ocirc;i nhớ lại một b&agrave;i b&aacute;o mi&ecirc;u tả một giờ học trong chủ đề &quot;Chia sẻ về c&aacute;c h&agrave;nh tinh&quot; của học sinh mẫu gi&aacute;o tại một trường quốc tế ở Tokyo, Nhật Bản. Th&ocirc;ng điệp ch&iacute;nh c&aacute;c c&ocirc; gi&aacute;o muốn truyền tải tới c&aacute;c em l&agrave; &quot;mọi lo&agrave;i động vật v&agrave; thực vật sống ở h&agrave;nh tinh ch&uacute;ng ta đều cần c&oacute; một m&ocirc;i trường đặc biệt của ri&ecirc;ng m&igrave;nh để sống v&agrave; ph&aacute;t triển khỏe mạnh&quot;.</p>
	<p>
		Để hiểu được th&ocirc;ng điệp đ&oacute;, c&aacute;c em được giao chăm s&oacute;c, chịu tr&aacute;ch nhiệm ho&agrave;n to&agrave;n với c&aacute;c con th&uacute; nu&ocirc;i của lớp học v&agrave; trồng những c&acirc;y xanh của ri&ecirc;ng m&igrave;nh: t&igrave;m loại thức ăn ph&ugrave; hợp, l&agrave;m nh&agrave; cho th&uacute; nu&ocirc;i, tưới nước hay theo d&otilde;i t&igrave;nh trạng sức khỏe của th&uacute; nu&ocirc;i v&agrave; c&acirc;y xanh&hellip;</p>
	<div type="Photo">
		<div>
			<img alt="Bật cười bài văn bá đạo của em bé khiến cô giáo cạn lời - Ảnh 2." data-original="http://afamilycdn.com/2017/photo-1-1495879810434.jpg" id="img_b7210ff0-42c4-11e7-b4a7-dfc2d8257ba1" rel="lightbox" src="http://afamilycdn.com/2017/photo-1-1495879810434.jpg" title="Bật cười bài văn bá đạo của em bé khiến cô giáo cạn lời - Ảnh 2." type="photo" /></div>
		<div>
			<p data-placeholder="[nhập chú thích]">
				Một bạn nhỏ đang tự tin thuyết tr&igrave;nh về th&oacute;i quen của lo&agrave;i ch&oacute; m&agrave; em đ&atilde; quan s&aacute;t được từ giờ học trong chủ đề &quot;Chia sẻ về c&aacute;c h&agrave;nh tinh&quot;.</p>
		</div>
	</div>
	<p>
		Quả vậy, kh&ocirc;ng g&igrave; thay được những trải nghiệm thực tế, trực tiếp trong m&ocirc;i trường, thi&ecirc;n nhi&ecirc;n. Qua đ&oacute; c&aacute;c em học hỏi, kh&aacute;m ph&aacute;, đặt c&acirc;u hỏi, hiểu được rằng mỗi c&aacute;i c&acirc;y, con vật đều c&oacute; t&acirc;m hồn v&agrave; quyền sống của m&igrave;nh. Hơn thế nữa, c&aacute;c em sẽ học được c&aacute;ch sống h&agrave;i h&ograve;a, biết t&ocirc;n trọng, chăm s&oacute;c v&agrave; bảo vệ những tạo vật xung quanh, d&ugrave; l&agrave; nhỏ nhất, hiểu được rằng thi&ecirc;n nhi&ecirc;n d&ugrave; c&oacute; l&agrave; &ldquo;rừng v&agrave;ng biển bạc&rdquo; cũng rất mong manh nếu mỗi người kh&ocirc;ng biết g&igrave;n giữ, n&acirc;ng niu.</p>
	<p>
		Những b&agrave;i văn viết ra đ&uacute;c r&uacute;t từ qu&aacute; tr&igrave;nh đ&oacute; chắc chắn sẽ tr&agrave;n đầy sức sống, t&igrave;nh y&ecirc;u thương, lấp l&aacute;nh c&aacute; t&iacute;nh, thay v&igrave; ng&ocirc;n từ kh&ocirc; cứng, khu&ocirc;n s&aacute;o, đ&ocirc;i khi cả giả dối trong những b&agrave;i văn kiểu &ldquo;học thuộc l&ograve;ng&rdquo;.</p>
</div>
<p>
	&nbsp;</p>
', 1, 4)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (109, N'Hơn 70.000 học sinh TP.HCM bắt đầu thi vào lớp 10', N'2017_06_06_22_47_54_68420170602073421-thi-lop-10-9-081719436.jpg', N' (Emdep.vn) - Sáng nay, hơn 70 nghìn học sinh TP.HCM bắt đầu làm bài thi vào lớp 10. Trong số này 63.000 em được vào lớp 10  ở trường THPT công lập và gần 2.000 vào lớp chuyên. ', CAST(N'2017-06-06 00:00:00.000' AS DateTime), 3, N'<p>
	<img src="http://thumb.connect360.vn/unsafe/700x0/imgs.emdep.vn/Share/Image/2017/06/02/20170602073421-thi-lop-10-9-081719436.jpg" /></p>
<p>
	Sở GD-ĐT TP.HCM cho biết kỳ thi tuyển sinh v&agrave;o lớp 10 năm nay c&oacute; 73.769 th&iacute; sinh dự thi, trong đ&oacute; 5.862 th&iacute; sinh đăng k&yacute; v&agrave;o c&aacute;c trường, lớp chuy&ecirc;n.&nbsp;</p>
<p>
	<img src="http://thumb.connect360.vn/unsafe/700x0/imgs.emdep.vn/Share/Image/2017/06/02/20170602073421-thi-lop-10-8-08171973.jpg" /></p>
<p>
	C&aacute;c th&iacute; sinh được ph&acirc;n bổ thi tại 125 điểm thi, trong đ&oacute;&nbsp;c&oacute; 115 điểm thi v&agrave;o lớp 10 thường,&nbsp;10 điểm thi v&agrave;o lớp 10 chuy&ecirc;n.&nbsp;</p>
<p>
	<img src="http://thumb.connect360.vn/unsafe/700x0/imgs.emdep.vn/Share/Image/2017/06/02/20170602073421-thi-lop-10-7-081719764.jpg" /></p>
<p>
	C&aacute;c th&iacute; sinh&nbsp;l&agrave;m b&agrave;i thi v&agrave;o ng&agrave;y 2 v&agrave; 3/6 với 3 m&ocirc;n thi To&aacute;n- Văn- Ngoại ngữ. Học sinh thi v&agrave;o trường chuy&ecirc;n, lớp chuy&ecirc;n thi th&ecirc;m m&ocirc;n chuy&ecirc;n.&nbsp;</p>
<p>
	<img src="http://thumb.connect360.vn/unsafe/700x0/imgs.emdep.vn/Share/Image/2017/06/02/20170602073421-thi-lop-10-5-081719875.jpg" /></p>
<p>
	V&agrave;o ng&agrave;y thi đầu ti&ecirc;n sẽ tổ chức lễ khai mạc v&agrave;o l&uacute;c 7h v&agrave; k&eacute;o d&agrave;i kh&ocirc;ng qu&aacute; 15 ph&uacute;t, v&igrave; vậy c&aacute;c th&iacute; sinh c&oacute; mặt l&uacute;c 6h30. Nhiều th&iacute; sinh kh&ocirc;ng kịp ăn s&aacute;ng ở nh&agrave; phải tới điểm thi ăn s&aacute;ng.&nbsp;</p>
<p>
	<img src="http://thumb.connect360.vn/unsafe/700x0/imgs.emdep.vn/Share/Image/2017/06/02/20170602073421-thi-lop-10-4-081719953.jpg" /></p>
<p>
	Buổi s&aacute;ng 2/6 th&iacute; sinh sẽ l&agrave;m b&agrave;i thi m&ocirc;n Ngữ Văn&nbsp;</p>
<p>
	<img src="http://thumb.connect360.vn/unsafe/700x0/imgs.emdep.vn/Share/Image/2017/06/02/20170602073421-thi-lop-10-3-081719992.jpg" /></p>
<p>
	Theo Sở GD-ĐT TP.HCM, đề thi &nbsp;tiếp tục đổi mới theo hướng kiểm tra năng lực vận dụng kiến thức v&agrave;o việc giải quyết c&aacute;c vấn đề thực tiễn nhưng nội dung b&aacute;m s&aacute;t chương tr&igrave;nh THCS.&nbsp;</p>
<p>
	<img src="http://thumb.connect360.vn/unsafe/700x0/imgs.emdep.vn/Share/Image/2017/06/02/20170602073421-thi-lop-10-2-081720062.jpg" /></p>
<p>
	<img src="http://thumb.connect360.vn/unsafe/700x0/imgs.emdep.vn/Share/Image/2017/06/02/20170602073421-thi-lop-10-10-081720112.jpg" /></p>
<p>
	Tranh thủ &ocirc;n b&agrave;i trước giờ thi&nbsp;</p>
<p>
	<img src="http://thumb.connect360.vn/unsafe/700x0/imgs.emdep.vn/Share/Image/2017/06/02/20170602073421-thi-lop-10-1-081720147.jpg" /></p>
<p>
	Trong số th&iacute; sinh thi v&agrave;o lớp 10 năm nay sẽ c&oacute; gần 9000 th&iacute; sinh phải học trường ngo&agrave;i c&ocirc;ng lập.&nbsp;</p>
<p>
	<img src="http://thumb.connect360.vn/unsafe/700x0/imgs.emdep.vn/Share/Image/2017/06/02/20170602073421-thi-lio-10-6-081720178.jpg" /></p>
<p>
	Số lượng th&iacute; sinh tăng do tăng d&acirc;n số cơ học, đẩy &aacute;p lực v&agrave;o lớp 10 tại TP.HCM ng&agrave;y một tăng cao&nbsp;</p>
<p>
	<a href="http://emdep.vn/nhip-song/hon-70000-hoc-sinh-tphcm-bat-dau-thi-vao-lop-10-20170602081731699.htm" target="_blank"><img alt=" thi vào lớp 10 " src="http://thumb.connect360.vn/unsafe/700x0/imgs.emdep.vn/Share/Image/2017/06/02/20170602073421-th-lop-10-081720211.jpg" /></a></p>
<p>
	D&ugrave; số học sinh tăng cao, nhưng hạn mức tuyển v&agrave;o lớp 10 c&ocirc;ng lập chỉ khoảng 76-77% trong tổng số dự thi. Đặc biệt theo định hướng ph&acirc;n luồng học sinh sau THCS của th&agrave;nh phố, bắt đầu từ năm học n&agrave;y, chỉ ti&ecirc;u v&agrave;o lớp 10 c&ocirc;ng lập mỗi năm sẽ giảm 3%.</p>
<p>
	Đến năm 2020, tỷ lệ học sinh theo học THPT c&ocirc;ng lập chỉ c&ograve;n 70%. Như vậy thi v&agrave;o lớp 10 tại TP.HCM sẽ ng&agrave;y c&agrave;ng căng thẳng.</p>
', 1, 4)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (110, N'Chị em nhiệt tình ''quân sư'' kế hoạch mua sắm 28 triệu đồng ra ở riêng của vợ chồng nghèo', N'2017_06_06_22_50_23_927orieng1-160356094.jpg', N' (Emdep.vn) - Ai cũng cho rằng ở riêng thì cây tăm cũng phải sắm. Nhưng dân mạng cũng góp ý tận tình cho chủ topic và bảo trong kế hoạch mua sắm trên có nhiều thứ không cần mua nếu như đang không có t', CAST(N'2017-06-06 00:00:00.000' AS DateTime), 1, N'<p>
	Mới đ&acirc;y, tr&ecirc;n diễn đ&agrave;n d&agrave;nh cho những người vợ trẻ, một b&agrave; mẹ trẻ t&ecirc;n L.L ở Bắc Giang đ&atilde; chia sẻ về kế hoạch mua sắm để ra ở ri&ecirc;ng của vợ chồng m&igrave;nh.</p>
<p>
	L.L kể r&otilde; về ho&agrave;n cảnh bản th&acirc;n:</p>
<p>
	&ldquo;Em l&agrave; c&aacute;i đứa mấy h&ocirc;m nay hay l&ecirc;n đ&acirc;y chia sẻ về cuộc sống của gia đ&igrave;nh nhỏ của em. Em bị bố mẹ chồng v&agrave; em g&aacute;i chồng &eacute;p hai b&agrave;n tay trắng ra ở ri&ecirc;ng đ&acirc;y ạ.</p>
<p>
	Vợ chồng em cố gắng kh&ocirc;ng yếu đuối, l&ecirc;n kế hoạch để chuẩn bị c&ugrave;ng c&aacute;c con dọn về nh&agrave; mới đ&acirc;y.</p>
<p>
	Em kể l&ecirc;n đ&acirc;y, t&iacute;nh ra mới c&oacute; 28 triệu th&ocirc;i nhưng qu&aacute; khả năng của em rồi. Nhưng vợ chồng em sẽ cố ạ.</p>
<p>
	Mọi người cho &yacute; kiến v&agrave; g&oacute;p &yacute; cho em với. Nh&agrave; em ở qu&ecirc; ạ. Xin đừng gạch đ&aacute; v&igrave; em đ&atilde; qu&aacute; khổ rồi&rdquo;.</p>
<p>
	Kể k&egrave;m theo ho&agrave;n cảnh phải ra ở ri&ecirc;ng bất đắc dĩ tr&ecirc;n, L.L c&ograve;n liệt k&ecirc; những thứ vợ chồng trẻ n&agrave;y dự định mua như:</p>
<p>
	<img alt="‘Ngó’ kế hoạch mua sắm 28 triệu đồng để ra ở riêng của vợ chồng trẻ" src="http://thumb.connect360.vn/unsafe/389x0/imgs.emdep.vn/Share/Image/2017/06/01/orieng1-160356094.jpg" /></p>
<p>
	- Khoan giếng: 5 triệu<br />
	- Sửa nh&agrave;: 5 triệu<br />
	- Bếp gas: 2 triệu<br />
	- Tủ lạnh: 3 triệu<br />
	- Tivi: 5 triệu<br />
	- B&aacute;t đũa + đồ vặt: 1 triệu<br />
	- B&agrave;n ghế: 4 triệu<br />
	- T&eacute;c nước: 3 triệu</p>
<p>
	Tổng chi: 28 triệu đồng&quot;.</p>
<p>
	Ngay khi chia sẻ kế hoạch mua sắm khi ra ở ri&ecirc;ng của vợ chồng, đ&atilde; thu h&uacute;t rất đ&ocirc;ng b&agrave; nội trợ c&oacute; kinh nghiệm. Ai cũng cho rằng ở ri&ecirc;ng th&igrave; c&acirc;y tăm cũng phải sắm. Nhưng d&acirc;n mạng cũng g&oacute;p &yacute; tận t&igrave;nh cho chủ topic v&agrave; bảo trong kế hoạch mua sắm tr&ecirc;n c&oacute; nhiều thứ kh&ocirc;ng cần mua nếu như đang kh&ocirc;ng c&oacute; tiền.</p>
<p>
	P.T.P đưa ra phương &aacute;n: &ldquo;Em nghĩ như n&agrave;y chị xem c&oacute; hợp l&yacute; kh&ocirc;ng nh&eacute;:<br />
	Khoan giếng: 5 triệu<br />
	Sửa nh&agrave;: 5 triệu<br />
	Bếp gas v&agrave; b&igrave;nh ga: Đợt em mua c&oacute; hơn triệu th&ocirc;i m&agrave; d&ugrave;ng cũng tốt lắm<br />
	Tủ lạnh: Chị n&ecirc;n mua mới tầm 5 triệu<br />
	Ti vi: mua c&aacute;i cũ b&igrave;nh thường xem tạm cũng được m&agrave;, đ&acirc;u cần phải mua c&aacute;i 5 triệu.<br />
	B&agrave;n ghế: Chưa c&oacute; cũng được, bọn em thu&ecirc; nh&agrave; n&ecirc;n kh&ocirc;ng c&oacute; b&agrave;n ghế g&igrave; cả. To&agrave;n trải chiếu ăn cơm th&ocirc;i&rdquo;.</p>
<p>
	N.N.L n&oacute;i: &ldquo;Theo em khoản b&agrave;n ghế m&igrave;nh b&ugrave; v&agrave;o sửa c&aacute;i nh&agrave; nền gạch hoa m&aacute;t mẻ, k&ecirc; c&aacute;i b&agrave;n ngồi bệt cho gọn, con c&aacute;i c&oacute; chỗ chơi. Sau c&oacute; điều kiện th&igrave; sắm sau.</p>
<p>
	<img alt="‘Ngó’ kế hoạch mua sắm 28 triệu đồng để ra ở riêng của vợ chồng trẻ" src="http://thumb.connect360.vn/unsafe/480x0/imgs.emdep.vn/Share/Image/2017/06/01/hqdefault-160713829.jpg" /></p>
<p>
	Ti vi c&oacute; cũng được, kh&ocirc;ng c&oacute; cũng chẳng sao v&igrave; nh&agrave; em c&ograve;n đang cấm con xem ti vi nhiều đấy. Th&ocirc;ng tin đa phần l&ecirc;n mạng rồi. Bếp ga mua loại vừa tiền 1 triệu cũng ổn, cả bộ tầm 1,5 triệu l&agrave; d&ugrave;ng v&agrave;i năm chưa hỏng. C&aacute;i cần thiết th&igrave; l&agrave;m trước, thiếu vay mượn tạm nếu cần thiết&rdquo;.</p>
<p>
	S.S đưa ra phương &aacute;n kh&aacute;c: &ldquo;Bếp ga m&igrave;nh mua cả b&igrave;nh nữa l&agrave; 1 triệu bạn ạ. C&ograve;n ti vi n&oacute;i thật giờ to&agrave;n d&ugrave;ng điện thoại ấy n&ecirc;n bạn cắt khoản ti vi, b&agrave;n ghế đi. Xong lắp điều ho&agrave; cũ cũng được. N&oacute;ng con đỡ khổ. C&ograve;n c&aacute;i g&igrave; thật sự cần th&igrave; sắm trước. C&ograve;n lại th&igrave; sắm dần. C&ograve;n phải đề ph&ograve;ng con c&aacute;i ốm đau c&oacute; dự trữ lo cho con bạn ạ&rdquo;.</p>
<p>
	Bạn P.S cũng c&oacute; &yacute; kiến: &ldquo;B&acirc;y giờ ra ở ri&ecirc;ng vốn liếng &iacute;t bạn n&ecirc;n chi ti&ecirc;u hợp l&yacute;, ph&ograve;ng con ốm kh&ocirc;ng c&oacute; 1 đồng. T&ocirc;i c&oacute; &yacute; thế n&agrave;y xem gi&uacute;p g&igrave; kh&ocirc;ng?</p>
<p>
	Khoan giếng: 5 triệu<br />
	Sửa nh&agrave;: 5 triệu (cả sơn nh&agrave; nhưng mua loại rẻ th&ocirc;i)<br />
	Bếp ga mua 700 ng&agrave;n d&ugrave;ng qu&aacute; ổn<br />
	Tủ lạnh mua đồ thanh l&yacute; t&igrave;m xem ai muốn thay tủ m&agrave; mua 1 triệu<br />
	Ti vi kh&ocirc;ng cần mới kiếm tạm c&aacute;i 21 inch cũ bắt c&aacute;p l&agrave; ok tầm 300-500 ng&agrave;n đồng<br />
	B&agrave;n ghế mua loại vừa tiền mới cũng tầm 2,5 triệu loại n&agrave;y cũng bền<br />
	T&eacute;c nước phải mua mới cho đảm bảo v&igrave; sức khỏe gia đ&igrave;nh. Loại 1200ml tầm 2,3 triệu<br />
	B&aacute;t mua loại 6 ng&agrave;n đồng/1 chiếc b&aacute;t trắng kh&ocirc;ng họa tiết, t&ocirc;, đĩa, đũa dao thớt&hellip;700 ng&agrave;n bao gồm mắm muối&rdquo;.</p>
<p>
	<a href="http://emdep.vn/nhip-song/chi-em-nhiet-tinh-quan-su-ke-hoach-mua-sam-28-trieu-dong-ra-o-rieng-cua-vo-chong-ngheo-20170601155756505.htm" target="_blank"><img alt="ở riêng" src="http://thumb.connect360.vn/unsafe/359x0/imgs.emdep.vn/Share/Image/2017/06/01/orieng2-160356604.jpg" /></a></p>
<p>
	N&oacute;i chung cư d&acirc;n mạng mỗi người đưa phương &aacute;n kh&aacute;c nhau. Nhưng họ đều cho rằng, c&aacute;i g&igrave; cần sẽ mua trước nhưng chưa c&oacute; tiền th&igrave; sắm sau. Đặc biệt n&ecirc;n mua trong giới hạn khoản tiền c&oacute;, kh&ocirc;ng đi vay. Nếu kh&ocirc;ng c&oacute; mua đồ cũ d&ugrave;ng tạm một v&agrave;i năm vẫn tốt.</p>
<p>
	&ldquo;Ngh&egrave;o th&igrave; chấp nhận, cứ miễn t&iacute;ch g&oacute;p dần từng th&aacute;ng sẽ d&ocirc;i ra. Đừng vay mượn g&igrave; cả&rdquo;.</p>
<p>
	Thời điểm n&agrave;y, topic về kế hoạch mua sắm ra ở ri&ecirc;ng tr&ecirc;n vẫn h&uacute;t d&acirc;n mạng chia sẻ. Nhất l&agrave; những người vợ c&oacute; kinh nghiệm, họ đều vạch cho chủ topic một kế hoạch tiết kiệm chi li đến từng đồng, gi&uacute;p người vợ n&agrave;y mua sắm đầy đủ nhất cho kế hoạch ra ở ri&ecirc;ng m&agrave; vẫn tiết kiệm được 1 nửa ng&acirc;n s&aacute;ch ban đầu đưa ra.</p>
', 1, 4)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (111, N'Chợ Tết Đoan Ngọ: Rượu xôi nếp, nếp cẩm 40-60 ngàn đồng/kg tới tấp khách mua', N'2017_06_06_22_52_36_25218739854-07073358.jpg', N' (Emdep.vn) - Mới sáng sớm, chợ Tết Đoan Ngọ đã tấp nập bà nội trợ đi mua sắm. Ai cũng đến hàng nếp cẩm, rượu nếp, xôi chè, vịt, vải, mận để mua bán khiến không khí chợ ngày này vô cùng đông đúc, đắt ', CAST(N'2017-06-06 00:00:00.000' AS DateTime), 2, N'<p>
	Do nhiều người phải đi l&agrave;m sớm, n&ecirc;n mới 7 giờ s&aacute;ng, một số mặt h&agrave;ng b&aacute;n cực chạy như vải, rượu nếp, nếp cẩm đ&atilde; b&aacute;n hết sớm.</p>
<div type="Photo">
	<div>
		<img alt="
Khách mua nếp cẩm
" data-original="https://dantricdn.com/2017/kinh-doanh-ngay-tet-doan-ngo-3-1496115640830.jpg" id="img_110875" rel="https://dantricdn.com/2017/kinh-doanh-ngay-tet-doan-ngo-3-1496115640830.jpg" src="https://dantricdn.com/thumb_w/640/2017/kinh-doanh-ngay-tet-doan-ngo-3-1496115640830.jpg" type="photo" /></div>
	<div>
		<p>
			Kh&aacute;ch mua nếp cẩm</p>
	</div>
</div>
<p>
	Chị Ng&ocirc; Thị B&iacute;ch, h&agrave;ng ng&agrave;y vẫn b&aacute;n g&agrave; luộc, đồ lễ, nhưng năm n&agrave;o v&agrave;o ng&agrave;y Tết Đoan Ngọ chị cũng l&agrave;m 100 kg rượu nếp v&agrave; 40 kg nếp cẩm để b&aacute;n th&ecirc;m. Chị B&iacute;ch cho biết, &ldquo;Mở h&agrave;ng ra từ 5 giờ s&aacute;ng m&agrave; đ&atilde; c&oacute; người đến mua. M&igrave;nh l&agrave;m 2 loại n&ecirc;n kh&aacute;ch th&igrave; ăn loại n&agrave;o th&igrave; mua, 1 cốc rượu nếp 250g c&oacute; gi&aacute; 10.000 đồng, nếp cẩm th&igrave; &iacute;t hơn, khoảng 200g nhưng cũng c&oacute; gi&aacute; 10.000 đồng/cốc.&rdquo;</p>
<div type="Photo">
	<div>
		<img alt="Cả một bàn đầy mà 8 giờ sáng chỉ còn 1 góc" data-original="https://dantricdn.com/2017/kinh-doanh-ngay-tet-doan-ngo-2-1496115655061.jpg" id="img_110876" rel="https://dantricdn.com/2017/kinh-doanh-ngay-tet-doan-ngo-2-1496115655061.jpg" src="https://dantricdn.com/thumb_w/640/2017/kinh-doanh-ngay-tet-doan-ngo-2-1496115655061.jpg" type="photo" /></div>
	<div>
		Cả một b&agrave;n đầy m&agrave; 8 giờ s&aacute;ng chỉ c&ograve;n 1 g&oacute;c</div>
</div>
<p>
	&ldquo;Nghe 100 kg tưởng nhiều nhưng cũng chỉ ra được c&oacute; 400 cốc rượu nếp, 200 cốc nếp cẩm, chục kh&aacute;ch v&agrave;o c&oacute; khi đ&atilde; hết nửa h&agrave;ng v&igrave; họ to&agrave;n mua 3 &ndash; 4 cốc cho cả nh&agrave;. B&aacute;n nhanh như mọi năm th&igrave; 9 giờ l&agrave; đ&atilde; hết h&agrave;ng, m&agrave; h&agrave;ng n&agrave;o trong chợ cũng b&aacute;n nhanh như vậy chứ kh&ocirc;ng ri&ecirc;ng g&igrave; m&igrave;nh&rdquo;, chị B&iacute;ch cho biết th&ecirc;m.</p>
<p>
	Chị Nguyễn Mai Hương, một tiểu thương tại chợ Định C&ocirc;ng, mọi ng&agrave;y thường b&aacute;n thịt buổi chiều nhưng s&aacute;ng cũng b&agrave;y th&ecirc;m rượu nếp ra b&aacute;n. Chị cho biếtL &ldquo;Muốn c&oacute; rượu nếp với nếp cẩm b&aacute;n th&igrave; phải chuẩn bị từ tối m&ugrave;ng 3 &acirc;m, th&igrave; đến s&aacute;ng m&ugrave;ng 5 mới c&oacute; h&agrave;ng để b&aacute;n. B&aacute;n lẻ th&igrave; 15.000 đồng/cốc cả 2 loại, nhưng nếp cẩm sẽ được &iacute;t hơn.&rdquo;</p>
<p>
	&ldquo;Kh&aacute;ch mua nhiều cũng kh&ocirc;ng giảm gi&aacute; được v&igrave; ng&agrave;y n&agrave;y b&aacute;n lẻ cũng sẽ hết h&agrave;ng n&ecirc;n kh&ocirc;ng cần b&aacute;n bu&ocirc;n. C&ograve;n nếu kh&aacute;ch mua về l&agrave;m th&igrave; m&igrave;nh b&aacute;n 25.000 đồng/kg gạo nếp trắng v&agrave; men, nếp cẩm th&igrave; 35.000 đồng/kg gạo v&agrave; men. L&atilde;i kh&ocirc;ng d&agrave;y nhưng cũng c&oacute; th&ecirc;m đồng ra đồng v&agrave;o cải thiện bữa ăn cho gia đ&igrave;nh&rdquo;, chị Hương cho biết th&ecirc;m.</p>
<div type="Photo">
	<div>
		<img alt="Sữa chua nếp cẩm" data-original="https://dantricdn.com/2017/kinh-doanh-ngay-tet-doan-ngo-4-1496115703410.jpg" id="img_110877" rel="https://dantricdn.com/2017/kinh-doanh-ngay-tet-doan-ngo-4-1496115703410.jpg" src="https://dantricdn.com/thumb_w/640/2017/kinh-doanh-ngay-tet-doan-ngo-4-1496115703410.jpg" type="photo" /></div>
	<div>
		Sữa chua nếp cẩm</div>
</div>
<p>
	L&agrave; sinh vi&ecirc;n năm cuối một trường Cao đẳng tại H&agrave; Nội, Phạm Phương Anh kh&ocirc;ng c&oacute; thời gian tự l&agrave;m nếp cẩm nhưng c&ocirc; bạn rất y&ecirc;u th&iacute;ch m&oacute;n n&agrave;y. Phương Anh cho biết, &ldquo;Sữa chua nếp cẩm l&agrave; m&oacute;n y&ecirc;u th&iacute;ch của m&igrave;nh, b&igrave;nh thường ăn ngo&agrave;i qu&aacute;n cũng đ&atilde; 15.000 &ndash; 20.000 đồng/cốc. N&ecirc;n h&ocirc;m nay ngo&agrave;i chợ b&aacute;n 10.000 &ndash; 15.000 đồng/cốc cũng kh&ocirc;ng phải l&agrave; đắt. M&igrave;nh mua hẳn 2 cốc k&egrave;m v&agrave;i hộp sữa chua về diệt s&acirc;u bọ theo c&aacute;ch m&igrave;nh vẫn hay l&agrave;m.&rdquo;</p>
<p>
	Kh&ocirc;ng chỉ rượu nếp, nếp cẩm b&aacute;n chạy, 2 loại hoa quả truyền thống cho ng&agrave;y n&agrave;y l&agrave; vải v&agrave; mận cũng hết b&aacute;n hết rất nhanh. Chị Ng&ocirc; Mai, c&oacute; một quầy hoa quả tại chợ cho biết, &ldquo;Vải c&oacute; 2 loại 45 &ndash; 50 ngh&igrave;n đồng/kg v&agrave; 60 &ndash; 65 ngh&igrave;n đồng/kg, nhưng ngon hay kh&ocirc;ng ngon th&igrave; h&ocirc;m nay cũng hết cực sớm. Chị đ&atilde; phải nhập gấp đ&ocirc;i so với ng&agrave;y thường l&ecirc;n 60 kg nhưng cũng hết trong 2 &ndash; 3 tiếng, c&ograve;n 1 ch&ugrave;m để l&aacute;t mang về cho bọn trẻ ở nh&agrave; m&agrave; kh&aacute;ch cứ gạ mua m&atilde;i.&rdquo;</p>
<div type="Photo">
	<div>
		<img alt="Hàng bán hết khá sớm, chủ sạp hoa quả chỉ còn lại 1 chùm để mang về" data-original="https://dantricdn.com/2017/kinh-doanh-ngay-tet-doan-ngo-1496116005027.jpg" id="img_110878" rel="https://dantricdn.com/2017/kinh-doanh-ngay-tet-doan-ngo-1496116005027.jpg" src="https://dantricdn.com/thumb_w/640/2017/kinh-doanh-ngay-tet-doan-ngo-1496116005027.jpg" type="photo" /></div>
	<div>
		H&agrave;ng b&aacute;n hết kh&aacute; sớm, chủ sạp hoa quả chỉ c&ograve;n lại 1 ch&ugrave;m để mang về</div>
</div>
<div type="Photo">
	<div>
		<img alt="Gánh hàng rong chủ yếu chỉ bán vải và mận" data-original="https://dantricdn.com/2017/kinh-doanh-ngay-tet-doan-ngo-1-1496115686566.jpg" id="img_110879" rel="https://dantricdn.com/2017/kinh-doanh-ngay-tet-doan-ngo-1-1496115686566.jpg" src="https://dantricdn.com/thumb_w/640/2017/kinh-doanh-ngay-tet-doan-ngo-1-1496115686566.jpg" type="photo" /></div>
	<div>
		G&aacute;nh h&agrave;ng rong chủ yếu chỉ b&aacute;n vải v&agrave; mận</div>
</div>
<p>
	&ldquo;Mận th&igrave; b&aacute;n 30.000 - 40.000 đồng/kg, chậm hơn một ch&uacute;t so với vải nhưng 1 th&ugrave;ng 40 kg cũng chỉ c&ograve;n lại 1 &iacute;t, m&agrave; chủ yếu to&agrave;n quả nhỏ v&agrave; xanh. Cả vải với mận mỗi c&acirc;n cũng l&atilde;i được 5.000 &ndash; 10.000 đồng/kg, n&ecirc;n t&iacute;nh ri&ecirc;ng 2 loại cũng phải được 1 triệu tiền l&atilde;i h&ocirc;m nay&rdquo;, chị Mai cho hay.</p>
<p>
	Nhiều người lại chọn vịt cho ng&agrave;y Tết Đoan Ngọ để giết s&acirc;u bọ, anh Đinh Huy Linh đang l&agrave;m tại Long Bi&ecirc;n được cử đi mua vịt từ s&aacute;ng sớm để phục vụ bữa trưa cho cơ quan. Sau khi tham khảo một v&ograve;ng quanh chợ anh cũng mua được 3 con vịt gần 10 kg.</p>
<p>
	Nhưng theo anh Linh: &ldquo;C&oacute; 2 loại vịt, một loại bị nhồi căng diều c&oacute; gi&aacute; 45.000 đồng/kg, c&ograve;n loại kh&ocirc;ng bị nhồi th&igrave; 50.000 đồng/kg. V&igrave; ng&agrave;y lễ n&ecirc;n gi&aacute; cũng c&oacute; tăng nhẹ hơn so với ng&agrave;y thường một ch&uacute;t kh&ocirc;ng đ&aacute;ng kể, c&ograve;n muốn mua vịt ngon th&igrave; phải đi chợ sớm.&rdquo;</p>
<p>
	H&agrave; Tĩnh: Gi&aacute; thực phẩm &quot;t&eacute; nước theo mưa&quot; trong dịp Tết Đoan Ngọ</p>
<p>
	V&agrave;o dịp Tết Đoan Ngọ, dạo quanh c&aacute;c chợ tại khu vực chợ TP H&agrave; Tĩnh như chợ Vườn Ươm, chợ tỉnh, chợ Trung Đ&igrave;nh... đ&acirc;u đ&acirc;u cũng thấy người b&aacute;n vịt. Từ vỉa h&egrave;, đến khu vực cổng v&agrave;o nhiều sọt b&aacute;n vịt được mọc l&ecirc;n b&agrave;y la liệt. Từ vịt nguy&ecirc;n con đến vịt l&agrave;m rồi, hay thậm ch&iacute; cả vịt nấu sẵn đều được b&agrave;y b&aacute;n phục vụ c&aacute;c &quot;thượng đế&quot; trong dịp n&agrave;y.</p>
<div type="Photo">
	<div>
		<img alt="
Các lồng bán vịt được bày bán trên vỉa hè với giá khoảng 70.000 đồng/con (loại còn sống)
" data-original="https://dantricdn.com/2017/photo-0-1496124620532.jpg" id="img_aad0ebd0-44fe-11e7-b2d0-cdf7a36e9bbc" rel="https://dantricdn.com/2017/photo-0-1496124620532.jpg" src="https://dantricdn.com/thumb_w/640/2017/photo-0-1496124620532.jpg" type="photo" /></div>
	<div>
		<p>
			C&aacute;c lồng b&aacute;n vịt được b&agrave;y b&aacute;n tr&ecirc;n vỉa h&egrave; với gi&aacute; khoảng 70.000 đồng/con (loại c&ograve;n sống)</p>
	</div>
</div>
<p>
	C&aacute;c quầy h&agrave;ng b&aacute;n vịt bỗng chốc mọc l&ecirc;n như nấm nhưng vẫn kh&ocirc;ng kịp b&aacute;n d&ugrave; thời điểm hiện tại vịt c&oacute; gi&aacute; từ 70.000 đồng/con loại chưa l&agrave;m l&ocirc;ng v&agrave; khoảng 80.000 - 85.000 đồng/con đối với vịt đ&atilde; l&agrave;m sạch. Theo nhiều người b&aacute;n th&igrave; bắt đầu từ ng&agrave;y h&ocirc;m qua gi&aacute; vịt đ&atilde; đắt hơn ng&agrave;y thường từ 10.000 - 15.000 đồng/ con.</p>
<p>
	Một người b&aacute;n vịt cho hay, từ s&aacute;ng đến trưa, trung b&igrave;nh một quầy h&agrave;ng b&aacute;n từ 20 - 50 con vịt. Những quầy đ&ocirc;ng người phụ l&agrave;m th&igrave; c&ograve;n nhiều hơn.</p>
<div type="Photo">
	<div>
		<img alt="
Thời điểm hiện nay vịt có giá khoảng 80.000 đồng - 85.000 đồng/ con loại đã làm sạch
" data-original="https://dantricdn.com/2017/photo-1-1496124620557.jpg" id="img_aacfb350-44fe-11e7-9802-d3d889db2c65" rel="https://dantricdn.com/2017/photo-1-1496124620557.jpg" src="https://dantricdn.com/thumb_w/640/2017/photo-1-1496124620557.jpg" type="photo" /></div>
	<div>
		<p>
			Thời điểm hiện nay vịt c&oacute; gi&aacute; khoảng 80.000 đồng - 85.000 đồng/ con loại đ&atilde; l&agrave;m sạch</p>
	</div>
</div>
<p>
	Anh Trần Văn Thảo (phường Thạch Qu&yacute;, TP. H&agrave; Tĩnh) - một người mua h&agrave;ng, lắc đầu: Kh&ocirc;ng chỉ vịt b&aacute;n ở chợ cũng cao gi&aacute; m&agrave; mua tận nh&agrave; cũng với gi&aacute; n&agrave;y. Vịt tăng gi&aacute; đ&atilde; đ&agrave;nh m&agrave; c&aacute;c loại thức ăn k&egrave;m cũng tăng gi&aacute;.</p>
<p>
	Nhiều mặt h&agrave;ng cũng &quot;t&eacute; nước theo mưa&quot; tăng gi&aacute; bất thường như: b&uacute;n, riềng, sả, măng tươi... Theo chị Li&ecirc;n (phường Bắc H&agrave;, Tp H&agrave; Tĩnh) cho biết: &quot;B&igrave;nh thường măng chỉ khoảng 20.000 - 30.000đồng/kg m&agrave; giờ c&oacute; loại 50.000đồng/kg. Thấy người b&aacute;n cứ n&oacute;i mua v&agrave;o đắt, nhưng l&agrave;m g&igrave; c&oacute; chuyện 2 ng&agrave;y m&agrave; gi&aacute; tăng gấp đ&ocirc;i như thế.&quot;</p>
<p>
	B&uacute;n cũng l&agrave; mặt h&agrave;ng được c&aacute;c b&agrave; nội mua nhiều trong dịp n&agrave;y. C&oacute; gi&aacute; tăng gi&aacute; nhẹ từ 2.000 - 3.000 đồng/kg nhưng c&aacute;c quầy b&uacute;n l&uacute;c n&agrave;o cũng đ&ocirc;ng kh&aacute;ch. Chị L&ecirc; - b&aacute;n b&uacute;n tại chợ Vườn Ươm cho biết: &quot;H&ocirc;m nay, t&ocirc;i lấy nhiều hơn so với mọi ng&agrave;y m&agrave; cũng b&aacute;n hết veo phải lấy th&ecirc;m để b&aacute;n.</p>
', 1, 4)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (112, N'Bà nội trợ Sài Gòn ''ngậm đắng'' vì phải mua vải giá cắt cổ 150 ngàn đồng/kg', N'2017_06_06_22_55_05_303chemdep1-144038801.jpg', N' (Emdep.vn) - “Ở Hà Nội, giờ đang là mùa vải, có 30 ngàn đồng/1kg”, “Ở Nghệ An 35 ngàn đồng loại này thôi chị ạ”, “Ở Yên Bái có 25 ngàn đồng”, “Quảng Ninh vải chỗ em có 20 ngàn đồng thôi”… là bình luậ', CAST(N'2017-06-06 00:00:00.000' AS DateTime), 12, N'<p>
	Chuyện đi chợ bị kh&aacute;ch h&agrave;ng &ldquo;ch&eacute;m ngọt&rdquo;, b&aacute;n gi&aacute; cắt cổ kh&ocirc;ng c&ograve;n l&agrave; chuyện lạ nữa. Thế nhưng giữa m&ugrave;a vải m&agrave; phải mua vải gi&aacute; đắt gấp cả nhiều lần thực tế như vậy khi c&oacute; gi&aacute; tận 150 ng&agrave;n đồng/kg tưởng như chuyện kh&ocirc;ng tưởng nhưng lại xảy ra s&aacute;ng nay.</p>
<p>
	C&acirc;u chuyện mua vải thiều gi&aacute; cắt cổ tr&ecirc;n được facebook B.B note lại c&aacute;ch đ&acirc;y 1h tr&ecirc;n một hội nh&oacute;m d&agrave;nh cho c&aacute;c b&agrave; mẹ trẻ đ&atilde; khiến nhiều b&agrave; nội trợ kh&ocirc;ng khỏi cảm thấy bực tức thay chủ topic.</p>
<p>
	Theo đ&oacute;, facebook B.B kể: &ldquo;S&aacute;ng đi ra chợ mua vải m&agrave; qu&ecirc;n kh&ocirc;ng hỏi gi&aacute;. C&acirc;n xong t&iacute;nh tiền mới biết l&agrave; 150 ng&agrave;n đồng cho 1kg vải. M&igrave;nh k&ecirc;u trời ơi đắt vậy kh&ocirc;ng lấy nữa th&igrave; bị người b&aacute;n h&agrave;ng chửi v&agrave; bắt m&igrave;nh lấy v&igrave; mới s&aacute;ng sớm bảo chưa b&aacute;n h&agrave;ng.</p>
<p>
	<img alt="" src="https://vtv1.mediacdn.vn/thumb_w/600/2016/vai-thieu-bac-giang-1466732534737.jpg" style="width: 600px; height: 385px;" /></p>
<p>
	Chợ t&ecirc;n g&igrave; kh&ocirc;ng biết nhưng ở quận 3 S&agrave;i G&ograve;n chứ kh&ocirc;ng phải khu du lịch n&agrave;o đ&acirc;u. B&aacute;n bu&ocirc;n thế n&agrave;y chẳng mấy m&agrave; gi&agrave;u c&aacute;c mẹ nhỉ?&rdquo;.</p>
<p>
	Ngay sau khi chia sẻ, c&acirc;u chuyện mua vải với gi&aacute; &ldquo;tr&ecirc;n trời&rdquo; tr&ecirc;n đ&atilde; h&uacute;t sự ch&uacute; &yacute; của d&acirc;n mạng. Ai cũng cho rằng, mua vải với gi&aacute; tr&ecirc;n ngay giữa m&ugrave;a vải quả thật muốn&hellip; ngất.</p>
<p>
	&ldquo;Ở H&agrave; Nội, giờ đang l&agrave; m&ugrave;a vải, c&oacute; 30 ng&agrave;n đồng/1kg&rdquo;, &ldquo;Ở Nghệ An 35 ng&agrave;n đồng loại n&agrave;y th&ocirc;i chị ạ&rdquo;, &ldquo;Ở Y&ecirc;n B&aacute;i c&oacute; 25 ng&agrave;n đồng&rdquo;, &ldquo;Quảng Ninh vải chỗ em c&oacute; 20 ng&agrave;n đồng th&ocirc;i&rdquo;&hellip; l&agrave; b&igrave;nh luận về gi&aacute; vải hiện nay ở nhiều nơi của d&acirc;n mạng.</p>
<p>
	&nbsp;</p>
<p>
	Theo như B.B, c&ocirc; cũng biết bản th&acirc;n bị ch&eacute;m đẹp s&aacute;ng nay khi mua vải m&agrave; qu&ecirc;n kh&ocirc;ng hỏi gi&aacute; trước. Nhưng v&igrave; thời điểm đ&oacute;, B.B đang thấy mệt trong người n&ecirc;n kh&ocirc;ng muốn c&atilde;i nhau với người b&aacute;n h&agrave;ng: &ldquo;B&igrave;nh thường l&agrave; sẽ chửi n&oacute; đấy nhưng do mặt m&igrave;nh đang bị thương. Miệng cũng kh&ocirc;ng h&aacute; to ra m&agrave; n&oacute;i được n&ecirc;n th&ocirc;i, m&igrave;nh coi như gặp xui&rdquo;.</p>
<p>
	&ldquo;Trong Hồ Ch&iacute; Minh kh&ocirc;ng c&oacute; nhiều vải n&ecirc;n gi&aacute; sẽ đắt hơn. Nhưng thật l&agrave; chị bị ch&eacute;m &aacute;c qu&aacute;&rdquo; l&agrave; b&igrave;nh luận của K.G.</p>
<p>
	N.P.T n&oacute;i: &ldquo;Bị ch&eacute;m ngọt qu&aacute; th&agrave;nh đắng lu&ocirc;n ấy. Mấy quả vải n&agrave;y chị ăn chắc chua v&agrave; ch&aacute;t lắm đ&acirc;y&rdquo;.</p>
<p>
	Nhiều d&acirc;n mạng cho rằng, chủ topic qu&aacute; hiền l&agrave;nh. Nếu như trong trường hợp của họ, người b&aacute;n h&agrave;ng đừng h&ograve;ng bắt nạt được d&ugrave; họ kh&ocirc;ng hỏi gi&aacute; trước đi chăng nữa.</p>
<p>
	A.B khẳng định: &ldquo;&Ocirc;i thế m&agrave; mẹ n&oacute; cũng mua chứ phải em, em đập v&agrave;o mặt người b&aacute;n h&agrave;ng. D&aacute;t v&agrave;ng &agrave; m&agrave; b&aacute;n với bu&ocirc;n như vậy. Chỗ nh&agrave; em c&oacute; 20 ng&agrave;n/1kg&rdquo;.</p>
<p>
	&nbsp;</p>
<p>
	D.H.T n&oacute;i: &ldquo;&Ocirc;i, n&oacute; chửi bạn, bạn kh&ocirc;ng biết chửi lại &agrave;? Tiền trong t&uacute;i m&igrave;nh m&agrave;. N&oacute; m&agrave; cố lấy h&ocirc; cướp loạn l&ecirc;n xem n&oacute; l&agrave;m được g&igrave;&rdquo;.</p>
<p>
	Nhiều b&agrave; nội trợ kh&aacute;c trước c&acirc;u chuyện mua vải đầu m&ugrave;a bị &ldquo;ch&eacute;m đẹp&rdquo; tr&ecirc;n cũng nhớ lại những lần đi mua hoa quả bị kh&aacute;ch b&aacute;n gi&aacute; cắt cổ.</p>
<p>
	H.T kể: &ldquo;Kh&ocirc;ng mua kệ n&oacute; chứ. Giết người &agrave;? Lại giống lần em mua d&acirc;u t&acirc;y của người b&aacute;n rong. Em hỏi bao nhi&ecirc;u tiền 1kg th&igrave; n&oacute; bảo 30 ng&agrave;n đồng. V&igrave; thế, em nhặt lấy nhặt để. C&acirc;n l&ecirc;n n&oacute; bảo của chị 1kg l&agrave; 300 ng&agrave;n đồng. Em kh&ocirc;ng lấy lu&ocirc;n. Giết người đ&acirc;u m&agrave; 300 ng&agrave;n/1kg d&acirc;u t&acirc;y quả b&eacute; t&iacute;&rdquo;.</p>
<p>
	&nbsp;</p>
<p>
	M.P.N cũng kể: &ldquo;Em đi mua hoa cũng thế. B&agrave; b&aacute;n h&agrave;ng như định đ&aacute;nh em n&ecirc;n em phải cắn răng mua tạm&rdquo;.</p>
<p>
	Nhiều người th&igrave; cho rằng, b&agrave;i học r&uacute;t ra l&agrave; đi mua g&igrave; cũng phải hỏi gi&aacute; trước. Được gi&aacute; th&igrave; mua kh&ocirc;ng được th&igrave; th&ocirc;i. Chứ chọn v&agrave;o v&agrave; bọc c&acirc;n mới biết gi&aacute; rồi ch&ecirc; đắt th&igrave; dễ bị người b&aacute;n h&agrave;ng chửi v&igrave; s&aacute;ng sớm ra mới mở h&agrave;ng. Nhưng b&aacute;n h&agrave;ng gi&aacute; cắt cổ như thế kia th&igrave; chỉ phải một lần, lần sau kh&ocirc;ng c&oacute; chuyện kh&aacute;ch quay lại mua.</p>
<p>
	C&acirc;u chuyện tr&ecirc;n vẫn đang h&uacute;t d&acirc;n mạng comment r&ocirc;m rả.</p>
', 1, 5)
GO
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (113, N'Quả xoài 1,7 triệu, vải thiều 400 ngàn/12 quả: Xót lòng dân Việt', N'2017_06_06_23_00_39_59120170601200256-xoai-nhat-070925983.jpg', N' (Emdep.vn) - Một quả xoài Nhật Bản nặng 350-400g bán ở Việt Nam với giá 1,7 triệu đồng, trong khi đó 12 quả vải thiều Việt Nam bán ở siêu thị Nhật giá 430.000 đồng. Nhiều người xót ruột khi phải ăn h', CAST(N'2017-06-06 00:00:00.000' AS DateTime), 3, N'<p>
	Một tr&aacute;i xo&agrave;i nặng 350-400 gram b&aacute;n tại Việt Nam với gi&aacute; 1,7 triệu Trong khi đ&oacute;, 12 vải thiều Việt Nam được b&aacute;n Tại si&ecirc;u thị Nhật Bản gi&aacute; 430.000 đồng. Nhiều người c&oacute; can đảm khi phải ăn tr&aacute;i c&acirc;y nhập khẩu đắt tiền trong khi xuất khẩu với gi&aacute; rẻ.</p>
<p>
	<img alt="" src="https://vtv1.mediacdn.vn/thumb_w/600/2016/vai-thieu-bac-giang-1466732534737.jpg" style="width: 600px; height: 385px;" /></p>
<p>
	H&agrave;ng Việt Nam đắt hơn h&agrave;ng Nhật</p>
<p>
	Kh&ocirc;ng được bọc v&agrave; b&aacute;n theo trọng lượng, tại một số cửa h&agrave;ng tr&aacute;i c&acirc;y nhập khẩu tại Việt Nam, mỗi loại quả <a href="http://soha.vn/xoai.html" target="_blank" title="xoài"> xo&agrave;i </a> Nhật Bản bọc ri&ecirc;ng lẻ trong t&uacute;i nhựa, l&oacute;t bằng một lớp lưới bọt Chống nghiền v&agrave; cuối c&ugrave;ng đặt trong suốt Hộp nhựa d&aacute;n nh&atilde;n m&atilde; vạch đầy đủ, b&aacute;n quả.</p>
<p>
	Đ&aacute;ng ch&uacute; &yacute;, một xo&agrave;i đỏ Nhật chỉ nặng 350-400 gram nhưng gi&aacute; l&ecirc;n tới 1,7 triệu. Nếu t&iacute;nh trọng số, xo&agrave;i Nhật Bản đắt hơn xo&agrave;i Việt gấp 100 lần.</p>
<p>
	Theo b&agrave; L&ecirc; Thị Phương, chủ cửa h&agrave;ng tr&aacute;i c&acirc;y nhập khẩu ở Huế (Hai B&agrave; Trưng, ​​H&agrave; Nội), kh&ocirc;ng chỉ xo&agrave;i Nhật Bản, nhiều tr&aacute;i c&acirc;y nhập khẩu kh&aacute;c cũng được b&aacute;n dưới hộp. Kh&ocirc;ng b&aacute;n theo trọng lượng như loại tr&aacute;i c&acirc;y.</p>
<div>
	Tr&aacute;i xo&agrave;i 1,7 triệu, vải thiều 400 ng&agrave;n / 12 quả: Tr&aacute;i tim của người d&acirc;n Việt Nam &ndash; Ảnh 1. &quot;title =&quot; Tr&aacute;i c&acirc;y xo&agrave;i 1,7 triệu, vải thiều 400 ng&agrave;n / 12 tr&aacute;i c&acirc;y: Người d&acirc;n Việt Nam &ndash; Ảnh 1. &quot;style =&quot; max -tập tin: 100% &quot;</div>
<div>
	Xo&agrave;i Nhật Bản được b&aacute;n tại thị trường Việt Nam với gi&aacute; 1,7 triệu đồng / tr&aacute;i</div>
<p>
	Giữ tr&ecirc;n tay hộp, c&ocirc; Phượng n&oacute;i: &quot;Đ&acirc;y l&agrave; c&acirc;y đ&agrave;o t&oacute;c của Nhật Bản, một hộp hai tr&aacute;i c&acirc;y c&oacute; gi&aacute; 1.1 triệu (hơn một nửa triệu), hộp 6 tr&aacute;i nhỏ gi&aacute; 2,3 triệu đồng. Nho Nhật Bản cũng được b&aacute;n dưới ch&ugrave;m, gi&aacute; từ 800.000 đến 1.5 triệu, t&ugrave;y thuộc v&agrave;o loại &quot;</p>
<p>
	Nhiều người cho rằng gi&aacute; qu&aacute; cao n&ecirc;n nghĩ rằng đ&oacute; l&agrave; một sản phẩm c&oacute; nguồn gốc từ Nhật Bản, nh&atilde;n &quot;nh&atilde;n Nhật Bản&quot; được ph&acirc;n loại l&agrave; c&aacute;c sản phẩm n&ocirc;ng nghiệp cao cấp.</p>
<p>
	V&igrave; vậy, gi&aacute; cao kh&ocirc;ng phải l&agrave; qu&aacute; lạ. Cổ phần Phương, đối tượng mua c&aacute;c loại tr&aacute;i c&acirc;y l&agrave; kh&aacute;ch h&agrave;ng kh&aacute; giả, người trung b&igrave;nh đang theo d&otilde;i, đ&ocirc;i khi cắn răng khi mua qu&agrave;.</p>
<p>
	Tr&ecirc;n thực tế, kh&ocirc;ng phải l&agrave; &quot;nh&atilde;n hiệu&quot; của Nhật l&agrave; đắt tiền. Gi&aacute; tr&aacute;i c&acirc;y Việt Nam đắt như nhau. Tuy nhi&ecirc;n, ngược lại, tr&aacute;i c&acirc;y Việt Nam, sau khi được bảo quản, đ&oacute;ng g&oacute;i v&agrave; đ&oacute;ng dấu bởi c&aacute;c c&ocirc;ng ty nước ngo&agrave;i, được b&aacute;n ở &quot;bầu trời phương T&acirc;y&quot; với gi&aacute; kh&ocirc;ng thể tin được.</p>
<p>
	Gần đ&acirc;y, một sinh vi&ecirc;n Việt Nam đang học tập tại Nhật Bản, kể c&acirc;u chuyện, kinh nghiệm mua sắm si&ecirc;u thị gần đ&acirc;y, &ocirc;ng đ&atilde; b&aacute;n h&agrave;ng vải Việt Nam với gi&aacute; 1.980 Y&ecirc;n (12 tr&aacute;i), tương đương khoảng 400.000 đồng, cộng với thuế, họ chi 430.000 VND.</p>
<p>
	430.000 đồng để mua 12 thứ vải thiều. Gi&aacute; m&agrave; mỗi n&ocirc;ng d&acirc;n Việt Nam đều mơ ước.</p>
<p>
	Bởi v&igrave;, trong 1-2 năm gần đ&acirc;y, vải cho Nhật Bản chỉ c&oacute; một v&agrave;i chục ng&agrave;n c&acirc;n Anh một kg, kh&ocirc;ng giống như gi&aacute; của thương nh&acirc;n Trung Quốc thu thập trong vườn. V&iacute; dụ, nếu thương l&aacute;i trả 30.000 đồng / kg vải, n&ocirc;ng d&acirc;n phải lấy gần 15kg để mua 12 thứ vải tại si&ecirc;u thị Nhật Bản.</p>
<div>
	Tr&aacute;i c&acirc;y xo&agrave;i 1,7 triệu, vải thiều 400 ngh&igrave;n / 12 quả: Việt Nam Người Merry &ndash; Ảnh 2. &quot;title =&quot; Tr&aacute;i xo&agrave;i 1,7 triệu, vải thiều 400 ngh&igrave;n / 12 tr&aacute;i c&acirc;y: người Việt Nam &ndash; Ảnh 2. &quot;style =&quot; max-width: 100 % &quot;</div>
<div>
	Vải Thiệu Việt b&aacute;n tại si&ecirc;u thị. Chủ yếu l&agrave; 430.000 đồng / 12 quả</div>
<p>
	Chế biến n&ocirc;ng sản bất lợi của Việt Nam</p>
<p>
	N&oacute;i chuyện với ph&oacute;ng vi&ecirc;n. &Ocirc;ng Trần Văn Nam, chủ một c&ocirc;ng ty xuất nhập khẩu tr&aacute;i c&acirc;y tại H&agrave; Nội, n&oacute;i rằng c&ugrave;ng một loại vải thiều ở Việt Nam đ&atilde; được xếp th&agrave;nh b&oacute; với trọng lượng v&agrave;i c&acirc;n Anh, trong đ&oacute; hoa quả xấu, quả s&acirc;u, hoa quả xanh, Pha trộn hỗn hợp tr&aacute;i c&acirc;y.</p>
<p>
	Cũng tại Nhật Bản, vải thiều được đ&oacute;ng g&oacute;i trong một hộp với thiết kế sang trọng, chất lượng đồng nhất. Kể từ đ&oacute;, c&oacute; thể giải th&iacute;ch tại sao tr&aacute;i c&acirc;y Việt Nam b&aacute;n rẻ v&agrave; sang Nhật đắt tiền</p>
<p>
	&Ocirc;ng Nam chia sẻ, &ocirc;ng đ&atilde; thử rất nhiều tr&aacute;i c&acirc;y Nhật Bản hương vị kh&ocirc;ng kh&aacute;c nhiều so với c&ugrave;ng loại tr&aacute;i c&acirc;y ở Việt Nam.</p>
<p>
	Nhưng để khảo s&aacute;t thị trường Nhật Bản, &ocirc;ng đ&atilde; t&igrave;m ra một điểm chung l&agrave; hầu hết hoa quả của đất nước n&agrave;y, cho d&ugrave; b&aacute;n tr&ecirc;n thị trường hoặc trong si&ecirc;u thị đều được đ&oacute;ng g&oacute;i một c&aacute;ch đẹp mắt, tem r&otilde; r&agrave;ng. Trong khi đ&oacute;, tr&aacute;i c&acirc;y Việt Nam được b&aacute;n ra thị trường, kh&ocirc;ng đ&oacute;ng g&oacute;i, kh&ocirc;ng d&aacute;n nh&atilde;n.</p>
<p>
	&quot;Ch&uacute;ng t&ocirc;i rất yếu trong chế biến v&agrave; sau thu hoạch, v&igrave; vậy quả thường tươi&quot;, &ocirc;ng Nam n&oacute;i.</p>
<p>
	C&aacute;c doanh nghiệp trực tiếp thu hoa quả xuất khẩu sang Hoa Kỳ v&agrave; Nhật Bản cũng được chế biến để đ&aacute;p ứng c&aacute;c ti&ecirc;u chuẩn kiểm dịch của thị trường. Khi n&oacute;i đến c&aacute;c quốc gia, c&aacute;c doanh nghiệp ở Hoa Kỳ, Nhật Bản sớm qu&aacute; tr&igrave;nh, đ&oacute;ng g&oacute;i lại v&agrave; b&aacute;n với gi&aacute; cao.</p>
', 1, 5)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (117, N'Xăng dầu đồng loạt tăng giá trong đợt nắng nóng kỷ lục', N'2017_06_09_05_15_36_4161496649881-149664977416154-dieu-chinh-gia-xang.jpg', N' Liên Bộ Tài chính – Công Thương vừa có thông báo điều chỉnh giá xăng dầu bán lẻ trong nước kể từ 15 giờ ngày hôm nay.', CAST(N'2017-06-09 05:14:27.000' AS DateTime), 0, N'<h2>
	&nbsp;</h2>
<p>
	Li&ecirc;n Bộ T&agrave;i ch&iacute;nh &ndash; C&ocirc;ng Thương vừa c&oacute; th&ocirc;ng b&aacute;o điều chỉnh gi&aacute; xăng dầu b&aacute;n lẻ trong nước kể từ 15 giờ ng&agrave;y h&ocirc;m nay.</p>
<p>
	<img alt="Xăng dầu đồng loạt tăng giá trong đợt nắng nóng kỷ lục - 1" src="http://image.24h.com.vn/upload/2-2017/images/2017-06-05/1496649881-149664977416154-dieu-chinh-gia-xang.jpg" /></p>
<p>
	Xăng dầu đồng loạt tăng gi&aacute; kể từ 15 giờ ng&agrave;y 5/6.</p>
<p>
	Theo th&ocirc;ng tin c&ocirc;ng bố từ li&ecirc;n Bộ T&agrave;i ch&iacute;nh - C&ocirc;ng Thương, từ 15h ng&agrave;y 5/6, c&aacute;c mặt h&agrave;ng nhi&ecirc;n liệu <a href="http://www.24h.com.vn/tang-gia-xang-c46e1783.html" title="xăng dầu">xăng dầu</a> được điều chỉnh tăng.</p>
<p>
	Theo đ&oacute; <a href="http://www.24h.com.vn/tang-gia-xang-c46e1783.html" title="giá xăng">gi&aacute; xăng</a> RON 92 được điều chỉnh tăng 303 đồng/l&iacute;t; xăng E5 được điều chỉnh tăng 283 đồng/l&iacute;t; dầu diesel 0,05S &nbsp;225 đồng/l&iacute;t; dầu hoả tăng 326 đồng/l&iacute;t; dầu mazut 180CST 3.5S tăng 139 đồng/kg.</p>
<p>
	Sau khi thực hi&ecirc;̣n tr&iacute;ch l&acirc;̣p v&agrave; chi sử dụng Quỹ B&igrave;nh &ocirc;̉n <a href="http://www.24h.com.vn/tang-gia-xang-c46e1783.html" title="giá xăng dầu">gi&aacute; xăng dầu</a>, gi&aacute; c&aacute;c mặt h&agrave;ng xăng dầu điều chỉnh như sau:</p>
<p>
	Xăng Ron 92 kh&ocirc;ng cao hơn 17.366 đồng/l&iacute;t;</p>
<p>
	Xăng E5 kh&ocirc;ng cao hơn 17.154 đồng/l&iacute;t;</p>
<p>
	Dầu diesel 0.05S kh&ocirc;ng cao hơn 13.485 đồng/l&iacute;t;</p>
<p>
	Dầu hoả kh&ocirc;ng cao hơn 12.118 đồng/l&iacute;t;</p>
<p>
	Dầu mazut 180CST 3.5S kh&ocirc;ng cao hơn 11.035 đồng/kg.</p>
<p>
	Từ đầu năm đến nay, gi&aacute; xăng dầu đ&atilde; qua 10 kỳ điều chỉnh, trong đ&oacute; 3 lần tăng ; 4 lần giảm v&agrave; 3 lần giữ nguy&ecirc;n.</p>
', 1, 5)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (118, N'Giá xăng còn rẻ nên phải tăng thuế lên 8000 đồng/lít?', N'2017_06_09_05_17_43_7631496649881-149664977416154-dieu-chinh-gia-xang.jpg', N' Thuế bảo vệ môi trường thu 4 đồng thì chi ra cho mục đích này chỉ khoảng 1 đồng.', CAST(N'2017-06-09 05:15:36.000' AS DateTime), 0, N'<p>
	Gi&aacute; dầu thế giới giảm, thuế nhập khẩu giảm theo cam kết quốc tế đ&atilde; ảnh hưởng đến c&acirc;n đối nguồn ng&acirc;n s&aacute;ch, do vậy Bộ T&agrave;i ch&iacute;nh t&iacute;nh to&aacute;n tăng thuế bảo vệ m&ocirc;i trường (BVMT) với <a class="TextlinkBaiviet" href="http://www.24h.com.vn/tang-gia-xang-c46e1783.html" title="xăng dầu">xăng dầu</a> để b&ugrave; đắp phần hụt thu đ&oacute;.</p>
<p>
	&Ocirc;ng Phạm Đ&igrave;nh Thi, Vụ trưởng Vụ Ch&iacute;nh s&aacute;ch thuế thuộc Bộ T&agrave;i ch&iacute;nh (ảnh), giải th&iacute;ch như tr&ecirc;n tại cuộc họp b&aacute;o chiều 10-4. Ph&aacute;p Luật TP.HCM đ&atilde; c&oacute; cuộc trao đổi với &ocirc;ng Thi về những bức x&uacute;c của người d&acirc;n đối với đề xuất tăng thuế BVMT xăng dầu.</p>
<p>
	<strong>&ldquo;Gi&aacute; xăng Việt Nam thấp so với c&aacute;c nước&rdquo;</strong></p>
<table align="left" cellpadding="3" cellspacing="0" style="border:1px solid #bbb;background-color:#DEF1C8;margin:5px;" width="210">
	<tbody>
		<tr>
			<td style="text-align:justify" valign="top">
				<p>
					<img alt="Giá xăng còn rẻ nên phải tăng thuế lên 8000 đồng/lít? - 1" class="news-image" src="http://image.24h.com.vn/upload/2-2017/images/2017-04-11/1491880240-2.jpg" /></p>
				<p>
					<em>&Ocirc;ng Phạm Đ&igrave;nh Thi</em></p>
			</td>
		</tr>
	</tbody>
</table>
<p>
	<em>. Sau khi Bộ T&agrave;i ch&iacute;nh đưa ra đề xuất tăng khung thuế BVMT với xăng dầu l&ecirc;n mức tối đa 8.000 đồng/l&iacute;t, nhiều bộ, ng&agrave;nh v&agrave; doanh nghiệp (DN) cho rằng n&ecirc;n c&acirc;n nhắc đề xuất n&agrave;y. Tại sao Bộ T&agrave;i ch&iacute;nh vẫn bảo lưu quan điểm của m&igrave;nh?</em></p>
<p>
	+ &Ocirc;ng Phạm Đ&igrave;nh Thi: Trước bối cảnh hội nhập kinh tế ng&agrave;y c&agrave;ng s&acirc;u rộng, phải thực hiện cắt giảm dần thuế nhập khẩu theo c&aacute;c cam kết quốc tế. Để đảm bảo lợi &iacute;ch quốc gia trong điều kiện hội nhập v&agrave; chủ động ứng ph&oacute; với diễn biến gi&aacute; dầu tr&ecirc;n thị trường thế giới th&igrave; việc sử dụng c&aacute;c ch&iacute;nh s&aacute;ch thuế nội địa, trong đ&oacute; c&oacute; ch&iacute;nh s&aacute;ch thuế BVMT l&agrave; một trong những c&ocirc;ng cụ t&agrave;i ch&iacute;nh hiệu quả v&agrave; khả thi.</p>
<p>
	Hơn nữa, xăng dầu l&agrave; sản phẩm chứa c&aacute;c chất h&oacute;a học, g&acirc;y ảnh hưởng xấu đến m&ocirc;i trường ở diện rộng. C&aacute;c nước tr&ecirc;n thế giới đ&atilde; đưa xăng dầu v&agrave;o đối tượng thu thuế ti&ecirc;u thụ đặc biệt, thuế BVMT nhằm mục đ&iacute;ch BVMT với c&aacute;c t&ecirc;n gọi kh&aacute;c nhau như thuế nhi&ecirc;n liệu, thuế năng lượng, thuế phương tiện...</p>
<p>
	Theo Luật Thuế BVMT hiện h&agrave;nh th&igrave; xăng dầu thuộc đối tượng chịu thuế với khung thuế từ 1.000 đến 4.000 đồng/l&iacute;t. Mức thuế BVMT cụ thể hiện h&agrave;nh đối với xăng dầu đ&atilde; bằng mức tối đa trong khung thuế.</p>
<p>
	<em>. Dựa v&agrave;o cơ sở n&agrave;o m&agrave; Bộ T&agrave;i ch&iacute;nh đề xuất tăng khung thuế BVMT đối với xăng dầu l&ecirc;n mức tối đa 8.000 đồng/l&iacute;t?</em></p>
<p>
	+ Gi&aacute; b&aacute;n lẻ xăng dầu ở Việt Nam cơ bản đang thấp hơn so với c&aacute;c nước c&oacute; chung đường bi&ecirc;n giới n&oacute;i ri&ecirc;ng v&agrave; nhiều nước kh&aacute;c trong khu vực ASEAN.</p>
<p>
	Cụ thể theo bảng xếp hạng của trang web Global Petrol Prices v&agrave;o ng&agrave;y 3-4-2017 th&igrave; gi&aacute; b&aacute;n lẻ xăng dầu của Việt Nam đang ở mức thấp. Trong 180 nước th&igrave; Việt Nam đứng thứ 44 từ thấp đến cao v&agrave; 136 nước c&oacute; gi&aacute; b&aacute;n lẻ xăng dầu cao hơn Việt Nam. Trong đ&oacute; Philippines đứng thứ 55, Campuchia đứng thứ 58, Th&aacute;i Lan đứng thứ 88, L&agrave;o đứng thứ 97.</p>
<p>
	Với mức gi&aacute; b&aacute;n lẻ xăng RON92 của Việt Nam cập nhật đến ng&agrave;y 6-4 l&agrave; 17.230 đồng/l&iacute;t th&igrave; <a class="TextlinkBaiviet" href="http://www.24h.com.vn/tang-gia-xang-c46e1783.html" title="giá xăng">gi&aacute; xăng</a> ở L&agrave;o cao hơn tại Việt Nam 4.806 đồng/l&iacute;t, Campuchia cao hơn 2.826 đồng/l&iacute;t v&agrave; Th&aacute;i Lan cao hơn 1.166 đồng/l&iacute;t.</p>
<p style="color:#0000FF;font-style:italic;text-align:center;">
	<img alt="Giá xăng còn rẻ nên phải tăng thuế lên 8000 đồng/lít? - 2" class="news-image" src="http://image.24h.com.vn/upload/2-2017/images/2017-04-11/1491880149-3.jpg" /></p>
<p style="color:#0000FF;font-style:italic;text-align:center;">
	Xăng dầu đang phải oằn lưng g&aacute;nh h&agrave;ng loạt loại thuế v&agrave; ph&iacute;. &nbsp;Ảnh: HTD</p>
<p>
	B&ecirc;n cạnh đ&oacute;, tỉ trọng thuế trong cơ cấu gi&aacute; cơ sở xăng dầu của Việt Nam đang ở mức thấp (37,24% đối với xăng; 21,14% đối với diesel). Trong khi đ&oacute; ở c&aacute;c nước kh&aacute;c như H&agrave;n Quốc l&agrave; 70,3%, Campuchia khoảng 40% v&agrave; L&agrave;o khoảng 56%.</p>
<p>
	Tr&ecirc;n cơ sở t&iacute;nh to&aacute;n tất cả yếu tố n&ecirc;u tr&ecirc;n, Bộ T&agrave;i ch&iacute;nh đề nghị tăng khung mức thuế BVMT từ 1.000 đến 4.000 đồng/l&iacute;t l&ecirc;n 3.000 đến 8.000 đồng/l&iacute;t l&agrave; ph&ugrave; hợp.</p>
<p>
	Việc n&acirc;ng khung mức thuế c&ograve;n nhằm n&acirc;ng cao hơn nữa tr&aacute;ch nhiệm v&agrave; nhận thức của tổ chức, c&aacute; nh&acirc;n đối với m&ocirc;i trường v&agrave; khuyến kh&iacute;ch sản xuất, sử dụng h&agrave;ng h&oacute;a th&acirc;n thiện với m&ocirc;i trường.</p>
<p>
	<strong>&ldquo;Kh&ocirc;ng thể n&oacute;i chi kh&ocirc;ng đ&uacute;ng mục đ&iacute;ch&rdquo;</strong></p>
<p>
	<em>. Việc tăng thuế BVMT sẽ t&aacute;c động đến t&uacute;i tiền người d&acirc;n v&agrave; t&aacute;c động ti&ecirc;u cực đến kinh tế, thưa &ocirc;ng?</em></p>
<p>
	+ Bộ T&agrave;i ch&iacute;nh đề xuất điều chỉnh khung thuế BVMT đối với xăng dầu tr&ecirc;n cơ sở t&iacute;nh to&aacute;n nhiều yếu tố để đảm bảo t&iacute;nh ổn định của luật &aacute;p dụng cho thời gian d&agrave;i. Kh&ocirc;ng phải n&oacute;i tăng thuế BVMT l&agrave; tăng ngay, ch&uacute;ng t&ocirc;i chỉ đề xuất khung thuế c&ograve;n quyền quyết định thuộc về Quốc hội, Ủy ban Thường vụ Quốc hội.</p>
<p>
	Việc điều chỉnh khung thuế BVMT đối với xăng dầu chưa t&aacute;c động đến gi&aacute; b&aacute;n lẻ xăng dầu, cũng như đến sản xuất, kinh doanh.</p>
<p>
	<em>. Theo một b&aacute;o c&aacute;o của Bộ T&agrave;i ch&iacute;nh cho thấy thu ng&acirc;n s&aacute;ch từ thuế n&agrave;y rất lớn nhưng chi rất &iacute;t. Cụ thể thuế BVMT thu 4 đồng th&igrave; chi ra cho mục đ&iacute;ch n&agrave;y chỉ khoảng 1 đồng?</em></p>
<p>
	+ T&ocirc;i xin nhấn mạnh thuế BVMT l&agrave; khoản thu ng&acirc;n s&aacute;ch nh&agrave; nước v&agrave; được sử dụng chi thực hiện c&aacute;c nhiệm vụ chi theo Luật Ng&acirc;n s&aacute;ch nh&agrave; nước như chi đầu tư ph&aacute;t triển. V&iacute; dụ chi đầu tư cho c&aacute;c dự &aacute;n, đầu tư v&agrave; hỗ trợ vốn cho c&aacute;c DN; chi đảm bảo x&atilde; hội bao gồm cả chi thực hiện c&aacute;c ch&iacute;nh s&aacute;ch x&atilde; hội theo quy định,...</p>
<p>
	Nghĩa l&agrave; kh&ocirc;ng thể n&oacute;i thuế BVMT chỉ d&ugrave;ng cho c&ocirc;ng t&aacute;c BVMT m&agrave; c&ograve;n được chi cho c&aacute;c khoản kh&aacute;c của ng&acirc;n s&aacute;ch nh&agrave; nước. Do đ&oacute; kh&ocirc;ng thể n&oacute;i thuế BVMT l&agrave; thu nhiều chi &iacute;t, chi kh&ocirc;ng đ&uacute;ng mục đ&iacute;ch. Hằng năm, ng&acirc;n s&aacute;ch nh&agrave; nước vẫn bố tr&iacute; ri&ecirc;ng cho hoạt động sự nghiệp m&ocirc;i trường.</p>
<p>
	<em>. Xin c&aacute;m ơn &ocirc;ng.</em></p>
<p>
	<strong>T&aacute;c động ti&ecirc;u cực đến kinh tế Việt Nam</strong></p>
<p>
	Nếu theo đ&uacute;ng lộ tr&igrave;nh, c&oacute; thể giữa th&aacute;ng 10 năm nay, mức thuế BVMT với xăng dầu sẽ c&oacute; khung mới v&agrave; mức tối đa c&oacute; thể l&ecirc;n tới 8.000 đồng/l&iacute;t, gấp 2-3 lần so với khung hiện h&agrave;nh.</p>
<p>
	Bộ T&agrave;i ch&iacute;nh l&yacute; giải việc tăng thuế đối với xăng dầu nhằm b&ugrave; v&agrave;o khoản hụt thu từ c&aacute;c hiệp định thương mại nhưng Ph&ograve;ng Thương mại v&agrave; C&ocirc;ng nghiệp Việt Nam (VCCI) đ&atilde; c&oacute; văn bản gửi Bộ T&agrave;i ch&iacute;nh lo ngại việc tăng thuế đối với xăng dầu sẽ t&aacute;c động ti&ecirc;u cực đến to&agrave;n bộ nền kinh tế Việt Nam. Nếu tăng thuế đối với xăng dầu để b&ugrave; lại th&igrave; v&ocirc; h&igrave;nh trung ch&iacute;nh s&aacute;ch n&agrave;y khiến c&aacute;c DN Việt Nam mất lợi thế cạnh tranh trước c&aacute;c đối thủ nước ngo&agrave;i.</p>
<p>
	Theo VCCI, xăng dầu l&agrave; nguy&ecirc;n liệu đầu v&agrave;o quan trọng của nền kinh tế. C&aacute;c phương tiện giao th&ocirc;ng vận tải h&agrave;ng h&oacute;a, m&aacute;y n&ocirc;ng nghiệp, t&agrave;u c&aacute;&hellip; đều sử dụng rất nhiều xăng dầu. Do đ&oacute;, nếu tăng thuế đối với xăng dầu th&igrave; những ng&agrave;nh chịu thiệt hại nặng nhất l&agrave; vận tải, n&ocirc;ng nghiệp, thủy hải sản.</p>
<p>
	Theo VCCI, việc cắt giảm thuế nhập khẩu đối với xăng dầu theo c&aacute;c cam kết quốc tế c&oacute; thể l&agrave;m giảm nguồn thu ng&acirc;n s&aacute;ch nhưng kh&ocirc;ng n&ecirc;n b&ugrave; bằng c&aacute;ch tăng thuế BVMT đối với xăng dầu. X&eacute;t về d&agrave;i hạn, việc nới khung thuế BVMT đối với xăng dầu nhằm bảo đảm thu ng&acirc;n s&aacute;ch sẽ l&agrave; giải ph&aacute;p lợi bất cập hại.</p>
<p>
	Bộ Ngoại giao đưa ra &yacute; kiến đề nghị Bộ T&agrave;i ch&iacute;nh n&ecirc;n c&acirc;n nhắc sự cần thiết v&agrave; lộ tr&igrave;nh thực hiện việc n&acirc;ng khung thuế với xăng dầu. Đặc biệt trong bối cảnh c&aacute;c DN c&ograve;n gặp nhiều kh&oacute; khăn, mặt h&agrave;ng thiết yếu n&agrave;y đ&atilde; g&aacute;nh nhiều loại thuế v&agrave; ph&iacute;.</p>
<p>
	___________________________</p>
<p>
	Theo t&iacute;nh to&aacute;n của một số chuy&ecirc;n gia, với mức thu thuế m&ocirc;i trường với xăng l&agrave; 3.000 đồng/l&iacute;t, cơ cấu gi&aacute; mỗi l&iacute;t xăng đang phải c&otilde;ng khoảng 46% thuế, ph&iacute;. Tỉ lệ n&agrave;y c&oacute; thể tăng l&ecirc;n tới 59% trong trường hợp tăng thuế m&ocirc;i trường l&ecirc;n kịch khung đề xuất l&agrave; 8.000 đồng/l&iacute;t.</p>
', 1, 5)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (119, N'Lạ lùng khung thuế xăng!', N'2017_06_09_05_19_05_9621486950929-xang-dau_cupt.jpg', N' Thông thường từ thuế thu nhập cá nhân, thuế thu nhập doanh nghiệp đến thuế nhập khẩu… và nhiều thứ thuế khác đều được xác định bằng tỉ lệ % trên giá bán, mức thu nhập.', CAST(N'2017-06-09 05:17:43.000' AS DateTime), 0, N'<h2>
	&nbsp;</h2>
<p class="baiviet-sapo" style="font-size: 13px;">
	Th&ocirc;ng thường từ thuế thu nhập c&aacute; nh&acirc;n, thuế thu nhập doanh nghiệp đến thuế nhập khẩu&hellip; v&agrave; nhiều thứ thuế kh&aacute;c đều được x&aacute;c định bằng tỉ lệ % tr&ecirc;n gi&aacute; b&aacute;n, mức thu nhập.</p>
<div class="text-conent" itemprop="articleBody">
	<p>
		Chẳng hạn, đối với thuế thu nhập c&aacute; nh&acirc;n th&igrave; theo lũy tiến 5%-35%, thuế thu nhập doanh nghiệp hiện l&agrave; 20%. Xưa nay, đ&atilde; n&oacute;i đến thuế l&agrave; lu&ocirc;n gắn với thuế suất.</p>
	<p>
		Nhưng ri&ecirc;ng với thuế bảo vệ m&ocirc;i trường (BVMT) m&agrave; Bộ T&agrave;i ch&iacute;nh đề xuất mới đ&acirc;y, khung thuế lại cụ thể bằng con số 3.000-8.000 đồng/l&iacute;t.</p>
	<p>
		Một chuy&ecirc;n gia am hiểu về thuế nhận định lẽ ra thuế BVMT cũng phải tu&acirc;n theo nguy&ecirc;n tắc đ&aacute;nh theo tỉ lệ % của gi&aacute; b&aacute;n xăng. Theo nguy&ecirc;n tắc n&agrave;y, Bộ T&agrave;i ch&iacute;nh ho&agrave;n to&agrave;n c&oacute; thể đề xuất mức thuế suất, v&iacute; dụ 1%-10% tr&ecirc;n gi&aacute; nhập khẩu hay gi&aacute; b&aacute;n. Tuy nhi&ecirc;n, nếu &aacute;p thuế theo tỉ lệ % tr&ecirc;n gi&aacute; b&aacute;n th&igrave; chắc chắn mức thuế BVMT đối với xăng kh&ocirc;ng thể đạt khung 3.000-8.000 đồng/l&iacute;t.</p>
	<p style="text-align: center;">
		<img alt="Lạ lùng khung thuế xăng! - 1" class="news-image" src="http://image.24h.com.vn/upload/1-2017/images/2017-02-13/1486950929-xang-dau_cupt.jpg" width="500" /></p>
	<p style="color:#0000FF;font-style:italic;text-align:center;">
		H&igrave;nh minh họa</p>
	<p>
		C&oacute; thể do một &aacute;p lực n&agrave;o đ&oacute;, chuy&ecirc;n gia tr&ecirc;n nhận định cần phải thu về ng&acirc;n s&aacute;ch hoặc cần nguồn lực bổ trợ thay v&igrave; để giải quyết vấn đề m&ocirc;i trường, n&ecirc;n mức thu được cụ thể h&oacute;a cho dễ được chấp nhận. Bởi nếu &aacute;p gi&aacute; kịch khung 8.000 đồng/l&iacute;t, quy đổi ra tỉ lệ %, thuế BVMT đ&atilde; chiếm tới gần 50% gi&aacute; b&aacute;n. Dư luận sẽ phản đối c&aacute;i n&agrave;o nhiều hơn giữa thuế suất gần 50% hay mức 8.000 đồng/l&iacute;t?</p>
	<p>
		Điều n&agrave;y hẳn mỗi người đ&atilde; c&oacute; c&acirc;u trả lời.</p>
	<p>
		Chẳng vậy m&agrave; trong cuộc họp giữa c&aacute;c bộ, ng&agrave;nh về dự thảo thuế BVMT mới đ&acirc;y tại Bộ Tư ph&aacute;p, đại diện Bộ T&agrave;i ch&iacute;nh cũng thừa nhận với đại diện Hiệp hội <a class="TextlinkBaiviet" href="http://www.24h.com.vn/tang-gia-xang-c46e1783.html" title="Xăng dầu">Xăng dầu</a> rằng: Cơ sở khoa học v&agrave; thực tế cho khung thuế BVMT 3.000-8.000 đồng/l&iacute;t xăng l&agrave; &ldquo;rất kh&oacute; t&iacute;nh to&aacute;n&rdquo;.</p>
	<p>
		Chưa hết, một l&yacute; do đ&aacute;ng ch&uacute; &yacute; m&agrave; Bộ T&agrave;i ch&iacute;nh n&ecirc;u ra để tăng thuế BVMT l&agrave; để tiếp tục nghi&ecirc;n cứu bổ sung đối tượng thu, điều chỉnh mức điều tiết nhằm g&oacute;p phần hạn chế sử dụng những h&agrave;ng h&oacute;a g&acirc;y t&aacute;c động xấu đến m&ocirc;i trường sinh th&aacute;i.</p>
	<p>
		Nhưng mục ti&ecirc;u &ldquo;hạn chế&rdquo; n&agrave;y xem ra cũng kh&ocirc;ng hợp l&yacute;. Bởi việc tăng thuế BVMT đối với xăng sẽ t&aacute;c động lớn đến nền kinh tế vốn đang hội nhập s&acirc;u rộng với thế giới v&agrave; đang đứng trước &aacute;p lực cạnh tranh gay gắt. Ấy vậy m&agrave; trong dự thảo b&aacute;o c&aacute;o đ&aacute;nh gi&aacute; t&aacute;c động, Bộ T&agrave;i ch&iacute;nh vẫn khẳng định rằng: &ldquo;T&aacute;c động ti&ecirc;u cực của đề xuất n&agrave;y: Kh&ocirc;ng c&oacute;&rdquo;.</p>
	<p>
		Mặt kh&aacute;c, nếu x&aacute;c định hạn chế sử dụng những h&agrave;ng h&oacute;a g&acirc;y t&aacute;c động xấu đến m&ocirc;i trường sinh th&aacute;i th&igrave; c&oacute; lẽ vấn đề kh&ocirc;ng chỉ nằm ở việc tăng thuế đối với mặt h&agrave;ng thiết yếu như xăng dầu. C&oacute; c&aacute;ch kh&aacute;c đơn giản hơn, thay v&igrave; sử dụng c&aacute;c loại xăng A92, Nh&agrave; nước c&oacute; thể c&oacute; ch&iacute;nh s&aacute;ch khuyến kh&iacute;ch sử dụng những loại xăng kh&aacute;c như xăng sinh học E5, E10. Khi đ&oacute; t&aacute;c động đến m&ocirc;i trường, sinh th&aacute;i do c&aacute;c loại xăng n&agrave;y g&acirc;y ra chắc chắn &iacute;t hơn m&agrave; lại kh&ocirc;ng t&aacute;c động ti&ecirc;u cực đến khả năng cạnh tranh của nền kinh tế như khẳng định của Bộ T&agrave;i ch&iacute;nh tại b&aacute;o c&aacute;o đ&aacute;nh gi&aacute; t&aacute;c động.</p>
	<p>
		Bởi vậy, vấn đề hiện nay l&agrave; Bộ T&agrave;i ch&iacute;nh phải thuyết minh được t&iacute;nh hợp l&yacute; trong việc đề ra khung thuế lạ l&ugrave;ng kia v&agrave; c&oacute; những biện ph&aacute;p mang t&iacute;nh chiến lược, bền vững thay v&igrave; đ&aacute;nh thẳng v&agrave;o t&uacute;i tiền của người d&acirc;n.</p>
</div>
<p>
	&nbsp;</p>
', 1, 5)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (120, N'Ngâm hoa quả làm siro theo cách này sẽ dễ bị ung thư', N'2017_06_09_05_20_49_9901496885536-1.jpg', N'Các chuyên gia cảnh báo, việc dùng các bình inox hay lọ nhựa lớn để ngâm nước hoa quả năm này qua năm khác như nước mơ, dâu, sấu, táo mèo….', CAST(N'2017-06-09 05:19:57.000' AS DateTime), 0, N'<p align="center">
	<img alt="Ngâm hoa quả làm siro theo cách này sẽ dễ bị ung thư - 1" class="news-image" src="http://image.24h.com.vn/upload/2-2017/images/2017-06-08/1496885536-1.jpg" /></p>
<p style="color:#0000FF;font-style:italic;text-align:center;">
	Ảnh minh hoạ: Internet</p>
<p>
	V&agrave;o m&ugrave;a h&egrave;, nhiều b&agrave; nội trợ thường ng&acirc;m nước mơ, nước sấu hay c&aacute;c loại d&acirc;u, mận để uống giải kh&aacute;t. C&aacute;c chị em d&acirc;n văn ph&ograve;ng cũng hay đựng nước canh chua, nước rau muống dầm sấu trong c&aacute;c b&igrave;nh giữ nhiệt, cặp lồng inox, hộp nhựa mang tới c&ocirc;ng sở. Tuy nhi&ecirc;n, đ&acirc;y lại l&agrave; c&aacute;ch v&ocirc; t&igrave;nh khiến thức ăn bị nhiễm độc nếu lựa chọn phải đồ inox v&agrave; nhựa&nbsp;k&eacute;m chất lượng.</p>
<p>
	<strong>Kh&ocirc;ng sử dụng chai, lọ inox, đồ nhựa để ng&acirc;m nước hoa quả l&acirc;u ng&agrave;y</strong></p>
<p>
	&nbsp;GS.TS Nguyễn Hải Nam &ndash; Trưởng bộ m&ocirc;n H&oacute;a dược (Trường Đại học Dược H&agrave; Nội) lưu &yacute;, c&aacute;c b&agrave; nội trợ tuyệt đối kh&ocirc;ng n&ecirc;n d&ugrave;ng c&aacute;c lọ inox hay lọ nhựa lớn để ng&acirc;m c&aacute;c loại nước hoa quả năm n&agrave;y qua năm kh&aacute;c như nước mơ, nước d&acirc;u, nước s&acirc;u, nước t&aacute;o m&egrave;o&hellip;.</p>
<p>
	Bởi, c&aacute;c loại quả c&oacute; nhiều axit sẽ sẽ k&iacute;ch th&iacute;ch qu&aacute; tr&igrave;nh giải ph&oacute;ng kim loại nặng trong inox, phản ứng với c&aacute;c hợp chất h&oacute;a dẻo của nhựa, tạo th&agrave;nh chất độc. Chất độc n&agrave;y khiến người sử dụng c&oacute; thể bị ung thư.</p>
<p>
	GS. Hải Nam khuyến c&aacute;o người ti&ecirc;u d&ugrave;ng n&ecirc;n xem x&eacute;t kỹ hướng dẫn sử dụng của c&aacute;c loại b&igrave;nh giữ nhiệt trước khi mua. Nếu c&aacute;c loại sản phẩm n&agrave;y r&otilde; r&agrave;ng về xuất sứ, được nhập khẩu v&agrave; bu&ocirc;n b&aacute;n hợp ph&aacute;p th&igrave; chất lượng sẽ đảm bảo.</p>
<p>
	PGS.Nguyễn Duy Thịnh, Viện C&ocirc;ng nghệ Sinh học v&agrave; Thực phẩm Đại học B&aacute;ch Khoa H&agrave; Nội, inox c&oacute; rất nhiều loại. Hiện inox đang được sử dụng rất rộng r&atilde;i trong đời sống từ cầu thang, tay nắm cửa, c&oacute; những loại sử dụng l&agrave;m vật dụng li&ecirc;n quan tới ăn uống như b&aacute;t, đũa, th&igrave;a&hellip; Inox c&oacute; đặc t&iacute;nh bảo &ocirc;n rất tốt n&ecirc;n được sử dụng trong c&ocirc;ng nghệ sản xuất b&igrave;nh giữ nhiệt.</p>
<p>
	Tuy nhi&ecirc;n, người d&ugrave;ng n&ecirc;n chọn những sản phẩm inox, nhựa c&oacute; chất lượng tốt, đảm bảo bởi nhiều nh&agrave; sản xuất do lợi nhuận c&oacute; thể sử dụng những loại inox trong c&ocirc;ng nghiệp để l&agrave;m đồ d&ugrave;ng đựng thực phẩm. Nếu sản phẩm inox n&agrave;o m&agrave; trong th&agrave;nh phần c&oacute; chứa nhiều kim loại như cr&ocirc;m, mangan v&agrave; niken sẽ g&acirc;y ảnh hưởng kh&ocirc;ng tốt tới <a class="TextlinkBaiviet" href="http://www.24h.com.vn/suc-khoe-doi-song-c62.html" title="sức khỏe">sức khỏe</a> người sử dụng.</p>
<p>
	&ldquo;Loại inox để sản xuất c&aacute;c vật dụng li&ecirc;n quan tới ăn uống như b&igrave;nh giữ nhiệt, đũa, th&igrave;a, b&aacute;t, &hellip; phải đảm bảo được l&agrave;m bằng c&aacute;c loại inox chất lượng, kh&ocirc;ng g&acirc;y rỉ s&eacute;t, kh&ocirc;ng g&acirc;y phản ứng h&oacute;a học với c&aacute;c chất m&agrave; n&oacute; đựng&rdquo; &ndash; GS Thịnh n&oacute;i. V&igrave; vậy, người ti&ecirc;u d&ugrave;ng n&ecirc;n chọn lựa, mua những sản phẩm đ&atilde; qua kiểm duyệt chất lượng hợp ph&aacute;p để đảm bảo an to&agrave;n.</p>
', 1, 7)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (121, N'Sốc khi phát hiện siro ho chứa morphin gây nghiện', N'2017_06_09_05_21_58_5751496885536-1.jpg', N'Morphin là một chất ma túy có tác dụng giảm đau, gây ngủ, được chế từ thuốc phiện dưới dạng bột tinh thể màu trắng hoặc dạng khối vuông. Morphin có thể gây chết người nếu vô tình uống phải.', CAST(N'2017-06-09 05:20:50.000' AS DateTime), 0, N'<p>
	C&aacute;c nh&agrave; chức tr&aacute;ch th&ocirc;ng b&aacute;o rằng h&atilde;ng Master Herbs, Inc. đ&atilde; ph&acirc;n phối chai siro ho cam thảo 100ml c&oacute; chứa chất dạng thuốc phiện nhưng th&agrave;nh phần n&agrave;y lại kh&ocirc;ng được c&ocirc;ng bố tr&ecirc;n d&aacute;n nh&atilde;n của sản phẩm.</p>
<p align="center">
	<img alt="Sốc khi phát hiện siro ho chứa morphin gây nghiện - 1" class="news-image" src="http://anh.24h.com.vn/upload/2-2016/images/2016-04-07/1460020022-thuoc-ho.jpg" width="500" /></p>
<p style="color:#0000FF;font-style:italic;text-align:center;">
	Thu hồi siro ho c&oacute; chứa morphin.</p>
<p>
	Theo FDA, siro ho n&agrave;y được ph&acirc;n phối đến c&aacute;c của h&agrave;ng tập h&oacute;a của Trung Quốc ở California, New Jersey, Hawaii, Illinois, Ohio v&agrave; Nevada.</p>
<p>
	Morphin l&agrave; một chất ma t&uacute;y c&oacute; t&aacute;c dụng giảm đau, g&acirc;y ngủ, được chế từ thuốc phiện dưới dạng bột tinh thể m&agrave;u trắng hoặc dạng khối vu&ocirc;ng.&nbsp;Morphin c&oacute; thể g&acirc;y chết người nếu v&ocirc; t&igrave;nh uống phải. N&oacute; cũng c&oacute; thể g&acirc;y ức chế h&ocirc; hấp v&agrave; c&aacute;c phẩn ứng dị ứng nghi&ecirc;m trọng kh&aacute;c, th&ocirc;ng tin từ FDA.</p>
', 1, 7)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (122, N'Sát thủ gây ung thư bủa vây người Việt', N'2017_06_09_05_23_12_8641459389337-sat-thu-gay-ung-thu-1.jpg', N'Nguyên nhân chủ yếu do các loại hóa chất độc hại có trong thức ăn hàng ngày - theo báo cáo của Viện nghiên cứu phòng chống ung thư Việt Nam', CAST(N'2017-06-09 05:21:58.000' AS DateTime), 0, N'<p align="center">
	<img alt="Sát thủ gây ung thư bủa vây người Việt - 1" class="news-image" src="http://anh.24h.com.vn/upload/1-2016/images/2016-03-31/1459389337-sat-thu-gay-ung-thu-1.jpg" /></p>
<p style="color:#0000FF;font-style:italic;text-align:center;">
	H&igrave;nh ảnh ung thư trẻ em khiến nhiều người &aacute;m ảnh.</p>
<p>
	Nguy&ecirc;n nh&acirc;n chủ yếu do c&aacute;c loại h&oacute;a chất độc hại c&oacute; trong thức ăn h&agrave;ng ng&agrave;y - theo b&aacute;o c&aacute;o của Viện nghi&ecirc;n cứu ph&ograve;ng chống ung thư Việt Nam. Điều n&agrave;y l&agrave;m cho Việt Nam l&agrave; nước c&oacute; bệnh nh&acirc;n ung thư nhiều nhất tr&ecirc;n thế giới.&nbsp;</p>
<p>
	Theo kết quả khảo s&aacute;t năm 2011, tỷ lệ tử vong do ung thư dạ d&agrave;y tại Việt Nam cao gấp 5 lần so với L&agrave;o, Philipines, Th&aacute;i Lan v&agrave; c&aacute;c nước trong khu vực.</p>
<p>
	Gi&aacute;o sư Nguyễn B&aacute; Đức- Ph&oacute; Chủ tịch hội ph&ograve;ng chống Ung thư Việt Nam &ndash; Nguy&ecirc;n Gi&aacute;m đốc Bệnh viện K trung ương cho biết, hiện nay nguy&ecirc;n nh&acirc;n g&acirc;y ung thư đ&atilde; được c&aacute;c chuy&ecirc;n gia y tế l&ecirc;n tiếng cảnh b&aacute;o. Đ&oacute; l&agrave; nguy&ecirc;n nh&acirc;n do nội sinh v&agrave; ngoại sinh. C&aacute;c yếu tố nội sinh đ&oacute; l&agrave; do gen, do di truyền ở Việt Nam rất &iacute;t.</p>
<p>
	V&iacute; dụ như ung thư v&uacute; từng được cảnh b&aacute;o c&oacute; li&ecirc;n quan đến yếu tố di truyền nhưng hiện nay ở nước ta, theo nghi&ecirc;n cứu của Bệnh viện K trung ương đ&atilde; thực hiện tr&ecirc;n 200 chị em phụ nữ bị ung thư v&uacute; th&igrave; chỉ c&oacute; 2 người c&oacute; người th&acirc;n di truyền theo phả hệ b&agrave; ngoại, mẹ, chị em g&aacute;i c&oacute; tiền sử bị ung thư, c&ograve;n lại l&agrave; kh&ocirc;ng li&ecirc;n quan. Yếu tố n&agrave;y chỉ chiếm 1%.</p>
<p>
	Như vậy, v&igrave; sao người Việt ng&agrave;y c&agrave;ng nhiều ung thư? S&aacute;t thủ g&acirc;y ra ung thư ch&iacute;nh l&agrave; thực phẩm bẩn, do lối sống như th&oacute;i quen h&uacute;t thuốc l&aacute;, uống rượu bia, lười vận động.</p>
<p align="center">
	<img alt="Sát thủ gây ung thư bủa vây người Việt - 2" class="news-image" src="http://anh.24h.com.vn/upload/1-2016/images/2016-03-31/1459389337-sat-thu-gay-ung-thu-2.jpg" width="500" /></p>
<p style="color:#0000FF;font-style:italic;text-align:center;">
	Gi&aacute;o sư Nguyễn B&aacute; Đức</p>
<p>
	Gi&aacute;o sư Đức t&acirc;m sự, &ocirc;ng thực sự thấy lo lắng về vấn đề an to&agrave;n thực phẩm. N&agrave;o l&agrave; rau phun ho&aacute; chất tăng trưởng, lợn ngậm chất tăng trọng, thuỷ sản ngậm kh&aacute;ng sinh, thậm ch&iacute; người ta c&ograve;n d&ugrave;ng cả chất cấm trong chăn nu&ocirc;i, ti&ecirc;m thuốc an thần cho lợn. Tất cả những h&agrave;nh động tr&ecirc;n đều đầu độc giống n&ograve;i Việt.</p>
<p>
	TS, BS Trần Đăng Khoa- Gi&aacute;m đốc Bệnh viện Ung bướu H&agrave; Nội cho biết t&igrave;nh trạng trẻ ho&aacute; ở bệnh nh&acirc;n ung thư ng&agrave;y c&agrave;ng cao. Nếu như trước đ&acirc;y những căn bệnh ung thư ở người tr&ecirc;n 50 tuổi th&igrave; đến nay những người trẻ cũng bị như ung thư trực tr&agrave;ng, ung thư v&uacute;, ung thư buồng trứng, ung thư cổ tử cung&hellip; v&agrave; nguy&ecirc;n nh&acirc;n của n&oacute; c&oacute; li&ecirc;n quan &iacute;t nhiều đến thực phẩm.&nbsp;</p>
<p>
	Trước đ&acirc;y, trừ một số ung thư ở trẻ em như ung thư hạch, ung thư m&aacute;u th&igrave; đa phần c&aacute;c loại ung thư thường đến ở người lớn tuổi, từ 60-70 tuổi. Nhưng hiện nay c&aacute;c bệnh viện chuy&ecirc;n khoa ung bướu đ&atilde; tiếp nhận nhiều bệnh nh&acirc;n trẻ tuổi.</p>
<p>
	Những s&aacute;t thủ g&acirc;y ra bệnh ung thư điển h&igrave;nh l&agrave; thuốc l&aacute; chiếm 30% nguy&ecirc;n nh&acirc;n g&acirc;y ung thư phổi, thanh quản, thực quản, tụy... Trong kh&oacute;i thuốc c&oacute; hơn 70 loại h&oacute;a chất độc hại kh&aacute;c nhau c&oacute; thể g&acirc;y ung thư. Đặc biệt c&oacute; 43 chất đ&atilde; được chứng minh g&acirc;y ung thư như: niken, cadmium, benzopyren...</p>
<p>
	Những người kh&ocirc;ng h&uacute;t thuốc nhưng sống c&ugrave;ng người h&uacute;t v&agrave; h&iacute;t phải kh&oacute;i thuốc l&aacute; cũng c&oacute; nguy cơ mắc bệnh li&ecirc;n quan đến h&uacute;t thuốc l&aacute; như ch&iacute;nh người h&uacute;t, nhất l&agrave; phụ nữ v&agrave; trẻ em.</p>
<p>
	Nguy&ecirc;n nh&acirc;n do bia rượu, uống nhiều rượu, bia kh&ocirc;ng c&oacute; lợi cho <a class="TextlinkBaiviet" href="http://www.24h.com.vn/suc-khoe-doi-song-c62.html" title="sức khỏe">sức khỏe</a> nhưng &iacute;t người biết rằng n&oacute; cũng c&oacute; thể l&agrave;m tăng nguy cơ g&acirc;y ung thư. N&oacute; l&agrave; nguy&ecirc;n nh&acirc;n g&acirc;y nhiều loại ung thư như ung thư miệng, họng, thanh quản, v&uacute;... Tỷ lệ mắc ung thư gan ở nam giới cao thứ 3 sau ung thư phổi v&agrave; dạ d&agrave;y- nguy&ecirc;n nh&acirc;n ch&iacute;nh l&agrave; do xơ gan v&igrave; sử dụng rượu bia qu&aacute; mức.</p>
<p>
	Chế độ ăn nhiều mỡ động vật, &iacute;t chất xơ l&agrave;m tăng nguy cơ mắc ung thư đại-trực tr&agrave;ng v&agrave; v&uacute;. C&aacute;c chất bảo quản, nhuộm m&agrave;u thực phẩm c&oacute; nguồn gốc h&oacute;a học; chất trung gian chuyển h&oacute;a v&agrave; sinh ra từ thực phẩm bị nấm mốc l&ecirc;n men cũng l&agrave; nguy&ecirc;n nh&acirc;n g&acirc;y ra nhiều loại ung thư đường ti&ecirc;u h&oacute;a như ung thư dạ d&agrave;y, gan, đại tr&agrave;ng...</p>
<p>
	Thịt hun kh&oacute;i, c&aacute; muối, dưa muối, c&agrave; muối, nhất l&agrave; dưa kh&uacute; c&oacute; nhiều muối nitrat, nitrit l&agrave; c&aacute;c chất g&acirc;y ung thư thực quản v&agrave; dạ d&agrave;y. Gạo v&agrave; lạc l&agrave; 2 loại thực phẩm dễ bị nấm mốc Aspergilllus flavus x&acirc;m nhiễm v&agrave; tiết ra một loại chất độc l&agrave; afatoxin g&acirc;y ung thư gan nguy&ecirc;n ph&aacute;t.</p>
<p>
	Ở nước ta, h&oacute;a chất bảo vệ thực vật- thuốc trừ s&acirc;u, thuốc diệt cỏ d&ugrave;ng phổ biến trong n&ocirc;ng nghiệp l&agrave; yếu tố nguy cơ g&acirc;y ung thư v&uacute; v&agrave; một số loại ung thư kh&aacute;c. Chất độc m&agrave;u da cam cũng l&agrave; yếu tố nguy cơ tiềm ẩn g&acirc;y nhiều bệnh ung thư. H&oacute;a chất sử dụng trong c&ocirc;ng nghiệp g&acirc;y ra khoảng 2-8% trong tổng số c&aacute;c loại ung thư.</p>
<p>
	Ngo&agrave;i ra c&ograve;n c&aacute;c yếu tố như bức xạ m&ocirc;i trường bao gồm c&aacute;c tia ph&oacute;ng xạ, nguy&ecirc;n nh&acirc;n từ lối sống lười vận động.</p>
', 1, 7)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (123, N'Thực hư công thức trị ung thư nhanh gấp 10 lần hóa trị', N'2017_06_09_05_24_17_5081459246116-c-1459241927.jpg', N' Mới đây, mạng xã hội rần rần chia sẻ 1 công thức đơn giản trị căn bệnh ung thư quái ác và nhận được nhiều chia sẻ từ cộng đồng mạng.', CAST(N'2017-06-09 05:23:13.000' AS DateTime), 1, N'<p>
	Được biết, đ&acirc;y l&agrave; c&ocirc;ng thức từ nền văn minh Ấn Độ cổ c&oacute; c&aacute;ch đ&acirc;y hơn 2.000 năm. C&ocirc;ng thức n&agrave;y đ&atilde; được sử dụng ở Ấn Độ trong nhiều thế kỷ qua.</p>
<p>
	<strong>Chuẩn bị:</strong></p>
<p>
	- 1 muỗng canh dầu &ocirc; liu &eacute;p nguội (c&oacute; thể thay thế bằng dầu dừa)</p>
<p>
	- 1/4 muỗng c&agrave; ph&ecirc; hạt ti&ecirc;u đen xay nhuyễn.</p>
<p>
	- 1/2 muỗng c&agrave; ph&ecirc; bột nghệ.</p>
<p>
	- 1/2 muỗng c&agrave; ph&ecirc; nước &eacute;p gừng.</p>
<p align="center">
	<img alt="Thực hư công thức trị ung thư nhanh gấp 10 lần hóa trị - 1" class="news-image" src="http://anh.24h.com.vn/upload/1-2016/images/2016-03-29/1459246116-c-1459241927.jpg" /></p>
<p align="center">
	<img alt="Thực hư công thức trị ung thư nhanh gấp 10 lần hóa trị - 2" class="news-image" src="http://anh.24h.com.vn/upload/1-2016/images/2016-03-29/1459246116-top-20-health-se-1459241925.jpg" /></p>
<p align="center">
	<img alt="Thực hư công thức trị ung thư nhanh gấp 10 lần hóa trị - 3" class="news-image" src="http://anh.24h.com.vn/upload/1-2016/images/2016-03-29/1459246116-23jrgd-1459241926.jpg" /></p>
<p style="color:#0000FF;font-style:italic;text-align:center;">
	Nhiều người tin những c&ocirc;ng thức đơn giản n&agrave;y c&oacute; thể trị căn bệnh ung thư qu&aacute;i &aacute;c. Ảnh minh họa.</p>
<p>
	<strong>Thực hiện:</strong>&nbsp;Cho tất cả v&agrave;o trong một ly nhỏ v&agrave; trộn đều.</p>
<p>
	<strong>C&aacute;ch d&ugrave;ng:</strong></p>
<p>
	-&nbsp;D&ugrave;ng hỗn hợp n&agrave;y như gia vị cho m&oacute;n salad hoặc c&aacute;c m&oacute;n s&uacute;p hay hầm.</p>
<p>
	-&nbsp;C&oacute; thể cho hỗn hợp v&agrave;o một cốc sữa chua v&agrave; thưởng thức.</p>
<p>
	-&nbsp;Tuy nhi&ecirc;n, c&aacute;c nh&agrave; khoa học khuy&ecirc;n rằng tốt nhất n&ecirc;n ti&ecirc;u thụ trực tiếp v&agrave; kh&ocirc;ng trộn lẫn với thực phẩm kh&aacute;c để đảm bảo hiệu quả tối ưu.</p>
<p>
	<strong>Liều d&ugrave;ng:</strong></p>
<p>
	-&nbsp;1 lần/ng&agrave;y để ph&ograve;ng ngừa ung thư ph&aacute;t triển.</p>
<p>
	-&nbsp;3 đến 4 lần/ ng&agrave;y để trị bệnh ung thư.</p>
<p>
	<strong>Hiệu quả sử dụng:</strong></p>
<p>
	-&nbsp;D&ugrave;ng mỗi ng&agrave;y sẽ hạn chế nguy cơ bị ung thư ở mức tối thiểu.</p>
<p>
	-&nbsp;C&aacute;c chuy&ecirc;n gia y tế khẳng định rằng phương ph&aacute;p d&acirc;n gian n&agrave;y c&oacute; thể chữa trị c&aacute;c khối u g&acirc;y tử vong.</p>
<p>
	Giải m&atilde; b&iacute; mật của c&ocirc;ng thức n&agrave;y, c&aacute;c th&agrave;nh phần tr&ecirc;n cũng được &ldquo;giải m&atilde;&rdquo; cụ thể:</p>
<p>
	Họ cho rằng, nghệ c&oacute; t&aacute;c dụng chống ung thư mạnh mẽ nhờ chất chống oxy h&oacute;a v&agrave; chống vi&ecirc;m gọi l&agrave; Curcumin. Ti&ecirc;u thụ nghệ thường xuy&ecirc;n sẽ gi&uacute;p bạn ph&ograve;ng chống bệnh tiểu đường, bệnh tim v&agrave; c&aacute;c bệnh ung thư ở c&aacute;c cơ quan như buồng trứng, tuyến tụy, tuyến tiền liệt, n&atilde;o v&agrave; ngực.</p>
<p>
	B&ecirc;n cạnh đ&oacute;, ti&ecirc;u đen với hoạt chất piperine l&agrave;m tăng khả năng hấp thu curcumin &ndash; một hoạt chất c&oacute; trong củ nghệ, l&ecirc;n đến 2000% v&agrave; đồng thời gi&uacute;p tăng cường tối đa khả năng trao đổi chất của cơ thể.</p>
<p align="center">
	<img alt="Thực hư công thức trị ung thư nhanh gấp 10 lần hóa trị - 4" class="news-image" src="http://anh.24h.com.vn/upload/1-2016/images/2016-03-29/1459246116-photosh-1459241929.jpg" /></p>
<p style="color:#0000FF;font-style:italic;text-align:center;">
	Được biết, đ&acirc;y l&agrave; c&ocirc;ng thức từ nền văn minh Ấn Độ cổ c&oacute; c&aacute;ch đ&acirc;y hơn 2000 năm. C&ocirc;ng thức n&agrave;y đ&atilde; được sử dụng ở Ấn Độ trong nhiều thế kỷ qua. Ảnh minh họa.</p>
<p>
	Tiếp đ&oacute;, gừng cũng l&agrave; một th&agrave;nh phần mạnh với chất chống oxy h&oacute;a, chống ung thư v&agrave; chống vi&ecirc;m, gừng c&oacute; khả năng v&ocirc; hiệu h&oacute;a c&aacute;c t&aacute;c nh&acirc;n g&acirc;y ung thư v&agrave; vi&ecirc;m nhiễm. Ch&uacute;ng ta thường d&ugrave;ng gừng để chữa chứng buồn n&ocirc;n, giải cảm v&agrave; th&uacute;c đẩy qu&aacute; tr&igrave;nh đốt ch&aacute;y chất b&eacute;o trong phương ph&aacute;p giảm c&acirc;n l&agrave;nh mạnh.</p>
<p>
	Ngo&agrave;i việc sử dụng hỗn hợp trị bệnh ung thư ở tr&ecirc;n, bạn n&ecirc;n kết hợp với tinh dầu trầm hương hoặc tinh dầu vỏ bưởi để tăng hiệu quả chữa trị. Chỉ với một hai giọt tinh dầu, bạn sẽ c&oacute; ngay một kh&ocirc;ng gian thơm dịu gi&uacute;p tinh thần thư th&aacute;i ho&agrave;n to&agrave;n sau những giờ ph&uacute;t căng thẳng. Bạn cũng c&oacute; thể xoa ch&uacute;t tinh l&ecirc;n th&aacute;i dương, cổ v&agrave; sống mũi để đ&aacute;nh bay cơn đau đầu ngay lập tức.</p>
<p>
	Để t&igrave;m hiểu r&otilde; thực hư của c&ocirc;ng thức đơn giản gi&uacute;p chiến thắng căn bệnh ung thư qu&aacute;i &aacute;c tr&ecirc;n, PV b&aacute;o Người Đưa Tin đ&atilde; c&oacute; cuộc phỏng vấn nhanh Lương y Vũ Quốc Trung, Ph&ograve;ng chẩn trị y học ch&ugrave;a Cảm Ứng. Vị lương y n&agrave;y khẳng định, chữa ung thư kh&ocirc;ng thể dựa v&agrave;o chỉ 4,5 nguy&ecirc;n liệu tr&ecirc;n m&agrave; c&oacute; thể chữa khỏi dứt điểm được.</p>
<p>
	Lương y Vũ Quốc Trung chia sẻ: Ung thư kh&ocirc;ng thể chữa chỉ bằng những nguy&ecirc;n liệu đơn giản tr&ecirc;n. Hơn nữa, c&ocirc;ng thức n&agrave;y kh&ocirc;ng chỉ ra l&agrave; để chữa bệnh ung thư g&igrave; cụ thể.</p>
<p align="center">
	<img alt="Thực hư công thức trị ung thư nhanh gấp 10 lần hóa trị - 5" class="news-image" src="http://anh.24h.com.vn/upload/1-2016/images/2016-03-29/1459246116-dong-y-tri-1459241928.jpg" /></p>
<p style="color:#0000FF;font-style:italic;text-align:center;">
	Lương y Vũ Quốc Trung, Ph&ograve;ng chẩn trị y học ch&ugrave;a Cảm Ứng.</p>
<p>
	Vị lương y n&agrave;y cũng khẳng định: &ldquo;Với bệnh ung thư hiện nay, y học hiện đại cũng chỉ c&oacute; 3 phương ph&aacute;p điều trị l&agrave; phẫu thuật, xạ trị, h&oacute;a trị. C&ograve;n c&aacute;c biện ph&aacute;p đ&ocirc;ng y chỉ c&oacute; vai tr&ograve; kết hợp hỗ trợ, giảm biến chứng đau đớn cho người bị ung thư&rdquo;.</p>
<p>
	Lương y n&agrave;y cũng n&oacute;i rằng, c&aacute;c bệnh nh&acirc;n bị ung thư kh&ocirc;ng n&ecirc;n coi đ&acirc;y l&agrave; phương ph&aacute;p cứu c&aacute;nh để điều trị dứt điểm bệnh. Bởi như vậy sẽ bỏ mất cơ hội chữa bệnh cho ch&iacute;nh bản th&acirc;n m&igrave;nh. Ngược lại, bạn n&ecirc;n đi thăm kh&aacute;m sớm v&agrave; điều trị theo đ&uacute;ng chỉ dẫn của b&aacute;c sĩ.</p>
', 1, 7)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (124, N'Bông cải xanh giúp ngừa ung thư gan', N'2017_06_09_05_25_21_361457485971-bong-cai-xanh-giup-ngua-ung-thu-gan.jpg', N' Nghiên cứu của các nhà khoa học Mỹ tại ĐH Illinois mới được công bố trên tờ Journal of Nutrition nêu khả năng bông cải xanh có thể giúp bảo vệ chống lại ung thư gan ở chuột.', CAST(N'2017-06-09 05:24:17.000' AS DateTime), 1, N'<p align="center">
	<img alt="Bông cải xanh giúp ngừa ung thư gan - 1" class="news-image" src="http://anh.24h.com.vn/upload/1-2016/images/2016-03-09/1457485971-bong-cai-xanh-giup-ngua-ung-thu-gan.jpg" width="500" /></p>
<p style="color:#0000FF;font-style:italic;text-align:center;">
	B&ocirc;ng cải xanh chứa chất kh&aacute;ng ung thư sulforaphane. Ảnh: MNT</p>
<p>
	Chế độ ăn nhiều dầu mỡ c&oacute; thể khiến cơ thể chứa mỡ dư thừa dẫn tới khả năng li&ecirc;n quan đến bệnh gan nhiễm mỡ kh&ocirc;ng do rượu (NAFLD). Nếu kh&ocirc;ng được ph&ograve;ng tr&aacute;nh v&agrave; trị liệu, NAFLD c&oacute; thể đi đến xơ gan v&agrave; ung thư tế b&agrave;o gan (HCC). Những nghi&ecirc;n cứu trước đ&acirc;y n&ecirc;u khả năng b&ocirc;ng cải xanh, b&ocirc;ng cải trắng v&agrave; một v&agrave;i loại bắp cải kh&aacute;c c&oacute; thể ngăn sự t&iacute;ch tụ mỡ ở gan, bảo vệ gan trước nguy cơ NAFLD.</p>
<p>
	Lợi &iacute;ch đ&oacute; phần n&agrave;o do th&agrave;nh phần kh&aacute;ng ung thư sulforaphane trong nh&oacute;m thực vật n&agrave;y mang lại. Trong nghi&ecirc;n cứu mới đ&acirc;y, GS Elizabeth Jeffrey v&agrave; cộng sự đ&atilde; thử nghiệm t&aacute;c dụng kh&aacute;ng ung thư của b&ocirc;ng cải xanh tr&ecirc;n chuột bị cho tiếp cận với chất g&acirc;y ung thư. Bốn nh&oacute;m chuột được thử nghiệm gồm: chuột được nu&ocirc;i dưỡng với nhiều mỡ v&agrave; đường khiến bị b&eacute;o ph&igrave;, nh&oacute;m được ăn theo chế độ c&oacute; kiểm so&aacute;t để đối chiếu, nh&oacute;m chuột được cho d&ugrave;ng v&agrave; nh&oacute;m kh&ocirc;ng d&ugrave;ng b&ocirc;ng cải xanh. Kết quả cho thấy nh&oacute;m chuột ăn nhiều mỡ, đường c&oacute; bướu ung thư ở gan nhiều v&agrave; to hơn. Tuy nhi&ecirc;n, chuột được th&ecirc;m b&ocirc;ng cải xanh v&agrave;o khẩu phần ăn c&oacute; lượng bướu ung thư giảm, d&ugrave; k&iacute;ch thước bướu kh&ocirc;ng giảm.</p>
<p>
	Một số nghi&ecirc;n cứu trước đ&acirc;y cũng đ&atilde; cho thấy d&ugrave;ng b&ocirc;ng cải xanh từ 3-5 lần/tuần c&oacute; thể k&eacute;o giảm nguy cơ v&agrave;i dạng ung thư kh&aacute;c.&nbsp;</p>
', 1, 7)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (125, N'Mướp đắng ngăn ngừa ung thư tuyến tụy và tiểu đường', N'2017_06_09_05_27_23_2111449711324-muop-dang.jpg', N' Một nghiên cứu tại Mỹ phát hiện nước ép của trái mướp đắng có thể ngăn chặn sự phát triển của tế bào ung thư tuyến tụy', CAST(N'2017-06-09 05:25:21.000' AS DateTime), 3, N'<p>
	Sự kết hợp tuyệt vời của c&aacute;c chất dinh dưỡng v&agrave; chất chống &ocirc; xy h&oacute;a</p>
<p>
	Mướp đắng (c&ograve;n gọi l&agrave; khổ qua) l&agrave; loại tr&aacute;i c&acirc;y c&oacute; nguồn gốc từ ch&acirc;u &Aacute;, ch&acirc;u Phi v&agrave; v&ugrave;ng Caribe. N&oacute; được sử dụng h&agrave;ng ng&agrave;n năm nay như một phương thuốc d&acirc;n gian v&agrave; một nguồn thực phẩm gi&agrave;u dinh dưỡng. Đ&oacute; l&agrave; một trong những loại thực phẩm được ưa th&iacute;ch, như dưa chuột, dưa hấu chứa nhiều folate, vitamin A v&agrave; C, kali.</p>
<p align="center">
	<img alt="Mướp đắng ngăn ngừa ung thư tuyến tụy và tiểu đường - 1" class="news-image" src="http://anh.24h.com.vn/upload/4-2015/images/2015-12-10/1449711324-muop-dang.jpg" width="500" /></p>
<p style="color:#0000FF;font-style:italic;text-align:center;">
	Ảnh minh họa</p>
<p>
	Mướp đắng chứa nhiều chất chống &ocirc; xy h&oacute;a, chứa cả beta-carotene v&agrave; lutein. Nhiều nh&agrave; nghi&ecirc;n cứu tin rằng n&oacute; l&agrave; sự kết hợp độc đ&aacute;o của c&aacute;c chất dinh dưỡng gi&uacute;p chống lại cả ung thư v&agrave; bệnh tiểu đường.</p>
<p>
	Một nghi&ecirc;n cứu mới nhất của Trường đại học Colorado (Mỹ) được tiến h&agrave;nh trong ống nghiệm v&agrave; trong cơ thể (động vật sống) cho thấy t&aacute;c dụng của mướp đắng với <a class="TextlinkBaiviet" href="http://www.24h.com.vn/suc-khoe-doi-song-c62.html" title="sức khỏe">sức khỏe</a>, trong trường hợp n&agrave;y nghi&ecirc;n cứu c&oacute; li&ecirc;n quan đến ung thư tuyến tụy. &nbsp;</p>
<p>
	Cả hai loại nghi&ecirc;n cứu đ&atilde; chỉ ra rằng chất chiết xuất từ mướp đắng c&oacute; thể ức chế sự sinh sản của c&aacute;c tế b&agrave;o ung thư. C&aacute;c nh&agrave; khoa học tin rằng n&oacute; c&oacute; thể l&agrave;m được điều n&agrave;y th&ocirc;ng qua việc cắt đứt nguồn cung cấp glucose nu&ocirc;i c&aacute;c tế b&agrave;o ung thư v&agrave; ti&ecirc;u diệt ch&uacute;ng.</p>
<p>
	Đ&acirc;y l&agrave; tin tuyệt vời cho những bệnh nh&acirc;n bị ung thư tuyến tụy, m&agrave; thường kh&ocirc;ng được ph&aacute;t hiện cho đến khi n&oacute; ph&aacute;t triển, tỷ lệ sống rất thấp v&agrave; &iacute;t lựa chọn để điều trị. Chỉ ri&ecirc;ng ở Mỹ, hằng năm c&oacute; khoảng 45.220 trường hợp mắc bệnh được ph&aacute;t hiện v&agrave; 38.460 trường hợp tử vong.</p>
<p>
	Đồng thời, theo một nghi&ecirc;n cứu được tiến h&agrave;nh bởi c&aacute;c nh&agrave; nghi&ecirc;n cứu từ Đại học Colorado v&agrave; Đại học Saint Louis, chiết xuất từ mướp đắng c&oacute; thể ngăn chặn sự ph&aacute;t triển v&agrave; g&acirc;y tử vong của c&aacute;c tế b&agrave;o ung thư v&uacute;. Nh&agrave; nghi&ecirc;n cứu đ&atilde; ph&aacute;t hiện ra chiết xuất từ mướp đắng c&oacute; khả năng điều biến một số đường truyền t&iacute;n hiệu g&acirc;y chết tế b&agrave;o ung thư v&uacute;. Do đ&oacute; chiết xuất n&agrave;y c&oacute; thể bổ sung v&agrave;o chế độ ăn uống để ph&ograve;ng ngừa ung thư v&uacute;.</p>
<p>
	Khả năng điều chỉnh glucose v&agrave; insulin trong cơ thể, c&aacute;c nh&agrave; khoa học tự hỏi n&oacute; c&oacute; hiệu quả bệnh nh&acirc;n tiểu đường...</p>
<p>
	Đại học Colorado đ&atilde; nghi&ecirc;n cứu v&agrave; chứng minh việc mướp đắng c&oacute; thể điều chỉnh nồng độ insulin. Theo nghi&ecirc;n cứu được c&ocirc;ng bố tr&ecirc;n tạp ch&iacute;&nbsp;H&oacute;a học v&agrave; Sinh học, bệnh nh&acirc;n tiểu đường sử dụng mướp đắng thường xuy&ecirc;n c&oacute; thể kiểm so&aacute;t tốt lượng đường trong m&aacute;u của họ v&agrave; tăng độ nhạy cho c&aacute;c hoạt động của insulin - n&oacute;i c&aacute;ch kh&aacute;c, mướp đắng cho ph&eacute;p cơ thể sử dụng glucose c&oacute; hiệu quả. Theo nghi&ecirc;n cứu c&ocirc;ng bố tr&ecirc;n tạp ch&iacute;&nbsp;Journal of Ethnopharmacology&nbsp;cũng thấy rằng bệnh nh&acirc;n tiểu đường d&ugrave;ng khoảng 2.000mg chiết xuất mướp đắng hằng ng&agrave;y c&oacute; thể gi&uacute;p kiểm so&aacute;t đường huyết trong m&aacute;u.&nbsp;</p>
<p>
	Ch&uacute; &yacute; khi sử dụng</p>
<p>
	-Kh&ocirc;ng d&ugrave;ng cho phụ nữ trong thời gian mang thai, v&igrave; n&oacute; c&oacute; thể g&acirc;y chảy m&aacute;u &acirc;m đạo, tử cung co thắt v&agrave; sảy thai.</p>
<p>
	-Kh&ocirc;ng sử dụng chung với thuốc chống đ&aacute;i th&aacute;o đường hoặc insulin, v&igrave; n&oacute; c&oacute; thể l&agrave;m giảm lượng đường trong m&aacute;u xuống thấp ở một mức độ nguy hiểm.</p>
<p>
	-Một số phản ứng phụ, bao gồm rung nhĩ, vi&ecirc;m lo&eacute;t dạ d&agrave;y v&agrave; phản ứng dị ứng</p>
', 1, 5)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (126, N'Những menu đồ ăn khiến thực khách cười…"đứt ruột"', N'2017_06_09_05_32_20_8621496914150-149691307696757-1.jpg', N'Những thực đơn được ghi bằng cả tiếng Việt và tiếng anh bị sai chính tả, ngữ pháp một cách “khó đỡ” khiến những thực khách khi gọi món có nguy cơ "đứt ruột" vì buồn cười.', CAST(N'2017-06-09 05:27:23.000' AS DateTime), 1, N'<p align="center" style="color:#0000FF;font-style:italic;text-align:center;">
	<img alt="Những menu đồ ăn khiến thực khách cười…&amp;#34;đứt ruột&amp;#34; - 1" class="news-image" src="http://image.24h.com.vn/upload/2-2017/images/2017-06-08/1496914150-149691307696757-1.jpg" width="500" /></p>
<p style="color:#0000FF;font-style:italic;text-align:center;">
	Biển hiệu của một cửa h&agrave;ng ăn uống với c&aacute;c m&oacute;n ăn được ghi bằng cả tiếng Việt lẫn tiếng Anh thế nhưng khi nh&igrave;n kỹ người xem mới ng&atilde; ngửa bởi tất cả đều được dịch sai v&agrave; ho&agrave;n to&agrave;n kh&aacute;c xa nghĩa gốc của n&oacute;.</p>
<p align="center" style="color:#0000FF;font-style:italic;text-align:center;">
	<img alt="Những menu đồ ăn khiến thực khách cười…&amp;#34;đứt ruột&amp;#34; - 2" class="news-image" src="http://image.24h.com.vn/upload/2-2017/images/2017-06-08/1496914151-149691307670225-2.jpg" width="500" /></p>
<p style="color:#0000FF;font-style:italic;text-align:center;">
	C&oacute; vẻ chủ qu&aacute;n ăn n&agrave;y l&agrave; &ldquo;nạn nh&acirc;n&rdquo; của Google dịch bởi c&aacute;c m&oacute;n ăn được dịch từ tiếng Việt sang tiếng Anh một c&aacute;ch v&ocirc; c&ugrave;ng b&aacute; đạo.</p>
<p align="center" style="color:#0000FF;font-style:italic;text-align:center;">
	<img alt="Những menu đồ ăn khiến thực khách cười…&amp;#34;đứt ruột&amp;#34; - 3" class="news-image" src="http://image.24h.com.vn/upload/2-2017/images/2017-06-08/1496914151-149691307692080-3.jpg" width="500" /></p>
<p style="color:#0000FF;font-style:italic;text-align:center;">
	Hay menu đồ hải sản theo phong c&aacute;ch Việt - Anh phối kết hợp.</p>
<p align="center" style="color:#0000FF;font-style:italic;text-align:center;">
	<img alt="Những menu đồ ăn khiến thực khách cười…&amp;#34;đứt ruột&amp;#34; - 4" class="news-image" src="http://image.24h.com.vn/upload/2-2017/images/2017-06-08/1496914152-149691307678006-4.jpg" width="500" /></p>
<p style="color:#0000FF;font-style:italic;text-align:center;">
	Qu&aacute;n b&aacute;n x&ocirc;i s&aacute;ng với lỗi ch&iacute;nh tả rất phổ biến.</p>
<p align="center" style="color:#0000FF;font-style:italic;text-align:center;">
	<img alt="Những menu đồ ăn khiến thực khách cười…&amp;#34;đứt ruột&amp;#34; - 5" class="news-image" src="http://image.24h.com.vn/upload/2-2017/images/2017-06-08/1496914152-149691307632379-5.jpg" width="500" /></p>
<p style="color:#0000FF;font-style:italic;text-align:center;">
	B&aacute;nh gối chứ kh&ocirc;ng phải l&agrave; c&aacute;i gối.</p>
<p align="center" style="color:#0000FF;font-style:italic;text-align:center;">
	<img alt="Những menu đồ ăn khiến thực khách cười…&amp;#34;đứt ruột&amp;#34; - 6" class="news-image" src="http://image.24h.com.vn/upload/2-2017/images/2017-06-08/1496914152-149691307652790-6.jpg" width="500" /></p>
<p style="color:#0000FF;font-style:italic;text-align:center;">
	Bạn c&oacute; biết tr&ecirc;n tấm Menu n&agrave;y c&oacute; bao nhi&ecirc;u lỗi ch&iacute;nh tả kh&ocirc;ng? V&acirc;ng kh&ocirc;ng thể tin được, c&oacute; tới 18 lỗi ch&iacute;nh tả tất cả đ&oacute; ạ.</p>
<p align="center" style="color:#0000FF;font-style:italic;text-align:center;">
	<img alt="Những menu đồ ăn khiến thực khách cười…&amp;#34;đứt ruột&amp;#34; - 7" class="news-image" src="http://image.24h.com.vn/upload/2-2017/images/2017-06-08/1496914152-149691307615275-7.jpg" width="500" /></p>
<p style="color:#0000FF;font-style:italic;text-align:center;">
	Hay một tấm menu đồ ăn &ldquo;li&ecirc;n ho&agrave;n chưởng&rdquo; theo phong c&aacute;ch kiếm hiệp v&ocirc; c&ugrave;ng độc đ&aacute;o.</p>
<p align="center" style="color:#0000FF;font-style:italic;text-align:center;">
	<img alt="Những menu đồ ăn khiến thực khách cười…&amp;#34;đứt ruột&amp;#34; - 8" class="news-image" src="http://image.24h.com.vn/upload/2-2017/images/2017-06-08/1496914152-149691307626279-8.jpg" width="500" /></p>
<p style="color:#0000FF;font-style:italic;text-align:center;">
	Những m&oacute;n ăn với t&ecirc;n gọi qu&aacute; độc đ&aacute;o.</p>
<p align="center" style="color:#0000FF;font-style:italic;text-align:center;">
	<img alt="Những menu đồ ăn khiến thực khách cười…&amp;#34;đứt ruột&amp;#34; - 9" class="news-image" src="http://image.24h.com.vn/upload/2-2017/images/2017-06-08/1496914153-14969130762893-9.jpg" width="500" /></p>
<p style="color:#0000FF;font-style:italic;text-align:center;">
	&Ocirc; mai kh&ocirc;ng phải t&ecirc;n một loại đồ ăn m&agrave; lại l&agrave; sự kết hợp tuyệt vời giữa c&aacute;i &ocirc; (umbrella) v&agrave; ng&agrave;y mai (tomorrow).</p>
<p align="center" style="color:#0000FF;font-style:italic;text-align:center;">
	<img alt="Những menu đồ ăn khiến thực khách cười…&amp;#34;đứt ruột&amp;#34; - 10" class="news-image" src="http://image.24h.com.vn/upload/2-2017/images/2017-06-08/1496914153-149691307626130-10.jpg" width="500" /></p>
<p style="color:#0000FF;font-style:italic;text-align:center;">
	Chanh leo d&ugrave; đ&uacute;ng l&agrave; một c&acirc;y thuộc lo&agrave;i d&acirc;y leo nhưng kh&ocirc;ng phải l&agrave; Lemon Climb người ơi</p>
<p align="center" style="color:#0000FF;font-style:italic;text-align:center;">
	<img alt="Những menu đồ ăn khiến thực khách cười…&amp;#34;đứt ruột&amp;#34; - 11" class="news-image" src="http://image.24h.com.vn/upload/2-2017/images/2017-06-08/1496914153-149691307674428-11.jpg" width="500" /></p>
<p style="color:#0000FF;font-style:italic;text-align:center;">
	Một qu&aacute;n ăn với bản &ldquo;Nội quy tr&ecirc;n b&agrave;n nhậu&rdquo; được ghi ngắn gọn, r&otilde; r&agrave;ng k&egrave;m theo mức phạt cụ thể cho từng trường hợp vi phạm khiến c&aacute;c bợm nhậu phải cười lăn cười b&ograve; nhưng cũng v&ocirc; c&ugrave;ng nghi&ecirc;m t&uacute;c khi thực hiện.</p>
', 1, 8)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (127, N'Dân mạng “phát sốt” với bánh mì “khổng lồ” ở An Giang', N'2017_06_09_05_33_24_4751494851150-149485069524129-1.jpg', N' Cộng đồng mạng đang xôn xao thông tin về những ổ bánh mì “khổng lồ” ở An Giang.', CAST(N'2017-06-09 05:32:20.000' AS DateTime), 1, N'<p align="center">
	<img alt="Dân mạng “phát sốt” với bánh mì “khổng lồ” ở An Giang - 1" class="news-image" src="http://image.24h.com.vn/upload/2-2017/images/2017-05-15/1494851150-149485069524129-1.jpg" /></p>
<p style="color:#0000FF;font-style:italic;text-align:center;">
	Một xe chở đầy b&aacute;nh m&igrave; &ldquo;khổng lồ&rdquo; đi b&aacute;n ở khu vực cầu Cồn Ti&ecirc;n, huyện An Ph&uacute;, tỉnh An Giang. (Ảnh: Cao Phương)</p>
<p>
	Nhiều ng&agrave;y qua, cộng đồng mạng đang chia sẻ nhanh &ldquo;ch&oacute;ng mặt&rdquo; những h&igrave;nh ảnh li&ecirc;n quan tới ổ b&aacute;nh m&igrave; &ldquo;khổng lồ&rdquo; ở An Giang.</p>
<p>
	Điều khiến những h&igrave;nh ảnh n&agrave;y &ldquo;h&uacute;t hồn&rdquo; d&acirc;n mạng l&agrave; k&iacute;ch thước &ldquo;khủng&rdquo;, trọng lượng nặng chưa từng c&oacute;. Theo đ&oacute;, t&ugrave;y ổ b&aacute;nh m&igrave; m&agrave; n&oacute; c&oacute; k&iacute;ch thước từ 0,9 - 1,2m, trọng lượng từ 2 - 3,5kg.</p>
<p>
	Theo chia sẻ của Facebooker Ngọc B&iacute;ch, khu vực được b&agrave;y b&aacute;n loại b&aacute;nh m&igrave; n&agrave;y l&agrave; ở cầu Cồn Ti&ecirc;n, huyện An Ph&uacute;, tỉnh An Giang. B&aacute;nh m&igrave; &ldquo;khổng lồ&rdquo; n&oacute;i tr&ecirc;n được nhiều du kh&aacute;ch mua l&agrave;m qu&agrave; khi gh&eacute; thăm An Giang v&agrave; ch&uacute;ng đ&atilde; trở th&agrave;nh điểm &ldquo;check-in&rdquo; quen thuộc của du kh&aacute;ch chứ kh&ocirc;ng phải mới đ&acirc;y.</p>
<p align="center">
	<img alt="Dân mạng “phát sốt” với bánh mì “khổng lồ” ở An Giang - 2" class="news-image" src="http://image.24h.com.vn/upload/2-2017/images/2017-05-15/1494851151-149485069548351-2.jpg" /></p>
<p style="color:#0000FF;font-style:italic;text-align:center;">
	Ổ b&aacute;nh m&igrave; &ldquo;khổng lồ&rdquo; cao gần bằng đầu người. (Ảnh: Ngọc B&iacute;ch)</p>
<p>
	Để l&agrave;m ra được một chiếc b&aacute;nh, người thợ thường&nbsp;mất 6 giờ đồng hồ thực hiện c&aacute;c thao t&aacute;c trộn bột, nhồi bột, ủ bột, tạo khu&ocirc;n v&agrave; nướng b&aacute;nh. Trong qu&aacute; tr&igrave;nh nướng b&aacute;nh, người thợ cũng phải trở mặt b&aacute;nh li&ecirc;n tục để đảm bảo ch&iacute;n đều v&agrave; c&oacute; m&agrave;u &oacute;ng &aacute;nh đẹp mắt.</p>
<p>
	Kh&ocirc;ng chỉ c&oacute; k&iacute;ch thước &ldquo;khủng&rdquo;, những ổ b&aacute;nh m&igrave; &ldquo;khổng lồ&rdquo; mang đậm dấu ấn của người d&acirc;n An Giang c&ograve;n rất ngon, gi&ograve;n r&ugrave;m v&agrave; thơm lừng m&ugrave;i bơ.</p>
', 1, 8)
INSERT [dbo].[db_TinTuc] ([TinTucID], [TieuDe], [AnhDaiDien], [MoTa], [NgayDang], [LuotXem], [ChiTiet], [ThuTu], [MaDM]) VALUES (128, N'Trai đẹp', N'2017_06_12_08_50_36_752sơ mi 3.jpg', N'Trai dẹp demo', CAST(N'2017-06-12 08:50:05.000' AS DateTime), 3, N'<p>
	Trai đẹp</p>
', 1, 17)
SET IDENTITY_INSERT [dbo].[db_TinTuc] OFF
ALTER TABLE [dbo].[db_ChiTietDonDatHang]  WITH CHECK ADD  CONSTRAINT [FK_db_ChiTietDonDatHang_db_DonDatHang] FOREIGN KEY([MaDonDatHang])
REFERENCES [dbo].[db_DonDatHang] ([MaDonDatHang])
GO
ALTER TABLE [dbo].[db_ChiTietDonDatHang] CHECK CONSTRAINT [FK_db_ChiTietDonDatHang_db_DonDatHang]
GO
ALTER TABLE [dbo].[db_ChiTietDonDatHang]  WITH CHECK ADD  CONSTRAINT [FK_db_ChiTietDonDatHang_db_SanPham] FOREIGN KEY([MaSP])
REFERENCES [dbo].[db_SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[db_ChiTietDonDatHang] CHECK CONSTRAINT [FK_db_ChiTietDonDatHang_db_SanPham]
GO
ALTER TABLE [dbo].[db_ChiTietDonHang]  WITH CHECK ADD  CONSTRAINT [FK_db_ChiTietDonHang_db_HoaDon] FOREIGN KEY([MaHD])
REFERENCES [dbo].[db_HoaDon] ([MaHD])
GO
ALTER TABLE [dbo].[db_ChiTietDonHang] CHECK CONSTRAINT [FK_db_ChiTietDonHang_db_HoaDon]
GO
ALTER TABLE [dbo].[db_ChiTietDonHang]  WITH CHECK ADD  CONSTRAINT [FK_db_ChiTietDonHang_db_SanPham] FOREIGN KEY([MaSP])
REFERENCES [dbo].[db_SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[db_ChiTietDonHang] CHECK CONSTRAINT [FK_db_ChiTietDonHang_db_SanPham]
GO
ALTER TABLE [dbo].[db_DangKy]  WITH CHECK ADD  CONSTRAINT [FK_db_DangKy_db_QuyenDangNhap] FOREIGN KEY([MaQuyen])
REFERENCES [dbo].[db_QuyenDangNhap] ([MaQuyen])
GO
ALTER TABLE [dbo].[db_DangKy] CHECK CONSTRAINT [FK_db_DangKy_db_QuyenDangNhap]
GO
ALTER TABLE [dbo].[db_DonDatHang]  WITH CHECK ADD  CONSTRAINT [FK_db_DonDatHang_db_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[db_KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[db_DonDatHang] CHECK CONSTRAINT [FK_db_DonDatHang_db_KhachHang]
GO
ALTER TABLE [dbo].[db_HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_db_HoaDon_db_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[db_KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[db_HoaDon] CHECK CONSTRAINT [FK_db_HoaDon_db_KhachHang]
GO
ALTER TABLE [dbo].[db_HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_db_HoaDon_db_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[db_NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[db_HoaDon] CHECK CONSTRAINT [FK_db_HoaDon_db_NhanVien]
GO
ALTER TABLE [dbo].[db_QuangCao]  WITH CHECK ADD  CONSTRAINT [FK_db_QuangCao_db_NhomQuangCao] FOREIGN KEY([NhomQuangCaoID])
REFERENCES [dbo].[db_NhomQuangCao] ([NhomQuangCaoID])
GO
ALTER TABLE [dbo].[db_QuangCao] CHECK CONSTRAINT [FK_db_QuangCao_db_NhomQuangCao]
GO
ALTER TABLE [dbo].[db_SanPham]  WITH CHECK ADD  CONSTRAINT [FK_db_SanPham_db_ChatLieu] FOREIGN KEY([ChatLieuID])
REFERENCES [dbo].[db_ChatLieu] ([ChatLieuID])
GO
ALTER TABLE [dbo].[db_SanPham] CHECK CONSTRAINT [FK_db_SanPham_db_ChatLieu]
GO
ALTER TABLE [dbo].[db_SanPham]  WITH CHECK ADD  CONSTRAINT [FK_db_SanPham_db_DanhMuc] FOREIGN KEY([MaDM])
REFERENCES [dbo].[db_DanhMuc] ([MaDM])
GO
ALTER TABLE [dbo].[db_SanPham] CHECK CONSTRAINT [FK_db_SanPham_db_DanhMuc]
GO
ALTER TABLE [dbo].[db_SanPham]  WITH CHECK ADD  CONSTRAINT [FK_db_SanPham_db_Mau] FOREIGN KEY([MauID])
REFERENCES [dbo].[db_Mau] ([MauID])
GO
ALTER TABLE [dbo].[db_SanPham] CHECK CONSTRAINT [FK_db_SanPham_db_Mau]
GO
ALTER TABLE [dbo].[db_SanPham]  WITH CHECK ADD  CONSTRAINT [FK_db_SanPham_db_NhomSanPham] FOREIGN KEY([NhomID])
REFERENCES [dbo].[db_NhomSanPham] ([NhomID])
GO
ALTER TABLE [dbo].[db_SanPham] CHECK CONSTRAINT [FK_db_SanPham_db_NhomSanPham]
GO
ALTER TABLE [dbo].[db_SanPham]  WITH CHECK ADD  CONSTRAINT [FK_db_SanPham_db_Size] FOREIGN KEY([SizeID])
REFERENCES [dbo].[db_Size] ([SizeID])
GO
ALTER TABLE [dbo].[db_SanPham] CHECK CONSTRAINT [FK_db_SanPham_db_Size]
GO
ALTER TABLE [dbo].[db_TinTuc]  WITH CHECK ADD  CONSTRAINT [FK_TinTuc_DanhMucTin] FOREIGN KEY([MaDM])
REFERENCES [dbo].[db_DanhMucTin] ([MaDM])
GO
ALTER TABLE [dbo].[db_TinTuc] CHECK CONSTRAINT [FK_TinTuc_DanhMucTin]
GO
/****** Object:  StoredProcedure [dbo].[CapNhatLuotXemTinTuc]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[CapNhatLuotXemTinTuc]
@id int
as
update db_TinTuc set LuotXem=LuotXem+1 where TinTucID=@id

GO
/****** Object:  StoredProcedure [dbo].[chatlieu_delete]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[chatlieu_delete]
@chatlieuid int
AS
BEGIN
	delete from db_ChatLieu where ChatLieuID=@chatlieuid	
END
GO
/****** Object:  StoredProcedure [dbo].[chatlieu_inser]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[chatlieu_inser]
@tenchatlieu nvarchar(50),
@ret int out
AS
BEGIN
	set @ret=1
	if(not exists(select * from db_ChatLieu where @tenchatlieu=TenChatLieu))
	begin
	insert into db_ChatLieu(TenChatLieu) values(@tenchatlieu)
	set @ret=2
	end
END

GO
/****** Object:  StoredProcedure [dbo].[chatlieu_update]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[chatlieu_update]
@chatlieuid int,
@tenchatlieu nvarchar (50)
AS
BEGIN
	update db_ChatLieu set TenChatLieu=@tenchatlieu where ChatlieuID=@chatlieuid
END

GO
/****** Object:  StoredProcedure [dbo].[chitietdondathang_delete]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[chitietdondathang_delete]
@masp int,
@madondathang int
AS
BEGIN
	delete db_ChiTietDonDatHang where MaSP=@masp and MaDonDatHang=@madondathang
END

GO
/****** Object:  StoredProcedure [dbo].[chitietdondathang_inser]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[chitietdondathang_inser]
@masp int,
@madondathang int,
@soluongdat int,
@dongiadat float,
@ret int out
AS
BEGIN
	set @ret=1
	if(not exists(select * from db_ChiTietDonDatHang where @masp=MaSP and @madondathang=MaDonDatHang))
	begin
	insert into db_ChiTietDonDatHang(MaSP,MaDonDatHang,SoLuongDat,DonGiaDat) values(@masp,@madondathang,@soluongdat,@dongiadat)
	set @ret=2
	end
END

GO
/****** Object:  StoredProcedure [dbo].[chitietdondathang_update]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[chitietdondathang_update]
@masp int,
@madondathang int,
@soluongdat int,
@dongiadat float
AS
BEGIN
	update db_ChiTietDonDatHang set SoLuongDat=@soluongdat,DonGiaDat=@dongiadat where MaSP=@masp and MaDonDatHang=@madondathang
END

GO
/****** Object:  StoredProcedure [dbo].[chitietdonhang_delete]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[chitietdonhang_delete]
@masp int,
@mahoadon int
AS
BEGIN
	delete db_ChiTietDonHang where MaSP=@masp and MaHD=@mahoadon
END

GO
/****** Object:  StoredProcedure [dbo].[chitietdonhang_inser]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[chitietdonhang_inser]
@masp int,
@mahoadon int,
@soluong int,
@dongia float,
@ret int out
AS
BEGIN
	set @ret=1
	if(not exists(select * from db_ChiTietDonHang where @masp=MaSP and @mahoadon=MaHD))
	begin
	insert into db_ChiTietDonHang(MaHD,MaSP,SoLuong,DonGia) values(@mahoadon,@masp,@soluong,@dongia)
	set @ret=2
	end
END

GO
/****** Object:  StoredProcedure [dbo].[chitietdonhang_update]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[chitietdonhang_update]
@masp int,
@mahoadon int,
@soluong int,
@dongia float
AS
BEGIN
	update db_ChiTietDonHang set SoLuong=@soluong,DonGia=@dongia where MaSP=@masp and MaHD=@mahoadon
END

GO
/****** Object:  StoredProcedure [dbo].[dangky_delete]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[dangky_delete]
@tendangnhap varchar(50)
AS
BEGIN
	delete from db_DangKy where TenDangNhap=@tendangnhap
END

GO
/****** Object:  StoredProcedure [dbo].[dangky_inser]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[dangky_inser]
@tendangnhap varchar(50),
@matkhau varchar(50) ,
@emaildk varchar(50),
@diachidk nvarchar(50),
@tendaydu nvarchar(50),
@cauhoibaomat nvarchar(100),
@ngaysinh date,
@gioitinhdk nvarchar(10),
@maquyen int,
@ret int out
AS
BEGIN
	set @ret=1
	if(not exists(select * from db_DangKy where @tendangnhap=TenDangNhap))
	begin
	insert into db_DangKy(TenDangNhap,MatKhau,EmailDK,DiaChiDK,TenDayDu,CauHoiBaoMat,NgaySinh,GioiTinhDK,MaQuyen) values(@tendangnhap,@matkhau,@emaildk,@diachidk,@tendaydu,@cauhoibaomat,@ngaysinh,@gioitinhdk,@maquyen)
	set @ret=2
	end
END

GO
/****** Object:  StoredProcedure [dbo].[dangky_update]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[dangky_update]
@tendangnhap varchar(50),
@matkhau varchar(50) ,
@emaildk varchar(50),
@diachidk nvarchar(50),
@tendaydu nvarchar(50),
@cauhoibaomat nvarchar(100),
@ngaysinh date,
@gioitinhdk nvarchar(10),
@maquyen int
AS
BEGIN
	update db_DangKy set MatKhau=@matkhau,EmailDK=@emaildk,DiaChiDK=@diachidk,TenDayDu=@tendaydu,CauHoiBaoMat=@cauhoibaomat,NgaySinh=@ngaysinh,GioiTinhDK=@gioitinhdk,MaQuyen=@maquyen where TenDangNhap=@tendangnhap
END

GO
/****** Object:  StoredProcedure [dbo].[danhmuc_delete]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[danhmuc_delete]
@madm int
AS
BEGIN
	delete from db_DanhMuc where MaDM=@madm	
END
GO
/****** Object:  StoredProcedure [dbo].[danhmuc_inser]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[danhmuc_inser]
@tendm nvarchar(50),
@anhdaidien nvarchar(100),
@thutu int,
@maDMcha int,
@ret int out
AS
BEGIN
	set @ret=1
	if(not exists(select * from db_DanhMuc where @tendm=TenDM))
	begin
	insert into db_DanhMuc(TenDM,AnhDaiDien,ThuTu,MaDMCha) values(@tendm,@anhdaidien,@thutu,@maDMcha)
	set @ret=2
	end
END

GO
/****** Object:  StoredProcedure [dbo].[danhmuc_update]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[danhmuc_update]
@madm int,
@tendm nvarchar(50),
@anhdaidien nvarchar(100),
@thutu int,
@maDMcha int
AS
BEGIN
	update db_DanhMuc set TenDM=@tendm,AnhDaiDien=@anhdaidien,ThuTu=@thutu,MaDMCha=@maDMcha where MaDM=@madm
END

GO
/****** Object:  StoredProcedure [dbo].[danhmuctin_delete]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[danhmuctin_delete]
@madm int
AS
BEGIN
	delete from db_DanhMucTin where MaDM=@madm
	delete from db_TinTuc where MaDM=@madm
END

GO
/****** Object:  StoredProcedure [dbo].[danhmuctin_inser]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[danhmuctin_inser]
@tendm nvarchar(50),
@anhdaidien nvarchar(100),
@thutu int,
@maDMcha int,
@ret int out
AS
BEGIN
	set @ret=1
	if(not exists(select * from db_DanhMuc where @tendm=TenDM))
	begin
	insert into db_DanhMucTin(TenDM,AnhDaiDien,ThuTu,MaDMCha) values(@tendm,@anhdaidien,@thutu,@maDMcha)
	set @ret=2
	end
END

GO
/****** Object:  StoredProcedure [dbo].[danhmuctin_update]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[danhmuctin_update]
@madm int,
@tendm nvarchar(50),
@anhdaidien nvarchar(100),
@thutu int,
@maDMcha int
AS
BEGIN
	update db_DanhMucTin set TenDM=@tendm,AnhDaiDien=@anhdaidien,ThuTu=@thutu,MaDMCha=@maDMcha where MaDM=@madm
END

GO
/****** Object:  StoredProcedure [dbo].[dondathang_delete]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[dondathang_delete]
@madondathang int
AS
BEGIN
	delete from db_ChiTietDonDatHang where MaDonDatHang=@madondathang
	delete from db_DonDatHang where MaDonDatHang=@madondathang	
END
GO
/****** Object:  StoredProcedure [dbo].[dondathang_inser]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[dondathang_inser]
@ngaytao datetime,
@thanhtienhd float,
@tinhtrangdonhang nchar(10),
@makh int,
@tenkh nvarchar(50),
@sdtkh varchar(15),
@emailkh varchar(50),
@ret int out
AS
BEGIN
	set @ret=1
	begin
	insert into db_DonDatHang(NgayTao,ThanhTienDH,TinhTrangDonHang,MaKH,TenKH,sdtKH,EmailKH) values(@ngaytao,@thanhtienhd,@tinhtrangdonhang,@makh,@tenkh,@sdtkh,@emailkh)
	set @ret=2
	end
END

GO
/****** Object:  StoredProcedure [dbo].[dondathang_update]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[dondathang_update]
@madondathang int,
@ngaytao datetime,
@thanhtienhd float,
@tinhtrangdonhang nchar(10),
@makh int,
@tenkh nvarchar(50),
@sdtkh varchar(15),
@emailkh varchar(50)
AS
BEGIN
	update db_DonDatHang set NgayTao=@ngaytao,ThanhTienDH=@thanhtienhd,TinhTrangDonHang=@tinhtrangdonhang,MaKH=@makh,TenKH=@tenkh,sdtKH=@sdtkh,EmailKH=@emailkh where MaDonDatHang=@madondathang
END

GO
/****** Object:  StoredProcedure [dbo].[hoadon_delete]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[hoadon_delete]
@mahoadon int
AS
BEGIN
	delete from db_ChiTietDonHang where MaHD=@mahoadon
	delete from db_HoaDon where MaHD=@mahoadon
END

GO
/****** Object:  StoredProcedure [dbo].[hoadon_inser]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[hoadon_inser]
@ngaylap datetime,
@thanhtien float,
@manv int,
@tennv nvarchar(70),
@makh int,
@tenkh nvarchar(70),
@ret int out
AS
BEGIN
	set @ret=1
	begin
	insert into db_HoaDon(NgayLap,ThanhTien,MaNV,TenNV,MaKH,TenKH) values(@ngaylap,@thanhtien,@manv,@tennv,@makh,@tenkh)
	set @ret=2
	end
END
GO
/****** Object:  StoredProcedure [dbo].[hoadon_update]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[hoadon_update]
@mahoadon int,
@ngaylap datetime,
@thanhtien float,
@manv int,
@tennv nvarchar(70),
@makh int,
@tenkh nvarchar(70)
AS
BEGIN
	update db_HoaDon set NgayLap=@ngaylap,ThanhTien=@thanhtien,MaNV=@manv,TenNV=@tennv,MaKH=@makh,TenKH=@tenkh where MaHD=@mahoadon
END

GO
/****** Object:  StoredProcedure [dbo].[khachang_delete]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[khachang_delete]
@makh int
AS
BEGIN
	delete from db_KhachHang where MaKH=@makh
END

GO
/****** Object:  StoredProcedure [dbo].[khachang_inser]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[khachang_inser]
@tenkh nvarchar(50),
@diachikh nvarchar(100),
@sdtkh varchar(15),
@emailkh varchar(50),
@matkhau nvarchar(50),
@ret int out
AS
BEGIN
	set @ret=1
	begin
	insert into db_KhachHang(TenKh,DiaChiKH,sdtKH,EmailKH,MatKhau) values(@tenkh,@diachikh,@sdtkh,@emailkh,@matkhau)
	set @ret=2
	end
END

GO
/****** Object:  StoredProcedure [dbo].[khachang_update]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[khachang_update]
@makh int,
@tenkh nvarchar(50),
@diachikh nvarchar(100),
@sdtkh varchar(15),
@emailkh varchar(50),
@matkhau nvarchar(50)
AS
BEGIN
	update db_KhachHang set TenKh=@tenkh,DiaChiKH=@diachikh,sdtKH=@sdtkh,EmailKH=@emailkh, MatKhau=@matkhau where MaKH=@makh
END

GO
/****** Object:  StoredProcedure [dbo].[luotxem_update]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[luotxem_update]

@LuotXem int,
@TinTucID int

AS
BEGIN
	update db_TinTuc set LuotXem=@LuotXem where TinTucID=@TinTucID
END

GO
/****** Object:  StoredProcedure [dbo].[mau_delete]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[mau_delete]
@mauid int
AS
BEGIN
	delete from db_Mau where MauID=@mauid
END
GO
/****** Object:  StoredProcedure [dbo].[mau_inser]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[mau_inser]
@tenmau nvarchar(50),
@ret int out
AS
BEGIN
	set @ret=1
	if(not exists(select * from db_Mau where @tenmau=TenMau))
	begin
	insert into db_Mau(TenMau) values(@tenmau)
	set @ret=2
	end
END

GO
/****** Object:  StoredProcedure [dbo].[mau_update]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[mau_update]
@mauid int,
@tenmau nvarchar(50)
AS
BEGIN
	update db_Mau set TenMau=@tenmau where MauID=@mauid
END

GO
/****** Object:  StoredProcedure [dbo].[menu_delete]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[menu_delete]
@mamenu int
AS
BEGIN
	delete from db_Menu where MaMenu=@mamenu
END

GO
/****** Object:  StoredProcedure [dbo].[menu_inser]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[menu_inser]
@tenmenu nvarchar(50),
@lienket varchar(200),
@mamenucha int,
@thutumenu int,
@ret int out
AS
BEGIN
	set @ret=1
	if(not exists(select * from db_Menu where @tenmenu=TenMenu))
	begin
	insert into db_Menu(TenMenu,LienKet,MaMenuCha,ThuTuMenu) values(@tenmenu,@lienket,@mamenucha,@thutumenu)
	set @ret=2
	end
END

GO
/****** Object:  StoredProcedure [dbo].[menu_update]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[menu_update]
@mamenu int,
@tenmenu nvarchar(50),
@lienket varchar(200),
@mamenucha int,
@thutumenu int
AS
BEGIN
	update db_Menu set TenMenu=@tenmenu,LienKet=@lienket,MaMenuCha=@mamenucha,ThuTuMenu=@thutumenu where MaMenu=@mamenu
END

GO
/****** Object:  StoredProcedure [dbo].[nhanvien_delete]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[nhanvien_delete]
@manv int
AS
BEGIN
	delete from db_NhanVien where MaNV=@manv
END

GO
/****** Object:  StoredProcedure [dbo].[nhanvien_inser]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[nhanvien_inser]
@tennv nvarchar(70),
@gioitinhnv nvarchar(10),
@diachinv nvarchar(100),
@sdtnv varchar(15),
@ngayvaolam datetime,
@ret int out
AS
BEGIN
	set @ret=1
	begin
	insert into db_NhanVien(TenNV,GioiTinhNV,DiaChiNV,sdtNV,NgayVaoLam) values(@tennv,@gioitinhnv,@diachinv,@sdtnv,@ngayvaolam)
	set @ret=2
	end
END

GO
/****** Object:  StoredProcedure [dbo].[nhanvien_update]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[nhanvien_update]
@manv int,
@tennv nvarchar(70),
@gioitinhnv nvarchar(10),
@diachinv nvarchar(100),
@sdtnv varchar(15),
@ngayvaolam datetime
AS
BEGIN
	update db_NhanVien set TenNV=@tennv,GioiTinhNV=@gioitinhnv,DiaChiNV=@diachinv,sdtNV=@sdtnv,NgayVaoLam=@ngayvaolam where MaNV=@manv
END

GO
/****** Object:  StoredProcedure [dbo].[nhomquangcao_delete]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[nhomquangcao_delete]
@nhomquangcaoid int
AS
BEGIN
	delete from db_NhomQuangCao where NhomQuangCaoID=@nhomquangcaoid
END

GO
/****** Object:  StoredProcedure [dbo].[nhomquangcao_inser]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[nhomquangcao_inser]
@tennhomqc nvarchar(50),
@vitriqc nvarchar(30),
@thutunhomqc int,
@anhdaidienqc nvarchar(100),
@ret int out
AS
BEGIN
	set @ret=1
	if(not exists(select * from db_NhomQuangCao where @tennhomqc=TenNhomQuangCao))
	begin
	insert into db_NhomQuangCao(TenNhomQuangCao,ViTriQC,ThuTuNhomQC,AnhDaiDienQC) values(@tennhomqc,@vitriqc,@thutunhomqc,@anhdaidienqc)
	set @ret=2
	end
END

GO
/****** Object:  StoredProcedure [dbo].[nhomquangcao_update]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[nhomquangcao_update]
@nhomquangcaoid int,
@tennhomquangcao nvarchar(50),
@vitriqc nvarchar(30),
@thutunhomqc int,
@anhdaidienqc nvarchar(100)
AS
BEGIN
	update db_NhomQuangCao set TenNhomQuangCao=@tennhomquangcao,ViTriQC=@vitriqc,ThuTuNhomQC=@thutunhomqc,AnhDaiDienQC=@anhdaidienqc where NhomQuangCaoID=@nhomquangcaoid
END

GO
/****** Object:  StoredProcedure [dbo].[nhomsanpham_delete]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[nhomsanpham_delete]
@nhomid int
AS
BEGIN
	delete from db_NhomSanPham where NhomID=@nhomid
END
GO
/****** Object:  StoredProcedure [dbo].[nhomsanpham_inser]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[nhomsanpham_inser]
@tennhom nvarchar(100),
@anhdaidien nvarchar(100),
@thutu int,
@soSPhienthi int,
@ret int out
AS
BEGIN
	set @ret=1
	if(not exists(select * from db_NhomSanPham where @tennhom=TenNhom))
	begin
	insert into db_NhomSanPham(TenNhom,AnhDaiDien,ThuTu,SoSPHienThi) values(@tennhom,@anhdaidien,@thutu,@soSPhienthi)
	set @ret=2
	end
END

GO
/****** Object:  StoredProcedure [dbo].[nhomsanpham_update]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[nhomsanpham_update]
@nhomid int,
@tennhom nvarchar(100),
@anhdadien nvarchar(100),
@thutu int,
@solanhienthi int
AS
BEGIN
	update db_NhomSanPham set TenNhom=@tennhom,AnhDaiDien=@anhdadien,ThuTu=@thutu,SoSPHienThi=@solanhienthi where NhomID=@nhomid
END

GO
/****** Object:  StoredProcedure [dbo].[quangcao_delete]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[quangcao_delete]
@quangcaoid int
AS
BEGIN
	delete from db_QuangCao where QuangCaoID=@quangcaoid
END

GO
/****** Object:  StoredProcedure [dbo].[quangcao_inser]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[quangcao_inser]
@tenqc nvarchar(50),
@loaiqc nvarchar(20),
@anhqc nvarchar(100),
@lienket nchar(100),
@thutuqc int,
@nhomqcID  INT,
@ret int out
AS
BEGIN
	set @ret=1
	if(not exists(select * from db_QuangCao where @tenqc=TenQC))
	begin
	insert into db_QuangCao(TenQC,LoaiQC,AnhQC,LienKet,ThuTuQC,NhomQuangCaoID) values(@tenqc,@loaiqc,@anhqc,@lienket,@thutuqc,@nhomqcID)
	set @ret=2
	end
END

GO
/****** Object:  StoredProcedure [dbo].[quangcao_update]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[quangcao_update]
@quangcaoid int,
@tenquangcao nvarchar(50),
@loaiqc nvarchar(20),
@anhqc nvarchar(100),
@lienket nchar(100),
@thutuqc int,
@nhomquangcaoid int
AS
BEGIN
	update db_QuangCao set TenQC=@tenquangcao,LoaiQC=@loaiqc,AnhQC=@anhqc,LienKet=@lienket,ThuTuQC=@thutuqc,NhomQuangCaoID=@nhomquangcaoid where QuangCaoID=@quangcaoid
END

GO
/****** Object:  StoredProcedure [dbo].[quyendangnhap_delete]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[quyendangnhap_delete]
@quyenid int
AS
BEGIN
	delete from db_QuyenDangNhap where MaQuyen=@quyenid
END

GO
/****** Object:  StoredProcedure [dbo].[quyendangnhap_inser]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[quyendangnhap_inser]
@tenquyen varchar(10),
@ret int out
AS
BEGIN
	set @ret=1
	if(not exists(select * from db_QuyenDangNhap where @tenquyen=TenQuyen))
	begin
	insert into db_QuyenDangNhap(TenQuyen) values(@tenquyen)
	set @ret=2
	end
END

GO
/****** Object:  StoredProcedure [dbo].[quyendangnhap_update]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[quyendangnhap_update]
@maquyen int,
@tenquyen varchar(100)
AS
BEGIN
	update db_QuyenDangNhap set TenQuyen=@tenquyen where MaQuyen=@maquyen
END

GO
/****** Object:  StoredProcedure [dbo].[sanpham_delete]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sanpham_delete]
@masp int
AS
BEGIN
	delete from db_SanPham where MaSP=@masp
END

GO
/****** Object:  StoredProcedure [dbo].[sanpham_inser]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sanpham_inser]
@tensp nvarchar(100),
@mauID int,
@sizeID int,
@chatieuID int,
@anhsanpham nvarchar(100),
@soluongsp int,
@giasp float,
@gianhapsp float,
@motasp nvarchar(MAX),
@ngaytao datetime,
@ngayhuy datetime,
@maDM int,
@nhomID int,
@ret int out
AS
BEGIN
	set @ret=1
	if(not exists(select * from db_SanPham where @tensp=TenSP))
	begin
	insert into db_SanPham(TenSP,MauID,SizeID,ChatLieuID,AnhSP,SoLuongSP,GiaSP,MotaSP,NgayTao,NgayHuy,MaDM,NhomID,GiaNhapSP) values(@tensp,@mauID,@sizeID,@chatieuID,@anhsanpham,@soluongsp,@giasp,@motasp,@ngaytao,@ngayhuy,@maDM,@nhomID,@gianhapsp)
	set @ret=2
	end
END
GO
/****** Object:  StoredProcedure [dbo].[sanpham_update]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sanpham_update]
@masp int,
@tensp nvarchar(100),
@mauid int,
@sizeid int,
@chatieuid int,
@anhsp nvarchar(100),
@soluongsp int,
@giasp float,
@gianhapsp float,
@motasp nvarchar(MAX),
@ngaytao datetime,
@ngayhuy datetime,
@madm int,
@nhomid int
AS
BEGIN
	update db_SanPham set TenSP=@tensp,MauID=@mauid,SizeID=@sizeid,ChatLieuID=@chatieuid,AnhSP=@anhsp,SoLuongSP=@soluongsp,GiaSP=@giasp,MotaSP=@motasp,NgayTao=@ngaytao,NgayHuy=@ngayhuy,MaDM=@madm,NhomID=@nhomid,GiaNhapSP=@gianhapsp where MaSP=@masp
END
GO
/****** Object:  StoredProcedure [dbo].[sanpham_update_soluong]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sanpham_update_soluong]
@masp int,
@soluongsp int

AS
BEGIN
	update db_SanPham set SoLuongSP=@soluongsp where MaSP=@masp
END
GO
/****** Object:  StoredProcedure [dbo].[size_delete]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[size_delete]
@sizeid int
AS
BEGIN

	delete from db_Size where SizeID=@sizeid
END
GO
/****** Object:  StoredProcedure [dbo].[size_inser]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[size_inser]
@tensize varchar(10),
@ret int out
AS
BEGIN
	set @ret=1
	if(not exists(select * from db_Size where @tensize=TenSize ))
	begin
	insert into db_Size(TenSize) values(@tensize)
	set @ret=2
	end
END

GO
/****** Object:  StoredProcedure [dbo].[size_update]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[size_update]
@sizeid int,
@tensize varchar(10)
AS
BEGIN
	update db_Size set TenSize=@tensize where SizeID=@sizeid
END

GO
/****** Object:  StoredProcedure [dbo].[thongtin_allby_tatca]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[thongtin_allby_tatca]
@Info nvarchar(max)
AS
BEGIN
	select * from db_SanPham where TenSP like N'%Info%'
END
GO
/****** Object:  StoredProcedure [dbo].[thongtin_chatlieu]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[thongtin_chatlieu]
AS
BEGIN
	select * from db_ChatLieu
END

GO
/****** Object:  StoredProcedure [dbo].[thongtin_chatlieu_by_id]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[thongtin_chatlieu_by_id]
@ChatLieuID INT
AS
BEGIN
	select * from db_ChatLieu where ChatLieuID=@ChatLieuID
END

GO
/****** Object:  StoredProcedure [dbo].[thongtin_chatlieu_by_ten]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[thongtin_chatlieu_by_ten]
@TenChatLieu nvarchar(max)
AS
BEGIN
	select * from db_ChatLieu where TenChatLieu=@TenChatLieu
END

GO
/****** Object:  StoredProcedure [dbo].[thongtin_chitietdondathang]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[thongtin_chitietdondathang]
AS
BEGIN
	select * from db_ChiTietDonDatHang
END

GO
/****** Object:  StoredProcedure [dbo].[thongtin_chitietdondathang_byMaDon]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[thongtin_chitietdondathang_byMaDon]
(
@madon nvarchar(300)
)
AS
BEGIN
	select * from db_ChiTietDonDatHang where MaDonDatHang=@madon
END
GO
/****** Object:  StoredProcedure [dbo].[thongtin_chitietdondathang_byMaSP]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[thongtin_chitietdondathang_byMaSP]
(
@masanpham nvarchar(300)
)
AS
BEGIN
	select * from db_ChiTietDonDatHang where MaSP=@masanpham
END
GO
/****** Object:  StoredProcedure [dbo].[thongtin_chitietdonhang]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[thongtin_chitietdonhang]
AS
BEGIN
	select * from db_ChiTietDonHang
END

GO
/****** Object:  StoredProcedure [dbo].[thongtin_chitietdonhang_bymahoadon]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[thongtin_chitietdonhang_bymahoadon]
@mahoadon nvarchar(100)
AS
BEGIN
	select * from db_ChiTietDonHang where MaHD = @mahoadon
END
GO
/****** Object:  StoredProcedure [dbo].[thongtin_dangky]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[thongtin_dangky]
AS
BEGIN
	select * from db_DangKy
END

GO
/****** Object:  StoredProcedure [dbo].[thongtin_dangky_by_id]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[thongtin_dangky_by_id]
@TenDangNhap varchar(50)
AS
BEGIN
	select * from db_DangKy where TenDangNhap=@TenDangNhap
END

GO
/****** Object:  StoredProcedure [dbo].[thongtin_dangky_by_id_matkhau]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[thongtin_dangky_by_id_matkhau]
@TenDangNhap varchar(50),
@MatKhau varchar(50)
AS
BEGIN
	select * from db_DangKy where TenDangNhap=@TenDangNhap and MatKhau=@MatKhau
END

GO
/****** Object:  StoredProcedure [dbo].[thongtin_dangky_by_maquyen]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[thongtin_dangky_by_maquyen]
@MaQuyen varchar(50)
AS
BEGIN
	select * from db_DangKy where MaQuyen=@MaQuyen
END
GO
/****** Object:  StoredProcedure [dbo].[thongtin_danhmuc]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[thongtin_danhmuc]
AS
BEGIN
	select * from db_DanhMuc order by ThuTu
END

GO
/****** Object:  StoredProcedure [dbo].[thongtin_danhmuc_by_id]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure  [dbo].[thongtin_danhmuc_by_id]
(
@MaDM INT
)
AS
BEGIN
	select * from db_DanhMuc where MaDM=@MaDM
END

GO
/****** Object:  StoredProcedure [dbo].[thongtin_danhmuc_by_MaDMCha]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure  [dbo].[thongtin_danhmuc_by_MaDMCha]
(
@MaDMCha INT
)
AS
BEGIN
	select * from db_DanhMuc where MaDMCha=@MaDMCha
END

GO
/****** Object:  StoredProcedure [dbo].[thongtin_danhmuc_by_MaDMCon]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure  [dbo].[thongtin_danhmuc_by_MaDMCon]
(
@MaDMCon INT
)
AS
BEGIN
	select MaDMCha from db_DanhMuc where MaDM=@MaDMCon
END
GO
/****** Object:  StoredProcedure [dbo].[thongtin_danhmuc_by_ten]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure  [dbo].[thongtin_danhmuc_by_ten]
(
@TenDM nvarchar(max)
)
AS
BEGIN
	select * from db_DanhMuc where TenDM=@TenDM
END

GO
/****** Object:  StoredProcedure [dbo].[thongtin_danhmuctin]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[thongtin_danhmuctin]
AS
BEGIN
	select * from db_DanhMucTin order by ThuTu
END

GO
/****** Object:  StoredProcedure [dbo].[thongtin_danhmuctin_by_id]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure  [dbo].[thongtin_danhmuctin_by_id]
(
@MaDM INT
)
AS
BEGIN
	select * from db_DanhMucTin where MaDM=@MaDM
END

GO
/****** Object:  StoredProcedure [dbo].[thongtin_danhmuctin_by_MaDMCha]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure  [dbo].[thongtin_danhmuctin_by_MaDMCha]
(
@MaDMCha INT
)
AS
BEGIN
	select * from db_DanhMucTin where MaDMCha=@MaDMCha
END

GO
/****** Object:  StoredProcedure [dbo].[thongtin_danhmuctin_by_MaDMCon]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure  [dbo].[thongtin_danhmuctin_by_MaDMCon]
(
@MaDMCon INT
)
AS
BEGIN
	select MaDMCha from db_DanhMucTin where MaDM=@MaDMCon
END
GO
/****** Object:  StoredProcedure [dbo].[thongtin_danhmuctin_by_ten]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure  [dbo].[thongtin_danhmuctin_by_ten]
(
@TenDM nvarchar(max)
)
AS
BEGIN
	select * from db_DanhMucTin where TenDM=@TenDM
END

GO
/****** Object:  StoredProcedure [dbo].[thongtin_dondathang]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[thongtin_dondathang]
AS
BEGIN
	select * from db_DonDatHang
END

GO
/****** Object:  StoredProcedure [dbo].[thongtin_dondathang_by_emailKH]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[thongtin_dondathang_by_emailKH]
(
@mailkh nvarchar(300)
)
AS
BEGIN
	
	select * from db_DonDatHang where EmailKH=@mailkh
END
GO
/****** Object:  StoredProcedure [dbo].[thongtin_dondathang_by_id]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[thongtin_dondathang_by_id]
(
@madondathang nvarchar(300)
)
AS
BEGIN
	
	select * from db_DonDatHang where MaDonDatHang=@madondathang
END
GO
/****** Object:  StoredProcedure [dbo].[thongtin_dondathang_by_ma]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[thongtin_dondathang_by_ma]
(
@mathanhtoan nvarchar(300)
)
AS
BEGIN
	
	select * from db_DonDatHang where TinhTrangDonHang=@mathanhtoan
END
GO
/****** Object:  StoredProcedure [dbo].[thongtin_dondathang_by_makhachhang]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[thongtin_dondathang_by_makhachhang]
(
@makhachhang nvarchar(300)
)
AS
BEGIN
	
	select * from db_DonDatHang where MaKH=@makhachhang
END
GO
/****** Object:  StoredProcedure [dbo].[thongtin_dondathang_by_mathanhtoan]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[thongtin_dondathang_by_mathanhtoan]
(
@mathanhtoan nvarchar(300)
)
AS
BEGIN
	
	select * from db_DonDatHang where TinhTrangDonHang=@mathanhtoan
END
GO
/****** Object:  StoredProcedure [dbo].[thongtin_dondathang_desc]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[thongtin_dondathang_desc]
AS
BEGIN
	select * from db_DonDatHang order by MaDonDatHang desc
END

GO
/****** Object:  StoredProcedure [dbo].[thongtin_hoadon]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[thongtin_hoadon]
AS
BEGIN
	select * from db_HoaDon
END

GO
/****** Object:  StoredProcedure [dbo].[thongtin_hoadon_moinhat]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[thongtin_hoadon_moinhat]
AS
BEGIN
	select top 1 * from db_HoaDon order by MaHD desc
END
GO
/****** Object:  StoredProcedure [dbo].[thongtin_khachhang]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[thongtin_khachhang]
AS
BEGIN
	select * from db_KhachHang
END

GO
/****** Object:  StoredProcedure [dbo].[thongtin_khachhang_by_emailkh]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[thongtin_khachhang_by_emailkh]
@emailkh nvarchar(50)
AS
BEGIN
	select * from db_KhachHang where EmailKH=@emailkh
END

GO
/****** Object:  StoredProcedure [dbo].[thongtin_khachhang_by_emailkh_matkhau]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[thongtin_khachhang_by_emailkh_matkhau]
@emailkh nvarchar(50),
@matkhau nvarchar(50)
AS
BEGIN
	select * from db_KhachHang where EmailKH=@emailkh and MatKhau=@matkhau
END

GO
/****** Object:  StoredProcedure [dbo].[thongtin_madm_by_idtintuc]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[thongtin_madm_by_idtintuc]
@TinTucID INT
AS
BEGIN
	select MaDM from db_TinTuc where TinTucID=@TinTucID
END

GO
/****** Object:  StoredProcedure [dbo].[thongtin_mau]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[thongtin_mau]
AS
BEGIN
	select * from db_Mau
END

GO
/****** Object:  StoredProcedure [dbo].[thongtin_mau_by_id]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[thongtin_mau_by_id]
@MauID INT
AS
BEGIN
	select * from db_Mau where MauID=@MauID
END

GO
/****** Object:  StoredProcedure [dbo].[thongtin_mau_by_ten]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[thongtin_mau_by_ten]
@TenMau nvarchar(max)
AS
BEGIN
	select * from db_Mau where TenMau=@TenMau
END
GO
/****** Object:  StoredProcedure [dbo].[thongtin_menu]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[thongtin_menu]
AS
BEGIN
	select * from db_Menu
END

GO
/****** Object:  StoredProcedure [dbo].[thongtin_menu_by_id]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[thongtin_menu_by_id]
@MaMenu int
AS
BEGIN
	select * from db_Menu where MaMenu=@MaMenu
END

GO
/****** Object:  StoredProcedure [dbo].[thongtin_menu_by_mamenucha]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[thongtin_menu_by_mamenucha]
@MaMenuCha int
AS
BEGIN
	select * from db_Menu where MaMenuCha=@MaMenuCha
END

GO
/****** Object:  StoredProcedure [dbo].[thongtin_menu_by_mamenucon]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[thongtin_menu_by_mamenucon]
@MaMenuCon int
AS
BEGIN
	select MaMenuCha from db_Menu where MaMenu=@MaMenuCon
END
GO
/****** Object:  StoredProcedure [dbo].[thongtin_menu_by_ten]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[thongtin_menu_by_ten]
@ten nvarchar(50)
AS
BEGIN
	select * from db_Menu where TenMenu=@ten
END

GO
/****** Object:  StoredProcedure [dbo].[thongtin_nhanvien]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[thongtin_nhanvien]
AS
BEGIN
	select * from db_NhanVien
END

GO
/****** Object:  StoredProcedure [dbo].[thongtin_nhomquangcao]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[thongtin_nhomquangcao]
AS
BEGIN
	select * from db_NhomQuangCao
END

GO
/****** Object:  StoredProcedure [dbo].[thongtin_nhomquangcao_by_id]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[thongtin_nhomquangcao_by_id]
@NhomQuangCaoID int
AS
BEGIN
	select * from db_NhomQuangCao where NhomQuangCaoID=@NhomQuangCaoID
END

GO
/****** Object:  StoredProcedure [dbo].[thongtin_nhomquangcao_by_ten]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[thongtin_nhomquangcao_by_ten]
@ten nvarchar(50)
AS
BEGIN
	select * from db_NhomQuangCao where TenNhomQuangCao=@ten
END
GO
/****** Object:  StoredProcedure [dbo].[thongtin_nhomquangcao_by_vitriqc]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[thongtin_nhomquangcao_by_vitriqc]
@ViTriQC nvarchar(30)
AS
BEGIN
	select * from db_NhomQuangCao where ViTriQC=@ViTriQC
END

GO
/****** Object:  StoredProcedure [dbo].[thongtin_nhomsp]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[thongtin_nhomsp]
AS
BEGIN
	select * from db_NhomSanPham order by ThuTu
END

GO
/****** Object:  StoredProcedure [dbo].[thongtin_nhomsp_by_id]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[thongtin_nhomsp_by_id]
@NhomID int
AS
BEGIN
	select * from db_NhomSanPham where NhomID=@NhomID
END

GO
/****** Object:  StoredProcedure [dbo].[thongtin_nhomsp_by_ten]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[thongtin_nhomsp_by_ten]
@TenNhom nvarchar(max)
AS
BEGIN
	select * from db_NhomSanPham where TenNhom=@TenNhom
END

GO
/****** Object:  StoredProcedure [dbo].[thongtin_quangcao]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[thongtin_quangcao]
AS
BEGIN
	select * from db_QuangCao
END

GO
/****** Object:  StoredProcedure [dbo].[thongtin_quangcao_by_id]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[thongtin_quangcao_by_id]
@QuangCaoID int
AS
BEGIN
	select * from db_QuangCao where QuangCaoID=@QuangCaoID
END

GO
/****** Object:  StoredProcedure [dbo].[thongtin_quangcao_by_nhomquangcaoid]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[thongtin_quangcao_by_nhomquangcaoid]
@NhomQuangCaoID int
AS
BEGIN
	select * from db_QuangCao where NhomQuangCaoID=@NhomQuangCaoID
END

GO
/****** Object:  StoredProcedure [dbo].[thongtin_quangcao_by_nhomquangcaoid_and_id]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[thongtin_quangcao_by_nhomquangcaoid_and_id]
@NhomQuangCaoID int,
@QuangCaoID int
AS
BEGIN
	select * from db_QuangCao where NhomQuangCaoID=@NhomQuangCaoID and QuangCaoID=@QuangCaoID
END

GO
/****** Object:  StoredProcedure [dbo].[thongtin_quangcao_by_ten]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[thongtin_quangcao_by_ten]
@ten nvarchar(50)
AS
BEGIN
	select * from db_QuangCao where TenQC=@ten
END
GO
/****** Object:  StoredProcedure [dbo].[thongtin_quyendangnhap]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[thongtin_quyendangnhap]
AS
BEGIN
	select * from db_QuyenDangNhap
END

GO
/****** Object:  StoredProcedure [dbo].[thongtin_quyendangnhap_by_id]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[thongtin_quyendangnhap_by_id]
@MaQuyen int
AS
BEGIN
	select * from db_QuyenDangNhap where MaQuyen=@MaQuyen
END

GO
/****** Object:  StoredProcedure [dbo].[thongtin_quyendangnhap_by_ten]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[thongtin_quyendangnhap_by_ten]
@TenQuyen nvarchar(max)
AS
BEGIN
	select * from db_QuyenDangNhap where TenQuyen=@TenQuyen
END
GO
/****** Object:  StoredProcedure [dbo].[thongtin_sanpham]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[thongtin_sanpham]
AS
BEGIN
	select * from db_SanPham
END

GO
/****** Object:  StoredProcedure [dbo].[thongtin_sanpham_by_chatlieu]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[thongtin_sanpham_by_chatlieu]
@Ma INT
AS
BEGIN
	select * from db_SanPham where ChatLieuID=@Ma
END
GO
/****** Object:  StoredProcedure [dbo].[thongtin_sanpham_by_id]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[thongtin_sanpham_by_id]
@MaSP INT
AS
BEGIN
	select * from db_SanPham where MaSP=@MaSP
END

GO
/****** Object:  StoredProcedure [dbo].[thongtin_sanpham_by_madm]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[thongtin_sanpham_by_madm]
@MaMD INT
AS
BEGIN
	select top 3 * from db_SanPham where MaDM=@MaMD
END

GO
/****** Object:  StoredProcedure [dbo].[thongtin_sanpham_by_madm_tatca]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[thongtin_sanpham_by_madm_tatca]
@MaMD INT
AS
BEGIN
	select * from db_SanPham where MaDM=@MaMD
END

GO
/****** Object:  StoredProcedure [dbo].[thongtin_sanpham_by_mau]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[thongtin_sanpham_by_mau]
@Ma INT
AS
BEGIN
	select * from db_SanPham where MauID=@Ma
END
GO
/****** Object:  StoredProcedure [dbo].[thongtin_sanpham_by_nhomid]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[thongtin_sanpham_by_nhomid]
@NhomID INT,
@SoSPHienThi INT
AS
BEGIN
	declare @sql nvarchar(300)
	set @sql='select top '+ CAST(@SoSPHienThi as varchar(10)) +' * from db_SanPham where NhomID='+CAST(@NhomID as varchar(10))
	exec sp_executesql @sql
END

GO
/****** Object:  StoredProcedure [dbo].[thongtin_sanpham_by_nhomid_tatca]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[thongtin_sanpham_by_nhomid_tatca]
@NhomID INT
AS
BEGIN
	declare @sql nvarchar(300)
	set @sql='select * from db_SanPham where NhomID='+CAST(@NhomID as varchar(10))
	exec sp_executesql @sql
END
GO
/****** Object:  StoredProcedure [dbo].[thongtin_sanpham_by_size]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[thongtin_sanpham_by_size]
@Ma INT
AS
BEGIN
	select * from db_SanPham where SizeID=@Ma
END
GO
/****** Object:  StoredProcedure [dbo].[thongtin_sanpham_by_ten]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[thongtin_sanpham_by_ten]
@Ten nvarchar(max)
AS
BEGIN
	select * from db_SanPham where TenSP=@Ten
END
GO
/****** Object:  StoredProcedure [dbo].[thongtin_size]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[thongtin_size]
AS
BEGIN
	select * from db_Size
END

GO
/****** Object:  StoredProcedure [dbo].[thongtin_size_by_id]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[thongtin_size_by_id]
@SizeID INT
AS
BEGIN
	select * from db_Size where SizeID=@SizeID
END

GO
/****** Object:  StoredProcedure [dbo].[thongtin_size_by_ten]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[thongtin_size_by_ten]
@TenSize nvarchar(max)
AS
BEGIN
	select * from db_Size where TenSize=@TenSize
END
GO
/****** Object:  StoredProcedure [dbo].[thongtin_tintuc]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[thongtin_tintuc]
AS
BEGIN
	select * from db_TinTuc order by ThuTu
END

GO
/****** Object:  StoredProcedure [dbo].[thongtin_tintuc_by_id]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[thongtin_tintuc_by_id]
@TinTucID INT
AS
BEGIN
	select * from db_TinTuc where TinTucID=@TinTucID
END

GO
/****** Object:  StoredProcedure [dbo].[thongtin_tintuc_by_madm]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[thongtin_tintuc_by_madm]
@MaMD INT
AS
BEGIN
	select top 6 * from db_TinTuc where MaDM=@MaMD order by TinTucID desc
END
GO
/****** Object:  StoredProcedure [dbo].[thongtin_tintuc_by_madm_moinhat]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[thongtin_tintuc_by_madm_moinhat]
@MaMD INT
AS
BEGIN
	select top 1 * from db_TinTuc where MaDM=@MaMD order by TinTucID desc
END
GO
/****** Object:  StoredProcedure [dbo].[thongtin_tintuc_by_madm_tatca]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[thongtin_tintuc_by_madm_tatca]
@MaMD INT
AS
BEGIN
	select * from db_TinTuc where MaDM=@MaMD
END

GO
/****** Object:  StoredProcedure [dbo].[thongtin_tintuc_by_ten]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[thongtin_tintuc_by_ten]
@TieuDe nvarchar(max)
AS
BEGIN
	select * from db_TinTuc where TieuDe=@TieuDe
END
GO
/****** Object:  StoredProcedure [dbo].[thongtin_tintuc_byLuotXem]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[thongtin_tintuc_byLuotXem]
AS
BEGIN
	select top 9 * from db_TinTuc order by LuotXem desc
END
GO
/****** Object:  StoredProcedure [dbo].[thongtin_tintuc_byMoiNhat]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[thongtin_tintuc_byMoiNhat]
AS
BEGIN
	select top 5 * from db_TinTuc order by TinTucID desc
END
GO
/****** Object:  StoredProcedure [dbo].[tintuc_delete]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[tintuc_delete]
@TinTucID int
AS
BEGIN
	delete from db_TinTuc where TinTucID=@TinTucID
END

GO
/****** Object:  StoredProcedure [dbo].[tintuc_inser]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tintuc_inser]
@TieuDe nvarchar(200),
@AnhDaiDien  nvarchar(200),
@MoTa nvarchar(200),
@NgayDang datetime,
@LuotXem int,
@ChiTiet nvarchar(MAX),
@ThuTu int,
@MaDM int
AS
BEGIN
	begin
	insert into db_TinTuc(TieuDe,AnhDaiDien,MoTa,NgayDang,LuotXem,ChiTiet,ThuTu,MaDM) values(@TieuDe,@AnhDaiDien,@MoTa,@NgayDang,@LuotXem,@ChiTiet,@ThuTu,@MaDM)
	end
END

GO
/****** Object:  StoredProcedure [dbo].[tintuc_update]    Script Date: 6/13/2017 6:55:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tintuc_update]
@TinTucID INT,
@TieuDe nvarchar(200),
@AnhDaiDien nvarchar(200),
@MoTa nvarchar(200),
@NgayDang date,
@LuotXem int,
@ChiTiet nvarchar(MAX),
@ThuTu int,
@MaDM int

AS
BEGIN
	update db_TinTuc set TieuDe=@TieuDe,AnhDaiDien=@AnhDaiDien,MoTa=@MoTa,NgayDang=@NgayDang,LuotXem=@LuotXem,ChiTiet=@ChiTiet,ThuTu=@ThuTu,MaDM=@MaDM where TinTucID=@TinTucID
END

GO
USE [master]
GO
ALTER DATABASE [emdepvn] SET  READ_WRITE 
GO
