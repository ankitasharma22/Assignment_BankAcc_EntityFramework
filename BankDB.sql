USE [master]
GO
/****** Object:  Database [BankAccount]    Script Date: 7/29/2018 8:02:38 PM ******/
CREATE DATABASE [BankAccount]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BankAccount', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\BankAccount.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BankAccount_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\BankAccount_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BankAccount] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BankAccount].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BankAccount] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BankAccount] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BankAccount] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BankAccount] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BankAccount] SET ARITHABORT OFF 
GO
ALTER DATABASE [BankAccount] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BankAccount] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [BankAccount] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BankAccount] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BankAccount] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BankAccount] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BankAccount] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BankAccount] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BankAccount] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BankAccount] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BankAccount] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BankAccount] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BankAccount] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BankAccount] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BankAccount] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BankAccount] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BankAccount] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BankAccount] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BankAccount] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BankAccount] SET  MULTI_USER 
GO
ALTER DATABASE [BankAccount] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BankAccount] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BankAccount] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BankAccount] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [BankAccount]
GO
/****** Object:  StoredProcedure [dbo].[Bank_CreateCustomer]    Script Date: 7/29/2018 8:02:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[Bank_CreateCustomer]

@Amount int,

@Name varchar(40),

@Type varchar(15)

as

Begin

	insert into BankDetails( Amount, AccountHolder, AccountType) values (@Amount,@Name,@Type);

End
GO
/****** Object:  StoredProcedure [dbo].[Bank_Deposit]    Script Date: 7/29/2018 8:02:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[Bank_Deposit]
@Account int,
@AmountToBeAdded int
as
Begin
	update BankDetails set Amount = @AmountToBeAdded + Amount
End

GO
/****** Object:  StoredProcedure [dbo].[Bank_GetAccountType]    Script Date: 7/29/2018 8:02:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[Bank_GetAccountType]

@AccountType varchar(40)
as

Begin

	select AccountType from BankDetails where AccountType = @AccountType

End

GO
/****** Object:  StoredProcedure [dbo].[Bank_GetAllDetails]    Script Date: 7/29/2018 8:02:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[Bank_GetAllDetails]
as
Begin
	select * from BankAccount
End
GO
/****** Object:  StoredProcedure [dbo].[Bank_GetAllDetails1]    Script Date: 7/29/2018 8:02:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[Bank_GetAllDetails1]
as
Begin
	select * from BankDetails
End
GO
/****** Object:  StoredProcedure [dbo].[Bank_SearchById]    Script Date: 7/29/2018 8:02:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[Bank_SearchById]
@Account int
as
Begin
	select * from BankDetails where AccountNumber = @Account
End

GO
/****** Object:  StoredProcedure [dbo].[Bank_Withdraw]    Script Date: 7/29/2018 8:02:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[Bank_Withdraw]
@Account int,

@AmountToBeWithdrawn int

as

Begin 

   update BankDetails set Amount = Amount - @AmountToBeWithdrawn where AccountNumber = @Account

End
GO
/****** Object:  Table [dbo].[BankDetails]    Script Date: 7/29/2018 8:02:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BankDetails](
	[AccountNumber] [int] IDENTITY(1000,1) NOT NULL,
	[Amount] [int] NOT NULL,
	[AccountHolder] [varchar](40) NOT NULL,
	[AccountType] [varchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AccountNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
USE [master]
GO
ALTER DATABASE [BankAccount] SET  READ_WRITE 
GO
