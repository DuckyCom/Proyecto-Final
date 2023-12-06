USE [master]
GO
/****** Object:  Database [DBPetNex]    Script Date: 5/12/2023 21:06:36 ******/
CREATE DATABASE [DBPetNex]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBPetNex', FILENAME = N'E:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS01\MSSQL\DATA\DBPetNex.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DBPetNex_log', FILENAME = N'E:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS01\MSSQL\DATA\DBPetNex_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [DBPetNex] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBPetNex].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBPetNex] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBPetNex] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBPetNex] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBPetNex] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBPetNex] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBPetNex] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DBPetNex] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBPetNex] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBPetNex] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBPetNex] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBPetNex] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBPetNex] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBPetNex] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBPetNex] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBPetNex] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DBPetNex] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBPetNex] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBPetNex] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBPetNex] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBPetNex] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBPetNex] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBPetNex] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBPetNex] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DBPetNex] SET  MULTI_USER 
GO
ALTER DATABASE [DBPetNex] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBPetNex] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBPetNex] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBPetNex] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DBPetNex] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DBPetNex] SET QUERY_STORE = OFF
GO
USE [DBPetNex]
GO
/****** Object:  Table [dbo].[ComentariosFeed]    Script Date: 5/12/2023 21:06:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComentariosFeed](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PostFeedID] [int] NULL,
	[Comentario] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ComentariosHistoria]    Script Date: 5/12/2023 21:06:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComentariosHistoria](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PostHistoriaID] [int] NULL,
	[Comentario] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ComentariosReel]    Script Date: 5/12/2023 21:06:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComentariosReel](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PostReelID] [int] NULL,
	[Comentario] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Eventos]    Script Date: 5/12/2023 21:06:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Eventos](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DescripcionEvento] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Perfil]    Script Date: 5/12/2023 21:06:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Perfil](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UsuarioID] [int] NULL,
	[Imagen1] [varbinary](max) NULL,
	[Imagen2] [varbinary](max) NULL,
	[Imagen3] [varbinary](max) NULL,
	[Imagen4] [varbinary](max) NULL,
	[Imagen5] [varbinary](max) NULL,
	[Imagen6] [varbinary](max) NULL,
	[Imagen7] [varbinary](max) NULL,
	[Imagen8] [varbinary](max) NULL,
	[Imagen9] [varbinary](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PostsEventos]    Script Date: 5/12/2023 21:06:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostsEventos](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UsuarioID] [int] NULL,
	[Imagen] [varbinary](max) NULL,
	[Descripcion] [text] NULL,
	[ContadorLikes] [int] NULL,
	[EventoID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PostsFeed]    Script Date: 5/12/2023 21:06:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostsFeed](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UsuarioID] [int] NULL,
	[Imagen] [varbinary](max) NULL,
	[Descripcion] [text] NULL,
	[ContadorLikes] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PostsHistoria]    Script Date: 5/12/2023 21:06:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostsHistoria](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UsuarioID] [int] NULL,
	[Gif] [varbinary](max) NULL,
	[ContadorLikes] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PostsReel]    Script Date: 5/12/2023 21:06:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostsReel](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UsuarioID] [int] NULL,
	[Imagen] [varbinary](max) NULL,
	[ContadorLikes] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 5/12/2023 21:06:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](255) NULL,
	[Contrasenia] [varchar](255) NULL,
	[Mail] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([ID], [Nombre], [Contrasenia], [Mail]) VALUES (1, N'Santi', N'queseyo', N'queseyo@gmail.com')
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
ALTER TABLE [dbo].[ComentariosFeed]  WITH CHECK ADD FOREIGN KEY([PostFeedID])
REFERENCES [dbo].[PostsFeed] ([ID])
GO
ALTER TABLE [dbo].[ComentariosHistoria]  WITH CHECK ADD FOREIGN KEY([PostHistoriaID])
REFERENCES [dbo].[PostsHistoria] ([ID])
GO
ALTER TABLE [dbo].[ComentariosReel]  WITH CHECK ADD FOREIGN KEY([PostReelID])
REFERENCES [dbo].[PostsReel] ([ID])
GO
ALTER TABLE [dbo].[Perfil]  WITH CHECK ADD FOREIGN KEY([UsuarioID])
REFERENCES [dbo].[Usuarios] ([ID])
GO
ALTER TABLE [dbo].[PostsEventos]  WITH CHECK ADD FOREIGN KEY([EventoID])
REFERENCES [dbo].[Eventos] ([ID])
GO
ALTER TABLE [dbo].[PostsEventos]  WITH CHECK ADD FOREIGN KEY([UsuarioID])
REFERENCES [dbo].[Usuarios] ([ID])
GO
ALTER TABLE [dbo].[PostsFeed]  WITH CHECK ADD FOREIGN KEY([UsuarioID])
REFERENCES [dbo].[Usuarios] ([ID])
GO
ALTER TABLE [dbo].[PostsHistoria]  WITH CHECK ADD FOREIGN KEY([UsuarioID])
REFERENCES [dbo].[Usuarios] ([ID])
GO
ALTER TABLE [dbo].[PostsReel]  WITH CHECK ADD FOREIGN KEY([UsuarioID])
REFERENCES [dbo].[Usuarios] ([ID])
GO
/****** Object:  StoredProcedure [dbo].[Login-Usuario]    Script Date: 5/12/2023 21:06:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Login-Usuario]
	(
		@Nombre nvarchar(500),
		@Contraseña nvarchar(500)
	)
AS
BEGIN
	SET NOCOUNT ON;
	SELECT [ID]
		,[Nombre]
		,[Contrasenia]
	FROM [dbo].[Usuarios]
	WHERE Nombre = @Nombre AND Contrasenia = @Contraseña
END
GO
/****** Object:  StoredProcedure [dbo].[Registrar-Usuario]    Script Date: 5/12/2023 21:06:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Registrar-Usuario]
	(
		@Nombre nvarchar(500),
		@Contraseña nvarchar(500),
		@Correo nvarchar(500)
	)
AS
BEGIN
	SET NOCOUNT ON;
INSERT INTO [dbo].[Usuarios]
           ([Nombre]
           ,[Contrasenia]
           ,[Mail])
     VALUES
           (@Nombre,
		   @Contraseña,
		   @Correo)
END
GO
USE [master]
GO
ALTER DATABASE [DBPetNex] SET  READ_WRITE 
GO
