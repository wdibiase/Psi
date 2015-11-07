Imports System.Globalization

Partial Public Class [default]
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim i As New multiIdioma
        Dim ci As CultureInfo = System.Threading.Thread.CurrentThread.CurrentUICulture
        'Debug.Print(ci.Name)
        i.TraducirMaster(ci.Name, Me.Master)
        i.TraducirPagina(ci.Name, Me.Page)
    End Sub

End Class