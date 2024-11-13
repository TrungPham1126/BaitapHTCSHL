
CREATE DATABASE QLBanHang;
USE QLBanHang;


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


INSERT INTO HangSX (MaHangSX, TenHang, DiaChi, SoDT, Email) VALUES
('H01', 'Samsung', 'Korea', '011-08271717', 'ss@gmail.com.kr'),
('H02', 'OPPO', 'China', '081-08626262', 'oppo@gmail.com.cn'),
('H03', 'Vinfone', 'Việt nam', '084-098262626', 'vf@gmail.com.vn');


INSERT INTO NhanVien (MaNV, TenNV, GioiTinh, DiaChi, SoDT, Email, TenPhong) VALUES
('NV01', 'Nguyễn Thị Thu', 'Nữ', 'Hà Nội', '0982626521', 'thu@gmail.com', 'Kế toán'),
('NV02', 'Lê Văn Nam', 'Nam', 'Bắc Ninh', '0972525252', 'nam@gmail.com', 'Vật tư'),
('NV03', 'Trần Hòa Bình', 'Nữ', 'Hà Nội', '0328388388', 'hb@gmail.com', 'Kế toán');


INSERT INTO SanPham (MaSP, MaHangSX, TenSP, SoLuong, MauSac, GiaBan, DonViTinh, MoTa) VALUES
('SP01', 'H02', 'F1 Plus', 100, 'Xám', 7000000, 'Chiếc', 'Hàng cận cao cấp'),
('SP02', 'H01', 'Galaxy Note11', 50, 'Đỏ', 19000000, 'Chiếc', 'Hàng cao cấp'),
('SP03', 'H02', 'F3 lite', 200, 'Nâu', 3000000, 'Chiếc', 'Hàng phổ thông'),
('SP04', 'H03', 'Vjoy3', 200, 'Xám', 1500000, 'Chiếc', 'Hàng phổ thông'),
('SP05', 'H01', 'Galaxy V21', 500, 'Nâu', 8000000, 'Chiếc', 'Hàng cận cao cấp');


INSERT INTO PNhap (SoHDN, NgayNhap, MaNV) VALUES
('N01', '2019-05-02', 'NV01'),
('N02', '2020-07-04', 'NV02'),
('N03', '2020-05-17', 'NV02'),
('N04', '2020-03-22', 'NV03'),
('N05', '2020-07-07', 'NV01');


INSERT INTO Nhap (SoHDN, MaSP, SoLuongN, DonGiaN) VALUES
('N01', 'SP02', 10, 17000000),
('N02', 'SP01', 30, 6000000),
('N03', 'SP04', 20, 1200000),
('N04', 'SP01', 10, 6200000),
('N05', 'SP05', 20, 7000000);
INSERT INTO PXuat (SoHDX, NgayXuat, MaNV) VALUES
('X01', '2020-06-14', 'NV02'),
('X02', '2019-03-05', 'NV03'),
('X03', '2020-12-12', 'NV01'),
('X04', '2020-06-02', 'NV02'),
('X05', '2020-05-18', 'NV01');

INSERT INTO Xuat (SoHDX, MaSP, SoLuongX) VALUES
('X01', 'SP03', 5),
('X02', 'SP01', 3),
('X03', 'SP02', 1),
('X04', 'SP03', 2),
('X05', 'SP05', 1);

SELECT * FROM HangSX;
SELECT * FROM SanPham;
SELECT * FROM NhanVien;
SELECT * FROM PNhap;
SELECT * FROM Nhap;
SELECT * FROM PXuat;
SELECT * FROM Xuat;
UPDATE NhanVien
SET DiaChi = 'Hà Nội'
WHERE DiaChi = 'Hà Tây';
DELETE FROM SanPham
WHERE MaHangSX IN (SELECT MaHangSX FROM HangSX WHERE TenHang = 'Blackberry');
