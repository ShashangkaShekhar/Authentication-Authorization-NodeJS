USE [master]
GO
/****** Object:  Database [ExpressJWTPass]    Script Date: 9/14/2018 12:14:08 PM ******/
CREATE DATABASE [ExpressJWTPass]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ExpressJWTPass', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\ExpressJWTPass.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ExpressJWTPass_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\ExpressJWTPass_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ExpressJWTPass].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ExpressJWTPass] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ExpressJWTPass] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ExpressJWTPass] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ExpressJWTPass] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ExpressJWTPass] SET ARITHABORT OFF 
GO
ALTER DATABASE [ExpressJWTPass] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ExpressJWTPass] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ExpressJWTPass] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ExpressJWTPass] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ExpressJWTPass] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ExpressJWTPass] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ExpressJWTPass] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ExpressJWTPass] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ExpressJWTPass] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ExpressJWTPass] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ExpressJWTPass] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ExpressJWTPass] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ExpressJWTPass] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ExpressJWTPass] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ExpressJWTPass] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ExpressJWTPass] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ExpressJWTPass] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ExpressJWTPass] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ExpressJWTPass] SET  MULTI_USER 
GO
ALTER DATABASE [ExpressJWTPass] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ExpressJWTPass] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ExpressJWTPass] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ExpressJWTPass] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
USE [ExpressJWTPass]
GO
/****** Object:  Table [dbo].[customers]    Script Date: 9/14/2018 12:14:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customers](
	[customerId] [int] NOT NULL,
	[customerName] [nvarchar](50) NULL,
	[customerContact] [nvarchar](50) NULL,
	[customerEmail] [nvarchar](50) NULL,
 CONSTRAINT [PK_customers] PRIMARY KEY CLUSTERED 
(
	[customerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 9/14/2018 12:14:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[userId] [int] NOT NULL,
	[userName] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[usertype] [nvarchar](50) NULL,
	[canEdit] [bit] NULL,
	[canDelete] [bit] NULL,
	[canCreate] [bit] NULL,
	[canView] [bit] NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[users] ([userId], [userName], [password], [usertype], [canEdit], [canDelete], [canCreate], [canView]) VALUES (1, N'shashangka', N'12345', N'admin', 1, 1, 1, 1)
INSERT [dbo].[users] ([userId], [userName], [password], [usertype], [canEdit], [canDelete], [canCreate], [canView]) VALUES (2, N'ishani', N'12345', N'editor', 1, 1, 1, 1)
/****** Object:  StoredProcedure [dbo].[DeleteCustomersByID]    Script Date: 9/14/2018 12:14:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteCustomersByID]
	-- Add the parameters for the stored procedure here
	@customerId INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM [dbo].[customers] WHERE [customerId] = @customerId
END
GO
/****** Object:  StoredProcedure [dbo].[GetCustomers]    Script Date: 9/14/2018 12:14:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetCustomers]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [customerId],[customerName],[customerContact],[customerEmail]
	FROM [dbo].[customers]
END
GO
/****** Object:  StoredProcedure [dbo].[GetCustomersByID]    Script Date: 9/14/2018 12:14:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetCustomersByID]
	-- Add the parameters for the stored procedure here
	@customerId INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [customerId],[customerName],[customerContact],[customerEmail]
	FROM [dbo].[customers] WHERE [customerId] = @customerId
END
GO
/****** Object:  StoredProcedure [dbo].[GetUserAuthentication]    Script Date: 9/14/2018 12:14:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetUserAuthentication]
	-- Add the parameters for the stored procedure here
	@username nvarchar(50),
	@password nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [userId],[userName],[usertype]--,[canEdit],[canDelete],[canCreate],[canView]
	FROM [dbo].[users]
	WHERE [userName] = @username AND [password] = @password
END
GO
/****** Object:  StoredProcedure [dbo].[GetUserAuthorization]    Script Date: 9/14/2018 12:14:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetUserAuthorization]
	@Userid NVarchar(250),
	@Methodtype NVarchar(250)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT CASE WHEN result = 1 THEN 'true' ELSE 'false' END AS permission FROM
	(
		SELECT CASE
		   WHEN @Methodtype = 'GET' THEN [CanView]
		   WHEN @Methodtype = 'POST' THEN [canCreate]
		   WHEN @Methodtype = 'PUT' THEN [canEdit]
		   WHEN @Methodtype = 'DELETE' THEN [CanDelete]
		   ELSE 0
		   END AS result

		FROM [dbo].[users] WHERE [userId] = @Userid
	)AUTH  
END

--EXEC GetUserAuthorization '2', 'POST'
GO
/****** Object:  StoredProcedure [dbo].[SaveCustomer]    Script Date: 9/14/2018 12:14:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SaveCustomer]
	-- Add the parameters for the stored procedure here
	@customerId INT,
	@customerName Nvarchar(50),
	@customerContact Nvarchar(50),
	@customerEmail Nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF(@customerId>0)
	BEGIN
		Update [dbo].[customers]
			SET [customerName] = @customerName,
			[customerContact] = @customerContact,
			[customerEmail] = @customerEmail
			Where [customerId] = @customerId
	END
	ELSE
	BEGIN
		DECLARE @custId INT
		SET @custId = ISNULL(((SELECT MAX(customerId) FROM [dbo].[customers])+1),'1');

		-- Insert statements for procedure here
		Insert Into [dbo].[customers]
		([customerId],[customerName],[customerContact],[customerEmail])
		Values
		(@custId,@customerName,@customerContact,@customerEmail)
	END
END
GO
USE [master]
GO
ALTER DATABASE [ExpressJWTPass] SET  READ_WRITE 
GO
