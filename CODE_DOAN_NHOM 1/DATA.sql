CREATE DATABASE QuanLyQuanCafe
GO

USE QuanLyQuanCafe
GO
   
-- Food
-- Table
-- FoodCategory
-- Account
-- Bill
-- BillInfo

CREATE TABLE TableFood
(
	idTableFood INT IDENTITY PRIMARY KEY,
	name NVARCHAR(100) NOT NULL DEFAULT N'Bàn chưa có tên',
	status NVARCHAR(100) NOT NULL DEFAULT N'Trống'	-- Trống || Có người
)
GO

CREATE TABLE Account
(
	UserName NVARCHAR(100) PRIMARY KEY,	
	DisplayName NVARCHAR(100) NOT NULL DEFAULT N'Kter',
	PassWord NVARCHAR(1000) NOT NULL DEFAULT 0,
	Type INT NOT NULL  DEFAULT 0 -- 1: admin && 0: staff
)
GO



CREATE TABLE FoodCategory
(
	idFoodCategory INT IDENTITY PRIMARY KEY,
	name NVARCHAR(100) NOT NULL DEFAULT N'Chưa đặt tên'
)
GO

INSERT INTO	dbo.FoodCategory
(
    id INT IDENTITY PRIMARY KEY,
	name NVARCHAR(100) NOT NULL DEFAULT N'Chưa đặt tên'
)

DROP TABLE FoodCategory
DROP TABLE Billinfo

VALUES
(N'HEO KHO CẢI CHUA' -- name - nvarchar(100)
    )

DELETE FoodCategory WHERE name =N'HEO KHO CẢI CHUA'

	SELECT * FROM dbo.FoodCategory

CREATE TABLE Food
(
	idFood INT IDENTITY PRIMARY KEY,
	name NVARCHAR(100) NOT NULL DEFAULT N'Chưa đặt tên',
	idFoodCategory INT NOT NULL,
	price FLOAT NOT NULL DEFAULT 0
	
	FOREIGN KEY (idFoodCategory) REFERENCES dbo.FoodCategory(idFoodCategory)
)
GO


INSERT INTO dbo.Food
(
    name,
    idCategory,
    price
)

drop TABLE FOOD

VALUES
(   N'HEO KHO CẢI CHUA', -- name - nvarchar(100)
    1,       -- idCategory - int
    40000  -- price - float
    )

SELECT * FROM dbo.Food WHERE dbo.Food.name LIKE N'%HEO%'




CREATE TABLE Bill
(
	idBill INT IDENTITY PRIMARY KEY,
	DateCheckIn DATE NOT NULL DEFAULT GETDATE(),
	DateCheckOut DATE,
	idTableFood INT NOT NULL,
	status INT NOT NULL DEFAULT 0 -- 1: đã thanh toán && 0: chưa thanh toán
	
	FOREIGN KEY (idTableFood) REFERENCES dbo.TableFood(idTableFood)
)
GO

drop table bill
drop table tablefood
drop table account
drop table food


CREATE TABLE BillInfo
(
	idBillInfo INT IDENTITY PRIMARY KEY,
	UserName NVARCHAR(100),
	
	idBill INT NOT NULL,
	idFood INT NOT NULL,
	count INT NOT NULL DEFAULT 0

	FOREIGN KEY (idBill) REFERENCES Bill(idBill),
	FOREIGN KEY (idFood) REFERENCES Food(idFood), 
    foreign key (UserName) references Account (UserName)
)
GO



drop table billinfo

INSERT INTO dbo.Account
	(UserName ,
	DisplayName ,
	PassWord ,
	Type 
	)
VALUES
	(
	N'K9' , --UserName - nvarchar(100)
	N'RongK9' , --DisplayName - nvarchar(100)
	N'1' , --Password - nvarchar(100)
	1 --Type - int
	)


INSERT INTO dbo.Account
	(UserName ,
	DisplayName ,
	PassWord ,
	Type 
	)
VALUES
	(
	N'staff' , --UserName - nvarchar(100)
	N'staff' , --DisplayName - nvarchar(100)
	N'1' , --Password - nvarchar(100)
	0 --Type - int
	)

SELECT * FROM Account
go

alter PROC USP_GetAccountByUserName @userName NVARCHAR(100)
AS
	BEGIN
	SELECT * FROM dbo.Account WHERE UserName=@userName
	END
GO

EXEC USP_GetAccountByUserName @userName=N'K9'

SELECT * FROM dbo.Account WHERE UserName = N'K9' AND PassWord='1'


	--thêm ' trong '' để lỗi
	SELECT * FROM dbo.Account WHERE UserName= N'' OR 1=1-- '

CREATE PROC USP_Login @userName NVARCHAR(100),@passWord NVARCHAR(100)
AS
	BEGIN
	SELECT * FROM dbo.Account WHERE UserName=@userName AND PassWord=@passWord
	END
GO

SELECT * FROM dbo.Account WHERE UserName = '' AND PassWord = N'' OR 1=1--'



--DÙNG VÒNG LẶP THÊM DỮ LIỆU BÀN

DECLARE @I INT=0

WHILE @I <=10
BEGIN
	INSERT INTO DBO.TABLEFOOD (NAME) VALUES (N'BÀN ' + CAST(@I AS NVARCHAR(100)))--DÙNG NỐI CHUỖI ->KÊT NỐI VS I--DÙNG CAST ĐỂ ĐỔI I QUA STRING
	SET @I=@I+1
END



--TẠO PROC tim bàn
CREATE PROC USP_GetTableList
AS
	SELECT * FROM TABLEFOOD
GO

EXEC USP_GetTableList

update TABLEFOOD SET STATUS = N'CÓ NGƯỜI' WHERE IDTABLEFOOD = 1


--TẠO PROC thêm foodcategory
INSERT INTO	foodcategory VALUES
(N'Thịt Heo'),
(N'Thịt Bò'),
(N'Nước'),

(N'Hải Sản')

--thêm món
INSERT INTO	food VALUES 
(N'Cơm chiên thập cẩm' ,1,55000),
(N'Mì ý sốt bò' ,3,50000),


(N'Cơm chiên hải sản' ,1,55000),
(N'Cơm Phần heo quay' ,2,45000),
(N'Cơm chiên bò lúc lắc' ,3,50000),
(N'Nước suối' ,4,10000)

--thêm bill
INSERT INTO	bill VALUES
(GETDATE() , NULL , 1 ,0),
(GETDATE() , NULL , 2 ,0),
(GETDATE() , GETDATE() , 2 ,1)

