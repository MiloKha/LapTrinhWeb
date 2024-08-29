CREATE DATABASE QL_ThuCung
USE QL_ThuCung

CREATE TABLE ADMIN
(
	TaiKhoan varchar(20) not null,
	MatKhau varchar(20) not null,
	Primary key (TaiKhoan)
)

CREATE TABLE THU_CUNG
(
	MATHUCUNG char(10) not null,
	TENTHUCUNG nvarchar(20),
	TUOITC char(5),
	GIOITINH nvarchar(3) not null,
	LOAI nvarchar(30),
	HINHTC nvarchar(20),
	Primary key(MATHUCUNG)
)

CREATE TABLE CHITIETTHUCUNG
(
	GioiThieu nvarchar(100),
	HINHTC nvarchar(20),
	NguonGoc nvarchar(max),
	MATHUCUNG char(10) not null primary key,
	GIONGTC nvarchar(50),
)
ALTER TABLE CHITIETTHUCUNG
ADD CONSTRAINT FK_TC_CTTC FOREIGN KEY (MATHUCUNG) REFERENCES THU_CUNG(MATHUCUNG)

CREATE TABLE KHACH
(
	MAKH int not null,
	TENKH nvarchar(20),
	MATHUCUNG char(10) not null,
	Primary key (MAKH)
) 
ALTER TABLE KHACH
ADD CONSTRAINT FK_TC_KH Foreign key (MATHUCUNG) references THU_CUNG(MATHUCUNG)

CREATE TABLE SANPHAM
(
	MASP char(10) not null,
	TENSP nvarchar(30),
	LOAISP nvarchar(20),
	HINHSP nvarchar(20),
	ThanhTien int,
	NGAYSUDUNG DATE,
	NGAYHETHAN DATE,
	Primary key (MASP)
) 

CREATE TABLE CHITIETSANPHAM
(
	MoTa nvarchar(max),
	HINHSP nvarchar(20),
	HuongDanSuDung nvarchar(max),
	ThanhPhanDinhDuong nvarchar(max),
	ThuongHieu nvarchar(30),
	Gia int,
	KhoiLuong nvarchar(30),
	MASP char(10) not null  primary key,
)
ALTER TABLE CHITIETSANPHAM
ADD CONSTRAINT FK_SP_CTSP FOREIGN KEY (MASP) REFERENCES SANPHAM(MASP)

CREATE TABLE HOA_DON
(
	MAHD char(10) not null,
	TENHD nvarchar(15),
	LOAIHD nvarchar(20),
	MAKH int not null,
	Primary key (MAHD)
)
ALTER TABLE HOA_DON
ADD CONSTRAINT FK_HD_MAKH foreign key (MAKH) references KHACH(MAKH)

CREATE TABLE CHITIETHD
(
	MAHD char(10) not null,
	MAKH int not null,
	MATHUCUNG char(10) not null,
	MASP char(10) not null,
	SoLuong int,
	TongTien int,
)

ALTER TABLE CHITIETHD
ADD CONSTRAINT FK_CTHD_HD foreign key (MAHD) references HOA_DON(MAHD)

ALTER TABLE CHITIETHD
ADD CONSTRAINT FK_CTHD_K foreign key (MAKH) references KHACH(MAKH)

ALTER TABLE CHITIETHD
ADD CONSTRAINT FK_CTHD_TC foreign key(MATHUCUNG) references THU_CUNG(MATHUCUNG)

ALTER TABLE CHITIETHD
ADD CONSTRAINT FK_CTHD_SP foreign key (MASP) references SANPHAM(MASP)

--
SELECT * FROM THU_CUNG

SELECT * FROM CHITIETTHUCUNG

SELECT * FROM KHACH

SELECT * FROM SANPHAM

SELECT * FROM CHITIETSANPHAM

SELECT * FROM HOA_DON

SELECT * FROM CHITIETHD

