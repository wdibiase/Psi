Public Class test
    Public Function Listar() As List(Of psi_el.test)
        Dim ts As New psi_dal.test
        Return ts.Listar
    End Function
End Class