-- thêm billinffo
INSERT INTO	billinfo VALUES
('K9',1,1,2),
('K9',1,3,4),
('K9',1,5,1),
('K9',2,1,2),
('K9',2,6,2),
('K9',3,5,2)





select * from bill
go
select * from billinfo
go
select * from food
go
select * from foodcategory
GO

SELECT * FROM tablefood

select idbill from bill where idtablefood = 2 and status = 0

-- từ idbill lấy được list bill

select * from billinfo where idbill = 2




create Table Store
(
	UserName NVARCHAR(100) ,
	Material NVARCHAR(100),
	DateIn date ,
	Dateexpired date,--ngày hết hạn
	priceIn float ,
	amount int,
	category NVARCHAR(100)
	
	primary key (username , material , datein),
	FOREIGN KEY (username) REFERENCES dbo.account(username)
)
drop Table Store

create table salary
(
	UserName NVARCHAR(100),
	Type INT NOT NULL,
	WORKDAY int,
	restday int,
	wagelevel float,
	bonus float,

	punish float,
	total float,
	
	primary key (username , Type),
	foreign key (username) references dbo.account(username)
)


--alter table salary
--add constraint fk_type
--foreign key (type)
--references account(type)



drop table salary 


--hiển thị chi tiết hóa đơn bàn
SELECT F.NAME , BI.COUNT , F.PRICE,F.PRICE * BI.COUNT AS [TOTALPRICE] FROM BILLINFO BI ,BILL B,FOOD F WHERE BI.IDBILL=B.IDBILL AND BI.IDFOOD=F.IDFOOD AND B.IDTABLEFOOD = 2

<<<<<<< Updated upstream

--bai 11 them xoa hoa don
CREATE PROC USP_INSERTBILL
@IDTABLEFOOD INT
AS
	BEGIN
	INSERT INTO BILL VALUES (GETDATE(),NULL,@IDTABLEFOOD,0)
	END

--///////THÊM DISCOUNT B13
ALTER PROC USP_INSERTBILL--cập nhật mới lỗi thanh toán
@IDTABLEFOOD INT
AS
	BEGIN
	INSERT INTO BILL VALUES (GETDATE(),NULL,@IDTABLEFOOD,0,0)
	END

CREATE PROC USP_InsertBillInfo
@TEN nvarchar(100),@idBill int , @idfood int , @count int
as
	BEGIN
	INSERT INTO BILLINFO VALUES(@TEN,@IDBILL,@IDFOOD,@COUNT)
	END

exec USP_InsertBillInfo 'k9',4,3,1

select max(idbill) from bill

drop proc USP_InsertBillInfo




ALTER PROC USP_InsertBillInfo
@TEN nvarchar(100),@idBill int , @idfood int , @count int
AS
	BEGIN
	DECLARE @isExitsBI int;
	DECLARE @FOODCOUNT INT =1

	select @isExitsBI = IDBILLINFO,@FOODCOUNT = B.COUNT from billinfo AS B where idBill=@idBill and idfood=@idfood 

	IF (@isExitsBI >0)
	BEGIN 
		DECLARE @NEWCOUNT INT = @FOODCOUNT + @COUNT
			IF(@NEWCOUNT >0)
			UPDATE BILLINFO SET COUNT = @FOODCOUNT+@COUNT WHERE idfood=@idfood 
			ELSE
			DELETE BILLINFO WHERE IDBILL=@IDBILL AND IDFOOD=@idfood
	END
	ELSE
	BEGIN
		INSERT INTO BILLINFO VALUES(@TEN,@IDBILL,@IDFOOD,@COUNT)
	END
	END
		



CREATE PROC USP_InsertBillInfo2
@idBill int , @idfood int , @count int
as
	BEGIN
	INSERT INTO BILLINFO VALUES('k9',@IDBILL,@IDFOOD,@COUNT)
	END
=======
--Quên Mật khẩu
CREATE proc forgetPass 
@username_input nvarchar(100)
AS
BEGIN
	SELECT @username_input FROM Account WHERE @username_input = UserName
END


exec forgetPass ''
go

select * from account

DROP FUNCTION forgetPass
drop proc forgetPass

--Sửa Mật Khẩu khi nhập đúng username
create proc updateAccount
@password nvarchar(100),
@userName nvarchar(100)
as
begin
    update Account
    set
        PassWord = @password
    where UserName = @userName
end
go

drop proc updateAccount
>>>>>>> Stashed changes

--bài 12
UPDATE BILL SET STATUS = 1 WHERE IDbill = 14

--khi bill hoặc bill info cập nhật thông tin có 2 TH :
--TABLE có bill -> có billinfo và bill chưa được thanh toán -> bàn đó có người
--Table ko có bill -> trống
-- khi update bill và billinfo
--> 2TH :th1 thêm billinfo -> bàn có người 
--> th2:xóa bớt ->bill vẫn nằm đó ->bàn vẫn có người nhưng ko có món 
-->th trống là khi thanh toán -> update bill

--tạo trigger insert update billinfo -> cập nhật thông tin thành bàn có người 
--tạo trigger update bill ->cập nhật thông tin trống

create TRIGGER UTG_UPDATEBILLINFO
ON BILLINFO FOR INSERT , UPDATE
AS
	BEGIN
		DECLARE @IDBILL INT
		SELECT @IDBILL = IDBILL FROM inserted
		DECLARE @IDTABLE INT
		SELECT @IDTABLE = IDTABLEFOOD FROM BILL WHERE IDBILL=@IDBILL AND STATUS =0 --CHƯA CHECK "0"

		DECLARE @COUNT INT
		SELECT @COUNT = COUNT(*) FROM BILLINFO WHERE IDBILL = @IDBILL

		IF(@COUNT>0)
		UPDATE TABLEFOOD SET STATUS = N'CÓ NGƯỜI' WHERE IDTABLEFOOD =@IDTABLE
		ELSE
		UPDATE TABLEFOOD SET STATUS = N'Trống' WHERE IDTABLEFOOD =@IDTABLE
	END




select status from tablefood

DELETE BILLINFO
DELETE BILL



SELECT COUNT(*) FROM BILL WHERE IDTABLEFOOD = 2 AND STATUS = 0

	DROP TRIGGER UTG_UPDATEBILL