-- Dữ liệu
-- Thú cưng
INSERT INTO THU_CUNG(MATHUCUNG,TENTHUCUNG,TUOITC,GIOITINH,LOAI,HINHTC)
VALUES ('PET01',N'Lucky','4',N'Cái',N'Poodle' ,'tc1.jpg' )
INSERT INTO THU_CUNG(MATHUCUNG,TENTHUCUNG,TUOITC,GIOITINH,LOAI,HINHTC)
VALUES ('PET02',N'Na','6',N'Đực',N'Mèo Tam Thể','tc2.jpg')
INSERT INTO THU_CUNG(MATHUCUNG,TENTHUCUNG,TUOITC,GIOITINH,LOAI,HINHTC)
VALUES ('PET03',N'Lucy','10',N'Đực',N'Chihuahua','tc3.jpg')
INSERT INTO THU_CUNG(MATHUCUNG,TENTHUCUNG,TUOITC,GIOITINH,LOAI,HINHTC)
VALUES ('PET04',N'Đen','2',N'Cái',N'Alaska','tc4.jpg')
INSERT INTO THU_CUNG(MATHUCUNG,TENTHUCUNG,TUOITC,GIOITINH,LOAI,HINHTC)
VALUES ('PET05',N'Tom','1',N'Đực',N'Mèo Ba Tư','tc5.jpg')

-- Chi tiết thú cưng
INSERT INTO CHITIETTHUCUNG 
VALUES(N'Chó Poodle là giống chó săn vịt, rất giỏi trong việc bơi lội',N'01.png',N'Loài chó này là “hậu duệ” của các giống chó French Water dog, Hungarian Water Hound và Barbet. Hiện nay, chúng được lai tạo lại và trở thành giống chó cảnh với bộ lông xoăn tít và dáng người nhỏ nhắn.','PET01',N'Poodle')
INSERT INTO CHITIETTHUCUNG 
VALUES(N'Hiện nay mèo tam thể phổ biến ở khắp mọi nơi và mang nhiều ý nghĩa tâm linh',N'02.png',N'Nhiều người hay nhầm lẫn mèo tam thể là tên gọi của một giống mèo, thực chất đó là tên gọi những chú mèo có bộ lông mang ba màu sắc khác nhau tại ba vùng riêng biệt với màu trắng chiếm đa số. Đó có thể là mèo Anh lông ngắn, lông dài hay mèo Ba Tư..','PET02',N'Mèo Tam Thể')
INSERT INTO CHITIETTHUCUNG 
VALUES(N'Chó Chihuahua là một trong những giống chó nuôi nhỏ nhất trên thế giới. Giống chó này rất thông minh',N'03.png',N'Đây là giống chó lâu đời nhất ở châu Mỹ và là giống chó có thân hình nhỏ nhất trong mọi loài chó trên thế giới. Có nguồn gốc từ México nhưng dường như chúng lại được thế giới biết đến nhờ công của những người Trung Quốc. ','PET03',N'Chihuaha')
INSERT INTO CHITIETTHUCUNG 
VALUES(N'Chó Alaska là một giống chó kéo xe ở Alaska',N'04.png',N'Giống chó này được biết được thuần hóa và huấn luyện người dân Alaska và dần phổ biến ở Mỹ. ','PET04',N'Alaska') 
INSERT INTO CHITIETTHUCUNG 
VALUES(N'Mèo Ba Tư hay còn gọi là mèo Ba Tư mặt tịt',N'05.png',N'Mèo Ba Tư là một giống mèo có nguồn gốc từ Ba Tư. ','PET05',N'Mèo Ba Tư')

-- Khách Hàng
INSERT INTO KHACH(MAKH,TENKH,MATHUCUNG)
VALUES ('001',N'Nguyễn Gia Bảo','PET04')
INSERT INTO KHACH(MAKH,TENKH,MATHUCUNG)
VALUES ('002',N'Lương Bích Hữu','PET05')
INSERT INTO KHACH(MAKH,TENKH,MATHUCUNG)
VALUES ('003',N'Hồ Văn Nam','PET01')
INSERT INTO KHACH(MAKH,TENKH,MATHUCUNG)
VALUES ('004',N'Đoàn Thế Phùng','PET03')

