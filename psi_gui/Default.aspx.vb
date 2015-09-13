Partial Public Class [default]
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim i As New multiIdioma
        i.TraducirMaster("es-AR", Me.Master)
        i.TraducirPagina("es-AR", Me.Page)
    End Sub

End Class