create TRIGGER UTG_UPDATEBILL
ON BILL FOR INSERT, UPDATE 
AS
	BEGIN

	DECLARE @IDBILL INT
	SELECT @IDBILL = IDBILL FROM INSERTED
	DECLARE @IDTABLE INT
	SELECT @IDTABLE = IDTABLEFOOD FROM BILL WHERE IDBILL=@IDBILL
	DECLARE @COUNT INT =0
	SELECT @COUNT=COUNT(*) FROM BILL WHERE IDTABLEFOOD = @IDTABLE AND STATUS = 0

	IF(@COUNT = 0)
		UPDATE DBO.TableFood SET STATUS = N'Trống' WHERE IDTABLEFOOD = @IDTABLE
	END

UPDATE TABLEFOOD SET STATUS = N'Trống' where IDTABLEFOOD =1


--chua add dong goi
--////////////////////////////////bai13 : chuyen ban


alter table bill
add discount int

UPDATE BILL SET DISCOUNT = 0


DECLARE @IDBILLNEW INT = 7
SELECT IDBILLINFO into IDBILLINFOTABLE FROM BILLINFO WHERE IDBILL=@IDBILLNEW

DECLARE @IDBILLOLD INT = 1

update BILLINFO SET IDBILL = @IDBILLOLD WHERE IDBILLINFO IN (SELECT * FROM IDBILLINFOTABLE)

create PROC USP_SWITCHTABLE
@IDTABLE1 INT , @IDTABLE2 INT  --phải xác định idbill hoặc bàn ->TRUYỀN VÀO IDTABL
AS
	BEGIN

	DECLARE @IDFIRSTBILL INT
	DECLARE @IDSECONDBILL INT

	DECLARE @ISFIRSTTABLEEMPTY INT =1
	DECLARE @ISSECONDTABLEEMPTY INT =1

	select @IDSECONDBILL= idbill from bill where idtablefood =@IDTABLE2 and status = 0 -- lấy id mặc định

	select @IDFIRSTBILL= idbill from bill where idtablefood =@IDTABLE1 and status = 0



	IF (@IDFIRSTBILL IS NULL)--LƯU Ý  :khi so sánh vơi null là (is null)
	BEGIN
		INSERT INTO BILL VALUES (GETDATE() ,NULL ,@IDTABLE1,0,0)
		select @IDFIRSTBILL= MAX(idbill) from bill where idtablefood =@IDTABLE1 and status = 0
	END
	SELECT @ISFIRSTTABLEEMPTY = COUNT (*) FROM BILLINFO WHERE IDBILL = @IDFIRSTBILL

	IF (@IDSECONDBILL IS NULL)
	BEGIN
		INSERT INTO BILL VALUES (GETDATE() ,NULL ,@IDTABLE2,0,0)
		select @IDSECONDBILL= MAX(idbill) from bill where idtablefood =@IDTABLE2 and status = 0
	END
	SELECT @ISSECONDTABLEEMPTY = COUNT (*) FROM BILLINFO WHERE IDBILL = @IDSECONDBILL	


	SELECT IDBILLINFO INTO IDBILLINFOTABLE FROM  BILLINFO WHERE IDBILL=@IDSECONDBILL -- TẠO BẢNG CHỨA TẤT CẢ IDBILLINFO CỦA BÀN THỨ 2(bàn chuyển)


	update BILLINFO SET IDBILL = @IDSECONDBILL WHERE IDBILL = @IDFIRSTBILL-- thay đổi tất cả bill bàn thứ 1 sang bàn 2 

	UPDATE BILLINFO SET IDBILL = @IDFIRSTBILL WHERE IDBILLINFO in (SELECT * FROM IDBILLINFOTABLE)--CHUYỂN tất cả bill từ bàn 2 qua bàn 1

	DROP TABLE IDBILLINFOTABLE

	IF(@ISFIRSTTABLEEMPTY = 0)
		UPDATE TABLEFOOD SET STATUS = N'Trống' where idtablefood = @IDTABLE2

	IF(@ISSECONDTABLEEMPTY = 0)
		UPDATE TABLEFOOD SET STATUS = N'Trống' where idtablefood = @IDTABLE1

	END



	--INSERT INTO BILL VALUES (GETDATE() ,GETDATE() ,1,0,50)

	exec USP_SWITCHTABLE 3,4

CREATE PROC sp_SwitchTable
@idtable1 INT, @idtable2 INT
AS
BEGIN
	DECLARE @idBillFirst INT
	DECLARE @idBillSecond INT

	SELECT @idBillFirst = id FROM dbo.HoaDon WHERE BanSo = @idtable1 AND ThanhToan = 0
	SELECT @idBillSecond = id FROM dbo.HoaDon WHERE BanSo = @idtable2 AND ThanhToan = 0

	IF (@idBillFirst IS NOT NULL AND @idBillSecond IS NOT NULL)
	BEGIN
	    SELECT id INTO IdBillInfoTable FROM dbo.TTHoaDon WHERE SoHoaDon = @idBillFirst

	UPDATE dbo.TTHoaDon SET SoHoaDon = @idBillFirst WHERE SoHoaDon = @idBillSecond
	UPDATE dbo.TTHoaDon SET SoHoaDon = @idBillSecond WHERE id IN (SELECT * FROM dbo.IdBillInfoTable)

	DROP TABLE dbo.IdBillInfoTable
	END

	IF (@idBillFirst IS NOT NULL AND @idBillSecond IS NULL)
	BEGIN
		INSERT dbo.HoaDon
		(
		    DateCheckIn,
		    DateCheckOut,
		    BanSo,
		    ThanhToan,
		    discount
		)
		VALUES
		(   GETDATE(), -- DateCheckIn - date
		    NULL, -- DateCheckOut - date
		    @idtable2,         -- BanSo - int
		    0,         -- ThanhToan - int
		    0          -- discount - int
		    )
		SELECT @idBillSecond = MAX(id) FROM dbo.HoaDon WHERE BanSo = @idtable2 AND ThanhToan = 0
	UPDATE dbo.TTHoaDon SET SoHoaDon = @idBillSecond WHERE SoHoaDon = @idBillFirst
	DELETE dbo.HoaDon WHERE BanSo = @idtable1 AND ThanhToan = 0
	END
END
GO


--//////////////////////bai15 : thông tin cá nhân
select * from account


