-- Tabla de Usuarios
CREATE TABLE Usuarios (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(255),
    Contraseña VARCHAR(255),
    Mail VARCHAR(255)
	
);

-- Tabla de Perfil
CREATE TABLE Perfil (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    UsuarioID INT,
    Imagen1 VARBINARY(MAX),
    Imagen2 VARBINARY(MAX),
    Imagen3 VARBINARY(MAX),
    Imagen4 VARBINARY(MAX),
    Imagen5 VARBINARY(MAX),
    Imagen6 VARBINARY(MAX),
    Imagen7 VARBINARY(MAX),
    Imagen8 VARBINARY(MAX),
    Imagen9 VARBINARY(MAX),
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(ID)
);

-- Tabla de Posts-Feed
CREATE TABLE PostsFeed (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    UsuarioID INT,
    Imagen VARBINARY(MAX),
    Descripcion TEXT,
    ContadorLikes INT,
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(ID)
);

-- Tabla de Comentarios-Feed
CREATE TABLE ComentariosFeed (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    PostFeedID INT,
    Comentario VARCHAR(255),
    FOREIGN KEY (PostFeedID) REFERENCES PostsFeed(ID)
);

-- Tabla de Posts-Historia
CREATE TABLE PostsHistoria (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    UsuarioID INT,
    Gif VARBINARY(MAX),
    ContadorLikes INT,
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(ID)
);

-- Tabla de Comentarios-Historia
CREATE TABLE ComentariosHistoria (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    PostHistoriaID INT,
    Comentario VARCHAR(255),
    FOREIGN KEY (PostHistoriaID) REFERENCES PostsHistoria(ID)
);

-- Tabla de Posts-Reel
CREATE TABLE PostsReel (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    UsuarioID INT,
    Imagen VARBINARY(MAX),
    ContadorLikes INT,
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(ID)
);

-- Tabla de Comentarios-Reel
CREATE TABLE ComentariosReel (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    PostReelID INT,
    Comentario VARCHAR(255),
    FOREIGN KEY (PostReelID) REFERENCES PostsReel(ID)
);

-- Tabla de Posts-Eventos
CREATE TABLE PostsEventos (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    UsuarioID INT,
    Imagen VARBINARY(MAX),
    Descripcion TEXT,
    ContadorLikes INT,
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(ID)
);

-- Tabla de Eventos
CREATE TABLE Eventos (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    DescripcionEvento TEXT
);

-- Relación entre Eventos y Posts-Eventos
ALTER TABLE PostsEventos
ADD EventoID INT,
FOREIGN KEY (EventoID) REFERENCES Eventos(ID);
