USE [master]
GO
/****** Object:  Database [phonestore_duan1]    Script Date: 12/4/2022 9:01:53 PM ******/
CREATE DATABASE [phonestore_duan1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'phonestore_duan1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\phonestore_duan1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'phonestore_duan1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\phonestore_duan1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [phonestore_duan1] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [phonestore_duan1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [phonestore_duan1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [phonestore_duan1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [phonestore_duan1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [phonestore_duan1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [phonestore_duan1] SET ARITHABORT OFF 
GO
ALTER DATABASE [phonestore_duan1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [phonestore_duan1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [phonestore_duan1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [phonestore_duan1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [phonestore_duan1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [phonestore_duan1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [phonestore_duan1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [phonestore_duan1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [phonestore_duan1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [phonestore_duan1] SET  DISABLE_BROKER 
GO
ALTER DATABASE [phonestore_duan1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [phonestore_duan1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [phonestore_duan1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [phonestore_duan1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [phonestore_duan1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [phonestore_duan1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [phonestore_duan1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [phonestore_duan1] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [phonestore_duan1] SET  MULTI_USER 
GO
ALTER DATABASE [phonestore_duan1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [phonestore_duan1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [phonestore_duan1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [phonestore_duan1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [phonestore_duan1] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [phonestore_duan1] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [phonestore_duan1] SET QUERY_STORE = OFF
GO
USE [phonestore_duan1]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 12/4/2022 9:01:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[id] [nvarchar](50) NOT NULL,
	[name] [nvarchar](100) NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 12/4/2022 9:01:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[customerId] [nvarchar](50) NOT NULL,
	[fullname] [nvarchar](50) NULL,
	[phone] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[gender] [bit] NULL,
	[birthday] [date] NULL,
	[createdate] [date] NULL,
	[address] [nvarchar](200) NULL,
	[notes] [nvarchar](300) NULL,
	[purchaseTimes] [int] NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[customerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetalis]    Script Date: 12/4/2022 9:01:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetalis](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[productId] [nvarchar](50) NOT NULL,
	[orderId] [nvarchar](50) NOT NULL,
	[quatity] [int] NOT NULL,
	[totalPrice] [float] NOT NULL,
 CONSTRAINT [PK_OrderDetalis] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 12/4/2022 9:01:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[orderId] [nvarchar](50) NOT NULL,
	[total] [float] NULL,
	[createDate] [date] NULL,
	[customerId] [nvarchar](50) NULL,
	[voucherCode] [nvarchar](50) NULL,
	[discount] [float] NULL,
	[memberDiscount] [float] NULL,
	[status] [nvarchar](50) NULL,
	[creator] [nvarchar](50) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[orderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 12/4/2022 9:01:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[productId] [nvarchar](50) NOT NULL,
	[title] [nvarchar](100) NULL,
	[image] [nvarchar](500) NULL,
	[price] [float] NULL,
	[importprice] [float] NULL,
	[ram] [int] NULL,
	[rom] [int] NULL,
	[quatity] [int] NULL,
	[color] [nvarchar](50) NULL,
	[companyId] [nvarchar](50) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[productId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Salary]    Script Date: 12/4/2022 9:01:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Salary](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [nvarchar](50) NULL,
	[basicSalary] [float] NULL,
	[commission] [float] NULL,
	[advanceSalary] [float] NULL,
	[salaryDeducted] [float] NULL,
	[bonus] [float] NULL,
	[startDate] [date] NULL,
	[endDate] [date] NULL,
	[numberDay] [float] NULL,
	[totalSalary] [float] NULL,
	[receivedDate] [date] NULL,
	[notes] [nvarchar](300) NULL,
 CONSTRAINT [PK_Salary] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 12/4/2022 9:01:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[image] [nvarchar](200) NULL,
	[fullname] [nvarchar](50) NULL,
	[gender] [bit] NULL,
	[role] [bit] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vouchers]    Script Date: 12/4/2022 9:01:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vouchers](
	[voucherCode] [nvarchar](50) NOT NULL,
	[name] [nvarchar](100) NULL,
	[discountByPrice] [float] NULL,
	[discountByPercent] [float] NULL,
	[startDate] [date] NULL,
	[endDate] [date] NULL,
	[amountApplied] [float] NULL,
	[maximumAmount] [float] NULL,
	[notes] [nvarchar](300) NULL,
 CONSTRAINT [PK_Vouchers] PRIMARY KEY CLUSTERED 
(
	[voucherCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OrderDetalis]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetalis_Orders] FOREIGN KEY([orderId])
REFERENCES [dbo].[Orders] ([orderId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetalis] CHECK CONSTRAINT [FK_OrderDetalis_Orders]
GO
ALTER TABLE [dbo].[OrderDetalis]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetalis_Products] FOREIGN KEY([productId])
REFERENCES [dbo].[Products] ([productId])
GO
ALTER TABLE [dbo].[OrderDetalis] CHECK CONSTRAINT [FK_OrderDetalis_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customer] FOREIGN KEY([customerId])
REFERENCES [dbo].[Customer] ([customerId])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customer]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users] FOREIGN KEY([creator])
REFERENCES [dbo].[Users] ([username])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Users]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Vouchers] FOREIGN KEY([voucherCode])
REFERENCES [dbo].[Vouchers] ([voucherCode])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Vouchers]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Company] FOREIGN KEY([companyId])
REFERENCES [dbo].[Brand] ([id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Company]
GO
ALTER TABLE [dbo].[Salary]  WITH CHECK ADD  CONSTRAINT [FK_Salary_Users] FOREIGN KEY([userId])
REFERENCES [dbo].[Users] ([username])
GO
ALTER TABLE [dbo].[Salary] CHECK CONSTRAINT [FK_Salary_Users]
GO
/****** Object:  StoredProcedure [dbo].[spTop5Product]    Script Date: 12/4/2022 9:01:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spTop5Product]
as 
begin 
declare @thongke table(productId nvarchar(50),total float)
                insert into @thongke select top(5)productId,SUM(quatity) from OrderDetalis group by productId order by sum(quatity) desc
                select * from Products a inner join @thongke b on a.productId=b.productId
end
GO
/****** Object:  StoredProcedure [dbo].[spTotalProfitByDate]    Script Date: 12/4/2022 9:01:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spTotalProfitByDate](@date date)
as
begin
declare @Tong table(orderId nvarchar(50),total float)
insert into @Tong select orderId,SUM(a.quatity*importprice) from OrderDetalis a inner join Products b on a.productId=b.productId group by orderId
declare @Thongke table (id nvarchar(50),total float)
insert into @Thongke select a.orderId,(a.total-b.total) from Orders a inner join @Tong b on a.orderId=b.orderId where createDate = @date

select sum(total) from @Thongke
end
GO
/****** Object:  StoredProcedure [dbo].[spTotalProfitByMonth]    Script Date: 12/4/2022 9:01:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[spTotalProfitByMonth](@month nvarchar(50))
as
begin
declare @Tong table(orderId nvarchar(50),total float)
insert into @Tong select orderId,SUM(a.quatity*importprice) from OrderDetalis a inner join Products b on a.productId=b.productId group by orderId
declare @Thongke table (id nvarchar(50),total float)
insert into @Thongke select a.orderId,(a.total-b.total) from Orders a inner join @Tong b on a.orderId=b.orderId where Month(createDate)=@month

select sum(total) from @Thongke
end
GO
USE [master]
GO
ALTER DATABASE [phonestore_duan1] SET  READ_WRITE 
GO
