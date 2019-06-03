create procedure SP_CorreoCliente
	@usuario varchar(20),
	@password varchar(30)
as
begin
	DECLARE @idCliente int
	select a.correo from Cliente a where a.usuario = @usuario and @password = a.contrasena
	
end
