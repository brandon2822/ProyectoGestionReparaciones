USE [master]
GO
/****** Object:  Database [Proyecto2]    Script Date: 3/16/2025 11:19:51 PM ******/
CREATE DATABASE [Proyecto2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Proyecto2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Proyecto2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Proyecto2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Proyecto2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Proyecto2] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Proyecto2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Proyecto2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Proyecto2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Proyecto2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Proyecto2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Proyecto2] SET ARITHABORT OFF 
GO
ALTER DATABASE [Proyecto2] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Proyecto2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Proyecto2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Proyecto2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Proyecto2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Proyecto2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Proyecto2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Proyecto2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Proyecto2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Proyecto2] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Proyecto2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Proyecto2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Proyecto2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Proyecto2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Proyecto2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Proyecto2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Proyecto2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Proyecto2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Proyecto2] SET  MULTI_USER 
GO
ALTER DATABASE [Proyecto2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Proyecto2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Proyecto2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Proyecto2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Proyecto2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Proyecto2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Proyecto2] SET QUERY_STORE = ON
GO
ALTER DATABASE [Proyecto2] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Proyecto2]
GO
/****** Object:  Table [dbo].[Asignaciones]    Script Date: 3/16/2025 11:19:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Asignaciones](
	[AsignacionID] [int] IDENTITY(1,1) NOT NULL,
	[ReparacionID] [int] NULL,
	[TecnicoID] [int] NULL,
	[FechaAsignacion] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[AsignacionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleReparacion]    Script Date: 3/16/2025 11:19:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleReparacion](
	[DetalleID] [int] IDENTITY(1,1) NOT NULL,
	[ReparacionID] [int] NULL,
	[Descripcion] [varchar](100) NOT NULL,
	[FechaInicio] [varchar](50) NOT NULL,
	[FechaFin] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DetalleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Equipos]    Script Date: 3/16/2025 11:19:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipos](
	[EquipoID] [int] IDENTITY(1,1) NOT NULL,
	[TipoEquipo] [varchar](50) NULL,
	[Modelo] [varchar](50) NOT NULL,
	[UsuarioID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[EquipoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Logins]    Script Date: 3/16/2025 11:19:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Logins](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[usuario] [varchar](50) NULL,
	[contrasena] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reparaciones]    Script Date: 3/16/2025 11:19:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reparaciones](
	[ReparacionID] [int] IDENTITY(1,1) NOT NULL,
	[EquipoID] [int] NULL,
	[FechaSolicitud] [varchar](50) NOT NULL,
	[Estado] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ReparacionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tecnicos]    Script Date: 3/16/2025 11:19:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tecnicos](
	[TecnicoID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Especialidad] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TecnicoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 3/16/2025 11:19:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[UsuarioID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[CorreoElectronico] [varchar](100) NOT NULL,
	[Telefono] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UsuarioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Asignaciones] ON 

INSERT [dbo].[Asignaciones] ([AsignacionID], [ReparacionID], [TecnicoID], [FechaAsignacion]) VALUES (1, 1, 1, N'Marzo 13,2025')
INSERT [dbo].[Asignaciones] ([AsignacionID], [ReparacionID], [TecnicoID], [FechaAsignacion]) VALUES (3, 2, 2, N'Marzo 13, 2025')
INSERT [dbo].[Asignaciones] ([AsignacionID], [ReparacionID], [TecnicoID], [FechaAsignacion]) VALUES (4, 3, 4, N'Marzo 13, 2025')
INSERT [dbo].[Asignaciones] ([AsignacionID], [ReparacionID], [TecnicoID], [FechaAsignacion]) VALUES (5, 4, 4, N'Marzo 13, 2025')
INSERT [dbo].[Asignaciones] ([AsignacionID], [ReparacionID], [TecnicoID], [FechaAsignacion]) VALUES (7, 6, 1, N'Marzo 13, 2025')
INSERT [dbo].[Asignaciones] ([AsignacionID], [ReparacionID], [TecnicoID], [FechaAsignacion]) VALUES (8, 5, 2, N'Marzo 13, 2025')
SET IDENTITY_INSERT [dbo].[Asignaciones] OFF
GO
SET IDENTITY_INSERT [dbo].[DetalleReparacion] ON 

INSERT [dbo].[DetalleReparacion] ([DetalleID], [ReparacionID], [Descripcion], [FechaInicio], [FechaFin]) VALUES (1, 1, N'Teclado Dañado', N'13 Marzo,2025', N'18 de Marzo, 2025')
INSERT [dbo].[DetalleReparacion] ([DetalleID], [ReparacionID], [Descripcion], [FechaInicio], [FechaFin]) VALUES (2, 2, N'Problema con Outlook', N'Marzo 14, 2025', N'Marzo 19, 2025')
INSERT [dbo].[DetalleReparacion] ([DetalleID], [ReparacionID], [Descripcion], [FechaInicio], [FechaFin]) VALUES (3, 3, N'Mal sonido', N'Marzo 11, 2025', N'Marzo 15, 2025')
INSERT [dbo].[DetalleReparacion] ([DetalleID], [ReparacionID], [Descripcion], [FechaInicio], [FechaFin]) VALUES (4, 4, N'Se apaga constantemente', N'Marzo 14 , 2025', N'Marzo 18 , 2025')
INSERT [dbo].[DetalleReparacion] ([DetalleID], [ReparacionID], [Descripcion], [FechaInicio], [FechaFin]) VALUES (5, 5, N'Acceso a Outlook.', N'Marzo 12 , 2025', N'Marzo 15 , 2025')
INSERT [dbo].[DetalleReparacion] ([DetalleID], [ReparacionID], [Descripcion], [FechaInicio], [FechaFin]) VALUES (6, 6, N'Pantalla quebrada', N'Marzo 15 , 2025', N'Marzo 20 , 2025')
SET IDENTITY_INSERT [dbo].[DetalleReparacion] OFF
GO
SET IDENTITY_INSERT [dbo].[Equipos] ON 

INSERT [dbo].[Equipos] ([EquipoID], [TipoEquipo], [Modelo], [UsuarioID]) VALUES (1, N'Computadora', N'Dell Core i7', 1)
INSERT [dbo].[Equipos] ([EquipoID], [TipoEquipo], [Modelo], [UsuarioID]) VALUES (2, N'Computadora', N'Lenovo ThinkPad 3', 2)
INSERT [dbo].[Equipos] ([EquipoID], [TipoEquipo], [Modelo], [UsuarioID]) VALUES (3, N'Headset', N'Logitec', 6)
INSERT [dbo].[Equipos] ([EquipoID], [TipoEquipo], [Modelo], [UsuarioID]) VALUES (4, N'Mouse', N'Logitec Ergonomico', 11)
INSERT [dbo].[Equipos] ([EquipoID], [TipoEquipo], [Modelo], [UsuarioID]) VALUES (5, N'Computadora', N'Dell Core i5', 9)
INSERT [dbo].[Equipos] ([EquipoID], [TipoEquipo], [Modelo], [UsuarioID]) VALUES (6, N'Computadora', N'ASUS Portatil', 8)
SET IDENTITY_INSERT [dbo].[Equipos] OFF
GO
SET IDENTITY_INSERT [dbo].[Logins] ON 

INSERT [dbo].[Logins] ([id], [usuario], [contrasena]) VALUES (1, N'Alexander', N'Progra2')
SET IDENTITY_INSERT [dbo].[Logins] OFF
GO
SET IDENTITY_INSERT [dbo].[Reparaciones] ON 

INSERT [dbo].[Reparaciones] ([ReparacionID], [EquipoID], [FechaSolicitud], [Estado]) VALUES (1, 1, N'Marzo 13, 2025', N'Pendiente')
INSERT [dbo].[Reparaciones] ([ReparacionID], [EquipoID], [FechaSolicitud], [Estado]) VALUES (2, 2, N'Marzo 15, 2025', N'Pendiente')
INSERT [dbo].[Reparaciones] ([ReparacionID], [EquipoID], [FechaSolicitud], [Estado]) VALUES (3, 3, N'Marzo 11, 2025', N'Completado')
INSERT [dbo].[Reparaciones] ([ReparacionID], [EquipoID], [FechaSolicitud], [Estado]) VALUES (4, 4, N'Marzo 14, 2025', N'Pendiente')
INSERT [dbo].[Reparaciones] ([ReparacionID], [EquipoID], [FechaSolicitud], [Estado]) VALUES (5, 6, N'Marzo 12, 2025', N'Completado')
INSERT [dbo].[Reparaciones] ([ReparacionID], [EquipoID], [FechaSolicitud], [Estado]) VALUES (6, 5, N'Marzo 15, 2025', N'Pendiente')
SET IDENTITY_INSERT [dbo].[Reparaciones] OFF
GO
SET IDENTITY_INSERT [dbo].[Tecnicos] ON 

INSERT [dbo].[Tecnicos] ([TecnicoID], [Nombre], [Especialidad]) VALUES (1, N'Ramon Perez', N'Hardware')
INSERT [dbo].[Tecnicos] ([TecnicoID], [Nombre], [Especialidad]) VALUES (2, N'Julio Ramirez', N'Office 365')
INSERT [dbo].[Tecnicos] ([TecnicoID], [Nombre], [Especialidad]) VALUES (3, N'Alexander Benjamin', N'Software')
INSERT [dbo].[Tecnicos] ([TecnicoID], [Nombre], [Especialidad]) VALUES (4, N'Fabio Murillo', N'Perifericos')
SET IDENTITY_INSERT [dbo].[Tecnicos] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([UsuarioID], [Nombre], [CorreoElectronico], [Telefono]) VALUES (1, N'Brandon', N'brandonmbarrantes@gmail.com', N'85277077')
INSERT [dbo].[Usuarios] ([UsuarioID], [Nombre], [CorreoElectronico], [Telefono]) VALUES (2, N'Juan', N'juanmbarrantes@gmail.com', N'89222552')
INSERT [dbo].[Usuarios] ([UsuarioID], [Nombre], [CorreoElectronico], [Telefono]) VALUES (6, N'Alexander', N'Alexander@gmail.com', N'85641516')
INSERT [dbo].[Usuarios] ([UsuarioID], [Nombre], [CorreoElectronico], [Telefono]) VALUES (7, N'Julia', N'Julia@gmail.com', N'68523497')
INSERT [dbo].[Usuarios] ([UsuarioID], [Nombre], [CorreoElectronico], [Telefono]) VALUES (8, N'Paco', N'pacoLM@hotmail.com', N'66142535')
INSERT [dbo].[Usuarios] ([UsuarioID], [Nombre], [CorreoElectronico], [Telefono]) VALUES (9, N'Michael', N'mMike@yahoo.com', N'86314751')
INSERT [dbo].[Usuarios] ([UsuarioID], [Nombre], [CorreoElectronico], [Telefono]) VALUES (10, N'Maria', N'maria@gmail.com', N'65233741')
INSERT [dbo].[Usuarios] ([UsuarioID], [Nombre], [CorreoElectronico], [Telefono]) VALUES (11, N'Rocio', N'rRocio@yopmail.com', N'83164752')
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
ALTER TABLE [dbo].[Asignaciones]  WITH CHECK ADD FOREIGN KEY([ReparacionID])
REFERENCES [dbo].[Reparaciones] ([ReparacionID])
GO
ALTER TABLE [dbo].[Asignaciones]  WITH CHECK ADD FOREIGN KEY([TecnicoID])
REFERENCES [dbo].[Tecnicos] ([TecnicoID])
GO
ALTER TABLE [dbo].[DetalleReparacion]  WITH CHECK ADD FOREIGN KEY([ReparacionID])
REFERENCES [dbo].[Reparaciones] ([ReparacionID])
GO
ALTER TABLE [dbo].[Equipos]  WITH CHECK ADD FOREIGN KEY([UsuarioID])
REFERENCES [dbo].[Usuarios] ([UsuarioID])
GO
ALTER TABLE [dbo].[Reparaciones]  WITH CHECK ADD FOREIGN KEY([EquipoID])
REFERENCES [dbo].[Equipos] ([EquipoID])
GO
/****** Object:  StoredProcedure [dbo].[sp_ActualizarAsignacion]    Script Date: 3/16/2025 11:19:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ActualizarAsignacion]
    @AsignacionID INT,          
    @ReparacionID INT,               
    @TecnicoID  int,        
    @Fecha VARCHAR(50)          
AS
BEGIN
    
    UPDATE Asignaciones
    SET 
        ReparacionID = @ReparacionID,
        TecnicoID = @TecnicoID, 
        FechaAsignacion = @Fecha               
    WHERE 
        AsignacionID = @AsignacionID;    

End
GO
/****** Object:  StoredProcedure [dbo].[sp_ActualizarDetalle]    Script Date: 3/16/2025 11:19:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ActualizarDetalle]
    @DetalleID INT,          
    @ReparacionID INT,               
    @Descripcion  VARCHAR(100),        
    @FechaIN VARCHAR(50),
	@FechaFN Varchar(50)
AS
BEGIN
    
    UPDATE DetalleReparacion
    SET
        ReparacionID = @ReparacionID,
        Descripcion = @Descripcion,
		FechaInicio = @FechaIN,
		FechaFin = @FechaFN
    WHERE 
        DetalleID = @DetalleID;    

End
GO
/****** Object:  StoredProcedure [dbo].[sp_ActualizarReparacion]    Script Date: 3/16/2025 11:19:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ActualizarReparacion]
    @ReparacionID INT,           -- ID de la reparación que se va a actualizar
    @EquipoID INT,               -- Nuevo ID del equipo relacionado
    @FechaSolicitud VARCHAR(100),        -- Nueva fecha de solicitud de la reparación
    @Estado VARCHAR(50)          -- Nuevo estado de la reparación
AS
BEGIN
    -- Comenzar el bloque de actualización
    UPDATE Reparaciones
    SET 
        EquipoID = @EquipoID,            -- Actualiza el ID del equipo
        FechaSolicitud = @FechaSolicitud, -- Actualiza la fecha de solicitud
        Estado = @Estado                 -- Actualiza el estado
    WHERE 
        ReparacionID = @ReparacionID;    -- Filtra por ID de la reparación

    -- Confirmar si se actualizó alguna fila
End
GO
/****** Object:  StoredProcedure [dbo].[sp_AgregarAsignacion]    Script Date: 3/16/2025 11:19:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_AgregarAsignacion]
    @IDrep int,
    @IDTec int,
    @FechaAsig NVARCHAR(100)
AS
BEGIN
    
    INSERT INTO Asignaciones(ReparacionID,TecnicoID,FechaAsignacion)
    VALUES (@IDrep,@IDTec,@FechaAsig);

    
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_AgregarDetalle]    Script Date: 3/16/2025 11:19:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_AgregarDetalle]
    @IDrep int,
    @Descrip NVARCHAR(100),
	@FechaIn NVARCHAR(100),
	@FechaFn NVARCHAR(100)
   
AS
BEGIN
    
    INSERT INTO DetalleReparacion(ReparacionID,Descripcion,FechaInicio,FechaFin)
    VALUES (@IDrep,@Descrip,@FechaIn,@FechaFn);

    
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_AgregarEquipo]    Script Date: 3/16/2025 11:19:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_AgregarEquipo]
    @TipoEquipo NVARCHAR(100),
    @Modelo NVARCHAR(100),
    @ID int
AS
BEGIN
    
    INSERT INTO Equipos(TipoEquipo,Modelo,UsuarioID)
    VALUES (@TipoEquipo, @Modelo, @ID);

    
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_AgregarReparacion]    Script Date: 3/16/2025 11:19:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_AgregarReparacion]
    @IDEquipo int,
    @FechaIn NVARCHAR(100),
    @Estado NVARCHAR(100)
AS
BEGIN
    
    INSERT INTO Reparaciones(EquipoID,FechaSolicitud,Estado)
    VALUES (@IDEquipo, @FechaIn, @Estado);

    
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_AgregarTecnico]    Script Date: 3/16/2025 11:19:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_AgregarTecnico]
    @Nombre NVARCHAR(100),
    @Especialidad NVARCHAR(100)
   
AS
BEGIN
    
    INSERT INTO Tecnicos(Nombre, Especialidad)
    VALUES (@Nombre,@Especialidad);

    
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_AgregarUsuario]    Script Date: 3/16/2025 11:19:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_AgregarUsuario]
    @Nombre NVARCHAR(100),
    @Correo NVARCHAR(100),
    @Telefono NVARCHAR(20)
AS
BEGIN
    -- Insertar los valores en la tabla Usuarios
    INSERT INTO Usuarios (Nombre, CorreoElectronico, Telefono)
    VALUES (@Nombre, @Correo, @Telefono);

    -- Mensaje opcional para confirmar la operación
    PRINT 'Usuario agregado exitosamente';
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_ConsultaEquiposReparaciones]    Script Date: 3/16/2025 11:19:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ConsultaEquiposReparaciones]
AS
BEGIN
    SELECT 
        Usuarios.UsuarioID,
        Usuarios.Nombre AS NombreUsuario,
        Equipos.EquipoID,
        Equipos.Modelo AS ModeloEquipo,
        Reparaciones.ReparacionID,
        Reparaciones.Estado AS EstadoReparacion,
        Asignaciones.AsignacionID,
        Asignaciones.ReparacionID AS AsignacionReparacionID,
        Tecnicos.TecnicoID,
        Tecnicos.Nombre AS NombreTecnico,
        DetalleReparacion.DetalleID,
        DetalleReparacion.Descripcion AS DetalleDescripcion
    FROM 
        Usuarios
    INNER JOIN 
        Equipos ON Usuarios.UsuarioID = Equipos.UsuarioID
    INNER JOIN 
        Reparaciones ON Equipos.EquipoID = Reparaciones.EquipoID
    LEFT JOIN 
        Asignaciones ON Reparaciones.ReparacionID = Asignaciones.ReparacionID
    LEFT JOIN 
        Tecnicos ON Asignaciones.TecnicoID = Tecnicos.TecnicoID
    LEFT JOIN 
        DetalleReparacion ON Reparaciones.ReparacionID = DetalleReparacion.ReparacionID
    ORDER BY 
        Reparaciones.ReparacionID, Asignaciones.AsignacionID, DetalleReparacion.DetalleID;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_EliminarAsignacion]    Script Date: 3/16/2025 11:19:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_EliminarAsignacion]
    @AsignacionID INT
AS
BEGIN
    DELETE FROM Asignaciones
    WHERE AsignacionID = @AsignacionID;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_EliminarDetalle]    Script Date: 3/16/2025 11:19:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_EliminarDetalle]
    @DetalleID INT
AS
BEGIN
    DELETE FROM DetalleReparacion
    WHERE DetalleID = @DetalleID;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_EliminarEquipo]    Script Date: 3/16/2025 11:19:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_EliminarEquipo]
    @EquipoID INT
AS
BEGIN
    DELETE FROM Equipos
    WHERE EquipoID = @EquipoID;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_EliminarReparacion]    Script Date: 3/16/2025 11:19:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_EliminarReparacion]
    @ReparacionID INT
AS
BEGIN
    DELETE FROM Reparaciones
    WHERE ReparacionID = @ReparacionID;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_EliminartTecnico]    Script Date: 3/16/2025 11:19:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_EliminartTecnico]
    @TecnicoID INT
AS
BEGIN
    DELETE FROM Tecnicos
    WHERE TecnicoID = @TecnicoID;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_EliminarUsuario]    Script Date: 3/16/2025 11:19:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_EliminarUsuario]
    @UsuarioID INT
AS
BEGIN
    DELETE FROM Usuarios
    WHERE UsuarioID = @UsuarioID;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_MostrarAsignaciones]    Script Date: 3/16/2025 11:19:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_MostrarAsignaciones]
AS
BEGIN
    SELECT * from Asignaciones;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_MostrarDetalles]    Script Date: 3/16/2025 11:19:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_MostrarDetalles]
AS
BEGIN
    SELECT * from DetalleReparacion;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_MostrarEquipos]    Script Date: 3/16/2025 11:19:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_MostrarEquipos]
AS
BEGIN
    SELECT * from Equipos;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_MostrarReparaciones]    Script Date: 3/16/2025 11:19:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_MostrarReparaciones]
AS
BEGIN
    SELECT * from Reparaciones;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_MostrarTecnicos]    Script Date: 3/16/2025 11:19:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_MostrarTecnicos]
AS
BEGIN
    SELECT * from Tecnicos;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_MostrarUsuarios]    Script Date: 3/16/2025 11:19:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_MostrarUsuarios]
AS
BEGIN
    SELECT * from Usuarios;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ObtenerDetallesReparacion]    Script Date: 3/16/2025 11:19:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ObtenerDetallesReparacion]
AS
BEGIN
    SELECT 
        r.ReparacionID,
        a.FechaAsignacion,
        t.Nombre AS NombreTecnico,
        dr.Descripcion,
        r.Estado
    FROM 
        Reparaciones r
    INNER JOIN 
        Asignaciones a ON r.ReparacionID = a.ReparacionID
    INNER JOIN 
        Tecnicos t ON a.TecnicoID = t.TecnicoID
    INNER JOIN 
        DetalleReparacion dr ON r.ReparacionID = dr.ReparacionID
    ORDER BY 
        r.ReparacionID;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ValidarUsuario]    Script Date: 3/16/2025 11:19:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ValidarUsuario]
    @Usuario VARCHAR(50),
    @Contrasena VARCHAR(100)
AS
BEGIN
    
    
    
       select usuario, contrasena from Logins where usuario = @Usuario and contrasena = @Contrasena;
   
    
END
GO
USE [master]
GO
ALTER DATABASE [Proyecto2] SET  READ_WRITE 
GO
