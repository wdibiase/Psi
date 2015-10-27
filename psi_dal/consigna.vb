Public Class consigna
    Public Function Leer(idHC As Long, test As Integer, subtest As Integer) As List(Of psi_el.consigna)
        Dim consignas As New List(Of psi_el.consigna)
        Dim a As New Acceso
        Dim params(2) As SqlClient.SqlParameter
        params(0) = a.BuildParam("@idtest", test)
        params(1) = a.BuildParam("@idsubtest", subtest)
        params(2) = a.BuildParam("@idHito", idHC)
        Dim dt As DataTable = a.Leer("dbo.usp_consignasSelect", params)
        Dim item As psi_el.consigna
        For Each fila As DataRow In dt.Rows
            item = New psi_el.consigna
            item.pregunta.idTest = fila("idTest").ToString
            item.pregunta.idSubtest = fila("idSubtest").ToString
            item.pregunta.idPregunta = fila("idPregunta").ToString
            item.pregunta.descPregunta = fila("descPregunta").ToString
            item.pregunta.puntaje = fila("puntaje").ToString
            item.idHito = fila("idHito").ToString
            item.respuestaDada = fila("respuestaDada").ToString
            If IsNumeric(fila("puntajeObtenido").ToString) Then item.puntajeObtenido = fila("puntajeObtenido").ToString
            consignas.Add(item)
        Next
        Return consignas
    End Function

    Public Sub CrearBorrador(idHistorial As Long, test As Integer, subtest As Integer)
        Dim a As New Acceso
        Dim params(2) As SqlClient.SqlParameter
        params(0) = a.BuildParam("@idHito", idHistorial)
        params(1) = a.BuildParam("@idtest", test)
        params(2) = a.BuildParam("@idsubtest", subtest)
        a.Grabar("dbo.usp_consignasInsert", params)
    End Sub

    Public Function Grabar(registro As psi_el.consigna) As Boolean
        Dim acc As New Acceso
        Dim params(5) As SqlClient.SqlParameter
        params(0) = acc.BuildParam("@idHito", registro.idHito)
        params(1) = acc.BuildParam("@idTest", registro.pregunta.idTest)
        params(2) = acc.BuildParam("@idSubTest", registro.pregunta.idSubtest)
        params(3) = acc.BuildParam("@idPregunta", registro.pregunta.idPregunta)
        params(4) = acc.BuildParam("@respuestaDada", registro.respuestaDada)
        params(5) = acc.BuildParam("@puntajeObtenido", registro.puntajeObtenido)
        Return acc.Grabar("usp_consignasUpdate", params)
    End Function
End Class