alter PROC USP_UPDATEACCOUNT
@USERNAME NVARCHAR (100) , @DISPLAYNAME NVARCHAR (100) , @PASSWORD NVARCHAR(100) , @NEWPASS NVARCHAR (100)
AS 
	BEGIN
		DECLARE @CORRECTPASS INT =0

		SELECT @CORRECTPASS = COUNT (*) FROM ACCOUNT WHERE @USERNAME = USERNAME AND PASSWORD = @PASSWORD

		IF (@CORRECTPASS=1)
		BEGIN
			IF (@NEWPASS = NULL OR @NEWPASS ='')
			BEGIN
				UPDATE ACCOUNT SET DISPLAYNAME=@DISPLAYNAME WHERE USERNAME=@USERNAME 
			END
			ELSE
				UPDATE ACCOUNT SET DISPLAYNAME=@DISPLAYNAME,PASSWORD = @NEWPASS WHERE  USERNAME =@USERNAME 
		END
	END


--////////////B18: INSERT , DELETE , UPDATE FOOD

SELECT * FROM FOOD

update dbo.Food SET name = N'Cơm chiên thập cẩm ' , idFoodCategory = 1 , price =1111 WHERE idFood = 1

SELECT * FROM BILLINFO

-- Tạo Trigger khi xóa hết billinfo

CREATE TRIGGER UTG_DeleteBillInfo ON BILLINFO FOR DELETE
AS
	BEGIN
		DECLARE @IDBILLINFO INT
		DECLARE @IDBILL INT
		SELECT @IDBILLINFO=IDBILLINFO , @IDBILL=IDBILL  FROM deleted

		DECLARE @IDTABLE INT
		SELECT @IDTABLE=idTableFood FROM BILL WHERE idBill=@IDBILL

		DECLARE @COUNT INT = 0;
		SELECT @COUNT = COUNT (*) FROM BILLINFO BI , BILL B WHERE B.IDBILL = @IDBILL AND BI.IDBILL = B.IDBILL AND STATUS = 0

		IF (@COUNT=0)
			UPDATE TABLEFOOD SET STATUS = N'Trống' WHERE idTableFood = @IDTABLE
	END

-- Thống kê BillInfo
CREATE PROC [dbo].[SP_TOTALBILL] (@FROMDATE DATE, @TODATE DATE)
AS
BEGIN
	SELECT DATECHECKIN,DATECHECKOUT, SUM(BF.COUNT*PRICE) AS [TONGTIEN]
	FROM BILL B, BILLINFO BF, FOOD F
	WHERE @FROMDATE <= DATECHECKIN AND @TODATE >= DATECHECKOUT 
		AND B.IDBILL = BF.IDBILL 
		AND BF.IDFOOD = F.IDFOOD
	GROUP BY DATECHECKIN,DATECHECKOUT
	
END
GO

--Thống kê Store
CREATE PROC [dbo].[SP_STATISTICALSTORE] (@DATEIN DATE) AS
BEGIN
	SELECT DATEIN AS [NGÀY NHẬP], SUM(PRICEIN*AMOUNT) AS [TỔNG TIỀN]
	FROM STORE
	WHERE @DATEIN <= DATEIN
	GROUP BY DATEIN
END
GO

--19

--########## HÀM CHUYỂN ĐỔI CỤM TỪ, TỪ CÓ DẤU SANG KHÔNG DẤU
CREATE FUNCTION [dbo].[fuConvertToUnsign1] ( @strInput NVARCHAR(4000) ) 
RETURNS NVARCHAR(4000) 
AS 
	BEGIN 
	IF @strInput IS NULL RETURN @strInput IF @strInput = '' RETURN @strInput 
	
	DECLARE @RT NVARCHAR(4000) 
	DECLARE @SIGN_CHARS NCHAR(136)
	DECLARE @UNSIGN_CHARS NCHAR (136) 
	SET @SIGN_CHARS = N'ăâđêôơưàảãạáằẳẵặắầẩẫậấèẻẽẹéềểễệế ìỉĩịíòỏõọóồổỗộốờởỡợớùủũụúừửữựứỳỷỹỵý ĂÂĐÊÔƠƯÀẢÃẠÁẰẲẴẶẮẦẨẪẬẤÈẺẼẸÉỀỂỄỆẾÌỈĨỊÍ ÒỎÕỌÓỒỔỖỘỐỜỞỠỢỚÙỦŨỤÚỪỬỮỰỨỲỶỸỴÝ' +NCHAR(272)+ NCHAR(208) 
	SET @UNSIGN_CHARS = N'aadeoouaaaaaaaaaaaaaaaeeeeeeeeee iiiiiooooooooooooooouuuuuuuuuuyyyyy AADEOOUAAAAAAAAAAAAAAAEEEEEEEEEEIIIII OOOOOOOOOOOOOOOUUUUUUUUUUYYYYYDD' 
	DECLARE @COUNTER int DECLARE @COUNTER1 int SET @COUNTER = 1 WHILE (@COUNTER <=LEN(@strInput)) 
		BEGIN 
		SET @COUNTER1 = 1 WHILE (@COUNTER1 <=LEN(@SIGN_CHARS)+1) 
		BEGIN 
		IF UNICODE(SUBSTRING(@SIGN_CHARS, @COUNTER1,1)) = UNICODE(SUBSTRING(@strInput,@COUNTER ,1) ) 
		BEGIN 
		IF @COUNTER=1 SET @strInput = SUBSTRING(@UNSIGN_CHARS, @COUNTER1,1) + SUBSTRING(@strInput, @COUNTER+1,LEN(@strInput)-1) 
		ELSE SET @strInput = SUBSTRING(@strInput, 1, @COUNTER-1) +SUBSTRING(@UNSIGN_CHARS, @COUNTER1,1) + SUBSTRING(@strInput, @COUNTER+1,LEN(@strInput)- @COUNTER) BREAK 
		END SET @COUNTER1 = @COUNTER1 +1 
		END SET @COUNTER = @COUNTER +1 
		END SET @strInput = replace(@strInput,' ','-') 
		RETURN @strInput 
		END

select * from food where name like N'%CơM%'

select * from food where dbo.fuConvertToUnsign1(name) like N'%COM%'

SELECT * FROM Food WHERE dbo.fuConvertToUnsign1(name) LIKE N'%' + dbo.fuConvertToUnsign1(N'com') + '%'

--20
select * from account 
SELECT UserName, DisplayName, Type FROM dbo.Account

SELECT * FROM ACCOUNT
-- PASSWORD DEFAULT = 0

-- 
select idfoodcategory , name  from foodcategory



--

-- sửa lại phần thanh toán cập nhật lại ngày checkout
update bill set status = 1 , Datecheckout = GETDATE() WHERE IDBILL =36

--24 phân trang

SELECT * FROM BILL



--LẤY RA 4 DÒNG ĐẦU XONG LOẠI 2 DÒNG ĐẦU 
SELECT TOP 4 * FROM BILL
EXCEPT 
SELECT TOP 2 * FROM BILL

