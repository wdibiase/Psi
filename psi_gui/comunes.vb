Module comunes
    Public UsuarioLogueado As psi_el.Usuario

    Public Sub LoggedUser(Optional usuario As String = "")
        Dim unUsuario As New psi_bll.Usuario
        UsuarioLogueado = unUsuario.Listar(usuario)
    End Sub

    Public Sub Traducir(pagina As Page)
        Dim i As New multiIdioma
        If Not IsNothing(UsuarioLogueado) Then
            i.TraducirMaster(UsuarioLogueado.idioma, pagina.Master)
            i.TraducirPagina(UsuarioLogueado.idioma, pagina.Page)
            i = Nothing
        End If
    End Sub
End Module
