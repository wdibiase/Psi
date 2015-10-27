Public Class test
    Public Function Listar() As List(Of psi_el.test)
        Dim tests As New List(Of psi_el.test)
        Dim bd As New Acceso
        Dim t As psi_el.test
        Dim dt As DataTable = bd.Leer("dbo.usp_testsSelect")
        For Each fila As DataRow In dt.Rows
            t = New psi_el.test
            t.codigo = fila("idTest")
            t.nombre = fila("descripcion")
            t.version = fila("version")
            tests.Add(t)
        Next
        Return tests
    End Function
End Class