--GIẢ SỬ 1 PAGE 2 DÒNG ->PageCount =2 (số dòng mỗi trang) ->pageNum=2

-- xóa foodcategory

select idfood from food f,foodcategory fc where f.idfoodcategory = fc.idfoodcategory and fc.idfoodcategory = 1

Delete billinfo where idFood in (select idfood from food f,foodcategory fc where f.idfoodcategory = fc.idfoodcategory and fc.idfoodcategory = 1)

Delete food where idfoodcategory = 1

--TableList
select * from tablefood


--//
--thêm vào ngày 8/12
--//
--Chức năng kho Thêm, sửa, xóa, Xem
--Thêm dữ liệu vào Store
CREATE PROC USP_ADDSTORE
(@USERNAME NVARCHAR(100),
@MATERIAL NVARCHAR(100),
@DATEIN DATE,
@DATEEXPRIRED DATE,
@PRICEIN FLOAT,
@AMOUNT INT,
@CATEGORY NVARCHAR(100))
AS
BEGIN
	INSERT [DBO].[Store](UserName,Material,DateIn,Dateexpired,priceIn,amount,category)
	VALUES(@USERNAME,@MATERIAL,@DATEIN,@DATEEXPRIRED,@PRICEIN,@AMOUNT,@CATEGORY)
	SELECT UserName, Material, DateIn, Dateexpired, priceIn,amount,category FROM [DBO].[Store]
END

--Xóa dữ liệu của Store
CREATE PROC USP_DELETESTORE
(@USERNAME NVARCHAR(100),
@MATERIAL NVARCHAR(100),
@DATEIN DATE,
@CATEGORY NVARCHAR(100))
AS
BEGIN
	DELETE [DBO].[Store]
	WHERE UserName = @USERNAME 
		and Material = @MATERIAL
		and DateIn =@DATEIN
		and category = @CATEGORY
	SELECT UserName, Material, DateIn, Dateexpired, priceIn,amount,category FROM [DBO].[Store]
END

--Sửa dữ liệu của Store
CREATE PROC USP_EDITSTORE
(@USERNAME NVARCHAR(100),
@MATERIAL NVARCHAR(100),
@DATEIN DATE,
@DATEEXPRIRED DATE,
@PRICEIN FLOAT,
@AMOUNT INT,
@CATEGORY NVARCHAR(100))
AS
BEGIN
	UPDATE [DBO].[Store]
	SET Dateexpired =@DATEEXPRIRED,
		priceIn =@PRICEIN,
		amount = @AMOUNT
	WHERE UserName = @USERNAME
		and Material = @MATERIAL
		and DateIn =@DATEIN
		and category =@CATEGORY
END

--Xem dữ liệu của Store
CREATE PROC USP_SHOWSTORE
AS
BEGIN
	SELECT UserName, Material, DateIn, Dateexpired, priceIn,amount,category FROM [DBO].[Store]
END


--//
--thêm vào ngày 9/12
--//
--thêm dữ liệu cho Store
INSERT INTO Store
VALUES (N'K9', N'CoCa CoLa', '2022/12/05', '2024/12/05', 1500, 4, N'Nước'),
	(N'K9', N'Thịt Bò', '2022/11/23', '2023/01/12', 4000, 8, N'thịt'),
	(N'K9', N'Thịt Heo', '2022/11/23', '2023/01/28', 3000, 6, N'Thịt'),
	(N'Staff', N'Cá Ngừ', '2022/12/24', '2023/02/26', 2500, 7, N'Cá'),
	(N'Staff', N'Thịt Heo', '2022/12/24', '2023/03/19', 3500, 5, N'Thịt')



--Thêm dữ liệu cho Salary
INSERT INTO [dbo].[salary]
VALUES (N'UserName', )
---------------------------------------------------------------------------------------
--tạo bảng demo_salary để text ý tưởng
create table salary_demo
(
	UserName NVARCHAR(100),
	DateStart date not null,
	status bit NOT NULL,
	WORKDAY int,
	--restday int, --bỏ dữ liệu này
	wagelevel float,
	bonus float,
	punish float,
	total float,
	
	--primary key (username , DateStart),
	primary key (username,DateStart),
	foreign key (username) references dbo.account(username)
)

--Thêm dữ liệu cho Salary_demo
INSERT INTO [dbo].[salary_demo]
VALUES (N'staff', '2012/10/05', 1,12,10000,null,null,null),
(N'k9', '2012/10/06', 1,12,15000,null,null,null),
(N'staff', '2012/09/05', 0,12,10000,0,0,120000),
(N'k9', '2012/09/06', 0,12,15000,1000,0,181000)

--Tạo bảng điểm [attendance] danh 1 nhánh của Salary_demo
create table attendance
(
	UserName NVARCHAR(100) not null,
	DateStart date not null,
	absent bit DEFAULT 0,
	present bit DEFAULT 0,
	dateCheck date not null,
	
	--primary key(DateStart)
	FOREIGN KEY(UserName,DateStart) REFERENCES salary_demo(UserName,DateStart)
)
drop table attendance

--thêm dữ liệu cho bảng [attendance]
INSERT INTO DBO.attendance
VALUES (N'k9', '2012/10/06', 1,1, '2012/10/07'),
(N'staff', '2012/10/05', 1,0, '2012/10/06'),
(N'staff', '2012/10/05', 1,1, '2012/10/07'),
(N'staff', '2012/10/05', 1,1, '2012/10/08'),
(N'staff', '2012/10/05',0,1, '2012/10/09')

---------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--In thông tin cho nhân viên để điểm danh
CREATE PROC SP_ViewAttendanceForStaff
(@USERNAME NVARCHAR(100))
AS
BEGIN
	SELECT attendance.UserName,attendance.DateStart,attendance.absent,attendance.present,attendance.dateCheck
	FROM attendance, salary_demo
	WHERE attendance.UserName = @USERNAME AND attendance.UserName = salary_demo.Username AND salary_demo.status = 1 AND salary_demo.DateStart = attendance.dateStart
END

--thêm dữ liệu vào bảng [attendance] khi người dùng nhấn vào ô checkBox
CREATE PROC SP_addAttendanceByStaff
(@USERNAME NVARCHAR(100))
AS
BEGIN
	DECLARE @DateStart date 
	SET @DateStart = (SELECT DATESTART 
						FROM salary_demo
						WHERE @USERNAME = UserName AND STATUS = 1)
	
	INSERT INTO dbo.attendance(UserName,DateStart,absent,present,dateCheck)
	VALUES(@USERNAME,@DateStart,0,1,GETDATE())
