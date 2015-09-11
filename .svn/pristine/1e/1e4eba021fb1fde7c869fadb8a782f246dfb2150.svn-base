Public Class noticias
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Me.IsPostBack Then
            Enlazar()
        End If
    End Sub

    Private Sub Enlazar()
        Dim usuarios As List(Of psi_el.Usuario)
        Dim u As New psi_bll.Usuario
        usuarios = u.Listar()
        ListBox1.DataSource = usuarios
        ListBox1.DataTextField = "nombreUsuario"
        ListBox1.DataBind()
    End Sub
End Class