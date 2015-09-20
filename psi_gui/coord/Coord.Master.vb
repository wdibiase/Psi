Public Class CoordMaster
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Cargar el perfil de usuario y mostrar el nombre
        If UsuarioLogueado Is Nothing Then
            Response.Redirect("../login.aspx")
        Else
            If Not UsuarioLogueado.perfil = "Coordinador" Then
                Response.Redirect("../unauthorized.aspx")
            End If
            lnkLogged.Text = UsuarioLogueado.nombreUsuario
        End If
    End Sub

    Protected Sub lnkLogout_Click(sender As Object, e As EventArgs)
        'Response.Cookies("LoggedIn").Expires = DateTime.Now.AddDays(-1)
        UsuarioLogueado = Nothing
        Response.Redirect("../default.aspx")
    End Sub
End Class