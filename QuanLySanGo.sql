USE [QuanLySanGo]
GO
/****** Object:  Table [dbo].[ChiTietHoaDon]    Script Date: 12/11/2024 5:43:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDon](
	[MaCTHD] [int] IDENTITY(1,1) NOT NULL,
	[MaHD] [int] NOT NULL,
	[MaSanGo] [int] NOT NULL,
	[SoLuongMua] [int] NOT NULL,
	[GiaMua] [money] NULL,
 CONSTRAINT [PK_ChiTietHoaDon] PRIMARY KEY CLUSTERED 
(
	[MaCTHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChucVu]    Script Date: 12/11/2024 5:43:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChucVu](
	[MaCV] [int] IDENTITY(1,1) NOT NULL,
	[TenCV] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ChucVu] PRIMARY KEY CLUSTERED 
(
	[MaCV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 12/11/2024 5:43:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHD] [int] IDENTITY(1,1) NOT NULL,
	[NgayTao] [datetime] NOT NULL,
	[TrangThai] [nvarchar](30) NOT NULL,
	[TenKH] [nvarchar](50) NOT NULL,
	[SDT] [varchar](10) NOT NULL,
	[DiaChi] [nvarchar](100) NOT NULL,
	[TongTienPhaiTra] [money] NULL,
	[HinhThucThanhToan] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiSanGo]    Script Date: 12/11/2024 5:43:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiSanGo](
	[MaLoaiSanGo] [int] IDENTITY(1,1) NOT NULL,
	[TenLoaiSanGo] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_LoaiSanGo] PRIMARY KEY CLUSTERED 
(
	[MaLoaiSanGo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 12/11/2024 5:43:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNV] [int] IDENTITY(1,1) NOT NULL,
	[TenNV] [nvarchar](50) NOT NULL,
	[NgaySinh] [date] NOT NULL,
	[GioiTinh] [nvarchar](3) NOT NULL,
	[MaCV] [int] NOT NULL,
	[MatKhau] [varchar](15) NOT NULL,
	[SDT] [varchar](10) NOT NULL,
	[SoCCCD] [varchar](12) NOT NULL,
	[Email] [varchar](50) NOT NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanGo]    Script Date: 12/11/2024 5:43:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanGo](
	[MaSanGo] [int] IDENTITY(1,1) NOT NULL,
	[TenSanGo] [nvarchar](50) NOT NULL,
	[SoLuong] [int] NOT NULL,
	[GiaBan] [money] NULL,
	[MaLoaiSanGo] [int] NOT NULL,
	[MoTa] [nvarchar](max) NULL,
	[HinhAnh] [varchar](100) NULL,
 CONSTRAINT [PK_SanGo] PRIMARY KEY CLUSTERED 
(
	[MaSanGo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ChiTietHoaDon] ON 

INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSanGo], [SoLuongMua], [GiaMua]) VALUES (1, 1, 1, 1, 3243.0000)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSanGo], [SoLuongMua], [GiaMua]) VALUES (3, 1, 2, 2, 2.0000)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSanGo], [SoLuongMua], [GiaMua]) VALUES (7, 7, 19, 1, 1.0000)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSanGo], [SoLuongMua], [GiaMua]) VALUES (8, 8, 19, 1, 1.0000)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSanGo], [SoLuongMua], [GiaMua]) VALUES (9, 15, 19, 1, 1.0000)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSanGo], [SoLuongMua], [GiaMua]) VALUES (10, 1, 1, 2, 1.0000)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSanGo], [SoLuongMua], [GiaMua]) VALUES (11, 1, 1, 1, 1.0000)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSanGo], [SoLuongMua], [GiaMua]) VALUES (12, 1, 1, 1, 1.0000)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSanGo], [SoLuongMua], [GiaMua]) VALUES (13, 20, 1, 2, 1.0000)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSanGo], [SoLuongMua], [GiaMua]) VALUES (16, 25, 19, 2, 1.0000)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSanGo], [SoLuongMua], [GiaMua]) VALUES (18, 27, 19, 1, 1.0000)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSanGo], [SoLuongMua], [GiaMua]) VALUES (21, 30, 17, 2, 8800000.0000)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSanGo], [SoLuongMua], [GiaMua]) VALUES (22, 31, 19, 1, 1.0000)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSanGo], [SoLuongMua], [GiaMua]) VALUES (23, 33, 17, 1, 8800000.0000)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSanGo], [SoLuongMua], [GiaMua]) VALUES (24, 33, 17, 1, 8800000.0000)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSanGo], [SoLuongMua], [GiaMua]) VALUES (25, 34, 7, 1, 9500000.0000)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSanGo], [SoLuongMua], [GiaMua]) VALUES (26, 34, 7, 1, 9500000.0000)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSanGo], [SoLuongMua], [GiaMua]) VALUES (27, 35, 13, 1, 9800000.0000)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSanGo], [SoLuongMua], [GiaMua]) VALUES (28, 36, 17, 1, 8800000.0000)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSanGo], [SoLuongMua], [GiaMua]) VALUES (29, 36, 17, 1, 8800000.0000)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSanGo], [SoLuongMua], [GiaMua]) VALUES (30, 37, 15, 1, 6800000.0000)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSanGo], [SoLuongMua], [GiaMua]) VALUES (31, 37, 15, 1, 6800000.0000)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSanGo], [SoLuongMua], [GiaMua]) VALUES (32, 38, 11, 1, 8500000.0000)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSanGo], [SoLuongMua], [GiaMua]) VALUES (33, 38, 11, 1, 8500000.0000)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSanGo], [SoLuongMua], [GiaMua]) VALUES (34, 39, 11, 1, 8500000.0000)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSanGo], [SoLuongMua], [GiaMua]) VALUES (35, 39, 11, 1, 8500000.0000)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSanGo], [SoLuongMua], [GiaMua]) VALUES (36, 40, 11, 1, 8500000.0000)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSanGo], [SoLuongMua], [GiaMua]) VALUES (37, 40, 11, 1, 8500000.0000)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSanGo], [SoLuongMua], [GiaMua]) VALUES (38, 41, 11, 1, 8500000.0000)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSanGo], [SoLuongMua], [GiaMua]) VALUES (39, 41, 11, 1, 8500000.0000)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSanGo], [SoLuongMua], [GiaMua]) VALUES (40, 42, 13, 1, 9800000.0000)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSanGo], [SoLuongMua], [GiaMua]) VALUES (41, 43, 17, 1, 8800000.0000)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSanGo], [SoLuongMua], [GiaMua]) VALUES (42, 44, 14, 1, 5800000.0000)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSanGo], [SoLuongMua], [GiaMua]) VALUES (45, 47, 15, 1, 6800000.0000)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSanGo], [SoLuongMua], [GiaMua]) VALUES (46, 48, 15, 1, 6800000.0000)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSanGo], [SoLuongMua], [GiaMua]) VALUES (47, 49, 16, 1, 7800000.0000)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSanGo], [SoLuongMua], [GiaMua]) VALUES (48, 50, 11, 1, 8500000.0000)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSanGo], [SoLuongMua], [GiaMua]) VALUES (49, 51, 16, 1, 7800000.0000)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSanGo], [SoLuongMua], [GiaMua]) VALUES (50, 52, 16, 1, 7800000.0000)
SET IDENTITY_INSERT [dbo].[ChiTietHoaDon] OFF
GO
SET IDENTITY_INSERT [dbo].[ChucVu] ON 

INSERT [dbo].[ChucVu] ([MaCV], [TenCV]) VALUES (6, N'5')
INSERT [dbo].[ChucVu] ([MaCV], [TenCV]) VALUES (1, N'Admin')
INSERT [dbo].[ChucVu] ([MaCV], [TenCV]) VALUES (2, N'Nhân viên thường')
SET IDENTITY_INSERT [dbo].[ChucVu] OFF
GO
SET IDENTITY_INSERT [dbo].[HoaDon] ON 

INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TrangThai], [TenKH], [SDT], [DiaChi], [TongTienPhaiTra], [HinhThucThanhToan]) VALUES (1, CAST(N'2024-12-03T10:47:54.000' AS DateTime), N'Đang chuẩn bị', N'Nguyễn Thị A', N'1234567898', N'200 Lũy Bán Bích, phường Tân Thới Hòa, Quận Tân Phú, TPHCM', 3251.0000, N'Thanh toán trực tiếp')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TrangThai], [TenKH], [SDT], [DiaChi], [TongTienPhaiTra], [HinhThucThanhToan]) VALUES (2, CAST(N'2024-12-08T00:08:13.240' AS DateTime), N'Đang xử lý', N'1', N'1234567893', N'121321ew', NULL, N'Tiền mặt')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TrangThai], [TenKH], [SDT], [DiaChi], [TongTienPhaiTra], [HinhThucThanhToan]) VALUES (3, CAST(N'2024-12-08T00:09:29.263' AS DateTime), N'Đang xử lý', N'3213', N'1234567888', N'2132343rw', NULL, N'Tiền mặt')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TrangThai], [TenKH], [SDT], [DiaChi], [TongTienPhaiTra], [HinhThucThanhToan]) VALUES (4, CAST(N'2024-12-08T00:11:41.330' AS DateTime), N'Đang xử lý', N'2424', N'1234567878', N'gfhgfh', NULL, N'Tiền mặt')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TrangThai], [TenKH], [SDT], [DiaChi], [TongTienPhaiTra], [HinhThucThanhToan]) VALUES (7, CAST(N'2024-12-08T00:26:26.413' AS DateTime), N'Đang xử lý', N'1', N'1234566541', N'dskfjkeer', NULL, N'Tiền mặt')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TrangThai], [TenKH], [SDT], [DiaChi], [TongTienPhaiTra], [HinhThucThanhToan]) VALUES (8, CAST(N'2024-12-08T00:29:06.600' AS DateTime), N'Đang xử lý', N'1', N'1234566543', N'12132', 1.0000, N'Tiền mặt')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TrangThai], [TenKH], [SDT], [DiaChi], [TongTienPhaiTra], [HinhThucThanhToan]) VALUES (15, CAST(N'2024-12-08T01:15:12.047' AS DateTime), N'Đang xử lý', N'1', N'3456789012', N'1', 1.0000, N'Tiền mặt')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TrangThai], [TenKH], [SDT], [DiaChi], [TongTienPhaiTra], [HinhThucThanhToan]) VALUES (16, CAST(N'2024-12-08T03:05:07.590' AS DateTime), N'Đang chuẩn bị', N'2', N'2', N'2', 2.0000, N'2')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TrangThai], [TenKH], [SDT], [DiaChi], [TongTienPhaiTra], [HinhThucThanhToan]) VALUES (19, CAST(N'2024-12-08T13:41:55.853' AS DateTime), N'Đang chuẩn bị', N'1', N'1', N'1', 1.0000, N'1')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TrangThai], [TenKH], [SDT], [DiaChi], [TongTienPhaiTra], [HinhThucThanhToan]) VALUES (20, CAST(N'2024-12-08T13:44:26.103' AS DateTime), N'Đang chuẩn bị', N'1', N'1', N'1', 2.0000, N'1')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TrangThai], [TenKH], [SDT], [DiaChi], [TongTienPhaiTra], [HinhThucThanhToan]) VALUES (22, CAST(N'2024-12-08T13:48:27.570' AS DateTime), N'Đang xử lý', N'1', N'1234567894', N'1', NULL, N'Tiền mặt')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TrangThai], [TenKH], [SDT], [DiaChi], [TongTienPhaiTra], [HinhThucThanhToan]) VALUES (24, CAST(N'2024-12-08T13:54:24.580' AS DateTime), N'Đang xử lý', N'1', N'234', N'1', NULL, N'Tiền mặt')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TrangThai], [TenKH], [SDT], [DiaChi], [TongTienPhaiTra], [HinhThucThanhToan]) VALUES (25, CAST(N'2024-12-08T13:58:18.360' AS DateTime), N'Đang xử lý', N'1', N'3435', N'1', 2.0000, N'Tiền mặt')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TrangThai], [TenKH], [SDT], [DiaChi], [TongTienPhaiTra], [HinhThucThanhToan]) VALUES (26, CAST(N'2024-12-08T14:02:47.727' AS DateTime), N'Đang xử lý', N'1', N'46546547', N'1', NULL, N'Tiền mặt')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TrangThai], [TenKH], [SDT], [DiaChi], [TongTienPhaiTra], [HinhThucThanhToan]) VALUES (27, CAST(N'2024-12-08T14:08:31.987' AS DateTime), N'Đang xử lý', N'1', N'5656756', N'1', 1.0000, N'Tiền mặt')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TrangThai], [TenKH], [SDT], [DiaChi], [TongTienPhaiTra], [HinhThucThanhToan]) VALUES (28, CAST(N'2024-12-08T14:10:04.930' AS DateTime), N'Đang xử lý', N'1', N'4354654', N'1', NULL, N'Tiền mặt')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TrangThai], [TenKH], [SDT], [DiaChi], [TongTienPhaiTra], [HinhThucThanhToan]) VALUES (29, CAST(N'2024-12-08T14:13:03.610' AS DateTime), N'Đang xử lý', N'13', N'3254435435', N'1', NULL, N'Tiền mặt')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TrangThai], [TenKH], [SDT], [DiaChi], [TongTienPhaiTra], [HinhThucThanhToan]) VALUES (30, CAST(N'2024-12-08T14:35:37.723' AS DateTime), N'Đang xử lý', N'1', N'4235435', N'1', 17600000.0000, N'Tiền mặt')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TrangThai], [TenKH], [SDT], [DiaChi], [TongTienPhaiTra], [HinhThucThanhToan]) VALUES (31, CAST(N'2024-12-08T14:39:00.703' AS DateTime), N'Đang xử lý', N'1', N'35436547', N'1', 1.0000, N'Tiền mặt')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TrangThai], [TenKH], [SDT], [DiaChi], [TongTienPhaiTra], [HinhThucThanhToan]) VALUES (32, CAST(N'2024-12-08T15:22:28.433' AS DateTime), N'Đang xử lý', N'Hoàng Hải', N'0793892213', N'Tân Phú, HCM', NULL, N'Tiền mặt')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TrangThai], [TenKH], [SDT], [DiaChi], [TongTienPhaiTra], [HinhThucThanhToan]) VALUES (33, CAST(N'2024-12-09T19:13:24.947' AS DateTime), N'Đang xử lý', N'Hoàng Hải 113', N'0793892213', N'Tân Phú, HCM', 17600000.0000, N'Tiền mặt')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TrangThai], [TenKH], [SDT], [DiaChi], [TongTienPhaiTra], [HinhThucThanhToan]) VALUES (34, CAST(N'2024-12-09T19:18:48.560' AS DateTime), N'Đang xử lý', N'Hoàng Hải', N'0793892213', N'Tân Phú, HCM', 19000000.0000, N'Tiền mặt')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TrangThai], [TenKH], [SDT], [DiaChi], [TongTienPhaiTra], [HinhThucThanhToan]) VALUES (35, CAST(N'2024-12-09T19:22:28.157' AS DateTime), N'Đang xử lý', N'Hoàng sHải', N'0793892213', N'Tân Phú, HCM', 9800000.0000, N'Tiền mặt')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TrangThai], [TenKH], [SDT], [DiaChi], [TongTienPhaiTra], [HinhThucThanhToan]) VALUES (36, CAST(N'2024-12-09T19:53:58.437' AS DateTime), N'Đang xử lý', N'Hoàng Hải', N'0793892213', N'Tân Phú, HCM', 17600000.0000, N'Tiền mặt')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TrangThai], [TenKH], [SDT], [DiaChi], [TongTienPhaiTra], [HinhThucThanhToan]) VALUES (37, CAST(N'2024-12-09T19:57:40.410' AS DateTime), N'Đang xử lý', N'Hoàng sHải', N'0793892213', N'Tân Phú, HCM', 13600000.0000, N'Tiền mặt')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TrangThai], [TenKH], [SDT], [DiaChi], [TongTienPhaiTra], [HinhThucThanhToan]) VALUES (38, CAST(N'2024-12-09T19:58:11.740' AS DateTime), N'Đang xử lý', N'Hoàng Hải', N'0793892213', N'Tân Phú, HCM', 17000000.0000, N'Tiền mặt')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TrangThai], [TenKH], [SDT], [DiaChi], [TongTienPhaiTra], [HinhThucThanhToan]) VALUES (39, CAST(N'2024-12-09T19:59:34.443' AS DateTime), N'Đang xử lý', N'Hoàng Hải', N'0793892213', N'Tân Phú, HCM', 17000000.0000, N'Tiền mặt')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TrangThai], [TenKH], [SDT], [DiaChi], [TongTienPhaiTra], [HinhThucThanhToan]) VALUES (40, CAST(N'2024-12-09T19:59:44.540' AS DateTime), N'Đang xử lý', N'Hoàng Hải', N'0793892213', N'Tân Phú, HCM', 17000000.0000, N'Tiền mặt')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TrangThai], [TenKH], [SDT], [DiaChi], [TongTienPhaiTra], [HinhThucThanhToan]) VALUES (41, CAST(N'2024-12-09T20:02:54.630' AS DateTime), N'Đang xử lý', N'Hoàng Hải', N'0793892213', N'Tân Phú, HCM', 17000000.0000, N'Tiền mặt')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TrangThai], [TenKH], [SDT], [DiaChi], [TongTienPhaiTra], [HinhThucThanhToan]) VALUES (42, CAST(N'2024-12-09T20:48:50.537' AS DateTime), N'Đang xử lý', N'Hoàng Hải', N'0793892213', N'Tân Phú, HCM', 9800000.0000, N'Tiền mặt')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TrangThai], [TenKH], [SDT], [DiaChi], [TongTienPhaiTra], [HinhThucThanhToan]) VALUES (43, CAST(N'2024-12-09T20:49:20.873' AS DateTime), N'Đang xử lý', N'Hoàng Hảiw3', N'0793892213', N'Tân Phú, HCM', 8800000.0000, N'Tiền mặt')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TrangThai], [TenKH], [SDT], [DiaChi], [TongTienPhaiTra], [HinhThucThanhToan]) VALUES (44, CAST(N'2024-12-09T20:55:19.730' AS DateTime), N'Đang xử lý', N'Hoàng Hải', N'0793892213', N'Tân Phú, HCM', 5800000.0000, N'Tiền mặt')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TrangThai], [TenKH], [SDT], [DiaChi], [TongTienPhaiTra], [HinhThucThanhToan]) VALUES (47, CAST(N'2024-12-09T20:58:31.827' AS DateTime), N'Đang xử lý', N'Hoàng Hải3232', N'0793892213', N'Tân Phú, HCM', 6800000.0000, N'Tiền mặt')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TrangThai], [TenKH], [SDT], [DiaChi], [TongTienPhaiTra], [HinhThucThanhToan]) VALUES (48, CAST(N'2024-12-09T21:08:54.250' AS DateTime), N'Đang xử lý', N'123123', N'0793892213', N'Tân Phú, HCM', 6800000.0000, N'Tiền mặt')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TrangThai], [TenKH], [SDT], [DiaChi], [TongTienPhaiTra], [HinhThucThanhToan]) VALUES (49, CAST(N'2024-12-09T21:11:52.837' AS DateTime), N'Đang xử lý', N'Hoàng sHải', N'0793892212', N'Tân Phú, HCM', 7800000.0000, N'Tiền mặt')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TrangThai], [TenKH], [SDT], [DiaChi], [TongTienPhaiTra], [HinhThucThanhToan]) VALUES (50, CAST(N'2024-12-09T21:24:44.830' AS DateTime), N'Đang xử lý', N'Hoàng Hải', N'0793892213', N'Tân Phú, HCM', 8500000.0000, N'Tiền mặt')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TrangThai], [TenKH], [SDT], [DiaChi], [TongTienPhaiTra], [HinhThucThanhToan]) VALUES (51, CAST(N'2024-12-09T21:30:40.287' AS DateTime), N'Đang xử lý', N'1123', N'0793892213', N'Tân Phú, HCM', 7800000.0000, N'Chuyển khoản')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TrangThai], [TenKH], [SDT], [DiaChi], [TongTienPhaiTra], [HinhThucThanhToan]) VALUES (52, CAST(N'2024-12-09T21:33:17.867' AS DateTime), N'Đang xử lý', N'Hoàng Hải', N'0793892213', N'Tân Phú, HCM', 7800000.0000, N'Tiền mặt')
SET IDENTITY_INSERT [dbo].[HoaDon] OFF
GO
SET IDENTITY_INSERT [dbo].[LoaiSanGo] ON 

INSERT [dbo].[LoaiSanGo] ([MaLoaiSanGo], [TenLoaiSanGo]) VALUES (8, N'1')
INSERT [dbo].[LoaiSanGo] ([MaLoaiSanGo], [TenLoaiSanGo]) VALUES (7, N'13')
INSERT [dbo].[LoaiSanGo] ([MaLoaiSanGo], [TenLoaiSanGo]) VALUES (2, N'Sàn gỗ Gõ Đỏ Nam Phi')
INSERT [dbo].[LoaiSanGo] ([MaLoaiSanGo], [TenLoaiSanGo]) VALUES (1, N'Sàn gỗ Óc Chó')
INSERT [dbo].[LoaiSanGo] ([MaLoaiSanGo], [TenLoaiSanGo]) VALUES (3, N'Sàn gỗ Sồi Mỹ')
SET IDENTITY_INSERT [dbo].[LoaiSanGo] OFF
GO
SET IDENTITY_INSERT [dbo].[NhanVien] ON 

INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [NgaySinh], [GioiTinh], [MaCV], [MatKhau], [SDT], [SoCCCD], [Email]) VALUES (1, N'Lê Mẫn', CAST(N'2004-07-27' AS Date), N'Nam', 2, N'123', N'0123456789', N'987654321098', N'leman2004277@gmail.com')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [NgaySinh], [GioiTinh], [MaCV], [MatKhau], [SDT], [SoCCCD], [Email]) VALUES (3, N'Hoàng Hải', CAST(N'2005-05-25' AS Date), N'Nam', 1, N'123', N'1112223334', N'111222333444', N'leman2772020@gmail.com')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [NgaySinh], [GioiTinh], [MaCV], [MatKhau], [SDT], [SoCCCD], [Email]) VALUES (4, N'Vương Phạm Hào Kiệt', CAST(N'2006-06-26' AS Date), N'Nam', 2, N'123', N'2323435435', N'346454535435', N'abcxyz@gmail.com')
SET IDENTITY_INSERT [dbo].[NhanVien] OFF
GO
SET IDENTITY_INSERT [dbo].[SanGo] ON 

INSERT [dbo].[SanGo] ([MaSanGo], [TenSanGo], [SoLuong], [GiaBan], [MaLoaiSanGo], [MoTa], [HinhAnh]) VALUES (1, N'Sàn gỗ Gõ Đỏ Nam Phi 15x120x900mm', 3, 9000000.0000, 2, N'Sàn gỗ Gõ Đỏ cao cấp, kích thước 15x120x900mm, mang đến vẻ đẹp sang trọng và độ bền cao.', N'/Content/HinhAnh/SanGoGoDoNamPhi/15x120x900mm.jpg')
INSERT [dbo].[SanGo] ([MaSanGo], [TenSanGo], [SoLuong], [GiaBan], [MaLoaiSanGo], [MoTa], [HinhAnh]) VALUES (2, N'Sàn gỗ Gõ Đỏ Nam Phi 15x90x450mm', 8, 5000000.0000, 2, N'Sàn gỗ Gõ Đỏ với kích thước nhỏ gọn 15x90x450mm, thích hợp cho các không gian hạn chế.', N'/Content/HinhAnh/SanGoGoDoNamPhi/15x90x450mm.jpg')
INSERT [dbo].[SanGo] ([MaSanGo], [TenSanGo], [SoLuong], [GiaBan], [MaLoaiSanGo], [MoTa], [HinhAnh]) VALUES (3, N'Sàn gỗ Gõ Đỏ Nam Phi 15x90x600mm', 10, 6000000.0000, 2, N'Sàn gỗ Gõ Đỏ kích thước 15x90x600mm, phù hợp cho nhiều loại công trình.', N'/Content/HinhAnh/SanGoGoDoNamPhi/15x90x600mm.jpg')
INSERT [dbo].[SanGo] ([MaSanGo], [TenSanGo], [SoLuong], [GiaBan], [MaLoaiSanGo], [MoTa], [HinhAnh]) VALUES (4, N'Sàn gỗ Gõ Đỏ Nam Phi 15x90x750mm', 10, 7000000.0000, 2, N'Sàn gỗ Gõ Đỏ với độ dài 750mm, mang đến không gian tinh tế và sang trọng.', N'/Content/HinhAnh/SanGoGoDoNamPhi/15x90x750mm.jpg')
INSERT [dbo].[SanGo] ([MaSanGo], [TenSanGo], [SoLuong], [GiaBan], [MaLoaiSanGo], [MoTa], [HinhAnh]) VALUES (5, N'Sàn gỗ Gõ Đỏ Nam Phi 15x90x900mm', 30, 8000000.0000, 2, N'Sàn gỗ Gõ Đỏ kích thước lớn 15x90x900mm, mang lại không gian rộng rãi, hiện đại.', N'/Content/HinhAnh/SanGoGoDoNamPhi/15x90x900mm.jpg')
INSERT [dbo].[SanGo] ([MaSanGo], [TenSanGo], [SoLuong], [GiaBan], [MaLoaiSanGo], [MoTa], [HinhAnh]) VALUES (6, N'Sàn gỗ Gõ Đỏ Nam Phi xương cá', 10, NULL, 2, N'Sàn gỗ Gõ Đỏ kiểu dáng xương cá, tăng thêm sự tinh tế và độc đáo cho không gian.', N'/Content/HinhAnh/SanGoGoDoNamPhi/15x90x450-900mm.jpg')
INSERT [dbo].[SanGo] ([MaSanGo], [TenSanGo], [SoLuong], [GiaBan], [MaLoaiSanGo], [MoTa], [HinhAnh]) VALUES (7, N'Sàn gỗ Óc Chó 15x120x900mm', 8, 9500000.0000, 1, N'Sàn gỗ Óc Chó cao cấp, kích thước 15x120x900mm, màu sắc tự nhiên, đẹp mắt.', N'/Content/HinhAnh/SanGoOcCho/15x120x900mm.jpg')
INSERT [dbo].[SanGo] ([MaSanGo], [TenSanGo], [SoLuong], [GiaBan], [MaLoaiSanGo], [MoTa], [HinhAnh]) VALUES (8, N'Sàn gỗ Óc Chó 15x90x450mm', 10, 5500000.0000, 1, N'Sàn gỗ Óc Chó kích thước 15x90x450mm, thích hợp cho các dự án có diện tích nhỏ.', N'/Content/HinhAnh/SanGoOcCho/15x90x450mm.jpg')
INSERT [dbo].[SanGo] ([MaSanGo], [TenSanGo], [SoLuong], [GiaBan], [MaLoaiSanGo], [MoTa], [HinhAnh]) VALUES (9, N'Sàn gỗ Óc Chó 15x90x600mm', 10, 6500000.0000, 1, N'Sàn gỗ Óc Chó với kích thước 15x90x600mm, bền bỉ và đẹp mắt cho không gian sống.', N'/Content/HinhAnh/SanGoOcCho/15x90x600mm.jpg')
INSERT [dbo].[SanGo] ([MaSanGo], [TenSanGo], [SoLuong], [GiaBan], [MaLoaiSanGo], [MoTa], [HinhAnh]) VALUES (10, N'Sàn gỗ Óc Chó 15x90x750mm', 10, 7500000.0000, 1, N'Sàn gỗ Óc Chó kích thước 15x90x750mm, mang lại vẻ đẹp tự nhiên và sang trọng.', N'/Content/HinhAnh/SanGoOcCho/15x90x750mm.jpg')
INSERT [dbo].[SanGo] ([MaSanGo], [TenSanGo], [SoLuong], [GiaBan], [MaLoaiSanGo], [MoTa], [HinhAnh]) VALUES (11, N'Sàn gỗ Óc Chó 15x90x900mm', 1, 8500000.0000, 1, N'Sàn gỗ Óc Chó dài 900mm, thích hợp cho các không gian rộng lớn, tạo sự sang trọng.', N'/Content/HinhAnh/SanGoOcCho/15x90x900mm.jpg')
INSERT [dbo].[SanGo] ([MaSanGo], [TenSanGo], [SoLuong], [GiaBan], [MaLoaiSanGo], [MoTa], [HinhAnh]) VALUES (12, N'Sàn gỗ Óc Chó xương cá', 10, NULL, 1, N'Sàn gỗ Óc Chó kiểu xương cá, đẹp mắt và đầy tính nghệ thuật.', N'/Content/HinhAnh/SanGoOcCho/15x90x450-900mm.jpg')
INSERT [dbo].[SanGo] ([MaSanGo], [TenSanGo], [SoLuong], [GiaBan], [MaLoaiSanGo], [MoTa], [HinhAnh]) VALUES (13, N'Sàn gỗ Sồi Mỹ 15x120x900mm', 8, 9800000.0000, 3, N'Sàn gỗ Sồi Mỹ, kích thước 15x120x900mm, bền đẹp, mang đến vẻ đẹp mộc mạc.', N'/Content/HinhAnh/SanGoSoiMy/15x120x900mm.jpg')
INSERT [dbo].[SanGo] ([MaSanGo], [TenSanGo], [SoLuong], [GiaBan], [MaLoaiSanGo], [MoTa], [HinhAnh]) VALUES (14, N'Sàn gỗ Sồi Mỹ 15x90x450mm', 9, 5800000.0000, 3, N'Sàn gỗ Sồi Mỹ nhỏ gọn 15x90x450mm, dễ dàng thi công cho không gian nhỏ.', N'/Content/HinhAnh/SanGoSoiMy/15x90x450mm.jpg')
INSERT [dbo].[SanGo] ([MaSanGo], [TenSanGo], [SoLuong], [GiaBan], [MaLoaiSanGo], [MoTa], [HinhAnh]) VALUES (15, N'Sàn gỗ Sồi Mỹ 15x90x600mm', 6, 6800000.0000, 3, N'Sàn gỗ Sồi Mỹ kích thước 15x90x600mm, chắc chắn và thanh lịch.', N'/Content/HinhAnh/SanGoSoiMy/15x90x600mm.jpg')
INSERT [dbo].[SanGo] ([MaSanGo], [TenSanGo], [SoLuong], [GiaBan], [MaLoaiSanGo], [MoTa], [HinhAnh]) VALUES (16, N'Sàn gỗ Sồi Mỹ 15x90x750mm', 7, 7800000.0000, 3, NULL, N'/Content/HinhAnh/SanGoSoiMy/15x90x750mm.jpg')
INSERT [dbo].[SanGo] ([MaSanGo], [TenSanGo], [SoLuong], [GiaBan], [MaLoaiSanGo], [MoTa], [HinhAnh]) VALUES (17, N'Sàn gỗ Sồi Mỹ 15x90x900mm', 3, 8800000.0000, 3, NULL, N'/Content/HinhAnh/SanGoSoiMy/15x90x900mm.jpg')
INSERT [dbo].[SanGo] ([MaSanGo], [TenSanGo], [SoLuong], [GiaBan], [MaLoaiSanGo], [MoTa], [HinhAnh]) VALUES (18, N'Sàn gỗ Sồi Mỹ xương cá', 10, NULL, 3, NULL, N'/Content/HinhAnh/SanGoSoiMy/15x90x450-900mm.jpg')
INSERT [dbo].[SanGo] ([MaSanGo], [TenSanGo], [SoLuong], [GiaBan], [MaLoaiSanGo], [MoTa], [HinhAnh]) VALUES (19, N'2', 0, 1.0000, 8, N'1', N'/Content/HinhAnh/SanGoSoiMy/15x90x750mm.jpg')
SET IDENTITY_INSERT [dbo].[SanGo] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_ChucVu]    Script Date: 12/11/2024 5:43:20 PM ******/
ALTER TABLE [dbo].[ChucVu] ADD  CONSTRAINT [UQ_ChucVu] UNIQUE NONCLUSTERED 
(
	[TenCV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_LoaiSanGo]    Script Date: 12/11/2024 5:43:20 PM ******/
ALTER TABLE [dbo].[LoaiSanGo] ADD  CONSTRAINT [UQ_LoaiSanGo] UNIQUE NONCLUSTERED 
(
	[TenLoaiSanGo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_NhanVien_Email]    Script Date: 12/11/2024 5:43:20 PM ******/
ALTER TABLE [dbo].[NhanVien] ADD  CONSTRAINT [UQ_NhanVien_Email] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_NhanVien_SDT]    Script Date: 12/11/2024 5:43:20 PM ******/
ALTER TABLE [dbo].[NhanVien] ADD  CONSTRAINT [UQ_NhanVien_SDT] UNIQUE NONCLUSTERED 
(
	[SDT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_NhanVien_SoCCCD]    Script Date: 12/11/2024 5:43:20 PM ******/
ALTER TABLE [dbo].[NhanVien] ADD  CONSTRAINT [UQ_NhanVien_SoCCCD] UNIQUE NONCLUSTERED 
(
	[SoCCCD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_SanGo]    Script Date: 12/11/2024 5:43:20 PM ******/
ALTER TABLE [dbo].[SanGo] ADD  CONSTRAINT [UQ_SanGo] UNIQUE NONCLUSTERED 
(
	[TenSanGo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[HoaDon] ADD  CONSTRAINT [DF_HoaDon_NgayTao]  DEFAULT (getdate()) FOR [NgayTao]
GO
ALTER TABLE [dbo].[HoaDon] ADD  CONSTRAINT [DF_HoaDon_TrangThai]  DEFAULT (N'Đang chuẩn bị') FOR [TrangThai]
GO
ALTER TABLE [dbo].[NhanVien] ADD  CONSTRAINT [DF_NhanVien_MatKhau]  DEFAULT ((123)) FOR [MatKhau]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_HoaDon] FOREIGN KEY([MaHD])
REFERENCES [dbo].[HoaDon] ([MaHD])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_HoaDon]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_SanGo] FOREIGN KEY([MaSanGo])
REFERENCES [dbo].[SanGo] ([MaSanGo])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_SanGo]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_ChucVu] FOREIGN KEY([MaCV])
REFERENCES [dbo].[ChucVu] ([MaCV])
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK_NhanVien_ChucVu]
GO
ALTER TABLE [dbo].[SanGo]  WITH CHECK ADD  CONSTRAINT [FK_SanGo_LoaiSanGo] FOREIGN KEY([MaLoaiSanGo])
REFERENCES [dbo].[LoaiSanGo] ([MaLoaiSanGo])
GO
ALTER TABLE [dbo].[SanGo] CHECK CONSTRAINT [FK_SanGo_LoaiSanGo]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [CK_ChiTietHoaDon] CHECK  (([soluongmua]>(0)))
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [CK_ChiTietHoaDon]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [CK_ChiTietHoaDon_1] CHECK  (([giamua]>(0)))
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [CK_ChiTietHoaDon_1]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [CK_HoaDon] CHECK  (([tongtienphaitra]>(0)))
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [CK_HoaDon]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [CK_HoaDon_1] CHECK  ((NOT [SDT] like '%[^0-9]%'))
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [CK_HoaDon_1]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [CK_NhanVien] CHECK  (([gioitinh]='N?' OR [gioitinh]='Nam'))
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [CK_NhanVien]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [CK_NhanVien_1] CHECK  ((NOT [SDT] like '%[^0-9]%'))
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [CK_NhanVien_1]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [CK_NhanVien_2] CHECK  ((NOT [socccd] like '%[^0-9]%'))
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [CK_NhanVien_2]
GO
ALTER TABLE [dbo].[SanGo]  WITH CHECK ADD  CONSTRAINT [CK_SanGo] CHECK  (([soluong]>=(0)))
GO
ALTER TABLE [dbo].[SanGo] CHECK CONSTRAINT [CK_SanGo]
GO
