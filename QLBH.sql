CREATE DATABASE QLBH;
USE QLBH;

CREATE TABLE HangSX (
    MaHangSX NCHAR(10) PRIMARY KEY,
    TenHang NVARCHAR(20),
    DiaChi NVARCHAR(30),
    SoDT NVARCHAR(20),
    Email NVARCHAR(30)
);

CREATE TABLE SanPham (
    MaSP NCHAR(10) PRIMARY KEY,
    MaHangSX NCHAR(10),
    TenSP NVARCHAR(20),
    SoLuong INT,
    MauSac NVARCHAR(20),
    GiaBan MONEY,
    DonViTinh NCHAR(10),
    MoTa NVARCHAR(MAX),
    FOREIGN KEY (MaHangSX) REFERENCES HangSX(MaHangSX)
);

CREATE TABLE NhanVien (
    MaNV NCHAR(10) PRIMARY KEY,
    TenNV NVARCHAR(20),
    GioiTinh NCHAR(10),
    DiaChi NVARCHAR(30),
    SoDT NVARCHAR(20),
    Email NVARCHAR(30),
    TenPhong NVARCHAR(30)
);

CREATE TABLE PNhap (
    SoHDN NCHAR(10) PRIMARY KEY,
    NgayNhap DATE,
    MaNV NCHAR(10),
    FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV)
);

CREATE TABLE Nhap (
    SoHDN NCHAR(10),
    MaSP NCHAR(10),
    SoLuongN INT,
    DonGiaN MONEY,
    PRIMARY KEY (SoHDN, MaSP),
    FOREIGN KEY (SoHDN) REFERENCES PNhap(SoHDN),
    FOREIGN KEY (MaSP) REFERENCES SanPham(MaSP)
);

CREATE TABLE PXuat (
    SoHDX NCHAR(10) PRIMARY KEY,
    NgayXuat DATE,
    MaNV NCHAR(10),
    FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV)
);

CREATE TABLE Xuat (
    SoHDX NCHAR(10),
    MaSP NCHAR(10),
    SoLuongX INT,
    PRIMARY KEY (SoHDX, MaSP),
    FOREIGN KEY (SoHDX) REFERENCES PXuat(SoHDX),
    FOREIGN KEY (MaSP) REFERENCES SanPham(MaSP)
);

SELECT * FROM SanPham WHERE MauSac = 'Đỏ';

SELECT TOP 2 * FROM SanPham ORDER BY GiaBan DESC;

SELECT * FROM PNhap WHERE YEAR(NgayNhap) = 2021;

SELECT DISTINCT LEFT(DiaChi, CHARINDEX(' ', DiaChi) - 1) AS TenTinh FROM NhanVien;

SELECT TOP 3 * FROM SanPham WHERE MauSac = 'Xanh' ORDER BY SoLuong ASC;

SELECT * FROM NhanVien WHERE TenPhong = 'Kế toán';

SELECT * FROM SanPham WHERE GiaBan BETWEEN 1000000 AND 10000000;

SELECT MaNV, 
       LEFT(TenNV, CHARINDEX(' ', TenNV) - 1) AS Ho,
       SUBSTRING(TenNV, CHARINDEX(' ', TenNV) + 1, LEN(TenNV)) AS TenDemTen,
       GioiTinh, DiaChi, SoDT, Email, TenPhong
FROM NhanVien;

SELECT SoHDN, 
       DAY(NgayNhap) AS Ngay, 
       MONTH(NgayNhap) AS Thang, 
       YEAR(NgayNhap) AS Nam 
FROM PNhap;

SELECT SoHDX, 
       DAY(NgayXuat) AS Ngay, 
       MONTH(NgayXuat) AS Thang, 
       YEAR(NgayXuat) AS Nam 
FROM PXuat;

SELECT * FROM NhanVien WHERE TenNV LIKE 'Nguyễn%';

SELECT * FROM SanPham WHERE TenSP LIKE '%Flus%';

SELECT * FROM SanPham ORDER BY GiaBan DESC, SoLuong ASC;

SELECT CONCAT('Mã sản phẩm: ', MaSP, ', Tên sản phẩm: ', TenSP, ', số lượng: ', SoLuong, ', màu sắc: ', MauSac, ', giá bán: ', GiaBan) 
FROM SanPham;

SELECT * FROM SanPham WHERE SoLuong = (SELECT MAX(SoLuong) FROM SanPham);

SELECT * FROM SanPham WHERE GiaBan = (SELECT MIN(GiaBan) FROM SanPham);

SELECT * FROM NhanVien WHERE TenNV = 'Tuấn Anh' AND TenPhong = 'Tổ chức';

SELECT SoHDX, NgayXuat, MaNV FROM PXuat WHERE MONTH(NgayXuat) = 9 AND YEAR(NgayXuat) = 2021;

SELECT MaNV, UPPER(TenNV) AS TenNV, LOWER(DiaChi) AS DiaChi, SoDT, Email, TenPhong FROM NhanVien;
