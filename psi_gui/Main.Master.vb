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
        Dim home As String = Nothing
        If UsuarioLogueado Is Nothing Then
            Response.Redirect("login.aspx")
        Else
            Select Case UsuarioLogueado.perfil
                Case "Coordinador"
                    home = "~\eval\coord\homeCoord.aspx"
                Case "Evaluador"
                    home = "~\eval\homeEval.aspx"
                Case "Administrador"
                    home = "~\admin\homeAdmin.aspx"
            End Select
            Response.Redirect(home)
        End If
    End Sub
End Class