END

--In thông tin lương cho nhân viên
CREATE PROC SP_viewSalary
(@USERNAME NVARCHAR(100))
AS
BEGIN
	SELECT UserName AS [Tên Người Dùng],DateStart AS [Ngày Tính Lương],WORKDAY AS [Số Ngày Làm],wagelevel AS [Mức Lương],bonus AS [Thưởng],punish AS [Phạt], total AS [Tổng]
	FROM salary_demo
	WHERE @USERNAME = UserName AND STATUS = 1
END

--Tạo Trigger để người dùng hay admin điểm danh chỉ đc tạo dữ liệu điểm danh trong ngày một lần của một nhân viên
CREATE TRIGGER  DT_OnlyAddOneTimeToAttendance 
ON attendance
AFTER INSERT
AS
if (select attendance.dateCheck 
	from attendance inner join inserted 
	on inserted.UserName = attendance.Username and inserted.DateStart = attendance.DateStart and inserted.dateCheck = attendance.dateCheck)
	=
	(select attendance.dateCheck
	from attendance, inserted
	where inserted.UserName = attendance.Username and inserted.DateStart = attendance.DateStart and attendance.dateCheck = GETDATE())
BEGIN
	PRINT N'Đã có dữ liệu điểm danh cho ngày hôm nay'
	rollback tran
END

--Thêm dữ liệu vào bảng [Attendance] khi nhân viên nhấn vào child form Chấm Công với những nhân viên chưa được thêm dữ liệu
CREATE PROC SP_ADDATTENDANCEBYADMIN AS
BEGIN
	
END

--Cập nhật vào bảng attendance khi admin nhấn vào 1 trong 2 ô check box
CREATE PROC SP_UPDATEPRESENT(@UserName NVARCHAR(100),@DateCheck Date) AS
BEGIN
	UPDATE attendance
	SET present = 1, absent =0
	where @UserName = attendance.UserName and dateCheck = @DateCheck
END
GO
CREATE PROC SP_UPDATEABSENT(@UserName NVARCHAR(100),@DateCheck Date) AS
BEGIN
	UPDATE attendance
	SET present = 0, absent =1
	where @UserName = attendance.UserName and dateCheck = @DateCheck
END

--In ra dữ liệu khi nhấn vào nút View nhưng ô input không có dữ liệu
CREATE PROC SP_VIEWSTAFFATTENDANCE AS
BEGIN
	SELECT salary_demo.UserName AS [Tên Nhân Viên], salary_demo.DateStart AS [Ngày Tính Lương],salary_demo.status AS [Trạng thái]
	FROM salary_demo
	WHERE status = 1
END

--In ra thông tin điểm danh của người dùng mà admin muốn xem và chỉnh sửa
CREATE PROC SP_VIEWSTAFFATTENDANCEONLYONE (@UserName NVARCHAR(100)) AS
BEGIN
	SELECT attendance.UserName AS [Tên Nhân Viên], attendance.DateStart AS [Ngày Tính Lương], attendance.absent AS [Vắng], attendance.present AS [Có mặt], attendance.dateCheck AS [Ngày Điểm Danh]
	FROM attendance, salary_demo s
	WHERE attendance.UserName = @UserName AND attendance.UserName = s.UserName AND status = 1 AND s.DateStart = attendance.DateStart
END

--In ra thông tin lương của người dùng đang trong trạng thái ON để add/delete/edit
CREATE PROC SP_VIEWSALARYINTIMEKEEPING AS
BEGIN
	SELECT UserName AS [Tên Nhân Viên], DateStart AS [Ngày Tính Lương], status AS [Trạng thái], wagelevel AS [Mức Lương], bonus AS [Thưởng], punish AS [Phạt]
	FROM salary_demo
END

--Thêm dữ liệu vào bảng salary_demo
CREATE PROC SP_ADDSALARY
(@UserName NVARCHAR(100),
@DateStart DATE,
@status bit,
@wagelevel float)
AS
BEGIN
	INSERT INTO salary_demo
	VALUES(@UserName,@DateStart,@status,0,@wagelevel,0,0,0)
END

--Xóa dữ liệu của bảng salary_demo
CREATE PROC SP_DELETESALARY
(@UserName NVARCHAR(100),
@DateStart DATE)
AS
BEGIN
	DELETE FROM salary_demo
	WHERE UserName = @UserName AND DateStart = @DateStart
END

--Chỉnh sửa dữ liệu trong bảng salary_demo
CREATE PROC SP_EDITSALARY
(@USERNAME NVARCHAR(100),
@DATESTART DATE,
@STATUS BIT,
@WAGELEVEL FLOAT,
@BONUS FLOAT,
@PUNISH FLOAT)
AS
BEGIN
	UPDATE salary_demo
	SET status = @STATUS, wagelevel = @WAGELEVEL, bonus = @BONUS, punish = @PUNISH
	WHERE UserName = @USERNAME AND DateStart = @DATESTART
END

--In thông tin lương nhân viên theo tên
CREATE PROC SP_VIEWSALARYSTAFFBYUSERNAME
(@USERNAME NVARCHAR(100))
AS
BEGIN
	SELECT UserName AS [Tên Nhân Viên], DateStart AS [Ngày Tính Lương], status AS [Trạng thái], WORKDAY AS [Số Ngày Làm], wagelevel AS [Mức Lương], bonus AS [Thưởng], punish AS [Phạt], total AS [Tổng Lương]
	FROM salary_demo
	WHERE UserName = @USERNAME
END

--In thông tin lương nhân viên theo tháng
CREATE PROC SP_VIEWSALARYSTAFFBYMOUNTH
(@MOUNTH int)
AS
BEGIN
	SELECT UserName AS [Tên Nhân Viên], DateStart AS [Ngày Tính Lương], status AS [Trạng thái], WORKDAY AS [Số Ngày Làm], wagelevel AS [Mức Lương], bonus AS [Thưởng], punish AS [Phạt], total AS [Tổng Lương]
	FROM salary_demo
	WHERE MONTH(DateStart) = MONTH(@MOUNTH) AND status = 1
END

--In tất cả thông tin nhân viên có tài khoản tính lương đang ON
CREATE PROC SP_VIEWALLSALARYTHENSTATUSON AS
BEGIN
	SELECT UserName AS [Tên Nhân Viên], DateStart AS [Ngày Tính Lương], status AS [Trạng thái], WORKDAY AS [Số Ngày Làm], wagelevel AS [Mức Lương], bonus AS [Thưởng], punish AS [Phạt], total AS [Tổng Lương]
	FROM salary_demo
	WHERE status = 1
