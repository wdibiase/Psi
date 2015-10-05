Module comunes
    Public UsuarioLogueado As psi_el.Usuario

    Public Sub LoggedUser(Optional usuario As String = "")
        Dim unUsuario As New psi_bll.Usuario
        UsuarioLogueado = unUsuario.Listar(usuario)
    End Sub

    Public Sub Traducir(pagina As Page, Optional idioma As String = "")
        Dim i As New multiIdioma
        If Not IsNothing(UsuarioLogueado) Then
            If idioma = "" Then idioma = UsuarioLogueado.idioma
            i.TraducirMaster(idioma, pagina.Master)
            i.TraducirPagina(idioma, pagina.Page)
            i = Nothing
        End If
    End Sub
End Module
