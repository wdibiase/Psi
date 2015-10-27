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

    Public Sub Traducir(pagina As MasterPage, Optional idioma As String = "")
        Dim i As New multiIdioma
        If Not IsNothing(UsuarioLogueado) Then
            If idioma = "" Then idioma = UsuarioLogueado.idioma
            i.TraducirPagina(idioma, pagina.Page)
            i = Nothing
        End If
    End Sub

    Public Sub ModificarPerfil(apellido As String, email As String, idioma As String, nombre As String, usuario As String)
        Dim usu As New psi_el.seguridad
        Dim dato As New psi_bll.Usuario
        Dim perfiles As List(Of psi_el.perfil)
        Dim codigoPerfil As String = String.Empty
        usu.numDoc = UsuarioLogueado.numDoc
        usu.tipoDoc = UsuarioLogueado.tipoDoc
        usu.cliente = UsuarioLogueado.cliente
        usu.estado = UsuarioLogueado.estado

        perfiles = dato.listarPerfiles
        For Each p As psi_el.perfil In perfiles
            If p.desc = UsuarioLogueado.perfil Then
                codigoPerfil = p.id
            End If
        Next
        perfiles = Nothing
        usu.perfil = codigoPerfil

        usu.apellido = apellido
        usu.email = email
        usu.idioma = idioma
        usu.nombre = nombre
        usu.nombreUsuario = usuario
        dato.Guardar(usu)
        dato = Nothing
        usu = Nothing

        UsuarioLogueado.idioma = idioma
    End Sub
End Module