END

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--19-12-2022
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--TẠO SP THÊM DỮ LIỆU CHO NHỮNG NHÂN VIÊN CHƯA ĐIỂM DANH
CREATE proc sp_addallattendance
as
begin
	
	SELECT USERNAME INTO TEMP_DIEMDANH FROM ACCOUNT WHERE USERNAME NOT IN ( SELECT USERNAME FROM DA_DIEMDANH)
	
	DECLARE @COUNT INT
	SELECT @COUNT = COUNT(*) FROM TEMP_DIEMDANH
	
	DECLARE @I INT = 0
	WHILE (@I < @COUNT)
		BEGIN 
			DECLARE @username NVARCHAR (100)
			select @username =  USERNAME FROM TEMP_DIEMDANH WHERE ( @@ROWCOUNT = @I)
				
			insert into attendance
			values (@username,'2022/12/10', 0, 0, GETDATE())
			
			set @I = @I + 1 
		END
		
	DROP TABLE 	TEMP_DIEMDANH
end

ALTER proc sp_addallattendance
as
begin
	
	SELECT USERNAME INTO TEMP_DIEMDANH FROM ACCOUNT WHERE USERNAME NOT IN ( SELECT USERNAME FROM DA_DIEMDANH)
	
	DECLARE @COUNT INT
	SELECT @COUNT = COUNT(*) FROM TEMP_DIEMDANH
	
	PRINT 'DONE 1'

	DECLARE @I INT = 1
	WHILE (@I <= @COUNT)
		BEGIN 
			PRINT @I
			PRINT 'DONE 3'
			DECLARE @username NVARCHAR (100)
			SET @username =    (SELECT USERNAME  FROM (select  USERNAME  ,ROW_NUMBER() OVER (ORDER BY USERNAME) ROWNUM
							   FROM  TEMP_DIEMDANH ) T1
							   WHERE ROWNUM =@I)
				
			insert into attendance
			values (@username,'2022/12/10', 0, 0, GETDATE())
			
			set @I = @I + 1 
			
		END
		
	PRINT 'DONE 2'
	DROP TABLE 	TEMP_DIEMDANH
end
EXEC sp_addallattendance

--TẠO VIEW ĐIỂM DANH
CREATE VIEW DA_DIEMDANH 
AS
	select distinct (s.Username),s.dateStart 
	from salary_demo s, attendance a
	where status = 1 and s.DateStart = a.dateStart and s.UserName = a.UserName and not dateCheck = CAST( GETDATE() AS Date )

--THÊM DỮ LIỆU CHO ACCOUNT
INSERT INTO Account VALUES ( N'ĐẠT' , 'Đ' , 1 , 1)

--THÊM DỮ IỆU VÀO salary_demo
INSERT INTO salary_demo VALUES (N'ĐẠT' , '2022/12/10' , 1  ,0, 1000,0,0,0)

--CHẠY DEMO HÀM [[[[CAST( GETDATE() AS Date )]]]]
select * from attendance where DateCheck = CAST( GETDATE() AS Date )
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--20/12/2022
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Tạo triger tính tổng số lương của nhân viên
CREATE TRIGGER DT_TOTALSALARY ON salary_demo
FOR INSERT, UPDATE
AS
BEGIN
	DECLARE @USERNAME NVARCHAR(100), @DATESTART DATE
	SET @USERNAME = (SELECT UserName FROM inserted)
	SET @DATESTART = (SELECT DateStart FROM inserted)
	UPDATE salary_demo
	SET total = wagelevel*WORKDAY + bonus - punish
	WHERE UserName = @USERNAME AND DateStart = @DATESTART AND status = 1
END

--Tạo trigger tính tổng số ngày làm trong bảng salary_demo theo bảng attendance
CREATE TRIGGER DT_TOTALWORKDAYINSALARY ON attendance
FOR INSERT, UPDATE
AS
BEGIN
	DECLARE @USERNAME NVARCHAR(100), @DATESTART DATE
	SET @USERNAME = (SELECT UserName FROM inserted)
	SET @DATESTART = (SELECT DateStart FROM inserted)
	UPDATE salary_demo
	SET WORKDAY = (SELECT COUNT(attendance.present) 
					FROM attendance, salary_demo, inserted
					WHERE ATTENDANCE.present = 1 AND status = 1 AND
							inserted.UserName = attendance.UserName AND inserted.DateStart = attendance.DateStart AND
							salary_demo.UserName = attendance.UserName AND salary_demo.DateStart = attendance.DateStart)
	WHERE status = 1 AND UserName = @USERNAME AND DateStart = @DATESTART
END
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Dữ liệu của form Customer
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--TẠO BẢNG MỚI KHÁCH HÀNG
CREATE TABLE CUSTOMER
(
	IDBILL INT FOREIGN KEY REFERENCES BILL (IDBILL) UNIQUE,
	TOTALBILL int ,
	NAMECUSTOMER NVARCHAR (100) ,
	SDT VARCHAR (12) CONSTRAINT CK_SDT CHECK (SDT LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'
												 OR SDT LIKE'[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'
												 OR SDT LIKE'[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'
												 OR SDT LIKE'[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'
												 OR SDT IS NULL),
	
	DIACHI NVARCHAR(100) ,
	PRIMARY KEY (IDBILL,NAMECUSTOMER,SDT,DIACHI)
)

DROP TABLE CUSTOMER



SELECT COUNT (NAMECUSTOMER) FROM CUSTOMER


--///////////////////////////THÊM XÓA SỬA BÀN
--TẠO PROC INSERT BÀN
create PROC INSERT_TABLE 
AS
	BEGIN 
	DECLARE @ROW INT , @TENBAN VARCHAR(10)
	SELECT @ROW = COUNT (NAME) FROM TABLEFOOD 
		SET @TENBAN = N'BÀN' + ' ' + CONVERT(VARCHAR(4),@ROW)
		INSERT INTO TABLEFOOD VALUES (@TENBAN ,N'Trống')
	END

EXEC INSERT_TABLE 

update TABLEFOOD SET STATUS = N'CÓ NGƯỜI',NAME =N'VIP' WHERE IDTABLEFOOD = 16

--DELETE

DELETE BILLINFO WHERE IDBILL IN 
(SELECT BF.IDBILL 
FROM BILLINFO BF , BILL B , TABLEFOOD T 
WHERE BF.IDBILL = B.IDBILL AND T.IDTABLEFOOD = B.IDTABLEFOOD AND T.IDTABLEFOOD =1)

