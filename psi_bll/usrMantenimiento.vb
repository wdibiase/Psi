Public Class usrMantenimiento
    Inherits Usuario

    Public Function UsuarioNuevo(usuario As psi_el.Usuario) As Integer
        Dim u As New psi_dal.Usuario
        Return u.Nuevo(usuario)
    End Function

End Class