-- Sản Phẩm
INSERT INTO SANPHAM(MASP,TENSP,LOAISP,HINHSP,ThanhTien,NGAYSUDUNG,NGAYHETHAN)
VALUES ('FOOD01',N'Thức ăn chó SmartHeart',N'Thức ăn chó','sp1.png','200000','01/01/2022','10/01/2022')
INSERT INTO SANPHAM(MASP,TENSP,LOAISP,HINHSP,ThanhTien,NGAYSUDUNG,NGAYHETHAN)
VALUES ('FOOD02',N'Thức ăn chó Ganador',N'Thức ăn chó','sp2.jpg','150000','01/02/2022','10/02/2022')
INSERT INTO SANPHAM(MASP,TENSP,LOAISP,HINHSP,ThanhTien,NGAYSUDUNG,NGAYHETHAN)
VALUES ('FOOD03',N'Thức ăn chó Iskhan ',N'Thức ăn chó','sp3.jpg','100000','01/03/2022','10/03/2022')
INSERT INTO SANPHAM(MASP,TENSP,LOAISP,HINHSP,ThanhTien,NGAYSUDUNG,NGAYHETHAN)
VALUES ('FOOD04',N'Pate mèo',N'Thức ăn mèo','sp6.jpg','125000','01/04/2022','10/04/2022')
INSERT INTO SANPHAM(MASP,TENSP,LOAISP,HINHSP,ThanhTien,NGAYSUDUNG,NGAYHETHAN)
VALUES ('FOOD05',N'Soup mèo',N'Thức ăn mèo','sp4.jpg','24000','01/05/2022','10/05/2022')
INSERT INTO SANPHAM(MASP,TENSP,LOAISP,HINHSP,ThanhTien,NGAYSUDUNG,NGAYHETHAN)
VALUES ('FOOD06',N'Gel dinh dưỡng',N'Thức ăn mèo','sp5.jpg','14000','01/06/2022','10/06/2022')