DELETE BILL WHERE IDBILL IN(SELECT B.IDBILL FROM  BILL B, TABLEFOOD T WHERE T.IDTABLEFOOD = B.IDTABLEFOOD AND T.IDTABLEFOOD = 1)


--////////////////////////////////CUSTOMER FORM
--tạo PROC tự đông tính TOTALBILL

create PROC INSERT_CUSTOMER @IDBILL INT , @NAMECUSTOMER NVARCHAR(100) , @SDT VARCHAR(12) , @DIACHI NVARCHAR(100)
AS
	BEGIN
	DECLARE @ROW INT , @TOTOLBILL INT
	SELECT @ROW = COUNT (NAMECUSTOMER) FROM CUSTOMER WHERE NAMECUSTOMER=@NAMECUSTOMER
		SET @TOTOLBILL = @ROW+1
		INSERT INTO CUSTOMER VALUES (@IDBILL,@TOTOLBILL,@NAMECUSTOMER,@SDT,@DIACHI)
	END



EXEC INSERT_CUSTOMER  50,N'ĐẠT','0384877305',N'TP.HCM'
go
EXEC INSERT_CUSTOMER  51,N'ĐẠT','0384877305',N'TP.HCM'
go
EXEC INSERT_CUSTOMER  51,N'NHIEN','0384877304',N'TP.HCM'


INSERT INTO CUSTOMER VALUES (50,1,N'ĐẠT','0384877305',N'TP.HCM')

select * from Customer where IDBill =50
select * from Customer 

UPDATE CUSTOMER SET IDBILL = 52 , NAMECUSTOMER=N'ĐẠT' , SDT ='0365227071' , DIACHI = N'HÀ NỘI' WHERE NAMECUSTOMER = N'NHIÊN' AND IDBILL=52


--tạo TRIGGER CẬP NHẬT LẠI THÔNG TIN TOTAL BILL
CREATE TRIGGER TOTALBILL ON CUSTOMER 
FOR UPDATE , INSERT , DELETE
AS
	BEGIN
	DECLARE @NAMECUSTOMEROLD NVARCHAR(100)
	SELECT @NAMECUSTOMEROLD= NAMECUSTOMER FROM deleted
	DECLARE @TOTALOLD INT
	SELECT @TOTALOLD = COUNT (*) FROM CUSTOMER WHERE NAMECUSTOMER = @NAMECUSTOMEROLD
	UPDATE CUSTOMER SET TOTALBILL = @TOTALOLD WHERE NAMECUSTOMER = @NAMECUSTOMEROLD

	DECLARE @NAMECUSTOMERNEW NVARCHAR(100)
	SELECT @NAMECUSTOMERNEW= NAMECUSTOMER FROM inserted
	DECLARE @TOTALNEW INT
	SELECT @TOTALNEW = COUNT (*) FROM CUSTOMER WHERE NAMECUSTOMER = @NAMECUSTOMERNEW
	UPDATE CUSTOMER SET TOTALBILL = @TOTALNEW WHERE NAMECUSTOMER = @NAMECUSTOMERNEW

	END

	UPDATE CUSTOMER SET NAMECUSTOMER = N'ĐẠT' WHERE IDBILL = 51


	--tạo PROC TÌM IDBILL

create PROC FIND_IDBILL @IDBILL INT
AS
	SELECT * FROM BILL WHERE IDBILL = @IDBILL

EXEC FIND_IDBILL 50


--tìm khách
SELECT * FROM CUSTOMER WHERE dbo.fuConvertToUnsign1(NAMECUSTOMER) LIKE N'%' + dbo.fuConvertToUnsign1(N'D') + '%'

--LIST HÓA ĐƠN HÔM NAY 
select * from bill where DATECHECKIN = convert(date,getdate())

print convert(date,getdate())

-- PHÂN TRANG



--LẤY 2 DÒNG ĐẦU
SELECT TOP 2 * FROM CUSTOMER



--LẤY 2 DÒNG GIỮA
--GIẢ SỬ 1 PAGE 2 DÒNG
--PAGECOUNT =2 
--PAGENUM = 2

SELECT TOP 4 * FROM CUSTOMER
EXCEPT
SELECT TOP 2 * FROM CUSTOMER

--
SELECT TOP (PAGECOUNT*PAGENUM) * FROM CUSTOMER
EXCEPT
SELECT TOP PAGECOUNT * FROM CUSTOMER


--tạp PROC

select (IDBILL) from bill where DATECHECKIN = convert(date,getdate())


CREATE PROC USP_GetListCustomerByPage_Today
@PAGE INT 
AS
	BEGIN
	DECLARE @PAGEROWS INT = 2 -- 1 TRNAG BAO NHIÊU DÒNG
	DECLARE @SELECTROWS INT = @PAGEROWS * @PAGE --SỐ DÒNG SẼ SELECT RA
	DECLARE @EXCEPTROWS INT = (@PAGE - 1) * @PAGEROWS --SỐ DÒNG TRỪ RA

	;WITH CustomerShow as ( SELECT * FROM CUSTOMER WHERE IDBILL IN (select (IDBILL) from bill where DATECHECKIN = convert(date,getdate())) )

	SELECT TOP (@SELECTROWS) * FROM CustomerShow
	EXCEPT
	SELECT TOP (@EXCEPTROWS) * FROM CustomerShow

	END


create PROC USP_GetListCustomerByPage
@PAGE INT 
AS
	BEGIN
	DECLARE @PAGEROWS INT = 5 -- 1 TRNAG BAO NHIÊU DÒNG
	DECLARE @SELECTROWS INT = @PAGEROWS * @PAGE --SỐ DÒNG SẼ SELECT RA
	DECLARE @EXCEPTROWS INT = (@PAGE - 1) * @PAGEROWS --SỐ DÒNG TRỪ RA

	;WITH CustomerShow as ( SELECT * FROM CUSTOMER  )

	SELECT TOP (@SELECTROWS) * FROM CustomerShow WHERE IDBILL NOT IN
	(SELECT TOP (@EXCEPTROWS) IDBILL FROM CustomerShow)

	END

--PAGE SẼ BẮT ĐẦU TỪ 1
EXEC USP_GetListCustomerByPage 2

--xác định số lượng IDBILL trong customer

CREATE PROC USP_GetNumIDBill
as
	BEGIN
	SELECT COUNT (IDBILL) FROM CUSTOMER
	END


EXEC USP_GetListCustomerByPage 1

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


