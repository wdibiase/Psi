Public Class pregunta
    Public Function Leer(test As Integer, subtest As Integer) As List(Of psi_el.Pregunta)
        Dim preguntas As New List(Of psi_el.Pregunta)
        Dim a As New Acceso
        Dim params(1) As SqlClient.SqlParameter
        params(0) = a.BuildParam("@idTest", test)
        params(1) = a.BuildParam("@idSubTest", subtest)
        Dim dt As DataTable = a.Leer("dbo.usp_preguntasSelect", params)
        Dim item As psi_el.Pregunta
        For Each fila As DataRow In dt.Rows
            item = New psi_el.Pregunta
            item.idTest = fila("idTest").ToString
            item.idSubtest = fila("idSubtest").ToString
            item.idPregunta = fila("idPregunta").ToString
            item.descPregunta = fila("descPregunta").ToString
            item.puntaje = fila("puntaje").ToString
            preguntas.Add(item)
        Next
        Return preguntas
    End Function

    Public Function LeerPuntajeSubtest(test As Integer, subtest As Integer) As List(Of psi_el.Pregunta)
        Dim preguntas As New List(Of psi_el.Pregunta)
        Dim a As New Acceso
        Dim params(1) As SqlClient.SqlParameter
        params(0) = a.BuildParam("@idTest", test)
        params(1) = a.BuildParam("@idSubTest", subtest)
        Dim dt As DataTable = a.Leer("dbo.usp_preguntasSelect", params)
        Dim item As psi_el.Pregunta
        For Each fila As DataRow In dt.Rows
            item = New psi_el.Pregunta
            item.idTest = fila("idTest").ToString
            item.idSubtest = fila("idSubtest").ToString
            item.idPregunta = fila("idPregunta").ToString
            item.descPregunta = fila("descPregunta").ToString
            item.puntaje = fila("puntaje").ToString
            preguntas.Add(item)
        Next
        Return preguntas
    End Function


End Class
