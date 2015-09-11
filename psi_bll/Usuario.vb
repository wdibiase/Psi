Public Class Usuario
    Public Function Listar() As List(Of psi_el.Usuario)
        Dim u As New psi_dal.Usuario
        Return u.Listar
    End Function

    Public Function ListarDocs() As List(Of psi_el.documento)
        Dim d As New psi_dal.Usuario
        Return d.ListarDocs
    End Function

    Public Function ListarClientes() As List(Of psi_el.Cliente)
        Dim c As New psi_dal.Usuario
        Return c.ListarClientes
    End Function

    Public Function listarPerfiles() As List(Of psi_el.perfil)
        Dim p As New psi_dal.Usuario
        Return p.ListarPerfiles
    End Function

    Public Function listarIdiomas() As List(Of psi_el.idioma)
        Dim i As New psi_dal.Usuario
        Return i.listarIdiomas
    End Function

    Public Function Validar(nombreUsuario As String, contraseña As String) As Boolean
        Dim user As New psi_dal.Usuario
        Return user.ValidarUsuario(nombreUsuario, contraseña)
    End Function

    Public Function AsignarPerfil(usuario As Integer, perfil As String) As Short
        Dim user As New psi_dal.Usuario
        Return user.AsignarPerfil(usuario, perfil)
    End Function

    Public Function Guardar(usuario As psi_el.seguridad) As Boolean
        Dim user As New psi_dal.Usuario
        Return user.Guardar(usuario)
    End Function

    Public Function Nuevo(usuario As psi_el.seguridad) As Integer
        Dim bd As New psi_dal.Usuario
        Return bd.Nuevo(usuario)
    End Function
End Class
