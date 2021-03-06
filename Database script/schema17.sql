USE [master]
GO
/****** Object:  Database [Schema17]    Script Date: 6/24/2022 4:15:45 PM ******/
CREATE DATABASE [Schema17]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Schema17', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Schema17.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Schema17_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Schema17_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Schema17] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Schema17].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Schema17] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Schema17] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Schema17] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Schema17] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Schema17] SET ARITHABORT OFF 
GO
ALTER DATABASE [Schema17] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Schema17] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Schema17] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Schema17] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Schema17] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Schema17] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Schema17] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Schema17] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Schema17] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Schema17] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Schema17] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Schema17] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Schema17] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Schema17] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Schema17] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Schema17] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Schema17] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Schema17] SET RECOVERY FULL 
GO
ALTER DATABASE [Schema17] SET  MULTI_USER 
GO
ALTER DATABASE [Schema17] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Schema17] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Schema17] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Schema17] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Schema17] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Schema17] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Schema17', N'ON'
GO
ALTER DATABASE [Schema17] SET QUERY_STORE = OFF
GO
USE [Schema17]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 6/24/2022 4:15:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustId] [int] NOT NULL,
	[Custname] [varchar](255) NOT NULL,
	[Shippingaddress] [varchar](255) NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Items]    Script Date: 6/24/2022 4:15:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Items](
	[ItemId] [int] NOT NULL,
	[ItemName] [varchar](255) NOT NULL,
	[Supplier] [int] NOT NULL,
	[Price] [float] NOT NULL,
 CONSTRAINT [PK_Items] PRIMARY KEY CLUSTERED 
(
	[ItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Newsletter]    Script Date: 6/24/2022 4:15:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Newsletter](
	[LetterId] [int] NOT NULL,
	[NewsLetterName] [varchar](255) NOT NULL,
	[Version] [varchar](255) NOT NULL,
 CONSTRAINT [PK_Newsletter] PRIMARY KEY CLUSTERED 
(
	[LetterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalesInvoice]    Script Date: 6/24/2022 4:15:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesInvoice](
	[SalesInvoiceId] [int] NOT NULL,
	[CustId] [int] NULL,
	[ItemId] [int] NULL,
	[Date] [date] NULL,
 CONSTRAINT [PK_SalesInvoice] PRIMARY KEY CLUSTERED 
(
	[SalesInvoiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subscription]    Script Date: 6/24/2022 4:15:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subscription](
	[SubscriptionId] [int] NOT NULL,
	[CustId] [int] NOT NULL,
	[Newsletter] [int] NOT NULL,
 CONSTRAINT [PK_Subscription] PRIMARY KEY CLUSTERED 
(
	[SubscriptionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 6/24/2022 4:15:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[SupplierId] [int] NOT NULL,
	[SupplierName] [varchar](255) NOT NULL,
	[Phone] [varchar](255) NOT NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[SupplierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Items]  WITH CHECK ADD  CONSTRAINT [FK_Items_Supplier] FOREIGN KEY([Supplier])
REFERENCES [dbo].[Supplier] ([SupplierId])
GO
ALTER TABLE [dbo].[Items] CHECK CONSTRAINT [FK_Items_Supplier]
GO
ALTER TABLE [dbo].[SalesInvoice]  WITH CHECK ADD  CONSTRAINT [FK_SalesInvoice_Customer] FOREIGN KEY([CustId])
REFERENCES [dbo].[Customer] ([CustId])
GO
ALTER TABLE [dbo].[SalesInvoice] CHECK CONSTRAINT [FK_SalesInvoice_Customer]
GO
ALTER TABLE [dbo].[SalesInvoice]  WITH CHECK ADD  CONSTRAINT [FK_SalesInvoice_Items] FOREIGN KEY([ItemId])
REFERENCES [dbo].[Items] ([ItemId])
GO
ALTER TABLE [dbo].[SalesInvoice] CHECK CONSTRAINT [FK_SalesInvoice_Items]
GO
ALTER TABLE [dbo].[Subscription]  WITH CHECK ADD  CONSTRAINT [FK_Subscription_Customer] FOREIGN KEY([CustId])
REFERENCES [dbo].[Customer] ([CustId])
GO
ALTER TABLE [dbo].[Subscription] CHECK CONSTRAINT [FK_Subscription_Customer]
GO
ALTER TABLE [dbo].[Subscription]  WITH CHECK ADD  CONSTRAINT [FK_Subscription_Newsletter] FOREIGN KEY([Newsletter])
REFERENCES [dbo].[Newsletter] ([LetterId])
GO
ALTER TABLE [dbo].[Subscription] CHECK CONSTRAINT [FK_Subscription_Newsletter]
GO
USE [master]
GO
ALTER DATABASE [Schema17] SET  READ_WRITE 
GO
