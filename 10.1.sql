-- Tạo cơ sở dữ liệu QLBanHang
CREATE DATABASE QLBanHang;
USE QLBanHang;

-- Tạo bảng SanPham
CREATE TABLE SanPham (
    MaSP INT PRIMARY KEY,
    MaHangSX INT,
    TenSP VARCHAR(100),
    SoLuong INT,
    MauSac VARCHAR(50),
    GiaBan DECIMAL(18, 2),
    DonViTinh VARCHAR(50),
    MoTa TEXT
);

-- Tạo bảng HangSX
CREATE TABLE HangSX (
    MaHangSX INT PRIMARY KEY,
    TenHang VARCHAR(100),
    DiaChi VARCHAR(100),
    SoDT VARCHAR(20),
    Email VARCHAR(50)
);

-- Tạo bảng NhanVien
CREATE TABLE NhanVien (
    MaNV INT PRIMARY KEY,
    TenNV VARCHAR(100),
    GioiTinh VARCHAR(10),
    DiaChi VARCHAR(100),
    SoDT VARCHAR(20),
    Email VARCHAR(50),
    TenPhong VARCHAR(50)
);

-- Tạo bảng Nhap
CREATE TABLE Nhap (
    SoHDN INT,
    MaSP INT,
    SoLuongN INT,
    DonGiaN DECIMAL(18, 2),
    PRIMARY KEY (SoHDN, MaSP),
    FOREIGN KEY (MaSP) REFERENCES SanPham(MaSP)
);

-- Tạo bảng PNhap
CREATE TABLE PNhap (
    SoHDN INT PRIMARY KEY,
    NgayNhap DATE,
    MaNV INT,
    FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV)
);

-- Tạo bảng Xuat
CREATE TABLE Xuat (
    SoHDX INT,
    MaSP INT,
    SoLuongX INT,
    PRIMARY KEY (SoHDX, MaSP),
    FOREIGN KEY (MaSP) REFERENCES SanPham(MaSP)
);

-- Tạo bảng PXuat
CREATE TABLE PXuat (
    SoHDX INT PRIMARY KEY,
    NgayXuat DATE,
    MaNV INT,
    FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV)
);

-- Hiển thị thông tin các bảng dữ liệu
SELECT * FROM SanPham;
SELECT * FROM HangSX;
SELECT * FROM NhanVien;
SELECT * FROM Nhap;
SELECT * FROM PNhap;
SELECT * FROM Xuat;
SELECT * FROM PXuat;

-- Thông tin sản phẩm sắp xếp theo chiều giảm dần giá bán
SELECT MaSP, TenSP, SoLuong, MauSac, GiaBan, DonViTinh, MoTa
FROM SanPham
ORDER BY GiaBan DESC;

-- Thông tin 2 sản phẩm có giá bán thấp nhất
SELECT MaSP, TenSP, SoLuong, MauSac, GiaBan, DonViTinh, MoTa
FROM SanPham
ORDER BY GiaBan ASC
LIMIT 2;

-- Thông tin các nhân viên Nữ ở phòng 'Kế toán'
SELECT * FROM NhanVien
WHERE GioiTinh = 'Nữ' AND TenPhong = 'Kế toán';

-- Thông tin các sản phẩm có màu “Đỏ” và giá bán từ 500.000 đến 10.000.000
SELECT * FROM SanPham
WHERE MauSac = 'Đỏ' AND GiaBan BETWEEN 500000 AND 10000000;

-- Các hãng sản xuất có địa chỉ ở Hà Nội
SELECT * FROM HangSX
WHERE DiaChi LIKE '%Hà Nội%';

-- Thông tin các sản phẩm sắp xếp theo số lượng từ thấp đến cao
SELECT * FROM SanPham
ORDER BY SoLuong ASC;

-- Nhân viên Nữ có họ “Lê”
SELECT * FROM NhanVien
WHERE GioiTinh = 'Nữ' AND TenNV LIKE 'Lê%';

-- Nhân viên có tên là “Thủy”
SELECT * FROM NhanVien
WHERE TenNV = 'Thủy';