-- Chi tiết sản phẩm
INSERT INTO CHITIETSANPHAM
VALUES (N'Là dòng thức ăn hạt khô được chế biến từ thịt cừu chất lượng cao của New Zealand',N'sp1.png',N'thông thường, những con chó nhỏ nên được cho ăn 4 lần một ngày. Mỗi lần cách nhau 4-5 giờ. Còn với những chú chó lớn hơn, phàm ăn hơn thì bạn có thể tăng lên thành 5 bữa nhỏ, mỗi bữa cách nhau khoảng 3 tiếng',N'Colin và DHA giúp phát triển trí não. + Phốt pho và canxi tốt cho xương và răng. + Selenium có tác dụng tăng sức đề kháng và hệ thống miễn dịch. + Axit béo, Omega 3 và 6 nuôi dưỡng và làm mềm mượt lông',N'Smart Heart Gold','200000','400g – 1.5kg.','FOOD01')
INSERT INTO CHITIETSANPHAM
VALUES (N'Dành cho chó trưởng thành được chế biến với các thành phần bao gồm: bột thịt cừu, bột thịt gia,...',N'sp2.jpg',N'Khi cho chó con ăn thức ăn khô Ganador Puppy, các bạn nên ngâm thức ăn trong nước khoảng 1-2 phút để thức ăn mềm ra, các chú chó con dễ ăn và dễ tiêu hóa hơn.',N'sợi thô 6%, hàm lượng protein thô 21%, độ ẩm tối đa 12%, chất béo thô 10%, lúa mì, mỡ gia cầm, gạo, thịt cừu, vitamin A, B1, D3, K3, bột gia cầm','Ganador','150000','400g - 1.4kg','FOOD02')
INSERT INTO CHITIETSANPHAM
VALUES (N'Thức ăn Iskhan Soft dành cho tất cả giống chó.',N'sp3.jpg',N'các bạn nên ngâm thức ăn trong nước khoảng 1-2 phút để thức ăn mềm ra, các chú chó con dễ ăn và dễ tiêu hóa hơn',N'Thịt cá hồi,dầu cá hồi, bột chuối, khoai tây, khoai mì, khoai lang, gạo lức, vitamin A, B1, B2, B3, E, D, canxi, rong biển, rau xanh và các loại trái cây cần thiết.',N'Iskhan Soft','100000','400g - 1.2kg','FOOD03')
INSERT INTO CHITIETSANPHAM
VALUES (N'Thức ăn cho mèo con mèo lớn từ các loại cá biển ngon dễ ăn',N'sp6.jpg',N'Pate cho mèo cần được đậy nắp kín khi chưa sử dụng hết',N'Được làm từ cá, thịt gà, bò, nội tạng động vật',N'SEA FISH','125000','400g','FOOD04')
INSERT INTO CHITIETSANPHAM
VALUES (N'Sản phẩm là dạng súp thưởng cho mèo / pate cho mèo đã say nhuyễn để ăn vặt và bữa phụ.',N'sp4.jpg',N' Có thể cho ăn tối thiểu 1 ngày 2 lần, mỗi lần khoảng 2 đến 3 túi. Hoặc điều chỉnh theo nhu cầu và hoạt động thực tế của mèo',N'Thành phần trong súp bao gồm: cá ngừ, thịt gà, cá hồi, cỏ mèo, vitamin tổng hợp, khoáng chất, nước canh hầm,',N'Wanpy','24000','12g - 14g','FOOD05')
INSERT INTO CHITIETSANPHAM
VALUES (N'Là một loại thực phẩm chức năng giúp bổ sung vitamin và các chất khoáng ',N'sp5.jpg',N'Ăn trực tiếp hoặc trộn với cơm',N'Vitamin A, D, E, B1, B2, B6, B12. Bên cạnh đó là canxi',N'Nutriplus Gel','14000','120.5g','FOOD06')

-- Hoá Đơn
INSERT INTO HOA_DON(MAHD,TENHD,MAKH,LOAIHD)
VALUES('HD01',N'Hóa Đơn Số 01','001',N'Hóa Đơn Tiêm Chủng')
INSERT INTO HOA_DON(MAHD,TENHD,MAKH,LOAIHD)
VALUES('HD02',N'Hóa Đơn Số 02','002',N'Hóa Đơn Thức Ăn')
INSERT INTO HOA_DON(MAHD,TENHD,MAKH,LOAIHD)
VALUES('HD03',N'Hóa Đơn Số 03','003',N'Hóa Đơn Tiêm Chủng')
INSERT INTO HOA_DON(MAHD,TENHD,MAKH,LOAIHD)
VALUES('HD04',N'Hóa Đơn Số 04','004',N'Hóa Đơn Thức Ăn')

-- Chi tiết hoá đơn
INSERT INTO CHITIETHD(MAHD,MAKH,MATHUCUNG,MASP,SoLuong,TongTien)
VALUES('HD01','001','PET04','FOOD02','3','450000')
INSERT INTO CHITIETHD(MAHD,MAKH,MATHUCUNG,MASP,SoLuong,TongTien)
VALUES('HD02','002','PET05','FOOD04','4','500000')
INSERT INTO CHITIETHD(MAHD,MAKH,MATHUCUNG,MASP,SoLuong,TongTien)
VALUES('HD03','002','PET01','FOOD01','2','400000')
INSERT INTO CHITIETHD(MAHD,MAKH,MATHUCUNG,MASP,SoLuong,TongTien)
VALUES('HD04','003','PET03','FOOD03','5','500000')
