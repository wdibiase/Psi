Public Class historial
    Public Function Nuevo(historia As psi_el.Historial, idUsuario As Integer) As Long
        Dim acc As New Acceso
        Dim params(6) As SqlClient.SqlParameter
        params(0) = acc.BuildParam("@fecha", historia.fecha)
        params(1) = acc.BuildParam("@paciente", historia.paciente)
        params(2) = acc.BuildParam("@tipoNota", historia.tipoNota)
        params(3) = acc.BuildParam("@observaciones", historia.observaciones)
        params(4) = acc.BuildParam("@aprobado", historia.aprobado)
        params(5) = acc.BuildParam("@idTest", historia.test.codigo)
        params(6) = acc.BuildParam("@userId", idUsuario)
        Return acc.GrabarConId("usp_historiasClinicasInsert", params)
    End Function

    Public Function Actualizar(historia As psi_el.Historial, idUsuario As Integer) As Integer
        Dim acc As New Acceso
        Dim params(4) As SqlClient.SqlParameter
        params(0) = acc.BuildParam("@id", historia.idHito)
        params(1) = acc.BuildParam("@fecha", historia.fecha)
        params(2) = acc.BuildParam("@observaciones", historia.observaciones)
        params(3) = acc.BuildParam("@aprobado", historia.aprobado)
        params(4) = acc.BuildParam("@userId", idUsuario)
        Return acc.Grabar("usp_historiasClinicasUpdate", params)
    End Function

    Public Function Listar(paciente As Integer) As List(Of psi_el.Historial)
        Dim hitos As New List(Of psi_el.Historial)
        Dim a As New Acceso
        Dim params(0) As SqlClient.SqlParameter
        params(0) = a.BuildParam("@paciente", paciente)
        Dim dt As DataTable = a.Leer("dbo.usp_historiasClinicasSelect", params)
        Dim item As psi_el.Historial
        For Each fila As DataRow In dt.Rows
            item = New psi_el.Historial
            item.idHito = fila("idHito").ToString
            item.fecha = fila("fecha").ToString
            item.paciente = fila("paciente").ToString
            item.tipoNota = fila("tipoNota").ToString
            item.observaciones = fila("observaciones").ToString
            item.aprobado = fila("aprobado").ToString
            hitos.Add(item)
        Next
        Return hitos
    End Function

    Public Function TestSinCompletar(paciente As Integer) As Long
        Dim bd As New Acceso
        Return bd.Ejecutar("select idHito from historiasClinicas where paciente=" + paciente.ToString + " and aprobado=0 and idtest != 0")
    End Function
End Class
