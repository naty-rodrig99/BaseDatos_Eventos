USE [ESeventos]
GO


CREATE TABLE [dbo].[Administrador](
	[idAdministrador] [int] IDENTITY(1,1) NOT NULL,
	[usuario] [varchar](20) NULL,
	[correo] [varchar](40) NULL,
	[cedula] [varchar](20) NULL,
	[contrasena] [varchar](30) NULL,
 CONSTRAINT [PK_Administrador] PRIMARY KEY CLUSTERED 
(
	[idAdministrador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[Cliente](
	[idCliente] [int] IDENTITY(1,1) NOT NULL,
	[usuario] [varchar](20) NULL,
	[correo] [varchar](40) NULL,
	[cedula] [varchar](20) NULL,
	[contrasena] [varchar](30) NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[idCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[Paquete](
	[idPaquete] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](30) NULL,
	[precio] [varchar](50) NULL,
	[lugar] [varchar](50) NULL,
 CONSTRAINT [PK_Paquete] PRIMARY KEY CLUSTERED 
(
	[idPaquete] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[Producto](
	[idProducto] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](30) NULL,
	[precio] [money] NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[idProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[Recurso](
	[idRecurso] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](30) NULL,
	[correo] [varchar](50) NULL,
	[telefono] [varchar](30) NULL,
	[provincia] [varchar](30) NULL,
	[tipoRecurso] [varchar](20) NULL,
 CONSTRAINT [PK_Recurso] PRIMARY KEY CLUSTERED 
(
	[idRecurso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO



CREATE TABLE [dbo].[Reservacion](
	[idReservacion] [int] IDENTITY(1,1) NOT NULL,
	[numReservacion] [varchar](10) NULL,
	[fecha] [date] NULL,
	[hora] [time](4) NULL,
	[descripcion] [varchar](40) NULL,
 CONSTRAINT [PK_Reservacion] PRIMARY KEY CLUSTERED 
(
	[idReservacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO



CREATE TABLE [dbo].[ClienteXReservacion](
	[idClienteXReservacion] [int] IDENTITY(1,1) NOT NULL,
	[idCliente] [int] NULL,
	[idReservacion] [int] NULL,
 CONSTRAINT [PK_ClienteXReservacion] PRIMARY KEY CLUSTERED 
(
	[idClienteXReservacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[ClienteXReservacion]  WITH CHECK ADD  CONSTRAINT [FK_ClienteXReservacion_Cliente] FOREIGN KEY([idCliente])
REFERENCES [dbo].[Cliente] ([idCliente])
GO

ALTER TABLE [dbo].[ClienteXReservacion] CHECK CONSTRAINT [FK_ClienteXReservacion_Cliente]
GO

ALTER TABLE [dbo].[ClienteXReservacion]  WITH CHECK ADD  CONSTRAINT [FK_ClienteXReservacion_Reservacion] FOREIGN KEY([idReservacion])
REFERENCES [dbo].[Reservacion] ([idReservacion])
GO

ALTER TABLE [dbo].[ClienteXReservacion] CHECK CONSTRAINT [FK_ClienteXReservacion_Reservacion]
GO



CREATE TABLE [dbo].[PaqueteXCliente](
	[idPaqueteXCliente] [int] IDENTITY(1,1) NOT NULL,
	[idPaquete] [int] NULL,
	[idCliente] [int] NULL,
 CONSTRAINT [PK_PaqueteXCliente] PRIMARY KEY CLUSTERED 
(
	[idPaqueteXCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[PaqueteXCliente]  WITH CHECK ADD  CONSTRAINT [FK_PaqueteXCliente_Cliente] FOREIGN KEY([idCliente])
REFERENCES [dbo].[Cliente] ([idCliente])
GO

ALTER TABLE [dbo].[PaqueteXCliente] CHECK CONSTRAINT [FK_PaqueteXCliente_Cliente]
GO

ALTER TABLE [dbo].[PaqueteXCliente]  WITH CHECK ADD  CONSTRAINT [FK_PaqueteXCliente_Paquete] FOREIGN KEY([idPaquete])
REFERENCES [dbo].[Paquete] ([idPaquete])
GO

ALTER TABLE [dbo].[PaqueteXCliente] CHECK CONSTRAINT [FK_PaqueteXCliente_Paquete]
GO



CREATE TABLE [dbo].[PaqueteXProducto](
	[idPaqueteXProducto] [int] IDENTITY(1,1) NOT NULL,
	[idPaquete] [int] NULL,
	[idProducto] [int] NULL,
 CONSTRAINT [PK_PaqueteXProducto] PRIMARY KEY CLUSTERED 
(
	[idPaqueteXProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[PaqueteXProducto]  WITH CHECK ADD  CONSTRAINT [FK_PaqueteXProducto_Paquete] FOREIGN KEY([idPaquete])
REFERENCES [dbo].[Paquete] ([idPaquete])
GO

ALTER TABLE [dbo].[PaqueteXProducto] CHECK CONSTRAINT [FK_PaqueteXProducto_Paquete]
GO

ALTER TABLE [dbo].[PaqueteXProducto]  WITH CHECK ADD  CONSTRAINT [FK_PaqueteXProducto_Producto] FOREIGN KEY([idProducto])
REFERENCES [dbo].[Producto] ([idProducto])
GO

ALTER TABLE [dbo].[PaqueteXProducto] CHECK CONSTRAINT [FK_PaqueteXProducto_Producto]
GO


CREATE TABLE [dbo].[RecursoXPaquete](
	[idRecursoXPaquete] [int] IDENTITY(1,1) NOT NULL,
	[idRecurso] [int] NULL,
	[idPaquete] [int] NULL,
 CONSTRAINT [PK_RecursoXPaquete] PRIMARY KEY CLUSTERED 
(
	[idRecursoXPaquete] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[RecursoXPaquete]  WITH CHECK ADD  CONSTRAINT [FK_RecursoXPaquete_Paquete] FOREIGN KEY([idPaquete])
REFERENCES [dbo].[Paquete] ([idPaquete])
GO

ALTER TABLE [dbo].[RecursoXPaquete] CHECK CONSTRAINT [FK_RecursoXPaquete_Paquete]
GO

ALTER TABLE [dbo].[RecursoXPaquete]  WITH CHECK ADD  CONSTRAINT [FK_RecursoXPaquete_Recurso] FOREIGN KEY([idRecurso])
REFERENCES [dbo].[Recurso] ([idRecurso])
GO

ALTER TABLE [dbo].[RecursoXPaquete] CHECK CONSTRAINT [FK_RecursoXPaquete_Recurso]
GO


CREATE TABLE [dbo].[ReservacionXRecurso](
	[idReservacionXRecurso] [int] IDENTITY(1,1) NOT NULL,
	[idReservacion] [int] NULL,
	[idRecurso] [int] NULL,
 CONSTRAINT [PK_ReservacionXRecurso] PRIMARY KEY CLUSTERED 
(
	[idReservacionXRecurso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[ReservacionXRecurso]  WITH CHECK ADD  CONSTRAINT [FK_ReservacionXRecurso_Recurso] FOREIGN KEY([idRecurso])
REFERENCES [dbo].[Recurso] ([idRecurso])
GO

ALTER TABLE [dbo].[ReservacionXRecurso] CHECK CONSTRAINT [FK_ReservacionXRecurso_Recurso]
GO

ALTER TABLE [dbo].[ReservacionXRecurso]  WITH CHECK ADD  CONSTRAINT [FK_ReservacionXRecurso_Reservacion] FOREIGN KEY([idReservacion])
REFERENCES [dbo].[Reservacion] ([idReservacion])
GO

ALTER TABLE [dbo].[ReservacionXRecurso] CHECK CONSTRAINT [FK_ReservacionXRecurso_Reservacion]
GO


CREATE TABLE [dbo].[ReservacionXClienteXPaquete](
	[idReservacionXClienteXPaquete] [int] IDENTITY(1,1) NOT NULL,
	[idReservacionXCliente] [int] NULL,
	[idPaquete] [int] NULL,
 CONSTRAINT [PK_ReservacionXClienteXPaquete] PRIMARY KEY CLUSTERED 
(
	[idReservacionXClienteXPaquete] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[ReservacionXClienteXPaquete]  WITH CHECK ADD  CONSTRAINT [FK_ReservacionXClienteXPaquete_ClienteXReservacion] FOREIGN KEY([idReservacionXCliente])
REFERENCES [dbo].[ClienteXReservacion] ([idClienteXReservacion])
GO

ALTER TABLE [dbo].[ReservacionXClienteXPaquete] CHECK CONSTRAINT [FK_ReservacionXClienteXPaquete_ClienteXReservacion]
GO

ALTER TABLE [dbo].[ReservacionXClienteXPaquete]  WITH CHECK ADD  CONSTRAINT [FK_ReservacionXClienteXPaquete_Paquete] FOREIGN KEY([idReservacionXClienteXPaquete])
REFERENCES [dbo].[Paquete] ([idPaquete])
GO

ALTER TABLE [dbo].[ReservacionXClienteXPaquete] CHECK CONSTRAINT [FK_ReservacionXClienteXPaquete_Paquete]
GO


