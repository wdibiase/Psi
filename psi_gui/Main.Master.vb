Public Class Main
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If UsuarioLogueado Is Nothing Then
            lnkLogged.Text = "Iniciar Sesión"
        Else
            lnkLogged.Text = UsuarioLogueado.nombreUsuario
        End If
    End Sub

    Protected Sub lnkLogged_Click(sender As Object, e As EventArgs)
        If UsuarioLogueado Is Nothing Then
            Response.Redirect("login.aspx")
        Else
            Response.Redirect("home.aspx")
        End If
    End Sub
End Class