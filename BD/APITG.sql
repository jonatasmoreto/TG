USE [master]
GO
/****** Object:  Database [APITG]    Script Date: 14/06/2020 20:03:31 ******/
CREATE DATABASE [APITG]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'APITG', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\APITG.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'APITG_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\APITG_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [APITG] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [APITG].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [APITG] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [APITG] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [APITG] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [APITG] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [APITG] SET ARITHABORT OFF 
GO
ALTER DATABASE [APITG] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [APITG] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [APITG] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [APITG] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [APITG] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [APITG] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [APITG] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [APITG] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [APITG] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [APITG] SET  DISABLE_BROKER 
GO
ALTER DATABASE [APITG] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [APITG] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [APITG] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [APITG] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [APITG] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [APITG] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [APITG] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [APITG] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [APITG] SET  MULTI_USER 
GO
ALTER DATABASE [APITG] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [APITG] SET DB_CHAINING OFF 
GO
ALTER DATABASE [APITG] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [APITG] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [APITG] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [APITG] SET QUERY_STORE = OFF
GO
USE [APITG]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 14/06/2020 20:03:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](150) NOT NULL,
	[Email] [nvarchar](150) NOT NULL,
	[Logotipo] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Logradouros]    Script Date: 14/06/2020 20:03:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Logradouros](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Endereco] [nvarchar](200) NOT NULL,
	[ClienteId] [int] NOT NULL,
 CONSTRAINT [PK_Logradouro] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 14/06/2020 20:03:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](100) NOT NULL,
	[Senha] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([Id], [Nome], [Senha]) VALUES (1, N'tg', N'tg')
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Email_Unico]    Script Date: 14/06/2020 20:03:31 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Email_Unico] ON [dbo].[Clientes]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Logradouros]  WITH CHECK ADD  CONSTRAINT [FK_Logradouros_Clientes] FOREIGN KEY([ClienteId])
REFERENCES [dbo].[Clientes] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Logradouros] CHECK CONSTRAINT [FK_Logradouros_Clientes]
GO
/****** Object:  StoredProcedure [dbo].[sp_Cliente_Alterar]    Script Date: 14/06/2020 20:03:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Cliente_Alterar] 

	@Id int,
	@Nome nvarchar(150),
	@Email nvarchar(150),
	@Logotipo nvarchar(150)
	
AS
BEGIN

	SET NOCOUNT ON;

	UPDATE Clientes SET 
		Nome = @Nome,
		Email = @Email,
		Logotipo = @Logotipo
		WHERE Id = @Id

END
GO
/****** Object:  StoredProcedure [dbo].[sp_Cliente_Consultar]    Script Date: 14/06/2020 20:03:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Cliente_Consultar]
	-- Add the parameters for the stored procedure here
	@id int = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Id,Nome,Email,Logotipo FROM Clientes
	WHERE (@id IS NULL OR id = @id)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Cliente_Consultar_Email]    Script Date: 14/06/2020 20:03:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Cliente_Consultar_Email]
	-- Add the parameters for the stored procedure here	
	@email nvarchar(150)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Id,Nome,Email,Logotipo FROM Clientes
	WHERE Email = @email
	END
GO
/****** Object:  StoredProcedure [dbo].[sp_Cliente_Excluir]    Script Date: 14/06/2020 20:03:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Cliente_Excluir]
	@Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DELETE FROM Clientes Where Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Cliente_Incluir]    Script Date: 14/06/2020 20:03:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Cliente_Incluir] 
	-- Add the parameters for the stored procedure here
	@Nome nvarchar(150),
	@Email nvarchar(150),
	@Logotipo nvarchar(150),
	@retorno int out
AS
BEGIN

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Clientes(Nome,Email,Logotipo)VALUES(@Nome,@Email,@Logotipo)
	SELECT @retorno = SCOPE_IDENTITY()

END
GO
/****** Object:  StoredProcedure [dbo].[sp_ClientexLogradouros]    Script Date: 14/06/2020 20:03:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_ClientexLogradouros]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [Id]
      ,[Nome]
      ,[Email]
      ,[Logotipo]
      ,[Endereco]
  FROM [APITG].[dbo].[vw_ClientexLogradouro]
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Logradouro_Alterar]    Script Date: 14/06/2020 20:03:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Logradouro_Alterar] 

	@Id int,
	@Endereco nvarchar(200),
	@ClienteId int
	
AS
BEGIN

	SET NOCOUNT ON;

	UPDATE Logradouros SET 
		Endereco = @Endereco,
		ClienteId = @ClienteId	
		WHERE Id = @Id

END
GO
/****** Object:  StoredProcedure [dbo].[sp_Logradouro_Consultar]    Script Date: 14/06/2020 20:03:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Logradouro_Consultar]
	-- Add the parameters for the stored procedure here
	@id int = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Id,Endereco,ClienteId FROM Logradouros
	WHERE (@id IS NULL OR id = @id)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Logradouro_ConsultarPorCliente]    Script Date: 14/06/2020 20:03:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Logradouro_ConsultarPorCliente]
	-- Add the parameters for the stored procedure here
	@clienteId int = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Id,Endereco,ClienteId FROM Logradouros
	WHERE (@clienteId IS NULL OR ClienteId = @clienteId)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Logradouro_Excluir]    Script Date: 14/06/2020 20:03:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Logradouro_Excluir]
	@Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DELETE FROM Logradouros Where Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Logradouro_Incluir]    Script Date: 14/06/2020 20:03:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Logradouro_Incluir] 
	-- Add the parameters for the stored procedure here
	@Endereco nvarchar(200),
	@ClienteId int,
	@retorno int out
AS
BEGIN

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Logradouros(Endereco,ClienteId)VALUES(@Endereco, @ClienteId)
	SELECT @retorno = SCOPE_IDENTITY()	

END
GO
/****** Object:  StoredProcedure [dbo].[sp_Usuario_Consultar]    Script Date: 14/06/2020 20:03:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Usuario_Consultar]
	-- Add the parameters for the stored procedure here
	@nome nvarchar(100),
	@senha nvarchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Id,Nome,Senha FROM Usuarios
	WHERE (Nome = @nome AND Senha = @senha)
END
GO
USE [master]
GO
ALTER DATABASE [APITG] SET  READ_WRITE 
GO
