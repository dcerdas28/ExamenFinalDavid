USE [master]
GO
/****** Object:  Database [examenfinal]    Script Date: 23/4/2024 20:50:36 ******/
CREATE DATABASE [examenfinal]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'examenfinal', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\examenfinal.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'examenfinal_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\examenfinal_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [examenfinal] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [examenfinal].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [examenfinal] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [examenfinal] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [examenfinal] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [examenfinal] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [examenfinal] SET ARITHABORT OFF 
GO
ALTER DATABASE [examenfinal] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [examenfinal] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [examenfinal] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [examenfinal] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [examenfinal] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [examenfinal] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [examenfinal] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [examenfinal] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [examenfinal] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [examenfinal] SET  ENABLE_BROKER 
GO
ALTER DATABASE [examenfinal] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [examenfinal] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [examenfinal] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [examenfinal] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [examenfinal] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [examenfinal] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [examenfinal] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [examenfinal] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [examenfinal] SET  MULTI_USER 
GO
ALTER DATABASE [examenfinal] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [examenfinal] SET DB_CHAINING OFF 
GO
ALTER DATABASE [examenfinal] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [examenfinal] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [examenfinal] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [examenfinal] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [examenfinal] SET QUERY_STORE = ON
GO
ALTER DATABASE [examenfinal] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [examenfinal]
GO
/****** Object:  Table [dbo].[Agentes]    Script Date: 23/4/2024 20:50:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Agentes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Email] [varchar](100) NULL,
	[Telefono] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Casas]    Script Date: 23/4/2024 20:50:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Casas](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Direccion] [varchar](100) NULL,
	[Ciudad] [varchar](50) NULL,
	[Precio] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 23/4/2024 20:50:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Email] [varchar](100) NULL,
	[Telefono] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 23/4/2024 20:50:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[ID_Agente] [int] NULL,
	[Usuario] [varchar](50) NULL,
	[Password] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ventas]    Script Date: 23/4/2024 20:50:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ventas](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_Agente] [int] NULL,
	[ID_Cliente] [int] NULL,
	[ID_Casa] [int] NULL,
	[Fecha] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD FOREIGN KEY([ID_Agente])
REFERENCES [dbo].[Agentes] ([ID])
GO
ALTER TABLE [dbo].[Ventas]  WITH CHECK ADD FOREIGN KEY([ID_Agente])
REFERENCES [dbo].[Agentes] ([ID])
GO
ALTER TABLE [dbo].[Ventas]  WITH CHECK ADD FOREIGN KEY([ID_Casa])
REFERENCES [dbo].[Casas] ([ID])
GO
ALTER TABLE [dbo].[Ventas]  WITH CHECK ADD FOREIGN KEY([ID_Cliente])
REFERENCES [dbo].[Clientes] ([ID])
GO
/****** Object:  StoredProcedure [dbo].[ConsultarClientes]    Script Date: 23/4/2024 20:50:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ConsultarClientes]
as 
BEGIN
Select * from Clientes;
END

GO
/****** Object:  StoredProcedure [dbo].[ConsultarVentas]    Script Date: 23/4/2024 20:50:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[ConsultarVentas]
as 
BEGIN
SELECT 
B.Nombre as 'Nombre Agente',D.Nombre as 'Nombre Cliente', C.Ciudad , C.Direccion, C.Precio
  FROM [examenfinal].[dbo].[Ventas] A inner join Agentes B on A.ID_Agente = B.ID INNER JOIN Casas C on A.ID_Casa =  C.ID 
  inner join Clientes D on a.ID_Cliente = D.ID
 
END

GO
/****** Object:  StoredProcedure [dbo].[CrearClientes]    Script Date: 23/4/2024 20:50:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CrearClientes]
@Nombre NVARCHAR(50),
@Email  NVARCHAR(100) = NULL,
@Telefono NVARCHAR(20) = NULL
as 
BEGIN
INSERT INTO Clientes (Nombre, Email, Telefono) VALUES
(@Nombre, @Email, @Telefono)
END


GO
/****** Object:  StoredProcedure [dbo].[EliminarClientes]    Script Date: 23/4/2024 20:50:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[EliminarClientes]
@ID INT
as 
BEGIN
DELETE from Clientes Where ID = @ID
END

GO
/****** Object:  StoredProcedure [dbo].[GestionarAgentes]    Script Date: 23/4/2024 20:50:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[GestionarAgentes]
    @accion NVARCHAR(10),
    @agente_id INT = NULL,
    @agente_nombre NVARCHAR(50) = NULL,
    @agente_email NVARCHAR(100) = NULL,
    @agente_telefono NVARCHAR(20) = NULL
AS
BEGIN
    IF @accion = 'agregar'
    BEGIN
        INSERT INTO Agentes (Nombre, Email, Telefono) VALUES (@agente_nombre, @agente_email, @agente_telefono);
    END
    ELSE IF @accion = 'borrar'
    BEGIN
	DELETE FROM Usuarios Where ID_Agente = @agente_id;
	DELETE FROM Ventas WHERE ID_Agente = @agente_id;
	DELETE FROM Agentes WHERE ID = @agente_id;
    END
    ELSE IF @accion = 'modificar'
    BEGIN
        UPDATE Agentes SET 
            Nombre = @agente_nombre,
            Email = @agente_email,
            Telefono = @agente_telefono
        WHERE ID = @agente_id;
    END
    ELSE IF @accion = 'consultar'
    BEGIN
        SELECT * FROM Agentes;
    END
    ELSE
    BEGIN
        SELECT 'Acción no válida';
    END
END;

GO
/****** Object:  StoredProcedure [dbo].[LoginAgentes]    Script Date: 23/4/2024 20:50:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[LoginAgentes]
    @usuario NVARCHAR(50),
    @password NVARCHAR(50)
AS 
BEGIN 
    DECLARE @Count INT;

    SELECT @Count = COUNT(*)
    FROM Usuarios 
    WHERE Usuario = @usuario 
      AND Password = @password; 
    IF @Count > 0
    BEGIN
   
        SELECT 1 AS Result;
    END
    ELSE
    BEGIN
        SELECT 0;
    END
END


GO
/****** Object:  StoredProcedure [dbo].[ModificarClientes]    Script Date: 23/4/2024 20:50:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ModificarClientes]
@Nombre NVARCHAR(50),
@Email  NVARCHAR(100) = NULL,
@Telefono NVARCHAR(20) = NULL,
@ID INT
as 
BEGIN
  UPDATE Clientes SET 
  Nombre = @Nombre,
  Email = @Email,
  Telefono = @Telefono
  Where ID = @ID
END


GO
USE [master]
GO
ALTER DATABASE [examenfinal] SET  READ_WRITE 
GO
