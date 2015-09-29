Public Class paciente
    Public Function Nuevo(paciente As psi_el.Paciente) As Integer
        Dim acc As New Acceso
        Dim params(9) As SqlClient.SqlParameter
        params(0) = acc.BuildParam("@dni", paciente.DNI)
        params(1) = acc.BuildParam("@fechaNacimiento", paciente.fechaNacimiento)
        params(2) = acc.BuildParam("@nombre", paciente.nombre)
        params(3) = acc.BuildParam("@apellido", paciente.apellido)
        params(4) = acc.BuildParam("@sexo", paciente.sexo)
        params(5) = acc.BuildParam("@escuela", paciente.escuela)
        params(6) = acc.BuildParam("@año", paciente.año)
        params(7) = acc.BuildParam("@lateralidad", paciente.lateralidad)
        params(8) = acc.BuildParam("@tipoDoc", paciente.tipoDoc)
        params(9) = acc.BuildParam("@evaluador", paciente.evaluador)
        Return acc.Grabar("usp_pacientesinsert", params)
    End Function

    Public Function Guardar(paciente As psi_el.Paciente) As Integer
        Dim acc As New Acceso
        Dim params(9) As SqlClient.SqlParameter
        params(0) = acc.BuildParam("@dni", paciente.DNI)
        params(1) = acc.BuildParam("@fechaNacimiento", paciente.fechaNacimiento)
        params(2) = acc.BuildParam("@nombre", paciente.nombre)
        params(3) = acc.BuildParam("@apellido", paciente.apellido)
        params(4) = acc.BuildParam("@sexo", paciente.sexo)
        params(5) = acc.BuildParam("@escuela", paciente.escuela)
        params(6) = acc.BuildParam("@año", paciente.año)
        params(7) = acc.BuildParam("@lateralidad", paciente.lateralidad)
        params(8) = acc.BuildParam("@tipoDoc", paciente.tipoDoc)
        params(9) = acc.BuildParam("@evaluador", paciente.evaluador)
        Return acc.Grabar("usp_pacientesUpdate", params)
    End Function

    Public Function Listar() As List(Of psi_el.Paciente)
        Dim pacientes As New List(Of psi_el.Paciente)
        Dim a As New Acceso
        Dim dt As DataTable = a.Leer("dbo.usp_pacientesSelect")
        Dim miPaciente As psi_el.Paciente
        For Each fila As DataRow In dt.Rows
            miPaciente = New psi_el.Paciente
            miPaciente.tipoDoc = fila("descDoc").ToString
            miPaciente.DNI = fila("dni").ToString
            miPaciente.fechaNacimiento = fila("fechaNacimiento").ToString
            miPaciente.nombre = fila("nombre").ToString
            miPaciente.apellido = fila("apellido").ToString
            miPaciente.sexo = fila("sexo").ToString
            miPaciente.escuela = fila("escuela").ToString
            miPaciente.año = fila("año").ToString
            miPaciente.lateralidad = fila("lateralidad").ToString
            If fila("evaluador").ToString <> "" Then
                miPaciente.evaluador = fila("evaluador").ToString
            End If
            pacientes.Add(miPaciente)
        Next
        Return pacientes
    End Function

    Public Function Detallar(dni As Integer) As psi_el.Paciente
        Dim a As New Acceso
        Dim par(0) As SqlClient.SqlParameter

        par(0) = a.BuildParam("@dni", dni)
        Dim dt As DataTable = a.Leer("dbo.usp_pacientesSelect", par)

        Dim miPaciente As New psi_el.Paciente
        miPaciente.tipoDoc = dt.Rows("tipoDoc").ToString
        miPaciente.fechaNacimiento = dt.Rows("fechaNacimiento").ToString
        miPaciente.nombre = dt.Rows("nombre").ToString
        miPaciente.apellido = dt.Rows("apellido").ToString
        miPaciente.sexo = dt.Rows("sexo").ToString
        miPaciente.escuela = dt.Rows("escuela").ToString
        miPaciente.año = dt.Rows("año").ToString
        miPaciente.lateralidad = dt.Rows("lateralidad").ToString
        miPaciente.evaluador = dt.Rows("evaluador").ToString
        Return miPaciente
    End Function

    Public Function ListarDocs() As List(Of psi_el.documento)
        Dim docs As New List(Of psi_el.documento)
        Dim a As New Acceso
        Dim dt As DataTable = a.Leer("dbo.usp_documentosSelect")
        Dim miDoc As psi_el.documento
        For Each fila As DataRow In dt.Rows
            miDoc = New psi_el.documento
            miDoc.tipo = fila("tipoDoc").ToString
            miDoc.desc = fila("descDoc").ToString
            docs.Add(miDoc)
        Next
        Return docs
    End Function

    Public Function ListarSexos() As List(Of psi_el.sexo)
        Dim sxs As New List(Of psi_el.sexo)
        Dim a As New Acceso
        Dim dt As DataTable = a.Leer("dbo.usp_sexosSelect")
        Dim sx As psi_el.sexo
        For Each fila As DataRow In dt.Rows
            sx = New psi_el.sexo
            sx.id = fila("idSexo").ToString
            sx.desc = fila("descSexo").ToString
            sxs.Add(sx)
        Next
        Return sxs
    End Function

    Public Function ListarLateralidades() As List(Of psi_el.lateralidad)
        Dim lats As New List(Of psi_el.lateralidad)
        Dim a As New Acceso
        Dim dt As DataTable = a.Leer("dbo.usp_lateralidadesSelect")
        Dim lat As psi_el.lateralidad
        For Each fila As DataRow In dt.Rows
            lat = New psi_el.lateralidad
            lat.id = fila("idLateralidad").ToString
            lat.desc = fila("descLateralidad").ToString
            lats.Add(lat)
        Next
        Return lats
    End Function

End Class
