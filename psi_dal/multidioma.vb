Public Class multidioma
    Public Function getControles(pagina As String, Idioma As String) As List(Of psi_el.Control)
        Dim Controles As New List(Of psi_el.Control)
        Dim a As New psi_dal.Acceso
        Dim Par(0) As System.Data.SqlClient.SqlParameter
        Par(0) = a.BuildParam("@idioma", Idioma)
        Dim dt As DataTable = a.Leer("usp_controlSelect", Par)
        Dim c As psi_el.Control
        For Each fila As DataRow In dt.Rows
            c = New psi_el.Control
            c.Nombre = fila("control")
            c.Text = fila("texto")
            'If Not String.IsNullOrWhiteSpace(fila("TTT").ToString) Then
            '    c.TTT = fila("TTT")
            'Else
            '    c.TTT = ""
            'End If
            Controles.Add(c)
        Next
        Return Controles
    End Function
End Class
