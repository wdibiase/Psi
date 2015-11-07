
Public Class consigna
    Public Function Leer(idHC As Long, test As Integer, subtest As Integer) As List(Of psi_el.consigna)
        Dim consigna As New psi_dal.consigna
        Return consigna.Leer(idHC, test, subtest)
    End Function

    Public Sub CrearTestBorrador(id As Long, test As Integer, subtest As Integer)
        Dim dato As New psi_dal.consigna
        dato.CrearBorrador(id, test, subtest)
    End Sub

    Public Function Grabar(registro As psi_el.consigna) As Boolean
        Dim dato As New psi_dal.consigna
        Return dato.Grabar(registro)
    End Function
End Class

