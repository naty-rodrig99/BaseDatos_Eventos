USE [ESeventos]
GO

create procedure SP_Reservacion_Final @idReservacion int, @idRecurso int, @idCliente int
as
	Begin
		BEGIN TRY
			Begin transaction
			insert into ReservacionXRecurso(idReservacion,idRecurso)
			values(@idReservacion,@idRecurso)
			insert into ClienteXReservacion(idCliente,idReservacion)
			values(@idCliente,@idReservacion)
			commit
		END TRY
		BEGIN CATCH
			declare @errorMsg varchar(100) = (select ERROR_MESSAGE())
			print('ERROR:'+@errorMsg)
		END CATCH
	END
