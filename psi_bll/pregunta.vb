Public Class pregunta
    Public Function Leer(test As Integer, subtest As Integer) As List(Of psi_el.Pregunta)
        Dim p As New psi_dal.pregunta
        Return p.Leer(test, subtest)
    End Function

    Public Function PuntajePorSubtest(valores As String) As List(Of Integer)
        Dim lista As New List(Of Integer)
        Dim puntajes As String() = valores.Split(",")

        For Each puntaje As String In puntajes
            lista.Add(CInt(puntaje))
        Next
        Return lista
    End Function
End Class
