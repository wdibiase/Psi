Public Class multiIdioma
    Public Function getControles(pagina As String, Idioma As String) As List(Of psi_el.Control)
        Dim i As New psi_dal.multidioma
        Return i.getControles(pagina, Idioma)
    End Function
End Class
