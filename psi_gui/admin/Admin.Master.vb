Public Class AdminMaster
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Cargar el perfil de usuario y mostrar el nombre
        If Request.Cookies("LoggedIn") Is Nothing Then
            Response.Redirect("../login.aspx")
        Else
            If Not Session("rol").ToString = "Administrador" Then
                Response.Redirect("../unauthorized.aspx")
            End If
            lnkLogged.Text = Request.Cookies("LoggedIn").Value
        End If
    End Sub

    Protected Sub lnkLogout_Click(sender As Object, e As EventArgs)
        Response.Cookies("LoggedIn").Expires = DateTime.Now.AddDays(-1)
        Response.Redirect("../default.aspx")
    End Sub
End Class