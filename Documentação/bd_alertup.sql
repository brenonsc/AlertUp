CREATE DATABASE db_alertup;
GO
USE db_alertup;
GO

CREATE TABLE [Tema] (
	Id bigint NOT NULL,
	Titulo varchar(100) NOT NULL,
	Descricao varchar(300) NOT NULL,
  CONSTRAINT [PK_TEMA] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Usuario] (
	Id bigint NOT NULL UNIQUE,
	Nome varchar(70) NOT NULL,
	Email varchar(100) NOT NULL UNIQUE,
	Senha varchar(25) NOT NULL,
	Foto varchar(5000) DEFAULT 'https://i.pinimg.com/originals/57/00/c0/5700c04197ee9a4372a35ef16eb78f4e.png',
	Municipio varchar(100) NOT NULL,
  CONSTRAINT [PK_USUARIO] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Postagem] (
	Id bigint NOT NULL,
	Titulo varchar(100) NOT NULL,
	Descricao varchar(1000) NOT NULL,
	Data datetime NOT NULL,
	Relevancia int NOT NULL DEFAULT '0',
	Foto varchar(5000),
	Municipio varchar(100) NOT NULL,
	IdTema bigint NOT NULL,
	IdUsuario bigint NOT NULL,
  CONSTRAINT [PK_POSTAGEM] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO


ALTER TABLE [Postagem] WITH CHECK ADD CONSTRAINT [Postagem_fk0] FOREIGN KEY ([IdTema]) REFERENCES [Tema]([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [Postagem] CHECK CONSTRAINT [Postagem_fk0]
GO
ALTER TABLE [Postagem] WITH CHECK ADD CONSTRAINT [Postagem_fk1] FOREIGN KEY ([IdUsuario]) REFERENCES [Usuario]([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [Postagem] CHECK CONSTRAINT [Postagem_fk1]
GO

